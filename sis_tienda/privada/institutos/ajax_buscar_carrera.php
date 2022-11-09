<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../../resaltarBusqueda.inc.php");

$nombre = strip_tags(stripslashes($_POST["nombre"]));
$direccion = strip_tags(stripslashes($_POST["direccion"]));
$telefono = strip_tags(stripslashes($_POST["telefono"]));

//$db->debug=true;
if ($nombre or $direccion or $telefono){
	$sql3 = $db->Prepare("SELECT*
						FROM institutos
						WHERE nombre LIKE ?
						AND direccion LIKE ?
						AND telefono LIKE ?
						");
	$rs3 = $db->GetAll($sql3, array($nombre."%", $direccion."%", $telefono."%"));
	if ($rs3) {
		echo"<center>
			<table width='60%' border='1'>
					<tr>
					<th>NOMBRE</th><th>DIRECCION</th><th>TELEFONO</th><th>?</th>
					</tr>";
		foreach ($rs3 as $k => $fila) {
			$str = $fila["nombre"];
			$str1 = $fila["direccion"];
			$str2 = $fila["telefono"];
			echo"<tr>
			<td align='center'>".resaltar($nombre, $str)."</td>
				<td>".resaltar($direccion, $str1)."</td>
				<td>".resaltar($telefono, $str2)."</td>
				<td align='center'>
				<input type='radio' name='opcion' value='' onClick='buscar_instituto(".$fila["id_instituto"].")'></td>
				</tr>";
			}
			echo"</table>
			</center>";
		}else{
			echo"<center><b> EL INSTITUTO NO EXISTE!!</b></center><br>";
			echo"<center>
			<table class='listado'>
			<tr>
			<td><b>Nombre</b></td>
			<td><input type='text' name='nombre1' size='10' onkeyup='this.value=this.value.toUpperCase()'></td>
			</tr>
			<tr>
			<td><b>Direccion</b></td>
			<td><input type='text' name='direccion1' size='10' onkeyup='this.value=this.value.toUpperCase()'></td>
			</tr>
			<tr>
			<td><b>Telefono</b></td>
			<td><input type='text' name='telefono1' size='10'></td>
			</tr>
			<tr>
			<td><b>Pagina Web</b></td>
			<td><input type='text' name='pag_web1' size='10' onkeyup='this.value=this.value.toUpperCase()'></td>
			</tr>
			<tr>
			<td><b>Resol</b></td>
			<td><input type='text' name='resol_min1' size='10' onkeyup='this.value=this.value.toUpperCase()'></td>
			</tr>
			
			<tr>
			<td><b>Mision</b></td>
			<td><input type='text' name='mision1' size='10' onkeyup='this.value=this.value.toUpperCase()'>
			
			</tr>
			<tr>
			<td><b>Vision</b></td>
			<td><input type='text' name='vision1' size='10' onkeyup='this.value=this.value.toUpperCase()'>
			</tr>
			<tr>
			<td align='center' colspan='2'>
			<input type='button' value='ADICIONAR INSTITUTO' onClick='insertar_instituto()'></td>
			</tr>
			</table>
			</center>";
	}
}
?>