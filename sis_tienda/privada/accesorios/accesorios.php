<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../libreria_menu.php");

$smarty = new Smarty;

//$db->debug=true;

$sql = $db->Prepare("SELECT m.*, a.nombre AS nombre_accesorio, p.nombre AS nombre_proveedor, a.modelo, a.id_accesorio, p.id_proveedor
					FROM accesorios a
				    INNER JOIN marcas m ON a.id_marca=m.id_marca
					INNER JOIN proveedores p ON a.id_proveedor=p.id_proveedor
					AND a.estado <> '0'
					AND m.estado <> '0'
					ORDER BY a.id_accesorio DESC
					");
$rs = $db->GetAll($sql);

$smarty->assign("accesorios", $rs);
$smarty->assign("direc_css", $direc_css);
$smarty->display("accesorios.tpl");
?>