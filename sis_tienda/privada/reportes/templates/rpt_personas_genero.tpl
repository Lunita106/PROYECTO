<!DOCTYPE html>
<html lang="esp">
<head>
	<link rel="stylesheet" href="../{$direc_css}" type="text/css">
	<meta charset="utf-8">
	{literal}
	<script type="text/javascript">
		function validar() {
			genero = document.formu.genero.value;
			if(document.formu.genero.value == ""){
				alert("Por favor seleccione el genero");
				document.formu.genero.focus();
				return;
			}
			ventanaCalendario = window.open("rpt_personas_genero1.php?genero="+genero, "calendario", "width=600, height=500, left=100, top=100, scrollbars=yes, menubars=no, statusbar=NO, status=NO, resizable=YES, location=NO")
		}
	</script>
	{/literal}
</head>
<body>
	<div class="formu_ingreso_datos">
		<h2>RPT DE PERSONAS POR GENERO</h2>
		<form method="post" name="formu">
			<p>
				<b>*seleccione genero</b>
				<select name="genero">
					<option value="">--Seleccione--</option>
					<option value="T">--Todos--</option>
					<option value="F">--Femenino--</option>
					<option value="M">--Masculino--</option>
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