<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");
require_once("../paginacion.inc.php");

$smarty = new Smarty;

//$db->debug=true;

contarRegistros($db, "marcas");

paginacion("marcas.php?", $smarty);

$sql3 = $db->Prepare("SELECT*
					FROM marcas
					WHERE estado <> '0'
					AND id_marca > 1
					ORDER BY id_marca DESC
					LIMIT ? OFFSET ?
					");
$smarty->assign("marcas", $db->GetAll($sql3, array($nElem, $regIni)));

$smarty->assign("direc_css", $direc_css);
$smarty->display("marcas.tpl");
?>