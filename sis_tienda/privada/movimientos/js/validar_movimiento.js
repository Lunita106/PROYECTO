"use strict"
function validar(){
	var id_tipo_movimiento = document.formu.id_tipo_movimiento.value;
	var monto_movimiento = document.formu.monto_movimiento.value;
	var fecha_movimiento = document.formu.fecha_movimiento.value;
	var moneda = document.formu.moneda.value;

	if (id_tipo_movimiento=="") {
		alert("Por favor seleccione un tipo movimiento");
		document.formu.id_tipo_movimiento.focus();
		return;
	}
	if((!v22.test(monto_movimiento)) || (monto_movimiento == "")){
		alert("La cantidad del monto movimiento es incorrecto o esta vacio");
		document.formu.monto_movimiento.focus();
		return;
	}
	if (fecha_movimiento=="") {
		alert("Por favor seleccione la fecha del movimiento");
		document.formu.fecha_movimiento.focus();
		return;
	}
	if (moneda=="") {
		alert("Por favor ingrese la moneda");
		document.formu.moneda.focus();
		return;
	}
	document.formu.submit();
}