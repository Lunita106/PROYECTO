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
			<td><img src="../../imagenes/{$logo}" width="70%"></td>
			<td align="center" width="80%"><h1>PROVEEDORES_COMPRAS</h1></td>
		</tr>
	</table>
	<br>
	<center>
		<table border="1" cellspacing="0">
			<tr>
				<th>NRO</th><th>FECHA DE COMPRA</th><th>MONTO DE COMPRA</th><th>PROVEEDOR</th>
			</tr>
			{assign var="b" value="1"} 
			{foreach item=r from=$proveedores_compras}
			<tr>
				<td align="center">{$b}</td>
				<td>{$r.fecha_compra}</td>
				<td>{$r.total_compra}</td>
				<td>{$r.nombre}</td>
				{assign var="b" value="`$b+1`"}
			</tr>
			{/foreach}
		</table>
		<br><br>
		<b>Fecha:</b> {$fecha}
	</center>
</body>
</html>