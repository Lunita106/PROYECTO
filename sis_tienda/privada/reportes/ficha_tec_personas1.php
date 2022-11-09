<?php 
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$id_persona = $_REQUEST["id_persona"];

$smarty = new Smarty;

//$db->debug=true;
$sql = $db->Prepare("SELECT*
					FROM personas
					WHERE id_persona = ?
					AND estado <> '0'
					");
$rs = $db->GetAll($sql, array($id_persona));
$sql1 = $db->Prepare("SELECT*
					FROM tienda
					WHERE id_tienda =1
					AND estado <> '0'
					");
$rs1 = $db->GetAll($sql1);	
$nombre =$rs1[0]["nombre"];
$logo=$rs1[0]["logo"];
$smarty->assign("logo", $logo);

$smarty->assign("persona", $rs);
$smarty->assign("direc_css", $direc_css);
$smarty->display("ficha_tec_personas1.tpl"); 
?>