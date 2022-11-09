<!DOCTYPE html>
<html lang="esp">
<head>
	<link rel="stylesheet" href="../{$direc_css}" type="text/css">
	<meta charset="utf-8">
	<script type="text/javascript" src="../../ajax.js"></script>
	<script type="text/javascript">
		function buscar(){
			var d1, d2,d3, contenedor, ajax, url, param;
			contenedor = document.getElementById('hoteles1')
			d1= document.formu.hotel.value;
			d2= document.formu.nombre.value;
			d3= document.formu.ciudad.value;
			ajax = nuevoAjax();
			url = "ajax_buscar_hotel.php"
			param = "hotel="+d1+"&nombre="+d2+"&ciudad="+d3;
//alert(param);
ajax.open("POST", url, true);
ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
ajax.onreadystatechange = function() {
	if (ajax.readyState == 4) {
		contenedor.innerHTML = ajax.responseText;
	}
}
ajax.send(param);
}
function mostrar(id_hotel) {
	var d1, ventanaCalendario;
	d1 = id_hotel;
	//alert(id_persona);
	ventanaCalendario = window.open("fthotel1.php?id_hotel="+d1, "calendario", "width=600,height=500,left=100,top=100,scrollbars=yes,menubars=no,statusbar=NO,status=N0,resizable=YES,location=NO")
}
	</script>
	
</head>
<body>
	<!-----INICIO BUSCADOR----->
	<div class="titulo_listado">
		<h1>
			FICHA TECNICA HOTEL
		</h1>
	<center>
		<form action="#" method="post" name="formu">
			<table border="1" class="listado">
				<tr>
					<th>
			<b>AGENCIA VIAJES</b><br>
			<select name="nombre" onchange="buscar()">
			<option value="">---seleccione---</option>
			{foreach item=r from=$viajes}
			<option value="{$r.nombre}">{$r.nombre}</option>
			{/foreach}
			</select>	
			</th>
					<th>
						<b>Nombre Hotel</b><br />
						<input type="text" name="hotel" value="" size="10" onkeyup="buscar()">
					</th>
					<th>
						<b>Ciudad</b><br />
						<input type="text" name="ciudad" value="" size="10" onkeyup="buscar()">
					</th>
				</tr>
			</table>
		</form>
	</center>
<!-------FIN BUSCADOR------>
<center>
	<div id="hoteles1">
	</div>
</center>
</body>
</html>