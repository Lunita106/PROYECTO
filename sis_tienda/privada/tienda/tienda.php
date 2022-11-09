<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

$smarty = new Smarty;

$sql = $db->Prepare("SELECT *
					FROM tienda
					WHERE id_tienda = 1
					");
$rs = $db->GetAll($sql);
$smarty->assign("tienda", $rs);

$smarty->assign("direc_css", $direc_css);
$smarty->display("tienda.tpl");
?>