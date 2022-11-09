<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../{$direc_css}" type="text/css" >
	<meta http-equiv="Content-type" content="text/html; charset=utf-8">
	<script type="text/javascript" src="../../ajax.js"></script>
	<script type="text/javascript" src="js/buscar_institutos.js"></script>
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
                 {foreach item=r from=$institutos}
                 <option value="{$r.nombre}"> {$r.nombre}  </option>
                 {/foreach}
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
			{assign var="b" value='1'}
			{foreach item=r from=$carreras}
			<tr>
				<td align="center">{$b}</td>
				<td>{$r.nombre}</td>
				<td>{$r.carrera}</td>
				<td>{$r.direccion}</td>
				<td>{$r.telefono}</td>
				{assign var="b" value="`$b+1`"}
				{/foreach}
			</tr>

		</table>
</div>
	</center>
</body>
</html>
