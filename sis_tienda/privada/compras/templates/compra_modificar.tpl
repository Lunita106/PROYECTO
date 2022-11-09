<!DOCTYPE html>
<html>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../{$direc_css}"type="text/css">
	<script type="text/javascript" src="../js/expresiones_regulares.js"></script>
	<script type="text/javascript" src="js/validar_compra.js"></script>
	<link rel="stylesheet" type="text/css" href="../calendario/tcal.css">
	<script type="text/javascript" src="../calendario/tcal.js"></script>
</head>
<body>
	<div class="formu_ingreso_datos">
		<form action="compra_modificar1.php" method="post" name="formu">
			<h2>MODIFICAR COMPRA</h2>
			<b>Proveedor (*)</b>
			<select name="id_proveedor">
			{foreach item=r from=$proveedor}
			<option value="{$r.id_proveedor}">{$r.nombre}</option>
			{/foreach}
			<!--{foreach item=r from=$proveedores}
			<option value="{$r.id_proveedor}">{$r.nombre}</option>
			{/foreach}-->
			</select>
			{foreach item=r from=$compra}
			<p>
			<input type="text" name="total_compra" size="15" value="{$r.total_compra}">(*)
			</p>
			<input type="text" name="fecha_compra" size="15" value="{$r.fecha_compra}" class="tcal" readonly="">(*)
			</p>
			<p>
				<input type="hidden" name="accion" value="">
				<input type="hidden" name="id_compra" value="{$r.id_compra}">
				<input type="button" value="Aceptar" onclick="validar();" class="boton2">
				<input type="button" value="Cancelar" onclick="javascript:location.href='compras.php';" class="boton2">
			</p>
			{/foreach}
			<p><b>(*)Campos Obligatorios</b></p>
		</form>
	</div>
</body>
</html>