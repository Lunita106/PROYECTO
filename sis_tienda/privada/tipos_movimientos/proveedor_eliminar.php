<?php
session_start();
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
$_id_proveedor=$_REQUEST["id_proveedor"];
$smarty=new Smarty;
//$db->debug=true;
$sql=$db->Prepare("SELECT*
                     FROM compras
                     WHERE id_proveedor=?
                     AND estado<>'0'
                   ");
$rs=$db->GetAll($sql,array($_id_proveedor));

$sql1=$db->Prepare("SELECT*
                     FROM accesorios
                     WHERE id_proveedor=?
                     AND estado<>'0'
                   ");
$rs1=$db->GetAll($sql1,array($_id_proveedor));
if(!$rs && !$rs1){
    $reg= array();
 $reg["estado"]='0';
    $reg["usuario"]=$_SESSION["sesion_id_usuario"];
    $rs1=$db->AutoExecute("proveedores",$reg,"UPDATE","id_proveedor='".$_id_proveedor."'");
    header("Location:proveedores.php");
    exit();
}else{
    $smarty->assign("mensaje","ERROR:Los datos no se eliminaron !!!!!!!!!!");
    $smarty->assign("direc_css",$direc_css);
    $smarty->display("proveedor_eliminar.tpl");
	}
	?>