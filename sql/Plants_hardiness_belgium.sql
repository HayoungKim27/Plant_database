-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: localhost    Database: Plants
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `hardiness_belgium`
--

DROP TABLE IF EXISTS `hardiness_belgium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hardiness_belgium` (
  `country` varchar(300) NOT NULL,
  `location` varchar(300) NOT NULL,
  `hardiness_zone` varchar(300) NOT NULL,
  PRIMARY KEY (`location`),
  KEY `plant_zone` (`hardiness_zone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hardiness_belgium`
--

LOCK TABLES `hardiness_belgium` WRITE;
/*!40000 ALTER TABLE `hardiness_belgium` DISABLE KEYS */;
INSERT INTO `hardiness_belgium` VALUES ('Belgium','Aalst (8)','8'),('Belgium','Anderlecht (8)','8'),('Belgium','Antwerp (8)','8'),('Belgium','Antwerpen (8)','8'),('Belgium','Ath (8)','8'),('Belgium','Aubange (8)','8'),('Belgium','Bastogne (8)','8'),('Belgium','Binche (8)','8'),('Belgium','Brugge (9)','9'),('Belgium','Brussels (8)','8'),('Belgium','Charleroi (8)','8'),('Belgium','Couvin (8)','8'),('Belgium','Gembloux (7)','7'),('Belgium','Genk (8)','8'),('Belgium','Gent (8)','8'),('Belgium','Geraardsbergen (8)','8'),('Belgium','Hasselt (8)','8'),('Belgium','Ieper (8)','8'),('Belgium','Izegem (8)','8'),('Belgium','Knokke-Heist (9)','9'),('Belgium','Kortrijk (8)','8'),('Belgium','La Louviere (8)','8'),('Belgium','Leuven (8)','8'),('Belgium','Liege (8)','8'),('Belgium','Malmedy (8)','8'),('Belgium','Marche-en-Famenne (8)','8'),('Belgium','Mons (8)','8'),('Belgium','Mouscron (8)','8'),('Belgium','Namur (8)','8'),('Belgium','Nivelles (8)','8'),('Belgium','Oostende (8)','8'),('Belgium','Oostkamp (9)','9'),('Belgium','Oudenaarde (8)','8'),('Belgium','Poperinge (8)','8'),('Belgium','Roeselare (8)','8'),('Belgium','Ronse (8)','8'),('Belgium','Schaerbeek (8)','8'),('Belgium','Sint-Niklaas (8)','8'),('Belgium','Tournai (8)','8'),('Belgium','Uccle (8)','8'),('Belgium','Verviers (8)','8'),('Belgium','Waterloo (8)','8'),('Belgium','Zelzate (8)','8');
/*!40000 ALTER TABLE `hardiness_belgium` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-19 11:11:04
