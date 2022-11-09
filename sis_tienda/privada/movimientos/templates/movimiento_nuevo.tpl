<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../{$direc_css}"type="text/css">
	<script type="text/javascript" src="../js/expresiones_regulares.js"></script>
	<script type="text/javascript" src="js/validar_movimiento.js"></script>
		<link rel="stylesheet" type="text/css" href="../calendario/tcal.css">
	<script type="text/javascript" src="../calendario/tcal.js"></script>
	<script type="text/javascript" src="../../ajax.js"></script>
	<script type="text/javascript">
	function buscar() {
		var d1, contenedor, url;
		contenedor = document.getElementById('tipos_movimientos');
		contenedor2 = document.getElementById('tipo_movimiento_seleccionado');
		contenedor3 = document.getElementById('tipo_movimiento_insertado');
		d1 = document.formu.tipo_movimiento.value;
		ajax = nuevoAjax();
		url = "ajax_buscar_tipo_movimiento.php"
		param = "tipo_movimiento="+d1;
		ajax.open("POST", url, true);
		ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		ajax.onreadystatechange = function() {
			if (ajax.readyState == 4) {
				contenedor.innerHTML = ajax.responseText;
				contenedor2.innerHTML = "";
				contenedor3.innerHTML = "";
			}
		}
		ajax.send(param);
	}
	function buscar_tipo_movimiento(id_tipo_movimiento) {
		var d1, contenedor, url;
		contenedor = document.getElementById('tipo_movimiento_seleccionado');
		contenedor2 = document.getElementById('tipos_movimientos');
		document.formu.id_tipo_movimiento.value = id_tipo_movimiento;

		d1 = id_tipo_movimiento;

		ajax = nuevoAjax();
		url = "ajax_buscar_tipo_movimiento1.php";
		param = "id_tipo_movimiento="+d1;

		ajax.open("POST", url, true),
		ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		ajax.onreadystatechange = function() {
			if (ajax.readyState == 4) {
				contenedor.innerHTML = ajax.responseText;
				contenedor2.innerHTML = "";
			}
		}
		ajax.send(param);
	}
	function insertar_tipo_movimiento() {
		var d1, contenedor, url;
		contenedor = document.getElementById('tipo_movimiento_seleccionado');
		contenedor2 = document.getElementById('tipos_movimientos');
		contenedor3 = document.getElementById('tipo_movimiento_insertada');
		d1 = document.formu.tipo_movimiento1.value;
		if (d1 == "") {
			alert("El tipo movimiento es incorrecto o el campo esta vacio");
			document.formu.tipo_movimiento1.focus();
			return;
		}
		ajax = nuevoAjax();
		url = "ajax_inserta_tipo_movimiento.php";
		param = "tipo_movimiento1="+d1;
		ajax.open("POST", url, true);
		ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		ajax.onreadystatechange = function() {
			if (ajax.readyState == 4) {
				contenedor.innerHTML = "";
				contenedor2.innerHTML = "";
				contenedor3.innerHTML = ajax.responseText;
			}
		}
		ajax.send(param);
	}
	</script>
</head>
<body>	
	<center><h1>REGISTRAR MOVIMIENTO</h1></center>
	<center>
	<form action="movimiento_nuevo1.php" method="post" name="formu">
				<table border="1">
					<tr>
						<th align="right">Seleccione Tipo Movimiento (*)</th>
						<th>:</th>
						<td>
							<table>
								<tr>
									<td>
										<b>TIPO MOVIMIENTO</b><br />
										<input type="text" name="tipo_movimiento" value="" size="10" onKeyUp="buscar()">
									</td>
									
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td colspan="6">
							<table width="100%">
								<tr>
									<td colspan="3">
										<div id="tipos_movimientos"> </div>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td colspan="6">
							<table width="100%">
								<tr>
									<td colspan="3">
										<div id="tipo_movimiento_seleccionado"> </div>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td colspan="6">
							<table width="100%">
								<tr>
									<td colspan="3">
										<input type="hidden" name="id_tipo_movimiento">
										<div id="tipo_movimiento_insertada"> </div>
									</td>
								</tr>
							</table>
						</td>
					</tr>   
					<tr>
						<th align="right">Monto Movimiento (*)</th>
						<th>:</th>
						<td><input type="text" name="monto_movimiento"> </td>
					</tr>
					<tr>
						<th align="right">Fecha Movimiento (*)</th>
						<th>:</th>
						<td><input type="text" name="fecha_movimiento" class="tcal" readonly=""> </td>
					</tr>
					<tr>
						<th align="right">Moneda (*)</th>
						<th>:</th>
						<td>
						<select name="moneda">
					<option value="">--Seleccione--</option>
					{foreach item=r from=$tipos_movimientos2}
					<option value="{$r.moneda}">--{$r.moneda}--</option>
					{/foreach}
					</select>
				</td>
					</tr>
					<tr>
						<td align="center" colspan="3">
							<input type="hidden" name="accion" value=""> 
							<input type="button" value="Aceptar" onclick="validar();">
							<input type="button" value="Cancelar" onclick="javascript:location.href='movimientos.php';">
						</td>
					</tr>
				</table>
				<table>
					<tr>
						<td colspan="3" align="center"><b>(*)Campos Obligatorios</b></td>
					</tr>
				</table>
			</form>
		</center>
			
	<!--<div class="formu_ingreso_datos">
		<form action="usuario_nuevo1.php" method="post" name="formu">
			<h2>REGISTRAR USUARIO</h2>
			<b>Persona (*)</b>
			<select name="id_persona">
			<option value="">--- seleccione ---</option>
			{foreach item=r from=$personas}
			<option value="{$r.id_persona}">{$r.ap}-{$r.am}-{$r.nombres}</option>
			{/foreach}
			</select>
			<p>
			<input type="text" name="usuario" size="15" placeholder="Usuario" >(*)
			</p>
			<p>
			<input type="password" name="clave" size="15" placeholder="Clave">(*)
			</p>
			<p>
				<input type="hidden" name="accion" value="">
				<input type="button" value="Aceptar" onclick="validar();" class="boton2">
				<input type="button" value="Cancelar" onclick="javascript:location.href='usuarios.php';" class="boton2">
			</p>
			<p><b>(*)Campos Obligatorios</b></p>
		</form>
	</div>-->
</body>
</html>