-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.18-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para db_agroite
CREATE DATABASE IF NOT EXISTS `db_agroite` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db_agroite`;

-- Volcando estructura para tabla db_agroite.actividad
CREATE TABLE IF NOT EXISTS `actividad` (
  `IdActividad` int(100) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`IdActividad`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_agroite.actividad: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `actividad` DISABLE KEYS */;
INSERT IGNORE INTO `actividad` (`IdActividad`, `Nombre`) VALUES
	(1, 'Agricultor'),
	(16, 'Administrador'),
	(17, 'Asociacion');
/*!40000 ALTER TABLE `actividad` ENABLE KEYS */;

-- Volcando estructura para tabla db_agroite.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `IdCategoria` int(100) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_agroite.categoria: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT IGNORE INTO `categoria` (`IdCategoria`, `Nombre`) VALUES
	(16, 'Productos Agricolas');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

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

-- Volcando datos para la tabla db_agroite.finca: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `finca` DISABLE KEYS */;
/*!40000 ALTER TABLE `finca` ENABLE KEYS */;

-- Volcando estructura para tabla db_agroite.frecuencia
CREATE TABLE IF NOT EXISTS `frecuencia` (
  `Idfrecuencia` int(100) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Idfrecuencia`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_agroite.frecuencia: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `frecuencia` DISABLE KEYS */;
INSERT IGNORE INTO `frecuencia` (`Idfrecuencia`, `Nombre`) VALUES
	(16, 'Semana(s)');
/*!40000 ALTER TABLE `frecuencia` ENABLE KEYS */;

-- Volcando estructura para tabla db_agroite.pago
CREATE TABLE IF NOT EXISTS `pago` (
  `IdPago` int(100) NOT NULL AUTO_INCREMENT,
  `IdTransaccion` int(100) DEFAULT NULL,
  `IdUsuario` int(100) DEFAULT NULL,
  PRIMARY KEY (`IdPago`),
  KEY `FK_Paypal_Usuario` (`IdUsuario`),
  CONSTRAINT `FK_Paypal_Usuario` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_agroite.pago: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_agroite.producto: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT IGNORE INTO `producto` (`IdProducto`, `IdCategoria`, `Nombre_Producto`, `Precio_Referencial`, `Imagenes_Producto`, `RutaImagenes_Producto`, `Descripcion_Producto`, `Fecha_Inicio`, `Fecha_Fin`, `Cantidad_Producida`, `IdUnidad_Volumen`, `Idfrecuencia`, `IdUsuario`) VALUES
	(1, 16, 'Ají Paprika ', 123, _binary '', 'img/product/16-ajip.png', 'El fruto de la páprika es de color rojo cuando esta madura, mide alrededor de 12 cm, posee un peculiar aroma muy agradable y un sabor característico no picante.', '2021-04-30', '2021-05-01', '12', 16, 16, 16),
	(2, 16, 'Ají Negro pacae', 12, _binary '', 'img/product/16-images.jpg', 'El ají panca o ají colorado es un ají originario de Perú donde es muy utilizado en la gastronomía del país. Esta guindilla es menos picante en comparación con otras guindillas.', '2021-04-28', '2021-05-21', '3', 16, 16, 16),
	(3, 16, 'Ají amarillo pacae', 12, _binary '', 'img/product/16-61NpzK1aWyL._SY445_.jpg', 'El aji amarillo tiene en realidad un color naranja intenso al madurar, tiene un toque picante al final. Tiene un sabor único afrutado.', '2021-05-05', '2021-05-08', '12', 16, 16, 16),
	(4, 16, 'Granadilla', 12, _binary '', 'img/product/17-granadilla.jpg', 'La granadilla es una fruta oriunda de los andes peruanos, fue domesticada en la época preinca, su fruto es de cáscara frágil, en su interior aloja varias semillas comestibles y de agradable sabor.', '2021-05-12', '2021-05-22', '12', 16, 16, 17),
	(5, 16, 'Cebolla', 12, _binary '', 'img/product/17-descarga.jpg', 'Allium cepa, comúnmente conocida como cebolla, es una planta herbácea bienal perteneciente a la familia de las amarilidáceas', '2021-05-12', '2021-05-22', '12', 16, 16, 17),
	(6, 16, 'Ají Negro pacae', 12, _binary '', 'img/product/17-arx1288790081b.jpg', 'El ají panca o ají colorado es un ají originario de Perú donde es muy utilizado en la gastronomía del país. Esta guindilla es menos picante en comparación con otras guindillas.', '2021-05-19', '2021-05-20', '12', 16, 16, 17);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;

-- Volcando estructura para tabla db_agroite.unidadextension
CREATE TABLE IF NOT EXISTS `unidadextension` (
  `IdUnidadExtension` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IdUnidadExtension`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_agroite.unidadextension: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `unidadextension` DISABLE KEYS */;
/*!40000 ALTER TABLE `unidadextension` ENABLE KEYS */;

-- Volcando estructura para tabla db_agroite.unidadvolumen
CREATE TABLE IF NOT EXISTS `unidadvolumen` (
  `IdUnidadVolumen` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IdUnidadVolumen`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_agroite.unidadvolumen: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `unidadvolumen` DISABLE KEYS */;
INSERT IGNORE INTO `unidadvolumen` (`IdUnidadVolumen`, `Nombre`) VALUES
	(16, 'Quintal');
/*!40000 ALTER TABLE `unidadvolumen` ENABLE KEYS */;

-- Volcando estructura para tabla db_agroite.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `IdUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `IdActividad` int(11) DEFAULT NULL,
  `Nombres` varchar(500) DEFAULT NULL,
  `Apellidos` varchar(500) NOT NULL,
  `Tipo_Documento` int(11) DEFAULT NULL,
  `Num_Identificacion` char(10) CHARACTER SET utf8 DEFAULT NULL,
  `Foto_Perfil` longblob DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_agroite.usuario: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT IGNORE INTO `usuario` (`IdUsuario`, `IdActividad`, `Nombres`, `Apellidos`, `Tipo_Documento`, `Num_Identificacion`, `Foto_Perfil`, `RutaFoto_Perfil`, `Celular`, `Direccion`, `Correo`, `Alias`, `Contraseña`, `Organizacion`, `Descripcion`) VALUES
	(16, 1, 'Walter', 'Flores Murillo', 0, '457138751', NULL, 'img/user/457138751-Clients.png', '970780836', 'Ite. Jorge Basadre. Tacna. Pampa baja', 'murillo@gmail.com', 'Walter', '123456', 'La Asociación De Agricultores 5 Estrellas, Distrito De Ite', 'Productor  de Ají negro  y ají amarillo'),
	(17, 1, 'Edison', 'Curo Gallegos', 0, '45713875', NULL, 'img/user/45713875-loguusu1.png', '970780836', 'Ite. Jorge Basadre. Tacna. Pampa alta', 'gallegos@gmail.com', 'Edison', '123456', 'La Asociación De Agricultores 5 Estrellas, Distrito De Ite', 'Productor  de granadilla  y aji'),
	(18, 1, 'Daniel Luza', 'Bertín Pampa', 1, '46412032', NULL, 'img/user/46412032-85080724_435064617210623_7723333246775197696_o.jpg', '975941200', 'Ite. Jorge Basadre. Tacna. Pampa baja', 'bertin@gmail.com', 'bertin', '123456', 'La Asociación De Agricultores 5 Estrellas, Distrito De Ite', 'Productor  de Ají negro  y ají amarillo');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
