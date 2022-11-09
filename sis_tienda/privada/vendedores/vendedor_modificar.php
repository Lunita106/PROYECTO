<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");
$__id_vendedor = $_REQUEST["id_vendedor"];

$smarty = new Smarty;

$sql = $db->Prepare("SELECT*
					FROM vendedores
					WHERE id_vendedor = ?
					");
$rs = $db->GetAll($sql, array($__id_vendedor));
$smarty->assign("vendedor", $rs);

$smarty->assign("direc_css", $direc_css);
$smarty->display("vendedor_modificar.tpl");
?>