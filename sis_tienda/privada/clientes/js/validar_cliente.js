"use strict"
function validar(){
	
	var nombre = document.formu.nombre.value;
	var apellido = document.formu.apellido.value;
	var ci = document.formu.ci.value;
	var direccion = document.formu.direccion.value;

	if (!v1.test(nombre)) {
		alert("El nombre es incorrecto o el campo esta vacio");
		document.formu.nombre.focus();
		return;
	}
	if (!v1.test(apellido)) {
		alert("Los apellidos son incorrectos o el campo esta vacio");
		document.formu.apellido.focus();
		return;
	}
	if (ci=="") {
		alert("Por favor ingrese el numero de ci");
		document.formu.ci.focus();
		return;
	}
	if (direccion=="") {
		alert("Por favor ingrese la direccion");
		document.formu.direccion.focus();
		return;
	}
	document.formu.submit();
}