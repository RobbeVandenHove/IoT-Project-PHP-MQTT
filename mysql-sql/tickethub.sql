-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tickethub_b
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.17-MariaDB

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
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

DROP DATABASE IF EXISTS `tickethub_b`;

CREATE DATABASE `tickethub_b` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE `tickethub_b`;

--
-- Table structure for table `evenementen`
--

DROP TABLE IF EXISTS `evenementen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evenementen` (
  `evenementenId` int(11) NOT NULL AUTO_INCREMENT,
  `naam` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aanvangstijd` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sluitingstijd` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locatie` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `beschrijving` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AanwezigeArtiesten` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` ENUM('festival', 'concert') NOT NULL,
  PRIMARY KEY (`evenementenId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evenementen`
--

LOCK TABLES `evenementen` WRITE;
/*!40000 ALTER TABLE `evenementen` DISABLE KEYS */;
INSERT INTO `evenementen` VALUES (1,'Pukkelpop','10','23','BE','Jaarlijks terugkerend Popmuziekfestival','Dua Lipa, Migos, Netsky','festival'),(2,'Pinkpop','10','21','NL','Driedaags popfestival met Pinksteren','RHCP, Anouk, Bruno Mars','festival'),(3,'Rock Werchter','9','24','BE','Pop- en rockfestival','TOP, Gorillaz, Pearl Jam','festival'),(4,'Tommorowland','8','20','BE','Outdoor dancefestival','Adam Beyer, Amelie Lens, Steve Aoki','festival'),(5,'Main Square Festival','11','22','FR','Multi genre muziekfestival','Cypress Hill, Angele, Damso','festival'),(6,'Zwarte Cross','8','19','NL','Multi genre muziekfestival','Paul Elstak, Joost, Wulf','festival');
/*!40000 ALTER TABLE `evenementen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gebruikers`
--

DROP TABLE IF EXISTS `gebruikers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gebruikers` (
  `gebruikersId` int(11) NOT NULL AUTO_INCREMENT,
  `gebruikersNaam` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paswoord` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `geregistreerdeVrienden` int(11) NOT NULL,
  PRIMARY KEY (`gebruikersId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gebruikers`
--

LOCK TABLES `gebruikers` WRITE;
/*!40000 ALTER TABLE `gebruikers` DISABLE KEYS */;
INSERT INTO `gebruikers` VALUES (4,'admin','admin@odisee.be','$2y$10$stLs57PRTtcMCmp4kJ9MWuZ4SzVeyu7z7M9HwyIleb7s4a6nVZbHu','0001',0);
/*!40000 ALTER TABLE `gebruikers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gebruikers_has_tickets`
--

DROP TABLE IF EXISTS `gebruikers_has_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gebruikers_has_tickets` (
  `gebruikers_gebruikersId` int(11) NOT NULL,
  `tickets_ticketsId` int(11) NOT NULL,
  PRIMARY KEY (`gebruikers_gebruikersId`,`tickets_ticketsId`),
  KEY `fk_gebruikers_has_tickets_tickets1_idx` (`tickets_ticketsId`),
  KEY `fk_gebruikers_has_tickets_gebruikers1_idx` (`gebruikers_gebruikersId`),
  CONSTRAINT `fk_gebruikers_has_tickets_gebruikers1` FOREIGN KEY (`gebruikers_gebruikersId`) REFERENCES `gebruikers` (`gebruikersId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_gebruikers_has_tickets_tickets1` FOREIGN KEY (`tickets_ticketsId`) REFERENCES `tickets` (`ticketsId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gebruikers_has_tickets`
--

LOCK TABLES `gebruikers_has_tickets` WRITE;
/*!40000 ALTER TABLE `gebruikers_has_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `gebruikers_has_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `ticketsId` int(11) NOT NULL AUTO_INCREMENT,
  `naam` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prijsPerTicket` double NOT NULL,
  `aantalBeschikbaar` int(11) NOT NULL,
  `redenVerkoop` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ticketsId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (1,'Combi ticket pukkelpop',250,2,'privé'),(2,'Zaterdagpass zwarte cross',50,5,'Trouwfeest'),(3,'Combi ticket MSQ',180,3,'Examens'),(4,'Zondagticket Werchter',70,1,'privé'),(5,'Vrijdagticket + parking Pinkpop',40,5,'Geboortefeest'),(6,'Weekendticket Tommorowland',1000,10,'privé'),(7,'Zondagticket Main Square Festiv',80,2,'naar Werchter'),(8,'Vrijdagticket pukkelpop + treintickets',100,5,'overlijden'),(9,'Zaterdag Tommorowland',200,1,'privé'),(10,'Combiticket Zwarte cross + camping',180,3,'privé');
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets_has_evenementen`
--

DROP TABLE IF EXISTS `tickets_has_evenementen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets_has_evenementen` (
  `tickets_ticketsId` int(11) NOT NULL,
  `evenementen_evenementenId` int(11) NOT NULL,
  PRIMARY KEY (`tickets_ticketsId`,`evenementen_evenementenId`),
  KEY `fk_tickets_has_evenementen_evenementen1_idx` (`evenementen_evenementenId`),
  KEY `fk_tickets_has_evenementen_tickets_idx` (`tickets_ticketsId`),
  CONSTRAINT `fk_tickets_has_evenementen_evenementen1` FOREIGN KEY (`evenementen_evenementenId`) REFERENCES `evenementen` (`evenementenId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tickets_has_evenementen_tickets` FOREIGN KEY (`tickets_ticketsId`) REFERENCES `tickets` (`ticketsId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets_has_evenementen`
--

LOCK TABLES `tickets_has_evenementen` WRITE;
/*!40000 ALTER TABLE `tickets_has_evenementen` DISABLE KEYS */;
INSERT INTO `tickets_has_evenementen` VALUES (1,1),(2,6),(3,5),(4,3),(5,2),(6,4),(7,5),(8,1),(9,4),(10,6);
/*!40000 ALTER TABLE `tickets_has_evenementen` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-04 15:26:30

