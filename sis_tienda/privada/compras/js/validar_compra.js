"use strict"
function validar(){
	var id_proveedor = document.formu.id_proveedor.value;
	var total_compra = document.formu.total_compra.value;
	var fecha_compra = document.formu.fecha_compra.value;

	if (id_proveedor=="") {
		alert("Por favor seleccione un proveedor");
		document.formu.id_proveedor.focus();
		return;
	}
	if((!v22.test(total_compra)) || (total_compra == "")){
		alert("La cantidad de compra es incorrecto o esta vacio");
		document.formu.total_compra.focus();
		return;
	}
	/*if (total_compra=="") {
		alert("Por favor ingrese el total de la compra");
		document.formu.total_compra.focus();
		return;
	}*/
	if (fecha_compra=="") {
		alert("Por favor ingrese la fecha de la compra");
		document.formu.fecha_compra.focus();
		return;
	}
	document.formu.submit();
}
