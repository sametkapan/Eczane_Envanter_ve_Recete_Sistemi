-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: eczane_db
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `doktorlar`
--

DROP TABLE IF EXISTS `doktorlar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doktorlar` (
  `DoktorID` int NOT NULL AUTO_INCREMENT,
  `Ad` varchar(50) DEFAULT NULL,
  `Soyad` varchar(50) DEFAULT NULL,
  `Brans` varchar(100) DEFAULT NULL,
  `SicilNo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`DoktorID`),
  UNIQUE KEY `SicilNo` (`SicilNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doktorlar`
--

LOCK TABLES `doktorlar` WRITE;
/*!40000 ALTER TABLE `doktorlar` DISABLE KEYS */;
/*!40000 ALTER TABLE `doktorlar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hastalar`
--

DROP TABLE IF EXISTS `hastalar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hastalar` (
  `HastaID` int NOT NULL AUTO_INCREMENT,
  `Ad` varchar(50) DEFAULT NULL,
  `Soyad` varchar(50) DEFAULT NULL,
  `TCNo` varchar(11) DEFAULT NULL,
  `DogumTarihi` date DEFAULT NULL,
  `Telefon` varchar(15) DEFAULT NULL,
  `Adres` text,
  PRIMARY KEY (`HastaID`),
  UNIQUE KEY `TCNo` (`TCNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hastalar`
--

LOCK TABLES `hastalar` WRITE;
/*!40000 ALTER TABLE `hastalar` DISABLE KEYS */;
/*!40000 ALTER TABLE `hastalar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ilaclar`
--

DROP TABLE IF EXISTS `ilaclar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ilaclar` (
  `IlacID` int NOT NULL AUTO_INCREMENT,
  `IlacAdi` varchar(100) DEFAULT NULL,
  `BarkodNo` varchar(50) DEFAULT NULL,
  `UreticiFirma` varchar(100) DEFAULT NULL,
  `StokAdedi` int DEFAULT NULL,
  `Fiyat` decimal(10,2) DEFAULT NULL,
  `RafNo` varchar(20) DEFAULT NULL,
  `SKT` date DEFAULT NULL,
  PRIMARY KEY (`IlacID`),
  UNIQUE KEY `BarkodNo` (`BarkodNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ilaclar`
--

LOCK TABLES `ilaclar` WRITE;
/*!40000 ALTER TABLE `ilaclar` DISABLE KEYS */;
/*!40000 ALTER TABLE `ilaclar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recetedetay`
--

DROP TABLE IF EXISTS `recetedetay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recetedetay` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ReceteID` int DEFAULT NULL,
  `IlacID` int DEFAULT NULL,
  `Adet` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ReceteID` (`ReceteID`),
  KEY `IlacID` (`IlacID`),
  CONSTRAINT `recetedetay_ibfk_1` FOREIGN KEY (`ReceteID`) REFERENCES `receteler` (`ReceteID`),
  CONSTRAINT `recetedetay_ibfk_2` FOREIGN KEY (`IlacID`) REFERENCES `ilaclar` (`IlacID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recetedetay`
--

LOCK TABLES `recetedetay` WRITE;
/*!40000 ALTER TABLE `recetedetay` DISABLE KEYS */;
/*!40000 ALTER TABLE `recetedetay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receteler`
--

DROP TABLE IF EXISTS `receteler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receteler` (
  `ReceteID` int NOT NULL AUTO_INCREMENT,
  `HastaID` int DEFAULT NULL,
  `DoktorID` int DEFAULT NULL,
  `Tarih` date DEFAULT NULL,
  `Aciklama` text,
  PRIMARY KEY (`ReceteID`),
  KEY `HastaID` (`HastaID`),
  KEY `DoktorID` (`DoktorID`),
  CONSTRAINT `receteler_ibfk_1` FOREIGN KEY (`HastaID`) REFERENCES `hastalar` (`HastaID`),
  CONSTRAINT `receteler_ibfk_2` FOREIGN KEY (`DoktorID`) REFERENCES `doktorlar` (`DoktorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receteler`
--

LOCK TABLES `receteler` WRITE;
/*!40000 ALTER TABLE `receteler` DISABLE KEYS */;
/*!40000 ALTER TABLE `receteler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `satislar`
--

DROP TABLE IF EXISTS `satislar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `satislar` (
  `SatisID` int NOT NULL AUTO_INCREMENT,
  `IlacID` int DEFAULT NULL,
  `HastaID` int DEFAULT NULL,
  `SatisTarihi` date DEFAULT NULL,
  `Adet` int DEFAULT NULL,
  `ToplamTutar` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`SatisID`),
  KEY `IlacID` (`IlacID`),
  KEY `HastaID` (`HastaID`),
  CONSTRAINT `satislar_ibfk_1` FOREIGN KEY (`IlacID`) REFERENCES `ilaclar` (`IlacID`),
  CONSTRAINT `satislar_ibfk_2` FOREIGN KEY (`HastaID`) REFERENCES `hastalar` (`HastaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `satislar`
--

LOCK TABLES `satislar` WRITE;
/*!40000 ALTER TABLE `satislar` DISABLE KEYS */;
/*!40000 ALTER TABLE `satislar` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-29 23:09:58
