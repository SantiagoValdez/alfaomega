-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 05-03-2014 a las 20:46:04
-- Versión del servidor: 5.5.35
-- Versión de PHP: 5.3.10-1ubuntu3.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `alfaomega`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `analisis`
--

CREATE TABLE IF NOT EXISTS `analisis` (
  `idAnalisis` int(11) NOT NULL AUTO_INCREMENT,
  `idEmpleado` int(11) NOT NULL,
  `idSolicitudPrestamo` int(11) NOT NULL,
  `comprobantePago` tinyint(1) NOT NULL,
  `extractoCtaCte` tinyint(1) NOT NULL,
  `informconf` tinyint(1) NOT NULL,
  `criterion` tinyint(1) NOT NULL,
  `infocheq` tinyint(1) NOT NULL,
  `ande` tinyint(1) NOT NULL,
  `essap` tinyint(1) NOT NULL,
  `copaco` tinyint(1) NOT NULL,
  `antPoliciales` tinyint(1) NOT NULL,
  `antJudiciales` tinyint(1) NOT NULL,
  `montoOtorgado` int(10) DEFAULT NULL,
  `montoCuota` int(10) DEFAULT NULL,
  `tasaInteres` int(3) DEFAULT NULL,
  `plazo` int(5) DEFAULT NULL,
  `idOrigenDinero` int(11) DEFAULT NULL,
  `valorGarantiaTotal` int(10) DEFAULT NULL,
  `riesgo` char(1) COLLATE utf8_turkish_ci DEFAULT NULL,
  `observaciones` varchar(250) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`idAnalisis`),
  KEY `idEmpleado` (`idEmpleado`),
  KEY `idSolicitudPrestamo` (`idSolicitudPrestamo`),
  KEY `idOrigenDinero` (`idOrigenDinero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banco`
--

CREATE TABLE IF NOT EXISTS `banco` (
  `idBanco` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`idBanco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banco_por_solicitud`
--

CREATE TABLE IF NOT EXISTS `banco_por_solicitud` (
  `idBanco` int(11) NOT NULL,
  `idSolicitudPrestamo` int(11) NOT NULL,
  `nroCuenta` varchar(20) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`idBanco`,`idSolicitudPrestamo`),
  KEY `idSolicitudPrestamo` (`idSolicitudPrestamo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barrio`
--

CREATE TABLE IF NOT EXISTS `barrio` (
  `idBarrio` int(11) NOT NULL AUTO_INCREMENT,
  `idCiudad` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`idBarrio`),
  KEY `idCiudad` (`idCiudad`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `barrio`
--

INSERT INTO `barrio` (`idBarrio`, `idCiudad`, `nombre`) VALUES
(1, 1, 'Obrero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cambio_oficial`
--

CREATE TABLE IF NOT EXISTS `cambio_oficial` (
  `idCambioOficial` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `idMotivo` int(11) NOT NULL,
  PRIMARY KEY (`idCambioOficial`),
  KEY `idCliente` (`idCliente`),
  KEY `idMotivo` (`idMotivo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cheque_emitido`
--

CREATE TABLE IF NOT EXISTS `cheque_emitido` (
  `idChequeEmitido` int(11) NOT NULL AUTO_INCREMENT,
  `idPrestamo` int(11) NOT NULL,
  `idBanco` int(11) NOT NULL,
  `nroCheque` varchar(20) COLLATE utf8_turkish_ci NOT NULL,
  `monto` int(10) NOT NULL,
  `fechaEmision` date NOT NULL,
  `fechaVencimiento` date NOT NULL,
  `fechaCobro` date DEFAULT NULL,
  `cobrado` tinyint(1) NOT NULL,
  PRIMARY KEY (`idChequeEmitido`),
  KEY `idPrestamo` (`idPrestamo`),
  KEY `idBanco` (`idBanco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cheque_recibido`
--

CREATE TABLE IF NOT EXISTS `cheque_recibido` (
  `idChequeRecibido` int(11) NOT NULL AUTO_INCREMENT,
  `idPrestamo` int(11) NOT NULL,
  `idBanco` int(11) NOT NULL,
  `idProveedor` int(11) NOT NULL,
  `idTipoCheque` int(11) NOT NULL,
  `idUbicacionFisica` int(11) NOT NULL,
  `nroCheque` varchar(20) COLLATE utf8_turkish_ci NOT NULL,
  `nombreLibrador` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  `cedulaLibrador` varchar(20) COLLATE utf8_turkish_ci NOT NULL,
  `monto` int(10) NOT NULL,
  `fechaEmision` date NOT NULL,
  `fechaVencimiento` date NOT NULL,
  `cobrado` tinyint(1) NOT NULL,
  PRIMARY KEY (`idChequeRecibido`),
  KEY `idPrestamo` (`idPrestamo`),
  KEY `idBanco` (`idBanco`),
  KEY `idProveedor` (`idProveedor`),
  KEY `idTipoCheque` (`idTipoCheque`),
  KEY `idUbicacionFisica` (`idUbicacionFisica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE IF NOT EXISTS `ciudad` (
  `idCiudad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`idCiudad`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`idCiudad`, `nombre`) VALUES
(1, 'Asunción'),
(2, 'Lambaré');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` int(8) DEFAULT NULL,
  `nombres` varchar(100) COLLATE utf8_turkish_ci DEFAULT NULL,
  `apellidos` varchar(100) COLLATE utf8_turkish_ci DEFAULT NULL,
  `idNacionalidad` int(11) NOT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `idEstadoCivil` int(11) DEFAULT NULL,
  `domicilio` varchar(200) COLLATE utf8_turkish_ci DEFAULT NULL,
  `idBarrio` int(11) NOT NULL,
  `telefono` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `celular` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `email` varchar(40) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ruc` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `razonSocial` varchar(100) COLLATE utf8_turkish_ci DEFAULT NULL,
  `idRamo` int(11) NOT NULL,
  `aniosActCom` int(3) DEFAULT NULL,
  `fechaIngreso` date NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `cantHijos` int(2) DEFAULT NULL,
  `nivelAcad` varchar(20) COLLATE utf8_turkish_ci DEFAULT NULL,
  `idProfesion` int(11) DEFAULT NULL,
  `idTipoCliente` int(11) NOT NULL,
  `calificacion` int(1) NOT NULL,
  `idEstadoCliente` int(11) NOT NULL,
  PRIMARY KEY (`idCliente`),
  KEY `idNacionalidad` (`idNacionalidad`),
  KEY `idEstadoCivil` (`idEstadoCivil`),
  KEY `idBarrio` (`idBarrio`),
  KEY `idRamo` (`idRamo`),
  KEY `idEmpleado` (`idEmpleado`),
  KEY `idProfesion` (`idProfesion`),
  KEY `idTipoCliente` (`idTipoCliente`),
  KEY `idEstadoCliente` (`idEstadoCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contrato`
--

CREATE TABLE IF NOT EXISTS `contrato` (
  `idContrato` int(11) NOT NULL AUTO_INCREMENT,
  `idEmpleado` int(11) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  `salarioFijo` int(11) NOT NULL,
  `porcComision` int(3) NOT NULL,
  `cargaHoraria` int(3) DEFAULT NULL,
  `idMotivoBaja` int(11) DEFAULT NULL,
  `fechaBaja` date DEFAULT NULL,
  PRIMARY KEY (`idContrato`),
  KEY `idEmpleado` (`idEmpleado`),
  KEY `idMotivoBaja` (`idMotivoBaja`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contravoCV`
--

CREATE TABLE IF NOT EXISTS `contravoCV` (
  `idContratoCV` int(11) NOT NULL AUTO_INCREMENT,
  `idPrestamo` int(11) NOT NULL,
  `nroContrato` int(5) NOT NULL,
  `fechaSuscripcion` date NOT NULL,
  PRIMARY KEY (`idContratoCV`),
  KEY `idPrestamo` (`idPrestamo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_academicos`
--

CREATE TABLE IF NOT EXISTS `datos_academicos` (
  `idDatoAcademico` int(11) NOT NULL AUTO_INCREMENT,
  `idEmpleado` int(11) NOT NULL,
  `idProfesion` int(11) DEFAULT NULL,
  `titulo` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  `institucion` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  `idTipoFormacion` int(11) NOT NULL,
  `anioEgreso` int(4) NOT NULL,
  PRIMARY KEY (`idDatoAcademico`),
  KEY `idEmpleado` (`idEmpleado`),
  KEY `idProfesion` (`idProfesion`),
  KEY `idTipoFormacion` (`idTipoFormacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_laborales`
--

CREATE TABLE IF NOT EXISTS `datos_laborales` (
  `idDatoLaboral` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `idCiudad` int(11) NOT NULL,
  `idRamo` int(11) NOT NULL,
  `nombreEmpresa` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  `direccion` varchar(200) COLLATE utf8_turkish_ci NOT NULL,
  `telefono` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `fechaIngreso` date NOT NULL,
  `cargo` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `salario` int(10) NOT NULL,
  `contacto` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`idDatoLaboral`),
  KEY `idCliente` (`idCliente`),
  KEY `idCiudad` (`idCiudad`),
  KEY `idRamo` (`idRamo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE IF NOT EXISTS `empleado` (
  `idEmpleado` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` int(8) DEFAULT NULL,
  `nombres` varchar(100) COLLATE utf8_turkish_ci DEFAULT NULL,
  `apellidos` varchar(100) COLLATE utf8_turkish_ci DEFAULT NULL,
  `idNacionalidad` int(11) NOT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `idEstadoCivil` int(11) NOT NULL,
  `domicilio` varchar(200) COLLATE utf8_turkish_ci DEFAULT NULL,
  `idBarrio` int(11) NOT NULL,
  `telefono` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `celular` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `email` varchar(40) COLLATE utf8_turkish_ci DEFAULT NULL,
  `fechaIngreso` date NOT NULL,
  `idTipoEmpleado` int(11) NOT NULL,
  PRIMARY KEY (`idEmpleado`),
  KEY `idTipoEmpleado` (`idTipoEmpleado`),
  KEY `idNacionalidad` (`idNacionalidad`),
  KEY `idEstadoCivil` (`idEstadoCivil`),
  KEY `idBarrio` (`idBarrio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_civil`
--

CREATE TABLE IF NOT EXISTS `estado_civil` (
  `idEstadoCivil` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`idEstadoCivil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_cliente`
--

CREATE TABLE IF NOT EXISTS `estado_cliente` (
  `idEstadoCliente` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`idEstadoCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_insumo`
--

CREATE TABLE IF NOT EXISTS `estado_insumo` (
  `idEstadoInsumo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`idEstadoInsumo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_prestamo`
--

CREATE TABLE IF NOT EXISTS `estado_prestamo` (
  `idEstadoPrestamo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`idEstadoPrestamo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_proveedor`
--

CREATE TABLE IF NOT EXISTS `estado_proveedor` (
  `idEstadoProveedor` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`idEstadoProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE IF NOT EXISTS `factura` (
  `idFactura` int(11) NOT NULL AUTO_INCREMENT,
  `idAnalisis` int(11) NOT NULL,
  `iva5` int(10) NOT NULL,
  `montoTotal` int(10) NOT NULL,
  `anulado` tinyint(1) DEFAULT NULL,
  `fechaAnulacion` date DEFAULT NULL,
  PRIMARY KEY (`idFactura`),
  KEY `idAnalisis` (`idAnalisis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `garantia`
--

CREATE TABLE IF NOT EXISTS `garantia` (
  `idGarantia` int(11) NOT NULL AUTO_INCREMENT,
  `idSolicitudPrestamo` int(11) NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  `valor` int(10) NOT NULL,
  PRIMARY KEY (`idGarantia`),
  KEY `idSolicitudPrestamo` (`idSolicitudPrestamo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `motivo`
--

CREATE TABLE IF NOT EXISTS `motivo` (
  `idMotivo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`idMotivo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `motivo_baja`
--

CREATE TABLE IF NOT EXISTS `motivo_baja` (
  `idMotivoBaja` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`idMotivoBaja`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `motivo_baja`
--

INSERT INTO `motivo_baja` (`idMotivoBaja`, `descripcion`) VALUES
(1, 'Despido'),
(2, 'Renuncia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nacionalidad`
--

CREATE TABLE IF NOT EXISTS `nacionalidad` (
  `idNacionalidad` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`idNacionalidad`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `nacionalidad`
--

INSERT INTO `nacionalidad` (`idNacionalidad`, `descripcion`) VALUES
(1, 'Paraguaya');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `origen_dinero`
--

CREATE TABLE IF NOT EXISTS `origen_dinero` (
  `idOrigenDinero` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`idOrigenDinero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE IF NOT EXISTS `pago` (
  `idPago` int(11) NOT NULL AUTO_INCREMENT,
  `idContrato` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `salario` int(11) NOT NULL,
  `montoComision` int(11) NOT NULL,
  `fechaPago` date NOT NULL,
  `montoSancion` int(11) DEFAULT NULL,
  `semana` int(11) NOT NULL,
  `mes` int(11) NOT NULL,
  `anio` int(11) NOT NULL,
  `acumSancion` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPago`),
  KEY `idContrato` (`idContrato`),
  KEY `idEmpleado` (`idEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planilla_liquidacion`
--

CREATE TABLE IF NOT EXISTS `planilla_liquidacion` (
  `idPlanillaLiquidacion` int(11) NOT NULL AUTO_INCREMENT,
  `idPago` int(11) NOT NULL,
  `salarioLiquido` int(11) NOT NULL,
  `comisionLiquida` int(11) DEFAULT NULL,
  `sancionCobrada` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPlanillaLiquidacion`),
  KEY `idPago` (`idPago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

CREATE TABLE IF NOT EXISTS `prestamo` (
  `idPrestamo` int(11) NOT NULL AUTO_INCREMENT,
  `idFactura` int(11) NOT NULL,
  `idEstadoPrestamo` int(11) NOT NULL,
  `utilidad` int(10) NOT NULL,
  `saldo` int(10) NOT NULL,
  PRIMARY KEY (`idPrestamo`),
  KEY `idFactura` (`idFactura`),
  KEY `idEstadoPrestamo` (`idEstadoPrestamo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesion`
--

CREATE TABLE IF NOT EXISTS `profesion` (
  `idProfesion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`idProfesion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE IF NOT EXISTS `proveedor` (
  `idProveedor` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` int(8) DEFAULT NULL,
  `nombres` varchar(100) COLLATE utf8_turkish_ci DEFAULT NULL,
  `apellidos` varchar(100) COLLATE utf8_turkish_ci DEFAULT NULL,
  `idNacionalidad` int(11) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `idEstadoCivil` int(11) DEFAULT NULL,
  `domicilio` varchar(200) COLLATE utf8_turkish_ci DEFAULT NULL,
  `idBarrio` int(11) DEFAULT NULL,
  `telefono` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `celular` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `email` varchar(40) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ruc` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `razonSocial` varchar(100) COLLATE utf8_turkish_ci DEFAULT NULL,
  `idRamo` int(11) DEFAULT NULL,
  `aniosActCom` int(3) DEFAULT NULL,
  `fechaIngreso` date NOT NULL,
  `tasaInteres` int(3) NOT NULL,
  `lineaCredito` int(10) NOT NULL,
  `idEstadoProveedor` int(11) NOT NULL,
  PRIMARY KEY (`idProveedor`),
  KEY `idNacionalidad` (`idNacionalidad`),
  KEY `idEstadoCivil` (`idEstadoCivil`),
  KEY `idBarrio` (`idBarrio`),
  KEY `idRamo` (`idRamo`),
  KEY `idEstadoProveedor` (`idEstadoProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ramo`
--

CREATE TABLE IF NOT EXISTS `ramo` (
  `idRamo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`idRamo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `referencia`
--

CREATE TABLE IF NOT EXISTS `referencia` (
  `idReferencia` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` int(8) DEFAULT NULL,
  `nombres` varchar(100) COLLATE utf8_turkish_ci DEFAULT NULL,
  `apellidos` varchar(100) COLLATE utf8_turkish_ci DEFAULT NULL,
  `idNacionalidad` int(11) NOT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `idEstadoCivil` int(11) DEFAULT NULL,
  `telefono` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `celular` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `relacion` varchar(50) COLLATE utf8_turkish_ci DEFAULT NULL,
  `empresa` varchar(100) COLLATE utf8_turkish_ci DEFAULT NULL,
  `idRamo` int(11) NOT NULL,
  `montoSolicitado` int(10) DEFAULT NULL,
  `idTipoReferencia` int(11) NOT NULL,
  `fechaInicio` date DEFAULT NULL,
  `fechaFin` date DEFAULT NULL,
  `idCliente` int(11) NOT NULL,
  PRIMARY KEY (`idReferencia`),
  KEY `idNacionalidad` (`idNacionalidad`),
  KEY `idEstadoCivil` (`idEstadoCivil`),
  KEY `idRamo` (`idRamo`),
  KEY `idTipoReferencia` (`idTipoReferencia`),
  KEY `idCliente` (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `referencia_por_solicitud`
--

CREATE TABLE IF NOT EXISTS `referencia_por_solicitud` (
  `idReferencia` int(11) NOT NULL,
  `idSolicitudPrestamo` int(11) NOT NULL,
  PRIMARY KEY (`idReferencia`,`idSolicitudPrestamo`),
  KEY `idSolicitudPrestamo` (`idSolicitudPrestamo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud_insumo`
--

CREATE TABLE IF NOT EXISTS `solicitud_insumo` (
  `idSolicitudInsumo` int(11) NOT NULL AUTO_INCREMENT,
  `idAnalisis` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `idProveedor` int(11) NOT NULL,
  `idEstadoInsumo` int(11) NOT NULL,
  `utilidad` int(10) NOT NULL,
  PRIMARY KEY (`idSolicitudInsumo`),
  KEY `idAnalisis` (`idAnalisis`),
  KEY `idEmpleado` (`idEmpleado`),
  KEY `idProveedor` (`idProveedor`),
  KEY `idEstadoInsumo` (`idEstadoInsumo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud_prestamo`
--

CREATE TABLE IF NOT EXISTS `solicitud_prestamo` (
  `idSolicitudPrestamo` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `idTipoPrestamo` int(11) NOT NULL,
  `idEstadoPrestamo` int(11) NOT NULL,
  `montoSolicitado` int(10) NOT NULL,
  `plazo` int(5) NOT NULL,
  `montoCuota` int(10) NOT NULL,
  `calInformconf` char(3) COLLATE utf8_turkish_ci NOT NULL,
  `calCriterion` char(3) COLLATE utf8_turkish_ci NOT NULL,
  `calInfocheck` char(3) COLLATE utf8_turkish_ci NOT NULL,
  `archivosAdj` varchar(200) COLLATE utf8_turkish_ci DEFAULT NULL,
  `motivoRechazo` varchar(200) COLLATE utf8_turkish_ci DEFAULT NULL,
  `fechaSolicitud` date NOT NULL,
  PRIMARY KEY (`idSolicitudPrestamo`),
  KEY `idCliente` (`idCliente`),
  KEY `idEmpleado` (`idEmpleado`),
  KEY `idTipoPrestamo` (`idTipoPrestamo`),
  KEY `idEstadoPrestamo` (`idEstadoPrestamo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sugerencia`
--

CREATE TABLE IF NOT EXISTS `sugerencia` (
  `idSugerencia` int(11) NOT NULL AUTO_INCREMENT,
  `idAnalisis` int(11) NOT NULL,
  `montoSugerido` int(10) DEFAULT NULL,
  `plazoMaximo` int(5) DEFAULT NULL,
  PRIMARY KEY (`idSugerencia`),
  KEY `idAnalisis` (`idAnalisis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_cheque`
--

CREATE TABLE IF NOT EXISTS `tipo_cheque` (
  `idTipoCheque` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`idTipoCheque`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_cliente`
--

CREATE TABLE IF NOT EXISTS `tipo_cliente` (
  `idTipoCliente` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`idTipoCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_empleado`
--

CREATE TABLE IF NOT EXISTS `tipo_empleado` (
  `idTipoEmpleado` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`idTipoEmpleado`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `tipo_empleado`
--

INSERT INTO `tipo_empleado` (`idTipoEmpleado`, `descripcion`) VALUES
(1, 'Oficial de Cuentas'),
(2, 'Analista de Créditos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_formacion`
--

CREATE TABLE IF NOT EXISTS `tipo_formacion` (
  `idTipoFormacion` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`idTipoFormacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_prestamo`
--

CREATE TABLE IF NOT EXISTS `tipo_prestamo` (
  `idTipoPrestamo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`idTipoPrestamo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_referencia`
--

CREATE TABLE IF NOT EXISTS `tipo_referencia` (
  `idTipoReferencia` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`idTipoReferencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion_fisica`
--

CREATE TABLE IF NOT EXISTS `ubicacion_fisica` (
  `idUbicacionFisica` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`idUbicacionFisica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `analisis`
--
ALTER TABLE `analisis`
  ADD CONSTRAINT `analisis_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`),
  ADD CONSTRAINT `analisis_ibfk_2` FOREIGN KEY (`idSolicitudPrestamo`) REFERENCES `solicitud_prestamo` (`idSolicitudPrestamo`),
  ADD CONSTRAINT `analisis_ibfk_3` FOREIGN KEY (`idOrigenDinero`) REFERENCES `origen_dinero` (`idOrigenDinero`);

--
-- Filtros para la tabla `banco_por_solicitud`
--
ALTER TABLE `banco_por_solicitud`
  ADD CONSTRAINT `banco_por_solicitud_ibfk_1` FOREIGN KEY (`idBanco`) REFERENCES `banco` (`idBanco`),
  ADD CONSTRAINT `banco_por_solicitud_ibfk_2` FOREIGN KEY (`idSolicitudPrestamo`) REFERENCES `solicitud_prestamo` (`idSolicitudPrestamo`);

--
-- Filtros para la tabla `barrio`
--
ALTER TABLE `barrio`
  ADD CONSTRAINT `barrio_ibfk_3` FOREIGN KEY (`idCiudad`) REFERENCES `ciudad` (`idCiudad`);

--
-- Filtros para la tabla `cambio_oficial`
--
ALTER TABLE `cambio_oficial`
  ADD CONSTRAINT `cambio_oficial_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`),
  ADD CONSTRAINT `cambio_oficial_ibfk_2` FOREIGN KEY (`idMotivo`) REFERENCES `motivo` (`idMotivo`);

--
-- Filtros para la tabla `cheque_emitido`
--
ALTER TABLE `cheque_emitido`
  ADD CONSTRAINT `cheque_emitido_ibfk_1` FOREIGN KEY (`idPrestamo`) REFERENCES `prestamo` (`idPrestamo`),
  ADD CONSTRAINT `cheque_emitido_ibfk_2` FOREIGN KEY (`idBanco`) REFERENCES `banco` (`idBanco`);

--
-- Filtros para la tabla `cheque_recibido`
--
ALTER TABLE `cheque_recibido`
  ADD CONSTRAINT `cheque_recibido_ibfk_1` FOREIGN KEY (`idPrestamo`) REFERENCES `prestamo` (`idPrestamo`),
  ADD CONSTRAINT `cheque_recibido_ibfk_2` FOREIGN KEY (`idBanco`) REFERENCES `banco` (`idBanco`),
  ADD CONSTRAINT `cheque_recibido_ibfk_3` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idProveedor`),
  ADD CONSTRAINT `cheque_recibido_ibfk_4` FOREIGN KEY (`idTipoCheque`) REFERENCES `tipo_cheque` (`idTipoCheque`),
  ADD CONSTRAINT `cheque_recibido_ibfk_5` FOREIGN KEY (`idUbicacionFisica`) REFERENCES `ubicacion_fisica` (`idUbicacionFisica`);

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`idNacionalidad`) REFERENCES `nacionalidad` (`idNacionalidad`),
  ADD CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`idEstadoCivil`) REFERENCES `estado_civil` (`idEstadoCivil`),
  ADD CONSTRAINT `cliente_ibfk_3` FOREIGN KEY (`idBarrio`) REFERENCES `barrio` (`idBarrio`),
  ADD CONSTRAINT `cliente_ibfk_4` FOREIGN KEY (`idRamo`) REFERENCES `ramo` (`idRamo`),
  ADD CONSTRAINT `cliente_ibfk_5` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`),
  ADD CONSTRAINT `cliente_ibfk_6` FOREIGN KEY (`idProfesion`) REFERENCES `profesion` (`idProfesion`),
  ADD CONSTRAINT `cliente_ibfk_7` FOREIGN KEY (`idTipoCliente`) REFERENCES `tipo_cliente` (`idTipoCliente`),
  ADD CONSTRAINT `cliente_ibfk_8` FOREIGN KEY (`idEstadoCliente`) REFERENCES `estado_cliente` (`idEstadoCliente`);

--
-- Filtros para la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD CONSTRAINT `contrato_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`),
  ADD CONSTRAINT `contrato_ibfk_2` FOREIGN KEY (`idMotivoBaja`) REFERENCES `motivo_baja` (`idMotivoBaja`);

--
-- Filtros para la tabla `contravoCV`
--
ALTER TABLE `contravoCV`
  ADD CONSTRAINT `contravoCV_ibfk_1` FOREIGN KEY (`idPrestamo`) REFERENCES `prestamo` (`idPrestamo`);

--
-- Filtros para la tabla `datos_academicos`
--
ALTER TABLE `datos_academicos`
  ADD CONSTRAINT `datos_academicos_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`),
  ADD CONSTRAINT `datos_academicos_ibfk_2` FOREIGN KEY (`idProfesion`) REFERENCES `profesion` (`idProfesion`),
  ADD CONSTRAINT `datos_academicos_ibfk_3` FOREIGN KEY (`idTipoFormacion`) REFERENCES `tipo_formacion` (`idTipoFormacion`);

--
-- Filtros para la tabla `datos_laborales`
--
ALTER TABLE `datos_laborales`
  ADD CONSTRAINT `datos_laborales_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`),
  ADD CONSTRAINT `datos_laborales_ibfk_2` FOREIGN KEY (`idCiudad`) REFERENCES `ciudad` (`idCiudad`),
  ADD CONSTRAINT `datos_laborales_ibfk_3` FOREIGN KEY (`idRamo`) REFERENCES `ramo` (`idRamo`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`idNacionalidad`) REFERENCES `nacionalidad` (`idNacionalidad`),
  ADD CONSTRAINT `empleado_ibfk_2` FOREIGN KEY (`idEstadoCivil`) REFERENCES `estado_civil` (`idEstadoCivil`),
  ADD CONSTRAINT `empleado_ibfk_4` FOREIGN KEY (`idTipoEmpleado`) REFERENCES `tipo_empleado` (`idTipoEmpleado`),
  ADD CONSTRAINT `empleado_ibfk_5` FOREIGN KEY (`idBarrio`) REFERENCES `barrio` (`idBarrio`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`idAnalisis`) REFERENCES `analisis` (`idAnalisis`);

--
-- Filtros para la tabla `garantia`
--
ALTER TABLE `garantia`
  ADD CONSTRAINT `garantia_ibfk_1` FOREIGN KEY (`idSolicitudPrestamo`) REFERENCES `solicitud_prestamo` (`idSolicitudPrestamo`);

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`idContrato`) REFERENCES `contrato` (`idContrato`),
  ADD CONSTRAINT `pago_ibfk_2` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`);

--
-- Filtros para la tabla `planilla_liquidacion`
--
ALTER TABLE `planilla_liquidacion`
  ADD CONSTRAINT `planilla_liquidacion_ibfk_1` FOREIGN KEY (`idPago`) REFERENCES `pago` (`idPago`);

--
-- Filtros para la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD CONSTRAINT `prestamo_ibfk_1` FOREIGN KEY (`idFactura`) REFERENCES `factura` (`idFactura`),
  ADD CONSTRAINT `prestamo_ibfk_2` FOREIGN KEY (`idEstadoPrestamo`) REFERENCES `estado_prestamo` (`idEstadoPrestamo`);

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`idNacionalidad`) REFERENCES `nacionalidad` (`idNacionalidad`),
  ADD CONSTRAINT `proveedor_ibfk_2` FOREIGN KEY (`idEstadoCivil`) REFERENCES `estado_civil` (`idEstadoCivil`),
  ADD CONSTRAINT `proveedor_ibfk_3` FOREIGN KEY (`idBarrio`) REFERENCES `barrio` (`idBarrio`),
  ADD CONSTRAINT `proveedor_ibfk_4` FOREIGN KEY (`idRamo`) REFERENCES `ramo` (`idRamo`),
  ADD CONSTRAINT `proveedor_ibfk_6` FOREIGN KEY (`idEstadoProveedor`) REFERENCES `estado_proveedor` (`idEstadoProveedor`);

--
-- Filtros para la tabla `referencia`
--
ALTER TABLE `referencia`
  ADD CONSTRAINT `referencia_ibfk_1` FOREIGN KEY (`idNacionalidad`) REFERENCES `nacionalidad` (`idNacionalidad`),
  ADD CONSTRAINT `referencia_ibfk_2` FOREIGN KEY (`idEstadoCivil`) REFERENCES `estado_civil` (`idEstadoCivil`),
  ADD CONSTRAINT `referencia_ibfk_3` FOREIGN KEY (`idRamo`) REFERENCES `ramo` (`idRamo`),
  ADD CONSTRAINT `referencia_ibfk_4` FOREIGN KEY (`idTipoReferencia`) REFERENCES `tipo_referencia` (`idTipoReferencia`),
  ADD CONSTRAINT `referencia_ibfk_5` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`);

--
-- Filtros para la tabla `referencia_por_solicitud`
--
ALTER TABLE `referencia_por_solicitud`
  ADD CONSTRAINT `referencia_por_solicitud_ibfk_1` FOREIGN KEY (`idReferencia`) REFERENCES `referencia` (`idReferencia`),
  ADD CONSTRAINT `referencia_por_solicitud_ibfk_2` FOREIGN KEY (`idSolicitudPrestamo`) REFERENCES `solicitud_prestamo` (`idSolicitudPrestamo`);

--
-- Filtros para la tabla `solicitud_insumo`
--
ALTER TABLE `solicitud_insumo`
  ADD CONSTRAINT `solicitud_insumo_ibfk_1` FOREIGN KEY (`idAnalisis`) REFERENCES `analisis` (`idAnalisis`),
  ADD CONSTRAINT `solicitud_insumo_ibfk_2` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`),
  ADD CONSTRAINT `solicitud_insumo_ibfk_3` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idProveedor`),
  ADD CONSTRAINT `solicitud_insumo_ibfk_4` FOREIGN KEY (`idEstadoInsumo`) REFERENCES `estado_insumo` (`idEstadoInsumo`);

--
-- Filtros para la tabla `solicitud_prestamo`
--
ALTER TABLE `solicitud_prestamo`
  ADD CONSTRAINT `solicitud_prestamo_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`),
  ADD CONSTRAINT `solicitud_prestamo_ibfk_2` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`),
  ADD CONSTRAINT `solicitud_prestamo_ibfk_3` FOREIGN KEY (`idTipoPrestamo`) REFERENCES `tipo_prestamo` (`idTipoPrestamo`),
  ADD CONSTRAINT `solicitud_prestamo_ibfk_4` FOREIGN KEY (`idEstadoPrestamo`) REFERENCES `estado_prestamo` (`idEstadoPrestamo`);

--
-- Filtros para la tabla `sugerencia`
--
ALTER TABLE `sugerencia`
  ADD CONSTRAINT `sugerencia_ibfk_1` FOREIGN KEY (`idAnalisis`) REFERENCES `analisis` (`idAnalisis`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
