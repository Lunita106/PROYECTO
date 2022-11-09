<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="{$direc_css}" type="text/css">
</head>
<body>
	<div class="cabecera">
		<img src="tienda/logos/{$logo}"  width="6%">
		<div class="titulo">
			TIENDA DE ACCESORIOS "{$nombre}"
		</div>
		<div class="usuario">
			Usuario:<b>{$sesion.usuario}</b>
			Rol: <b>{$sesion.rol}</b>
		</div>
	</div>
</body>
</html>