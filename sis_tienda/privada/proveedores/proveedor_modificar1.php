<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$__id_proveedor = $_REQUEST["id_proveedor"];
$__nombre = $_POST["nombre"];
$__direccion = $_POST["direccion"];
$__telefono = $_POST["telefono"];

//$db->debug=true;

$smarty = new Smarty;

$reg = array();
$reg["nombre"] = $__nombre;
$reg["direccion"] = $__direccion;
$reg["telefono"] = $__telefono;
$reg["usuario"] = $_SESSION["sesion_id_usuario"];
$rs1 = $db->AutoExecute("proveedores", $reg, "UPDATE", "id_proveedor='".$__id_proveedor."'");
if($rs1){
	header("Location: proveedores.php");
	exit();
}else{
	$smarty->assign("mensaje", "ERROR: Los datos no se modificaron!!!!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->assign("id_proveedor", $__id_proveedor);
	$smarty->display("proveedor_modificar1.tpl");
}
?>