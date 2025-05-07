-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: internship
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `accountcategory`
--

DROP TABLE IF EXISTS `accountcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accountcategory` (
  `categoryID` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`categoryID`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accountcategory`
--

LOCK TABLES `accountcategory` WRITE;
/*!40000 ALTER TABLE `accountcategory` DISABLE KEYS */;
INSERT INTO `accountcategory` VALUES (6,'IT Equipment'),(8,'Maintenance'),(3,'Meals & Entertainment'),(9,'Miscellaneous'),(1,'Office Supplies'),(5,'Payroll'),(10,'Professional Services'),(7,'Training'),(2,'Travel'),(4,'Utilities');
/*!40000 ALTER TABLE `accountcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `companyID` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `industry` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`companyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'Brightstar Manufacturing Co.','Manufacturing','USA'),(2,'Nimbus Tech Solutions Ltd.','IT Services','UK'),(3,'Greenfield Retail Corp.','Retail','China'),(4,'FinEdge Finance Inc.','Financial Services','USA'),(5,'MediHealth Partners LLC','Healthcare','Canada');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `errorlog`
--

DROP TABLE IF EXISTS `errorlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `errorlog` (
  `errorID` int NOT NULL AUTO_INCREMENT,
  `userID` int NOT NULL,
  `invoiceID` int DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`errorID`),
  KEY `userID` (`userID`),
  KEY `invoiceID` (`invoiceID`),
  CONSTRAINT `errorlog_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`),
  CONSTRAINT `errorlog_ibfk_2` FOREIGN KEY (`invoiceID`) REFERENCES `invoice` (`invoiceID`)
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `errorlog`
--

