<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../../resaltarBusqueda.inc.php");

$nombre = strip_tags(stripslashes($_POST["nombre"]));
$hotel = strip_tags(stripslashes($_POST["hotel"]));
$ciudad = strip_tags(stripslashes($_POST["ciudad"]));

$db->debug=true;
if ($nombre or $hotel or $ciudad){
	$sql3 = $db->Prepare("SELECT h.nombre AS hotel, cav.nombre, h.ciudad,h.id_hotel
						FROM hoteles h, cadena_agencia_viajes cav
          				WHERE h.id_cadena_agencia_viaje = cav.id_cadena_agencia_viaje
						AND cav.nombre LIKE ?
						AND h.nombre LIKE ?
						AND h.ciudad LIKE ?
						");
	$rs3 = $db->GetAll($sql3, array($nombre."%", $hotel."%", $ciudad."%"));
	if ($rs3) {
		echo"<center>
			<table width='60%' border='1'>
					<tr>
					<th>AGENCIA</th><th>HOTEL</th><th>CIUDAD</th><th>SELECCIONE</th>
					</tr>";
		foreach ($rs3 as $k => $fila) {
			$str = $fila["nombre"];
			$str1 = $fila["hotel"];
			$str2 = $fila["ciudad"];
			echo"<tr>
			<td align='center'>".resaltar($nombre, $str)."</td>
				<td>".resaltar($hotel, $str1)."</td>
				<td>".resaltar($ciudad, $str2)."</td>
				<td align='center'>
				<input type='radio' name='opcion' value='' onClick='mostrar(".$fila["id_hotel"].")'></td>
				</tr>";
			}
			echo"</table>
			</center>";
		}else{
			echo"<center><b> EL HOTEL NO EXISTE!!</b></center><br>";
	}
}
?>