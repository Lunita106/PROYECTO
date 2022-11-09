<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");
require_once("../../resaltarBusqueda.inc.php");


$compra = strip_tags(stripslashes($_POST["compra"]));
$nombres = strip_tags(stripslashes($_POST["nombres"]));


$db->debug=true;
if ($compra or $nombres){
	$sql3 = $db->Prepare("SELECT *
						FROM compras c, proveedores p
						WHERE c.id_proveedor = p.id_proveedor
						AND c.total_compra LIKE ?
						AND p.nombre LIKE ?
						AND c.estado <> '0'
						AND p.estado <> '0'
						");
	$rs3 = $db->GetAll($sql3, array($compra."%", $nombres."%"));
	if ($rs3) {
		echo"<center>
			<table class='listado'>
					<tr>
					<th>COMPRA</th><th>PROVEEDOR</th><th><img src='../../imagenes/editar.png'</th><th><img src='../../imagenes/eliminar.png'></th>
					</tr>";
		foreach ($rs3 as $k => $fila) {
			$str = $fila["total_compra"];
			$str1 = $fila["nombre"];
			echo"
			<td aling='center'>".resaltar($compra, $str)."</td>
				<td>".resaltar($nombres, $str1)."</td>
				<td aling='center'>
				<form name='formModif".$fila["id_compra"]."' method='post' action='compra_modificar.php'>
				<input type='hidden' name='id_compra' value='".$fila['id_compra']."'>
				<input type='hidden' name='id_proveedor' value='".$fila['id_proveedor']."'>
				<a href='javascript:document.formModif".$fila['id_compra'].".submit();' title='Modificar Compra Sistema'>
				Modificar>>
				</a>
				</form>
				</td>
				<td aling='center'>
				<form name='formElimi".$fila["id_compra"]."' method='post' action='compra_eliminar.php'>
				<input type='hidden' name='id_compra' value='".$fila['id_compra']."'>
				<a href='javascript:document.formElimi".$fila['id_compra'].".submit();' title='Eliminar Compra Sistema' onclick='javascript:return(confirm(\" Desea realmente Eliminar a la compra..?\"))'; location.href='compra_eliminar.php''>
				Eliminar>>
				</a>
				</form>
				</td>
				</tr>";
		}
		echo "</table>
		</center>";
	}else {
		echo "<center><b>LA COMPRA NO EXISTE!!</b></center><br>";
	}
}
?>