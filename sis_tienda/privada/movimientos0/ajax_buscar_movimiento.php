<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../../resaltarBusqueda.inc.php");

//alert("llega js");
$tipo_movimiento = strip_tags(stripslashes($_POST["tipo_movimiento"]));
$monto_movimiento = strip_tags(stripslashes($_POST["monto_movimiento"]));
$moneda = strip_tags(stripslashes($_POST["moneda"]));

//$db->debug=true
if($tipo_movimiento or $monto_movimiento or $moneda){
	$sql3 = $db->Prepare("SELECT *
						FROM movimientos m, tipos_movimientos tm
						WHERE tm.tipo_movimiento LIKE ?
						AND m.monto_movimiento LIKE ?
						AND m.moneda LIKE ?
						");
	$rs3 = $db->GetAll($sql3, array($tipo_movimiento."%", $monto_movimiento."%", $moneda."%"));
	if ($rs3) {
		echo"<center>
			<table class='listado'>
					<tr>
					<th>TIPO MOVIMIENTO</th><th>MONTO MOVIMIENTO</th><th>MONEDA</th><th><img src='../../imagenes/editar.png'</th><th><img src='../../imagenes/eliminar.png'></th>
					</tr>";
		foreach ($rs3 as $k => $fila) {
			$str = $fila["tipo_movimiento"];
			$str1 = $fila["monto_movimiento"];
			$str2 = $fila["moneda"];
			echo"
			<td aling='center'>".resaltar($tipo_movimiento, $str)."</td>
				<td>".resaltar($monto_movimiento, $str1)."</td>
				<td>".resaltar($moneda, $str2)."</td>
				</tr>";
		}
		echo "</table>
		</center>";
	}else {
		echo "<center><b>EL MOVIMIENTO NO EXISTE!!</b></center><br>";
	}
}
?>