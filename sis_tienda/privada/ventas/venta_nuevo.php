<?php
session_start();
require_once("../../smarty/libs//Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

$smarty = new Smarty;

$sql1 = $db->Prepare("SELECT*
					FROM vendedores
					WHERE estado <> '0'
					ORDER BY id_vendedor DESC
					");
$rs1 = $db->GetAll($sql1);

$sql2 = $db->Prepare("SELECT*
					FROM clientes
					WHERE estado <> '0'
					ORDER BY id_cliente DESC
					");
$rs2 = $db->GetAll($sql2);


$smarty->assign("vendedores", $rs1);
$smarty->assign("clientes", $rs2);

$smarty->assign("direc_css", $direc_css);
$smarty->display("venta_nuevo.tpl");
?>