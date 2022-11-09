"use strict"
function validar(){
	var nombre = document.formu.nombre.value;
	var direccion = document.formu.direccion.value;
	if (!v1.test(nombre)) {
		alert("El nombre es incorrecto o el campo esta vacio");
		document.formu.nombre.focus();
		return;
	}
	if (direccion=="") {
		alert("Por favor ingrese la direccion");
		document.formu.direccion.focus();
		return;
	}
	document.formu.submit();
}