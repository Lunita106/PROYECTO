<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
$_id_venta =$_REQUEST["id_venta"];
$smarty=new Smarty;
$db->debug=true;
$sql=$db->Prepare("SELECT*
                     FROM detalle_ventas
                     WHERE id_venta=?
                     AND estado<>'0'
                   ");
$rs=$db->GetAll($sql,array($_id_venta));
if(!$rs){
    $reg=array();
 $reg["estado"]='0';
    $reg["usuario"]=$_SESSION["sesion_id_usuario"];
    $rs1=$db->AutoExecute("ventas",$reg,"UPDATE","id_venta='".$_id_venta."'");
    header("Location:ventas.php");
    exit();
}else{
    $smarty->assign("mensaje","ERROR:Los datos no se eliminaron !!!!!!!!!!");
    $smarty->assign("direc_css",$direc_css);
    $smarty->display("venta_eliminar.tpl");
	}
	?>