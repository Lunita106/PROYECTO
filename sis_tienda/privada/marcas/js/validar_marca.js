"use strict"
function validar(){
	var marca = document.formu.marca.value;

	if (marca=="") {
		alert("Por favor ingrese la marca");
		document.formu.marca.focus();
		return;
	}
	document.formu.submit();
}