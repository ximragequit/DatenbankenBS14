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

-- Daten Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle webshop.einkaufkorb
CREATE TABLE IF NOT EXISTS `einkaufkorb` (
  `Einkaufskorb_ID` int(11) NOT NULL,
  `Gesamtpreis` int(11) DEFAULT NULL,
  PRIMARY KEY (`Einkaufskorb_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Daten Export vom Benutzer nicht ausgewählt

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

-- Daten Export vom Benutzer nicht ausgewählt

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
  CONSTRAINT `RechnAddr_ID` FOREIGN KEY (`RechnAddr_ID`) REFERENCES `rechnungsadresse` (`RechnAddr_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ZustellAddr_ID` FOREIGN KEY (`ZustellAddr_ID`) REFERENCES `zustellungsadresse` (`ZustellAddr_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Daten Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle webshop.nutzer
CREATE TABLE IF NOT EXISTS `nutzer` (
  `Nutzer_ID` int(11) NOT NULL,
  `Passwort` varchar(50) DEFAULT NULL,
  `Aktiviert` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Nutzer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Daten Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle webshop.produkt
CREATE TABLE IF NOT EXISTS `produkt` (
  `Produkt_ID` int(11) NOT NULL,
  `Kategorie` int(11) DEFAULT NULL,
  `Beschreibung` int(11) DEFAULT NULL,
  `Hersteller` int(11) DEFAULT NULL,
  `Name` int(11) DEFAULT NULL,
  `Preis` int(11) DEFAULT NULL,
  `Bestand` int(11) DEFAULT NULL,
  PRIMARY KEY (`Produkt_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Daten Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle webshop.rechnungsadresse
CREATE TABLE IF NOT EXISTS `rechnungsadresse` (
  `RechnAddr_ID` int(11) NOT NULL,
  `Straße&HsNr` varchar(50) DEFAULT NULL,
  `PLZ` varchar(50) DEFAULT NULL,
  `Ort` varchar(50) DEFAULT NULL,
  `Land` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`RechnAddr_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Daten Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle webshop.zustellungsadresse
CREATE TABLE IF NOT EXISTS `zustellungsadresse` (
  `ZustellAddr_ID` int(11) NOT NULL,
  `Straße & HausNr` varchar(50) DEFAULT NULL,
  `PLZ` varchar(50) DEFAULT NULL,
  `Ort` varchar(50) DEFAULT NULL,
  `Land` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ZustellAddr_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Daten Export vom Benutzer nicht ausgewählt

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
