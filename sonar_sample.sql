# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.5.34)
# Datenbank: sonar_sample
# Erstellungsdauer: 2015-12-28 12:59:26 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Export von Tabelle son_company
# ------------------------------------------------------------

DROP TABLE IF EXISTS `son_company`;

CREATE TABLE `son_company` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `son_company` WRITE;
/*!40000 ALTER TABLE `son_company` DISABLE KEYS */;

INSERT INTO `son_company` (`id`, `name`)
VALUES
	(1,'rokito'),
	(2,'redblue media'),
	(3,'smartwebs');

/*!40000 ALTER TABLE `son_company` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle son_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `son_config`;

CREATE TABLE `son_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `config` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `son_config` WRITE;
/*!40000 ALTER TABLE `son_config` DISABLE KEYS */;

INSERT INTO `son_config` (`id`, `name`, `config`)
VALUES
	(1,'login','81dc9bdb52d04dc20036dbd8313ed055'),
	(3,'cronuser','sample@sample.de'),
	(4,'company','rokito');

/*!40000 ALTER TABLE `son_config` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle son_customer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `son_customer`;

CREATE TABLE `son_customer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `son_customer` WRITE;
/*!40000 ALTER TABLE `son_customer` DISABLE KEYS */;

INSERT INTO `son_customer` (`id`, `name`)
VALUES
	(74,'Bäckerei Schulz'),
	(76,'rokito');

/*!40000 ALTER TABLE `son_customer` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle son_detail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `son_detail`;

CREATE TABLE `son_detail` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `section` int(8) DEFAULT NULL,
  `description` varchar(64) DEFAULT NULL,
  `relation` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `son_detail` WRITE;
/*!40000 ALTER TABLE `son_detail` DISABLE KEYS */;

INSERT INTO `son_detail` (`id`, `section`, `description`, `relation`)
VALUES
	(11,1,'Kunde','son_customer'),
	(12,1,'Haupt Domain','url'),
	(13,1,'Domain Aliasse','alias'),
	(14,1,'Seitentyp','son_type'),
	(15,1,'Branche','son_industry'),
	(16,1,'Status','son_state'),
	(21,2,'System','son_system'),
	(22,2,'Hoster','son_hosting'),
	(23,2,'Domain Registrar','son_registrar'),
	(24,2,'Webspace Provider','son_provider'),
	(31,3,'Entwickler','son_developer'),
	(32,3,'Manager','son_manager'),
	(33,3,'Unternehmen','son_company'),
	(34,3,'Go Live','golive'),
	(41,4,'Support','son_support'),
	(42,4,'Notizen','note');

/*!40000 ALTER TABLE `son_detail` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle son_developer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `son_developer`;

CREATE TABLE `son_developer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `son_developer` WRITE;
/*!40000 ALTER TABLE `son_developer` DISABLE KEYS */;

INSERT INTO `son_developer` (`id`, `name`)
VALUES
	(10,'Ronny'),
	(11,'Peter'),
	(12,'Hans'),
	(13,'Max');

/*!40000 ALTER TABLE `son_developer` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle son_hosting
# ------------------------------------------------------------

DROP TABLE IF EXISTS `son_hosting`;

CREATE TABLE `son_hosting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `son_hosting` WRITE;
/*!40000 ALTER TABLE `son_hosting` DISABLE KEYS */;

INSERT INTO `son_hosting` (`id`, `name`)
VALUES
	(1,'rokito'),
	(2,'Kunde selbst'),
	(3,'Drittpartei');

/*!40000 ALTER TABLE `son_hosting` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle son_industry
# ------------------------------------------------------------

DROP TABLE IF EXISTS `son_industry`;

CREATE TABLE `son_industry` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `son_industry` WRITE;
/*!40000 ALTER TABLE `son_industry` DISABLE KEYS */;

INSERT INTO `son_industry` (`id`, `name`)
VALUES
	(2,'Kunst und Unterhaltung'),
	(3,'Automobil'),
	(4,'Schönheit und Fitness'),
	(5,'Bücher und Literatur'),
	(6,'Geschäfts- und Industriebedarf'),
	(7,'Computer und Elektronik'),
	(8,'Finanzwesen'),
	(9,'Lebensmittel und Gastronomie'),
	(10,'Spiele'),
	(11,'Gesundheitswesen'),
	(12,'Hobbys und Freizeit'),
	(13,'Haus und Garten'),
	(14,'Internet und Telekommunikation'),
	(15,'Arbeit und Bildung'),
	(16,'Justiz und Behörden'),
	(17,'Nachrichten'),
	(18,'Onlinecommunitys'),
	(19,'Mensch und Gesellschaft'),
	(20,'Haustiere und Tiere'),
	(21,'Immobilien'),
	(22,'Informationsquellen'),
	(23,'Wissenschaft'),
	(24,'Einkaufen'),
	(25,'Sport'),
	(26,'Reisen'),
	(27,'Sonstiges');

