<?php
/* Smarty version 3.1.36, created on 2022-10-07 23:01:23
  from 'C:\wamp64\www\sis_tienda\privada\institutos\templates\instituto_nuevo.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.36',
  'unifunc' => 'content_6340afc374a0c7_48450079',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'e7d9f7856c9f102a089735f4c0e66fed415220f6' => 
    array (
      0 => 'C:\\wamp64\\www\\sis_tienda\\privada\\institutos\\templates\\instituto_nuevo.tpl',
      1 => 1665183678,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6340afc374a0c7_48450079 (Smarty_Internal_Template $_smarty_tpl) {
?><!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../<?php echo $_smarty_tpl->tpl_vars['direc_css']->value;?>
"type="text/css">
	<?php echo '<script'; ?>
 type="text/javascript" src="../js/expresiones_regulares.js"><?php echo '</script'; ?>
>
	<?php echo '<script'; ?>
 type="text/javascript" src="js/validar_instituto.js"><?php echo '</script'; ?>
>
	<?php echo '<script'; ?>
 type="text/javascript" src="../../ajax.js"><?php echo '</script'; ?>
>
	<?php echo '<script'; ?>
 type="text/javascript">
	function buscar() {
		var d1,d2,d3, contenedor, url;
		contenedor = document.getElementById('institutos');
		contenedor2 = document.getElementById('instituto_seleccionado');
		contenedor3 = document.getElementById('instituto_insertado');
		d1 = document.formu.nombre.value;
		d2 = document.formu.direccion.value;
		d3 = document.formu.telefono.value;
		ajax = nuevoAjax();
		url = "ajax_buscar_carrera.php"
		param = "nombre="+d1+"&direccion="+d2+"&telefono="+d3;
		ajax.open("POST", url, true);
		ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		ajax.onreadystatechange = function() {
			if (ajax.readyState == 4) {
				contenedor.innerHTML = ajax.responseText;
				contenedor2.innerHTML = "";
				
			}
		}
		ajax.send(param);
	}
	function buscar_instituto(id_instituto) {
		var d1, contenedor, url;
		contenedor = document.getElementById('instituto_seleccionado');
		contenedor2 = document.getElementById('institutos');
		document.formu.id_instituto.value = id_instituto;

		d1 = id_instituto;

		ajax = nuevoAjax();
		url = "ajax_buscar_carrera1.php";
		param = "id_instituto="+d1;
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
	function insertar_instituto() {
		var d1, contenedor, url;
		contenedor = document.getElementById('instituto_seleccionado');
		contenedor2 = document.getElementById('institutos');
		contenedor3 = document.getElementById('instituto_insertado');
		d1 = document.formu.nombre1.value;
		d2 = document.formu.direccion1.value;
		d3 = document.formu.telefono1.value;
		d4 = document.formu.pag_web1.value;
		d5 = document.formu.resol_min1.value;
		d6 = document.formu.mision1.value;
		d7 = document.formu.vision1.value;

		if (d1 == "") {
			alert("Por favor ingrese el nombre del instituto");
			document.formu.nombre1.focus();
			return;
		}
		
		if (d2 == "") {
			alert("Por favor ingrese la direccion del instituto");
			document.formu.direccion1.focus();
			return;
		}
		if((!v22.test(d3)) || (d3 == "")){
		alert("El telefono es incorrectoo el campo esta vacio");
		document.formu.monto_movimiento.focus();
		return;
	}
		if (d4 == "") {
			alert("Por favor ingrese la pagina web del instituto");
			document.formu.pag_web1.focus();
			return;
		}
		ajax = nuevoAjax();
		url = "ajax_inserta_institutos.php";
		param = "nombre1="+d1+"&direccion1="+d2+"&telefono1="+d3+"&pag_web1="+d4+"&resol_min1="+d5+"&mision1="+d6+"&vision1="+d7;
		alert(param);
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
	<?php echo '</script'; ?>
>
</head>
<body>	
	<center><h1>REGISTRAR CARRERA</h1></center>
	<center>
	<form action="instituto_nuevo1.php" method="post" name="formu">
				<table border="1">
					<tr>
						<th align="right">Seleccione Instituto (*)</th>
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
									<td>
										<b>Telefono</b><br />
										<input type="text" name="telefono" value="" size="10" onKeyUp="buscar()">
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
										<div id="institutos"> </div>
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
										<div id="instituto_seleccionado"> </div>
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
										<input type="hidden" name="id_instituto">
										<div id="instituto_insertado"></div>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<th align="right">Carrera (*)</th>
						<th>:</th>
						<td><input type="text" name="carrera" onkeyup="this.value=this.value.toUpperCase()"> </td>
					</tr>
					<tr>
						<th align="right">Direccion (*)</th>
						<th>:</th>
						<td><input type="text" name="direccion2" onkeyup="this.value=this.value.toUpperCase()"> </td>
					</tr>
					<tr>
						<th align="right">Telefono</th>
						<th>:</th>
						<td><input type="text" name="telefono2"> </td>
					</tr>
					<tr>
						<th align="right">Grado Academico</th>
						<th>:</th>
						<td><input type="text" name="grado_academico" onkeyup="this.value=this.value.toUpperCase()"> </td>
					</tr>
					<tr>
						<th align="right">Descripcion</th>
						<th>:</th>
						<td><input type="text" name="descripcion" onkeyup="this.value=this.value.toUpperCase()"> </td>
					</tr>
					<tr>
						<th align="right">Duracion</th>
						<th>:</th>
						<td><input type="text" name="duracion" onkeyup="this.value=this.value.toUpperCase()"> </td>
					</tr>
					<tr>
						<td align="center" colspan="3">
							<input type="hidden" name="accion" value=""> 
							<input type="button" value="Aceptar" onclick="validar();">
							<input type="button" value="Cancelar" onclick="javascript:location.href='institutos.php';">
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
			<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['personas']->value, 'r');
$_smarty_tpl->tpl_vars['r']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['r']->value) {
$_smarty_tpl->tpl_vars['r']->do_else = false;
?>
			<option value="<?php echo $_smarty_tpl->tpl_vars['r']->value['id_persona'];?>
"><?php echo $_smarty_tpl->tpl_vars['r']->value['ap'];?>
-<?php echo $_smarty_tpl->tpl_vars['r']->value['am'];?>
-<?php echo $_smarty_tpl->tpl_vars['r']->value['nombres'];?>
</option>
			<?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
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
</html><?php }
}
