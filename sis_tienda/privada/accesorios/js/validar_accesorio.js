"use strict"
function validar(){
	var id_marca = document.formu.id_marca.value;
	var id_proveedor = document.formu.id_proveedor.value;
	var nombre = document.formu.nombre.value;
	var modelo = document.formu.modelo.value;

	if (id_marca=="") {
		alert("Por favor seleccione una marca");
		document.formu.id_marca.focus();
		return;
	}
	if (id_proveedor=="") {
		alert("Por favor seleccione un proveedor");
		document.formu.id_proveedor.focus();
		return;
	}
	if (nombre=="") {
		alert("Por favor ingrese el nombre del accesorio");
		document.formu.nombre.focus();
		return;
	}
	if (modelo=="") {
		alert("Por favor ingrese el modelo del accesorio");
		document.formu.modelo.focus();
		return;
	}
	document.formu.submit();
}