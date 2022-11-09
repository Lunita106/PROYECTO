<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$__id_tipo_movimiento = $_POST["id_tipo_movimiento"];
$__monto_movimiento = $_POST["monto_movimiento"];
$__fecha_movimiento = $_POST["fecha_movimiento"];
$__moneda = $_POST["moneda"];
//$db->debug=true;

$smarty = new Smarty;

$reg = array();
$reg["id_tipo_movimiento"] = $__id_tipo_movimiento;
$reg["monto_movimiento"] = $__monto_movimiento;
$reg["fecha_movimiento"] = $__fecha_movimiento;
$reg["moneda"] = $__moneda;
$reg["usuario"] = $_SESSION["sesion_id_usuario"];
$rs1 = $db->AutoExecute("movimientos", $reg, "INSERT");
if($rs1){
	header("Location: movimientos.php");
	exit();
}else{
	$smarty->assign("mensaje", "ERROR: Los datos no se insertaron!!!!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->display("movimiento_nuevo1.tpl");
}
?>