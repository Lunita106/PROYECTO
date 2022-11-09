-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 07-10-2022 a las 23:23:10
-- Versión del servidor: 5.7.31
-- Versión de PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_tienda`
--

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `listado_personas_fechas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listado_personas_fechas` (IN `f_inicio` DATE, IN `f_fin` DATE)  BEGIN

SELECT *
FROM personas
WHERE fec_insercion BETWEEN f_inicio AND f_fin
AND estado='1';

END$$

DROP PROCEDURE IF EXISTS `listado_total_compra`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listado_total_compra` (IN `t_compra` FLOAT)  BEGIN

SELECT *
FROM compras
WHERE total_compra >=t_compra
AND estado='1';

END$$

DROP PROCEDURE IF EXISTS `listado_ventas_fechas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listado_ventas_fechas` (IN `nom_usuario` INT)  BEGIN

SELECT v.fecha_venta, v.total_venta
FROM ventas v
INNER JOIN clientes c ON c.id_cliente=v.id_cliente
INNER JOIN vendedores ve ON ve.id_vendedor=v.id_vendedor
WHERE v.usuario=nom_usuario 
AND v.estado='1'
AND c.estado='1'
AND ve.estado='1';

END$$

--
-- Funciones
--
DROP FUNCTION IF EXISTS `contar_registros`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `contar_registros` () RETURNS INT(11) BEGIN
DECLARE resultado INT;

SELECT COUNT(id_persona) INTO resultado
FROM personas
WHERE estado = '1';

RETURN resultado;

END$$

DROP FUNCTION IF EXISTS `sumar_compras`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `sumar_compras` () RETURNS INT(11) BEGIN
DECLARE resultado FLOAT;

SELECT SUM(total_compra) INTO resultado
FROM compras
WHERE estado='1';

RETURN resultado;

END$$

DROP FUNCTION IF EXISTS `sum_ventas`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `sum_ventas` () RETURNS FLOAT BEGIN
DECLARE resultado FLOAT;

SELECT SUM(v.total_venta) INTO resultado
FROM ventas v
INNER JOIN clientes c ON c.id_cliente=v.id_cliente
INNER JOIN vendedores ve ON ve.id_vendedor=v.id_vendedor
WHERE v.estado='1' 
AND c.estado='1'
AND ve.estado='1';

RETURN resultado;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accesorios`
--

DROP TABLE IF EXISTS `accesorios`;
CREATE TABLE IF NOT EXISTS `accesorios` (
  `id_accesorio` int(11) NOT NULL AUTO_INCREMENT,
  `id_tienda` int(11) NOT NULL,
  `id_marca` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `modelo` varchar(30) NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_accesorio`),
  KEY `id_tienda` (`id_tienda`),
  KEY `id_marca` (`id_marca`),
  KEY `id_proveedor` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `accesorios`
--

