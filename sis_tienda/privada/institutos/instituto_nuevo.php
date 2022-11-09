<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

$smarty = new Smarty;
//$db->debug=true;

$sql = $db->Prepare("SELECT *
					FROM institutos i
					ORDER BY i.id_instituto DESC
					");
$rs = $db->GetAll($sql);

$smarty->assign("institutos", $rs);

$smarty->assign("direc_css", $direc_css);
$smarty->display("instituto_nuevo.tpl");
?>