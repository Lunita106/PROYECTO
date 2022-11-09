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
			<td align="center" width="80%"><h1>FICHA TECNICA DE ACCESORIO</h1></td>
		</tr>
	</table>
	<br>
	<center>
		<table border="1" cellspacing="0">
			<tr>
				<td>
					<table border="0">
						{foreach item=r from=$accesorio}
						<tr>
							<th align="right">Accesorio</th><th>:</th>
							<td><input type="text" name="accesorio" value="{$r.accesorio}" disabled=""></td>
						</tr>
						<tr>
							<th align="right">Modelo</th><th>:</th>
							<td><input type="text" name="modelo" value="{$r.modelo}" disabled=""></td>
						</tr>
						<tr>
							<th align="right">Marca</th><th>:</th>
							<td><input type="text" name="marca" value="{$r.marca}" disabled=""></td>
						</tr>
						<tr>
							<th align="right">Proveedor</th><th>:</th>
							<td><input type="text" name="nombre" value="{$r.nombre}" disabled=""></td>
						</tr>
						{/foreach}
					</table>
				</td>
			</tr>
		</table>
</body>
</html>