<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$__id_marca = $_REQUEST["id_marca"];
$__marca = $_POST["marca"];

//$db->debug=true;

$smarty = new Smarty;

$reg = array();
$reg["marca"] = $__marca;
$reg["usuario"] = $_SESSION["sesion_id_usuario"];
$rs1 = $db->AutoExecute("marcas", $reg, "UPDATE", "id_marca='".$__id_marca."'");
if($rs1){
	header("Location: marcas.php");
	exit();
}else{
	$smarty->assign("mensaje", "ERROR: Los datos no se modificaron!!!!!!!!!!");
	$smarty->assign("direc_css", $direc_css);
	$smarty->assign("id_marca", $__id_marca);
	$smarty->display("marca_modificar1.tpl");
}
?>