<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../../resaltarBusqueda.inc.php");

$nombre = strip_tags(stripslashes($_POST["nombre"]));
$apellido = strip_tags(stripslashes($_POST["apellido"]));
$ci = strip_tags(stripslashes($_POST["ci"]));

//$db->debug=true
if ($nombre or $apellido or $ci){
	$sql3 = $db->Prepare("SELECT *
						FROM clientes
						WHERE nombre LIKE ?
						AND apellido LIKE ?
						AND ci LIKE ?
						AND estado <> '0'
						");
	$rs3 = $db->GetAll($sql3, array($nombre."%", $apellido."%", $ci."%"));
	if ($rs3) {
		echo"<center>
			<table width='60%' border='1'>
					<tr>
					<th>NOMBRES</th><th>APELLIDO</th><th>C.I.</th><th>?</th>
					</tr>";
		foreach ($rs3 as $k => $fila) {
			$str = $fila["nombre"];
			$str1 = $fila["apellido"];
			$str2 = $fila["ci"];
			echo"<tr>
			<td align='center'>".resaltar($nombre, $str)."</td>
				<td>".resaltar($apellido, $str1)."</td><td>".resaltar($ci, $str2)."</td>
				<td align='center'>
				<input type='radio' name='opcion' value='' onClick='buscar_cliente(".$fila["id_cliente"].")'></td>
				</tr>";
			}
			echo"</table>
			</center>";
		}else{
			echo"<center><b> EL CLIENTE NO EXISTE!!</b></center><br>";
			echo"<center
			<table class='listado'>
			<tr>
			<td><b>Nombre</b></td>
			<td><input type='text' name='nombre1' size='10' onkeyup='this.value=this.value.toUpperCase()'></td>
			</tr>
			<tr>
			<td><b>Apellido</b></td>
			<td><input type='text' name='apellido1' size='10' onkeyup='this.value=this.value.toUpperCase()'></td>
			</tr>
			<tr>
			<td><b>CI</b></td>
			<td><input type='text' name='ci1' size='10'></td>
			</tr>
			<tr>
			<td><b>Direccion</b></td>
			<td><input type='text' name='direccion1' size='10' onkeyup='this.value=this.value.toUpperCase()'></td>
			</tr>
			<tr>
			<td><b>Correo</b></td>
			<td><input type='text' name='email1' size='20'></td>
			</tr>
			<tr>
			<td><b>Telefono</b></td>
			<td><input type='text' name='telefono1' size='10'></td>
			</tr>
			<tr>
			<td align='center' colspan='2'>
			<input type='button' value='ADICIONAR CLIENTE' onClick='insertar_cliente()'></td>
			</tr>
			</table>
			</center>";
	}
}
?>