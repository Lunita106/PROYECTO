<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

$smarty = new Smarty;
$db->debug=true;

$sql = $db->Prepare("SELECT *
					FROM tipos_movimientos tm
					ORDER BY tm.id_tipo_movimiento DESC
					");
$rs = $db->GetAll($sql);
$sql2 = $db->Prepare("SELECT DISTINCT(m.moneda)
					FROM movimientos m
					ORDER BY (m.moneda) DESC
					");
$rs2 = $db->GetAll($sql2);

$smarty->assign("tipos_movimientos", $rs);
$smarty->assign("tipos_movimientos2", $rs2);

$smarty->assign("direc_css", $direc_css);
$smarty->display("movimiento_nuevo.tpl");
?>