/*!40000 ALTER TABLE `son_industry` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle son_manager
# ------------------------------------------------------------

DROP TABLE IF EXISTS `son_manager`;

CREATE TABLE `son_manager` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `son_manager` WRITE;
/*!40000 ALTER TABLE `son_manager` DISABLE KEYS */;

INSERT INTO `son_manager` (`id`, `name`)
VALUES
	(9,'Manager Name'),
	(10,'Projektmanager'),
	(11,'Max Mustermann');

/*!40000 ALTER TABLE `son_manager` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle son_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `son_menu`;

CREATE TABLE `son_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `table` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `son_menu` WRITE;
/*!40000 ALTER TABLE `son_menu` DISABLE KEYS */;

INSERT INTO `son_menu` (`id`, `name`, `table`)
VALUES
	(1,'Kunde','son_customer'),
	(2,'System','son_system'),
	(3,'Seitentyp','son_type'),
	(4,'Hosting','son_hosting'),
	(5,'Status','son_state'),
	(6,'Entwickler','son_developer'),
	(7,'Unternehmen','son_company'),
	(9,'Registrar','son_registrar'),
	(10,'Provider','son_provider'),
	(12,'Branche','son_industry'),
	(13,'Support','son_support');

/*!40000 ALTER TABLE `son_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle son_ping
# ------------------------------------------------------------

DROP VIEW IF EXISTS `son_ping`;

CREATE TABLE `son_ping` (
   `id` INT(8) UNSIGNED NOT NULL DEFAULT '0',
   `name` VARCHAR(64) NULL DEFAULT ''
) ENGINE=MyISAM;



# Export von Tabelle son_project
# ------------------------------------------------------------

DROP TABLE IF EXISTS `son_project`;

CREATE TABLE `son_project` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `name` varchar(64) DEFAULT '',
  `url` varchar(128) DEFAULT NULL,
  `alias` varchar(512) DEFAULT NULL,
  `son_customer` int(8) DEFAULT NULL,
  `son_system` int(8) DEFAULT NULL,
  `son_type` int(8) DEFAULT NULL,
  `son_industry` int(8) DEFAULT NULL,
  `son_provider` int(8) DEFAULT NULL,
  `son_registrar` int(8) DEFAULT NULL,
  `son_hosting` int(8) DEFAULT NULL,
  `son_state` int(8) DEFAULT NULL,
  `son_developer` int(8) DEFAULT NULL,
  `son_manager` int(8) DEFAULT NULL,
  `son_company` int(8) DEFAULT NULL,
  `son_support` int(8) DEFAULT NULL,
  `golive` varchar(16) DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `son_project` WRITE;
/*!40000 ALTER TABLE `son_project` DISABLE KEYS */;

INSERT INTO `son_project` (`id`, `active`, `name`, `url`, `alias`, `son_customer`, `son_system`, `son_type`, `son_industry`, `son_provider`, `son_registrar`, `son_hosting`, `son_state`, `son_developer`, `son_manager`, `son_company`, `son_support`, `golive`, `note`)
VALUES
	(163,'Y','Bäcker Schulz','www.leckerbaeckerschulz.de','leckerbäckerschulz.de<br>leckerbäckerbuxtehude.de',74,1,3,9,2,1,1,4,10,11,1,6,'31.02.2012','betonung liegt auf den brötchen...'),
	(164,'Y','Rokito','www.rokito.de',NULL,76,18,11,14,5,5,1,3,10,11,1,3,'10/2015',NULL);

/*!40000 ALTER TABLE `son_project` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle son_provider
# ------------------------------------------------------------

DROP TABLE IF EXISTS `son_provider`;

CREATE TABLE `son_provider` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `son_provider` WRITE;
/*!40000 ALTER TABLE `son_provider` DISABLE KEYS */;

INSERT INTO `son_provider` (`id`, `name`)
VALUES
	(1,'1und1'),
	(2,'Domainfactory'),
	(3,'Hostpoint CH'),
	(4,'Strato'),
	(5,'Alfahosting'),
	(6,'United Domains'),
	(7,'Host Europe'),
	(8,'Hetzner'),
	(9,'All Inklusive'),
	(10,'Loswebos'),
	(11,'Godaddy'),
	(12,'Mittwald'),
	(13,'Telekom'),
	(14,'Checkdomain'),
	(15,'SchlundTech'),
	(16,'Denic'),
	(17,'OnSite'),
	(18,'Domaingo');

