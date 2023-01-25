-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server Version:               10.4.27-MariaDB - mariadb.org binary distribution
-- Server Betriebssystem:        Win64
-- HeidiSQL Version:             12.3.0.6589
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
DELETE FROM `bestellung`;

-- Exportiere Struktur von Tabelle webshop.einkaufkorb
CREATE TABLE IF NOT EXISTS `einkaufkorb` (
  `Einkaufskorb_ID` int(11) NOT NULL,
  `Gesamtpreis` int(11) DEFAULT NULL,
  PRIMARY KEY (`Einkaufskorb_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportiere Daten aus Tabelle webshop.einkaufkorb: ~0 rows (ungefähr)
DELETE FROM `einkaufkorb`;

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
DELETE FROM `einkaufskorbinhalt`;

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
DELETE FROM `kunde`;

-- Exportiere Struktur von Tabelle webshop.nutzer
CREATE TABLE IF NOT EXISTS `nutzer` (
  `Nutzer_ID` int(11) NOT NULL,
  `Passwort` varchar(50) DEFAULT NULL,
  `Aktiviert` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Nutzer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportiere Daten aus Tabelle webshop.nutzer: ~0 rows (ungefähr)
DELETE FROM `nutzer`;

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
  PRIMARY KEY (`Produkt_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportiere Daten aus Tabelle webshop.produkt: ~120 rows (ungefähr)
DELETE FROM `produkt`;
INSERT INTO `produkt` (`Produkt_ID`, `Hersteller`, `Kategorie`, `Name`, `Beschreibung`, `Farbe`, `Größe`, `Preis`, `Bestand`) VALUES
	(1, 'DruckIndustry', 'T-Shirt Herren', 'T-Shirt Blau XS', 'T-Shirt mit Aufdruck', 'Blau', 'XS', 19.99, 54),
	(2, 'DruckIndustry', 'T-Shirt Herren', 'T-Shirt Blau S', 'T-Shirt mit Aufdruck', 'Blau', 'S', 19.99, 62),
	(3, 'DruckIndustry', 'T-Shirt Herren', 'T-Shirt Blau M', 'T-Shirt mit Aufdruck', 'Blau', 'M', 19.99, 33),
	(4, 'DruckIndustry', 'T-Shirt Herren', 'T-Shirt Blau L', 'T-Shirt mit Aufdruck', 'Blau', 'L', 19.99, 51),
	(5, 'DruckIndustry', 'T-Shirt Herren', 'T-Shirt Blau XL', 'T-Shirt mit Aufdruck', 'Blau', 'XL', 19.99, 44),
	(6, 'DruckIndustry', 'T-Shirt Herren', 'T-Shirt Blau XXL', 'T-Shirt mit Aufdruck', 'Blau', 'XXL', 19.99, 38),
	(7, 'Druck und Geschmeidig SE', 'T-Shirt Herren', 'T-Shirt Grau XS', 'T-Shirt mit Aufdruck', 'Grau', 'XS', 19.99, 45),
	(8, 'Druck und Geschmeidig SE', 'T-Shirt Herren', 'T-Shirt Grau S', 'T-Shirt mit Aufdruck', 'Grau', 'S', 19.99, 55),
	(9, 'Druck und Geschmeidig SE', 'T-Shirt Herren', 'T-Shirt Grau M', 'T-Shirt mit Aufdruck', 'Grau', 'M', 19.99, 69),
	(10, 'Druck und Geschmeidig SE', 'T-Shirt Herren', 'T-Shirt Grau L', 'T-Shirt mit Aufdruck', 'Grau', 'L', 19.99, 25),
	(11, 'Druck und Geschmeidig SE', 'T-Shirt Herren', 'T-Shirt Grau XL', 'T-Shirt mit Aufdruck', 'Grau', 'XL', 19.99, 41),
	(12, 'Druck und Geschmeidig SE', 'T-Shirt Herren', 'T-Shirt Grau XXL', 'T-Shirt mit Aufdruck', 'Grau', 'XXL', 19.99, 32),
	(13, 'DruckIndustry', 'T-Shirt Herren', 'T-Shirt Rot XS', 'T-Shirt mit Aufdruck', 'Rot', 'XS', 19.99, 42),
	(14, 'DruckIndustry', 'T-Shirt Herren', 'T-Shirt Rot S', 'T-Shirt mit Aufdruck', 'Rot', 'S', 19.99, 56),
	(15, 'DruckIndustry', 'T-Shirt Herren', 'T-Shirt Rot M', 'T-Shirt mit Aufdruck', 'Rot', 'M', 19.99, 70),
	(16, 'DruckIndustry', 'T-Shirt Herren', 'T-Shirt Rot L', 'T-Shirt mit Aufdruck', 'Rot', 'L', 19.99, 24),
	(17, 'DruckIndustry', 'T-Shirt Herren', 'T-Shirt Rot XL', 'T-Shirt mit Aufdruck', 'Rot', 'XL', 19.99, 40),
	(18, 'DruckIndustry', 'T-Shirt Herren', 'T-Shirt Rot XXL', 'T-Shirt mit Aufdruck', 'Rot', 'XXL', 19.99, 30),
	(19, 'AufdruckService GmbH', 'T-Shirt Herren', 'T-Shirt Weiß XS', 'T-Shirt mit Aufdruck', 'Weiß', 'XS', 19.99, 27),
	(20, 'AufdruckService GmbH', 'T-Shirt Herren', 'T-Shirt Weiß S', 'T-Shirt mit Aufdruck', 'Weiß', 'S', 19.99, 66),
	(21, 'AufdruckService GmbH', 'T-Shirt Herren', 'T-Shirt Weiß M', 'T-Shirt mit Aufdruck', 'Weiß', 'M', 19.99, 12),
	(22, 'AufdruckService GmbH', 'T-Shirt Herren', 'T-Shirt Weiß L', 'T-Shirt mit Aufdruck', 'Weiß', 'L', 19.99, 46),
	(23, 'AufdruckService GmbH', 'T-Shirt Herren', 'T-Shirt Weiß XL', 'T-Shirt mit Aufdruck', 'Weiß', 'XL', 19.99, 83),
	(24, 'AufdruckService GmbH', 'T-Shirt Herren', 'T-Shirt Weiß XXL', 'T-Shirt mit Aufdruck', 'Weiß', 'XXL', 19.99, 72),
	(25, 'AufdruckService GmbH', 'T-Shirt Herren', 'T-Shirt Schwarz XS', 'T-Shirt mit Aufdruck', 'Schwarz', 'XS', 19.99, 88),
	(26, 'AufdruckService GmbH', 'T-Shirt Herren', 'T-Shirt Schwarz S', 'T-Shirt mit Aufdruck', 'Schwarz', 'S', 19.99, 49),
	(27, 'AufdruckService GmbH', 'T-Shirt Herren', 'T-Shirt Schwarz M', 'T-Shirt mit Aufdruck', 'Schwarz', 'M', 19.99, 75),
	(28, 'AufdruckService GmbH', 'T-Shirt Herren', 'T-Shirt Schwarz L', 'T-Shirt mit Aufdruck', 'Schwarz', 'L', 19.99, 47),
	(29, 'AufdruckService GmbH', 'T-Shirt Herren', 'T-Shirt Schwarz XL', 'T-Shirt mit Aufdruck', 'Schwarz', 'XL', 19.99, 22),
	(30, 'AufdruckService GmbH', 'T-Shirt Herren', 'T-Shirt Schwarz XXL', 'T-Shirt mit Aufdruck', 'Schwarz', 'XXL', 19.99, 26),
	(31, 'HOODie ForEVER UG', 'Hoodie Herren', 'Hoodie Grau XS', 'Hoodie mit Aufdruck', 'Grau', 'XS', 39.99, 55),
	(32, 'HOODie ForEVER UG', 'Hoodie Herren', 'Hoodie Grau S', 'Hoodie mit Aufdruck', 'Grau', 'S', 39.99, 55),
	(33, 'HOODie ForEVER UG', 'Hoodie Herren', 'Hoodie Grau M', 'Hoodie mit Aufdruck', 'Grau', 'M', 39.99, 63),
	(34, 'HOODie ForEVER UG', 'Hoodie Herren', 'Hoodie Grau L', 'Hoodie mit Aufdruck', 'Grau', 'L', 39.99, 85),
	(35, 'HOODie ForEVER UG', 'Hoodie Herren', 'Hoodie Grau XL', 'Hoodie mit Aufdruck', 'Grau', 'XL', 39.99, 55),
	(36, 'HOODie ForEVER UG', 'Hoodie Herren', 'Hoodie Grau XXL', 'Hoodie mit Aufdruck', 'Grau', 'XXL', 39.99, 34),
	(37, 'HOODie ForEVER UG', 'Hoodie Herren', 'Hoodie Blau XS', 'Hoodie mit Aufdruck', 'Blau', 'XS', 39.99, 77),
	(38, 'HOODie ForEVER UG', 'Hoodie Herren', 'Hoodie Blau S', 'Hoodie mit Aufdruck', 'Blau', 'S', 39.99, 56),
	(39, 'HOODie ForEVER UG', 'Hoodie Herren', 'Hoodie Blau M', 'Hoodie mit Aufdruck', 'Blau', 'M', 39.99, 76),
	(40, 'HOODie ForEVER UG', 'Hoodie Herren', 'Hoodie Blau L', 'Hoodie mit Aufdruck', 'Blau', 'L', 39.99, 25),
	(41, 'HOODie ForEVER UG', 'Hoodie Herren', 'Hoodie Blau XL', 'Hoodie mit Aufdruck', 'Blau', 'XL', 39.99, 41),
	(42, 'HOODie ForEVER UG', 'Hoodie Herren', 'Hoodie Blau XXL', 'Hoodie mit Aufdruck', 'Blau', 'XXL', 39.99, 32),
	(43, 'Druck und Geschmeidig SE', 'Hoodie Herren', 'Hoodie Rot XS', 'Hoodie mit Aufdruck', 'Rot', 'XS', 39.99, 45),
	(44, 'Druck und Geschmeidig SE', 'Hoodie Herren', 'Hoodie Rot S', 'Hoodie mit Aufdruck', 'Rot', 'S', 39.99, 55),
	(45, 'Druck und Geschmeidig SE', 'Hoodie Herren', 'Hoodie Rot M', 'Hoodie mit Aufdruck', 'Rot', 'M', 39.99, 34),
	(46, 'Druck und Geschmeidig SE', 'Hoodie Herren', 'Hoodie Rot L', 'Hoodie mit Aufdruck', 'Rot', 'L', 39.99, 22),
	(47, 'Druck und Geschmeidig SE', 'Hoodie Herren', 'Hoodie Rot XL', 'Hoodie mit Aufdruck', 'Rot', 'XL', 39.99, 11),
	(48, 'Druck und Geschmeidig SE', 'Hoodie Herren', 'Hoodie Rot XXL', 'Hoodie mit Aufdruck', 'Rot', 'XXL', 39.99, 3),
	(49, 'ReinerTragegenuss oHG', 'Hoodie Herren', 'Hoodie Schwarz XS', 'Hoodie mit Aufdruck', 'Schwarz', 'XS', 39.99, 45),
	(50, 'ReinerTragegenuss oHG', 'Hoodie Herren', 'Hoodie Schwarz S', 'Hoodie mit Aufdruck', 'Schwarz', 'S', 39.99, 2),
	(51, 'ReinerTragegenuss oHG', 'Hoodie Herren', 'Hoodie Schwarz M', 'Hoodie mit Aufdruck', 'Schwarz', 'M', 39.99, 35),
	(52, 'ReinerTragegenuss oHG', 'Hoodie Herren', 'Hoodie Schwarz L', 'Hoodie mit Aufdruck', 'Schwarz', 'L', 39.99, 55),
	(53, 'ReinerTragegenuss oHG', 'Hoodie Herren', 'Hoodie Schwarz XL', 'Hoodie mit Aufdruck', 'Schwarz', 'XL', 39.99, 74),
	(54, 'ReinerTragegenuss oHG', 'Hoodie Herren', 'Hoodie Schwarz XXL', 'Hoodie mit Aufdruck', 'Schwarz', 'XXL', 39.99, 55),
	(55, 'ReinerTragegenuss oHG', 'Hoodie Herren', 'Hoodie Weiß XS', 'Hoodie mit Aufdruck', 'Weiß', 'XS', 39.99, 45),
	(56, 'ReinerTragegenuss oHG', 'Hoodie Herren', 'Hoodie Weiß S', 'Hoodie mit Aufdruck', 'Weiß', 'S', 39.99, 66),
	(57, 'ReinerTragegenuss oHG', 'Hoodie Herren', 'Hoodie Weiß M', 'Hoodie mit Aufdruck', 'Weiß', 'M', 39.99, 44),
	(58, 'ReinerTragegenuss oHG', 'Hoodie Herren', 'Hoodie Weiß L', 'Hoodie mit Aufdruck', 'Weiß', 'L', 39.99, 34),
	(59, 'ReinerTragegenuss oHG', 'Hoodie Herren', 'Hoodie Weiß XL', 'Hoodie mit Aufdruck', 'Weiß', 'XL', 39.99, 41),
	(60, 'ReinerTragegenuss oHG', 'Hoodie Herren', 'Hoodie Weiß XXL', 'Hoodie mit Aufdruck', 'Weiß', 'XXL', 39.99, 88),
	(61, 'DruckIndustry', 'T-Shirt Damen', 'T-Shirt Blau XS', 'T-Shirt mit Aufdruck', 'Blau', 'XS', 19.99, 54),
	(62, 'DruckIndustry', 'T-Shirt Damen', 'T-Shirt Blau S', 'T-Shirt mit Aufdruck', 'Blau', 'S', 19.99, 62),
	(63, 'DruckIndustry', 'T-Shirt Damen', 'T-Shirt Blau M', 'T-Shirt mit Aufdruck', 'Blau', 'M', 19.99, 33),
	(64, 'DruckIndustry', 'T-Shirt Damen', 'T-Shirt Blau L', 'T-Shirt mit Aufdruck', 'Blau', 'L', 19.99, 51),
	(65, 'DruckIndustry', 'T-Shirt Damen', 'T-Shirt Blau XL', 'T-Shirt mit Aufdruck', 'Blau', 'XL', 19.99, 44),
	(66, 'DruckIndustry', 'T-Shirt Damen', 'T-Shirt Blau XXL', 'T-Shirt mit Aufdruck', 'Blau', 'XXL', 19.99, 38),
	(67, 'Druck und Geschmeidig SE', 'T-Shirt Damen', 'T-Shirt Grau XS', 'T-Shirt mit Aufdruck', 'Grau', 'XS', 19.99, 45),
	(68, 'Druck und Geschmeidig SE', 'T-Shirt Damen', 'T-Shirt Grau S', 'T-Shirt mit Aufdruck', 'Grau', 'S', 19.99, 55),
	(69, 'Druck und Geschmeidig SE', 'T-Shirt Damen', 'T-Shirt Grau M', 'T-Shirt mit Aufdruck', 'Grau', 'M', 19.99, 69),
	(70, 'Druck und Geschmeidig SE', 'T-Shirt Damen', 'T-Shirt Grau L', 'T-Shirt mit Aufdruck', 'Grau', 'L', 19.99, 25),
	(71, 'Druck und Geschmeidig SE', 'T-Shirt Damen', 'T-Shirt Grau XL', 'T-Shirt mit Aufdruck', 'Grau', 'XL', 19.99, 41),
	(72, 'Druck und Geschmeidig SE', 'T-Shirt Damen', 'T-Shirt Grau XXL', 'T-Shirt mit Aufdruck', 'Grau', 'XXL', 19.99, 32),
	(73, 'DruckIndustry', 'T-Shirt Damen', 'T-Shirt Rot XS', 'T-Shirt mit Aufdruck', 'Rot', 'XS', 19.99, 42),
	(74, 'DruckIndustry', 'T-Shirt Damen', 'T-Shirt Rot S', 'T-Shirt mit Aufdruck', 'Rot', 'S', 19.99, 56),
	(75, 'DruckIndustry', 'T-Shirt Damen', 'T-Shirt Rot M', 'T-Shirt mit Aufdruck', 'Rot', 'M', 19.99, 70),
	(76, 'DruckIndustry', 'T-Shirt Damen', 'T-Shirt Rot L', 'T-Shirt mit Aufdruck', 'Rot', 'L', 19.99, 24),
	(77, 'DruckIndustry', 'T-Shirt Damen', 'T-Shirt Rot XL', 'T-Shirt mit Aufdruck', 'Rot', 'XL', 19.99, 40),
	(78, 'DruckIndustry', 'T-Shirt Damen', 'T-Shirt Rot XXL', 'T-Shirt mit Aufdruck', 'Rot', 'XXL', 19.99, 30),
	(79, 'AufdruckService GmbH', 'T-Shirt Damen', 'T-Shirt Weiß XS', 'T-Shirt mit Aufdruck', 'Weiß', 'XS', 19.99, 27),
	(80, 'AufdruckService GmbH', 'T-Shirt Damen', 'T-Shirt Weiß S', 'T-Shirt mit Aufdruck', 'Weiß', 'S', 19.99, 66),
	(81, 'AufdruckService GmbH', 'T-Shirt Damen', 'T-Shirt Weiß M', 'T-Shirt mit Aufdruck', 'Weiß', 'M', 19.99, 12),
	(82, 'AufdruckService GmbH', 'T-Shirt Damen', 'T-Shirt Weiß L', 'T-Shirt mit Aufdruck', 'Weiß', 'L', 19.99, 46),
	(83, 'AufdruckService GmbH', 'T-Shirt Damen', 'T-Shirt Weiß XL', 'T-Shirt mit Aufdruck', 'Weiß', 'XL', 19.99, 83),
	(84, 'AufdruckService GmbH', 'T-Shirt Damen', 'T-Shirt Weiß XXL', 'T-Shirt mit Aufdruck', 'Weiß', 'XXL', 19.99, 72),
	(85, 'AufdruckService GmbH', 'T-Shirt Damen', 'T-Shirt Schwarz XS', 'T-Shirt mit Aufdruck', 'Schwarz', 'XS', 19.99, 88),
	(86, 'AufdruckService GmbH', 'T-Shirt Damen', 'T-Shirt Schwarz S', 'T-Shirt mit Aufdruck', 'Schwarz', 'S', 19.99, 49),
	(87, 'AufdruckService GmbH', 'T-Shirt Damen', 'T-Shirt Schwarz M', 'T-Shirt mit Aufdruck', 'Schwarz', 'M', 19.99, 75),
	(88, 'AufdruckService GmbH', 'T-Shirt Damen', 'T-Shirt Schwarz L', 'T-Shirt mit Aufdruck', 'Schwarz', 'L', 19.99, 47),
	(89, 'AufdruckService GmbH', 'T-Shirt Damen', 'T-Shirt Schwarz XL', 'T-Shirt mit Aufdruck', 'Schwarz', 'XL', 19.99, 22),
	(90, 'AufdruckService GmbH', 'T-Shirt Damen', 'T-Shirt Schwarz XXL', 'T-Shirt mit Aufdruck', 'Schwarz', 'XXL', 19.99, 26),
	(91, 'HOODie ForEVER UG', 'Hoodie Damen', 'Hoodie Grau XS', 'Hoodie mit Aufdruck', 'Grau', 'XS', 39.99, 55),
	(92, 'HOODie ForEVER UG', 'Hoodie Damen', 'Hoodie Grau S', 'Hoodie mit Aufdruck', 'Grau', 'S', 39.99, 55),
	(93, 'HOODie ForEVER UG', 'Hoodie Damen', 'Hoodie Grau M', 'Hoodie mit Aufdruck', 'Grau', 'M', 39.99, 63),
	(94, 'HOODie ForEVER UG', 'Hoodie Damen', 'Hoodie Grau L', 'Hoodie mit Aufdruck', 'Grau', 'L', 39.99, 85),
	(95, 'HOODie ForEVER UG', 'Hoodie Damen', 'Hoodie Grau XL', 'Hoodie mit Aufdruck', 'Grau', 'XL', 39.99, 55),
	(96, 'HOODie ForEVER UG', 'Hoodie Damen', 'Hoodie Grau XXL', 'Hoodie mit Aufdruck', 'Grau', 'XXL', 39.99, 34),
	(97, 'HOODie ForEVER UG', 'Hoodie Damen', 'Hoodie Blau XS', 'Hoodie mit Aufdruck', 'Blau', 'XS', 39.99, 77),
	(98, 'HOODie ForEVER UG', 'Hoodie Damen', 'Hoodie Blau S', 'Hoodie mit Aufdruck', 'Blau', 'S', 39.99, 56),
	(99, 'HOODie ForEVER UG', 'Hoodie Damen', 'Hoodie Blau M', 'Hoodie mit Aufdruck', 'Blau', 'M', 39.99, 76),
	(100, 'HOODie ForEVER UG', 'Hoodie Damen', 'Hoodie Blau L', 'Hoodie mit Aufdruck', 'Blau', 'L', 39.99, 25),
	(101, 'HOODie ForEVER UG', 'Hoodie Damen', 'Hoodie Blau XL', 'Hoodie mit Aufdruck', 'Blau', 'XL', 39.99, 41),
	(102, 'HOODie ForEVER UG', 'Hoodie Damen', 'Hoodie Blau XXL', 'Hoodie mit Aufdruck', 'Blau', 'XXL', 39.99, 32),
	(103, 'Druck und Geschmeidig SE', 'Hoodie Damen', 'Hoodie Rot XS', 'Hoodie mit Aufdruck', 'Rot', 'XS', 39.99, 45),
	(104, 'Druck und Geschmeidig SE', 'Hoodie Damen', 'Hoodie Rot S', 'Hoodie mit Aufdruck', 'Rot', 'S', 39.99, 55),
	(105, 'Druck und Geschmeidig SE', 'Hoodie Damen', 'Hoodie Rot M', 'Hoodie mit Aufdruck', 'Rot', 'M', 39.99, 34),
	(106, 'Druck und Geschmeidig SE', 'Hoodie Damen', 'Hoodie Rot L', 'Hoodie mit Aufdruck', 'Rot', 'L', 39.99, 22),
	(107, 'Druck und Geschmeidig SE', 'Hoodie Damen', 'Hoodie Rot XL', 'Hoodie mit Aufdruck', 'Rot', 'XL', 39.99, 11),
	(108, 'Druck und Geschmeidig SE', 'Hoodie Damen', 'Hoodie Rot XXL', 'Hoodie mit Aufdruck', 'Rot', 'XXL', 39.99, 3),
	(109, 'ReinerTragegenuss oHG', 'Hoodie Damen', 'Hoodie Schwarz XS', 'Hoodie mit Aufdruck', 'Schwarz', 'XS', 39.99, 45),
	(110, 'ReinerTragegenuss oHG', 'Hoodie Damen', 'Hoodie Schwarz S', 'Hoodie mit Aufdruck', 'Schwarz', 'S', 39.99, 2),
	(111, 'ReinerTragegenuss oHG', 'Hoodie Damen', 'Hoodie Schwarz M', 'Hoodie mit Aufdruck', 'Schwarz', 'M', 39.99, 35),
	(112, 'ReinerTragegenuss oHG', 'Hoodie Damen', 'Hoodie Schwarz L', 'Hoodie mit Aufdruck', 'Schwarz', 'L', 39.99, 55),
	(113, 'ReinerTragegenuss oHG', 'Hoodie Damen', 'Hoodie Schwarz XL', 'Hoodie mit Aufdruck', 'Schwarz', 'XL', 39.99, 74),
	(114, 'ReinerTragegenuss oHG', 'Hoodie Damen', 'Hoodie Schwarz XXL', 'Hoodie mit Aufdruck', 'Schwarz', 'XXL', 39.99, 55),
	(115, 'ReinerTragegenuss oHG', 'Hoodie Damen', 'Hoodie Weiß XS', 'Hoodie mit Aufdruck', 'Weiß', 'XS', 39.99, 45),
	(116, 'ReinerTragegenuss oHG', 'Hoodie Damen', 'Hoodie Weiß S', 'Hoodie mit Aufdruck', 'Weiß', 'S', 39.99, 66),
	(117, 'ReinerTragegenuss oHG', 'Hoodie Damen', 'Hoodie Weiß M', 'Hoodie mit Aufdruck', 'Weiß', 'M', 39.99, 44),
	(118, 'ReinerTragegenuss oHG', 'Hoodie Damen', 'Hoodie Weiß L', 'Hoodie mit Aufdruck', 'Weiß', 'L', 39.99, 34),
	(119, 'ReinerTragegenuss oHG', 'Hoodie Damen', 'Hoodie Weiß XL', 'Hoodie mit Aufdruck', 'Weiß', 'XL', 39.99, 41),
	(120, 'ReinerTragegenuss oHG', 'Hoodie Damen', 'Hoodie Weiß XXL', 'Hoodie mit Aufdruck', 'Weiß', 'XXL', 39.99, 88);

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
DELETE FROM `rechnungsadresse`;

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
DELETE FROM `zustellungsadresse`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
