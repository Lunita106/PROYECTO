"use strict"
function validar(){
	var nombre = document.formu.nombre.value;

	if (nombre=="") {
		alert("Por favor ingrese el nombre de la Tienda");
		document.formu.nombre.focus();
		return;
	}
	document.formu.submit();
}