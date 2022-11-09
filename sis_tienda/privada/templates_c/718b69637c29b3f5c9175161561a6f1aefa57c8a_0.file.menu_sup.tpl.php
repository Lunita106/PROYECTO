<?php
/* Smarty version 3.1.36, created on 2022-10-07 01:34:52
  from 'C:\wamp64\www\sis_tienda\privada\templates\menu_sup.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.36',
  'unifunc' => 'content_633f823cc736c8_58951843',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '718b69637c29b3f5c9175161561a6f1aefa57c8a' => 
    array (
      0 => 'C:\\wamp64\\www\\sis_tienda\\privada\\templates\\menu_sup.tpl',
      1 => 1659670727,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_633f823cc736c8_58951843 (Smarty_Internal_Template $_smarty_tpl) {
?><!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['direc_css']->value;?>
" type="text/css">
</head>
<body>
	<div class="cabecera">
		<img src="tienda/logos/<?php echo $_smarty_tpl->tpl_vars['logo']->value;?>
"  width="6%">
		<div class="titulo">
			TIENDA DE ACCESORIOS "<?php echo $_smarty_tpl->tpl_vars['nombre']->value;?>
"
		</div>
		<div class="usuario">
			Usuario:<b><?php echo $_smarty_tpl->tpl_vars['sesion']->value['usuario'];?>
</b>
			Rol: <b><?php echo $_smarty_tpl->tpl_vars['sesion']->value['rol'];?>
</b>
		</div>
	</div>
</body>
</html><?php }
}
