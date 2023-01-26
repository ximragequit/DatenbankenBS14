-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server Version:               10.4.27-MariaDB - mariadb.org binary distribution
-- Server Betriebssystem:        Win64
-- HeidiSQL Version:             12.2.0.6576
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Exportiere Datenbank Struktur für webshop
CREATE DATABASE IF NOT EXISTS `webshop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `webshop`;

-- Exportiere Struktur von Tabelle webshop.bestellung
CREATE TABLE IF NOT EXISTS `bestellung` (
  `Bestellung_ID` int(11) NOT NULL,
  `RechnAddr_ID` int(11) DEFAULT NULL,
  `Kunde_ID` int(11) DEFAULT NULL,
  `Einkaufskorb_ID` int(11) DEFAULT NULL,
  `ZustellAddr_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Bestellung_ID`),
  KEY `FK_bestellung_rechnungsadresse` (`RechnAddr_ID`),
  KEY `FK_bestellung_kunde` (`Kunde_ID`),
  KEY `Z` (`ZustellAddr_ID`),
  KEY `FK_bestellung_einkaufkorb` (`Einkaufskorb_ID`),
  CONSTRAINT `FK_bestellung_einkaufkorb` FOREIGN KEY (`Einkaufskorb_ID`) REFERENCES `einkaufkorb` (`Einkaufskorb_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_bestellung_kunde` FOREIGN KEY (`Kunde_ID`) REFERENCES `kunde` (`Kunde_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_bestellung_rechnungsadresse` FOREIGN KEY (`RechnAddr_ID`) REFERENCES `rechnungsadresse` (`RechnAddr_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Z` FOREIGN KEY (`ZustellAddr_ID`) REFERENCES `zustellungsadresse` (`ZustellAddr_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportiere Daten aus Tabelle webshop.bestellung: ~0 rows (ungefähr)

