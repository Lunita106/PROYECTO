<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../{$direc_css}" type="text/css">
	<meta http-equiv="Content-type" content="text/html; charset=utf-8"/>
	<script type="text/javascript" src="../../ajax.js"></script>
	<script type="text/javascript" src="js/buscar_cliente.js"></script>
</head>
<body>
	<div class="titulo_listado">
		<h1>
			CLIENTES
		</h1>
	</div>
	<div class="titulo_nuevo">
		<form name="formNuevo" method="post" action="cliente_nuevo.php">
			<a href="javascript:document.formNuevo.submit();">
				Nuevo>>>
			</a>
		</form>
	</div>
	<!-----INICIO BUSCADOR----->
	<center>
		<form action="#" method="post" name="formu">
			<table border="1" class="listado">
				<tr>
					<th>
						<b>Apellidos</b><br />
						<input type="text" name="apellidos" value="" size="10" onkeyup="buscar_cliente()">
					</th>
					<th>
						<b>Nombres</b><br />
						<input type="text" name="nombres" value="" size="10" onkeyup="buscar_cliente()">
					</th>
					<th>
						<b>Direccion</b><br />
						<input type="text" name="direccion" value="" size="10" onkeyup="buscar_cliente()">
					</th>
					<th>
						<b>C.I.</b><br />
						<input type="text" name="ci" value="" size="10" onkeyup="buscar_cliente()">
					</th>
				</tr>
			</table>
		</form>
	</center>
<!-------FIN BUSCADOR------>
	<br><br>

	<center>
		<div id="clientes1">
		<table class="listado">
			<tr>
				<th>NRO</th><th>NOMBRE</th><th>APELLIDO</th><th>CI</th><th>DIRECCION</th><th>EMAIL</th><th>TELEFONO</th>
				<th><img src="../../imagenes/editar.png"></th><th><img src="../../imagenes/eliminar.png"></th>
			</tr>
			{assign var="b" value="0"}
			{assign var="total" value="`$pagina-1`"} 
        	{assign var="a" value="`$numreg*$total`"}
       	    {assign var="b" value="`$b+1+$a`"}   
			{foreach item=r from=$clientes}
			<tr>
				<td align="center">{$b}</td>
				<td>{$r.nombre}</td>
				<td align="center">{$r.apellido}</td>
				<td>{$r.ci}</td>
				<td>{$r.direccion}</td>
				<td>{$r.email}</td>
				<td>{$r.telefono}</td>
				<td align="center">
					<form name="formModif{$r.id_cliente}" method="post" action="cliente_modificar.php">
						<input type="hidden" name="id_cliente" value="{$r.id_cliente}">
						<a href="javascript:document.formModif{$r.id_cliente}.submit();" title="Modificar Cliente Sistema">
							Modificar>>
						</a>
					</form>
				</td>
				<td align="center">
					<form name="formElimi{$r.id_cliente}" method="post" action="cliente_eliminar.php">
						<input type="hidden" name="id_cliente" value="{$r.id_cliente}">
						<a href="javascript:document.formElimi{$r.id_cliente}.submit();" title="Eliminar Cliente Sistema" onclick="javascript:return(confirm('Desea realmente Eliminar al Cliente:{$r.nombre} {$r.apellido}?')); location.href='cliente_eliminar.php'">
							Eliminar>>
						</a>
					</form>
				</td>
				{assign var="b" value="`$b+1`"}
				{/foreach}
			</tr>
		</table>
		<!--PAGINACION-------------------------->
		<table>
			<tr align="center">
				<td>
					{if !empty($urlback)}
					<a onclick="location.href='{$urlback}'" style="font-family: Verdana;font-size: 9px;cursor: pointer;color: #000000;";>&laquo; Anterior</a>
					{/if}
					{if !empty($paginas)}
					{foreach from=$paginas item=pag}
					{if $pag.npag == $pagina}
					{if $pagina neq '1'}|{/if}
					<b style="color: #000000; font-size: 12px;">{$pag.npag}</b>
					{else}|
					<a onclick="location.href='{$pag.pagV}'" style="cursor: pointer;color: #000000;">{$pag.npag}</a>
					{/if}
					{/foreach}
					{/if}
					{if $numpaginas gt $numbotones and !empty($urlnext) and $pagina lt $numpaginas}
					|<a onclick="location.href='{$urlnext}'" style="font-family: Vernada;font-size: 9px;cursor:pointer;color: #000000;">Siguiente&raquo;</a>
					{/if}
				</td>
			</tr>
		</table>
	</div>
	</center>
</body>
</html>