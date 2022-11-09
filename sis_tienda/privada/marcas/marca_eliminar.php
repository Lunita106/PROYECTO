<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
$_id_marca=$_REQUEST["id_marca"];
$smarty=new Smarty;
//$db->debug=true;
$sql=$db->Prepare("SELECT*
                     FROM accesorios
                     WHERE id_marca=?
                     AND estado<>'0'
                   ");
$rs=$db->GetAll($sql,array($_id_marca));
if(!$rs){
    $reg= array();
 $reg["estado"]='0';
    $reg["usuario"]=$_SESSION["sesion_id_usuario"];
    $rs1=$db->AutoExecute("marcas",$reg,"UPDATE","id_marca='".$_id_marca."'");
    header("Location:marcas.php");
    exit();
}else{
    $smarty->assign("mensaje","ERROR:Los datos no se eliminaron !!!!!!!!!!");
    $smarty->assign("direc_css",$direc_css);
    $smarty->display("marca_eliminar.tpl");
	}
	?>