<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$__id_instituto = $_POST["id_instituto"];
$__carrera = $_POST["carrera"];
$__direccion2 = $_POST["direccion2"];
$__telefono2 = $_POST["telefono2"];
$__grado_academico = $_POST["grado_academico"];
$__descripcion = $_POST["descripcion"];
$__duracion = $_POST["duracion"];
//$db->debug=true;

$smarty = new Smarty;

$reg = array();
$reg["id_instituto"] = $__id_instituto;
$reg["carrera"] = $__carrera;
$reg["direccion"] = $__direccion2;
$reg["telefono"] = $__telefono2;
$reg["grado_academico"] = $__grado_academico;
$reg["descripcion"] = $__descripcion;
$reg["duracion"] = $__duracion;
$rs1 = $db->AutoExecute("carreras", $reg, "INSERT");

if($rs1){
	header("Location: institutos.php");
	exit();
}else{
	$smarty->assign("mensaje", "ERROR: Los datos no se insertaron!!!!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->display("instituto_nuevo1.tpl");
}
?>