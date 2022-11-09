<?php
/* Smarty version 3.1.36, created on 2022-10-07 01:34:52
  from 'C:\wamp64\www\sis_tienda\privada\templates\cuerpo.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.36',
  'unifunc' => 'content_633f823ced1b72_38576469',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'c05d03c261ed5e2862bb0d337da7be205e2672ee' => 
    array (
      0 => 'C:\\wamp64\\www\\sis_tienda\\privada\\templates\\cuerpo.tpl',
      1 => 1652300789,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_633f823ced1b72_38576469 (Smarty_Internal_Template $_smarty_tpl) {
?><!DOCTYPE html>
<head>
	<link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['direc_css']->value;?>
" type="text/css">
</head>
<body>
	<form action="claves/" method="post" target="cuerpo">
		<?php if ($_smarty_tpl->tpl_vars['nick']->value == '') {?>
		<div class="formu_ingreso">
			<p><h2>Ingresar al sistema</h2></p>
			<p><h2>Usuario:</h2><input type="text" name="nick"  size="30" value="" class="limpiar" style="box-shadow: -2px 2px 5px 000000;"></p>
			<p><h2>Clave:</h2><input type="password" name="password" size="30" value="" style="box-shadow: -2px 2px 5px 000000;"></p>
			<input type="submit" name="accion" value="Ingresar" size="5" class="boton">
		</div>
		<?php }?>
	</form>
</body>
</html><?php }
}
