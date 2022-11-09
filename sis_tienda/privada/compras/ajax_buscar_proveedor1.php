<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../../resaltarBusqueda.inc.php");

$id_proveedor = $_POST["id_proveedor"];

//$db->debug=true;

$smarty = new Smarty;
$sql3 = $db->Prepare("SELECT *
						FROM proveedores
						WHERE id_proveedor = ?
						AND estado <> '0'
						");
$rs3 = $db->GetAll($sql3, array($id_proveedor));
echo"<center>
<table width='60%' border='1'><tr>
<th colspan='4'>Datos Proveedor</th></tr>";
foreach ($rs3 as $k => $fila) {
	echo"<tr>
	<td align='center'>".$fila["nombre"]."</td><td>".$fila["direccion"]."</td></tr>";
}
echo"</table>
</center>";
?>