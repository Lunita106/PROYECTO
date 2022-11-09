<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../{$direc_css}"type="text/css">
	<script type="text/javascript" src="../js/expresiones_regulares.js"></script>
	<script type="text/javascript" src="js/validar_venta.js"></script>
	<link rel="stylesheet" type="text/css" href="../calendario/tcal.css">
	<script type="text/javascript" src="../calendario/tcal.js"></script>
	<script type="text/javascript" src="../../ajax.js"></script>
	<script type="text/javascript">
	function buscar() {
		var d1, contenedor, url;
		contenedor = document.getElementById('clientes');
		contenedor2 = document.getElementById('cliente_seleccionado');
		contenedor3 = document.getElementById('cliente_insertado');
		d1 = document.formu.nombre.value;
		d2 = document.formu.apellido.value;
		d3 = document.formu.ci.value;
		ajax = nuevoAjax();
		url = "ajax_buscar_cliente.php"
		param = "nombre="+d1+"&apellido="+d2+"&ci="+d3;
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
	function buscar_cliente(id_cliente) {
		var d1, contenedor, url;
		contenedor = document.getElementById('cliente_seleccionado');
		contenedor2 = document.getElementById('clientes');
		document.formu.id_cliente.value = id_cliente;

		d1 = id_cliente;

		ajax = nuevoAjax();
		url = "ajax_buscar_cliente1.php";
		param = "id_cliente="+d1;
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
	function insertar_cliente() {
		var d1, contenedor, url;
		contenedor = document.getElementById('cliente_seleccionado');
		contenedor2 = document.getElementById('clientes');
		contenedor3 = document.getElementById('cliente_insertado');
		d1 = document.formu.nombre1.value;
		d2 = document.formu.apellido1.value;
		d3 = document.formu.ci1.value;
		d4 = document.formu.direccion1.value;
		d5 = document.formu.email1.value;
		d6 = document.formu.telefono1.value;

		if (d1 == "") {
			alert("El nombre es incorrecto o el campo esta vacio");
			document.formu.nombre1.focus();
			return;
		}
		if (d2 == "") {
			alert("El apellido es incorrecto o el campo esta vacio");
			document.formu.apellido1.focus();
			return;
		}
		if (d3 == "") {
			alert("El ci es incorrecto o el campo esta vacio");
			document.formu.ci1.focus();
			return;
		}
		if (d4 =="") {
		alert("Por favor ingrese la direccion");
		document.formu.direccion1.focus();
		return;
	}
		ajax = nuevoAjax();
		url = "ajax_inserta_cliente.php";
		param = "nombre1="+d1+"&apellido1="+d2+"&ci1="+d3+"&direccion1="+d4+"&email1="+d5+"&telefono1="+d6;
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
	<center><h1>REGISTRAR VENTA</h1></center>
	<center>
	<form action="venta_nuevo1.php" method="post" name="formu">
				<table border="1">
					<tr>
						<th align="right">Seleccione Venta (*)</th>
						<th>:</th>
						<td>
							<table>
								<tr>
									<td>
										<b>Nombre</b><br />
										<input type="text" name="nombre" value="" size="10" onKeyUp="buscar()">
									</td>
									<td>
										<b>Apellido</b><br />
										<input type="text" name="apellido" value="" size="10" onKeyUp="buscar()">
									</td>
									<td>
										<b>C.I.</b><br />
										<input type="text" name="ci" value="" size="10" onKeyUp="buscar()">
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
										<div id="clientes"> </div>
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
										<div id="cliente_seleccionado"> </div>
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
										<input type="hidden" name="id_cliente">
										<div id="cliente_insertado"> </div>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<th align="right">Monto Venta (*)</th>
						<th>:</th>
						<td><input type="text" name="total_venta"> </td>
					</tr>
					<tr>
						<th align="right">Fecha Venta (*)</th>
						<th>:</th>
						<td><input type="text" name="fecha_venta" class="tcal"> </td>
					</tr>
					<tr>
						<td align="center" colspan="3">
							<input type="hidden" name="accion" value=""> 
							<input type="button" value="Aceptar" onclick="validar();">
							<input type="button" value="Cancelar" onclick="javascript:location.href='ventas.php';">
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
<!--</head>
<body>
	<div class="formu_ingreso_datos">
		<form action="venta_nuevo1.php" method="post" name="formu">
			<h2>REGISTRAR VENTA</h2>
			<b>Vendedor (*)</b>
			<select name="id_vendedor">
			<option value="">--- seleccione ---</option>
			{foreach item=r from=$vendedores}
			<option value="{$r.id_vendedor}">{$r.nombre}</option>
			{/foreach}
			</select>
			<p>
			<b>Cliente (*)</b>
			<select name="id_cliente">
			<option value="">--- seleccione ---</option>
			{foreach item=r from=$clientes}
			<option value="{$r.id_cliente}">{$r.nombre}</option>
			{/foreach}
			</select>
		    </p>
			<p>
			<input type="text" name="total_venta" size="15" placeholder="Monto" >(*)
			</p>
			<p>
			<input type="text" name="fecha_venta" size="15" class="tcal" readonly="">(*)
			</p>
			<p>
				<input type="hidden" name="accion" value="">
				<input type="button" value="Aceptar" onclick="validar();" class="boton2">
				<input type="button" value="Cancelar" onclick="javascript:location.href='ventas.php';" class="boton2">
			</p>
			<p><b>(*)Campos Obligatorios</b></p>
		</form>
	</div>-->
</body>
</html>