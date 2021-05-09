-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         5.7.24 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para db_agroite
CREATE DATABASE IF NOT EXISTS `db_agroite` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db_agroite`;

-- Volcando estructura para tabla db_agroite.actividad
CREATE TABLE IF NOT EXISTS `actividad` (
  `IdActividad` int(100) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`IdActividad`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla db_agroite.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `IdCategoria` int(100) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla db_agroite.finca
CREATE TABLE IF NOT EXISTS `finca` (
  `IdFinca` int(100) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT NULL,
  `Pais` varchar(100) DEFAULT NULL,
  `Departamento` varchar(100) DEFAULT NULL,
  `Municipio` varchar(100) DEFAULT NULL,
  `Via_Acceso` varchar(100) DEFAULT NULL,
  `Fuente_Agua` varchar(100) DEFAULT NULL,
  `Almacen_Agua` varchar(100) DEFAULT NULL,
  `IdUsuario` int(100) DEFAULT NULL,
  `IdUnidadExtension` int(100) DEFAULT NULL,
  PRIMARY KEY (`IdFinca`),
  KEY `FK_Finca_UnidadExtension` (`IdUnidadExtension`),
  KEY `FK_Finca_Usuario` (`IdUsuario`),
  CONSTRAINT `FK_Finca_UnidadExtension` FOREIGN KEY (`IdUnidadExtension`) REFERENCES `unidadextension` (`IdUnidadExtension`),
  CONSTRAINT `FK_Finca_Usuario` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla db_agroite.frecuencia
CREATE TABLE IF NOT EXISTS `frecuencia` (
  `Idfrecuencia` int(100) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Idfrecuencia`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla db_agroite.pago
CREATE TABLE IF NOT EXISTS `pago` (
  `IdPago` int(100) NOT NULL AUTO_INCREMENT,
  `IdTransaccion` int(100) DEFAULT NULL,
  `IdUsuario` int(100) DEFAULT NULL,
  PRIMARY KEY (`IdPago`),
  KEY `FK_Paypal_Usuario` (`IdUsuario`),
  CONSTRAINT `FK_Paypal_Usuario` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla db_agroite.producto
CREATE TABLE IF NOT EXISTS `producto` (
  `IdProducto` int(11) NOT NULL AUTO_INCREMENT,
  `IdCategoria` int(11) DEFAULT NULL,
  `Nombre_Producto` varchar(100) NOT NULL,
  `Precio_Referencial` decimal(11,0) NOT NULL,
  `Imagenes_Producto` longblob NOT NULL,
  `RutaImagenes_Producto` varchar(100) NOT NULL,
  `Descripcion_Producto` varchar(500) DEFAULT NULL,
  `Fecha_Inicio` varchar(50) DEFAULT NULL,
  `Fecha_Fin` varchar(50) DEFAULT NULL,
  `Cantidad_Producida` varchar(500) DEFAULT NULL,
  `IdUnidad_Volumen` int(11) DEFAULT NULL,
  `Idfrecuencia` int(11) DEFAULT NULL,
  `IdUsuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdProducto`),
  KEY `FK_Producto_Categoria` (`IdCategoria`),
  KEY `FK_Producto_Frecuencia` (`Idfrecuencia`),
  KEY `FK_Producto_UnidadMedida` (`IdUnidad_Volumen`),
  KEY `FK_Producto_Usuario` (`IdUsuario`),
  CONSTRAINT `FK_Producto_Categoria` FOREIGN KEY (`IdCategoria`) REFERENCES `categoria` (`IdCategoria`),
  CONSTRAINT `FK_Producto_Frecuencia` FOREIGN KEY (`Idfrecuencia`) REFERENCES `frecuencia` (`Idfrecuencia`),
  CONSTRAINT `FK_Producto_UnidadMedida` FOREIGN KEY (`IdUnidad_Volumen`) REFERENCES `unidadvolumen` (`IdUnidadVolumen`),
  CONSTRAINT `FK_Producto_Usuario` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla db_agroite.unidadextension
CREATE TABLE IF NOT EXISTS `unidadextension` (
  `IdUnidadExtension` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IdUnidadExtension`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla db_agroite.unidadvolumen
CREATE TABLE IF NOT EXISTS `unidadvolumen` (
  `IdUnidadVolumen` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IdUnidadVolumen`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla db_agroite.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `IdUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `IdActividad` int(11) DEFAULT NULL,
  `Nombres` varchar(500) DEFAULT NULL,
  `Apellidos` varchar(500) NOT NULL,
  `Tipo_Documento` int(11) DEFAULT NULL,
  `Num_Identificacion` char(10) CHARACTER SET utf8 DEFAULT NULL,
  `Foto_Perfil` longblob,
  `RutaFoto_Perfil` varchar(200) DEFAULT NULL,
  `Celular` varchar(500) DEFAULT NULL,
  `Direccion` varchar(500) DEFAULT NULL,
  `Correo` varchar(500) DEFAULT NULL,
  `Alias` varchar(500) NOT NULL,
  `Contraseña` varchar(500) NOT NULL,
  `Organizacion` varchar(500) DEFAULT NULL,
  `Descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`IdUsuario`),
  KEY `FK_Usuario_Actividad` (`IdActividad`),
  CONSTRAINT `FK_Usuario_Actividad` FOREIGN KEY (`IdActividad`) REFERENCES `actividad` (`IdActividad`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
