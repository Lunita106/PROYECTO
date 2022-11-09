<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../{$direc_css}" type="text/css">
	<meta http-equiv="Content-type" content="text/html; charset=utf-8"/>
	<script type="text/javascript" src="../../ajax.js"></script>
	<script type="text/javascript" src="js/buscar_movimiento.js"></script>		
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
			<tr>
				{foreach item=r from=$movimientos}
				<option value="{$r.id_tipo_movimiento}">{$r.monto_movimiento}</option>
				{/foreach}
			</tr>
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
			{assign var="b" value='1'}
			{foreach item=r from=$movimientos}
			<tr>
				<td align="center">{$b}</td>
				<td align="center">{$r.tipo_movimiento}</td>
				<td align="center">{$r.monto_movimiento}</td>
				<td align="center">{$r.fecha_movimiento}</td>
				<td align="center">{$r.moneda}</td>
				
				{assign var="b" value="`$b+1`"}
				{/foreach}
			</tr>
		</table>
<!--FIN PAGINACION------------------------->
	</div>
	</center>
</body>
</html>
