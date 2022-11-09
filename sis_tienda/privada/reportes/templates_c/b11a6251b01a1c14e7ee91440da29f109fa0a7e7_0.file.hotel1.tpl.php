<?php
/* Smarty version 3.1.36, created on 2022-10-07 23:19:18
  from 'C:\wamp64\www\sis_tienda\privada\reportes\templates\hotel1.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.36',
  'unifunc' => 'content_6340b3f6a9ce72_17795608',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'b11a6251b01a1c14e7ee91440da29f109fa0a7e7' => 
    array (
      0 => 'C:\\wamp64\\www\\sis_tienda\\privada\\reportes\\templates\\hotel1.tpl',
      1 => 1664929623,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6340b3f6a9ce72_17795608 (Smarty_Internal_Template $_smarty_tpl) {
?><!DOCTYPE html>
<html>
<head>
	<?php echo '<script'; ?>
 type="text/javascript">
		var ventanaCalendario=false
		function imprimir(){
			if(confirm(' Desea Imprimir ?')){
				window.print();
			}
		}
	<?php echo '</script'; ?>
>
</head>
<body style='cursor: pointer;cursor: hand' onClick='imprimir();'>
	<table width="100%" border="0">
		<tr>
			<td><img src="../tienda/logos/<?php echo $_smarty_tpl->tpl_vars['logo']->value;?>
" width="70%"></td>
			<td align="center" width="80%"><h1>HOTELES--VIAJES</h1></td>
		</tr>
	</table>
	<br>
	<center>
		<table border="1" cellspacing="0">
			<tr>
				<th>NRO</th><th>CODIGO</th><th>AGENCIA</th><th>HOTEL</th>
			</tr>
			<?php $_smarty_tpl->_assignInScope('b', "1");?> 
			<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['viaje_hotel']->value, 'r');
$_smarty_tpl->tpl_vars['r']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['r']->value) {
$_smarty_tpl->tpl_vars['r']->do_else = false;
?>
			<tr>
				<td align="center"><?php echo $_smarty_tpl->tpl_vars['b']->value;?>
</td>
				<td><?php echo $_smarty_tpl->tpl_vars['r']->value['codigo'];?>
</td>
				<td><?php echo $_smarty_tpl->tpl_vars['r']->value['nombre'];?>
</td>
				<td><?php echo $_smarty_tpl->tpl_vars['r']->value['hotel'];?>
</td>
				<!--<td><?php echo $_smarty_tpl->tpl_vars['r']->value['telefono'];?>
</td>-->
				<?php $_smarty_tpl->_assignInScope('b', ((string)($_smarty_tpl->tpl_vars['b']->value+1)));?>
			</tr>
			<?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
		</table>
		<br><br>
		<b>Fecha:</b> <?php echo $_smarty_tpl->tpl_vars['fecha']->value;?>

	</center>
</body>
</html><?php }
}
