<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");
$__id_marca = $_REQUEST["id_marca"];

$smarty = new Smarty;

$sql = $db->Prepare("SELECT*
					FROM marcas
					WHERE id_marca = ?
					");
$rs = $db->GetAll($sql, array($__id_marca));
$smarty->assign("marca", $rs);

$smarty->assign("direc_css", $direc_css);
$smarty->display("marca_modificar.tpl");
?>