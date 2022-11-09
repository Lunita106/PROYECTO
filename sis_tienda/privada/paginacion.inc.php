<?php
//session_start();

//$nElem = ((int)$_SESSION["sesion_valor"]);
$nElem = 5; /*Cantidad de registros*/
$nBotones = 3;  /*Cantidad de secciones*/
$posBoton = 1; /*Que los numeros de la paginacion vayan de  1 en 1*/

function paginacion ($vinc, &$smarty) {
  global $nElem;
  global $nPags;
  global $pag;
  global $posBoton;
  global $nBotones;


  /*echo"vinc".$vinc."<br>";
  echo"pag".$pag."<br>";
  echo"nPags".$nPags."<br>";
  echo"posBoton".$posBoton."<br>";*/


  if (isset($_GET["posBoton"])) {
      $posBoton = $_GET["posBoton"];
   }
   
   if ($pag == $posBoton ) {
       $posBoton = ($pag == 1)? $posBoton : $posBoton - 1;
   }
   
   if ($pag == ($posBoton + $nBotones - 1)) {
	   $posBoton = (($posBoton + $nBotones - 1) == $nPags)? $posBoton : $posBoton + 1;
    }

    if ($nPags > 1) {
      //  echo"entra al iffffffffffffffffffff al primer <br>";
        $paginas = array();
        for ($i = $posBoton; $i < $pag; $i++) {
             $paginas[$i]["npag"] = $i;
             $paginas[$i]["pagV"] = "{$vinc}pag = $i";
        }
        $paginas[$pag]["npag"]=$pag;
        //echo"sale del forrrrrrrrrrrrrr <br>"; 


        if ($pag <> 1) {
            $i = $pag - 1;
            //echo"entra al iffffffffffffffffffff";
            $urlback = "{$vinc}pag=$i&posBoton=$posBoton";
            $smarty->assign("urlback", $urlback);
        }
        for ($i = $posBoton; $i < $posBoton + $nBotones && $i <= $nPags; $i++) {
             $paginas[$i]["npag"] = $i;
             $paginas[$i]["pagV"] = "{$vinc}pag=$i&posBoton=$posBoton";
        }
        if ($pag < $nPags) {
            $i = $pag + 1;
            $urlnext = "{$vinc}pag=$i&posBoton=$posBoton";
            $smarty->assign("urlnext", $urlnext);
        } 
        
        //echo"el valor que va de pagina".$pag;
        $smarty->assign("paginas", $paginas);
        $smarty->assign("numbotones", $nBotones);
        $smarty->assign("pagina", $pag);
        $smarty->assign("numpaginas", $nPags);
        $smarty->assign("numreg", $nElem);
    }
}

//$pag = $_GET["pag"];
isset($_GET["pag"])? $pag=$_GET["pag"]: $pag="";

function contarRegistros($db, $tabla) { 
 global $nElem;
 global $nPags;
 global $pag;
 global $regIni;
	if (!empty($tabla)) {
		$sql = $db->Prepare("SELECT count(*) as num 
					  FROM "."$tabla"." 
					  WHERE estado <> '0'
                    ");
		$rs = $db->GetAll($sql);	
		if ($rs) {
            $total =  $rs[0]["num"];

            $nPags = ceil((float)$total / (float)$nElem);
            if (empty($pag))
	            $pag = 1;
            elseif ($pag > $nPags) 
                    $pag = $nPags;
            $regIni = ($pag - 1) * $nElem;
			return $regIni;
		} else {
			return $regIni = 0;
		}
	} else
		return $regIni = 0;
}
function numeroRegistros($num){
 global $nElem;
 global $nPags;
 global $pag;
 global $regIni;
  if (!empty($num)) {
      $total = $num;
      $nPags = ceil((float)$total / (float)$nElem);
      if (empty($pag))
          $pag = 1;
      elseif ($pag > $nPags) 
              $pag = $nPags;
      $regIni = ($pag - 1) * $nElem;
      return $regIni;
  }
  else
		return $regIni = 0;
}
?>