<?php 
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$direccion = $_REQUEST["direccion"];

$smarty = new Smarty;

//$db->debug=true;
if($direccion == "T"){
$sql = $db->Prepare("SELECT*
					FROM clientes
					WHERE estado <> '0'
					");
$rs = $db->GetAll($sql);
}else{
$sql = $db->Prepare("SELECT*
					FROM clientes
					WHERE direccion=?
					AND estado <> '0'
					");
$rs = $db->GetAll($sql, array($direccion));	
}

$sql1 = $db->Prepare("SELECT*
					FROM tienda
					WHERE id_tienda
					AND estado <> '0'
					");
$rs1 = $db->GetAll($sql1);
$nombre =$rs1[0]["nombre"];
$logo=$rs1[0]["logo"];
$smarty->assign("logo", $logo);

$fecha = date("Y-m-d H:i:s");
$smarty->assign("clientes_direccion", $rs);
$smarty->assign("fecha", $fecha);
$smarty->assign("direc_css", $direc_css);
$smarty->display("rpt_clientes_direccion1.tpl"); 
?>