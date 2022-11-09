<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../../resaltarBusqueda.inc.php");

$nombre = strip_tags(stripslashes($_POST["nombre"]));
$modelo = strip_tags(stripslashes($_POST["modelo"]));

//$db->debug=true;
if ($nombre or $modelo){
	$sql3 = $db->Prepare("SELECT *
						FROM accesorios
						WHERE nombre LIKE ?
						AND modelo LIKE ?
						AND estado <> '0'
						");
	$rs3 = $db->GetAll($sql3, array($nombre."%", $modelo."%"));
	if ($rs3) {
		echo"<center>
			<table width='60%' border='1'>
					<tr>
					<th>ACCESORIO</th><th>MODELO</th><th>SELECCIONE</th>
					</tr>";
		foreach ($rs3 as $k => $fila) {
			$str = $fila["nombre"];
			$str1 = $fila["modelo"];
			echo"<tr>
			<td align='center'>".resaltar($nombre, $str)."</td>
				<td>".resaltar($modelo, $str1)."</td>
				<td align='center'>
				<input type='radio' name='opcion' value='' onClick='mostrar(".$fila["id_accesorio"].")'></td>
				</tr>";
			}
			echo"</table>
			</center>";
		}else{
			echo"<center><b> EL ACCESORIO NO EXISTE!!</b></center><br>";
	}
}
?>