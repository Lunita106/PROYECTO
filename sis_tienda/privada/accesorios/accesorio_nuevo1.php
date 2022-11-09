<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$__id_proveedor = $_POST["id_proveedor"];
$__id_marca = $_POST["id_marca"];
$__nombre = $_POST["nombre"];
$__modelo = $_POST["modelo"];

//$db->debug=true;

$smarty = new Smarty;

$reg = array();
$reg["id_proveedor"] = $__id_proveedor;
$reg["id_marca"] = $__id_marca;
$reg["nombre"] = $__nombre;
$reg["modelo"] = $__modelo;
$reg["fec_insercion"] = date("Y-m-d H:i:s");
$reg["id_tienda"] = '1';
$reg["estado"] = '1';
$reg["usuario"] = $_SESSION["sesion_id_usuario"];
$rs1 = $db->AutoExecute("accesorios", $reg, "INSERT");
if($rs1){
	header("Location: accesorios.php");
	exit();
}else{
	$smarty->assign("mensaje", "ERROR: Los datos no se insertaron!!!!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->display("accesorio_nuevo1.tpl");
}
?>