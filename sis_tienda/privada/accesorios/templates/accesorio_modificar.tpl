<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../{$direc_css}"type="text/css">
	<script type="text/javascript" src="../js/expresiones_regulares.js"></script>
	<script type="text/javascript" src="js/validar_accesorio.js"></script>
</head>
<body>
	<div class="formu_ingreso_datos">
		<form action="accesorio_modificar1.php" method="post" name="formu">
			<h2>MODIFICAR ACCESORIO</h2>
			<b>Marca (*)</b>
			<select name="id_marca">
			{foreach item=r from=$marca}
			<option value="{$r.id_marca}">{$r.marca}</option>
			{/foreach}
			{foreach item=r from=$marcas}
			<option value="{$r.id_marca}">{$r.marca}</option>
			{/foreach}
			</select>
			{foreach item=r from=$accesorio}
			<p>
			<b>Proveedor (*)</b>
			<select name="id_proveedor">
			{foreach item=r from=$proveedor}
			<option value="{$r.id_proveedor}">{$r.nombre}</option>
			{/foreach}
			{foreach item=r from=$proveedores}
			<option value="{$r.id_proveedor}">{$r.nombre}</option>
			{/foreach}
			</select>
			{foreach item=r from=$accesorio}
			<p>
			<input type="text" name="nombre" size="15" placeholder="Nombre"  value="{$r.nombre}" onkeyup="this.value=this.value.toUpperCase()">(*)
			</p>
			<p>
			<input type="text" name="modelo" size="15" placeholder="Modelo" value="{$r.modelo}" onkeyup="this.value=this.value.toUpperCase()">(*)
			</p>
			<p>
				<input type="hidden" name="accion" value="">
				<input type="hidden" name="id_accesorio" value="{$r.id_accesorio}">
				<input type="button" value="Aceptar" onclick="validar();" class="boton2">
				<input type="button" value="Cancelar" onclick="javascript:location.href='accesorios.php';" class="boton2">
			</p>
			{/foreach}
			{/foreach}
			<p><b>(*)Campos Obligatorios</b></p>
		</form>
	</div>
</body>
</html>