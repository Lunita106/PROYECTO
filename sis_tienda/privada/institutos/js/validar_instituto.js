"use strict"
function validar(){
	var id_instituto = document.formu.id_instituto.value;
	var carrera = document.formu.carrera.value;
	var direccion2 = document.formu.direccion2.value;

	if (id_instituto=="") {
		alert("Por favor seleccione un instituto");
		document.formu.id_instituto.focus();
		return;
	}
	if (carrera=="") {
		alert("Por favor ingrese la carrera");
		document.formu.carrera.focus();
		return;
	}
	if (direccion2=="") {
		alert("Por favor ingrese la direccion");
		document.formu.direccion2.focus();
		return;
	}
	
	document.formu.submit();
}