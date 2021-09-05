-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.35 - MySQL Community Server (GPL)
-- SO del servidor:              Linux
-- HeidiSQL Versión:             11.3.0.6295
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
INSERT INTO `actividad` (`IdActividad`, `Nombre`) VALUES
	(1, 'Agricultor'),
	(16, 'Administrador'),
	(17, 'Asociacion');
/*!40000 ALTER TABLE `actividad` ENABLE KEYS */;

-- Volcando estructura para tabla db_agroite.agricultor
CREATE TABLE IF NOT EXISTS `agricultor` (
  `IdAgricultor` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Apellidos` varchar(50) DEFAULT NULL,
  `Tipo_Documento` int(11) DEFAULT NULL,
  `Num_Identificacion` varchar(12) DEFAULT NULL,
  `Foto_Perfil` varchar(100) DEFAULT NULL,
  `Celular` varchar(9) DEFAULT NULL,
  `Direccion` varchar(200) DEFAULT NULL,
  `Correo` varchar(150) DEFAULT NULL,
  `Estado` int(11) DEFAULT NULL,
  `IdAsociacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdAgricultor`),
  KEY `FK_agricultor_asociacion` (`IdAsociacion`),
  CONSTRAINT `FK_agricultor_asociacion` FOREIGN KEY (`IdAsociacion`) REFERENCES `asociacion` (`IdAsociacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla db_agroite.agricultor: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `agricultor` DISABLE KEYS */;
/*!40000 ALTER TABLE `agricultor` ENABLE KEYS */;

-- Volcando estructura para tabla db_agroite.asociacion
CREATE TABLE IF NOT EXISTS `asociacion` (
  `IdAsociacion` int(11) NOT NULL,
  `Ruc` varchar(50) DEFAULT NULL,
  `Razon_Social` varchar(150) DEFAULT NULL,
  `Descripcion` varchar(250) DEFAULT NULL,
  `Departamento` varchar(50) DEFAULT NULL,
  `Provincia` varchar(50) DEFAULT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `Telefono` varchar(9) DEFAULT NULL,
  `Representante` varchar(150) DEFAULT NULL,
  `Integrantes` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdAsociacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla db_agroite.asociacion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `asociacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `asociacion` ENABLE KEYS */;

-- Volcando estructura para tabla db_agroite.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `IdCategoria` int(100) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_agroite.categoria: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`IdCategoria`, `Nombre`) VALUES
	(16, 'Productos Agricolas');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

-- Volcando estructura para tabla db_agroite.compra
CREATE TABLE IF NOT EXISTS `compra` (
  `IdCompra` int(11) NOT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Total` decimal(16,2) DEFAULT NULL,
  `IdUsuario` int(11) DEFAULT NULL,
  `IdPedido` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdCompra`),
  KEY `FK_compra_usuario` (`IdUsuario`),
  KEY `FK_compra_pedido` (`IdPedido`),
  CONSTRAINT `FK_compra_pedido` FOREIGN KEY (`IdPedido`) REFERENCES `pedido` (`IdPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_compra_usuario` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla db_agroite.compra: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;

-- Volcando estructura para tabla db_agroite.detallecompra
CREATE TABLE IF NOT EXISTS `detallecompra` (
  `IdDetalleCompra` int(11) NOT NULL,
  `IdProducto` int(11) DEFAULT NULL,
  `IdCompra` int(11) DEFAULT NULL,
  `Cantidad` decimal(16,2) DEFAULT NULL,
  `Precio_Unitario` decimal(16,2) DEFAULT NULL,
  `Subtotal` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`IdDetalleCompra`),
  KEY `FK_detallecompra_producto` (`IdProducto`),
  KEY `FK_detallecompra_compra` (`IdCompra`),
  CONSTRAINT `FK_detallecompra_compra` FOREIGN KEY (`IdCompra`) REFERENCES `compra` (`IdCompra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_detallecompra_producto` FOREIGN KEY (`IdProducto`) REFERENCES `producto` (`IdProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla db_agroite.detallecompra: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `detallecompra` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallecompra` ENABLE KEYS */;

-- Volcando estructura para tabla db_agroite.detallepedido
CREATE TABLE IF NOT EXISTS `detallepedido` (
  `IdDetallePedido` int(11) NOT NULL,
  `IdPedido` int(11) DEFAULT NULL,
  `IdProducto` int(11) DEFAULT NULL,
  `Cantidad` decimal(16,2) DEFAULT NULL,
  `Subtotal` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`IdDetallePedido`),
  KEY `FK_detallepedido_pedido` (`IdPedido`),
  KEY `FK_detallepedido_producto` (`IdProducto`),
  CONSTRAINT `FK_detallepedido_pedido` FOREIGN KEY (`IdPedido`) REFERENCES `pedido` (`IdPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_detallepedido_producto` FOREIGN KEY (`IdProducto`) REFERENCES `producto` (`IdProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla db_agroite.detallepedido: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `detallepedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallepedido` ENABLE KEYS */;

-- Volcando estructura para tabla db_agroite.detalleventa
CREATE TABLE IF NOT EXISTS `detalleventa` (
  `IdDetalleVenta` int(11) NOT NULL,
  `IdVenta` int(11) DEFAULT NULL,
  `IdProducto` int(11) DEFAULT NULL,
  `Cantidad` decimal(16,2) DEFAULT NULL,
  `Subtotal` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`IdDetalleVenta`),
  KEY `FK_detalleventa_venta` (`IdVenta`),
  KEY `FK_detalleventa_producto` (`IdProducto`),
  CONSTRAINT `FK_detalleventa_producto` FOREIGN KEY (`IdProducto`) REFERENCES `producto` (`IdProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_detalleventa_venta` FOREIGN KEY (`IdVenta`) REFERENCES `venta` (`IdVenta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla db_agroite.detalleventa: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `detalleventa` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalleventa` ENABLE KEYS */;

-- Volcando estructura para tabla db_agroite.entrega
CREATE TABLE IF NOT EXISTS `entrega` (
  `IdEntrega` int(11) NOT NULL,
  `IdVenta` int(11) DEFAULT NULL,
  `Fecha_Envio` varchar(11) DEFAULT NULL,
  `Fechar_Entrega` varchar(11) DEFAULT NULL,
  `Detalles` varchar(100) DEFAULT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `Fecha_Pedido` varchar(50) DEFAULT NULL,
  `Estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdEntrega`),
  KEY `FK_entrega_venta` (`IdVenta`),
  CONSTRAINT `FK_entrega_venta` FOREIGN KEY (`IdVenta`) REFERENCES `venta` (`IdVenta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla db_agroite.entrega: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `entrega` DISABLE KEYS */;
/*!40000 ALTER TABLE `entrega` ENABLE KEYS */;

-- Volcando estructura para tabla db_agroite.frecuencia
CREATE TABLE IF NOT EXISTS `frecuencia` (
  `IdFrecuencia` int(100) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdFrecuencia`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_agroite.frecuencia: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `frecuencia` DISABLE KEYS */;
INSERT INTO `frecuencia` (`IdFrecuencia`, `Nombre`) VALUES
	(16, 'Semana(s)');
/*!40000 ALTER TABLE `frecuencia` ENABLE KEYS */;

-- Volcando estructura para tabla db_agroite.pago
CREATE TABLE IF NOT EXISTS `pago` (
  `IdPago` int(100) NOT NULL AUTO_INCREMENT,
  `Num_Transaccion` varchar(50) DEFAULT NULL,
  `Cantidad` decimal(16,2) DEFAULT NULL,
  `IdUsuario` int(100) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`IdPago`),
  KEY `FK_Paypal_Usuario` (`IdUsuario`),
  CONSTRAINT `FK_Paypal_Usuario` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_agroite.pago: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;

-- Volcando estructura para tabla db_agroite.pedido
CREATE TABLE IF NOT EXISTS `pedido` (
  `IdPedido` int(11) NOT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Estado` int(11) DEFAULT NULL,
  `IdUsuario` int(11) DEFAULT NULL,
  `Total` decimal(16,2) DEFAULT NULL,
  `IGV` decimal(16,2) DEFAULT NULL,
  `IdTransportador` int(11) DEFAULT NULL,
  `Punto_Entrega` varchar(300) DEFAULT NULL,
  `IdAgricultor` int(11) DEFAULT NULL,
  `Latitud` varchar(20) DEFAULT NULL,
  `Longitud` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`IdPedido`),
  KEY `FK_pedido_usuario` (`IdUsuario`),
  KEY `FK_pedido_transportador` (`IdTransportador`),
  KEY `FK_pedido_agricultor` (`IdAgricultor`),
  CONSTRAINT `FK_pedido_agricultor` FOREIGN KEY (`IdAgricultor`) REFERENCES `agricultor` (`IdAgricultor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_pedido_transportador` FOREIGN KEY (`IdTransportador`) REFERENCES `transportador` (`IdTransportador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_pedido_usuario` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla db_agroite.pedido: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;

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
  `Cantidad_Minima` decimal(16,2) DEFAULT NULL,
  `Cantidad_Maxima` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`IdProducto`),
  KEY `FK_Producto_Categoria` (`IdCategoria`),
  KEY `FK_Producto_Frecuencia` (`Idfrecuencia`),
  KEY `FK_Producto_UnidadMedida` (`IdUnidad_Volumen`),
  KEY `FK_Producto_Usuario` (`IdUsuario`),
  CONSTRAINT `FK_Producto_Categoria` FOREIGN KEY (`IdCategoria`) REFERENCES `categoria` (`IdCategoria`),
  CONSTRAINT `FK_Producto_Frecuencia` FOREIGN KEY (`Idfrecuencia`) REFERENCES `frecuencia` (`IdFrecuencia`),
  CONSTRAINT `FK_Producto_UnidadMedida` FOREIGN KEY (`IdUnidad_Volumen`) REFERENCES `unidadvolumen` (`IdUnidadVolumen`),
  CONSTRAINT `FK_Producto_Usuario` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_agroite.producto: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` (`IdProducto`, `IdCategoria`, `Nombre_Producto`, `Precio_Referencial`, `Imagenes_Producto`, `RutaImagenes_Producto`, `Descripcion_Producto`, `Fecha_Inicio`, `Fecha_Fin`, `Cantidad_Producida`, `IdUnidad_Volumen`, `Idfrecuencia`, `IdUsuario`, `Cantidad_Minima`, `Cantidad_Maxima`) VALUES
	(1, 16, 'Ají Paprika ', 123, _binary '', 'img/product/16-ajip.png', 'El fruto de la páprika es de color rojo cuando esta madura, mide alrededor de 12 cm, posee un peculiar aroma muy agradable y un sabor característico no picante.', '2021-04-30', '2021-05-01', '12', 16, 16, 16, NULL, NULL),
	(2, 16, 'Ají Negro pacae', 12, _binary '', 'img/product/16-images.jpg', 'El ají panca o ají colorado es un ají originario de Perú donde es muy utilizado en la gastronomía del país. Esta guindilla es menos picante en comparación con otras guindillas.', '2021-04-28', '2021-05-21', '3', 16, 16, 16, NULL, NULL),
	(3, 16, 'Ají amarillo pacae', 12, _binary '', 'img/product/16-61NpzK1aWyL._SY445_.jpg', 'El aji amarillo tiene en realidad un color naranja intenso al madurar, tiene un toque picante al final. Tiene un sabor único afrutado.', '2021-05-05', '2021-05-08', '12', 16, 16, 16, NULL, NULL),
	(4, 16, 'Granadilla', 12, _binary '', 'img/product/17-granadilla.jpg', 'La granadilla es una fruta oriunda de los andes peruanos, fue domesticada en la época preinca, su fruto es de cáscara frágil, en su interior aloja varias semillas comestibles y de agradable sabor.', '2021-05-12', '2021-05-22', '12', 16, 16, 17, NULL, NULL),
	(5, 16, 'Cebolla', 12, _binary '', 'img/product/17-descarga.jpg', 'Allium cepa, comúnmente conocida como cebolla, es una planta herbácea bienal perteneciente a la familia de las amarilidáceas', '2021-05-12', '2021-05-22', '12', 16, 16, 17, NULL, NULL),
	(6, 16, 'Ají Negro pacae', 12, _binary '', 'img/product/17-arx1288790081b.jpg', 'El ají panca o ají colorado es un ají originario de Perú donde es muy utilizado en la gastronomía del país. Esta guindilla es menos picante en comparación con otras guindillas.', '2021-05-19', '2021-05-20', '12', 16, 16, 17, NULL, NULL);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;

-- Volcando estructura para tabla db_agroite.transportador
CREATE TABLE IF NOT EXISTS `transportador` (
  `IdTransportador` int(11) NOT NULL,
  `IdVehiculo` int(11) DEFAULT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Tefono` varchar(20) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `Disponibilidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdTransportador`),
  KEY `FK_transportador_vehiculos` (`IdVehiculo`),
  CONSTRAINT `FK_transportador_vehiculos` FOREIGN KEY (`IdVehiculo`) REFERENCES `vehiculos` (`IdVehiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla db_agroite.transportador: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `transportador` DISABLE KEYS */;
/*!40000 ALTER TABLE `transportador` ENABLE KEYS */;

-- Volcando estructura para tabla db_agroite.ubicacion
CREATE TABLE IF NOT EXISTS `ubicacion` (
  `IdUbicacion` int(11) NOT NULL,
  `IdAgricultor` int(11) DEFAULT NULL,
  `latitud` varchar(40) DEFAULT NULL,
  `longitud` varchar(40) DEFAULT NULL,
  `Fecha_Creacion` datetime DEFAULT NULL,
  PRIMARY KEY (`IdUbicacion`),
  KEY `FK_ubicacion_agricultor` (`IdAgricultor`),
  CONSTRAINT `FK_ubicacion_agricultor` FOREIGN KEY (`IdAgricultor`) REFERENCES `agricultor` (`IdAgricultor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla db_agroite.ubicacion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `ubicacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubicacion` ENABLE KEYS */;

-- Volcando estructura para tabla db_agroite.unidadvolumen
CREATE TABLE IF NOT EXISTS `unidadvolumen` (
  `IdUnidadVolumen` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IdUnidadVolumen`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_agroite.unidadvolumen: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `unidadvolumen` DISABLE KEYS */;
INSERT INTO `unidadvolumen` (`IdUnidadVolumen`, `Nombre`) VALUES
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_agroite.usuario: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`IdUsuario`, `IdActividad`, `Nombres`, `Apellidos`, `Tipo_Documento`, `Num_Identificacion`, `Foto_Perfil`, `RutaFoto_Perfil`, `Celular`, `Direccion`, `Correo`, `Alias`, `Contraseña`, `Organizacion`, `Descripcion`) VALUES
	(16, 1, 'Walter', 'Flores Murillo', 0, '457138751', NULL, 'img/user/457138751-Clients.png', '970780836', 'Ite. Jorge Basadre. Tacna. Pampa baja', 'murillo@gmail.com', 'Walter', '123456', 'La Asociación De Agricultores 5 Estrellas, Distrito De Ite', 'Productor  de Ají negro  y ají amarillo'),
	(17, 1, 'Edison', 'Curo Gallegos', 0, '45713875', NULL, 'img/user/45713875-loguusu1.png', '970780836', 'Ite. Jorge Basadre. Tacna. Pampa alta', 'gallegos@gmail.com', 'Edison', '123456', 'La Asociación De Agricultores 5 Estrellas, Distrito De Ite', 'Productor  de granadilla  y aji'),
	(18, 1, 'Daniel Luza', 'Bertín Pampa', 1, '46412032', NULL, 'img/user/46412032-85080724_435064617210623_7723333246775197696_o.jpg', '975941200', 'Ite. Jorge Basadre. Tacna. Pampa baja', 'bertin@gmail.com', 'bertin', '123456', 'La Asociación De Agricultores 5 Estrellas, Distrito De Ite', 'Productor  de Ají negro  y ají amarillo');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

-- Volcando estructura para tabla db_agroite.vehiculos
CREATE TABLE IF NOT EXISTS `vehiculos` (
  `IdVehiculo` int(11) NOT NULL,
  `Marca` varchar(20) DEFAULT NULL,
  `Modelo` varchar(20) DEFAULT NULL,
  `Año` varchar(20) DEFAULT NULL,
  `Tipo` varchar(20) DEFAULT NULL,
  `Placa` varchar(20) DEFAULT NULL,
  `Capacidad` decimal(16,2) DEFAULT NULL,
  `Estado` int(11) DEFAULT NULL,
  `Precio` decimal(16,2) DEFAULT NULL,
  `Unidad_Medida` varchar(100) DEFAULT NULL,
  `Tipo_Carga` varchar(50) DEFAULT NULL,
  `Carga_Total` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`IdVehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla db_agroite.vehiculos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehiculos` ENABLE KEYS */;

-- Volcando estructura para tabla db_agroite.venta
CREATE TABLE IF NOT EXISTS `venta` (
  `IdVenta` int(11) NOT NULL,
  `Fecha` varchar(50) DEFAULT NULL,
  `Num_Serie` int(11) DEFAULT NULL,
  `IdPedido` int(11) DEFAULT NULL,
  `Total` decimal(16,2) DEFAULT NULL,
  `IGV` decimal(16,2) DEFAULT NULL,
  `IdTrasportador` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdVenta`),
  KEY `FK_venta_transportador` (`IdTrasportador`),
  KEY `FK_venta_pedido` (`IdPedido`),
  CONSTRAINT `FK_venta_pedido` FOREIGN KEY (`IdPedido`) REFERENCES `pedido` (`IdPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_venta_transportador` FOREIGN KEY (`IdTrasportador`) REFERENCES `transportador` (`IdTransportador`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla db_agroite.venta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