INSERT INTO `accesorios` (`id_accesorio`, `id_tienda`, `id_marca`, `id_proveedor`, `nombre`, `modelo`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 1, 1, 1, 'TECLADO', 'L505-08', '2022-07-07 01:14:11', '2022-07-07 01:14:11', 1, '1'),
(2, 1, 5, 10, 'MOUSE', 'M505-08', '2022-07-07 01:14:11', '2022-07-07 01:14:11', 1, '1'),
(3, 1, 9, 4, 'PARLANTE', 'P405-08', '2022-07-07 01:14:11', '2022-07-07 01:14:11', 1, '1'),
(4, 1, 4, 7, 'PANTALLA', 'P905-08', '2022-07-07 01:14:11', '2022-07-07 01:14:11', 1, '1'),
(5, 1, 8, 3, 'CARGADOR', 'C805-08', '2022-07-07 01:14:11', '2022-07-07 01:14:11', 1, '1'),
(6, 1, 7, 8, 'DISCO DURO', 'D505-08', '2022-07-07 01:14:11', '2022-07-07 01:14:11', 1, '1'),
(7, 1, 2, 5, 'CULER', 'MC805-08', '2022-07-07 01:14:11', '2022-07-07 01:14:11', 1, '1'),
(8, 1, 3, 9, 'BATERIA', 'B905-08', '2022-07-07 01:14:11', '2022-07-07 01:14:11', 1, '1'),
(9, 1, 6, 6, 'CPU', 'CPU905-08', '2022-07-07 01:14:11', '2022-07-07 01:14:11', 1, '1'),
(10, 1, 10, 2, 'MONITOR', 'M805-08', '2022-07-07 01:14:11', '2022-07-07 01:14:11', 1, '1'),
(11, 1, 11, 10, 'UUYYGGG', 'JH7', '2022-07-08 03:04:30', '2022-07-07 23:04:30', 1, '1'),
(12, 1, 11, 10, 'UUYYGGG', 'JH7', '2022-07-08 03:04:30', '2022-07-07 23:04:30', 1, '1'),
(13, 1, 12, 9, 'LILA', 'M805-080', '2022-08-31 06:33:37', '2022-08-31 02:33:37', 1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accesorios_precios`
--

DROP TABLE IF EXISTS `accesorios_precios`;
CREATE TABLE IF NOT EXISTS `accesorios_precios` (
  `id_accesorio_precio` int(11) NOT NULL AUTO_INCREMENT,
  `id_accesorio` int(11) NOT NULL,
  `fecha_asignacion` date NOT NULL,
  `precio` float NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_accesorio_precio`),
  KEY `id_accesorio` (`id_accesorio`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `accesorios_precios`
--

INSERT INTO `accesorios_precios` (`id_accesorio_precio`, `id_accesorio`, `fecha_asignacion`, `precio`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 1, '2020-01-21', 23.6, '2022-07-07 01:14:13', '2022-07-07 01:14:13', 1, '1'),
(2, 1, '2020-02-21', 63.5, '2022-07-07 01:14:13', '2022-07-07 01:14:13', 1, '1'),
(3, 1, '2020-03-21', 63.7, '2022-07-07 01:14:13', '2022-07-07 01:14:13', 1, '1'),
(4, 1, '2020-04-21', 23, '2022-07-07 01:14:13', '2022-07-07 01:14:13', 1, '1'),
(5, 1, '2021-01-21', 29, '2022-07-07 01:14:13', '2022-07-07 01:14:13', 1, '1'),
(6, 1, '2021-02-21', 123, '2022-07-07 01:14:13', '2022-07-07 01:14:13', 1, '1'),
(7, 1, '2021-03-21', 239, '2022-07-07 01:14:13', '2022-07-07 01:14:13', 1, '1'),
(8, 1, '2022-04-21', 43, '2022-07-07 01:14:13', '2022-07-07 01:14:13', 1, '1'),
(9, 1, '2022-05-21', 53, '2022-07-07 01:14:14', '2022-07-07 01:14:14', 1, '1'),
(10, 1, '2022-06-21', 283, '2022-07-07 01:14:14', '2022-07-07 01:14:14', 1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accesos`
--

DROP TABLE IF EXISTS `accesos`;
CREATE TABLE IF NOT EXISTS `accesos` (
  `id_acceso` int(11) NOT NULL AUTO_INCREMENT,
  `id_opcion` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_acceso`),
  KEY `id_opcion` (`id_opcion`),
  KEY `id_rol` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `accesos`
--

INSERT INTO `accesos` (`id_acceso`, `id_opcion`, `id_rol`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 1, 1, '2022-07-07 01:14:17', '2022-07-07 01:14:17', 1, '1'),
(2, 2, 1, '2022-07-07 01:14:17', '2022-07-07 01:14:17', 1, '1'),
(3, 3, 1, '2022-07-07 01:14:17', '2022-07-07 01:14:17', 1, '1'),
(4, 4, 1, '2022-07-07 01:14:17', '2022-07-07 01:14:17', 1, '1'),
(5, 5, 1, '2022-07-07 01:14:17', '2022-07-07 01:14:17', 1, '1'),
(6, 6, 1, '2022-07-07 01:14:17', '2022-07-07 01:14:17', 1, '1'),
(7, 7, 1, '2022-07-07 01:14:17', '2022-07-07 01:14:17', 1, '1'),
(8, 8, 1, '2022-07-07 01:14:17', '2022-07-07 01:14:17', 1, '1'),
(9, 9, 1, '2022-07-07 01:14:17', '2022-07-07 01:14:17', 1, '1'),
(10, 10, 1, '2022-07-07 01:14:17', '2022-07-07 01:14:17', 1, '1'),
(11, 11, 1, '2022-07-07 01:14:17', '2022-07-07 01:14:17', 1, '1'),
(12, 12, 1, '2022-07-07 01:14:17', '2022-07-07 01:14:17', 1, '1'),
(13, 13, 1, '2022-07-07 01:14:17', '2022-07-07 01:14:17', 1, '1'),
(14, 14, 1, '2022-07-07 01:14:17', '2022-07-07 01:14:17', 1, '1'),
(15, 15, 1, '2022-07-07 01:14:17', '2022-07-07 01:14:17', 1, '1'),
(16, 16, 1, '2022-07-07 01:14:17', '2022-07-07 01:14:17', 1, '1'),
(17, 17, 1, '2022-07-07 01:14:17', '2022-07-07 01:14:17', 1, '1'),
(18, 18, 1, '2022-07-07 01:14:17', '2022-07-07 01:14:17', 1, '1'),
(19, 19, 1, '2022-07-07 01:14:17', '2022-07-07 01:14:17', 1, '1'),
(20, 20, 1, '2022-07-07 01:14:17', '2022-07-07 01:14:17', 1, '1'),
(21, 21, 1, '2022-07-07 01:14:17', '2022-07-07 01:14:17', 1, '1'),
(22, 22, 1, '2022-07-07 01:14:17', '2022-07-07 01:14:17', 1, '1'),
(23, 23, 1, '2022-07-07 05:14:17', '2022-07-07 05:14:17', 1, '1'),
(24, 24, 1, '2022-09-07 00:31:32', '2022-09-07 00:31:32', 1, '1'),
(25, 25, 1, '2022-09-07 01:11:04', '2022-09-07 01:11:04', 1, '1'),
(26, 26, 1, '2022-09-09 00:03:19', '2022-09-09 00:03:19', 1, '1'),
(27, 27, 1, '2022-09-28 00:01:53', '2022-09-28 00:01:53', 1, '1'),
(28, 28, 1, '2022-09-28 00:01:53', '2022-09-28 00:01:53', 1, '1'),
(29, 29, 1, '2022-09-30 00:06:01', '2022-09-30 00:06:01', 1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cadena_agencia_viajes`
--

DROP TABLE IF EXISTS `cadena_agencia_viajes`;
CREATE TABLE IF NOT EXISTS `cadena_agencia_viajes` (
  `id_cadena_agencia_viaje` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `telefonos` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `pag_web` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_cadena_agencia_viaje`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cadena_agencia_viajes`
--

INSERT INTO `cadena_agencia_viajes` (`id_cadena_agencia_viaje`, `nombre`, `telefonos`, `pag_web`) VALUES
(1, 'BOLIVIA - PERU TRAVEL', '72895845', 'www.turismoboliviaperu.com'),
(2, 'ANDALUCIA TOURS', '466-30892', 'www.andaluciatours.com'),
(3, 'COIT VIAJES Y TURISMO SRL', '3433626', 'www.coit.com.uy');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carreras`
--

DROP TABLE IF EXISTS `carreras`;
CREATE TABLE IF NOT EXISTS `carreras` (
  `id_carrera` int(11) NOT NULL AUTO_INCREMENT,
  `id_instituto` int(11) NOT NULL,
  `carrera` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `grado_academico` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8_spanish_ci,
  `duracion` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_carrera`),
  KEY `id_instituto` (`id_instituto`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `carreras`
--

INSERT INTO `carreras` (`id_carrera`, `id_instituto`, `carrera`, `direccion`, `telefono`, `grado_academico`, `descripcion`, `duracion`) VALUES
(1, 1, 'CONTADURIA PUBLICA', 'Av. La Paz esq. Membrillos', '6649455', 'TECNICO SUPERIOR', '', '3 AÑOS'),
(2, 1, 'SISTEMAS INFORMATICOS', 'Av. La Paz esq. Membrillos', '6649455', 'TECNICO SUPERIOR', '', '3 AÑOS'),
(3, 2, 'AUXILIAR CONTABLE', 'Calle Daniel Campos', '6642345', 'TECNICO MEDIO', '', '2 AÑOS'),
(4, 2, 'SECRETARIADO EJECUTIVO', 'Calle Daniel Campos', '6642345', 'TECNICO MEDIO', '', '2 AÑOS'),
(5, 2, 'TECNICO BANCARIO', 'Calle Daniel Campos', '6642345', 'TECNICO MEDIO', '', '2 AÑOS'),
(6, 3, 'AUXILIAR CONTABLE', 'Calle Campero', '6661598', 'TECNICO MEDIO', '', '2 AÑOS'),
(7, 1, 'GASTRONOMIA', 'Av. La Paz esq. Membrillos', '6649455', 'TECNICO SUPERIOR', '', '3 AÑOS'),
(8, 1, 'SECRETARIADO EJECUTIVO', 'Av. La Paz esq. Membrillos', '6649455', 'TECNICO SUPERIOR', '', '3 AÑOS'),
(9, 1, 'sd', '', NULL, NULL, NULL, NULL),
(10, 1, 'sds', 'df', NULL, NULL, NULL, NULL),
(11, 6, 'bb', 'bhag', NULL, NULL, NULL, NULL),
(12, 7, 'c', 'ssd', NULL, NULL, NULL, NULL),
(13, 8, 'REDES', 'RIO34', '', '', '', ''),
(14, 8, 'REDS', 'RIO43', '98262', 'PRIMERO', 'GGSDFCS', '30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `id_tienda` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `ci` varchar(10) NOT NULL,
  `direccion` varchar(40) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `id_tienda` (`id_tienda`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `id_tienda`, `nombre`, `apellido`, `ci`, `direccion`, `email`, `telefono`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 1, 'MARCELO  JOSE', 'ALMAZAN JURADO', '46646464', 'B.MONTE SUB', 'marceloa67@gmail.com.bo', '64454545', '2022-07-07 01:14:11', '2022-07-07 01:14:11', 1, '1'),
(2, 1, 'MARCIAL', 'AMADOR VARGAS', '67453246', 'B.AVAROA', 'marcial@gmail.com.bo', '12346789', '2022-07-07 01:14:12', '2022-07-07 01:14:12', 1, '1'),
(3, 1, 'JULIAN', 'MENDOZA APARICIO', '65352749', 'B.FATIMA', 'julian23@gmail.com.bo', '67346550', '2022-07-07 01:14:12', '2022-07-07 01:14:12', 1, '1'),
(4, 1, 'LEONEL', 'BERNAN ALMAZAN', '98373526', 'B.VILLA AVARA', 'leonel76@gmail.com.bo', '78364567', '2022-07-07 01:14:12', '2022-07-07 01:14:12', 1, '1'),
(5, 1, 'OSCAR', 'MONTES VILLEGAS', '65438799', 'B.CONSTRUCTOR', 'oscar65@gmail.com.bo', '87432334', '2022-07-07 01:14:12', '2022-07-07 01:14:12', 1, '1'),
(6, 1, 'JUAN JOSE', 'MERCADO VILTE', '46647664', 'B.BOLIVAR', 'juanjose45@gmail.com.bo', '63889267', '2022-07-07 01:14:12', '2022-07-07 01:14:12', 1, '1'),
(7, 1, 'MOISES', 'JURADO MONTES', '67487246', 'B.LOURDES', 'moises65@gmail.com.bo', '12348989', '2022-07-07 01:14:12', '2022-07-07 01:14:12', 1, '1'),
(8, 1, 'JULIO', 'CAMACHO APARICIO', '65092749', 'B.FATIMA', 'julio23@gmail.com.bo', '65646550', '2022-07-07 01:14:12', '2022-07-07 01:14:12', 1, '1'),
(9, 1, 'MARCELA', 'NEVADA RIVERO', '98374526', 'B.BELGRADO', 'marcela76@gmail.com.bo', '68364567', '2022-07-07 01:14:12', '2022-07-07 01:14:12', 1, '1'),
(10, 1, 'HORACIO', 'ROJAS VALLEJOS', '65438769', 'B.PALMARCITO', 'horacio95@gmail.com.bo', '87632334', '2022-07-07 01:14:12', '2022-07-07 01:14:12', 1, '1'),
(11, 1, 'ERER', 'RER', '4566', 'GHGH56', 'ajshh@gmail.com', '56788', '2022-09-02 18:54:46', '2022-09-02 14:54:46', 1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

DROP TABLE IF EXISTS `compras`;
CREATE TABLE IF NOT EXISTS `compras` (
  `id_compra` int(11) NOT NULL AUTO_INCREMENT,
  `id_proveedor` int(11) NOT NULL,
  `fecha_compra` date NOT NULL,
  `total_compra` float NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `id_proveedor` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id_compra`, `id_proveedor`, `fecha_compra`, `total_compra`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 3, '2021-04-30', 8760, '2022-07-07 01:14:13', '2022-08-03 01:58:48', 1, '1'),
(2, 6, '2021-05-20', 976, '2022-07-07 01:14:13', '2022-07-07 01:14:13', 1, '1'),
(3, 8, '2021-06-12', 8976, '2022-07-07 01:14:13', '2022-07-07 01:14:13', 1, '1'),
(4, 7, '2021-07-31', 236, '2022-07-07 01:14:13', '2022-07-07 01:14:13', 1, '1'),
(5, 1, '2022-08-16', 436, '2022-07-07 01:14:13', '2022-07-07 01:14:13', 1, '1'),
(6, 4, '2022-08-10', 436, '2022-07-07 01:14:13', '2022-07-07 01:14:13', 1, '1'),
(7, 5, '2022-08-20', 656, '2022-07-07 01:14:13', '2022-07-07 01:14:13', 1, '1'),
(8, 2, '2022-09-18', 766, '2022-07-07 01:14:13', '2022-07-07 01:14:13', 1, '1'),
(9, 10, '2022-09-19', 23688, '2022-07-07 01:14:13', '2022-07-08 00:33:19', 1, '1'),
(10, 8, '2022-10-06', 7860, '2022-07-07 01:14:13', '2022-07-07 23:09:16', 1, '0'),
(11, 8, '2022-07-06', 0, '2022-07-08 04:33:34', '2022-07-08 00:33:34', 1, '1'),
(12, 10, '2022-07-06', 0, '2022-07-08 04:37:17', '2022-07-08 00:37:17', 1, '1'),
(13, 10, '2022-07-06', 0, '2022-07-08 04:39:00', '2022-07-08 00:39:00', 1, '1'),
(14, 10, '2022-07-05', 76, '2022-07-08 04:49:40', '2022-07-08 00:49:40', 1, '1'),
(15, 7, '2022-08-15', 3445, '2022-08-03 05:49:05', '2022-08-03 01:49:05', 1, '1'),
(16, 10, '2022-08-08', 66353, '2022-08-03 05:51:40', '2022-08-03 01:51:40', 1, '1'),
(17, 10, '2022-06-14', 100, '2022-09-02 16:27:50', '2022-09-02 12:27:50', 1, '1'),
(18, 11, '2022-08-31', 56, '2022-09-02 16:39:29', '2022-09-02 12:39:29', 1, '1'),
(19, 12, '2022-06-07', 900, '2022-09-02 17:02:01', '2022-09-02 16:30:52', 1, '1'),
(20, 12, '2022-06-06', 80, '2022-09-02 17:39:49', '2022-09-02 13:39:50', 1, '1'),
(21, 12, '2022-09-06', 9, '2022-09-03 00:08:38', '2022-09-02 20:08:51', 1, '1'),
(22, 12, '2022-06-06', 10, '2022-09-03 00:10:38', '2022-09-02 20:10:46', 1, '1'),
(23, 13, '2022-06-06', 56, '2022-09-03 00:12:08', '2022-09-02 20:12:08', 1, '1'),
(24, 9, '2022-10-19', 5, '2022-10-05 09:50:44', '2022-10-05 05:50:44', 1, '1');

--
-- Disparadores `compras`
--
DROP TRIGGER IF EXISTS `inserta_registro_huellas4`;
DELIMITER $$
CREATE TRIGGER `inserta_registro_huellas4` BEFORE UPDATE ON `compras` FOR EACH ROW BEGIN

INSERT INTO _registro_huellas (consulta, _fecha_inser, _usuario)VALUES("MODIF-COMPRAS",NEW.fec_insercion, NEW.usuario);

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compras`
--

DROP TABLE IF EXISTS `detalle_compras`;
CREATE TABLE IF NOT EXISTS `detalle_compras` (
  `id_detalle_compra` int(11) NOT NULL AUTO_INCREMENT,
  `id_accesorio_precio` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_detalle_compra`),
  KEY `id_accesorio_precio` (`id_accesorio_precio`),
  KEY `id_compra` (`id_compra`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_compras`
--

INSERT INTO `detalle_compras` (`id_detalle_compra`, `id_accesorio_precio`, `id_compra`, `cantidad`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 1, 1, 4, '2022-07-07 01:14:14', '2022-07-07 01:14:14', 1, '1'),
(2, 1, 1, 8, '2022-07-07 01:14:14', '2022-07-07 01:14:14', 1, '1'),
(3, 1, 1, 10, '2022-07-07 01:14:14', '2022-07-07 01:14:14', 1, '1'),
(4, 1, 1, 2, '2022-07-07 01:14:14', '2022-07-07 01:14:14', 1, '1'),
(5, 1, 1, 5, '2022-07-07 01:14:14', '2022-07-07 01:14:14', 1, '1'),
(6, 1, 1, 7, '2022-07-07 01:14:14', '2022-07-07 01:14:14', 1, '1'),
(7, 1, 1, 12, '2022-07-07 01:14:14', '2022-07-07 01:14:14', 1, '1'),
(8, 1, 1, 9, '2022-07-07 01:14:14', '2022-07-07 01:14:14', 1, '1'),
(9, 1, 1, 5, '2022-07-07 01:14:14', '2022-07-07 01:14:14', 1, '1'),
(10, 1, 1, 4, '2022-07-07 01:14:14', '2022-07-07 01:14:14', 1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ventas`
--

DROP TABLE IF EXISTS `detalle_ventas`;
CREATE TABLE IF NOT EXISTS `detalle_ventas` (
  `id_detalle_venta` int(11) NOT NULL AUTO_INCREMENT,
  `id_accesorio_precio` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `descuento` float NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_detalle_venta`),
  KEY `id_accesorio_precio` (`id_accesorio_precio`),
  KEY `id_venta` (`id_venta`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_ventas`
--

INSERT INTO `detalle_ventas` (`id_detalle_venta`, `id_accesorio_precio`, `id_venta`, `cantidad`, `descuento`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 1, 1, 6, 10.9, '2022-07-07 01:14:14', '2022-07-07 01:14:14', 1, '1'),
(2, 1, 1, 12, 20.6, '2022-07-07 01:14:14', '2022-07-07 01:14:14', 1, '1'),
(3, 1, 1, 11, 30.4, '2022-07-07 01:14:14', '2022-07-07 01:14:14', 1, '1'),
(4, 1, 1, 8, 50.3, '2022-07-07 01:14:14', '2022-07-07 01:14:14', 1, '1'),
(5, 1, 1, 7, 10, '2022-07-07 01:14:14', '2022-07-07 01:14:14', 1, '1'),
(6, 1, 1, 5, 70.7, '2022-07-07 01:14:14', '2022-07-07 01:14:14', 1, '1'),
(7, 1, 1, 7, 10.6, '2022-07-07 01:14:14', '2022-07-07 01:14:14', 1, '1'),
(8, 1, 1, 9, 40.3, '2022-07-07 01:14:14', '2022-07-07 01:14:14', 1, '1'),
(9, 1, 1, 10, 70.4, '2022-07-07 01:14:14', '2022-07-07 01:14:14', 1, '1'),
(10, 1, 1, 5, 10.3, '2022-07-07 01:14:14', '2022-07-07 01:14:14', 1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `existencia`
--

DROP TABLE IF EXISTS `existencia`;
CREATE TABLE IF NOT EXISTS `existencia` (
  `id_existencia` int(11) NOT NULL AUTO_INCREMENT,
  `id_detalle_venta` int(11) NOT NULL,
  `id_detalle_compra` int(11) NOT NULL,
  `id_accesorio` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_existencia`),
  KEY `id_detalle_venta` (`id_detalle_venta`),
  KEY `id_detalle_compra` (`id_detalle_compra`),
  KEY `id_accesorio` (`id_accesorio`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `existencia`
--

INSERT INTO `existencia` (`id_existencia`, `id_detalle_venta`, `id_detalle_compra`, `id_accesorio`, `cantidad`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 1, 1, 1, 20, '2022-07-07 01:14:15', '2022-07-07 01:14:15', 1, '1'),
(2, 1, 1, 1, 60, '2022-07-07 01:14:15', '2022-07-07 01:14:15', 1, '1'),
(3, 1, 1, 1, 40, '2022-07-07 01:14:15', '2022-07-07 01:14:15', 1, '1'),
(4, 1, 1, 1, 30, '2022-07-07 01:14:15', '2022-07-07 01:14:15', 1, '1'),
(5, 1, 1, 1, 20, '2022-07-07 01:14:15', '2022-07-07 01:14:15', 1, '1'),
(6, 1, 1, 1, 80, '2022-07-07 01:14:15', '2022-07-07 01:14:15', 1, '1'),
(7, 1, 1, 1, 90, '2022-07-07 01:14:15', '2022-07-07 01:14:15', 1, '1'),
(8, 1, 1, 1, 10, '2022-07-07 01:14:15', '2022-07-07 01:14:15', 1, '1'),
(9, 1, 1, 1, 50, '2022-07-07 01:14:15', '2022-07-07 01:14:15', 1, '1'),
(10, 1, 1, 1, 70, '2022-07-07 01:14:15', '2022-07-07 01:14:15', 1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

DROP TABLE IF EXISTS `facturas`;
CREATE TABLE IF NOT EXISTS `facturas` (
  `id_factura` int(11) NOT NULL AUTO_INCREMENT,
  `id_vendedor` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `fecha_facturacion` date NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_factura`),
  KEY `id_vendedor` (`id_vendedor`),
  KEY `id_cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`id_factura`, `id_vendedor`, `id_cliente`, `fecha_facturacion`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 1, 1, '2019-11-20', '2022-07-07 01:14:12', '2022-07-07 01:14:12', 1, '1'),
(2, 3, 6, '2020-08-23', '2022-07-07 01:14:12', '2022-07-07 01:14:12', 1, '1'),
(3, 8, 4, '2020-04-24', '2022-07-07 01:14:13', '2022-07-07 01:14:13', 1, '1'),
(4, 2, 9, '2020-06-23', '2022-07-07 01:14:13', '2022-07-07 01:14:13', 1, '1'),
(5, 6, 5, '2021-07-12', '2022-07-07 01:14:13', '2022-07-07 01:14:13', 1, '1'),
(6, 9, 10, '2021-03-13', '2022-07-07 01:14:13', '2022-07-07 01:14:13', 1, '1'),
(7, 4, 7, '2019-03-16', '2022-07-07 01:14:13', '2022-07-07 01:14:13', 1, '1'),
(8, 10, 2, '2021-06-23', '2022-07-07 01:14:13', '2022-07-07 01:14:13', 1, '1'),
(9, 7, 3, '2022-04-28', '2022-07-07 01:14:13', '2022-07-07 01:14:13', 1, '1'),
(10, 5, 8, '2020-03-23', '2022-07-07 01:14:13', '2022-07-07 01:14:13', 1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

DROP TABLE IF EXISTS `grupos`;
CREATE TABLE IF NOT EXISTS `grupos` (
  `id_grupo` int(11) NOT NULL AUTO_INCREMENT,
  `grupo` varchar(80) NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `grupos`
--

INSERT INTO `grupos` (`id_grupo`, `grupo`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 'HERRAMIENTAS', '2022-07-07 01:14:16', '2022-07-07 01:14:16', 1, '1'),
(2, 'TIENDA', '2022-07-07 01:14:16', '2022-07-07 01:14:16', 1, '1'),
(3, 'REPORTES', '2022-07-07 01:14:16', '2022-07-07 01:14:16', 1, '1'),
(4, 'EVA CONTINUA', '2022-09-08 23:58:39', '2022-09-08 23:58:39', 1, '1'),
(5, 'EVA TERCER BIMESTRE', '2022-09-27 23:57:17', '2022-09-27 23:57:17', 1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hoteles`
--

DROP TABLE IF EXISTS `hoteles`;
CREATE TABLE IF NOT EXISTS `hoteles` (
  `id_hotel` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadena_agencia_viaje` int(11) NOT NULL,
  `codigo` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `telefonos` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `nro_plazas_disponibles` int(11) NOT NULL,
  `ciudad` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_hotel`),
  KEY `id_cadena_agencia_viaje` (`id_cadena_agencia_viaje`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `hoteles`
--

INSERT INTO `hoteles` (`id_hotel`, `id_cadena_agencia_viaje`, `codigo`, `nombre`, `telefonos`, `nro_plazas_disponibles`, `ciudad`, `direccion`) VALUES
(1, 2, 'LOP', 'LOS PARRALES', '466-48444', 25, 'TARIJA', 'B. ARANAJUEZ'),
(2, 1, 'PRE', 'PRESIDENTE', '22406666', 41, 'LA PAZ', 'CALLE POTOSI N920'),
(3, 3, 'LTA', 'LA PLATA', '72220960', 48, 'SANTA CRUZ', 'PLAZA DE ARMAS N286');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `institutos`
--

DROP TABLE IF EXISTS `institutos`;
CREATE TABLE IF NOT EXISTS `institutos` (
  `id_instituto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `pag_web` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `resol_min` text COLLATE utf8_spanish_ci,
  `mision` text COLLATE utf8_spanish_ci,
  `vision` text COLLATE utf8_spanish_ci,
  PRIMARY KEY (`id_instituto`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `institutos`
--

INSERT INTO `institutos` (`id_instituto`, `nombre`, `direccion`, `telefono`, `pag_web`, `resol_min`, `mision`, `vision`) VALUES
(1, 'INCOS-TARIJA', 'CALLE LA PAZ Y MEMBRILLOS', '6649594', 'www.incos.com', '555/545', 'Formar profesionales con solida preparacion en las areas de la contabilidad e informatica mediante curriculos que se \r\najusten a las necesidade y realidad del departamento y del pais', 'Alcanzar la excelencia academica bajo parametros de calidad, eficiencia, eficacia e innovacion tecnico-tecnologica\r\npara dar respuesta oportuna a los requerimientos del sector productivo'),
(2, 'DOMINGO SAVIO', 'CALLE DANIEL CAMPOS', '', 'www.idms.com', '752/2009', 'Formar integramente tecnicos altmanente capacitados, através de aplicaciones tecnologicas educativas actualizadas, excelencia\r\nacademica y vocacion de servicio, para satisfacer las demandas laborales de la region en cursos y carreras tecnicas', 'Consolidarnos en el mercado regional como lider entre los institutos de capacitacion y/o formacion tecnica a traves de procesos\r\nde calidad y mejora continua'),
(3, 'CATEC', 'CALLE INGAVI ESQ. JUNIN', '', 'www.catec.com', '', '', ''),
(4, 'IPC PASCAL', 'CALLE SANTA CRUZ', '', 'www.ipc.com', '', '', ''),
(5, 'CCA', 'CALLE CAMPERO', '', 'www.cca.com', '', '', ''),
(6, 'asa', 'SDS', '', '', '', '', ''),
(7, 'cc', 'CCA', '', '', '', '', ''),
(8, 'sss', 'SSS', 'eee', 'EEEE', '', '', ''),
(9, 'DFEE', 'FRT6', '0877', 'SSA', 'SAS', 'SA', 'ASAS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

DROP TABLE IF EXISTS `marcas`;
CREATE TABLE IF NOT EXISTS `marcas` (
  `id_marca` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(30) NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id_marca`, `marca`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 'HP', '2022-07-07 01:14:10', '2022-07-07 01:14:10', 1, '1'),
(2, 'DELL', '2022-07-07 01:14:10', '2022-07-07 01:14:10', 1, '1'),
(3, 'ASUS', '2022-07-07 01:14:10', '2022-07-07 01:14:10', 1, '1'),
(4, 'LENOVO', '2022-07-07 01:14:11', '2022-07-07 01:14:11', 1, '1'),
(5, 'QUIPUS', '2022-07-07 01:14:11', '2022-07-07 01:14:11', 1, '1'),
(6, 'GAMERS', '2022-07-07 01:14:11', '2022-07-07 01:14:11', 1, '1'),
(7, 'APPLE', '2022-07-07 01:14:11', '2022-07-07 01:14:11', 1, '1'),
(8, 'ACER', '2022-07-07 01:14:11', '2022-07-07 01:14:11', 1, '1'),
(9, 'LG', '2022-07-07 01:14:11', '2022-07-07 01:14:11', 1, '1'),
(10, 'TOSHIBA', '2022-07-07 01:14:11', '2022-07-07 01:14:11', 1, '1'),
(11, 'LILO', '2022-07-08 03:03:48', '2022-07-07 23:03:48', 1, '1'),
(12, 'LG', '2022-08-31 05:50:00', '2022-08-31 01:50:00', 1, '1'),
(13, 'ACER', '2022-08-31 06:34:53', '2022-08-31 02:34:53', 1, '1'),
(14, 'ACER', '2022-08-31 06:35:05', '2022-08-31 02:35:05', 1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

DROP TABLE IF EXISTS `movimientos`;
CREATE TABLE IF NOT EXISTS `movimientos` (
  `id_movimiento` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_movimiento` int(11) NOT NULL,
  `monto_movimiento` float DEFAULT NULL,
  `fecha_movimiento` date NOT NULL,
  `moneda` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_movimiento`),
  KEY `id_tipo_movimiento` (`id_tipo_movimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `movimientos`
--

INSERT INTO `movimientos` (`id_movimiento`, `id_tipo_movimiento`, `monto_movimiento`, `fecha_movimiento`, `moneda`) VALUES
(1, 1, 1500, '2020-05-01', 'BOLIVIANOS'),
(2, 2, 550, '2020-05-06', 'DOLARES'),
(3, 3, 777, '2020-05-08', 'EUROS'),
(4, 1, 2500, '2020-05-01', 'SOLES'),
(5, 2, 666, '2020-05-01', 'DOLARES'),
(6, 1, 1700, '2020-05-09', 'BOLIVIANOS'),
(7, 3, 2500, '2020-05-21', 'BOLIVIANOS'),
(8, 1, 1100, '2020-05-11', 'EUROS'),
(9, 1, 2500, '2020-06-01', 'SOLES'),
(10, 3, 100, '2020-06-11', 'EUROS'),
(11, 2, 45, '2022-09-07', 'bd'),
(12, 7, 87, '2022-09-13', 'TR'),
(13, 5, 65, '2022-10-24', 'DOLARES'),
(14, 5, 65, '2022-10-24', 'DOLARES'),
(15, 7, 65, '2022-10-11', 'DOLARES'),
(16, 4, 45, '2022-10-04', 'SOLES'),
(17, 4, 677, '2022-10-12', 'SOLES');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opciones`
--

DROP TABLE IF EXISTS `opciones`;
CREATE TABLE IF NOT EXISTS `opciones` (
  `id_opcion` int(11) NOT NULL AUTO_INCREMENT,
  `id_grupo` int(11) NOT NULL,
  `opcion` varchar(50) NOT NULL,
  `contenido` varchar(100) NOT NULL,
  `orden` int(11) NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_opcion`),
  KEY `id_grupo` (`id_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `opciones`
--

INSERT INTO `opciones` (`id_opcion`, `id_grupo`, `opcion`, `contenido`, `orden`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 1, 'PERSONAS', '../privada/personas/personas.php', 10, '2022-07-07 01:14:16', '2022-07-07 01:14:16', 1, '1'),
(2, 1, 'USUARIOS', '../privada/usuarios/usuarios.php', 20, '2022-07-07 01:14:16', '2022-07-07 01:14:16', 1, '1'),
(3, 1, 'GRUPOS', '../privada/grupos/grupos.php', 30, '2022-07-07 01:14:16', '2022-07-07 01:14:16', 1, '1'),
(4, 1, 'ROLES', '../privada/roles/roles.php', 40, '2022-07-07 01:14:16', '2022-07-07 01:14:16', 1, '1'),
(5, 1, 'USUARIOS ROLES', '../privada/usuarios_roles/usuarios_roles.php', 50, '2022-07-07 01:14:16', '2022-07-07 01:14:16', 1, '1'),
(6, 1, 'OPCIONES', '../privada/opciones/opciones.php', 60, '2022-07-07 01:14:16', '2022-07-07 01:14:16', 1, '1'),
(7, 1, 'ACCESOS', '../privada/accesos/accesos.php', 70, '2022-07-07 01:14:16', '2022-07-07 01:14:16', 1, '1'),
(8, 2, 'DATOS TIENDA', '../privada/tienda/tienda.php', 10, '2022-07-07 01:14:16', '2022-08-05 02:35:05', 1, '1'),
(9, 2, 'PROVEEDORES', '../privada/proveedores/proveedores.php', 20, '2022-07-07 01:14:16', '2022-07-07 01:14:16', 1, '1'),
(10, 2, 'VENDEDORES', '../privada/vendedores/vendedores.php', 30, '2022-07-07 01:14:16', '2022-07-07 01:14:16', 1, '1'),
(11, 2, 'CLIENTES', '../privada/clientes/clientes.php', 40, '2022-07-07 01:14:16', '2022-07-07 01:14:16', 1, '1'),
(12, 2, 'MARCAS', '../privada/marcas/marcas.php', 50, '2022-07-07 01:14:16', '2022-07-07 01:14:16', 1, '1'),
(13, 2, 'ACCESORIOS', '../privada/accesorios/accesorios.php', 60, '2022-07-07 01:14:16', '2022-07-07 01:14:16', 1, '1'),
(14, 2, 'VENTAS', '../privada/ventas/ventas.php', 70, '2022-07-07 01:14:16', '2022-07-07 01:14:16', 1, '1'),
(15, 2, 'COMPRAS', '../privada/compras/compras.php', 80, '2022-07-07 01:14:16', '2022-07-07 01:14:16', 1, '1'),
(16, 2, 'FACTURAS', '../privada/facturas/facturas.php', 90, '2022-07-07 01:14:16', '2022-07-07 01:14:16', 1, '1'),
(17, 3, 'Rpt de personas por genero', '../privada/reportes/rpt_personas_genero.php', 10, '2022-07-07 01:14:16', '2022-08-31 00:31:51', 1, '1'),
(18, 3, 'Rpt de accesorios con marcas', ' ../privada/reportes/rpt_accesorios_marcas.php', 20, '2022-07-07 01:14:16', '2022-08-31 00:54:53', 1, '1'),
(19, 3, 'Rpt de personas con usuarios', '../privada/reportes/personas_usuarios.php', 30, '2022-07-07 01:14:16', '2022-07-07 01:14:16', 1, '1'),
(20, 3, 'Rpt de personas con fechas', '../privada/reportes/personas_fechas.php', 40, '2022-07-07 01:14:17', '2022-07-07 01:14:17', 1, '1'),
(21, 3, 'Rpt de proveedores con compras', '../privada/reportes/proveedores_compras.php', 50, '2022-07-07 01:14:17', '2022-07-07 01:14:17', 1, '1'),
(22, 3, 'Rpt de compras con fechas', '../privada/reportes/compras_fechas.php', 60, '2022-07-07 01:14:17', '2022-07-07 23:01:34', 1, '1'),
(23, 3, 'Rpt de clientes por direccion', '../privada/reportes/rpt_clientes_direccion.php', 70, '2022-07-07 05:14:17', '2022-07-08 03:01:34', 1, '1'),
(24, 3, 'Ficha tènica de personas', ' ../privada/reportes/ficha_tec_personas.php', 80, '2022-09-07 00:30:51', '2022-09-07 00:33:31', 1, '1'),
(25, 3, 'Ficha tènica de accesorios', ' ../privada/reportes/ficha_tec_accesorios.php', 90, '2022-09-07 01:10:42', '2022-09-07 01:11:36', 1, '1'),
(26, 4, 'MOVIMIENTOS', '../privada/movimientos/movimientos.php', 10, '2022-09-09 00:02:31', '2022-09-20 19:56:54', 1, '1'),
(27, 5, 'Rpt x Hotel', '../privada/reportes/hotel.php', 10, '2022-09-28 00:01:02', '2022-09-28 00:01:02', 1, '1'),
(28, 5, 'Ficha Técnica Hotel', '../privada/reportes/fthotel.php', 20, '2022-09-28 00:01:02', '2022-09-28 00:01:02', 1, '1'),
(29, 5, 'CARRERAS', '../privada/institutos/institutos.php', 10, '2022-09-30 00:05:47', '2022-09-30 00:05:47', 1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

DROP TABLE IF EXISTS `personas`;
CREATE TABLE IF NOT EXISTS `personas` (
  `id_persona` int(11) NOT NULL AUTO_INCREMENT,
  `id_tienda` int(11) NOT NULL,
  `ci` varchar(15) NOT NULL,
  `nombres` varchar(20) NOT NULL,
  `ap` varchar(20) DEFAULT NULL,
  `am` varchar(20) DEFAULT NULL,
  `genero` char(1) DEFAULT 'F',
  `telefono` varchar(15) DEFAULT NULL,
  `direccion` varchar(20) DEFAULT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_persona`),
  KEY `id_tienda` (`id_tienda`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`id_persona`, `id_tienda`, `ci`, `nombres`, `ap`, `am`, `genero`, `telefono`, `direccion`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 1, '10645950', 'LOURDES', 'ALBORNOZ', 'TARIFA', 'F', '63772050', 'B. MORROS BLANCOS', '2022-07-07 01:14:15', '2022-07-07 01:14:15', 1, '1'),
(2, 1, '10645363', 'AGUSTIN', 'ARMELLA', 'MENDIETA', 'F', '676350', 'B. SAN MARCOS', '2022-07-07 01:14:15', '2022-07-07 01:14:15', 1, '1'),
(3, 1, '12345566', 'MOISES', 'AMADOR', 'QUIROGA', 'F', '933630', 'B. SAN LUIS', '2022-07-07 01:14:15', '2022-08-09 23:55:48', 1, '0'),
(4, 1, '10567876', 'GUSTAVO', 'POTAL', 'ALMAZAN', 'F', '636955050', 'B. LOS CHAPACOS', '2022-07-07 01:14:15', '2022-07-07 01:14:15', 1, '1'),
(5, 1, '65443366', 'MARIO', 'BARRIENTOS', 'LOZANO', 'F', '639682050', 'B. SAN MARTIN', '2022-07-07 01:14:15', '2022-07-07 01:14:15', 1, '1'),
(6, 1, '56789988', 'WILSON', 'MAMANI', 'CRUZ', 'F', '6376985750', 'B. LA FLORIDA', '2022-07-07 01:14:15', '2022-08-11 23:28:37', 1, '0'),
(7, 1, '68585846', 'PEDRO', 'QUISPE', 'ORTIZ', 'F', '637547450', 'B. GUADALQUIVIR', '2022-07-07 01:14:15', '2022-07-07 01:14:15', 1, '1'),
(8, 1, '64543657', 'JOSE', 'CAMPO', 'CUELLAR', 'F', '637595050', 'B. BOLIVAR', '2022-07-07 01:14:15', '2022-07-07 01:14:15', 1, '1'),
(9, 1, '14645534', 'ROMEL', 'ROSAL', 'FLORES', 'F', '5755654', 'B. MOTO MENDEZ', '2022-07-07 01:14:15', '2022-07-07 01:14:15', 1, '1'),
(10, 1, '85746545', 'FAVIO', 'ROMERO', 'FERNANDEZ', 'F', '639585750', 'B. SAN JORGE', '2022-07-07 01:14:15', '2022-07-07 01:14:15', 1, '1'),
(11, 1, '85737545', 'GLADIS', 'MARTINEZ', 'CALIZAYA', 'F', '635855750', 'B. BOLIVAR', '2022-07-07 01:14:15', '2022-07-07 01:14:15', 1, '1'),
(12, 1, '23334', 'EER', 'ASS', 'ASD', 'F', '34566', 'DS34', '2022-08-03 05:40:42', '2022-08-03 01:40:43', 1, '1'),
(13, 1, '2345', 'DSDD', 'DSFF', 'SDSD', 'm', '4567', 'DSD45', '2022-09-02 08:22:20', '2022-09-02 04:22:20', 1, '1'),
(14, 1, '1233', 'DSDD', 'ILAS', 'SDSD', 'f', '4567', 'DSD45', '2022-09-02 08:23:48', '2022-09-02 04:23:48', 1, '1'),
(15, 1, '4567', 'MILA', 'MONTES', 'VEGA', 'f', '566778', 'B.FLORES', '2022-09-03 00:03:31', '2022-09-02 20:03:31', 1, '1');

--
-- Disparadores `personas`
--
DROP TRIGGER IF EXISTS `inserta_registro_huellas`;
DELIMITER $$
CREATE TRIGGER `inserta_registro_huellas` BEFORE INSERT ON `personas` FOR EACH ROW BEGIN

INSERT INTO _registro_huellas (consulta, _fecha_inser, _usuario)VALUES("INSERT-PERSONAS",NEW.fec_insercion, NEW.usuario);

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE IF NOT EXISTS `proveedores` (
  `id_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `direccion` varchar(40) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id_proveedor`, `nombre`, `direccion`, `telefono`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 'MARCOS ARIAS VALDEZ', 'B.AMERICAS', '63886489', '2022-07-07 01:14:10', '2022-07-07 01:14:10', 1, '1'),
(2, 'MARCELO VIDEZ ALMAZAN', 'B.PANOSAS', '63876489', '2022-07-07 01:14:10', '2022-07-07 01:14:10', 1, '1'),
(3, 'JORGE VILLARUEL', 'B.CAMPERO', '63986489', '2022-07-07 01:14:10', '2022-07-07 01:14:10', 1, '1'),
(4, 'RIDER MENDOZA MARQUEZ', 'B.MORENO', '78886489', '2022-07-07 01:14:10', '2022-07-07 01:14:10', 1, '1'),
(5, 'OCTAVIO OCAÑA MONTES', 'B.RENACER', '23886489', '2022-07-07 01:14:10', '2022-07-07 01:14:10', 1, '1'),
(6, 'MINERVA BENAVIDEZ', 'B.AMERICAS', '09886489', '2022-07-07 01:14:10', '2022-07-07 01:14:10', 1, '1'),
(7, 'SELIDA FLORES VALLEJOS', 'B.MIRA FLORES', '53886489', '2022-07-07 01:14:10', '2022-07-07 01:14:10', 1, '1'),
(8, 'JULIANA TEJERINA NAVA', 'B.BUENOS AIRES', '83886489', '2022-07-07 01:14:10', '2022-07-07 01:14:10', 1, '1'),
(9, 'LUCIANA TARIFA VEGA', 'B.AZULES', '93886489', '2022-07-07 01:14:10', '2022-07-07 01:14:10', 1, '1'),
(10, 'YOLANDA VARGAS ROCABADO', 'B.MONARCA', '13886489', '2022-07-07 01:14:10', '2022-07-07 01:14:10', 1, '1'),
(11, 'ASW', 'DSD45', '4567', '2022-09-02 16:38:07', '2022-09-02 12:38:07', 1, '1'),
(12, 'DFGF', 'GGB', '736335', '2022-09-02 17:01:08', '2022-09-02 13:01:08', 1, '1'),
(13, 'MILCA ARIAS', 'B.PEDRO ANTONIO FLORES', '34355', '2022-09-03 00:11:29', '2022-09-02 20:11:29', 1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `rol` varchar(100) NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `rol`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 'ADMINISTRADOR', '2022-07-07 01:14:15', '2022-07-07 01:14:15', 1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tienda`
--

DROP TABLE IF EXISTS `tienda`;
CREATE TABLE IF NOT EXISTS `tienda` (
  `id_tienda` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `direccion` varchar(40) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_tienda`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tienda`
--

INSERT INTO `tienda` (`id_tienda`, `nombre`, `direccion`, `telefono`, `logo`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 'SISTECSO', 'B. MOTO MENDEZZ', '25635345', 'IMG38202215127.png', '2022-07-07 01:14:09', '2022-08-05 03:41:53', 1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_movimientos`
--

DROP TABLE IF EXISTS `tipos_movimientos`;
CREATE TABLE IF NOT EXISTS `tipos_movimientos` (
  `id_tipo_movimiento` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_movimiento` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_tipo_movimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipos_movimientos`
--

INSERT INTO `tipos_movimientos` (`id_tipo_movimiento`, `tipo_movimiento`) VALUES
(1, 'DEPOSITO'),
(2, 'RETIRO'),
(3, 'TRANSFERENCIA'),
(4, 'dfg'),
(5, 'tree'),
(6, 'BFA'),
(7, 'UY'),
(8, 'UYU');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `id_persona` int(11) NOT NULL,
  `nom_usuario` varchar(20) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `id_persona` (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `id_persona`, `nom_usuario`, `clave`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 1, 'admin', '$2y$10$HxB1sZ3p/ok/Aa3cyATcsuGZoUrZzW5.TtmaiYh61S38axFgKVmXK', '2022-07-07 01:14:15', '2022-07-07 01:14:15', 1, '1'),
(2, 12, 'lolito', '$2y$10$/quY5U/uY95ESthrbe6qduVxp9l06y4CqLPpNxsoYMzOOQams.Flm', '2022-09-02 07:54:24', '2022-09-02 03:54:24', 1, '1'),
(3, 14, 'ilita', '$2y$10$GuJH86iTg0tD1xuISz9x9uzi.M6OtnXfIr4pFcd4BM9ontCuuD36O', '2022-09-02 08:24:49', '2022-09-02 04:24:49', 1, '1'),
(4, 14, 'lilaa', '$2y$10$LBsaGpHTR4t8LD8c0qdBfeRQbRbBm4tIRyjv7Rm0q0l./RQz9D5Ka', '2022-09-03 00:01:22', '2022-09-02 20:01:52', 1, '1'),
(5, 15, 'mili', '$2y$10$wgEB0T9bcotnw75Eq/vcw.knQfwT1G2jT.nHWIop3wg6ut.wScNIC', '2022-09-03 00:04:03', '2022-09-02 20:04:03', 1, '1'),
(6, 15, 'milii', '$2y$10$0wh8CYn3GHUogF8Bq8j/n.Rqu.03kE54rcG8dOhRreVrZDFmYnWb.', '2022-09-03 00:05:48', '2022-09-02 20:05:48', 1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_roles`
--

DROP TABLE IF EXISTS `usuarios_roles`;
CREATE TABLE IF NOT EXISTS `usuarios_roles` (
  `id_usuario_rol` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_usuario_rol`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_rol` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios_roles`
--

INSERT INTO `usuarios_roles` (`id_usuario_rol`, `id_usuario`, `id_rol`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 1, 1, '2022-07-07 01:14:16', '2022-07-07 01:14:16', 1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedores`
--

DROP TABLE IF EXISTS `vendedores`;
CREATE TABLE IF NOT EXISTS `vendedores` (
  `id_vendedor` int(11) NOT NULL AUTO_INCREMENT,
  `id_tienda` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `ci` varchar(10) NOT NULL,
  `direccion` varchar(40) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_vendedor`),
  KEY `id_tienda` (`id_tienda`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vendedores`
--

INSERT INTO `vendedores` (`id_vendedor`, `id_tienda`, `nombre`, `apellido`, `ci`, `direccion`, `email`, `telefono`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 1, 'MARCELO', 'ARMELLA MORSA', '46646464', 'B.MONTE SUB', 'marcelo67@gmail.com.bo', '64454545', '2022-07-07 01:14:09', '2022-07-07 01:14:09', 1, '1'),
(2, 1, 'MARCIAL', 'AMADOR VARGAS', '67453246', 'B.AVAROA', 'marcial@gmail.com.bo', '12346789', '2022-07-07 01:14:09', '2022-07-07 01:14:09', 1, '1'),
(3, 1, 'JULIANA', 'MENDOZA APARICIO', '65352749', 'B.FATIMA', 'julia23@gmail.com.bo', '67346550', '2022-07-07 01:14:09', '2022-07-07 01:14:09', 1, '1'),
(4, 1, 'MARCOS', 'BETANCUR ALMAZAN', '98373526', 'B.MOTO MENDEZ', 'marcos76@gmail.com.bo', '78364567', '2022-07-07 01:14:09', '2022-07-07 01:14:09', 1, '1'),
(5, 1, 'OSCAR', 'MONTES VALLE', '65438799', 'B.COSTRUCTOR', 'oscar65@gmail.com.bo', '87432334', '2022-07-07 01:14:09', '2022-07-07 01:14:09', 1, '1'),
(6, 1, 'JUAN', 'MERCADO VILTE', '46647664', 'B.BOLIVAR', 'juan45@gmail.com.bo', '63889267', '2022-07-07 01:14:10', '2022-07-07 01:14:10', 1, '1'),
(7, 1, 'MOISES', 'JURADO MONTE', '67487246', 'B.LOURDES', 'moises65@gmail.com.bo', '12348989', '2022-07-07 01:14:10', '2022-07-07 01:14:10', 1, '1'),
(8, 1, 'JULIA', 'CAMACHO APARICIO', '65092749', 'B.FATIMA', 'julia23@gmail.com.bo', '65646550', '2022-07-07 01:14:10', '2022-07-07 01:14:10', 1, '1'),
(9, 1, 'MARCELA', 'NEVADA ALMAZAN', '98374526', 'B.MENDOZA', 'marcela76@gmail.com.bo', '68364567', '2022-07-07 01:14:10', '2022-07-07 01:14:10', 1, '1'),
(10, 1, 'HORACIOY', 'ROJAS BALLEJOS', '654387690', 'B.PALMARCITOO', 'yoracio95@gmail.com.bo', '876323340', '2022-07-07 01:14:10', '2022-07-07 23:05:51', 1, '1'),
(11, 1, 'TTRRSRSS', 'TSTDF', '25242332', 'HSGSG54', 'bb123@gmail.com', '63524323', '2022-07-08 03:12:51', '2022-07-07 23:12:58', 1, '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

DROP TABLE IF EXISTS `ventas`;
CREATE TABLE IF NOT EXISTS `ventas` (
  `id_venta` int(11) NOT NULL AUTO_INCREMENT,
  `id_vendedor` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `fecha_venta` date NOT NULL,
  `total_venta` float NOT NULL,
  `fec_insercion` timestamp NOT NULL,
  `fec_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `id_vendedor` (`id_vendedor`),
  KEY `id_cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_venta`, `id_vendedor`, `id_cliente`, `fecha_venta`, `total_venta`, `fec_insercion`, `fec_modificacion`, `usuario`, `estado`) VALUES
(1, 1, 1, '2020-03-23', 540, '2022-07-07 01:14:12', '2022-07-07 01:14:12', 1, '1'),
(2, 3, 6, '2020-03-23', 640, '2022-07-07 01:14:12', '2022-07-07 01:14:12', 1, '1'),
(3, 8, 4, '2020-04-24', 240, '2022-07-07 01:14:12', '2022-07-07 01:14:12', 1, '1'),
(4, 2, 9, '2020-06-23', 340, '2022-07-07 01:14:12', '2022-07-07 01:14:12', 1, '1'),
(5, 6, 5, '2021-07-12', 940, '2022-07-07 01:14:12', '2022-07-07 01:14:12', 1, '1'),
(6, 9, 10, '2021-03-13', 640, '2022-07-07 01:14:12', '2022-07-07 01:14:12', 1, '1'),
(7, 4, 7, '2021-03-16', 540, '2022-07-07 01:14:12', '2022-07-07 01:14:12', 1, '1'),
(8, 10, 2, '2022-06-23', 440, '2022-07-07 01:14:12', '2022-07-07 01:14:12', 1, '1'),
(9, 7, 2, '2022-04-28', 7400, '2022-07-07 01:14:12', '2022-08-24 01:39:36', 1, '1'),
(10, 2, 8, '2022-03-23', 840, '2022-07-07 01:14:12', '2022-08-24 00:47:42', 1, '1');

--
-- Disparadores `ventas`
--
DROP TRIGGER IF EXISTS `inserta_registro_huellas0`;
DELIMITER $$
CREATE TRIGGER `inserta_registro_huellas0` BEFORE UPDATE ON `ventas` FOR EACH ROW BEGIN

INSERT INTO _registro_huellas (consulta, _fecha_inser, _usuario)VALUES("MODIF-VENTAS",NEW.fec_insercion, NEW.usuario);

END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `inserta_registro_huellas3`;
DELIMITER $$
CREATE TRIGGER `inserta_registro_huellas3` BEFORE UPDATE ON `ventas` FOR EACH ROW BEGIN

INSERT INTO _registro_huellas (consulta, _fecha_inser, _usuario)VALUES("MODIF-VENTAS",NEW.fec_insercion, NEW.usuario);

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_compras`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `vista_compras`;
CREATE TABLE IF NOT EXISTS `vista_compras` (
`fecha_compra` date
,`total_compra` float
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_compras1`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `vista_compras1`;
CREATE TABLE IF NOT EXISTS `vista_compras1` (
`fecha_compra` date
,`total_compra` float
,`nombre` varchar(30)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_personas`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `vista_personas`;
CREATE TABLE IF NOT EXISTS `vista_personas` (
`ci` varchar(15)
,`nombres` varchar(20)
,`ap` varchar(20)
,`am` varchar(20)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_prov_compr`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `vista_prov_compr`;
CREATE TABLE IF NOT EXISTS `vista_prov_compr` (
`fecha_compra` date
,`total_compra` float
,`nombre` varchar(30)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `_registro_huellas`
--

DROP TABLE IF EXISTS `_registro_huellas`;
CREATE TABLE IF NOT EXISTS `_registro_huellas` (
  `id_registro_huella` int(11) NOT NULL AUTO_INCREMENT,
  `consulta` varchar(50) NOT NULL,
  `_fecha_inser` timestamp NOT NULL,
  `_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_registro_huella`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `_registro_huellas`
--

INSERT INTO `_registro_huellas` (`id_registro_huella`, `consulta`, `_fecha_inser`, `_usuario`) VALUES
(1, 'INSERT-PERSONAS', '2022-08-03 05:40:42', 1),
(2, 'MODIF-COMPRAS', '2022-07-07 01:14:13', 1),
(3, 'MODIF-VENTAS', '2022-07-07 01:14:12', 1),
(4, 'MODIF-VENTAS', '2022-07-07 01:14:12', 1),
(5, 'MODIF-VENTAS', '2022-07-07 01:14:12', 1),
(6, 'MODIF-VENTAS', '2022-07-07 01:14:12', 1),
(7, 'MODIF-VENTAS', '2022-07-07 01:14:12', 1),
(8, 'MODIF-VENTAS', '2022-07-07 01:14:12', 1),
(9, 'MODIF-VENTAS', '2022-07-07 01:14:12', 1),
(10, 'MODIF-VENTAS', '2022-07-07 01:14:12', 1),
(16, 'INSERT-PERSONAS', '2022-09-02 08:22:20', 1),
(17, 'INSERT-PERSONAS', '2022-09-02 08:23:48', 1),
(19, 'MODIF-COMPRAS', '2022-09-02 17:02:01', 1),
(20, 'INSERT-PERSONAS', '2022-09-03 00:03:31', 1),
(21, 'MODIF-COMPRAS', '2022-09-03 00:08:38', 1),
(22, 'MODIF-COMPRAS', '2022-09-03 00:10:38', 1);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_compras`
--
DROP TABLE IF EXISTS `vista_compras`;

DROP VIEW IF EXISTS `vista_compras`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_compras`  AS  select `compras`.`fecha_compra` AS `fecha_compra`,`compras`.`total_compra` AS `total_compra` from `compras` where (`compras`.`fecha_compra` between '2021-01-01' and '2021-12-30') ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_compras1`
--
DROP TABLE IF EXISTS `vista_compras1`;

DROP VIEW IF EXISTS `vista_compras1`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_compras1`  AS  select `c`.`fecha_compra` AS `fecha_compra`,`c`.`total_compra` AS `total_compra`,`p`.`nombre` AS `nombre` from (`compras` `c` join `proveedores` `p`) where ((`c`.`fecha_compra` between '2021-01-01' and '2021-12-30') and (`c`.`id_proveedor` = `p`.`id_proveedor`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_personas`
--
DROP TABLE IF EXISTS `vista_personas`;

DROP VIEW IF EXISTS `vista_personas`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_personas`  AS  select `personas`.`ci` AS `ci`,`personas`.`nombres` AS `nombres`,`personas`.`ap` AS `ap`,`personas`.`am` AS `am` from `personas` where (`personas`.`estado` = '1') ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_prov_compr`
--
DROP TABLE IF EXISTS `vista_prov_compr`;

DROP VIEW IF EXISTS `vista_prov_compr`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_prov_compr`  AS  select `c`.`fecha_compra` AS `fecha_compra`,`c`.`total_compra` AS `total_compra`,`p`.`nombre` AS `nombre` from (`compras` `c` join `proveedores` `p` on((`p`.`id_proveedor` = `c`.`id_proveedor`))) where ((`p`.`estado` <> '0') and (`c`.`estado` <> '0')) order by `c`.`id_proveedor` desc ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `accesorios`
--
ALTER TABLE `accesorios`
  ADD CONSTRAINT `accesorios_ibfk_1` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`id_tienda`),
  ADD CONSTRAINT `accesorios_ibfk_2` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id_marca`),
  ADD CONSTRAINT `accesorios_ibfk_3` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`);

--
-- Filtros para la tabla `accesorios_precios`
--
ALTER TABLE `accesorios_precios`
  ADD CONSTRAINT `accesorios_precios_ibfk_1` FOREIGN KEY (`id_accesorio`) REFERENCES `accesorios` (`id_accesorio`);

--
-- Filtros para la tabla `accesos`
--
ALTER TABLE `accesos`
  ADD CONSTRAINT `accesos_ibfk_1` FOREIGN KEY (`id_opcion`) REFERENCES `opciones` (`id_opcion`),
  ADD CONSTRAINT `accesos_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);

--
-- Filtros para la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD CONSTRAINT `carreras_ibfk_1` FOREIGN KEY (`id_instituto`) REFERENCES `institutos` (`id_instituto`);

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`id_tienda`);

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`);

--
-- Filtros para la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD CONSTRAINT `detalle_compras_ibfk_1` FOREIGN KEY (`id_accesorio_precio`) REFERENCES `accesorios_precios` (`id_accesorio_precio`),
  ADD CONSTRAINT `detalle_compras_ibfk_2` FOREIGN KEY (`id_compra`) REFERENCES `compras` (`id_compra`);

--
-- Filtros para la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD CONSTRAINT `detalle_ventas_ibfk_1` FOREIGN KEY (`id_accesorio_precio`) REFERENCES `accesorios_precios` (`id_accesorio_precio`),
  ADD CONSTRAINT `detalle_ventas_ibfk_2` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`);

--
-- Filtros para la tabla `existencia`
--
ALTER TABLE `existencia`
  ADD CONSTRAINT `existencia_ibfk_1` FOREIGN KEY (`id_detalle_venta`) REFERENCES `detalle_ventas` (`id_detalle_venta`),
  ADD CONSTRAINT `existencia_ibfk_2` FOREIGN KEY (`id_detalle_compra`) REFERENCES `detalle_compras` (`id_detalle_compra`),
  ADD CONSTRAINT `existencia_ibfk_3` FOREIGN KEY (`id_accesorio`) REFERENCES `accesorios` (`id_accesorio`);

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedores` (`id_vendedor`),
  ADD CONSTRAINT `facturas_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`);

--
-- Filtros para la tabla `hoteles`
--
ALTER TABLE `hoteles`
  ADD CONSTRAINT `hoteles_ibfk_1` FOREIGN KEY (`id_cadena_agencia_viaje`) REFERENCES `cadena_agencia_viajes` (`id_cadena_agencia_viaje`);

--
-- Filtros para la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD CONSTRAINT `movimientos_ibfk_1` FOREIGN KEY (`id_tipo_movimiento`) REFERENCES `tipos_movimientos` (`id_tipo_movimiento`);

--
-- Filtros para la tabla `opciones`
--
ALTER TABLE `opciones`
  ADD CONSTRAINT `opciones_ibfk_1` FOREIGN KEY (`id_grupo`) REFERENCES `grupos` (`id_grupo`);

--
-- Filtros para la tabla `personas`
--
ALTER TABLE `personas`
  ADD CONSTRAINT `personas_ibfk_1` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`id_tienda`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`);

--
-- Filtros para la tabla `usuarios_roles`
--
ALTER TABLE `usuarios_roles`
  ADD CONSTRAINT `usuarios_roles_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `usuarios_roles_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);

--
-- Filtros para la tabla `vendedores`
--
ALTER TABLE `vendedores`
  ADD CONSTRAINT `vendedores_ibfk_1` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`id_tienda`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedores` (`id_vendedor`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
