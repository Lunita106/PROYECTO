<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../{$direc_css}" type="text/css">
	<meta http-equiv="Content-type" content="text/html; charset=utf-8"/>
</head>
<body>
	<table width="100%" border="0">
		<tr>
			<td width="33%">
				<table border="0">
					<tr>
						
					</tr>
				</table>
				<div class="titulo_listado">
				<h1>ACCESORIOS</h1>
		</div>
			<div class="titulo_nuevo">
		<form name="formNuevo" method="post" action="accesorio_nuevo.php">
			<a href="javascript:document.formNuevo.submit();">
				Nuevo>>>
			</a>
		</form>
</div>
</table>
	<center>
		<table class="listado">
			<tr>
				<th>NRO</th><th>ACCESORIO</th><th>MODELO</th><th>MARCA</th><th>PROVEEDOR</th>
				<th><img src="../../imagenes/editar.png"></th><th><img src="../../imagenes/eliminar.png"></th>
			</tr>
			{assign var="b" value="1"}
			{foreach item=r from=$accesorios}
			<tr>
				<td align="center">{$b}</td>
				<td>{$r.nombre_accesorio}</td>
				<td>{$r.modelo}</td>
				<td>{$r.marca}</td>
				<td>{$r.nombre_proveedor}</td>
				<td align="center">
					<form name="formModif{$r.id_accesorio}" method="post" action="accesorio_modificar.php">
						<input type="hidden" name="id_accesorio" value="{$r.id_accesorio}">
						<input type="hidden" name="id_marca" value="{$r.id_marca}">
						<input type="hidden" name="id_proveedor" value="{$r.id_proveedor}">
						<a href="javascript:document.formModif{$r.id_accesorio}.submit();" title="Modificar AccesorioS">
							Modificar>>
						</a>
					</form>
				</td>
				<td align="center">
					<form name="formElimi{$r.id_accesorio}" method="post" action="accesorio_eliminar.php">
						<input type="hidden" name="id_accesorio" value="{$r.id_accesorio}">
						<a href="javascript:document.formElimi{$r.id_accesorio}.submit();" title="Eliminar Accesorio" onclick='javascript:return(confirm("Desea realmente Eliminar al Accesorio:::{$r.nombre_accesorio}?"));'>
							Eliminar>>
						</a>
					</form>
				</td>
				{assign var="b" value="`$b+1`"}
				{/foreach}
			</tr>
		</table>
	</center>
</body>
</html>