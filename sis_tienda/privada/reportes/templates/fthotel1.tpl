<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript">
		var ventanaCalendario=false
		function imprimir(){
			if(confirm(' Desea Imprimir ?')){
				window.print();
			}
		}
	</script>
</head>
<body style='cursor: pointer;cursor: hand' onClick='imprimir();'>
	<table width="100%" border="0">
		<tr>
			<td><img src="../tienda/logos/{$logo}" width="70%"></td>
			<td align="center" width="80%"><h1>FICHA TECNICA DE HOTEL</h1></td>
		</tr>
	</table>
	<br>
	<center>
		<table border="1" cellspacing="0">
			<tr>
				<td>
					<table border="0">
						{foreach item=r from=$hotel}
						<tr>
							<th align="right">Nombre Hotel</th><th>:</th>
							<td><input type="text" name="hotel" value="{$r.hotel}" disabled=""></td>
						</tr>
						<tr>
							<th align="right">Nombre Agencia</th><th>:</th>
							<td><input type="text" name="nombre" value="{$r.nombre}" disabled=""></td>
						</tr>
						<tr>
							<th align="right">Ciudad</th><th>:</th>
							<td><input type="text" name="ciudad" value="{$r.ciudad}" disabled=""></td>
						</tr>
						<tr>
							<th align="right">Codigo</th><th>:</th>
							<td><input type="text" name="codigo" value="{$r.codigo}" disabled=""></td>
						</tr>
						<tr>
							<th align="right">Direccion</th><th>:</th>
							<td><input type="text" name="direccion" value="{$r.direccion}" disabled=""></td>
						</tr>
						<tr>
							<th align="right">Plazas</th><th>:</th>
							<td><input type="text" name="nro_plazas_disponibles" value="{$r.nro_plazas_disponibles}" disabled=""></td>
						</tr>
						{/foreach}
					</table>
				</td>
			</tr>
		</table>
</body>
</html>