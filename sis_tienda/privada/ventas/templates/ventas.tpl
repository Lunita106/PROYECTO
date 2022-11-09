<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../{$direc_css}" type="text/css">
	<meta http-equiv="Content-type" content="text/html; charset=utf-8"/>
</head>
<body>
	<table width="100%" border="0">
		<tr>
			<td width="33%">
				<table border="0">
					<tr>
						
					</tr>
				</table>
			<div class="titulo_listado">
				<h1>VENTAS</h1>
			</div>
			<div class="titulo_nuevo">
		<form name="formNuevo" method="post" action="venta_nuevo.php">
			<a href="javascript:document.formNuevo.submit();">
				Nuevo>>>
			</a>
		</form>
</div>
</table>
	<center>
		<table class="listado">
			<tr>
				<th>NRO</th><th>VENTA</th><th>FECHA</th><th>CLIENTE</th><th>VENDEDOR</th>
				<th><img src="../../imagenes/editar.png"></th><th><img src="../../imagenes/eliminar.png"></th>
			</tr>
			{assign var="b" value="1"}
			{foreach item=r from=$ventas}
			<tr>
				<td align="center">{$b}</td>
				<td align="center">{$r.total_venta}</td>
				<td>{$r.fecha_venta}</td>
				<td>{$r.nombre_cliente} {$r.apellido_cliente}</td>
				<td>{$r.nombre_vendedor} {$r.apellido_vendedor}</td>
				<td align="center">
					<form name="formModif{$r.id_venta}" method="post" action="venta_modificar.php">
						<input type="hidden" name="id_venta" value="{$r.id_venta}">
						<input type="hidden" name="id_cliente" value="{$r.id_cliente}">
						<input type="hidden" name="id_vendedor" value="{$r.id_vendedor}">
						<a href="javascript:document.formModif{$r.id_venta}.submit();" title="Modificar VentaS">
							Modificar>>
						</a>
					</form>
				</td>
				<td align="center">
					<form name="formElimi{$r.id_venta}" method="post" action="venta_eliminar.php">
						<input type="hidden" name="id_venta" value="{$r.id_venta}">
						<a href="javascript:document.formElimi{$r.id_venta}.submit();" title="Eliminar Venta" onclick='javascript:return(confirm("Desea realmente Eliminar a la venta:::{$r.total_venta}?"));'>
							Eliminar>>
						</a>
					</form>
				</td>
				{assign var="b" value="`$b+1`"}
				{/foreach}
			</tr>
		</table>
	</center>
</body>
</html>