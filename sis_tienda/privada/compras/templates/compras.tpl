<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../{$direc_css}" type="text/css">
	<meta http-equiv="Content-type" content="text/html; charset=utf-8"/>
	<script type="text/javascript" src="../../ajax.js"></script>
	<script type="text/javascript" src="js/buscar_compra.js"></script>
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
				<h1>COMPRAS</h1>
			</div>
			<div class="titulo_nuevo">
		<form name="formNuevo" method="post" action="compra_nuevo.php">
			<a href="javascript:document.formNuevo.submit();">
				Nuevo>>>
			</a>
		</form>
	</div>
</tr>
</table>
<!-----INICIO BUSCADOR----->
	<center>
		<form action="#" method="post" name="formu">
			<table border="1" class="listado">
				<tr>
					<th>
						<b>Compra</b><br />
						<input type="text" name="compra" value="" size="10" onkeyup="buscar_compra()">
					</th>
					<th>
						<b>Nombres</b><br />
						<input type="text" name="nombres" value="" size="10" onkeyup="buscar_compra()">
					</th>
				</tr>
			</table>
		</form>
	</center>
<!-------FIN BUSCADOR------>
	<br><br>
	<center>
		<div id="compras1">
		<table class="listado">
			<tr>
				<th>NRO</th><th>COMPRA</th><th>PROVEEDOR</th>
				<th><img src="../../imagenes/editar.png"></th><th><img src="../../imagenes/eliminar.png"></th>
			</tr>
			{assign var="b" value="1"}
			{foreach item=r from=$compras}
			<tr>
				<td align="center">{$b}</td>
				<td>{$r.total_compra}</td>
				<td>{$r.nombre}</td>
				<td align="center">
					<form name="formModif{$r.id_compra}" method="post" action="compra_modificar.php">
						<input type="hidden" name="id_compra" value="{$r.id_compra}">
						<input type="hidden" name="id_proveedor" value="{$r.id_proveedor}">
						<a href="javascript:document.formModif{$r.id_compra}.submit();" title="Modificar CompraS">
							Modificar>>
						</a>
					</form>
				</td>
				<td align="center">
					<form name="formElimi{$r.id_compra}" method="post" action="compra_eliminar.php">
						<input type="hidden" name="id_compra" value="{$r.id_compra}">
						<a href="javascript:document.formElimi{$r.id_compra}.submit();" title="Eliminar Compra" onclick='javascript:return(confirm("Desea realmente Eliminar La compra:::{$r.total_compra}?"));'>
							Eliminar>>
						</a>
					</form>
				</td>
				{assign var="b" value="`$b+1`"}
				{/foreach}
			</tr>
		</table>
	</div>
	</center>
</body>
</html>