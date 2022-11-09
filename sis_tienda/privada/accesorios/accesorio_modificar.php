<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

$__id_accesorio = $_REQUEST["id_accesorio"];
$__id_marca = $_REQUEST["id_marca"];
$__id_proveedor = $_REQUEST["id_proveedor"];
//$db->debug=true;
$smarty = new Smarty;

$sql = $db->Prepare("SELECT*
					FROM accesorios
					WHERE id_accesorio= ?
					");
$rs = $db->GetAll($sql, array($__id_accesorio));

$sql2 = $db->Prepare("SELECT*
					FROM marcas
					WHERE id_marca= ?
					AND estado <> 'X'
					");
$rs2 = $db->GetAll($sql2, array($__id_marca));

$sql3 = $db->Prepare("SELECT*
					FROM marcas
					WHERE id_marca <> ?
					AND estado <> 'X'
					");
$rs3 = $db->GetAll($sql3, array($__id_marca));

$sql4 = $db->Prepare("SELECT*
					FROM proveedores
					WHERE id_proveedor= ?
					AND estado <> 'X'
					");
$rs4 = $db->GetAll($sql4, array($__id_proveedor));

$sql5 = $db->Prepare("SELECT*
					FROM proveedores
					WHERE id_proveedor <> ?
					AND estado <> 'X'
					");
$rs5 = $db->GetAll($sql5, array($__id_proveedor));

$smarty->assign("accesorio", $rs);
$smarty->assign("marca", $rs2);
$smarty->assign("marcas", $rs3);
$smarty->assign("proveedor", $rs4);
$smarty->assign("proveedores", $rs5);
$smarty->assign("direc_css", $direc_css);
$smarty->display("accesorio_modificar.tpl");
?>