<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

$__id_venta = $_REQUEST["id_venta"];
$__id_vendedor = $_REQUEST["id_vendedor"];
$__id_cliente = $_REQUEST["id_cliente"];
//$db->debug=true;
$smarty = new Smarty;

$sql = $db->Prepare("SELECT*
					FROM ventas
					WHERE id_venta= ?
					");
$rs = $db->GetAll($sql, array($__id_venta));

$sql2 = $db->Prepare("SELECT*
					FROM vendedores
					WHERE id_vendedor= ?
					AND estado <> 'X'
					");
$rs2 = $db->GetAll($sql2, array($__id_vendedor));

$sql3 = $db->Prepare("SELECT*
					FROM vendedores
					WHERE id_vendedor <> ?
					AND estado <> 'X'
					");
$rs3 = $db->GetAll($sql3, array($__id_vendedor));

$sql4 = $db->Prepare("SELECT*
					FROM clientes
					WHERE id_cliente= ?
					AND estado <> 'X'
					");
$rs4 = $db->GetAll($sql4, array($__id_cliente));

$sql5 = $db->Prepare("SELECT*
					FROM clientes
					WHERE id_cliente <> ?
					AND estado <> 'X'
					");
$rs5 = $db->GetAll($sql5, array($__id_cliente));

$smarty->assign("venta", $rs);
$smarty->assign("vendedor", $rs2);
$smarty->assign("vendedores", $rs3);
$smarty->assign("cliente", $rs4);
$smarty->assign("clientes", $rs5);
$smarty->assign("direc_css", $direc_css);
$smarty->display("venta_modificar.tpl");
?>