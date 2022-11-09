<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../../resaltarBusqueda.inc.php");

$id_cliente = $_POST["id_cliente"];
//$id_vendedor = $_POST["id_vendedor"];


//$db->debug=true;

//$smarty = new Smarty;
$sql3 = $db->Prepare("SELECT *
						FROM clientes
						WHERE id_cliente = ?
						AND estado <> '0'
						");
$rs3 = $db->GetAll($sql3, array($id_cliente));
echo"<center>
<table width='60%' border='1'><tr>
<th colspan='4'>Datos Cliente</th></tr>";
foreach ($rs3 as $k => $fila) {
	echo"<tr>
	<td align='center'>".$fila["nombre"]."</td><td>".$fila["apellido"]."</td><td>".$fila["ci"]."</td></tr>";
}
echo"</table>
</center>";
/*$sql4 = $db->Prepare("SELECT *
						FROM vendedores
						WHERE id_vendedor = ?
						AND estado <> '0'
						");
$rs4 = $db->GetAll($sql4, array($id_vendedor));
echo"<center>
<table width='60%' border='1'><tr>
<th colspan='4'>Datos Vendedor</th></tr>";
foreach ($rs3 as $k => $fila) {
	echo"<tr>
	<td align='center'>".$fila["nombre"]."</td><td>".$fila["apellido"]."</td><td>".$fila["ci"]."</td></tr>";
}
echo"</table>
</center>";*/
?>