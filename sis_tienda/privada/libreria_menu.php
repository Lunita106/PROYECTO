<?php
//$db->debug=true;
if (isset($_SESSION["sesion_id_rol"])) {

	$sql = $db->Prepare("SELECT ac.*, op.id_opcion, op.orden, op.contenido, gr.id_grupo, gr.grupo, op.opcion
			FROM accesos ac, opciones op, grupos gr
			WHERE ac.id_rol = '".$_SESSION["sesion_id_rol"]."'
			AND ac.id_opcion = op.id_opcion
			AND op.id_grupo = gr.id_grupo
			AND ac.estado <> '0'
			AND op.estado <> '0'
			AND gr.estado <> '0'
			ORDER BY op.id_grupo, op.orden
			");
	$rs = $db->Execute($sql);

	$sql2 = $db->Prepare("SELECT ac.*, op.id_opcion, op.orden, op.contenido, gr.id_grupo, gr.grupo, op.opcion
			FROM accesos ac, opciones op, grupos gr
			WHERE ac.id_rol = '".$_SESSION["sesion_id_rol"]."'
			AND ac.id_opcion = op.id_opcion
			AND op.id_grupo = gr.id_grupo
			AND ac.estado <> '0'
			AND op.estado <> '0'
			AND gr.estado <> '0'
			ORDER BY op.id_grupo, op.orden
		");
	$rs2 = $db->Execute($sql2);

	$nick = $_SESSION["sesion_usuario"];
}else{
	$rs = "";
	$rs2 = ""; 
	$nick = "";
}
if ($nick != "") {
	echo "<div id='header'>
		  <ul class='nav'>";
		  $grup="";
		  foreach ($rs as $r => $fila){
		  	echo"<li>";
		  	if ($grup != $fila["grupo"]) {
		  	echo"<a onclick='location.href=\"#\"' style='cursor:pointer;'>".$fila["grupo"]."</a>";
		  	$grup = $fila["grupo"];
		  }
		 echo"<ul>";
		 	foreach ($rs2 as $t => $fila2) {
		 		if ($grup == $fila2["grupo"]) {
		 		$dir_php = $_SERVER["PHP_SELF"];
		 		$cuerp = strpos($dir_php, "cuerpo.php");
		 		if ($cuerp == false or $cuerp == "") {
		 		echo"<li><a onclick='location.href=\"../".$fila2["contenido"]."\"' target='cuerpo'style='cursor:pointer;'>".$fila2["opcion"]."</a></li>";
		 		}
		 		else
		 			echo"<li><a onclick='location.href=\"".$fila2["contenido"]."\"' target='cuerpo'style='cursor:pointer;'>".$fila2["opcion"]."</a></li>";
		 		}
		 	}
		 	echo"</ul>";
		 echo"</li>";
        }
        echo"</ul>";

        if ($cuerp == false) {
        	echo"<a onclick='location.href=\"../claves/\"'><input type='button'name='accion' value='Cerrar Sesion'style='cursor:pointer;border-radius:10px;font-weight:bold;height: 25px;background-color: #FF675F;' class='boton_cerrar'></a>";
        }else{
        	echo"<a onclick='location.href=\"claves/\"'><input type='button'name='accion' value='Cerrar Sesion'style='cursor:pointer;border-radius:10px;font-weight:bold;height: 25px;background-color: #FF675F;' class='boton_cerrar'></a>";
        }
        	echo"</ul>
        	</div>";
        }
?>