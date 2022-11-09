<?php 
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$smarty = new Smarty;

//$db->debug=true;

/*$sql = $db->Prepare("SELECT*
					FROM proveedores p, compras c
					WHERE p.id_proveedor = c.id_proveedor
					AND p.estado <> '0'
					AND c.estado <> '0'
					ORDER BY (c.id_proveedor) DESC
					");*/
$sql = $db->Prepare("SELECT *
					FROM vista_prov_compr");
$rs = $db->GetAll($sql);

$sql1 = $db->Prepare("SELECT*
					FROM tienda
					WHERE id_tienda
					AND estado <> '0'
					");
$rs1 = $db->GetAll($sql1);
$nombre =$rs1[0]["nombre"];
$logo=$rs1[0]["logo"];

$fecha = date("Y-m-d H:i:s");

$smarty->assign("proveedores_compras", $rs);
$smarty->assign("logo", $logo);
$smarty->assign("fecha", $fecha);
$smarty->assign("direc_css", $direc_css);
$smarty->display("proveedores_compras1.tpl"); 
?>