-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: sinfonia
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alimento`
--

DROP TABLE IF EXISTS `alimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alimento` (
  `codigo_alimento` varchar(5) NOT NULL,
  `nombre_alimento` varchar(13) DEFAULT NULL,
  `precio_unidad` int DEFAULT NULL,
  `nit_proveedor` varchar(10) DEFAULT NULL,
  `cantidad_alimento` double DEFAULT NULL,
  PRIMARY KEY (`codigo_alimento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alimento`
--

LOCK TABLES `alimento` WRITE;
/*!40000 ALTER TABLE `alimento` DISABLE KEYS */;
INSERT INTO `alimento` VALUES ('1','Papa',300,'prov1',45),('2','Fresa',500,'prov2',30),('3','Ponque',1000,'prov3',10);
/*!40000 ALTER TABLE `alimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `cod_cliente` varchar(10) NOT NULL,
  `nombre_cliente` varchar(15) DEFAULT NULL,
  `apellido_cliente` varchar(15) DEFAULT NULL,
  `tel_cliente` varchar(10) DEFAULT NULL,
  `genero` varchar(10) DEFAULT NULL,
  `edad` varchar(2) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  PRIMARY KEY (`cod_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('1','Pepe','Ruiz','3214568420','M','21','1999-07-25'),('2','Carla','Martinez','1325498498','F','21','1999-06-14'),('3','Pedro','Mora','3214561590','M','21','1999-05-03'),('4','Luis','Gomez','9876543217','M','21','1999-04-28');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domicilios`
--

DROP TABLE IF EXISTS `domicilios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `domicilios` (
  `num_domicilio` varchar(5) NOT NULL,
  `cod_cliente` varchar(10) DEFAULT NULL,
  `telefono_cliente` varchar(10) DEFAULT NULL,
  `direccion` varchar(20) DEFAULT NULL,
  `codigo_empleado` varchar(5) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  PRIMARY KEY (`num_domicilio`),
  KEY `cod_cliente_idx` (`cod_cliente`),
  KEY `cod_empleado_idx` (`codigo_empleado`),
  CONSTRAINT `cod_cliente` FOREIGN KEY (`cod_cliente`) REFERENCES `cliente` (`cod_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cod_empleado` FOREIGN KEY (`codigo_empleado`) REFERENCES `empleado` (`codigo_empleado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domicilios`
--

LOCK TABLES `domicilios` WRITE;
/*!40000 ALTER TABLE `domicilios` DISABLE KEYS */;
INSERT INTO `domicilios` VALUES ('1','1','3214568420','direc1','1','2020-08-27','13:30:00'),('2','1','3214568420','direc1','2','2020-08-28','10:10:00'),('3','1','3214568420','direc1','2','2020-08-28','14:00:00'),('4','2','1325498498','direc2','1','2020-08-28','15:00:00');
/*!40000 ALTER TABLE `domicilios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `codigo_empleado` varchar(5) NOT NULL,
  `fecha_contratacion` date DEFAULT NULL,
  `nombre_empleado` varchar(20) DEFAULT NULL,
  `apellido_empleado` varchar(20) DEFAULT NULL,
  `telefono_empleado` varchar(10) DEFAULT NULL,
  `correo_empleado` varchar(20) DEFAULT NULL,
  `cargo_empleado` varchar(15) DEFAULT NULL,
  `eps` varchar(20) DEFAULT NULL,
  `salario` int DEFAULT NULL,
  `genero` varchar(10) DEFAULT NULL,
  `edad` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`codigo_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES ('1','2019-07-01','Carlos','Neisa','3214569870','ca1@gmail.com','Vendedor','Nueva EPS',900000,'M','25'),('2','2019-08-01','Laura','Romero','3164589701','la2@gmail.com','Vendedora','Nueva EPS',900000,'F','23'),('3','2019-09-01','Rodrigo','Trueba','3157534561','ro3@gmail.com','Vendedor','Nueva EPS',1200000,'M','23');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `codigo_pedido` varchar(15) NOT NULL,
  `num_domicilio` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`codigo_pedido`),
  KEY `num_domicilio_idx` (`num_domicilio`),
  CONSTRAINT `num_domicilio` FOREIGN KEY (`num_domicilio`) REFERENCES `domicilios` (`num_domicilio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES ('1','1'),('2','2'),('3','3'),('4','4');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plato`
--

DROP TABLE IF EXISTS `plato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plato` (
  `codigo_plato` varchar(5) NOT NULL,
  `nombre_plato` varchar(13) DEFAULT NULL,
  `costo_plato` int DEFAULT NULL,
  PRIMARY KEY (`codigo_plato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plato`
--

LOCK TABLES `plato` WRITE;
/*!40000 ALTER TABLE `plato` DISABLE KEYS */;
/*!40000 ALTER TABLE `plato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plato_alimento`
--

DROP TABLE IF EXISTS `plato_alimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plato_alimento` (
  `codigo_plato` varchar(5) NOT NULL,
  `codigo_alimento` varchar(5) NOT NULL,
  PRIMARY KEY (`codigo_plato`,`codigo_alimento`),
  KEY `codigo_alimento_idx` (`codigo_alimento`),
  CONSTRAINT `codigo_alimento` FOREIGN KEY (`codigo_alimento`) REFERENCES `alimento` (`codigo_alimento`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `codigo_plato` FOREIGN KEY (`codigo_plato`) REFERENCES `plato` (`codigo_plato`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plato_alimento`
--

LOCK TABLES `plato_alimento` WRITE;
/*!40000 ALTER TABLE `plato_alimento` DISABLE KEYS */;
/*!40000 ALTER TABLE `plato_alimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plato_pedido`
--

DROP TABLE IF EXISTS `plato_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plato_pedido` (
  `codigo_pedido` varchar(15) NOT NULL,
  `codigo_plato` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`codigo_pedido`),
  KEY `codigo_plato_idx` (`codigo_plato`),
  CONSTRAINT `codigo_pedido` FOREIGN KEY (`codigo_pedido`) REFERENCES `pedido` (`codigo_pedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_codigo_plato` FOREIGN KEY (`codigo_plato`) REFERENCES `plato` (`codigo_plato`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plato_pedido`
--

LOCK TABLES `plato_pedido` WRITE;
/*!40000 ALTER TABLE `plato_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `plato_pedido` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-03 12:57:13
