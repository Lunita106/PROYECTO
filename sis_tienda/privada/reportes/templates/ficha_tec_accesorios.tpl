<!DOCTYPE html>
<html lang="esp">
<head>
	<link rel="stylesheet" href="../{$direc_css}" type="text/css">
	<meta charset="utf-8">
	<script type="text/javascript" src="../../ajax.js"></script>
	<script type="text/javascript">
		function buscar(){
			var d1, d2, contenedor, ajax, url, param;
			contenedor = document.getElementById('accesorios1')
			d1= document.formu.nombre.value;
			d2= document.formu.modelo.value;
			ajax = nuevoAjax();
			url = "ajax_buscar_accesorio.php"
			param = "nombre="+d1+"&modelo="+d2;
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
function mostrar(id_accesorio) {
	var d1, ventanaCalendario;
	d1 = id_accesorio;
	//alert(id_persona);
	ventanaCalendario = window.open("ficha_tec_accesorios1.php?id_accesorio="+d1, "calendario", "width=600,height=500,left=100,top=100,scrollbars=yes,menubars=no,statusbar=NO,status=N0,resizable=YES,location=NO")
}
	</script>
	
</head>
<body>
	<!-----INICIO BUSCADOR----->
	<div class="titulo_listado">
		<h1>
			FICHA TECNICA ACCESORIOS
		</h1>
	<center>
		<form action="#" method="post" name="formu">
			<table border="1" class="listado">
				<tr>
					<th>
						<b>Accesorio</b><br />
						<input type="text" name="nombre" value="" size="10" onkeyup="buscar()">
					</th>
					<th>
						<b>Modelo</b><br />
						<input type="text" name="modelo" value="" size="10" onkeyup="buscar()">
					</th>
				</tr>
			</table>
		</form>
	</center>
<!-------FIN BUSCADOR------>
<center>
	<div id="accesorios1">
	</div>
</center>
</body>
</html>