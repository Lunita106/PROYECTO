<!DOCTYPE html>
<html lang="esp">
<head>
	<link rel="stylesheet" href="../{$direc_css}" type="text/css">
	<meta charset="utf-8">
	{literal}
	<script type="text/javascript">
		function validar() {
			direccion = document.formu.direccion.value;
			if(document.formu.direccion.value == ""){
				alert("Por favor seleccione la direccion");
				document.formu.direccion.focus();
				return;
			}
			ventanaCalendario = window.open("rpt_clientes_direccion1.php?direccion="+direccion, "calendario", "width=600, height=500, left=100, top=100, scrollbars=yes, menubars=no, statusbar=NO, status=NO, resizable=YES, location=NO")
		}
	</script>
	{/literal}
</head>
<body>
	<div class="formu_ingreso_datos">
		<h2>RPT DE CLIENTES POR DIRECCIONES</h2>
		<form method="post" name="formu">
			<p>
				<b>*seleccione direccion</b>
				<select name="direccion">
					<option value="">--Seleccione--</option>
					<option value="T">--Todos--</option>
					{foreach item=r from=$clientes}
					<option value="{$r.direccion}">--{$r.direccion}--</option>
					{/foreach}
					</select>

			</p>
			<p>
				<input type="hidden" name="accion" value="">
				<input type="button" value="Aceptar" onclick="validar();" class="boton">
			</p>
		</form>
	</div>
</body>
</html>