<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$__id_persona = $_REQUEST["id_persona"];
$__id_usuario = $_REQUEST["id_usuario"];
$__nom_usuario = $_POST["usuario"];
$__clave = $_POST["clave"];

$hash=password_hash($__clave, PASSWORD_DEFAULT);

//$db->debug=true;

$smarty = new Smarty;

$reg = array();
$reg["id_persona"] = $__id_persona;
$reg["nom_usuario"] = $__nom_usuario;
$reg["clave"] = $hash;
$reg["usuario"] = $_SESSION["sesion_id_usuario"];
$rs1 = $db->AutoExecute("usuarios", $reg, "UPDATE", "id_usuario='".$__id_usuario."'");
if($rs1){
	header("Location: usuarios.php");
	exit();
}else{
	$smarty->assign("mensaje", "ERROR: Los datos no se modificaron!!!!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->assign("id_usuario", $__id_usuario);
	$smarty->display("usuario_modificar1.tpl");
}
?>