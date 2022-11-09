"use strict"
function validar(){
	var id_vendedor = document.formu.id_vendedor.value;
	var id_cliente = document.formu.id_cliente.value;
	var total_venta = document.formu.total_venta.value;
	var fecha_venta = document.formu.fecha_venta.value;

	if (id_vendedor=="") {
		alert("Por favor seleccione un vendedor");
		document.formu.id_vendedor.focus();
		return;
	}
	if (id_cliente=="") {
		alert("Por favor seleccione un cliente");
		document.formu.id_cliente.focus();
		return;
	}
	if((!v22.test(total_venta)) || (total_venta == "")){
		alert("La cantidad de venta es incorrecto o esta vacio");
		document.formu.total_venta.focus();
		return;
	}
	if (fecha_venta=="") {
		alert("Por favor ingrese la fecha de la venta");
		document.formu.fecha_venta.focus();
		return;
	}
	document.formu.submit();
}