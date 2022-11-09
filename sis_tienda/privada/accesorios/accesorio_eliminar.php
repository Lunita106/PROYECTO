<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
$_id_accesorio =$_REQUEST["id_accesorio"];
$smarty=new Smarty;
//$db->debug=true;
$sql=$db->Prepare("SELECT*
                     FROM accesorios_precios
                     WHERE id_accesorio=?
                     AND estado<>'0'
                   ");
$rs=$db->GetAll($sql,array($_id_accesorio));
if(!$rs){
    $reg=array();
    $reg["estado"]='0';
    $reg["usuario"]=$_SESSION["sesion_id_usuario"];
    $rs1=$db->AutoExecute("accesorios",$reg,"UPDATE","id_accesorio='".$_id_accesorio."'");
    header("Location:accesorios.php");
    exit();
}else{
    $smarty->assign("mensaje","ERROR:Los datos no se eliminaron !!!!!!!!!!");
    $smarty->assign("direc_css",$direc_css);
    $smarty->display("accesorio_eliminar.tpl");
	}
	?>