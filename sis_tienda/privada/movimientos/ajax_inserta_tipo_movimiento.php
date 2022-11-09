<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$tipo_movimiento1 = $_POST["tipo_movimiento1"];

$reg = array();
$reg["id_tienda"] = 1;
$reg["tipo_movimiento"] = $tipo_movimiento1;
$rs1 = $db->AutoExecute("tipos_movimientos", $reg, "INSERT");
?>