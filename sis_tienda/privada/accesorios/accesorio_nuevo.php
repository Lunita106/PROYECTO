<?php
session_start();
require_once("../../smarty/libs//Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

$smarty = new Smarty;

$sql1 = $db->Prepare("SELECT*
					FROM marcas
					WHERE estado <> '0'
					ORDER BY id_marca DESC
					");
$rs1 = $db->GetAll($sql1);

$sql2 = $db->Prepare("SELECT*
					FROM proveedores
					WHERE estado <> '0'
					ORDER BY id_proveedor DESC
					");
$rs2 = $db->GetAll($sql2);

$smarty->assign("marcas", $rs1);
$smarty->assign("proveedores", $rs2);

$smarty->assign("direc_css", $direc_css);
$smarty->display("accesorio_nuevo.tpl");
?>