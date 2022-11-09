<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$__id_vendedor = $_REQUEST["id_vendedor"];
$__id_cliente = $_REQUEST["id_cliente"];
$__id_venta = $_REQUEST["id_venta"];
$__total_venta = $_POST["total_venta"];
$__fecha_venta = $_POST["fecha_venta"];

//$db->debug=true;

$smarty = new Smarty;

$reg = array();
$reg["id_vendedor"] = $__id_vendedor;
$reg["id_cliente"] = $__id_cliente;
$reg["total_venta"] = $__total_venta;
$reg["fecha_venta"] = $__fecha_venta;
$reg["usuario"] = $_SESSION["sesion_id_usuario"];
$rs1 = $db->AutoExecute("ventas", $reg, "UPDATE", "id_venta='".$__id_venta."'");
if($rs1){
	header("Location: ventas.php");
	exit();
}else{
	$smarty->assign("mensaje", "ERROR: Los datos no se modificaron!!!!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->assign("id_venta", $__id_venta);
	$smarty->display("venta_modificar1.tpl");
}
?>
