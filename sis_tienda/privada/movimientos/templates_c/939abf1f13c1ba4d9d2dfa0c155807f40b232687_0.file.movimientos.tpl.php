<?php
/* Smarty version 3.1.36, created on 2022-10-07 01:45:37
  from 'C:\wamp64\www\sis_tienda\privada\movimientos\templates\movimientos.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.36',
  'unifunc' => 'content_633f84c14eb2d3_17622260',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '939abf1f13c1ba4d9d2dfa0c155807f40b232687' => 
    array (
      0 => 'C:\\wamp64\\www\\sis_tienda\\privada\\movimientos\\templates\\movimientos.tpl',
      1 => 1665015160,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_633f84c14eb2d3_17622260 (Smarty_Internal_Template $_smarty_tpl) {
?><!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../<?php echo $_smarty_tpl->tpl_vars['direc_css']->value;?>
" type="text/css" >
	<meta http-equiv="Content-type" content="text/html; charset=utf-8">
		<?php echo '<script'; ?>
 type="text/javascript" src="../../ajax.js"><?php echo '</script'; ?>
>
		<?php echo '<script'; ?>
 type="text/javascript">
			
			function buscar_movimiento(){
			
			var d1, d2, d3, ajax, contenedor, url, param;
			contenedor = document.getElementById('movimientos1');
			
			d1 = document.formu.tipo_movimiento.value;
			d2 = document.formu.monto_movimiento.value;
			d3 = document.formu.moneda.value;

			ajax = nuevoAjax();
			url = "ajax_buscar_movimiento.php"
			param = "tipo_movimiento="+d1+"&monto_movimiento="+d2+"&moneda="+d3;
			ajax.open("POST",url,true);
			ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
			ajax.onreadystatechange = function(){
				if (ajax.readyState == 4){
					contenedor.innerHTML = ajax.responseText;
				}
			}
			ajax.send(param);
		}
		<?php echo '</script'; ?>
>
		
</head>
<body>
	<table width="100%" border="0">
		<tr>
			<td width="33%">
				<table border="0">
					<tr>
					</tr>
				</table>
			</td>
			<td align="center" width="33%">

				<h1>MOVIMIENTOS</h1>
			</td>
			<td align="right" width="33%">
				<form name="formNuveo" method="post" action="movimiento_nuevo.php">
					<a href="javascript:document.formNuveo.submit();">
						Nuevo>>>
					</a>
				</form>
			</td>
		</tr>
	</table>
		<!-- INICIO BUSCADOR-->
	<center>
	<form action="#" method="post" name="formu">
	<table border="1" class="listado">
		<tr>
			<th>
			<b>TIPO MOVIMIENTO</b><br>
			<select name="tipo_movimiento" onchange="buscar_movimiento()">
			<option value="">---seleccione---</option>
			<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['tipos_movimientos']->value, 'r');
$_smarty_tpl->tpl_vars['r']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['r']->value) {
$_smarty_tpl->tpl_vars['r']->do_else = false;
?>
			<option value="<?php echo $_smarty_tpl->tpl_vars['r']->value['tipo_movimiento'];?>
"><?php echo $_smarty_tpl->tpl_vars['r']->value['tipo_movimiento'];?>
</option>
			<?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
			</select>	
			</th>
			<th>
			<b>MONTO MOVIMIENTO</b><br>
				<input type="text" name="monto_movimiento" value="" size="10" onkeyup="buscar_movimiento()">
			</th>
			<th>
			<b>MONEDA</b><br>
				<input type="text" name="moneda" value="" size="10" onkeyup="buscar_movimiento()">
			</th>
		</tr>
	</table>	
	</form>	
	</center>

	<!-- FIN BUSCADOR-->

	<center>
		<div id="movimientos1">
		<table class="listado">
			<tr>
				<th>NRO</th><th>TIPO MOVIMIENTO</th><th>MONTO MOVIMIENTO</th><th>FECHA MOVIMIENTO</th><th>MONEDA</th>
			</tr>
			<?php $_smarty_tpl->_assignInScope('b', '1');?>
			<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['movimientos']->value, 'r');
$_smarty_tpl->tpl_vars['r']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['r']->value) {
$_smarty_tpl->tpl_vars['r']->do_else = false;
?>
			<tr>
				<td align="center"><?php echo $_smarty_tpl->tpl_vars['b']->value;?>
</td>
				<td align="center"><?php echo $_smarty_tpl->tpl_vars['r']->value['tipo_movimiento'];?>
</td>
				<td align="center"><?php echo $_smarty_tpl->tpl_vars['r']->value['monto_movimiento'];?>
</td>
				<td align="center"><?php echo $_smarty_tpl->tpl_vars['r']->value['fecha_movimiento'];?>
</td>
				<td align="center"><?php echo $_smarty_tpl->tpl_vars['r']->value['moneda'];?>
</td>
				
				<?php $_smarty_tpl->_assignInScope('b', ((string)($_smarty_tpl->tpl_vars['b']->value+1)));?>
				<?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
			</tr>
		</table>
	</div>
	</center>
</body>
</html>
<?php }
}
