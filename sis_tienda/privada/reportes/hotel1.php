<?php 
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$nombre = $_REQUEST["nombre"];

$smarty = new Smarty;

$db->debug=true;
if($nombre == "T"){
$sql = $db->Prepare("SELECT h.nombre AS hotel, cav.nombre, h.codigo
					FROM hoteles h, cadena_agencia_viajes cav
					WHERE h.id_cadena_agencia_viaje=cav.id_cadena_agencia_viaje
					ORDER BY (h.id_cadena_agencia_viaje) DESC
					");
$rs = $db->GetAll($sql);
}else{
$sql = $db->Prepare("SELECT h.nombre AS hotel, cav.nombre, h.codigo
					FROM hoteles h, cadena_agencia_viajes cav
					WHERE h.id_cadena_agencia_viaje=cav.id_cadena_agencia_viaje
					AND cav.nombre=?
					ORDER BY (h.id_cadena_agencia_viaje) DESC
					");
$rs = $db->GetAll($sql, array($nombre));	
}

$sql1 = $db->Prepare("SELECT*
					FROM tienda
					WHERE id_tienda
					AND estado <> '0'
					");
$rs1 = $db->GetAll($sql1);
$nombre =$rs1[0]["nombre"];
$logo=$rs1[0]["logo"];
$smarty->assign("logo", $logo);

$fecha = date("Y-m-d H:i:s");
$smarty->assign("viaje_hotel", $rs);
$smarty->assign("fecha", $fecha);
$smarty->assign("direc_css", $direc_css);
$smarty->display("hotel1.tpl"); 
?>