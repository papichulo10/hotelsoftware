-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-02-2017 a las 13:09:16
-- Versión del servidor: 5.6.16
-- Versión de PHP: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `hotel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_descripcion` varchar(100) DEFAULT NULL,
  `c_estado` int(11) DEFAULT '1',
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE IF NOT EXISTS `ciudad` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_pais` int(11) DEFAULT NULL,
  `c_descripcion` varchar(100) DEFAULT NULL,
  `c_estado` int(11) DEFAULT '1',
  PRIMARY KEY (`c_id`),
  KEY `pais_fk` (`c_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_tipocliente` int(11) DEFAULT NULL,
  `c_dni` varchar(8) DEFAULT NULL,
  `c_nombres` varchar(100) DEFAULT NULL,
  `c_direccion` varchar(200) DEFAULT NULL,
  `c_fechareg` date DEFAULT NULL,
  `c_celular` varchar(15) DEFAULT NULL,
  `c_estado` int(11) DEFAULT '1',
  PRIMARY KEY (`c_id`),
  KEY `tipocliente_fk` (`c_tipocliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consumo`
--

CREATE TABLE IF NOT EXISTS `consumo` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_cliente` int(11) DEFAULT NULL,
  `c_empleado` int(11) DEFAULT NULL,
  `c_fecha` date DEFAULT NULL,
  `c_total` double DEFAULT NULL,
  `c_igv` double DEFAULT NULL,
  `c_estado` int(11) DEFAULT '1',
  PRIMARY KEY (`c_id`),
  KEY `fk_cliente` (`c_cliente`),
  KEY `fk_empleado` (`c_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_consumo`
--

CREATE TABLE IF NOT EXISTS `detalle_consumo` (
  `dc_consumo` int(11) NOT NULL,
  `dc_producto` int(11) NOT NULL,
  `dc_cantidad` int(11) DEFAULT NULL,
  `dc_precio_unitario` double DEFAULT NULL,
  `dc_igv` double DEFAULT NULL,
  `dc_monto` double DEFAULT NULL,
  `dc_estado` int(11) DEFAULT '1',
  PRIMARY KEY (`dc_consumo`,`dc_producto`),
  KEY `fk_producto` (`dc_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_reserva`
--

CREATE TABLE IF NOT EXISTS `detalle_reserva` (
  `dr_reserva` int(11) NOT NULL,
  `dr_habitacion` int(11) NOT NULL,
  `dr_monto` double DEFAULT NULL,
  `dr_estado` int(11) DEFAULT '1',
  PRIMARY KEY (`dr_reserva`,`dr_habitacion`),
  KEY `fk_habitacion` (`dr_habitacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_servicio`
--

CREATE TABLE IF NOT EXISTS `detalle_servicio` (
  `ds_entrada` int(11) NOT NULL,
  `ds_producto` int(11) NOT NULL,
  `ds_cantidad` int(11) DEFAULT NULL,
  `ds_precio_unitario` double DEFAULT NULL,
  `ds_igv` double DEFAULT NULL,
  `ds_monto` double DEFAULT NULL,
  `ds_estado` int(11) DEFAULT '1',
  PRIMARY KEY (`ds_entrada`,`ds_producto`),
  KEY `fk_producto1` (`ds_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE IF NOT EXISTS `empleado` (
  `e_id` int(11) NOT NULL AUTO_INCREMENT,
  `e_dni` varchar(8) DEFAULT NULL,
  `e_nombres` varchar(100) DEFAULT NULL,
  `e_apellidos` varchar(100) DEFAULT NULL,
  `e_direccion` varchar(200) DEFAULT NULL,
  `e_usuario` varchar(50) DEFAULT NULL,
  `e_clave` varchar(100) DEFAULT NULL,
  `e_celular` varchar(15) DEFAULT NULL,
  `e_sexo` varchar(15) DEFAULT NULL,
  `e_fechareg` date DEFAULT NULL,
  `e_tipoempleado` int(11) NOT NULL,
  `e_estado` int(11) DEFAULT '1',
  PRIMARY KEY (`e_id`),
  KEY `tipoempleado_fk1` (`e_tipoempleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enseres`
--

CREATE TABLE IF NOT EXISTS `enseres` (
  `e_categoria` int(11) NOT NULL,
  `e_habitacion` int(11) NOT NULL,
  `e_descripcion` varchar(100) DEFAULT NULL,
  `e_estado` int(11) DEFAULT '1',
  PRIMARY KEY (`e_categoria`,`e_habitacion`),
  KEY `fk_habitacion1` (`e_habitacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrada`
--

CREATE TABLE IF NOT EXISTS `entrada` (
  `e_id` int(11) NOT NULL AUTO_INCREMENT,
  `e_huesped` int(11) DEFAULT NULL,
  `e_empleado` int(11) DEFAULT NULL,
  `e_habitacion` int(11) DEFAULT NULL,
  `e_ciudad` int(11) DEFAULT NULL,
  `e_fecha` date DEFAULT NULL,
  `e_total` double DEFAULT NULL,
  `e_estado` int(11) DEFAULT '1',
  PRIMARY KEY (`e_id`),
  KEY `fk_huesped` (`e_huesped`),
  KEY `fk_empleado2` (`e_empleado`),
  KEY `fk_ciudad1` (`e_ciudad`),
  KEY `fk_habitacion2` (`e_habitacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitacion`
--

CREATE TABLE IF NOT EXISTS `habitacion` (
  `h_id` int(11) NOT NULL AUTO_INCREMENT,
  `h_tipohabitacion` int(11) DEFAULT NULL,
  `h_nro` varchar(10) DEFAULT NULL,
  `h_descripcion` varchar(100) DEFAULT NULL,
  `h_estado` int(11) DEFAULT '1',
  PRIMARY KEY (`h_id`),
  KEY `tipohabitacion_fk` (`h_tipohabitacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `huesped`
--

CREATE TABLE IF NOT EXISTS `huesped` (
  `h_id` int(11) NOT NULL AUTO_INCREMENT,
  `h_tipodocumento` int(11) DEFAULT NULL,
  `h_documento` varchar(8) DEFAULT NULL,
  `h_nombres` varchar(100) DEFAULT NULL,
  `h_direccion` varchar(200) DEFAULT NULL,
  `h_fechareg` date DEFAULT NULL,
  `h_celular` varchar(15) DEFAULT NULL,
  `h_estado` int(11) DEFAULT '1',
  PRIMARY KEY (`h_id`),
  KEY `tipodoc_fk` (`h_tipodocumento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE IF NOT EXISTS `pais` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_descripcion` varchar(100) DEFAULT NULL,
  `p_estado` int(11) DEFAULT '1',
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE IF NOT EXISTS `producto` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_categoria` int(11) DEFAULT NULL,
  `p_descripcion` varchar(100) DEFAULT NULL,
  `p_estado` int(11) DEFAULT '1',
  PRIMARY KEY (`p_id`),
  KEY `categoria_fk` (`p_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE IF NOT EXISTS `reserva` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `r_cliente` int(11) DEFAULT NULL,
  `r_fecha` date DEFAULT NULL,
  `r_total` double DEFAULT NULL,
  `r_estado` int(11) DEFAULT '1',
  PRIMARY KEY (`r_id`),
  KEY `fk_cliente1` (`r_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE IF NOT EXISTS `servicio` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_entrada` int(11) DEFAULT NULL,
  `s_total` double DEFAULT NULL,
  `s_estado` int(11) DEFAULT '1',
  PRIMARY KEY (`s_id`),
  KEY `fk_entrada` (`s_entrada`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_cliente`
--

CREATE TABLE IF NOT EXISTS `tipo_cliente` (
  `tc_id` int(11) NOT NULL AUTO_INCREMENT,
  `tc_descripcion` varchar(100) DEFAULT NULL,
  `tc_estado` int(11) DEFAULT '1',
  PRIMARY KEY (`tc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE IF NOT EXISTS `tipo_documento` (
  `td_id` int(11) NOT NULL AUTO_INCREMENT,
  `td_descripcion` varchar(100) DEFAULT NULL,
  `td_estado` int(11) DEFAULT '1',
  PRIMARY KEY (`td_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_empleado`
--

CREATE TABLE IF NOT EXISTS `tipo_empleado` (
  `te_id` int(11) NOT NULL AUTO_INCREMENT,
  `te_descripcion` varchar(100) DEFAULT NULL,
  `te_estado` int(11) DEFAULT '1',
  PRIMARY KEY (`te_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_habitacion`
--

CREATE TABLE IF NOT EXISTS `tipo_habitacion` (
  `th_id` int(11) NOT NULL AUTO_INCREMENT,
  `th_descripcion` varchar(100) DEFAULT NULL,
  `th_estado` int(11) DEFAULT '1',
  PRIMARY KEY (`th_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_servicio`
--

CREATE TABLE IF NOT EXISTS `tipo_servicio` (
  `ts_id` int(11) NOT NULL AUTO_INCREMENT,
  `ts_descripcion` varchar(100) DEFAULT NULL,
  `ts_estado` int(11) DEFAULT '1',
  PRIMARY KEY (`ts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD CONSTRAINT `pais_fk` FOREIGN KEY (`c_pais`) REFERENCES `pais` (`p_id`);

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `tipocliente_fk` FOREIGN KEY (`c_tipocliente`) REFERENCES `tipo_cliente` (`tc_id`);

--
-- Filtros para la tabla `consumo`
--
ALTER TABLE `consumo`
  ADD CONSTRAINT `fk_cliente` FOREIGN KEY (`c_cliente`) REFERENCES `cliente` (`c_id`),
  ADD CONSTRAINT `fk_empleado` FOREIGN KEY (`c_empleado`) REFERENCES `empleado` (`e_id`);

--
-- Filtros para la tabla `detalle_consumo`
--
ALTER TABLE `detalle_consumo`
  ADD CONSTRAINT `fk_producto` FOREIGN KEY (`dc_producto`) REFERENCES `producto` (`p_id`),
  ADD CONSTRAINT `fk_consumo` FOREIGN KEY (`dc_consumo`) REFERENCES `consumo` (`c_id`);

--
-- Filtros para la tabla `detalle_reserva`
--
ALTER TABLE `detalle_reserva`
  ADD CONSTRAINT `fk_habitacion` FOREIGN KEY (`dr_habitacion`) REFERENCES `habitacion` (`h_id`),
  ADD CONSTRAINT `fk_reserva` FOREIGN KEY (`dr_reserva`) REFERENCES `reserva` (`r_id`);

--
-- Filtros para la tabla `detalle_servicio`
--
ALTER TABLE `detalle_servicio`
  ADD CONSTRAINT `fk_producto1` FOREIGN KEY (`ds_producto`) REFERENCES `producto` (`p_id`),
  ADD CONSTRAINT `fk_entrada1` FOREIGN KEY (`ds_entrada`) REFERENCES `entrada` (`e_id`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `tipoempleado_fk1` FOREIGN KEY (`e_tipoempleado`) REFERENCES `tipo_empleado` (`te_id`);

--
-- Filtros para la tabla `enseres`
--
ALTER TABLE `enseres`
  ADD CONSTRAINT `fk_habitacion1` FOREIGN KEY (`e_habitacion`) REFERENCES `habitacion` (`h_id`),
  ADD CONSTRAINT `fk_categoria1` FOREIGN KEY (`e_categoria`) REFERENCES `categoria` (`c_id`);

--
-- Filtros para la tabla `entrada`
--
ALTER TABLE `entrada`
  ADD CONSTRAINT `fk_huesped` FOREIGN KEY (`e_huesped`) REFERENCES `huesped` (`h_id`),
  ADD CONSTRAINT `fk_empleado2` FOREIGN KEY (`e_empleado`) REFERENCES `empleado` (`e_id`),
  ADD CONSTRAINT `fk_ciudad1` FOREIGN KEY (`e_ciudad`) REFERENCES `ciudad` (`c_id`),
  ADD CONSTRAINT `fk_habitacion2` FOREIGN KEY (`e_habitacion`) REFERENCES `habitacion` (`h_id`);

--
-- Filtros para la tabla `habitacion`
--
ALTER TABLE `habitacion`
  ADD CONSTRAINT `tipohabitacion_fk` FOREIGN KEY (`h_tipohabitacion`) REFERENCES `tipo_habitacion` (`th_id`);

--
-- Filtros para la tabla `huesped`
--
ALTER TABLE `huesped`
  ADD CONSTRAINT `tipodoc_fk` FOREIGN KEY (`h_tipodocumento`) REFERENCES `tipo_documento` (`td_id`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `categoria_fk` FOREIGN KEY (`p_categoria`) REFERENCES `categoria` (`c_id`);

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `fk_cliente1` FOREIGN KEY (`r_cliente`) REFERENCES `cliente` (`c_id`);

--
-- Filtros para la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `fk_entrada` FOREIGN KEY (`s_entrada`) REFERENCES `entrada` (`e_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
