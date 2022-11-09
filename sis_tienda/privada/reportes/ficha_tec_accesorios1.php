<?php 
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$id_accesorio = $_REQUEST["id_accesorio"];

$smarty = new Smarty;

//$db->debug=true;
$sql = $db->Prepare("SELECT a.nombre AS accesorio, a.modelo, m.marca, p.nombre 
					FROM accesorios a, marcas m, proveedores p
					WHERE id_accesorio = ?
					AND a.id_marca = m.id_marca
					AND a.id_proveedor = p.id_proveedor
					AND a.estado <> '0'
					AND m.estado <> '0'
					AND p.estado <> '0'
					");
$rs = $db->GetAll($sql, array($id_accesorio));
$sql1 = $db->Prepare("SELECT*
					FROM tienda
					WHERE id_tienda =1
					AND estado <> '0'
					");
$rs1 = $db->GetAll($sql1);	
$nombre =$rs1[0]["nombre"];
$logo=$rs1[0]["logo"];
$smarty->assign("logo", $logo);

$smarty->assign("accesorio", $rs);
$smarty->assign("direc_css", $direc_css);
$smarty->display("ficha_tec_accesorios1.tpl"); 
?>