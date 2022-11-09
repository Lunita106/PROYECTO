<?php
session_start();

require_once("../../smarty/libs/Smarty.class.php");
require_once("../../conexion.php");

$nombre1 = $_POST["nombre1"];
$apellido1 = $_POST["apellido1"];
$ci1 = $_POST["ci1"];
$direccion1 = $_POST["direccion1"];
$email1 = $_POST["email1"];
$telefono1 = $_POST["telefono1"];

$reg = array();
$reg["id_tienda"] = 1;
$reg["nombre"] = $nombre1;
$reg["apellido"] = $apellido1;
$reg["ci"] = $ci1;
$reg["direccion"] = $direccion1;
$reg["email"] = $email1;
$reg["telefono"] = $telefono1;
$reg["fec_insercion"] = date("Y-m-d H:i:s");
$reg["estado"] = '1';
$reg["usuario"] = $_SESSION["sesion_id_usuario"];
$rs1 = $db->AutoExecute("clientes", $reg, "INSERT");
?>