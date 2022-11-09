<!DOCTYPE html>
<head>
	<link rel="stylesheet" href="{$direc_css}" type="text/css">
</head>
<body>
	<form action="claves/" method="post" target="cuerpo">
		{if $nick == ""}
		<div class="formu_ingreso">
			<p><h2>Ingresar al sistema</h2></p>
			<p><h2>Usuario:</h2><input type="text" name="nick"  size="30" value="" class="limpiar" style="box-shadow: -2px 2px 5px 000000;"></p>
			<p><h2>Clave:</h2><input type="password" name="password" size="30" value="" style="box-shadow: -2px 2px 5px 000000;"></p>
			<input type="submit" name="accion" value="Ingresar" size="5" class="boton">
		</div>
		{/if}
	</form>
</body>
</html>