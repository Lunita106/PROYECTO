<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$__id_proveedor = $_REQUEST["id_proveedor"];
$__id_compra = $_REQUEST["id_compra"];
$__total_compra = $_POST["total_compra"];
$__fecha_compra = $_POST["fecha_compra"];

//$db->debug=true;

$smarty = new Smarty;

$reg = array();
$reg["id_proveedor"] = $__id_proveedor;
$reg["total_compra"] = $__total_compra;
$reg["fecha_compra"] = $__fecha_compra;
$reg["usuario"] = $_SESSION["sesion_id_usuario"];
$rs1 = $db->AutoExecute("compras", $reg, "UPDATE", "id_compra='".$__id_compra."'");
if($rs1){
	header("Location: compras.php");
	exit();
}else{
	$smarty->assign("mensaje", "ERROR: Los datos no se modificaron!!!!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->assign("id_compra", $__id_compra);
	$smarty->display("compra_modificar1.tpl");
}
?>
