<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

$smarty = new Smarty;

//$db->debug=true;

$sql = $db->Prepare("SELECT*
					FROM compras c, proveedores p
					WHERE c.id_proveedor = p.id_proveedor
					AND c.estado <> '0'
					AND p.estado <> '0'
					ORDER BY c.id_compra DESC
					");
$rs = $db->GetAll($sql);

$smarty->assign("compras", $rs);
$smarty->assign("direc_css", $direc_css);
$smarty->display("compras.tpl");
?>