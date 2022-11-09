<?php 
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$marca = $_REQUEST["marca"];

$smarty = new Smarty;

//$db->debug=true;
if($marca == "T"){
$sql = $db->Prepare("SELECT*
					FROM accesorios a, marcas m
					WHERE a.id_marca=m.id_marca
					AND a.estado <> '0'
					AND m.estado <> '0'
					ORDER BY (a.id_marca) DESC
					");
$rs = $db->GetAll($sql);
}else{
$sql = $db->Prepare("SELECT*
					FROM accesorios a, marcas m
					WHERE a.id_marca=m.id_marca
					AND m.marca=?
					AND a.estado <> '0'
					AND m.estado <> '0'
					ORDER BY (a.id_marca) DESC
					");
$rs = $db->GetAll($sql, array($marca));	
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
$smarty->assign("marcas_accesorios", $rs);
$smarty->assign("fecha", $fecha);
$smarty->assign("direc_css", $direc_css);
$smarty->display("rpt_accesorios_marcas1.tpl"); 
?>