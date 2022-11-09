<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../{$direc_css}"type="text/css">
	<script type="text/javascript" src="../js/expresiones_regulares.js"></script>
	<script type="text/javascript" src="js/validar_venta.js"></script>
	<link rel="stylesheet" type="text/css" href="../calendario/tcal.css">
	<script type="text/javascript" src="../calendario/tcal.js"></script>
</head>
<body>
	<div class="formu_ingreso_datos">
		<form action="venta_modificar1.php" method="post" name="formu">
			<h2>MODIFICAR VENTA</h2>
			<b>Vendedor (*)</b>
			<select name="id_vendedor">
			{foreach item=r from=$vendedor}
			<option value="{$r.id_vendedor}">{$r.nombre}</option>
			{/foreach}
			{foreach item=r from=$vendedores}
			<option value="{$r.id_vendedor}">{$r.nombre}</option>
			{/foreach}
			</select>
			{foreach item=r from=$venta}
			<p>
			<b>Cliente (*)</b>
			<select name="id_cliente">
			{foreach item=r from=$cliente}
			<option value="{$r.id_cliente}">{$r.nombre}</option>
			{/foreach}
			<!--{foreach item=r from=$clientes}
			<option value="{$r.id_cliente}">{$r.nombre}</option>
			{/foreach}-->
			</select>
			{foreach item=r from=$venta}
			<p>
			<p>
			<input type="text" name="total_venta" size="15" value="{$r.total_venta}">(*)
			</p>
			<input type="text" name="fecha_venta" size="15" value="{$r.fecha_venta}" class="tcal" readonly="">(*)
			</p>
			<p>
				<input type="hidden" name="accion" value="">
				<input type="hidden" name="id_venta" value="{$r.id_venta}">
				<input type="button" value="Aceptar" onclick="validar();" class="boton2">
				<input type="button" value="Cancelar" onclick="javascript:location.href='ventas.php';" class="boton2">
			</p>
			{/foreach}
			{/foreach}
			<p><b>(*)Campos Obligatorios</b></p>
		</form>
	</div>
</body>
</html>