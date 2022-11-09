<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

$__id_tienda = $_REQUEST["id_tienda"];
$__nombre = $_POST["nombre"];
$__direccion = $_POST["direccion"];
$__telefono = $_POST["telefono"];

$__logo1 = $_POST["logo1"];
$__nombre_log = $_FILES['logo']['name'];


$smarty = new Smarty;

if ((!empty($_FILES['logo'])) and is_uploaded_file($_FILES['logo']['tmp_name'])){
	copy($_FILES['logo']['tmp_name'],'logos/'.$__nombre_log);
	$logo = $_FILES['logo']['name'];
}elseif ($__logo1 == "") {
	$logo = '';
	$__nombre_log = '';
}else
$__nombre_log = $__logo1;

$reg = array();
$reg["nombre"] = $__nombre;
$reg["direccion"] = $__direccion;
$reg["telefono"] = $__telefono;
$reg["logo"] = $__nombre_log;
$reg["usuario"] = $_SESSION["sesion_id_usuario"];
$rs1 = $db->AutoExecute("tienda", $reg, "UPDATE", "id_tienda='".$__id_tienda."'" );
if ($rs1) {
	$smarty->assign("mensaje", "Los datos se modificaron ACTUALIZAR EL SISTEMA!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->display("tienda1.tpl");
}else {
	$smarty->assign("mensaje", "ERROR: Los datos no se modificaron!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->display("tienda1.tpl");
}
?>