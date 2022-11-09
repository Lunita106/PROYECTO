<?php 
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

$smarty = new Smarty;

$db->debug=true;
$sql = $db->Prepare("SELECT DISTINCT(nombre),id_cadena_agencia_viaje
					FROM cadena_agencia_viajes
					");
$rs = $db->GetAll($sql);

$sql2 = $db->Prepare("SELECT *
					FROM hoteles h, cadena_agencia_viajes cav
					WHERE h.id_cadena_agencia_viaje = cav.id_cadena_agencia_viaje
					ORDER BY h.id_hotel DESC
					");
$rs2 = $db->GetAll($sql2);
$smarty->assign("viajes", $rs2);
$smarty->assign("viajes1", $rs);
$smarty->assign("direc_css", $direc_css);
$smarty->display("fthotel.tpl"); 
?>