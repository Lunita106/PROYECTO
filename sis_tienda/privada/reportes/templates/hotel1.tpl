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
			<td align="center" width="80%"><h1>HOTELES--VIAJES</h1></td>
		</tr>
	</table>
	<br>
	<center>
		<table border="1" cellspacing="0">
			<tr>
				<th>NRO</th><th>CODIGO</th><th>AGENCIA</th><th>HOTEL</th>
			</tr>
			{assign var="b" value="1"} 
			{foreach item=r from=$viaje_hotel}
			<tr>
				<td align="center">{$b}</td>
				<td>{$r.codigo}</td>
				<td>{$r.nombre}</td>
				<td>{$r.hotel}</td>
				<!--<td>{$r.telefono}</td>-->
				{assign var="b" value="`$b+1`"}
			</tr>
			{/foreach}
		</table>
		<br><br>
		<b>Fecha:</b> {$fecha}
	</center>
</body>
</html>