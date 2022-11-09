<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../{$direc_css}"type="text/css">
	<script type="text/javascript" src="../js/expresiones_regulares.js"></script>
	<script type="text/javascript" src="js/validar_accesorio.js"></script>
</head>
<body>
	<div class="formu_ingreso_datos">
		<form action="accesorio_nuevo1.php" method="post" name="formu">
			<h2>REGISTRAR ACCESORIO</h2>
			<b>Proveedor (*)</b>
			<select name="id_proveedor">
			<option value="">--- seleccione ---</option>
			{foreach item=r from=$proveedores}
			<option value="{$r.id_proveedor}">{$r.nombre}</option>
			{/foreach}
			</select>
			<p>
			<b>Marca (*)</b>
			<select name="id_marca">
			<option value="">--- seleccione ---</option>
			{foreach item=r from=$marcas}
			<option value="{$r.id_marca}">{$r.marca}</option>
			{/foreach}
			</select>
		    </p>
			<p>
			<input type="text" name="nombre" size="15" placeholder="Nombre" onkeyup="this.value=this.value.toUpperCase()">(*)
			</p>
			<p>
			<input type="text" name="modelo" size="15" placeholder="Modelo" onkeyup="this.value=this.value.toUpperCase()">(*)
			</p>
			<p>
				<input type="hidden" name="accion" value="">
				<input type="button" value="Aceptar" onclick="validar();" class="boton2">
				<input type="button" value="Cancelar" onclick="javascript:location.href='accesorios.php';" class="boton2">
			</p>
			<p><b>(*)Campos Obligatorios</b></p>
		</form>
	</div>
</body>
</html>