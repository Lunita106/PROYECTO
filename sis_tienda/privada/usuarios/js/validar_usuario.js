"use strict"
function validar(){
	var id_persona = document.formu.id_persona.value;
	var usuario = document.formu.usuario.value;
	var clave = document.formu.clave.value;

	if (id_persona=="") {
		alert("Por favor seleccione una persona");
		document.formu.id_persona.focus();
		return;
	}
	if (usuario=="") {
		alert("Por favor ingrese al usuario");
		document.formu.usuario.focus();
		return;
	}
	if (clave=="") {
		alert("Por favor ingrese la clave");
		document.formu.clave.focus();
		return;
	}
	document.formu.submit();
}