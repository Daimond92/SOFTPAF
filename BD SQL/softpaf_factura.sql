CREATE DATABASE  IF NOT EXISTS `softpaf` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `softpaf`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: softpaf
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `Nombre_trabajador` varchar(100) NOT NULL,
  `Cedula_trabajador` int NOT NULL,
  `Rol` varchar(20) NOT NULL,
  `FID_cliente` int NOT NULL,
  `Nombre_cliente` varchar(100) NOT NULL,
  `Cedula_cliente` int NOT NULL,
  `FID_producto` int NOT NULL,
  `Precio_venta_producto` int NOT NULL,
  `Cantidad_producto` int NOT NULL,
  `Precio_total_producto` int GENERATED ALWAYS AS ((`Precio_venta_producto` * `Cantidad_producto`)) VIRTUAL,
  `FID_servicios` int NOT NULL,
  `Precio_venta_servicio` int NOT NULL,
  `Cantidad_servicio` int NOT NULL,
  `Precio_total_servicio` int GENERATED ALWAYS AS ((`Precio_venta_servicio` * `Cantidad_servicio`)) VIRTUAL,
  `Subtotal` int GENERATED ALWAYS AS ((`Precio_total_producto` + `Precio_total_servicio`)) VIRTUAL,
  `IVA` int GENERATED ALWAYS AS ((`Subtotal` * 0.19)) VIRTUAL,
  `Total_a_pagar` int GENERATED ALWAYS AS ((`Subtotal` + `IVA`)) VIRTUAL,
  PRIMARY KEY (`Nombre_trabajador`,`Cedula_trabajador`,`Rol`,`FID_cliente`,`Nombre_cliente`,`Cedula_cliente`,`FID_producto`,`Precio_venta_producto`,`FID_servicios`,`Precio_venta_servicio`),
  KEY `fk_Roles_has_Clientes_Clientes1_idx` (`FID_cliente`,`Nombre_cliente`,`Cedula_cliente`),
  KEY `fk_Roles_has_Clientes_Roles1_idx` (`Cedula_trabajador`,`Nombre_trabajador`,`Rol`),
  KEY `fk_Roles_has_Clientes_Productos1_idx` (`FID_producto`,`Precio_venta_producto`),
  KEY `fk_Factura_Servicios1_idx` (`FID_servicios`,`Precio_venta_servicio`),
  CONSTRAINT `fk_Factura_Servicios1` FOREIGN KEY (`FID_servicios`, `Precio_venta_servicio`) REFERENCES `servicios` (`FID_servicios`, `Precio_venta_servicio`),
  CONSTRAINT `fk_Roles_has_Clientes_Clientes1` FOREIGN KEY (`FID_cliente`, `Nombre_cliente`, `Cedula_cliente`) REFERENCES `clientes` (`FID_cliente`, `Nombre_cliente`, `Cedula_cliente`),
  CONSTRAINT `fk_Roles_has_Clientes_Productos1` FOREIGN KEY (`FID_producto`, `Precio_venta_producto`) REFERENCES `productos` (`FID_producto`, `Precio_venta_producto`),
  CONSTRAINT `fk_Roles_has_Clientes_Roles1` FOREIGN KEY (`Cedula_trabajador`, `Nombre_trabajador`, `Rol`) REFERENCES `roles` (`Cedula_trabajador`, `Nombre_trabajador`, `Rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla de facturación del software';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-11 11:31:38
