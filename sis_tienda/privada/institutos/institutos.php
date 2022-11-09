<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

$smarty = new Smarty;

//$db->debug=true;

$sql=$db->Prepare("SELECT *
					FROM institutos
					");
$rs = $db->GetAll($sql);

$sql1=$db->Prepare("SELECT i.direccion AS direccioni, i.telefono AS telefonoi, i.nombre, c.carrera, c.direccion, c.telefono
					FROM carreras c
					INNER JOIN institutos i ON c.id_instituto=i.id_instituto
					ORDER BY c.id_carrera DESC
					");
$rs1 = $db->GetAll($sql1);

$smarty->assign("carreras", $rs1);
$smarty->assign("institutos", $rs);
$smarty->assign("direc_css", $direc_css);
$smarty->display("institutos.tpl");