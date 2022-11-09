<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../{$direc_css}"type="text/css">
	<script type="text/javascript" src="../js/expresiones_regulares.js"></script>
	<script type="text/javascript" src="js/validar_vendedor.js"></script>
</head>
<body>
	<div class="formu_ingreso_datos">
		<form action="vendedor_modificar1.php" method="post" name="formu">
			<h2>MODIFICAR VENDEDOR</h2>
			{foreach item=r from=$vendedor}
			<input type="text" name="nombre" size="15" placeholder="Nombre" onkeyup="this.value=this.value.toUpperCase()" value="{$r.nombre}">(*)
			<p>
			<input type="text" name="apellido" size="15" placeholder="Apellidos" onkeyup="this.value=this.value.toUpperCase()" value="{$r.apellido}">(*)
			</p>
			<p>
			<input type="text" name="ci" size="15" placeholder="Carnet de Identidad" value="{$r.ci}">(*)
			</p>
			<p>
			<input type="text" name="direccion" size="15" placeholder="Direccion" onkeyup="this.value=this.value.toUpperCase()" value="{$r.direccion}">(*)
			</p>
			<p>
			<input type="email" name="email" size="15" placeholder="Correo Electronico" value="{$r.email}">
			</p>
			<p>
			<input type="text" name="telefono" size="15" placeholder="Telefono" value="{$r.telefono}">
			</p>
			<p>
				<input type="hidden" name="accion" value="">
				<input type="hidden" name="id_vendedor" value="{$r.id_vendedor}">
				<input type="button" value="Aceptar" onclick="validar();" class="boton2">
				<input type="button" value="Cancelar" onclick="javascript:location.href='vendedores.php';" class="boton2">
			</p>
			{/foreach}
			<p><b>(*)Campos Obligatorios</b></p>
		</form>
	</div>
</body>
</html>