-- Exportiere Struktur von Tabelle webshop.einkaufkorb
CREATE TABLE IF NOT EXISTS `einkaufkorb` (
  `Einkaufskorb_ID` int(11) NOT NULL,
  `Gesamtpreis` int(11) DEFAULT NULL,
  PRIMARY KEY (`Einkaufskorb_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportiere Daten aus Tabelle webshop.einkaufkorb: ~0 rows (ungefähr)

-- Exportiere Struktur von Tabelle webshop.einkaufskorbinhalt
CREATE TABLE IF NOT EXISTS `einkaufskorbinhalt` (
  `Einkaufskorbinhalt_ID` int(11) NOT NULL,
  `Anzahl` int(11) DEFAULT NULL,
  `Preis` int(11) DEFAULT NULL,
  `Einkaufskorb_ID` int(11) DEFAULT NULL,
  `Produkt_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Einkaufskorbinhalt_ID`),
  KEY `FK_einkaufskorbinhalt_einkaufkorb` (`Einkaufskorb_ID`),
  KEY `FK_einkaufskorbinhalt_produkt` (`Produkt_ID`),
  CONSTRAINT `FK_einkaufskorbinhalt_einkaufkorb` FOREIGN KEY (`Einkaufskorb_ID`) REFERENCES `einkaufkorb` (`Einkaufskorb_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_einkaufskorbinhalt_produkt` FOREIGN KEY (`Produkt_ID`) REFERENCES `produkt` (`Produkt_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportiere Daten aus Tabelle webshop.einkaufskorbinhalt: ~0 rows (ungefähr)

-- Exportiere Struktur von Tabelle webshop.kunde
CREATE TABLE IF NOT EXISTS `kunde` (
  `Kunde_ID` int(11) NOT NULL,
  `Vorname` varchar(50) DEFAULT NULL,
  `Nachname` varchar(50) DEFAULT NULL,
  `Telefonnummer` int(11) DEFAULT NULL,
  `ZustellAddr_ID` int(11) DEFAULT NULL,
  `RechnAddr_ID` int(11) DEFAULT NULL,
  `Nutzer_ID` int(11) DEFAULT NULL,
  `Einkaufskorb_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Kunde_ID`),
  KEY `ZustellAddr_ID` (`ZustellAddr_ID`),
  KEY `RechnAddr_ID` (`RechnAddr_ID`),
  KEY `Nutzer_ID` (`Nutzer_ID`),
  CONSTRAINT `Nutzer_ID` FOREIGN KEY (`Nutzer_ID`) REFERENCES `nutzer` (`Nutzer_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `RechnAddr_ID` FOREIGN KEY (`RechnAddr_ID`) REFERENCES `rechnungsadresse` (`RechnAddr_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ZustellAddr_ID` FOREIGN KEY (`ZustellAddr_ID`) REFERENCES `zustellungsadresse` (`ZustellAddr_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportiere Daten aus Tabelle webshop.kunde: ~0 rows (ungefähr)

-- Exportiere Struktur von Tabelle webshop.nutzer
CREATE TABLE IF NOT EXISTS `nutzer` (
  `Nutzer_ID` int(11) NOT NULL,
  `Passwort` varchar(50) DEFAULT NULL,
  `Aktiviert` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Nutzer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportiere Daten aus Tabelle webshop.nutzer: ~0 rows (ungefähr)

-- Exportiere Struktur von Tabelle webshop.produkt
CREATE TABLE IF NOT EXISTS `produkt` (
  `Produkt_ID` int(11) NOT NULL,
  `Hersteller` varchar(50) DEFAULT NULL,
  `Kategorie` varchar(255) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Beschreibung` varchar(255) DEFAULT NULL,
  `Farbe` varchar(15) DEFAULT NULL,
  `Größe` varchar(3) DEFAULT NULL,
  `Preis` decimal(20,2) DEFAULT NULL,
  `Bestand` int(11) DEFAULT NULL,
  `Produkt_Preid` int(11) DEFAULT NULL,
  PRIMARY KEY (`Produkt_ID`),
  KEY `FK_produkt_produktpreview` (`Produkt_Preid`),
  CONSTRAINT `FK_produkt_produktpreview` FOREIGN KEY (`Produkt_Preid`) REFERENCES `produktpreview` (`produkt_preid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportiere Daten aus Tabelle webshop.produkt: ~120 rows (ungefähr)
INSERT INTO `produkt` (`Produkt_ID`, `Hersteller`, `Kategorie`, `Name`, `Beschreibung`, `Farbe`, `Größe`, `Preis`, `Bestand`, `Produkt_Preid`) VALUES
	(1, 'DruckIndustry', 'T-Shirt Herren', 'T-Shirt Blau XS', 'T-Shirt mit Aufdruck', 'Blau', 'XS', 19.99, 54, NULL),
	(2, 'DruckIndustry', 'T-Shirt Herren', 'T-Shirt Blau S', 'T-Shirt mit Aufdruck', 'Blau', 'S', 19.99, 62, NULL),
	(3, 'DruckIndustry', 'T-Shirt Herren', 'T-Shirt Blau M', 'T-Shirt mit Aufdruck', 'Blau', 'M', 19.99, 33, NULL),
	(4, 'DruckIndustry', 'T-Shirt Herren', 'T-Shirt Blau L', 'T-Shirt mit Aufdruck', 'Blau', 'L', 19.99, 51, NULL),
	(5, 'DruckIndustry', 'T-Shirt Herren', 'T-Shirt Blau XL', 'T-Shirt mit Aufdruck', 'Blau', 'XL', 19.99, 44, NULL),
	(6, 'DruckIndustry', 'T-Shirt Herren', 'T-Shirt Blau XXL', 'T-Shirt mit Aufdruck', 'Blau', 'XXL', 19.99, 38, NULL),
	(7, 'Druck und Geschmeidig SE', 'T-Shirt Herren', 'T-Shirt Grau XS', 'T-Shirt mit Aufdruck', 'Grau', 'XS', 19.99, 45, NULL),
	(8, 'Druck und Geschmeidig SE', 'T-Shirt Herren', 'T-Shirt Grau S', 'T-Shirt mit Aufdruck', 'Grau', 'S', 19.99, 55, NULL),
	(9, 'Druck und Geschmeidig SE', 'T-Shirt Herren', 'T-Shirt Grau M', 'T-Shirt mit Aufdruck', 'Grau', 'M', 19.99, 69, NULL),
	(10, 'Druck und Geschmeidig SE', 'T-Shirt Herren', 'T-Shirt Grau L', 'T-Shirt mit Aufdruck', 'Grau', 'L', 19.99, 25, NULL),
	(11, 'Druck und Geschmeidig SE', 'T-Shirt Herren', 'T-Shirt Grau XL', 'T-Shirt mit Aufdruck', 'Grau', 'XL', 19.99, 41, NULL),
	(12, 'Druck und Geschmeidig SE', 'T-Shirt Herren', 'T-Shirt Grau XXL', 'T-Shirt mit Aufdruck', 'Grau', 'XXL', 19.99, 32, NULL),
	(13, 'DruckIndustry', 'T-Shirt Herren', 'T-Shirt Rot XS', 'T-Shirt mit Aufdruck', 'Rot', 'XS', 19.99, 42, NULL),
	(14, 'DruckIndustry', 'T-Shirt Herren', 'T-Shirt Rot S', 'T-Shirt mit Aufdruck', 'Rot', 'S', 19.99, 56, NULL),
	(15, 'DruckIndustry', 'T-Shirt Herren', 'T-Shirt Rot M', 'T-Shirt mit Aufdruck', 'Rot', 'M', 19.99, 70, NULL),
	(16, 'DruckIndustry', 'T-Shirt Herren', 'T-Shirt Rot L', 'T-Shirt mit Aufdruck', 'Rot', 'L', 19.99, 24, NULL),
	(17, 'DruckIndustry', 'T-Shirt Herren', 'T-Shirt Rot XL', 'T-Shirt mit Aufdruck', 'Rot', 'XL', 19.99, 40, NULL),
	(18, 'DruckIndustry', 'T-Shirt Herren', 'T-Shirt Rot XXL', 'T-Shirt mit Aufdruck', 'Rot', 'XXL', 19.99, 30, NULL),
	(19, 'AufdruckService GmbH', 'T-Shirt Herren', 'T-Shirt Weiß XS', 'T-Shirt mit Aufdruck', 'Weiß', 'XS', 19.99, 27, NULL),
	(20, 'AufdruckService GmbH', 'T-Shirt Herren', 'T-Shirt Weiß S', 'T-Shirt mit Aufdruck', 'Weiß', 'S', 19.99, 66, NULL),
	(21, 'AufdruckService GmbH', 'T-Shirt Herren', 'T-Shirt Weiß M', 'T-Shirt mit Aufdruck', 'Weiß', 'M', 19.99, 12, NULL),
	(22, 'AufdruckService GmbH', 'T-Shirt Herren', 'T-Shirt Weiß L', 'T-Shirt mit Aufdruck', 'Weiß', 'L', 19.99, 46, NULL),
	(23, 'AufdruckService GmbH', 'T-Shirt Herren', 'T-Shirt Weiß XL', 'T-Shirt mit Aufdruck', 'Weiß', 'XL', 19.99, 83, NULL),
	(24, 'AufdruckService GmbH', 'T-Shirt Herren', 'T-Shirt Weiß XXL', 'T-Shirt mit Aufdruck', 'Weiß', 'XXL', 19.99, 72, NULL),
	(25, 'AufdruckService GmbH', 'T-Shirt Herren', 'T-Shirt Schwarz XS', 'T-Shirt mit Aufdruck', 'Schwarz', 'XS', 19.99, 88, NULL),
	(26, 'AufdruckService GmbH', 'T-Shirt Herren', 'T-Shirt Schwarz S', 'T-Shirt mit Aufdruck', 'Schwarz', 'S', 19.99, 49, NULL),
	(27, 'AufdruckService GmbH', 'T-Shirt Herren', 'T-Shirt Schwarz M', 'T-Shirt mit Aufdruck', 'Schwarz', 'M', 19.99, 75, NULL),
	(28, 'AufdruckService GmbH', 'T-Shirt Herren', 'T-Shirt Schwarz L', 'T-Shirt mit Aufdruck', 'Schwarz', 'L', 19.99, 47, NULL),
	(29, 'AufdruckService GmbH', 'T-Shirt Herren', 'T-Shirt Schwarz XL', 'T-Shirt mit Aufdruck', 'Schwarz', 'XL', 19.99, 22, NULL),
	(30, 'AufdruckService GmbH', 'T-Shirt Herren', 'T-Shirt Schwarz XXL', 'T-Shirt mit Aufdruck', 'Schwarz', 'XXL', 19.99, 26, NULL),
	(31, 'HOODie ForEVER UG', 'Hoodie Herren', 'Hoodie Grau XS', 'Hoodie mit Aufdruck', 'Grau', 'XS', 39.99, 55, NULL),
	(32, 'HOODie ForEVER UG', 'Hoodie Herren', 'Hoodie Grau S', 'Hoodie mit Aufdruck', 'Grau', 'S', 39.99, 55, NULL),
	(33, 'HOODie ForEVER UG', 'Hoodie Herren', 'Hoodie Grau M', 'Hoodie mit Aufdruck', 'Grau', 'M', 39.99, 63, NULL),
	(34, 'HOODie ForEVER UG', 'Hoodie Herren', 'Hoodie Grau L', 'Hoodie mit Aufdruck', 'Grau', 'L', 39.99, 85, NULL),
	(35, 'HOODie ForEVER UG', 'Hoodie Herren', 'Hoodie Grau XL', 'Hoodie mit Aufdruck', 'Grau', 'XL', 39.99, 55, NULL),
	(36, 'HOODie ForEVER UG', 'Hoodie Herren', 'Hoodie Grau XXL', 'Hoodie mit Aufdruck', 'Grau', 'XXL', 39.99, 34, NULL),
	(37, 'HOODie ForEVER UG', 'Hoodie Herren', 'Hoodie Blau XS', 'Hoodie mit Aufdruck', 'Blau', 'XS', 39.99, 77, NULL),
	(38, 'HOODie ForEVER UG', 'Hoodie Herren', 'Hoodie Blau S', 'Hoodie mit Aufdruck', 'Blau', 'S', 39.99, 56, NULL),
	(39, 'HOODie ForEVER UG', 'Hoodie Herren', 'Hoodie Blau M', 'Hoodie mit Aufdruck', 'Blau', 'M', 39.99, 76, NULL),
	(40, 'HOODie ForEVER UG', 'Hoodie Herren', 'Hoodie Blau L', 'Hoodie mit Aufdruck', 'Blau', 'L', 39.99, 25, NULL),
	(41, 'HOODie ForEVER UG', 'Hoodie Herren', 'Hoodie Blau XL', 'Hoodie mit Aufdruck', 'Blau', 'XL', 39.99, 41, NULL),
	(42, 'HOODie ForEVER UG', 'Hoodie Herren', 'Hoodie Blau XXL', 'Hoodie mit Aufdruck', 'Blau', 'XXL', 39.99, 32, NULL),
	(43, 'Druck und Geschmeidig SE', 'Hoodie Herren', 'Hoodie Rot XS', 'Hoodie mit Aufdruck', 'Rot', 'XS', 39.99, 45, NULL),
	(44, 'Druck und Geschmeidig SE', 'Hoodie Herren', 'Hoodie Rot S', 'Hoodie mit Aufdruck', 'Rot', 'S', 39.99, 55, NULL),
	(45, 'Druck und Geschmeidig SE', 'Hoodie Herren', 'Hoodie Rot M', 'Hoodie mit Aufdruck', 'Rot', 'M', 39.99, 34, NULL),
	(46, 'Druck und Geschmeidig SE', 'Hoodie Herren', 'Hoodie Rot L', 'Hoodie mit Aufdruck', 'Rot', 'L', 39.99, 22, NULL),
	(47, 'Druck und Geschmeidig SE', 'Hoodie Herren', 'Hoodie Rot XL', 'Hoodie mit Aufdruck', 'Rot', 'XL', 39.99, 11, NULL),
	(48, 'Druck und Geschmeidig SE', 'Hoodie Herren', 'Hoodie Rot XXL', 'Hoodie mit Aufdruck', 'Rot', 'XXL', 39.99, 3, NULL),
	(49, 'ReinerTragegenuss oHG', 'Hoodie Herren', 'Hoodie Schwarz XS', 'Hoodie mit Aufdruck', 'Schwarz', 'XS', 39.99, 45, NULL),
	(50, 'ReinerTragegenuss oHG', 'Hoodie Herren', 'Hoodie Schwarz S', 'Hoodie mit Aufdruck', 'Schwarz', 'S', 39.99, 2, NULL),
	(51, 'ReinerTragegenuss oHG', 'Hoodie Herren', 'Hoodie Schwarz M', 'Hoodie mit Aufdruck', 'Schwarz', 'M', 39.99, 35, NULL),
	(52, 'ReinerTragegenuss oHG', 'Hoodie Herren', 'Hoodie Schwarz L', 'Hoodie mit Aufdruck', 'Schwarz', 'L', 39.99, 55, NULL),
	(53, 'ReinerTragegenuss oHG', 'Hoodie Herren', 'Hoodie Schwarz XL', 'Hoodie mit Aufdruck', 'Schwarz', 'XL', 39.99, 74, NULL),
	(54, 'ReinerTragegenuss oHG', 'Hoodie Herren', 'Hoodie Schwarz XXL', 'Hoodie mit Aufdruck', 'Schwarz', 'XXL', 39.99, 55, NULL),
	(55, 'ReinerTragegenuss oHG', 'Hoodie Herren', 'Hoodie Weiß XS', 'Hoodie mit Aufdruck', 'Weiß', 'XS', 39.99, 45, NULL),
	(56, 'ReinerTragegenuss oHG', 'Hoodie Herren', 'Hoodie Weiß S', 'Hoodie mit Aufdruck', 'Weiß', 'S', 39.99, 66, NULL),
	(57, 'ReinerTragegenuss oHG', 'Hoodie Herren', 'Hoodie Weiß M', 'Hoodie mit Aufdruck', 'Weiß', 'M', 39.99, 44, NULL),
	(58, 'ReinerTragegenuss oHG', 'Hoodie Herren', 'Hoodie Weiß L', 'Hoodie mit Aufdruck', 'Weiß', 'L', 39.99, 34, NULL),
	(59, 'ReinerTragegenuss oHG', 'Hoodie Herren', 'Hoodie Weiß XL', 'Hoodie mit Aufdruck', 'Weiß', 'XL', 39.99, 41, NULL),
	(60, 'ReinerTragegenuss oHG', 'Hoodie Herren', 'Hoodie Weiß XXL', 'Hoodie mit Aufdruck', 'Weiß', 'XXL', 39.99, 88, NULL),
	(61, 'DruckIndustry', 'T-Shirt Damen', 'T-Shirt Blau XS', 'T-Shirt mit Aufdruck', 'Blau', 'XS', 19.99, 54, NULL),
	(62, 'DruckIndustry', 'T-Shirt Damen', 'T-Shirt Blau S', 'T-Shirt mit Aufdruck', 'Blau', 'S', 19.99, 62, NULL),
	(63, 'DruckIndustry', 'T-Shirt Damen', 'T-Shirt Blau M', 'T-Shirt mit Aufdruck', 'Blau', 'M', 19.99, 33, NULL),
	(64, 'DruckIndustry', 'T-Shirt Damen', 'T-Shirt Blau L', 'T-Shirt mit Aufdruck', 'Blau', 'L', 19.99, 51, NULL),
	(65, 'DruckIndustry', 'T-Shirt Damen', 'T-Shirt Blau XL', 'T-Shirt mit Aufdruck', 'Blau', 'XL', 19.99, 44, NULL),
	(66, 'DruckIndustry', 'T-Shirt Damen', 'T-Shirt Blau XXL', 'T-Shirt mit Aufdruck', 'Blau', 'XXL', 19.99, 38, NULL),
	(67, 'Druck und Geschmeidig SE', 'T-Shirt Damen', 'T-Shirt Grau XS', 'T-Shirt mit Aufdruck', 'Grau', 'XS', 19.99, 45, NULL),
	(68, 'Druck und Geschmeidig SE', 'T-Shirt Damen', 'T-Shirt Grau S', 'T-Shirt mit Aufdruck', 'Grau', 'S', 19.99, 55, NULL),
	(69, 'Druck und Geschmeidig SE', 'T-Shirt Damen', 'T-Shirt Grau M', 'T-Shirt mit Aufdruck', 'Grau', 'M', 19.99, 69, NULL),
	(70, 'Druck und Geschmeidig SE', 'T-Shirt Damen', 'T-Shirt Grau L', 'T-Shirt mit Aufdruck', 'Grau', 'L', 19.99, 25, NULL),
	(71, 'Druck und Geschmeidig SE', 'T-Shirt Damen', 'T-Shirt Grau XL', 'T-Shirt mit Aufdruck', 'Grau', 'XL', 19.99, 41, NULL),
	(72, 'Druck und Geschmeidig SE', 'T-Shirt Damen', 'T-Shirt Grau XXL', 'T-Shirt mit Aufdruck', 'Grau', 'XXL', 19.99, 32, NULL),
	(73, 'DruckIndustry', 'T-Shirt Damen', 'T-Shirt Rot XS', 'T-Shirt mit Aufdruck', 'Rot', 'XS', 19.99, 42, NULL),
	(74, 'DruckIndustry', 'T-Shirt Damen', 'T-Shirt Rot S', 'T-Shirt mit Aufdruck', 'Rot', 'S', 19.99, 56, NULL),
	(75, 'DruckIndustry', 'T-Shirt Damen', 'T-Shirt Rot M', 'T-Shirt mit Aufdruck', 'Rot', 'M', 19.99, 70, NULL),
	(76, 'DruckIndustry', 'T-Shirt Damen', 'T-Shirt Rot L', 'T-Shirt mit Aufdruck', 'Rot', 'L', 19.99, 24, NULL),
	(77, 'DruckIndustry', 'T-Shirt Damen', 'T-Shirt Rot XL', 'T-Shirt mit Aufdruck', 'Rot', 'XL', 19.99, 40, NULL),
	(78, 'DruckIndustry', 'T-Shirt Damen', 'T-Shirt Rot XXL', 'T-Shirt mit Aufdruck', 'Rot', 'XXL', 19.99, 30, NULL),
	(79, 'AufdruckService GmbH', 'T-Shirt Damen', 'T-Shirt Weiß XS', 'T-Shirt mit Aufdruck', 'Weiß', 'XS', 19.99, 27, NULL),
	(80, 'AufdruckService GmbH', 'T-Shirt Damen', 'T-Shirt Weiß S', 'T-Shirt mit Aufdruck', 'Weiß', 'S', 19.99, 66, NULL),
	(81, 'AufdruckService GmbH', 'T-Shirt Damen', 'T-Shirt Weiß M', 'T-Shirt mit Aufdruck', 'Weiß', 'M', 19.99, 12, NULL),
	(82, 'AufdruckService GmbH', 'T-Shirt Damen', 'T-Shirt Weiß L', 'T-Shirt mit Aufdruck', 'Weiß', 'L', 19.99, 46, NULL),
	(83, 'AufdruckService GmbH', 'T-Shirt Damen', 'T-Shirt Weiß XL', 'T-Shirt mit Aufdruck', 'Weiß', 'XL', 19.99, 83, NULL),
	(84, 'AufdruckService GmbH', 'T-Shirt Damen', 'T-Shirt Weiß XXL', 'T-Shirt mit Aufdruck', 'Weiß', 'XXL', 19.99, 72, NULL),
	(85, 'AufdruckService GmbH', 'T-Shirt Damen', 'T-Shirt Schwarz XS', 'T-Shirt mit Aufdruck', 'Schwarz', 'XS', 19.99, 88, NULL),
	(86, 'AufdruckService GmbH', 'T-Shirt Damen', 'T-Shirt Schwarz S', 'T-Shirt mit Aufdruck', 'Schwarz', 'S', 19.99, 49, NULL),
	(87, 'AufdruckService GmbH', 'T-Shirt Damen', 'T-Shirt Schwarz M', 'T-Shirt mit Aufdruck', 'Schwarz', 'M', 19.99, 75, NULL),
	(88, 'AufdruckService GmbH', 'T-Shirt Damen', 'T-Shirt Schwarz L', 'T-Shirt mit Aufdruck', 'Schwarz', 'L', 19.99, 47, NULL),
	(89, 'AufdruckService GmbH', 'T-Shirt Damen', 'T-Shirt Schwarz XL', 'T-Shirt mit Aufdruck', 'Schwarz', 'XL', 19.99, 22, NULL),
	(90, 'AufdruckService GmbH', 'T-Shirt Damen', 'T-Shirt Schwarz XXL', 'T-Shirt mit Aufdruck', 'Schwarz', 'XXL', 19.99, 26, NULL),
	(91, 'HOODie ForEVER UG', 'Hoodie Damen', 'Hoodie Grau XS', 'Hoodie mit Aufdruck', 'Grau', 'XS', 39.99, 55, NULL),
	(92, 'HOODie ForEVER UG', 'Hoodie Damen', 'Hoodie Grau S', 'Hoodie mit Aufdruck', 'Grau', 'S', 39.99, 55, NULL),
	(93, 'HOODie ForEVER UG', 'Hoodie Damen', 'Hoodie Grau M', 'Hoodie mit Aufdruck', 'Grau', 'M', 39.99, 63, NULL),
	(94, 'HOODie ForEVER UG', 'Hoodie Damen', 'Hoodie Grau L', 'Hoodie mit Aufdruck', 'Grau', 'L', 39.99, 85, NULL),
	(95, 'HOODie ForEVER UG', 'Hoodie Damen', 'Hoodie Grau XL', 'Hoodie mit Aufdruck', 'Grau', 'XL', 39.99, 55, NULL),
	(96, 'HOODie ForEVER UG', 'Hoodie Damen', 'Hoodie Grau XXL', 'Hoodie mit Aufdruck', 'Grau', 'XXL', 39.99, 34, NULL),
	(97, 'HOODie ForEVER UG', 'Hoodie Damen', 'Hoodie Blau XS', 'Hoodie mit Aufdruck', 'Blau', 'XS', 39.99, 77, NULL),
	(98, 'HOODie ForEVER UG', 'Hoodie Damen', 'Hoodie Blau S', 'Hoodie mit Aufdruck', 'Blau', 'S', 39.99, 56, NULL),
	(99, 'HOODie ForEVER UG', 'Hoodie Damen', 'Hoodie Blau M', 'Hoodie mit Aufdruck', 'Blau', 'M', 39.99, 76, NULL),
	(100, 'HOODie ForEVER UG', 'Hoodie Damen', 'Hoodie Blau L', 'Hoodie mit Aufdruck', 'Blau', 'L', 39.99, 25, NULL),
	(101, 'HOODie ForEVER UG', 'Hoodie Damen', 'Hoodie Blau XL', 'Hoodie mit Aufdruck', 'Blau', 'XL', 39.99, 41, NULL),
	(102, 'HOODie ForEVER UG', 'Hoodie Damen', 'Hoodie Blau XXL', 'Hoodie mit Aufdruck', 'Blau', 'XXL', 39.99, 32, NULL),
	(103, 'Druck und Geschmeidig SE', 'Hoodie Damen', 'Hoodie Rot XS', 'Hoodie mit Aufdruck', 'Rot', 'XS', 39.99, 45, NULL),
	(104, 'Druck und Geschmeidig SE', 'Hoodie Damen', 'Hoodie Rot S', 'Hoodie mit Aufdruck', 'Rot', 'S', 39.99, 55, NULL),
	(105, 'Druck und Geschmeidig SE', 'Hoodie Damen', 'Hoodie Rot M', 'Hoodie mit Aufdruck', 'Rot', 'M', 39.99, 34, NULL),
	(106, 'Druck und Geschmeidig SE', 'Hoodie Damen', 'Hoodie Rot L', 'Hoodie mit Aufdruck', 'Rot', 'L', 39.99, 22, NULL),
	(107, 'Druck und Geschmeidig SE', 'Hoodie Damen', 'Hoodie Rot XL', 'Hoodie mit Aufdruck', 'Rot', 'XL', 39.99, 11, NULL),
	(108, 'Druck und Geschmeidig SE', 'Hoodie Damen', 'Hoodie Rot XXL', 'Hoodie mit Aufdruck', 'Rot', 'XXL', 39.99, 3, NULL),
	(109, 'ReinerTragegenuss oHG', 'Hoodie Damen', 'Hoodie Schwarz XS', 'Hoodie mit Aufdruck', 'Schwarz', 'XS', 39.99, 45, NULL),
	(110, 'ReinerTragegenuss oHG', 'Hoodie Damen', 'Hoodie Schwarz S', 'Hoodie mit Aufdruck', 'Schwarz', 'S', 39.99, 2, NULL),
	(111, 'ReinerTragegenuss oHG', 'Hoodie Damen', 'Hoodie Schwarz M', 'Hoodie mit Aufdruck', 'Schwarz', 'M', 39.99, 35, NULL),
	(112, 'ReinerTragegenuss oHG', 'Hoodie Damen', 'Hoodie Schwarz L', 'Hoodie mit Aufdruck', 'Schwarz', 'L', 39.99, 55, NULL),
	(113, 'ReinerTragegenuss oHG', 'Hoodie Damen', 'Hoodie Schwarz XL', 'Hoodie mit Aufdruck', 'Schwarz', 'XL', 39.99, 74, NULL),
	(114, 'ReinerTragegenuss oHG', 'Hoodie Damen', 'Hoodie Schwarz XXL', 'Hoodie mit Aufdruck', 'Schwarz', 'XXL', 39.99, 55, NULL),
	(115, 'ReinerTragegenuss oHG', 'Hoodie Damen', 'Hoodie Weiß XS', 'Hoodie mit Aufdruck', 'Weiß', 'XS', 39.99, 45, NULL),
	(116, 'ReinerTragegenuss oHG', 'Hoodie Damen', 'Hoodie Weiß S', 'Hoodie mit Aufdruck', 'Weiß', 'S', 39.99, 66, NULL),
	(117, 'ReinerTragegenuss oHG', 'Hoodie Damen', 'Hoodie Weiß M', 'Hoodie mit Aufdruck', 'Weiß', 'M', 39.99, 44, NULL),
	(118, 'ReinerTragegenuss oHG', 'Hoodie Damen', 'Hoodie Weiß L', 'Hoodie mit Aufdruck', 'Weiß', 'L', 39.99, 34, NULL),
	(119, 'ReinerTragegenuss oHG', 'Hoodie Damen', 'Hoodie Weiß XL', 'Hoodie mit Aufdruck', 'Weiß', 'XL', 39.99, 41, NULL),
	(120, 'ReinerTragegenuss oHG', 'Hoodie Damen', 'Hoodie Weiß XXL', 'Hoodie mit Aufdruck', 'Weiß', 'XXL', 39.99, 88, NULL);

-- Exportiere Struktur von Tabelle webshop.produktpreview
CREATE TABLE IF NOT EXISTS `produktpreview` (
  `produkt_preid` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `Preis` float DEFAULT NULL,
  `Beschreibung` text DEFAULT NULL,
  PRIMARY KEY (`produkt_preid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportiere Daten aus Tabelle webshop.produktpreview: ~9 rows (ungefähr)
INSERT INTO `produktpreview` (`produkt_preid`, `Name`, `Preis`, `Beschreibung`) VALUES
	(1, 'Tshirt Blau ', 19.99, NULL),
	(2, 'Tshirt Rot', 19.99, NULL),
	(3, 'Tshirt Weiss', 19.99, NULL),
	(4, 'Tshirt Schwarz', 19.99, NULL),
	(5, 'Tshirt Grau', 19.99, NULL),
	(6, ' Hoodie Blau', 39.99, NULL),
	(7, 'Hoodie Grau', 39.99, NULL),
	(8, 'Hoodie Rot', 39.99, NULL),
	(9, 'Hoodie Weiss', 39.99, NULL),
	(10, 'Hoodie Schwarz', 39.99, NULL);

-- Exportiere Struktur von Tabelle webshop.rechnungsadresse
CREATE TABLE IF NOT EXISTS `rechnungsadresse` (
  `RechnAddr_ID` int(11) NOT NULL,
  `Straße&HsNr` varchar(50) DEFAULT NULL,
  `PLZ` varchar(50) DEFAULT NULL,
  `Ort` varchar(50) DEFAULT NULL,
  `Land` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`RechnAddr_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportiere Daten aus Tabelle webshop.rechnungsadresse: ~0 rows (ungefähr)

-- Exportiere Struktur von Tabelle webshop.zustellungsadresse
CREATE TABLE IF NOT EXISTS `zustellungsadresse` (
  `ZustellAddr_ID` int(11) NOT NULL,
  `Straße & HausNr` varchar(50) DEFAULT NULL,
  `PLZ` varchar(50) DEFAULT NULL,
  `Ort` varchar(50) DEFAULT NULL,
  `Land` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ZustellAddr_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportiere Daten aus Tabelle webshop.zustellungsadresse: ~0 rows (ungefähr)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
