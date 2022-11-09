<?php 
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

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

$smarty->assign("proveedores_compras", $rs);
$smarty->assign("direc_css", $direc_css);
$smarty->display("proveedores_compras.tpl"); 
?>