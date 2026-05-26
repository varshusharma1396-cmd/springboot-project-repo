-- MySQL dump 10.13  Distrib 9.6.0, for Win64 (x86_64)
--
-- Host: localhost    Database: device_api
-- ------------------------------------------------------
-- Server version	9.6.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'c82ad5d6-55d1-11f1-b409-2c3b70e690a6:1-255';

--
-- Table structure for table `device_events`
--

DROP TABLE IF EXISTS `device_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_events` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `device_id` varchar(255) NOT NULL,
  `event_date_time` datetime(6) NOT NULL,
  `fielda` int NOT NULL,
  `fieldb` varchar(255) NOT NULL,
  `fieldc` decimal(18,4) NOT NULL,
  `received_at` datetime(6) NOT NULL,
  `record_type` varchar(255) NOT NULL,
  `request_path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_events`
--

LOCK TABLES `device_events` WRITE;
/*!40000 ALTER TABLE `device_events` DISABLE KEYS */;
INSERT INTO `device_events` VALUES (1,'357370040159773','2014-05-12 05:09:48.000000',68,'xxx',123.4500,'2026-05-26 07:44:53.005363','xxx','/device'),(2,'357370040159773','2014-05-12 05:09:48.000000',68,'xxx',123.4500,'2026-05-26 07:45:13.737216','xxx','/device'),(3,'357370040159774','2014-05-12 05:09:48.000000',68,'xxx',123.4500,'2026-05-26 07:45:33.078794','xxx','/echo'),(4,'357370040159771','2014-05-12 05:09:48.000000',68,'xxx',123.4500,'2026-05-26 07:49:20.722578','xxx','/nocontent');
/*!40000 ALTER TABLE `device_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_audits`
--

DROP TABLE IF EXISTS `request_audits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request_audits` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `authorized` bit(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `method` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `request_body` text,
  `status_code` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_audits`
--

LOCK TABLES `request_audits` WRITE;
/*!40000 ALTER TABLE `request_audits` DISABLE KEYS */;
INSERT INTO `request_audits` VALUES (1,_binary '','2026-05-26 07:44:53.275075','POST','/device','{\r\n  \"RecordType\": \"xxx\",\r\n  \"DeviceId\": \"357370040159773\",\r\n  \"EventDateTime\": \"2014-05-12T05:09:48Z\",\r\n  \"FieldA\": 68,\r\n  \"FieldB\": \"xxx\",\r\n  \"FieldC\": 123.45\r\n}',200),(2,_binary '','2026-05-26 07:45:13.760387','POST','/device','{\r\n  \"RecordType\": \"xxx\",\r\n  \"DeviceId\": \"357370040159773\",\r\n  \"EventDateTime\": \"2014-05-12T05:09:48Z\",\r\n  \"FieldA\": 68,\r\n  \"FieldB\": \"xxx\",\r\n  \"FieldC\": 123.45\r\n}',200),(3,_binary '','2026-05-26 07:45:33.133126','POST','/echo','{\r\n  \"RecordType\": \"xxx\",\r\n  \"DeviceId\": \"357370040159774\",\r\n  \"EventDateTime\": \"2014-05-12T05:09:48Z\",\r\n  \"FieldA\": 68,\r\n  \"FieldB\": \"xxx\",\r\n  \"FieldC\": 123.45\r\n}',200),(4,_binary '\0','2026-05-26 07:46:06.620818','POST','/echo',NULL,401),(5,_binary '\0','2026-05-26 07:47:55.658077','POST','/echo',NULL,401),(6,_binary '','2026-05-26 07:48:28.857895','POST','/echo','{\r\n  \"DeviceId\": \"357370040159770\",\r\n  \"EventDateTime\": \"2014-05-12T05:09:48Z\",\r\n  \"FieldA\": 68,\r\n  \"FieldB\": \"xxx\",\r\n  \"FieldC\": 123.45\r\n}',400),(7,_binary '','2026-05-26 07:49:20.732773','POST','/nocontent','{\r\n  \"RecordType\": \"xxx\",\r\n  \"DeviceId\": \"357370040159771\",\r\n  \"EventDateTime\": \"2014-05-12T05:09:48Z\",\r\n  \"FieldA\": 68,\r\n  \"FieldB\": \"xxx\",\r\n  \"FieldC\": 123.45\r\n}',204),(8,_binary '','2026-05-26 07:50:24.064906','POST','/anything-else','{\r\n  \"RecordType\": \"xxx\",\r\n  \"DeviceId\": \"357370040159771\",\r\n  \"EventDateTime\": \"2014-05-12T05:09:48Z\",\r\n  \"FieldA\": 68,\r\n  \"FieldB\": \"xxx\",\r\n  \"FieldC\": 123.45\r\n}',400);
/*!40000 ALTER TABLE `request_audits` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-26 13:38:19
