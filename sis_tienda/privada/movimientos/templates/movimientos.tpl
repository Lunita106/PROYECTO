<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../{$direc_css}" type="text/css" >
	<meta http-equiv="Content-type" content="text/html; charset=utf-8">
		<script type="text/javascript" src="../../ajax.js"></script>
		<script type="text/javascript">
			
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
		</script>
		
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
			{foreach item=r from=$tipos_movimientos}
			<option value="{$r.tipo_movimiento}">{$r.tipo_movimiento}</option>
			{/foreach}
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
	</div>
	</center>
</body>
</html>
