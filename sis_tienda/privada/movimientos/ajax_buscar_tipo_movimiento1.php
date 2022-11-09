<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../../resaltarBusqueda.inc.php");

$id_tipo_movimiento = $_POST["id_tipo_movimiento"];
//$id_movimiento = $_POST["id_movimiento"];
//$db->debug=true;

$smarty = new Smarty;
$sql3 = $db->Prepare("SELECT *
						FROM tipos_movimientos
						WHERE id_tipo_movimiento = ?
						");
$rs3 = $db->GetAll($sql3, array($id_tipo_movimiento));
echo"<center>
<table width='60%' border='1'><tr>
<th colspan='4'>Datos Tipo Movimiento</th></tr>";
foreach ($rs3 as $k => $fila) {
	echo"<tr>
	<td align='center'>".$fila["tipo_movimiento"]."</td></tr>";
}
echo"</table>
</center>";
?>