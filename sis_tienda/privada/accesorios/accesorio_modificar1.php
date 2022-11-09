<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$__id_marca = $_REQUEST["id_marca"];
$__id_proveedor = $_REQUEST["id_proveedor"];
$__id_accesorio = $_REQUEST["id_accesorio"];
$__nombre = $_POST["nombre"];
$__modelo = $_POST["modelo"];

//$db->debug=true;

$smarty = new Smarty;

$reg = array();
$reg["id_marca"] = $__id_marca;
$reg["id_proveedor"] = $__id_proveedor;
$reg["nombre"] = $__nombre;
$reg["modelo"] = $__modelo;
$reg["usuario"] = $_SESSION["sesion_id_usuario"];
$rs1 = $db->AutoExecute("accesorios", $reg, "UPDATE", "id_accesorio='".$__id_accesorio."'");
if($rs1){
	header("Location: accesorios.php");
	exit();
}else{
	$smarty->assign("mensaje", "ERROR: Los datos no se modificaron!!!!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->assign("id_accesorio", $__id_accesorio);
	$smarty->display("accesorio_modificar1.tpl");
}
?>