LOCK TABLES `errorlog` WRITE;
/*!40000 ALTER TABLE `errorlog` DISABLE KEYS */;
INSERT INTO `errorlog` VALUES (1,1,NULL,'MissingInvoice','Invoice #1002 was missing (not recorded by Alice Chan).','2024-01-31 00:00:00'),(2,3,NULL,'MissingInvoice','Invoice #3002 was missing (not recorded by Charlie Li).','2024-02-29 00:00:00'),(3,2,2,'DuplicateInvoice','Invoice #2003 was recorded twice by Bob Smith.','2024-03-31 00:00:00'),(4,4,5,'OffHours','Invoice #4001 was recorded at 2:00 AM by Diana Garcia (outside business hours).','2024-04-21 09:00:00'),(5,5,6,'AmountOutlier','Invoice #5002 (amount $15000.00) is unusually high compared to other entries.','2024-12-31 00:00:00'),(6,6,7,'FutureDate','Invoice #6002 has a future date (2025-01-15) compared to its recording date.','2024-12-15 16:01:00'),(7,7,8,'LateEntry','Invoice #7001 was recorded 45 days after its issue date (late entry by George Wong).','2024-08-31 00:00:00'),(8,8,9,'MismatchTotal','Invoice #8001 total is $1000.00, but recorded entries sum to $900.00.','2024-08-31 00:00:00'),(9,9,NULL,'OffHoursPattern','User Ivan Petrov recorded multiple invoices during off-hours in September.','2024-09-30 00:00:00'),(10,10,NULL,'CategoryMisuse','User Jane Doe categorized all her transactions as \'Miscellaneous\' (potential misclassification).','2024-12-31 00:00:00'),(11,6,NULL,'MissingInvoice','Invoice #6001 was missing (not recorded by userID 6).','2025-05-06 13:33:28'),(12,5,NULL,'MissingInvoice','Invoice #5001 was missing (not recorded by userID 5).','2025-05-06 13:33:28'),(13,2,NULL,'MissingInvoice','Invoice #2001 was missing (not recorded by userID 2).','2025-05-06 13:33:28'),(14,8,NULL,'MissingInvoice','Invoice #8002 was missing (not recorded by userID 8).','2025-05-06 13:33:28'),(15,7,NULL,'MissingInvoice','Invoice #7002 was missing (not recorded by userID 7).','2025-05-06 13:33:28'),(16,4,NULL,'MissingInvoice','Invoice #4002 was missing (not recorded by userID 4).','2025-05-06 13:33:28'),(17,3,NULL,'MissingInvoice','Invoice #3002 was missing (not recorded by userID 3).','2025-05-06 13:33:28'),(18,2,NULL,'MissingInvoice','Invoice #2002 was missing (not recorded by userID 2).','2025-05-06 13:33:28'),(19,1,NULL,'MissingInvoice','Invoice #1002 was missing (not recorded by userID 1).','2025-05-06 13:33:28'),(20,10,NULL,'MissingInvoice','Invoice #10003 was missing (not recorded by userID 10).','2025-05-06 13:33:28'),(21,9,NULL,'MissingInvoice','Invoice #9003 was missing (not recorded by userID 9).','2025-05-06 13:33:28'),(22,8,NULL,'MissingInvoice','Invoice #8003 was missing (not recorded by userID 8).','2025-05-06 13:33:28'),(23,7,NULL,'MissingInvoice','Invoice #7003 was missing (not recorded by userID 7).','2025-05-06 13:33:28'),(24,6,NULL,'MissingInvoice','Invoice #6003 was missing (not recorded by userID 6).','2025-05-06 13:33:28'),(25,5,NULL,'MissingInvoice','Invoice #5003 was missing (not recorded by userID 5).','2025-05-06 13:33:28'),(26,4,NULL,'MissingInvoice','Invoice #4003 was missing (not recorded by userID 4).','2025-05-06 13:33:28'),(27,3,NULL,'MissingInvoice','Invoice #3003 was missing (not recorded by userID 3).','2025-05-06 13:33:28'),(28,1,NULL,'MissingInvoice','Invoice #1003 was missing (not recorded by userID 1).','2025-05-06 13:33:28'),(29,10,NULL,'MissingInvoice','Invoice #10004 was missing (not recorded by userID 10).','2025-05-06 13:33:28'),(30,9,NULL,'MissingInvoice','Invoice #9004 was missing (not recorded by userID 9).','2025-05-06 13:33:28'),(31,8,NULL,'MissingInvoice','Invoice #8004 was missing (not recorded by userID 8).','2025-05-06 13:33:28'),(32,7,NULL,'MissingInvoice','Invoice #7004 was missing (not recorded by userID 7).','2025-05-06 13:33:28'),(33,6,NULL,'MissingInvoice','Invoice #6004 was missing (not recorded by userID 6).','2025-05-06 13:33:28'),(34,5,NULL,'MissingInvoice','Invoice #5004 was missing (not recorded by userID 5).','2025-05-06 13:33:28'),(35,4,NULL,'MissingInvoice','Invoice #4004 was missing (not recorded by userID 4).','2025-05-06 13:33:28'),(36,3,NULL,'MissingInvoice','Invoice #3004 was missing (not recorded by userID 3).','2025-05-06 13:33:28'),(37,2,NULL,'MissingInvoice','Invoice #2004 was missing (not recorded by userID 2).','2025-05-06 13:33:28'),(38,1,NULL,'MissingInvoice','Invoice #1004 was missing (not recorded by userID 1).','2025-05-06 13:33:28'),(39,10,NULL,'MissingInvoice','Invoice #10005 was missing (not recorded by userID 10).','2025-05-06 13:33:28'),(40,9,NULL,'MissingInvoice','Invoice #9005 was missing (not recorded by userID 9).','2025-05-06 13:33:28'),(41,8,NULL,'MissingInvoice','Invoice #8005 was missing (not recorded by userID 8).','2025-05-06 13:33:28'),(42,7,NULL,'MissingInvoice','Invoice #7005 was missing (not recorded by userID 7).','2025-05-06 13:33:28'),(43,6,NULL,'MissingInvoice','Invoice #6005 was missing (not recorded by userID 6).','2025-05-06 13:33:28'),(44,5,NULL,'MissingInvoice','Invoice #5005 was missing (not recorded by userID 5).','2025-05-06 13:33:28'),(45,4,NULL,'MissingInvoice','Invoice #4005 was missing (not recorded by userID 4).','2025-05-06 13:33:28'),(46,3,NULL,'MissingInvoice','Invoice #3005 was missing (not recorded by userID 3).','2025-05-06 13:33:28'),(47,2,NULL,'MissingInvoice','Invoice #2005 was missing (not recorded by userID 2).','2025-05-06 13:33:28'),(48,1,NULL,'MissingInvoice','Invoice #1005 was missing (not recorded by userID 1).','2025-05-06 13:33:28'),(49,10,NULL,'MissingInvoice','Invoice #10006 was missing (not recorded by userID 10).','2025-05-06 13:33:28'),(50,9,NULL,'MissingInvoice','Invoice #9006 was missing (not recorded by userID 9).','2025-05-06 13:33:28'),(51,8,NULL,'MissingInvoice','Invoice #8006 was missing (not recorded by userID 8).','2025-05-06 13:33:28'),(52,7,NULL,'MissingInvoice','Invoice #7006 was missing (not recorded by userID 7).','2025-05-06 13:33:28'),(53,6,NULL,'MissingInvoice','Invoice #6006 was missing (not recorded by userID 6).','2025-05-06 13:33:28'),(54,5,NULL,'MissingInvoice','Invoice #5006 was missing (not recorded by userID 5).','2025-05-06 13:33:28'),(55,4,NULL,'MissingInvoice','Invoice #4006 was missing (not recorded by userID 4).','2025-05-06 13:33:28'),(56,3,NULL,'MissingInvoice','Invoice #3006 was missing (not recorded by userID 3).','2025-05-06 13:33:28'),(57,2,NULL,'MissingInvoice','Invoice #2006 was missing (not recorded by userID 2).','2025-05-06 13:33:28'),(58,1,NULL,'MissingInvoice','Invoice #1006 was missing (not recorded by userID 1).','2025-05-06 13:33:28'),(59,10,NULL,'MissingInvoice','Invoice #10007 was missing (not recorded by userID 10).','2025-05-06 13:33:28'),(60,9,NULL,'MissingInvoice','Invoice #9007 was missing (not recorded by userID 9).','2025-05-06 13:33:28'),(61,8,NULL,'MissingInvoice','Invoice #8007 was missing (not recorded by userID 8).','2025-05-06 13:33:28'),(62,7,NULL,'MissingInvoice','Invoice #7007 was missing (not recorded by userID 7).','2025-05-06 13:33:28'),(63,6,NULL,'MissingInvoice','Invoice #6007 was missing (not recorded by userID 6).','2025-05-06 13:33:28'),(64,5,NULL,'MissingInvoice','Invoice #5007 was missing (not recorded by userID 5).','2025-05-06 13:33:28'),(65,4,NULL,'MissingInvoice','Invoice #4007 was missing (not recorded by userID 4).','2025-05-06 13:33:28'),(66,3,NULL,'MissingInvoice','Invoice #3007 was missing (not recorded by userID 3).','2025-05-06 13:33:28'),(67,2,NULL,'MissingInvoice','Invoice #2007 was missing (not recorded by userID 2).','2025-05-06 13:33:28'),(68,1,NULL,'MissingInvoice','Invoice #1007 was missing (not recorded by userID 1).','2025-05-06 13:33:28'),(69,10,NULL,'MissingInvoice','Invoice #10008 was missing (not recorded by userID 10).','2025-05-06 13:33:28'),(70,9,NULL,'MissingInvoice','Invoice #9008 was missing (not recorded by userID 9).','2025-05-06 13:33:28'),(71,8,NULL,'MissingInvoice','Invoice #8008 was missing (not recorded by userID 8).','2025-05-06 13:33:28'),(72,7,NULL,'MissingInvoice','Invoice #7008 was missing (not recorded by userID 7).','2025-05-06 13:33:28'),(73,6,NULL,'MissingInvoice','Invoice #6008 was missing (not recorded by userID 6).','2025-05-06 13:33:28'),(74,5,NULL,'MissingInvoice','Invoice #5008 was missing (not recorded by userID 5).','2025-05-06 13:33:28'),(75,4,NULL,'MissingInvoice','Invoice #4008 was missing (not recorded by userID 4).','2025-05-06 13:33:28'),(76,3,NULL,'MissingInvoice','Invoice #3008 was missing (not recorded by userID 3).','2025-05-06 13:33:28'),(77,2,NULL,'MissingInvoice','Invoice #2008 was missing (not recorded by userID 2).','2025-05-06 13:33:28'),(78,1,NULL,'MissingInvoice','Invoice #1008 was missing (not recorded by userID 1).','2025-05-06 13:33:28'),(79,10,NULL,'MissingInvoice','Invoice #10009 was missing (not recorded by userID 10).','2025-05-06 13:33:28'),(80,9,NULL,'MissingInvoice','Invoice #9009 was missing (not recorded by userID 9).','2025-05-06 13:33:28'),(81,8,NULL,'MissingInvoice','Invoice #8009 was missing (not recorded by userID 8).','2025-05-06 13:33:28'),(82,7,NULL,'MissingInvoice','Invoice #7009 was missing (not recorded by userID 7).','2025-05-06 13:33:28'),(83,6,NULL,'MissingInvoice','Invoice #6009 was missing (not recorded by userID 6).','2025-05-06 13:33:28'),(84,5,NULL,'MissingInvoice','Invoice #5009 was missing (not recorded by userID 5).','2025-05-06 13:33:28'),(85,4,NULL,'MissingInvoice','Invoice #4009 was missing (not recorded by userID 4).','2025-05-06 13:33:28'),(86,3,NULL,'MissingInvoice','Invoice #3009 was missing (not recorded by userID 3).','2025-05-06 13:33:28'),(87,2,NULL,'MissingInvoice','Invoice #2009 was missing (not recorded by userID 2).','2025-05-06 13:33:28'),(88,1,NULL,'MissingInvoice','Invoice #1009 was missing (not recorded by userID 1).','2025-05-06 13:33:28'),(89,10,NULL,'MissingInvoice','Invoice #10010 was missing (not recorded by userID 10).','2025-05-06 13:33:28'),(90,9,NULL,'MissingInvoice','Invoice #9010 was missing (not recorded by userID 9).','2025-05-06 13:33:28'),(91,8,NULL,'MissingInvoice','Invoice #8010 was missing (not recorded by userID 8).','2025-05-06 13:33:28'),(92,7,NULL,'MissingInvoice','Invoice #7010 was missing (not recorded by userID 7).','2025-05-06 13:33:28'),(93,6,NULL,'MissingInvoice','Invoice #6010 was missing (not recorded by userID 6).','2025-05-06 13:33:28'),(94,5,NULL,'MissingInvoice','Invoice #5010 was missing (not recorded by userID 5).','2025-05-06 13:33:28'),(95,4,NULL,'MissingInvoice','Invoice #4010 was missing (not recorded by userID 4).','2025-05-06 13:33:28'),(96,3,NULL,'MissingInvoice','Invoice #3010 was missing (not recorded by userID 3).','2025-05-06 13:33:28'),(97,2,NULL,'MissingInvoice','Invoice #2010 was missing (not recorded by userID 2).','2025-05-06 13:33:28'),(98,1,NULL,'MissingInvoice','Invoice #1010 was missing (not recorded by userID 1).','2025-05-06 13:33:28'),(138,6,NULL,'MissingInvoice','Invoice #6001 was missing (not recorded by userID 6).','2025-05-06 14:02:58'),(139,5,NULL,'MissingInvoice','Invoice #5001 was missing (not recorded by userID 5).','2025-05-06 14:02:58'),(140,2,NULL,'MissingInvoice','Invoice #2001 was missing (not recorded by userID 2).','2025-05-06 14:02:58'),(141,8,NULL,'MissingInvoice','Invoice #8002 was missing (not recorded by userID 8).','2025-05-06 14:02:58'),(142,7,NULL,'MissingInvoice','Invoice #7002 was missing (not recorded by userID 7).','2025-05-06 14:02:58'),(143,4,NULL,'MissingInvoice','Invoice #4002 was missing (not recorded by userID 4).','2025-05-06 14:02:58'),(144,3,NULL,'MissingInvoice','Invoice #3002 was missing (not recorded by userID 3).','2025-05-06 14:02:58'),(145,2,NULL,'MissingInvoice','Invoice #2002 was missing (not recorded by userID 2).','2025-05-06 14:02:58'),(146,1,NULL,'MissingInvoice','Invoice #1002 was missing (not recorded by userID 1).','2025-05-06 14:02:58'),(147,10,NULL,'MissingInvoice','Invoice #10003 was missing (not recorded by userID 10).','2025-05-06 14:02:58'),(148,9,NULL,'MissingInvoice','Invoice #9003 was missing (not recorded by userID 9).','2025-05-06 14:02:58'),(149,8,NULL,'MissingInvoice','Invoice #8003 was missing (not recorded by userID 8).','2025-05-06 14:02:58'),(150,7,NULL,'MissingInvoice','Invoice #7003 was missing (not recorded by userID 7).','2025-05-06 14:02:58'),(151,6,NULL,'MissingInvoice','Invoice #6003 was missing (not recorded by userID 6).','2025-05-06 14:02:58'),(152,5,NULL,'MissingInvoice','Invoice #5003 was missing (not recorded by userID 5).','2025-05-06 14:02:58'),(153,4,NULL,'MissingInvoice','Invoice #4003 was missing (not recorded by userID 4).','2025-05-06 14:02:58'),(154,3,NULL,'MissingInvoice','Invoice #3003 was missing (not recorded by userID 3).','2025-05-06 14:02:58'),(155,1,NULL,'MissingInvoice','Invoice #1003 was missing (not recorded by userID 1).','2025-05-06 14:02:58'),(156,10,NULL,'MissingInvoice','Invoice #10004 was missing (not recorded by userID 10).','2025-05-06 14:02:58'),(157,9,NULL,'MissingInvoice','Invoice #9004 was missing (not recorded by userID 9).','2025-05-06 14:02:58'),(158,8,NULL,'MissingInvoice','Invoice #8004 was missing (not recorded by userID 8).','2025-05-06 14:02:58'),(159,7,NULL,'MissingInvoice','Invoice #7004 was missing (not recorded by userID 7).','2025-05-06 14:02:58'),(160,6,NULL,'MissingInvoice','Invoice #6004 was missing (not recorded by userID 6).','2025-05-06 14:02:58'),(161,5,NULL,'MissingInvoice','Invoice #5004 was missing (not recorded by userID 5).','2025-05-06 14:02:58'),(162,4,NULL,'MissingInvoice','Invoice #4004 was missing (not recorded by userID 4).','2025-05-06 14:02:58'),(163,3,NULL,'MissingInvoice','Invoice #3004 was missing (not recorded by userID 3).','2025-05-06 14:02:58'),(164,2,NULL,'MissingInvoice','Invoice #2004 was missing (not recorded by userID 2).','2025-05-06 14:02:58'),(165,1,NULL,'MissingInvoice','Invoice #1004 was missing (not recorded by userID 1).','2025-05-06 14:02:58'),(166,10,NULL,'MissingInvoice','Invoice #10005 was missing (not recorded by userID 10).','2025-05-06 14:02:58'),(167,9,NULL,'MissingInvoice','Invoice #9005 was missing (not recorded by userID 9).','2025-05-06 14:02:58'),(168,8,NULL,'MissingInvoice','Invoice #8005 was missing (not recorded by userID 8).','2025-05-06 14:02:58'),(169,7,NULL,'MissingInvoice','Invoice #7005 was missing (not recorded by userID 7).','2025-05-06 14:02:58'),(170,6,NULL,'MissingInvoice','Invoice #6005 was missing (not recorded by userID 6).','2025-05-06 14:02:58'),(171,5,NULL,'MissingInvoice','Invoice #5005 was missing (not recorded by userID 5).','2025-05-06 14:02:58'),(172,4,NULL,'MissingInvoice','Invoice #4005 was missing (not recorded by userID 4).','2025-05-06 14:02:58'),(173,3,NULL,'MissingInvoice','Invoice #3005 was missing (not recorded by userID 3).','2025-05-06 14:02:58'),(174,2,NULL,'MissingInvoice','Invoice #2005 was missing (not recorded by userID 2).','2025-05-06 14:02:58'),(175,1,NULL,'MissingInvoice','Invoice #1005 was missing (not recorded by userID 1).','2025-05-06 14:02:58'),(176,10,NULL,'MissingInvoice','Invoice #10006 was missing (not recorded by userID 10).','2025-05-06 14:02:58'),(177,9,NULL,'MissingInvoice','Invoice #9006 was missing (not recorded by userID 9).','2025-05-06 14:02:58'),(178,8,NULL,'MissingInvoice','Invoice #8006 was missing (not recorded by userID 8).','2025-05-06 14:02:58'),(179,7,NULL,'MissingInvoice','Invoice #7006 was missing (not recorded by userID 7).','2025-05-06 14:02:58'),(180,6,NULL,'MissingInvoice','Invoice #6006 was missing (not recorded by userID 6).','2025-05-06 14:02:58'),(181,5,NULL,'MissingInvoice','Invoice #5006 was missing (not recorded by userID 5).','2025-05-06 14:02:58'),(182,4,NULL,'MissingInvoice','Invoice #4006 was missing (not recorded by userID 4).','2025-05-06 14:02:58'),(183,3,NULL,'MissingInvoice','Invoice #3006 was missing (not recorded by userID 3).','2025-05-06 14:02:58'),(184,2,NULL,'MissingInvoice','Invoice #2006 was missing (not recorded by userID 2).','2025-05-06 14:02:58'),(185,1,NULL,'MissingInvoice','Invoice #1006 was missing (not recorded by userID 1).','2025-05-06 14:02:58'),(186,10,NULL,'MissingInvoice','Invoice #10007 was missing (not recorded by userID 10).','2025-05-06 14:02:58'),(187,9,NULL,'MissingInvoice','Invoice #9007 was missing (not recorded by userID 9).','2025-05-06 14:02:58'),(188,8,NULL,'MissingInvoice','Invoice #8007 was missing (not recorded by userID 8).','2025-05-06 14:02:58'),(189,7,NULL,'MissingInvoice','Invoice #7007 was missing (not recorded by userID 7).','2025-05-06 14:02:58'),(190,6,NULL,'MissingInvoice','Invoice #6007 was missing (not recorded by userID 6).','2025-05-06 14:02:58'),(191,5,NULL,'MissingInvoice','Invoice #5007 was missing (not recorded by userID 5).','2025-05-06 14:02:58'),(192,4,NULL,'MissingInvoice','Invoice #4007 was missing (not recorded by userID 4).','2025-05-06 14:02:58'),(193,3,NULL,'MissingInvoice','Invoice #3007 was missing (not recorded by userID 3).','2025-05-06 14:02:58'),(194,2,NULL,'MissingInvoice','Invoice #2007 was missing (not recorded by userID 2).','2025-05-06 14:02:58'),(195,1,NULL,'MissingInvoice','Invoice #1007 was missing (not recorded by userID 1).','2025-05-06 14:02:58'),(196,10,NULL,'MissingInvoice','Invoice #10008 was missing (not recorded by userID 10).','2025-05-06 14:02:58'),(197,9,NULL,'MissingInvoice','Invoice #9008 was missing (not recorded by userID 9).','2025-05-06 14:02:58'),(198,8,NULL,'MissingInvoice','Invoice #8008 was missing (not recorded by userID 8).','2025-05-06 14:02:58'),(199,7,NULL,'MissingInvoice','Invoice #7008 was missing (not recorded by userID 7).','2025-05-06 14:02:58'),(200,6,NULL,'MissingInvoice','Invoice #6008 was missing (not recorded by userID 6).','2025-05-06 14:02:58'),(201,5,NULL,'MissingInvoice','Invoice #5008 was missing (not recorded by userID 5).','2025-05-06 14:02:58'),(202,4,NULL,'MissingInvoice','Invoice #4008 was missing (not recorded by userID 4).','2025-05-06 14:02:58'),(203,3,NULL,'MissingInvoice','Invoice #3008 was missing (not recorded by userID 3).','2025-05-06 14:02:58'),(204,2,NULL,'MissingInvoice','Invoice #2008 was missing (not recorded by userID 2).','2025-05-06 14:02:58'),(205,1,NULL,'MissingInvoice','Invoice #1008 was missing (not recorded by userID 1).','2025-05-06 14:02:58'),(206,10,NULL,'MissingInvoice','Invoice #10009 was missing (not recorded by userID 10).','2025-05-06 14:02:58'),(207,9,NULL,'MissingInvoice','Invoice #9009 was missing (not recorded by userID 9).','2025-05-06 14:02:58'),(208,8,NULL,'MissingInvoice','Invoice #8009 was missing (not recorded by userID 8).','2025-05-06 14:02:58'),(209,7,NULL,'MissingInvoice','Invoice #7009 was missing (not recorded by userID 7).','2025-05-06 14:02:58'),(210,6,NULL,'MissingInvoice','Invoice #6009 was missing (not recorded by userID 6).','2025-05-06 14:02:58'),(211,5,NULL,'MissingInvoice','Invoice #5009 was missing (not recorded by userID 5).','2025-05-06 14:02:58'),(212,4,NULL,'MissingInvoice','Invoice #4009 was missing (not recorded by userID 4).','2025-05-06 14:02:58'),(213,3,NULL,'MissingInvoice','Invoice #3009 was missing (not recorded by userID 3).','2025-05-06 14:02:58'),(214,2,NULL,'MissingInvoice','Invoice #2009 was missing (not recorded by userID 2).','2025-05-06 14:02:58'),(215,1,NULL,'MissingInvoice','Invoice #1009 was missing (not recorded by userID 1).','2025-05-06 14:02:58'),(216,10,NULL,'MissingInvoice','Invoice #10010 was missing (not recorded by userID 10).','2025-05-06 14:02:58'),(217,9,NULL,'MissingInvoice','Invoice #9010 was missing (not recorded by userID 9).','2025-05-06 14:02:58'),(218,8,NULL,'MissingInvoice','Invoice #8010 was missing (not recorded by userID 8).','2025-05-06 14:02:58'),(219,7,NULL,'MissingInvoice','Invoice #7010 was missing (not recorded by userID 7).','2025-05-06 14:02:58'),(220,6,NULL,'MissingInvoice','Invoice #6010 was missing (not recorded by userID 6).','2025-05-06 14:02:58'),(221,5,NULL,'MissingInvoice','Invoice #5010 was missing (not recorded by userID 5).','2025-05-06 14:02:58'),(222,4,NULL,'MissingInvoice','Invoice #4010 was missing (not recorded by userID 4).','2025-05-06 14:02:58'),(223,3,NULL,'MissingInvoice','Invoice #3010 was missing (not recorded by userID 3).','2025-05-06 14:02:58'),(224,2,NULL,'MissingInvoice','Invoice #2010 was missing (not recorded by userID 2).','2025-05-06 14:02:58'),(225,1,NULL,'MissingInvoice','Invoice #1010 was missing (not recorded by userID 1).','2025-05-06 14:02:58');
/*!40000 ALTER TABLE `errorlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `errorlogview`
--

DROP TABLE IF EXISTS `errorlogview`;
/*!50001 DROP VIEW IF EXISTS `errorlogview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `errorlogview` AS SELECT 
 1 AS `errorID`,
 1 AS `userName`,
 1 AS `invoiceNo`,
 1 AS `type`,
 1 AS `description`,
 1 AS `timestamp`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `invoiceID` int NOT NULL,
  `seqID` int NOT NULL,
  `invoiceNo` int NOT NULL,
  `invoiceDate` date DEFAULT NULL,
  `totalAmount` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`invoiceID`),
  KEY `seqID` (`seqID`),
  CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`seqID`) REFERENCES `invoicesequence` (`seqID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES (1,1,1001,'2024-01-05',500.00),(2,2,2003,'2024-03-10',300.00),(3,2,2003,'2024-03-10',300.00),(4,3,3001,'2024-02-01',800.00),(5,4,4001,'2024-04-20',600.00),(6,5,5002,'2024-05-12',15000.00),(7,6,6002,'2025-01-15',200.00),(8,7,7001,'2024-07-01',400.00),(9,8,8001,'2024-08-10',1000.00),(10,9,9001,'2024-09-25',220.00),(11,9,9002,'2024-09-25',180.00),(12,10,10001,'2024-10-05',50.00),(13,10,10002,'2024-10-10',120.00);
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoicesequence`
--

DROP TABLE IF EXISTS `invoicesequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoicesequence` (
  `seqID` int NOT NULL,
  `userID` int NOT NULL,
  `startNo` int NOT NULL,
  `endNo` int NOT NULL,
  `year` int DEFAULT NULL,
  PRIMARY KEY (`seqID`),
  KEY `userID` (`userID`),
  CONSTRAINT `invoicesequence_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoicesequence`
--

LOCK TABLES `invoicesequence` WRITE;
/*!40000 ALTER TABLE `invoicesequence` DISABLE KEYS */;
INSERT INTO `invoicesequence` VALUES (1,1,1001,1010,2024),(2,2,2001,2010,2024),(3,3,3001,3010,2024),(4,4,4001,4010,2024),(5,5,5001,5010,2024),(6,6,6001,6010,2024),(7,7,7001,7010,2024),(8,8,8001,8010,2024),(9,9,9001,9010,2024),(10,10,10001,10010,2024);
/*!40000 ALTER TABLE `invoicesequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `machine`
--

DROP TABLE IF EXISTS `machine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `machine` (
  `machineID` int NOT NULL,
  `companyID` int NOT NULL,
  `model` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`machineID`),
  KEY `companyID` (`companyID`),
  CONSTRAINT `machine_ibfk_1` FOREIGN KEY (`companyID`) REFERENCES `company` (`companyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `machine`
--

LOCK TABLES `machine` WRITE;
/*!40000 ALTER TABLE `machine` DISABLE KEYS */;
INSERT INTO `machine` VALUES (1,1,'Dell OptiPlex 7080','Desktop PC'),(2,2,'HP ProDesk 600','Desktop PC'),(3,3,'Lenovo ThinkCentre M720','Desktop PC'),(4,4,'Dell XPS 15','Laptop'),(5,5,'HP EliteBook 840','Laptop'),(6,1,'Canon DR-C230','Scanner'),(7,2,'Fujitsu ScanSnap iX1500','Scanner'),(8,3,'Brother ADS-2700W','Scanner'),(9,4,'Canon imageFORMULA R40','Scanner'),(10,5,'Fujitsu ScanSnap S1300i','Scanner'),(11,1,'HP ProBook 450','Laptop'),(12,2,'Dell Latitude 7410','Laptop'),(13,3,'HP ZBook 15','Laptop'),(14,4,'Lenovo ThinkPad T14','Laptop'),(15,5,'Dell Precision 3440','Desktop PC');
/*!40000 ALTER TABLE `machine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `machinelog`
--

DROP TABLE IF EXISTS `machinelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `machinelog` (
  `logID` int NOT NULL,
  `machineID` int NOT NULL,
  `userID` int NOT NULL,
  `invoiceNo` int DEFAULT NULL,
  `operationType` varchar(20) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`logID`),
  KEY `machineID` (`machineID`),
  KEY `userID` (`userID`),
  CONSTRAINT `machinelog_ibfk_1` FOREIGN KEY (`machineID`) REFERENCES `machine` (`machineID`),
  CONSTRAINT `machinelog_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `machinelog`
--

LOCK TABLES `machinelog` WRITE;
/*!40000 ALTER TABLE `machinelog` DISABLE KEYS */;
INSERT INTO `machinelog` VALUES (1,6,1,1001,'Scan','2024-01-05 09:50:00'),(2,6,1,1002,'Scan','2024-01-06 09:00:00'),(3,7,2,2003,'Scan','2024-03-10 13:50:00'),(4,8,3,3002,'Scan','2024-02-02 09:00:00'),(5,9,4,4001,'Scan','2024-04-20 17:00:00'),(6,7,7,7001,'Scan','2024-07-05 10:00:00'),(7,8,8,8001,'Scan','2024-08-10 09:00:00'),(8,9,9,9001,'Scan','2024-09-25 21:30:00'),(9,9,9,9002,'Scan','2024-09-25 21:35:00'),(10,10,10,10002,'Scan','2024-10-10 15:30:00');
/*!40000 ALTER TABLE `machinelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactionrecord`
--

DROP TABLE IF EXISTS `transactionrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactionrecord` (
  `transID` int NOT NULL,
  `invoiceID` int NOT NULL,
  `accountCategoryID` int NOT NULL,
  `userID` int NOT NULL,
  `machineID` int DEFAULT NULL,
  `amount` decimal(12,2) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`transID`),
  KEY `invoiceID` (`invoiceID`),
  KEY `accountCategoryID` (`accountCategoryID`),
  KEY `userID` (`userID`),
  KEY `machineID` (`machineID`),
  CONSTRAINT `transactionrecord_ibfk_1` FOREIGN KEY (`invoiceID`) REFERENCES `invoice` (`invoiceID`),
  CONSTRAINT `transactionrecord_ibfk_2` FOREIGN KEY (`accountCategoryID`) REFERENCES `accountcategory` (`categoryID`),
  CONSTRAINT `transactionrecord_ibfk_3` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`),
  CONSTRAINT `transactionrecord_ibfk_4` FOREIGN KEY (`machineID`) REFERENCES `machine` (`machineID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactionrecord`
--

LOCK TABLES `transactionrecord` WRITE;
/*!40000 ALTER TABLE `transactionrecord` DISABLE KEYS */;
INSERT INTO `transactionrecord` VALUES (1,1,1,1,1,300.00,'2024-01-05 10:00:00'),(2,1,2,1,1,200.00,'2024-01-05 10:05:00'),(3,2,2,2,2,300.00,'2024-03-10 14:00:00'),(4,3,2,2,2,300.00,'2024-03-10 14:05:00'),(5,4,6,3,3,800.00,'2024-02-02 11:00:00'),(6,5,4,4,4,600.00,'2024-04-21 02:00:00'),(7,6,10,5,5,15000.00,'2024-05-12 15:00:00'),(8,7,3,6,11,200.00,'2024-12-15 16:00:00'),(9,8,1,7,12,400.00,'2024-08-15 10:00:00'),(10,9,2,8,13,700.00,'2024-08-11 10:00:00'),(11,9,3,8,13,200.00,'2024-08-11 10:02:00'),(12,10,3,9,14,220.00,'2024-09-25 23:50:00'),(13,11,2,9,14,180.00,'2024-09-26 00:10:00'),(14,12,9,10,15,50.00,'2024-10-05 16:00:00'),(15,13,9,10,15,120.00,'2024-10-10 16:30:00');
/*!40000 ALTER TABLE `transactionrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userID` int NOT NULL,
  `companyID` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `role` varchar(50) DEFAULT NULL,
  `experienceYears` int DEFAULT NULL,
  PRIMARY KEY (`userID`),
  KEY `companyID` (`companyID`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`companyID`) REFERENCES `company` (`companyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,'Alice Chan','Accountant',5),(2,2,'Bob Smith','Accountant',3),(3,3,'Charlie Li','Accountant',4),(4,4,'Diana Garcia','Accountant',6),(5,5,'Evan Patel','Accounting Manager',10),(6,1,'Fiona Zhang','Accountant',2),(7,2,'George Wong','Accountant',7),(8,3,'Hannah Kim','Accountant',5),(9,4,'Ivan Petrov','Accountant',1),(10,5,'Jane Doe','Accountant',8);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `errorlogview`
--

/*!50001 DROP VIEW IF EXISTS `errorlogview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `errorlogview` AS select `e`.`errorID` AS `errorID`,`u`.`name` AS `userName`,coalesce(`i`.`invoiceNo`,NULL) AS `invoiceNo`,`e`.`type` AS `type`,`e`.`description` AS `description`,`e`.`timestamp` AS `timestamp` from ((`errorlog` `e` left join `invoice` `i` on((`e`.`invoiceID` = `i`.`invoiceID`))) join `user` `u` on((`e`.`userID` = `u`.`userID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-06 14:06:57
