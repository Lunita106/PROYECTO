<?php
/* Smarty version 3.1.36, created on 2022-10-07 01:34:53
  from 'C:\wamp64\www\sis_tienda\privada\institutos\templates\institutos.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.36',
  'unifunc' => 'content_633f823df40e52_69889467',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'f7471c63a7e4fff74812c4797aae70813bd0fabd' => 
    array (
      0 => 'C:\\wamp64\\www\\sis_tienda\\privada\\institutos\\templates\\institutos.tpl',
      1 => 1665015273,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_633f823df40e52_69889467 (Smarty_Internal_Template $_smarty_tpl) {
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
 type="text/javascript" src="js/buscar_institutos.js"><?php echo '</script'; ?>
>
</head>
<body>
	<table width="50%" border="0">
		<tr>
			<td width="33%">
				<table border="0">
					<tr>
					</tr>
				</table>
			</td>
			<td align="center" width="20%">
				<h1>INSTITUTOS</h1>
			</td>
			<td align="right" width="33%">
				<form name="formNuveo" method="post" action="instituto_nuevo.php">
					<a href="javascript:document.formNuveo.submit();">
						Nuevo>>>
					</a>
				</form>
			</td>
		</tr>
	</table>
	<center>
      <form action="#" method="post" name="formu">
     		<table border="1" class="listado">
     			<tr>
            <th>
              <b>Instituto</b><br />
             <p>
                 <select name="nombre" onchange="buscar_instituto()">
                 <option value="">--Seleccione--</option>
                 <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['institutos']->value, 'r');
$_smarty_tpl->tpl_vars['r']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['r']->value) {
$_smarty_tpl->tpl_vars['r']->do_else = false;
?>
                 <option value="<?php echo $_smarty_tpl->tpl_vars['r']->value['nombre'];?>
"> <?php echo $_smarty_tpl->tpl_vars['r']->value['nombre'];?>
  </option>
                 <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
                 </select>
             </p>
            </th>
     				<th>
     					<b>Carrera</b><br />
     					<input type="text" name="carrera" value="" size="10" onkeyup="buscar_instituto()">
     				</th>
     				<th>
     					<b>Direccion</b><br />
     					<input type="text" name="direccion" value="" size="10" onkeyup="buscar_instituto()">
     				</th>
     			</tr>
     		</table>
     	</form>
     </center>
      <center>
    <div id='institutos1'>
		<table class="listado">
			<tr>
				<th>NRO</th><th>INSTITUTO</th><th>CARRERA</th><th>DIRECCION</th><th>TELEFONO</th>
			<?php $_smarty_tpl->_assignInScope('b', '1');?>
			<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['carreras']->value, 'r');
$_smarty_tpl->tpl_vars['r']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['r']->value) {
$_smarty_tpl->tpl_vars['r']->do_else = false;
?>
			<tr>
				<td align="center"><?php echo $_smarty_tpl->tpl_vars['b']->value;?>
</td>
				<td><?php echo $_smarty_tpl->tpl_vars['r']->value['nombre'];?>
</td>
				<td><?php echo $_smarty_tpl->tpl_vars['r']->value['carrera'];?>
</td>
				<td><?php echo $_smarty_tpl->tpl_vars['r']->value['direccion'];?>
</td>
				<td><?php echo $_smarty_tpl->tpl_vars['r']->value['telefono'];?>
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
