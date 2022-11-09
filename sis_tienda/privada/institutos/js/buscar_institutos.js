"use strict"
function buscar_instituto(){
  var d1, d2, d3, ajax, url, param, contenedor;
  contenedor = document.getElementById('institutos1');
   d1 =document.formu.nombre.value;
   d2 =document.formu.carrera.value;
   d3 =document.formu.direccion.value;
   ajax = nuevoAjax();
   url="ajax_buscar_institutos.php"
   param= "nombre="+d1+"&carrera="+d2+"&direccion="+d3;
   //alert(param);
   ajax.open("POST", url, true);
   ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
   ajax.onreadystatechange = function() {
   	if (ajax.readyState == 4) {
   		contenedor.innerHTML = ajax.responseText;
   	 }
   }
   ajax.send(param);
}