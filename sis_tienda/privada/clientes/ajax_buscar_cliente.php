<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../../resaltarBusqueda.inc.php");

$apellidos = strip_tags(stripslashes($_POST["apellidos"]));
$nombres = strip_tags(stripslashes($_POST["nombres"]));
$direccion = strip_tags(stripslashes($_POST["direccion"]));
$ci = strip_tags(stripslashes($_POST["ci"]));

$db->debug=true;
if ($apellidos or $nombres or $direccion or $ci){
	$sql3 = $db->Prepare("SELECT *
						FROM clientes
						WHERE apellido LIKE ?
						AND nombre LIKE ?
						AND direccion LIKE ?
						AND ci LIKE ?
						AND estado <> '0'
						");
	$rs3 = $db->GetAll($sql3, array($apellidos."%", $nombres."%", $direccion."%", $ci."%"));
	if ($rs3) {
		echo"<center>
			<table class='listado'>
					<tr>
					<th>C.I.</th><th>APELLIDO</th><th>NOMBRE</th><th>DIRECCION</th><th><img src='../../imagenes/editar.png'</th><th><img src='../../imagenes/eliminar.png'></th>
					</tr>";
		foreach ($rs3 as $k => $fila) {
			$str = $fila["ci"];
			$str1 = $fila["apellido"];
			$str2 = $fila["nombre"];
			$str3 = $fila["direccion"];
			echo"
			<td aling='center'>".resaltar($ci, $str)."</td>
				<td>".resaltar($apellidos, $str1)."</td>
				<td>".resaltar($nombres, $str2)."</td>
				<td>".resaltar($direccion, $str3)."</td>
				<td aling='center'>
				<form name='formModif".$fila["id_cliente"]."' method='post' action='cliente_modificar.php'>
				<input type='hidden' name='id_cliente' value='".$fila['id_cliente']."'>
				<a href='javascript:document.formModif".$fila['id_cliente'].".submit();' title='Modificar Cliente Sistema'>
				Modificar>>
				</a>
				</form>
				</td>
				<td aling='center'>
				<form name='formElimi".$fila["id_cliente"]."' method='post' action='cliente_eliminar.php'>
				<input type='hidden' name='id_cliente' value='".$fila['id_cliente']."'>
				<a href='javascript:document.formElimi".$fila['id_cliente'].".submit();' title='Eliminar Cliente Sistema' onclick='javascript:return(confirm(\" Desea realmente Eliminar al cliente..?\"))'; location.href='cliente_eliminar.php''>
				Eliminar>>
				</a>
				</form>
				</td>
				</tr>";
		}
		echo "</table>
		</center>";
	}else {
		echo "<center><b>EL CLIENTE NO EXISTE!!</b></center><br>";
	}
}
?>