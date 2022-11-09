"use strict"
function buscar_cliente(){
	var d1, d2,d3, d4, ajax, url, param, contenedor;
	contenedor = document.getElementById('clientes1');
	d1 = document.formu.apellidos.value;
	d2 = document.formu.nombres.value;
	d3 = document.formu.direccion.value;
	d4 = document.formu.ci.value;
	ajax = nuevoAjax();
	url = "ajax_buscar_cliente.php"
	param = "apellidos="+d1+"&nombres="+d2+"&direccion="+d3+"&ci="+d4;
	//alert(param);
	ajax.open("POST", url, true);
	ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
	ajax.onreadystatechange = function() {
		if (ajax.readyState == 4) {
			contenedor.innerHTML = ajax.responseText;
		}
	}
	ajax.send(param);
}