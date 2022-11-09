<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../{$direc_css}"type="text/css">
	<script type="text/javascript" src="../js/expresiones_regulares.js"></script>
	<script type="text/javascript" src="js/validar_compra.js"></script>
	<link rel="stylesheet" type="text/css" href="../calendario/tcal.css">
	<script type="text/javascript" src="../calendario/tcal.js"></script>
<script type="text/javascript" src="../../ajax.js"></script>
	<script type="text/javascript">
	function buscar() {
		var d1, contenedor, url;
		contenedor = document.getElementById('proveedores');
		contenedor2 = document.getElementById('proveedor_seleccionado');
		contenedor3 = document.getElementById('proveedor_insertado');
		d1 = document.formu.nombre.value;
		d2 = document.formu.direccion.value;
		ajax = nuevoAjax();
		url = "ajax_buscar_proveedor.php"
		param = "nombre="+d1+"&direccion="+d2;
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
	function buscar_proveedor(id_proveedor) {
		var d1, contenedor, url;
		contenedor = document.getElementById('proveedor_seleccionado');
		contenedor2 = document.getElementById('proveedores');
		document.formu.id_proveedor.value = id_proveedor;

		d1 = id_proveedor;

		ajax = nuevoAjax();
		url = "ajax_buscar_proveedor1.php";
		param = "id_proveedor="+d1;
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
	function insertar_proveedor() {
		var d1, contenedor, url;
		contenedor = document.getElementById('proveedor_seleccionado');
		contenedor2 = document.getElementById('proveedores');
		contenedor3 = document.getElementById('proveedor_insertado');
		d1 = document.formu.nombre1.value;
		d2 = document.formu.direccion1.value;
		d3 = document.formu.telefono1.value;

		if (d1 == "") {
			alert("El nombre es incorrecto o el campo esta vacio");
			document.formu.nombre1.focus();
			return;
		}
		if (d2=="") {
		alert("Por favor ingrese la direccion");
		document.formu.direccion1.focus();
		return;
	}
		ajax = nuevoAjax();
		url = "ajax_inserta_proveedor.php";
		param = "nombre1="+d1+"&direccion1="+d2+"&telefono1="+d3;
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
	<center><h1>REGISTRAR COMPRA</h1></center>
	<center>
	<form action="compra_nuevo1.php" method="post" name="formu">
				<table border="1">
					<tr>
						<th align="right">Seleccione Proveedor (*)</th>
						<th>:</th>
						<td>
							<table>
								<tr>
									<td>
										<b>Nombre</b><br />
										<input type="text" name="nombre" value="" size="10" onKeyUp="buscar()">
									</td>
									<td>
										<b>Direccion</b><br />
										<input type="text" name="direccion" value="" size="10" onKeyUp="buscar()">
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
										<div id="proveedores"> </div>
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
										<div id="proveedor_seleccionado"> </div>
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
										<input type="hidden" name="id_proveedor">
										<div id="proveedor_insertado"> </div>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<th align="right">Monto Compra (*)</th>
						<th>:</th>
						<td><input type="text" name="total_compra"> </td>
					</tr>
					<tr>
						<th align="right">Fecha Compra (*)</th>
						<th>:</th>
						<td><input type="text" name="fecha_compra" class="tcal"> </td>
					</tr>
					<tr>
						<td align="center" colspan="3">
							<input type="hidden" name="accion" value=""> 
							<input type="button" value="Aceptar" onclick="validar();">
							<input type="button" value="Cancelar" onclick="javascript:location.href='compras.php';">
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
		<form action="compra_nuevo1.php" method="post" name="formu">
			<h2>REGISTRAR COMPRA</h2>
			<b>Proveedor (*)</b>
			<select name="id_proveedor">
			<option value="">--- seleccione ---</option>
			{foreach item=r from=$proveedores}
			<option value="{$r.id_proveedor}">{$r.nombre}</option>
			{/foreach}
			</select>
			<p>
			<input type="text" name="total_compra" size="15" placeholder="Monto" >(*)
			</p>
			<p>
			<input type="text" name="fecha_compra" size="15" class="tcal" readonly="">(*)
			</p>
			<p>
				<input type="hidden" name="accion" value="">
				<input type="button" value="Aceptar" onclick="validar();" class="boton2">
				<input type="button" value="Cancelar" onclick="javascript:location.href='compras.php';" class="boton2">
			</p>
			<p><b>(*)Campos Obligatorios</b></p>
		</form>
	</div>-->
</body>
</html>