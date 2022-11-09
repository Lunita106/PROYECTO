<?php
session_start();/*inicio de sesion*/
require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../../resaltarBusqueda.inc.php");

$nombre = strip_tags(stripslashes($_POST["nombre"]));
$carrera = strip_tags(stripslashes($_POST["carrera"]));
$direccion = strip_tags(stripslashes($_POST["direccion"]));

//$db-> debug=true;

if ($nombre or $carrera or $direccion) {

	$sql3 = $db->Prepare("SELECT i.direccion AS direccioni, i.nombre, c.carrera, c.direccion
						FROM carreras c, institutos i
          				WHERE i.nombre LIKE ?
						AND c.carrera LIKE ?
						AND c.direccion LIKE ?
						AND c.id_instituto = i.id_instituto
						");
	$rs3 = $db->GetAll($sql3, array($nombre."%",$carrera."%",$direccion."%"));

		if ($rs3) {
			echo "<center>
				<table width='60%' border='1'>
				<tr>
				<th>INSTITUTO</th><th>CARRERA</th><th>DIRECCION</th>
					</tr>";
				foreach($rs3 as $k => $fila){
					$str = $fila["nombre"];
					$str1 = $fila["carrera"];
					$str2 = $fila["direccion"];
		

					echo "<tr>
					<td align='center'>".resaltar($nombre,$str)."</td>
					<td align='center'>".resaltar($carrera,$str1)."</td>
					<td>".resaltar($direccion,$str2)."</td>

					
				</tr>";
				}
				echo"</table>
				</center>";
		} else {
			echo"<center><b> EL INSTITUTO NO EXISTE!!!</b></center><br>";
			
		}
}
?>