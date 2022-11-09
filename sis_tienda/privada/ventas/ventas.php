<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

$smarty = new Smarty;

//$db->debug=true;

$sql = $db->Prepare("SELECT v.*, c.nombre AS nombre_cliente, c.apellido AS apellido_cliente, ve.nombre AS nombre_vendedor, ve.apellido AS apellido_vendedor, v.id_venta, c.id_cliente
					FROM ventas v, clientes c, vendedores ve
					WHERE v.id_cliente=c.id_cliente
					AND v.id_vendedor=ve.id_vendedor
					AND v.estado <> '0'
					AND c.estado <> '0'
					ORDER BY v.id_venta DESC
					");
$rs = $db->GetAll($sql);

$smarty->assign("ventas", $rs);
$smarty->assign("direc_css", $direc_css);
$smarty->display("ventas.tpl");
?>