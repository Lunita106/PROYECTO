<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

$smarty = new Smarty;

//$db->debug=true;

$sql = $db->Prepare("SELECT DISTINCT(tipo_movimiento),id_tipo_movimiento
					FROM tipos_movimientos
					");
$rs = $db->GetAll($sql);


$sql2 = $db->Prepare("SELECT *
					FROM movimientos m, tipos_movimientos tm
					WHERE m.id_tipo_movimiento = tm.id_tipo_movimiento
					ORDER BY m.id_movimiento DESC
					");
$rs2 = $db->GetAll($sql2);
$smarty->assign("movimientos", $rs2);
$smarty->assign("tipos_movimientos", $rs);
$smarty->assign("direc_css", $direc_css);
$smarty->display("movimientos.tpl");
?>