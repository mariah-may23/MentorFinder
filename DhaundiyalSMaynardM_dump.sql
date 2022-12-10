CREATE DATABASE  IF NOT EXISTS `mentorfinder` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mentorfinder`;
-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: localhost    Database: mentorfinder
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `country_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'Afghanistan'),(2,'Albania'),(3,'Algeria'),(4,'Andorra'),(5,'Angola'),(6,'Antigua and Barbuda'),(7,'Argentina'),(8,'Armenia'),(9,'Austria'),(10,'Azerbaijan'),(11,'Bahrain'),(12,'Bangladesh'),(13,'Barbados'),(14,'Belarus'),(15,'Belgium'),(16,'Belize'),(17,'Benin'),(18,'Bhutan'),(19,'Bolivia'),(20,'Bosnia and Herzegovina'),(21,'Botswana'),(22,'Brazil'),(23,'Brunei'),(24,'Bulgaria'),(25,'Burkina Faso'),(26,'Burundi'),(27,'Cabo Verde'),(28,'Cambodia'),(29,'Cameroon'),(30,'Canada'),(31,'Central African Republic'),(32,'Chad'),(33,'Channel Islands'),(34,'Chile'),(35,'China'),(36,'Colombia'),(37,'Comoros'),(38,'Congo'),(39,'Costa Rica'),(40,'Côte d\'Ivoire'),(41,'Croatia'),(42,'Cuba'),(43,'Cyprus'),(44,'Czech Republic'),(45,'Denmark'),(46,'Dominica'),(47,'Djibouti'),(48,'Dominican Republic'),(49,'DR Congo'),(50,'Ecuador'),(51,'Egypt'),(52,'El Salvador'),(53,'Equatorial Guinea'),(54,'Eritrea'),(55,'Estonia'),(56,'Eswatini'),(57,'Ethiopia'),(58,'Faeroe Islands'),(59,'Finland'),(60,'France'),(61,'French Guiana'),(62,'Gabon'),(63,'Gambia'),(64,'Georgia'),(65,'Germany'),(66,'Ghana'),(67,'Greece'),(68,'Gibraltar'),(69,'Grenada'),(70,'Guatemala'),(71,'Guinea'),(72,'Guinea-Bissau'),(73,'Guyana'),(74,'Honduras'),(75,'Holy See'),(76,'Hong Kong'),(77,'Hungary'),(78,'Iceland'),(79,'India'),(80,'Indonesia'),(81,'Iran'),(82,'Iraq'),(83,'Ireland'),(84,'Isle of Man'),(85,'Israel'),(86,'Italy'),(87,'Japan'),(88,'Jamaica'),(89,'Jordan'),(90,'Kazakhstan'),(91,'Kenya'),(92,'Kuwait'),(93,'Kyrgyzstan'),(94,'Latvia'),(95,'Laos'),(96,'Lebanon'),(97,'Lesotho'),(98,'Liberia'),(99,'Libya'),(100,'Liechtenstein'),(101,'Lithuania'),(102,'Luxembourg'),(103,'Macao'),(104,'Madagascar'),(105,'Malawi'),(106,'Malaysia'),(107,'Maldives'),(108,'Mali'),(109,'Malta'),(110,'Mauritania'),(111,'Mauritius'),(112,'Mayotte'),(113,'Mexico'),(114,'Moldova'),(115,'Monaco'),(116,'Mongolia'),(117,'Montenegro'),(118,'Morocco'),(119,'Mozambique'),(120,'Myanmar'),(121,'Namibia'),(122,'Nepal'),(123,'Netherlands'),(124,'Nicaragua'),(125,'Niger'),(126,'Nigeria'),(127,'North Korea'),(128,'Norway'),(129,'North Macedonia'),(130,'Oman'),(131,'Pakistan'),(132,'Panama'),(133,'Paraguay'),(134,'Peru'),(135,'Philippines'),(136,'Poland'),(137,'Portugal'),(138,'Qatar'),(139,'Réunion'),(140,'Romania'),(141,'Russia'),(142,'Rwanda'),(143,'Saint Helena'),(144,'Saint Lucia'),(145,'Saint Kitts and Nevis'),(146,'Saint Vincent and the Grenadines'),(147,'San Marino'),(148,'Senegal'),(149,'Serbia'),(150,'Sao Tome & Principe'),(151,'Saudi Arabia'),(152,'Seychelles'),(153,'Singapore'),(154,'Slovakia'),(155,'Somalia'),(156,'Slovenia'),(157,'Spain'),(158,'Sierra Leone'),(159,'South Africa'),(160,'South Korea'),(161,'South Sudan'),(162,'Sri Lanka'),(163,'Sudan'),(164,'Suriname'),(165,'Sweden'),(166,'Switzerland'),(167,'Syria'),(168,'Taiwan'),(169,'Tajikistan'),(170,'State of Palestine'),(171,'Tanzania'),(172,'Thailand'),(173,'The Bahamas'),(174,'Timor-Leste'),(175,'Togo'),(176,'Trinidad and Tobago'),(177,'Tunisia'),(178,'Turkey'),(179,'Turkmenistan'),(180,'Uganda'),(181,'Ukraine'),(182,'Uruguay'),(183,'United Arab Emirates'),(184,'United Kingdom'),(185,'United States'),(186,'Uzbekistan'),(187,'Venezuela'),(188,'Vietnam'),(189,'Yemen'),(190,'Western Sahara'),(191,'Zambia'),(192,'Zimbabwe');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degree`
--

DROP TABLE IF EXISTS `degree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `degree` (
  `degree_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `level` varchar(80) NOT NULL,
  PRIMARY KEY (`degree_id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degree`
--

LOCK TABLES `degree` WRITE;
/*!40000 ALTER TABLE `degree` DISABLE KEYS */;
INSERT INTO `degree` VALUES (1,'Animal Sciences','bachelors'),(2,'Animal Sciences','masters'),(3,'Animal Sciences','doctorate'),(4,'Astronomy','bachelors'),(5,'Astronomy','masters'),(6,'Astronomy','doctorate'),(7,'Biochemistry','bachelors'),(8,'Biochemistry','masters'),(9,'Biochemistry','doctorate'),(10,'Biology','bachelors'),(11,'Biology','masters'),(12,'Biology','doctorate'),(13,'Chemistry','bachelors'),(14,'Chemistry','masters'),(15,'Chemistry','doctorate'),(16,'Ecology','bachelors'),(17,'Ecology','masters'),(18,'Ecology','doctorate'),(19,'Environmental Science','bachelors'),(20,'Environmental Science','masters'),(21,'Environmental Science','doctorate'),(22,'Physics','bachelors'),(23,'Physics','masters'),(24,'Physics','doctorate'),(25,'Zoology','bachelors'),(26,'Zoology','masters'),(27,'Zoology','doctorate'),(28,'Mathematics','bachelors'),(29,'Mathematics','masters'),(30,'Mathematics','doctorate'),(31,'Computer Science','bachelors'),(32,'Computer Science','masters'),(33,'Computer Science','doctorate'),(34,'Dentistry','bachelors'),(35,'Dentistry','masters'),(36,'Dentistry','doctorate'),(37,'Nursing','bachelors'),(38,'Nursing','masters'),(39,'Nursing','doctorate'),(40,'Aerospace Engineering','bachelors'),(41,'Aerospace Engineering','masters'),(42,'Aerospace Engineering','doctorate'),(43,'Bioengineering','bachelors'),(44,'Bioengineering','masters'),(45,'Bioengineering','doctorate'),(46,'Architecture','bachelors'),(47,'Architecture','masters'),(48,'Architecture','doctorate'),(49,'Biomedical Engineering','bachelors'),(50,'Biomedical Engineering','masters'),(51,'Biomedical Engineering','doctorate'),(52,'Chemical Engineering','bachelors'),(53,'Chemical Engineering','masters'),(54,'Chemical Engineering','doctorate'),(55,'Civil Engineering','bachelors'),(56,'Civil Engineering','masters'),(57,'Civil Engineering','doctorate'),(58,'Aerospace Engineering','bachelors'),(59,'Aerospace Engineering','masters'),(60,'Aerospace Engineering','doctorate'),(61,'Bioengineering','bachelors'),(62,'Bioengineering','masters'),(63,'Bioengineering','doctorate'),(64,'Computer Engineering','bachelors'),(65,'Computer Engineering','masters'),(66,'Computer Engineering','doctorate'),(67,'Electrical Engineering','bachelors'),(68,'Electrical Engineering','masters'),(69,'Electrical Engineering','doctorate'),(70,'Environmental Engineering','bachelors'),(71,'Environmental Engineering','masters'),(72,'Environmental Engineering','doctorate'),(73,'Industrial Engineering','bachelors'),(74,'Industrial Engineering','masters'),(75,'Industrial Engineering','doctorate'),(76,'Mechanical Engineering','bachelors'),(77,'Mechanical Engineering','masters'),(78,'Mechanical Engineering','doctorate'),(79,'Geology','bachelors'),(80,'Geology','masters'),(81,'Geology','doctorate'),(82,'Health','bachelors'),(83,'Health','masters'),(84,'Health','doctorate'),(85,'Pharmacy','bachelors'),(86,'Pharmacy','masters'),(87,'Pharmacy','doctorate'),(88,'Health','bachelors'),(89,'Health','masters'),(90,'Health','doctorate');
/*!40000 ALTER TABLE `degree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ethnicity`
--

DROP TABLE IF EXISTS `ethnicity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ethnicity` (
  `ethnicity_id` int NOT NULL AUTO_INCREMENT,
  `ethnicity_type` varchar(80) NOT NULL,
  PRIMARY KEY (`ethnicity_id`),
  UNIQUE KEY `ethnicity_type` (`ethnicity_type`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ethnicity`
--

LOCK TABLES `ethnicity` WRITE;
/*!40000 ALTER TABLE `ethnicity` DISABLE KEYS */;
INSERT INTO `ethnicity` VALUES (4,'American Indian and Alaska Native'),(5,'Asian'),(3,'Black or African American'),(1,'Hispanic'),(7,'Multiracial'),(6,'Native Hawaiian and Other Pacific Islander'),(2,'White');
/*!40000 ALTER TABLE `ethnicity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mentee`
--

DROP TABLE IF EXISTS `mentee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mentee` (
  `user_id` varchar(80) NOT NULL,
  `first_name` varchar(80) NOT NULL,
  `last_name` varchar(80) NOT NULL,
  `age` int NOT NULL,
  `country_id` int NOT NULL,
  `email` varchar(80) NOT NULL,
  `linkedIn` varchar(80) NOT NULL,
  `field_id` int NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `mentee_fk_country` (`country_id`),
  KEY `mentee_fk_stem_field` (`field_id`),
  CONSTRAINT `mentee_fk_country` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mentee_fk_stem_field` FOREIGN KEY (`field_id`) REFERENCES `stem_field` (`field_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mentee`
--

LOCK TABLES `mentee` WRITE;
/*!40000 ALTER TABLE `mentee` DISABLE KEYS */;
INSERT INTO `mentee` VALUES ('AnnAl!','Aleena','Ann',27,25,'abc@gmail.com','https://www.linkedin.com/in/hgn',2),('brownAp90/!','Apie','Brown',25,185,'abc@gmail.com','https://www.linkedin.com/in/hgn',3),('ceceMo001','Mo','Cece',18,101,'abc@gmail.com','https://www.linkedin.com/in/hgn',1),('doedoe33','John','Doe',29,88,'abc@gmail.com','https://www.linkedin.com/in/hgn',4),('escoIntoShri3!','Pedro','Escobar',19,29,'abc@gmail.com','https://www.linkedin.com/in/hgn',1),('grace431!','Raqucel','Gracia',19,65,'abc@gmail.com','https://www.linkedin.com/in/hgn',4),('harshie23','Harsh','Raghu',21,79,'abc@gmail.com','https://www.linkedin.com/in/hgn',3),('hillBur76!','Christain','Hillbury',25,33,'abc@gmail.com','https://www.linkedin.com/in/hgn',1),('jbOnhigh!','Joy','Smith',27,70,'abc@gmail.com','https://www.linkedin.com/in/hgn',4),('joJo89','Joseph','Rodriquez',23,66,'abc@gmail.com','https://www.linkedin.com/in/hgn',4),('Jojograce','Joanna','Jacob',26,44,'abc@gmail.com','https://www.linkedin.com/in/hgn',2),('jpAzr!','JP','Azra',27,7,'abc@gmail.com','https://www.linkedin.com/in/hgn',3),('kenken','Kennise','Ng',19,190,'abc@gmail.com','https://www.linkedin.com/in/hgn',2),('marcie46%','Marcela','Janero',31,132,'abc@gmail.com','https://www.linkedin.com/in/hgn',2),('Mariah03','Mariah','Maynard',23,185,'abc@gmail.com','https://www.linkedin.com/in/hgn',1),('mattPaffen890!','Matt','Paffenroth',33,11,'abc@gmail.com','https://www.linkedin.com/in/hgn',1),('mibu87','Sush','Mita',25,179,'abc@gmail.com','https://www.linkedin.com/in/hgn',3),('mitchie06','Mitch','Neides',26,82,'abc@gmail.com','https://www.linkedin.com/in/hgn',3),('nicoDeri3','Nicolar','Deri',22,65,'abc@gmail.com','https://www.linkedin.com/in/hgn',3),('panSar900','Sarthak','Pan',28,9,'abc@gmail.com','https://www.linkedin.com/in/hgn',4),('parkHi87','Parker','Hill',22,185,'abc@gmail.com','https://www.linkedin.com/in/hgn',2),('shriyadh03','Shriya','Dhaundiyal',25,79,'abc@gmail.com','https://www.linkedin.com/in/hgn',3),('Smlaur2','Lauren','Smith',17,122,'abc@gmail.com','https://www.linkedin.com/in/hgn',4),('sophiaR69!','Sophie','Rose',25,130,'abc@gmail.com','https://www.linkedin.com/in/hgn',1),('tedHe99','Teddy','Hayeon',18,160,'abc@gmail.com','https://www.linkedin.com/in/hgn',2),('thyuChe21','Thyutien','Che',22,188,'abc@gmail.com','https://www.linkedin.com/in/hgn',4),('tiguBru','Bruce','Tiger',29,95,'abc@gmail.com','https://www.linkedin.com/in/hgn',1),('yiLaur90','Lauryn','Yi',18,111,'abc@gmail.com','https://www.linkedin.com/in/hgn',4);
/*!40000 ALTER TABLE `mentee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mentors`
--

DROP TABLE IF EXISTS `mentors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mentors` (
  `mentor_id` varchar(80) NOT NULL,
  `first_name` varchar(80) NOT NULL,
  `last_name` varchar(80) NOT NULL,
  `country_id` int NOT NULL,
  `ethnicity_id` int NOT NULL,
  `gender_identity` varchar(20) DEFAULT NULL,
  `degree_id` int NOT NULL,
  `field_id` int NOT NULL,
  `current_organization_id` int NOT NULL,
  `linkedIn` varchar(80) NOT NULL,
  PRIMARY KEY (`mentor_id`),
  KEY `mentors_fk_country` (`country_id`),
  KEY `mentors_fk_ethnicity` (`ethnicity_id`),
  KEY `mentors_fk_degree` (`degree_id`),
  KEY `mentors_fk_stem_field` (`field_id`),
  KEY `mentors_fk_organization` (`current_organization_id`),
  CONSTRAINT `mentors_fk_country` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mentors_fk_degree` FOREIGN KEY (`degree_id`) REFERENCES `degree` (`degree_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mentors_fk_ethnicity` FOREIGN KEY (`ethnicity_id`) REFERENCES `ethnicity` (`ethnicity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mentors_fk_organization` FOREIGN KEY (`current_organization_id`) REFERENCES `organization` (`current_organization_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mentors_fk_stem_field` FOREIGN KEY (`field_id`) REFERENCES `stem_field` (`field_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mentors`
--

LOCK TABLES `mentors` WRITE;
/*!40000 ALTER TABLE `mentors` DISABLE KEYS */;
INSERT INTO `mentors` VALUES ('alexa03','Alexa','Doe',1,1,'FEMALE',1,1,1,'https://www.linkedin.com/in/hgn'),('arshi2!','Salma','Arsh',1,5,'FEMALE',53,2,24,'https://www.linkedin.com/in/hgn'),('arshi20!','Salma','Arsh',185,5,'FEMALE',88,1,14,'https://www.linkedin.com/in/hgn'),('HanaGab21','Hana','Gabriella',185,1,'FEMALE',86,1,29,'https://www.linkedin.com/in/hgn'),('lauren333','Lauren','Simson',185,3,'FEMALE',64,1,69,'https://www.linkedin.com/in/hgn'),('Nicolas11','Nicolas','Lip',185,7,'MALE',78,3,49,'https://www.linkedin.com/in/hgn'),('nidhi@11','Nidhi','Kapur',79,5,'FEMALE',59,1,9,'https://www.linkedin.com/in/hgn'),('Qin990!','Xio','Qin',76,5,'FEMALE',62,2,20,'https://www.linkedin.com/in/hgn'),('sabu8796!!','Rossa','Sabu',130,5,'FEMALE',72,3,29,'https://www.linkedin.com/in/hgn'),('saeed90!','Ariij','Saaed',138,5,'FEMALE',82,1,11,'https://www.linkedin.com/in/hgn'),('saimy79=!','Saimy','Kaur',12,5,'FEMALE',38,1,18,'https://www.linkedin.com/in/hgn'),('tanShan09','Tanshanika','Smith',185,4,'FEMALE',33,1,77,'https://www.linkedin.com/in/hgn');
/*!40000 ALTER TABLE `mentors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mentorship`
--

DROP TABLE IF EXISTS `mentorship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mentorship` (
  `mentor_id` varchar(80) NOT NULL,
  `mentee_id` varchar(80) NOT NULL,
  `durationOfMentorship` int NOT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  KEY `mentorship_fk_mentors` (`mentor_id`),
  KEY `mentorship_fk_mentee` (`mentee_id`),
  CONSTRAINT `mentorship_fk_mentee` FOREIGN KEY (`mentee_id`) REFERENCES `mentee` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mentorship_fk_mentors` FOREIGN KEY (`mentor_id`) REFERENCES `mentors` (`mentor_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mentorship`
--

LOCK TABLES `mentorship` WRITE;
/*!40000 ALTER TABLE `mentorship` DISABLE KEYS */;
INSERT INTO `mentorship` VALUES ('alexa03','jbOnhigh!',3,'1997-03-01','1997-05-01');
/*!40000 ALTER TABLE `mentorship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organization` (
  `current_organization_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  PRIMARY KEY (`current_organization_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
INSERT INTO `organization` VALUES (20,'2Gether-International'),(22,'Ada Developers Academy '),(27,'Ada’s List '),(69,'Adobe'),(71,'Airbnb'),(48,'Alphabet'),(67,'Amazon'),(1,'American Indian Science and Engineering Society (AISES)'),(46,'Apple'),(3,'Black & Brown Founders'),(2,'Black Data Processing Associates (BDPA)'),(4,'Black Girls Code'),(5,'Blacks in Technology (BIT)'),(21,'Blind Institute of Technology'),(62,'Cisco'),(26,'Code Your Future'),(6,'CODE2040'),(32,'CodeNation'),(24,'Coders of Colour '),(25,'Coding Black Females '),(38,'Columbia University'),(7,'DigitalUndivided (DID)'),(40,'Duke University'),(50,'Foxconn'),(35,'Harvard University'),(60,'Hewlett Packard'),(54,'Hitcahi'),(51,'Huawei'),(57,'IBM'),(8,'Information Technology Senior Management Forum (ITSMF)'),(56,'Intel'),(74,'Intuit'),(59,'Lenovo'),(9,'Lesbians Who Tech'),(61,'LG Electronics'),(10,'LGBTQ Tech'),(33,'Massachusetts Institute of Technology'),(52,'Meta'),(49,'Microsoft'),(11,'National Action Council for Minorities in Engineering (NACME)'),(12,'National Society of Black Engineers (NSBE)'),(28,'Natives in Tech'),(76,'Netflix'),(45,'Northeastern University'),(42,'Northwestern University'),(66,'NVIDIA'),(31,'Operation Code '),(14,'Opportunity Hub (OHUB)'),(68,'Oracle'),(15,'Out in Tech'),(58,'Panasonic'),(73,'PayPal'),(65,'PlayStation'),(37,'Princeton University'),(43,'Rice University'),(77,'Salesforce'),(47,'Samsung Electronics'),(75,'SAP'),(16,'Society for Advancement of Chicanos/Hispanics and Native Americans in Science (SACNAS)'),(29,'Society of Asian Scientists and Engineers '),(17,'Society of Hispanic Professional Engineers (SHPE)'),(53,'Sony'),(34,'Stanford University'),(30,'Tech Disability Project'),(55,'Tencent'),(64,'Tesla'),(23,'The Last Mile '),(13,'The Nonprofit Technology Enterprise Network (NTEN)'),(72,'TikTok'),(18,'Trans*H4ck'),(70,'Uber'),(36,'University of California, Berkeley'),(41,'University of Pennsylvania'),(44,'Vanderbilt University'),(19,'Wonder Women Tech'),(63,'Xiaomi'),(39,'Yale University');
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pending_requests`
--

DROP TABLE IF EXISTS `pending_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pending_requests` (
  `request_id` int DEFAULT NULL,
  `mentor_id` varchar(80) NOT NULL,
  `mentee_id` varchar(80) NOT NULL,
  `message_to_mentor` varchar(80) NOT NULL,
  KEY `pending_reqs_fk_request_status` (`request_id`),
  KEY `pending_reqs_fk_mentors` (`mentor_id`),
  KEY `pending_reqs_fk_mentee` (`mentee_id`),
  CONSTRAINT `pending_reqs_fk_mentee` FOREIGN KEY (`mentee_id`) REFERENCES `mentee` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pending_reqs_fk_mentors` FOREIGN KEY (`mentor_id`) REFERENCES `mentors` (`mentor_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pending_reqs_fk_request_status` FOREIGN KEY (`request_id`) REFERENCES `request_status` (`request_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pending_requests`
--

LOCK TABLES `pending_requests` WRITE;
/*!40000 ALTER TABLE `pending_requests` DISABLE KEYS */;
INSERT INTO `pending_requests` VALUES (1,'alexa03','Mariah03','Hello World!'),(2,'sabu8796!!','Mariah03','Hello World!'),(3,'alexa03','doedoe33','Hello World!'),(4,'arshi20!','Smlaur2','Hello World!'),(5,'arshi20!','panSar900','Hello World!'),(6,'saeed90!','panSar900','Hello World!'),(7,'lauren333','panSar900','Hello World!'),(8,'saeed90!','Smlaur2','Hello World!'),(9,'Nicolas11','tiguBru','Hello World!'),(10,'lauren333','tiguBru','Hello World!');
/*!40000 ALTER TABLE `pending_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_status`
--

DROP TABLE IF EXISTS `request_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request_status` (
  `request_id` int NOT NULL AUTO_INCREMENT,
  `mentor_id` varchar(80) NOT NULL,
  `mentee_id` varchar(80) NOT NULL,
  `status` varchar(80) NOT NULL DEFAULT (_utf8mb4'PENDING'),
  PRIMARY KEY (`request_id`),
  KEY `request_status_fk_mentors` (`mentor_id`),
  KEY `request_status_fk_mentee` (`mentee_id`),
  CONSTRAINT `request_status_fk_mentee` FOREIGN KEY (`mentee_id`) REFERENCES `mentee` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `request_status_fk_mentors` FOREIGN KEY (`mentor_id`) REFERENCES `mentors` (`mentor_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_status`
--

LOCK TABLES `request_status` WRITE;
/*!40000 ALTER TABLE `request_status` DISABLE KEYS */;
INSERT INTO `request_status` VALUES (1,'alexa03','Mariah03','PENDING'),(2,'sabu8796!!','Mariah03','PENDING'),(3,'alexa03','doedoe33','PENDING'),(4,'arshi20!','Smlaur2','PENDING'),(5,'arshi20!','panSar900','PENDING'),(6,'saeed90!','panSar900','PENDING'),(7,'lauren333','panSar900','PENDING'),(8,'saeed90!','Smlaur2','PENDING'),(9,'Nicolas11','tiguBru','PENDING'),(10,'lauren333','tiguBru','PENDING');
/*!40000 ALTER TABLE `request_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stem_field`
--

DROP TABLE IF EXISTS `stem_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stem_field` (
  `field_id` int NOT NULL AUTO_INCREMENT,
  `field_name` varchar(80) NOT NULL,
  PRIMARY KEY (`field_id`),
  UNIQUE KEY `field_name` (`field_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stem_field`
--

LOCK TABLES `stem_field` WRITE;
/*!40000 ALTER TABLE `stem_field` DISABLE KEYS */;
INSERT INTO `stem_field` VALUES (3,'Engineering'),(4,'Mathematics'),(1,'Science'),(2,'Technology');
/*!40000 ALTER TABLE `stem_field` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-09 19:18:54
