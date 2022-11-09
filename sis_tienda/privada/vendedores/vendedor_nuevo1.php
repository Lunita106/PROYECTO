<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");


$__nombre = $_POST["nombre"];
$__apellido = $_POST["apellido"];
$__ci = $_POST["ci"];
$__direccion = $_POST["direccion"];
$__email = $_POST["email"];
$__telefono = $_POST["telefono"];

//$db->debug=true;

$smarty = new Smarty;

$reg = array();
$reg["id_tienda"] = 1;
$reg["nombre"] = $__nombre;
$reg["apellido"] = $__apellido;
$reg["ci"] = $__ci;
$reg["direccion"] = $__direccion;
$reg["email"] = $__email;
$reg["telefono"] = $__telefono;
$reg["fec_insercion"] = date("Y-m-d H:i:s");
$reg["estado"] = '1';
$reg["usuario"] = $_SESSION["sesion_id_usuario"];
$rs1 = $db->AutoExecute("vendedores", $reg, "INSERT");
if($rs1){
	header("Location: vendedores.php");
	exit();
}else{
	$smarty->assign("mensaje", "ERROR: Los datos no se insertaron!!!!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->display("vendedor_nuevo1.tpl");
}
?>