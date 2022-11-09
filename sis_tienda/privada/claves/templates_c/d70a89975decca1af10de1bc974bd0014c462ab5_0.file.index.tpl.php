<?php
/* Smarty version 3.1.36, created on 2022-10-07 22:31:30
  from 'C:\wamp64\www\sis_tienda\privada\claves\templates\index.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.36',
  'unifunc' => 'content_6340a8c201db56_96845923',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'd70a89975decca1af10de1bc974bd0014c462ab5' => 
    array (
      0 => 'C:\\wamp64\\www\\sis_tienda\\privada\\claves\\templates\\index.tpl',
      1 => 1652404512,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6340a8c201db56_96845923 (Smarty_Internal_Template $_smarty_tpl) {
?><!DOCTYPE html>
<head> 
	<link rel="stylesheet" href="../<?php echo $_smarty_tpl->tpl_vars['direc_css']->value;?>
" type="text/css">
	<?php echo '<script'; ?>
 type="text/javascript">
		function refrescar() {
			var p = window.parent;
			p.location.href='../';
		}
	<?php echo '</script'; ?>
>
</head>
<body ONLOAD="self.setTimeout('refrescar()',5000);">
	<center>
		<h1><?php echo $_smarty_tpl->tpl_vars['mensage']->value;?>
</h1>
		<h3 style="color:#1B191E;font-size:40px;"><?php echo $_smarty_tpl->tpl_vars['nom_completo']->value;?>
</h3>
		<br>
		<h1><?php echo $_smarty_tpl->tpl_vars['mensage1']->value;?>
</h1>
	</center>
</body>
</html><?php }
}
