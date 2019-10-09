-- MariaDB dump 10.17  Distrib 10.4.7-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: Event_Management
-- ------------------------------------------------------
-- Server version	10.4.7-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `event_communication`
--

DROP TABLE IF EXISTS `event_communication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_communication` (
  `event_id` int(11) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `communication_number` int(11) NOT NULL,
  `communication_flag` int(11) DEFAULT NULL CHECK (`communication_flag` in (0,1,2)),
  KEY `fk4` (`event_id`),
  CONSTRAINT `fk4` FOREIGN KEY (`event_id`) REFERENCES `event_ledger` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_communication`
--

LOCK TABLES `event_communication` WRITE;
/*!40000 ALTER TABLE `event_communication` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_communication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_communication_history`
--

DROP TABLE IF EXISTS `event_communication_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_communication_history` (
  `event_id` int(11) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `communication_number` int(11) NOT NULL,
  `communication_flag` int(11) DEFAULT NULL CHECK (`communication_flag` in (0,1,2))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_communication_history`
--

LOCK TABLES `event_communication_history` WRITE;
/*!40000 ALTER TABLE `event_communication_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_communication_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_ledger`
--

DROP TABLE IF EXISTS `event_ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_ledger` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_level` int(11) NOT NULL CHECK (`status_level` in (1,2,3,4,5,6)),
  `prev_status_level` int(11) DEFAULT NULL CHECK (`prev_status_level` in (1,2,3,4,5,6)),
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`event_id`),
  KEY `username` (`username`),
  CONSTRAINT `event_ledger_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_ledger`
--

LOCK TABLES `event_ledger` WRITE;
/*!40000 ALTER TABLE `event_ledger` DISABLE KEYS */;
INSERT INTO `event_ledger` VALUES (1,'A1','sdfvs','aj10',1,1,'2018-08-10','2018-08-11'),(2,'A2','sdfvs','aj10',1,1,'2017-08-10','2017-08-11'),(3,'A3','sdfvs','aj10',1,1,'2016-08-10','2016-08-11'),(4,'A4','sdfvs','aj10',1,1,'2015-08-10','2015-08-11'),(5,'A5','sdfvs','aj10',1,1,'2014-08-10','2014-08-11'),(6,'P1','sad','ap',1,1,'2013-08-11','2013-08-12'),(7,'T1','sadsa','test',6,1,'2020-08-10','2020-08-11'),(8,'Csd','dsadsa','test',5,1,'2019-10-23','2019-10-26');
/*!40000 ALTER TABLE `event_ledger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_ledger_history`
--

DROP TABLE IF EXISTS `event_ledger_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_ledger_history` (
  `event_id` int(11) NOT NULL DEFAULT 0,
  `event_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_level` int(11) NOT NULL CHECK (`status_level` in (1,2,3,4,5,6)),
  `prev_status_level` int(11) DEFAULT NULL CHECK (`prev_status_level` in (1,2,3,4,5,6)),
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_ledger_history`
--

LOCK TABLES `event_ledger_history` WRITE;
/*!40000 ALTER TABLE `event_ledger_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_ledger_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `misc_ledger`
--

DROP TABLE IF EXISTS `misc_ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `misc_ledger` (
  `event_id` int(11) DEFAULT NULL,
  `request_number` int(11) NOT NULL,
  `req_start` date NOT NULL,
  `req_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_category` int(11) NOT NULL CHECK (`request_category` in (1,2,3,4,5)),
  `req_end` date NOT NULL,
  KEY `event_id` (`event_id`),
  CONSTRAINT `misc_ledger_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event_ledger` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `misc_ledger`
--

LOCK TABLES `misc_ledger` WRITE;
/*!40000 ALTER TABLE `misc_ledger` DISABLE KEYS */;
/*!40000 ALTER TABLE `misc_ledger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `misc_ledger_history`
--

DROP TABLE IF EXISTS `misc_ledger_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `misc_ledger_history` (
  `event_id` int(11) DEFAULT NULL,
  `request_number` int(11) NOT NULL,
  `req_start` date NOT NULL,
  `req_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_category` int(11) NOT NULL CHECK (`request_category` in (1,2,3,4,5)),
  `req_end` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `misc_ledger_history`
--

LOCK TABLES `misc_ledger_history` WRITE;
/*!40000 ALTER TABLE `misc_ledger_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `misc_ledger_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization` (
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`org_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
INSERT INTO `organization` VALUES ('CSI',1);
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_communication`
--

DROP TABLE IF EXISTS `resource_communication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_communication` (
  `event_id` int(11) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `communication_number` int(11) NOT NULL,
  `communication_flag` int(11) DEFAULT NULL CHECK (`communication_flag` in (0,1,2)),
  KEY `fk12` (`event_id`),
  CONSTRAINT `fk12` FOREIGN KEY (`event_id`) REFERENCES `event_ledger` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_communication`
--

LOCK TABLES `resource_communication` WRITE;
/*!40000 ALTER TABLE `resource_communication` DISABLE KEYS */;
INSERT INTO `resource_communication` VALUES (8,'hello',1,0);
/*!40000 ALTER TABLE `resource_communication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_communication_history`
--

DROP TABLE IF EXISTS `resource_communication_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_communication_history` (
  `event_id` int(11) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `communication_number` int(11) NOT NULL,
  `communication_flag` int(11) DEFAULT NULL CHECK (`communication_flag` in (0,1,2))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_communication_history`
--

LOCK TABLES `resource_communication_history` WRITE;
/*!40000 ALTER TABLE `resource_communication_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_communication_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_computers` int(11) NOT NULL,
  `projector_support` int(11) NOT NULL CHECK (`projector_support` in (0,1)),
  `capacity` int(11) NOT NULL,
  `emp_incharge` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'mllab',20,0,20,'');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `security_acknowledgement`
--

DROP TABLE IF EXISTS `security_acknowledgement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security_acknowledgement` (
  `event_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `in_time` time NOT NULL,
  `out_time` time NOT NULL,
  KEY `fk13` (`event_id`),
  KEY `fk14` (`student_id`),
  CONSTRAINT `fk13` FOREIGN KEY (`event_id`) REFERENCES `event_ledger` (`event_id`),
  CONSTRAINT `fk14` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security_acknowledgement`
--

LOCK TABLES `security_acknowledgement` WRITE;
/*!40000 ALTER TABLE `security_acknowledgement` DISABLE KEYS */;
/*!40000 ALTER TABLE `security_acknowledgement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `security_acknowledgement_history`
--

DROP TABLE IF EXISTS `security_acknowledgement_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security_acknowledgement_history` (
  `event_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `in_time` time NOT NULL,
  `out_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security_acknowledgement_history`
--

LOCK TABLES `security_acknowledgement_history` WRITE;
/*!40000 ALTER TABLE `security_acknowledgement_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `security_acknowledgement_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slots_and_details`
--

DROP TABLE IF EXISTS `slots_and_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slots_and_details` (
  `event_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `status_level` int(11) NOT NULL CHECK (`status_level` in (1,2,3,4,5,6)),
  `prev_status_level` int(11) NOT NULL CHECK (`prev_status_level` in (1,2,3,4,5,6)),
  `purpose` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purpose_explained` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_slot_start` time NOT NULL,
  `time_slot_end` time NOT NULL,
  KEY `fk1` (`room_id`),
  KEY `fk3` (`event_id`),
  CONSTRAINT `fk1` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`),
  CONSTRAINT `fk3` FOREIGN KEY (`event_id`) REFERENCES `event_ledger` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slots_and_details`
--

LOCK TABLES `slots_and_details` WRITE;
/*!40000 ALTER TABLE `slots_and_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `slots_and_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slots_and_details_history`
--

DROP TABLE IF EXISTS `slots_and_details_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slots_and_details_history` (
  `event_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `status_level` int(11) NOT NULL CHECK (`status_level` in (1,2,3,4,5,6)),
  `prev_status_level` int(11) NOT NULL CHECK (`prev_status_level` in (1,2,3,4,5,6)),
  `purpose` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purpose_explained` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_slot_start` time NOT NULL,
  `time_slot_end` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slots_and_details_history`
--

LOCK TABLES `slots_and_details_history` WRITE;
/*!40000 ALTER TABLE `slots_and_details_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `slots_and_details_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_no` int(11) NOT NULL,
  `id_no` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `id_no` (`id_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_level` int(11) NOT NULL CHECK (`access_level` in (0,1,2,3,4,5)),
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_id` int(11) DEFAULT NULL,
  `email_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL CHECK (`email_id` like '%@%.com'),
  PRIMARY KEY (`username`),
  KEY `org_id` (`org_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`org_id`) REFERENCES `organization` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('aj10','aj10',1,'Atharva',1,'ayhu@.com'),('ap','ap',1,'Ayushi',1,'122@.com'),('princi','princi',2,'princi',1,'ema@.com'),('test','test123',1,'test',1,'as@.com'),('test1','test',1,'test',1,'@.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-08 16:56:43
