<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../../resaltarBusqueda.inc.php");

$tipo_movimiento = strip_tags(stripslashes($_POST["tipo_movimiento"]));
//$db->debug=true
if ($tipo_movimiento){
	$sql3 = $db->Prepare("SELECT *
						FROM tipos_movimientos
						WHERE tipo_movimiento LIKE ?
						");
	$rs3 = $db->GetAll($sql3, array($tipo_movimiento."%"));
	if ($rs3) {
		echo"<center>
			<table width='60%' border='1'>
					<tr>
					<th>TIPO MOVIMIENTO</th><th>?</th>
					</tr>";
		foreach ($rs3 as $k => $fila) {
			$str = $fila["tipo_movimiento"];
			echo"<tr>
			<td align='center'>".resaltar($tipo_movimiento, $str)."</td>
				<td align='center'>
				<input type='radio' name='opcion' value='' onClick='buscar_tipo_movimiento(".$fila["id_tipo_movimiento"].")'></td>
				</tr>";
			}
			echo"</table>
			</center>";
		}else{
			echo"<center><b> EL TIPO MOVIMIENTO NO EXISTE!!</b></center><br>";
			echo"<center
			<table class='listado'>
			<tr>
			<td><b>TIPO MOVIMIENTO</b></td>
			<td><input type='text' name='tipo_movimiento1' size='10'></td>
			</tr>
			<td align='center' colspan='2'>
			<input type='button' value='ADICIONAR MOVIMIENTO' onClick='insertar_tipo_movimiento()'></td>
			</tr>
			</table>
			</center>";
	}
}
?>