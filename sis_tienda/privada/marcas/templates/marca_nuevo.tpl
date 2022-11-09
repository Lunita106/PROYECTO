<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../{$direc_css}"type="text/css">
	<script type="text/javascript" src="../js/expresiones_regulares.js"></script>
	<script type="text/javascript" src="js/validar_marca.js"></script>
</head>
<body>
	<div class="formu_ingreso_datos">
		<form action="marca_nuevo1.php" method="post" name="formu">
			<h2>REGISTRAR MARCA</h2>
			<input type="text" name="marca" size="15" placeholder="Marca" onkeyup="this.value=this.value.toUpperCase()">(*)
			<p>
				<input type="hidden" name="accion" value="">
				<input type="button" value="Aceptar" onclick="validar();" class="boton2">
				<input type="button" value="Cancelar" onclick="javascript:location.href='marcas.php';" class="boton2">
			</p>
			<p><b>(*)Campos Obligatorios</b></p>
		</form>
	</div>
</body>
</html>