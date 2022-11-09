"use strict"
function buscar_compra(){
	var d1, d2, ajax, url, param, contenedor;
	contenedor = document.getElementById('compras1');
	d1 = document.formu.compra.value;
    d2 = document.formu.nombres.value;
    alert("llega js");
	ajax = nuevoAjax();
	url = "ajax_buscar_compra.php"
	param = "compra="+d1+"&nombres="+d2;
	alert(param);
	ajax.open("POST", url, true);
	ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
	ajax.onreadystatechange = function() {
		if (ajax.readyState == 4) {
			contenedor.innerHTML = ajax.responseText;
		}
	}
	ajax.send(param);
}