<?php 
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$id_hotel = $_REQUEST["id_hotel"];

$smarty = new Smarty;

$db->debug=true;
$sql = $db->Prepare("SELECT h.nombre AS hotel, cav.nombre, h.ciudad, h.codigo,h.direccion,h.nro_plazas_disponibles
					FROM hoteles h, cadena_agencia_viajes cav
					WHERE id_hotel = ?
					AND h.id_cadena_agencia_viaje = cav.id_cadena_agencia_viaje
					");
$rs = $db->GetAll($sql, array($id_hotel));
$sql1 = $db->Prepare("SELECT*
					FROM tienda
					WHERE id_tienda =1
					AND estado <> '0'
					");
$rs1 = $db->GetAll($sql1);	
$nombre =$rs1[0]["nombre"];
$logo=$rs1[0]["logo"];
$smarty->assign("logo", $logo);

$smarty->assign("hotel", $rs);
$smarty->assign("direc_css", $direc_css);
$smarty->display("fthotel1.tpl"); 
?>