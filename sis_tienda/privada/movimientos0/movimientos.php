<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

$smarty = new Smarty;

/*$db->debug=true;*/


     $sql = $db->Prepare("SELECT*
					FROM movimientos m, tipos_movimientos tm
					WHERE m.id_tipo_movimiento = tm.id_tipo_movimiento
					ORDER BY m.id_movimiento DESC
					");
$rs = $db->GetAll($sql);

$smarty->assign("movimientos", $rs);
$smarty->assign("direc_css", $direc_css);
$smarty->display("movimientos.tpl");
?>