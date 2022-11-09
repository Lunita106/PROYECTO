<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");



$smarty = new Smarty;

/*$db->debug=true;*/


     $sql = $db->Prepare("SELECT * 
          FROM movimientos m, tipos_movimientos tm
          GROUP BY (tm.id_tipo_movimiento) DESC
          ");

    $rs = $db->GetAll($sql); 


$smarty->assign("movimientos",$rs);
$smarty->assign("direc_css",$direc_css);
$smarty->display("movimientos.tpl");
?>