<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");
require_once("../paginacion.inc.php");

$smarty = new Smarty;

//$db->debug=true;

contarRegistros($db, "proveedores");

paginacion("proveedores.php?", $smarty);

$sql3 = $db->Prepare("SELECT*
					FROM proveedores
					WHERE estado <> '0'
					AND id_proveedor > 1
					ORDER BY id_proveedor DESC
					LIMIT ? OFFSET ?
					");
$smarty->assign("proveedores", $db->GetAll($sql3, array($nElem, $regIni)));

$smarty->assign("direc_css", $direc_css);
$smarty->display("proveedores.tpl");
?>