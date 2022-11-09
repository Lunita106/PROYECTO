<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$__id_vendedor = $_POST["id_vendedor"];
$__id_cliente = $_POST["id_cliente"];
$__total_venta = $_POST["total_venta"];
$__fecha_venta = $_POST["fecha_venta"];

//$db->debug=true;

$smarty = new Smarty;

$reg = array();
$reg["id_vendedor"] = $__id_vendedor;
$reg["id_cliente"] = $__id_cliente;
$reg["total_venta"] = $__total_venta;
$reg["fecha_venta"] = $__fecha_venta;
$reg["fec_insercion"] = date("Y-m-d H:i:s");
$reg["estado"] = '1';
$reg["usuario"] = $_SESSION["sesion_id_usuario"];
$rs1 = $db->AutoExecute("ventas", $reg, "INSERT");
if($rs1){
	header("Location: ventas.php");
	exit();
}else{
	$smarty->assign("mensaje", "ERROR: Los datos no se insertaron!!!!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->display("venta_nuevo1.tpl");
}
?>