/*!40000 ALTER TABLE `son_provider` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle son_registrar
# ------------------------------------------------------------

DROP TABLE IF EXISTS `son_registrar`;

CREATE TABLE `son_registrar` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `son_registrar` WRITE;
/*!40000 ALTER TABLE `son_registrar` DISABLE KEYS */;

INSERT INTO `son_registrar` (`id`, `name`)
VALUES
	(1,'1und1'),
	(2,'Domainfactory'),
	(3,'Hostpoint CH'),
	(4,'Strato'),
	(5,'Alfahosting'),
	(6,'United Domains'),
	(7,'Host Europe'),
	(8,'Hetzner'),
	(9,'All Inklusive'),
	(10,'Loswebos'),
	(11,'Godaddy'),
	(12,'Mittwald'),
	(13,'Telekom'),
	(14,'Checkdomain'),
	(15,'SchlundTech'),
	(16,'Denic'),
	(17,'OnSite'),
	(18,'Domaingo');

/*!40000 ALTER TABLE `son_registrar` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle son_section
# ------------------------------------------------------------

DROP TABLE IF EXISTS `son_section`;

CREATE TABLE `son_section` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `son_section` WRITE;
/*!40000 ALTER TABLE `son_section` DISABLE KEYS */;

INSERT INTO `son_section` (`id`, `name`)
VALUES
	(1,'Allgemein'),
	(2,'Technik'),
	(3,'Entwicklung'),
	(4,'Hinweise');

/*!40000 ALTER TABLE `son_section` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle son_state
# ------------------------------------------------------------

DROP TABLE IF EXISTS `son_state`;

CREATE TABLE `son_state` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `son_state` WRITE;
/*!40000 ALTER TABLE `son_state` DISABLE KEYS */;

INSERT INTO `son_state` (`id`, `name`)
VALUES
	(1,'Entwicklung'),
	(2,'Abnahme'),
	(3,'Öffentlich'),
	(4,'Abgeschaltet'),
	(7,'Unklar'),
	(8,'Ehemals');

/*!40000 ALTER TABLE `son_state` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle son_support
# ------------------------------------------------------------

DROP TABLE IF EXISTS `son_support`;

CREATE TABLE `son_support` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `son_support` WRITE;
/*!40000 ALTER TABLE `son_support` DISABLE KEYS */;

INSERT INTO `son_support` (`id`, `name`)
VALUES
	(1,'ohne'),
	(2,'wöchentlich'),
	(3,'monatlich'),
	(4,'vierteljährlich'),
	(5,'halbjährlich'),
	(6,'jährlich'),
	(7,'unregelmäßig'),
	(8,'unbestimmt');

/*!40000 ALTER TABLE `son_support` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle son_system
# ------------------------------------------------------------

DROP TABLE IF EXISTS `son_system`;

CREATE TABLE `son_system` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `son_system` WRITE;
/*!40000 ALTER TABLE `son_system` DISABLE KEYS */;

INSERT INTO `son_system` (`id`, `name`)
VALUES
	(1,'Redaxo'),
	(3,'Typo3'),
	(4,'Typo3 Neos'),
	(5,'Contao'),
	(6,'Presta Shop'),
	(10,'Zend'),
	(12,'Magento'),
	(13,'Shopware'),
	(14,'joomla'),
	(15,'Drupal'),
	(16,'Kirby'),
	(17,'Humhub'),
	(18,'Ohne'),
	(19,'Anchor');

/*!40000 ALTER TABLE `son_system` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle son_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `son_type`;

CREATE TABLE `son_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `son_type` WRITE;
/*!40000 ALTER TABLE `son_type` DISABLE KEYS */;

INSERT INTO `son_type` (`id`, `name`)
VALUES
	(1,'Blog'),
	(3,'Corporate'),
	(4,'Gewinnspiel'),
	(6,'Landingpage'),
	(7,'Microsite'),
	(8,'Spezialsystem'),
	(9,'Applikation'),
	(10,'Shop'),
	(11,'Portfolio');

/*!40000 ALTER TABLE `son_type` ENABLE KEYS */;
UNLOCK TABLES;




# Replace placeholder table for son_ping with correct view syntax
# ------------------------------------------------------------

DROP TABLE `son_ping`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `son_ping`
AS SELECT
   `son_project`.`id` AS `id`,
   `son_project`.`name` AS `name`
FROM `son_project` where ((`son_project`.`son_state` = 3) and (`son_project`.`son_support` <> 1) and (`son_project`.`son_support` <> ''));

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
