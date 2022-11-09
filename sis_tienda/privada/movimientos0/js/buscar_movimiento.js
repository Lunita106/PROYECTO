"use strict"
function buscar_movimiento(){
	var d1, d2,d3, ajax, url, param, contenedor;
	contenedor = document.getElementById('movimientos1');
	d1 = document.formu.tipo_movimiento.value;
    d2 = document.formu.monto_movimiento.value;
    d3 = document.formu.moneda.value;
    //alert("llega js");
	ajax = nuevoAjax();
	url = "ajax_buscar_movimiento.php"
	param = "tipo_movimiento="+d1+"&monto_movimiento="+d2+"&moneda="+d3;
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