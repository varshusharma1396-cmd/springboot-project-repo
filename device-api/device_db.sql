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

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'c82ad5d6-55d1-11f1-b409-2c3b70e690a6:1-145';

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_events`
--

LOCK TABLES `device_events` WRITE;
/*!40000 ALTER TABLE `device_events` DISABLE KEYS */;
INSERT INTO `device_events` VALUES (1,'357370040159770','2014-05-12 05:09:48.000000',68,'xxx',123.4500,'2026-05-22 12:20:44.636690','xxx','/nocontent'),(2,'357370040159770','2014-05-12 05:09:48.000000',68,'xxx',123.4500,'2026-05-22 12:20:44.636690','xxx','/echo'),(3,'357370040159770','2014-05-12 05:09:48.000000',68,'xxx',123.4500,'2026-05-22 12:20:44.636690','xxx','/other'),(4,'357370040159770','2014-05-12 05:09:48.000000',68,'xxx',123.4500,'2026-05-22 12:20:44.636690','xxx','/device'),(5,'357370040159770','2014-05-12 05:09:48.000000',68,'xxx',123.4500,'2026-05-22 12:21:29.382108','xxx','/device'),(6,'357370040159770','2014-05-12 05:09:48.000000',68,'xxx',123.4500,'2026-05-22 12:21:29.387123','xxx','/echo'),(7,'357370040159770','2014-05-12 05:09:48.000000',68,'xxx',123.4500,'2026-05-22 12:21:29.393134','xxx','/nocontent'),(8,'357370040159770','2014-05-12 05:09:48.000000',68,'xxx',123.4500,'2026-05-22 12:21:29.396135','xxx','/other'),(9,'357370040159770','2014-05-12 05:09:48.000000',68,'xxx',123.4500,'2026-05-22 12:46:47.923705','xxx','/echo'),(10,'357370040159770','2014-05-12 05:09:48.000000',68,'xxx',123.4500,'2026-05-22 13:34:17.190283','xxx','/echo'),(11,'357370040159770','2014-05-12 05:09:48.000000',68,'xxx',123.4500,'2026-05-22 13:38:14.935438','xxx','/device'),(12,'357370040159770','2014-05-12 05:09:48.000000',68,'xxx',123.4500,'2026-05-22 13:38:58.267780','xxx','/nocontent'),(13,'357370040159770','2014-05-12 05:09:48.000000',68,'xxx',123.4500,'2026-05-22 13:39:11.536697','xxx','/nocontent'),(14,'357370040159770','2014-05-12 05:09:48.000000',68,'xxx',123.4500,'2026-05-22 13:39:44.950374','xxx','/anything-else'),(15,'357370040159770','2014-05-12 05:09:48.000000',68,'xxx',123.4500,'2026-05-22 13:39:50.759941','xxx','/anything-else');
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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_audits`
--

LOCK TABLES `request_audits` WRITE;
/*!40000 ALTER TABLE `request_audits` DISABLE KEYS */;
INSERT INTO `request_audits` VALUES (1,_binary '','2026-05-22 12:20:44.762799','POST','/nocontent','{\"RecordType\":\"xxx\",\"DeviceId\":\"357370040159770\",\"EventDateTime\":\"2014-05-12T05:09:48Z\",\"FieldA\":68,\"FieldB\":\"xxx\",\"FieldC\":123.45}',204),(2,_binary '','2026-05-22 12:20:44.783665','POST','/device','{\"RecordType\":\"xxx\",\"DeviceId\":\"357370040159770\",\"EventDateTime\":\"2014-05-12T05:09:48Z\",\"FieldA\":68,\"FieldB\":\"xxx\",\"FieldC\":123.45}',200),(3,_binary '','2026-05-22 12:20:44.783665','POST','/other','{\"RecordType\":\"xxx\",\"DeviceId\":\"357370040159770\",\"EventDateTime\":\"2014-05-12T05:09:48Z\",\"FieldA\":68,\"FieldB\":\"xxx\",\"FieldC\":123.45}',400),(4,_binary '','2026-05-22 12:20:44.794965','POST','/echo','{\"RecordType\":\"xxx\",\"DeviceId\":\"357370040159770\",\"EventDateTime\":\"2014-05-12T05:09:48Z\",\"FieldA\":68,\"FieldB\":\"xxx\",\"FieldC\":123.45}',200),(5,_binary '','2026-05-22 12:21:00.542913','POST','/device','{\\',400),(6,_binary '','2026-05-22 12:21:00.542913','POST','/echo','{\\',400),(7,_binary '','2026-05-22 12:21:00.640699','POST','/nocontent','{\\',400),(8,_binary '','2026-05-22 12:21:00.650036','POST','/other','{\\',400),(9,_binary '','2026-05-22 12:21:29.393134','POST','/device','{\n  \"RecordType\": \"xxx\",\n  \"DeviceId\": \"357370040159770\",\n  \"EventDateTime\": \"2014-05-12T05:09:48Z\",\n  \"FieldA\": 68,\n  \"FieldB\": \"xxx\",\n  \"FieldC\": 123.45\n}\n',200),(10,_binary '','2026-05-22 12:21:29.397135','POST','/echo','{\n  \"RecordType\": \"xxx\",\n  \"DeviceId\": \"357370040159770\",\n  \"EventDateTime\": \"2014-05-12T05:09:48Z\",\n  \"FieldA\": 68,\n  \"FieldB\": \"xxx\",\n  \"FieldC\": 123.45\n}\n',200),(11,_binary '','2026-05-22 12:21:29.401135','POST','/nocontent','{\n  \"RecordType\": \"xxx\",\n  \"DeviceId\": \"357370040159770\",\n  \"EventDateTime\": \"2014-05-12T05:09:48Z\",\n  \"FieldA\": 68,\n  \"FieldB\": \"xxx\",\n  \"FieldC\": 123.45\n}\n',204),(12,_binary '','2026-05-22 12:21:29.405147','POST','/other','{\n  \"RecordType\": \"xxx\",\n  \"DeviceId\": \"357370040159770\",\n  \"EventDateTime\": \"2014-05-12T05:09:48Z\",\n  \"FieldA\": 68,\n  \"FieldB\": \"xxx\",\n  \"FieldC\": 123.45\n}\n',400),(13,_binary '\0','2026-05-22 12:21:32.822688','POST','/echo',NULL,401),(14,_binary '\0','2026-05-22 12:23:28.403256','GET','/',NULL,401),(15,_binary '\0','2026-05-22 12:23:28.716552','GET','/favicon.ico',NULL,401),(16,_binary '\0','2026-05-22 12:28:04.815534','GET','/',NULL,401),(17,_binary '\0','2026-05-22 12:28:04.887672','GET','/favicon.ico',NULL,401),(18,_binary '\0','2026-05-22 12:28:09.629660','GET','/',NULL,401),(19,_binary '\0','2026-05-22 12:28:09.686325','GET','/favicon.ico',NULL,401),(20,_binary '\0','2026-05-22 12:28:11.708921','GET','/',NULL,401),(21,_binary '\0','2026-05-22 12:28:11.761775','GET','/favicon.ico',NULL,401),(22,_binary '\0','2026-05-22 12:28:13.384322','GET','/',NULL,401),(23,_binary '\0','2026-05-22 12:28:13.415815','GET','/favicon.ico',NULL,401),(24,_binary '\0','2026-05-22 12:28:27.901670','GET','/',NULL,401),(25,_binary '\0','2026-05-22 12:28:27.945899','GET','/favicon.ico',NULL,401),(26,_binary '\0','2026-05-22 12:33:08.800976','GET','/',NULL,401),(27,_binary '\0','2026-05-22 12:33:09.229637','GET','/favicon.ico',NULL,401),(28,_binary '\0','2026-05-22 12:33:22.850257','GET','/',NULL,401),(29,_binary '\0','2026-05-22 12:33:22.919188','GET','/favicon.ico',NULL,401),(30,_binary '\0','2026-05-22 12:33:30.999030','GET','/',NULL,401),(31,_binary '\0','2026-05-22 12:33:31.046181','GET','/favicon.ico',NULL,401),(32,_binary '\0','2026-05-22 12:46:47.668705','POST','/echo',NULL,401),(33,_binary '','2026-05-22 12:46:47.860660','POST','/echo','{\\',400),(34,_binary '','2026-05-22 12:46:47.965813','POST','/echo','{\n  \"RecordType\": \"xxx\",\n  \"DeviceId\": \"357370040159770\",\n  \"EventDateTime\": \"2014-05-12T05:09:48Z\",\n  \"FieldA\": 68,\n  \"FieldB\": \"xxx\",\n  \"FieldC\": 123.45\n}\n',200),(35,_binary '','2026-05-22 12:47:05.124564','POST','/echo','{\n  \"DeviceId\": \"357370040159770\",\n  \"EventDateTime\": \"2014-05-12T05:09:48Z\",\n  \"FieldA\": 68,\n  \"FieldB\": \"xxx\",\n  \"FieldC\": 123.45\n}\n',400),(36,_binary '\0','2026-05-22 12:58:09.326277','POST','/',NULL,401),(37,_binary '\0','2026-05-22 12:59:26.754336','POST','/',NULL,401),(38,_binary '\0','2026-05-22 13:01:43.014173','POST','/',NULL,401),(39,_binary '\0','2026-05-22 13:02:24.140199','POST','/',NULL,401),(40,_binary '','2026-05-22 13:34:17.461725','POST','/echo','{\r\n  \"RecordType\": \"xxx\",\r\n  \"DeviceId\": \"357370040159770\",\r\n  \"EventDateTime\": \"2014-05-12T05:09:48Z\",\r\n  \"FieldA\": 68,\r\n  \"FieldB\": \"xxx\",\r\n  \"FieldC\": 123.45\r\n}',200),(41,_binary '','2026-05-22 13:36:23.409095','POST','/echo','{\r\n  \"DeviceId\": \"357370040159770\",\r\n  \"EventDateTime\": \"2014-05-12T05:09:48Z\",\r\n  \"FieldA\": 68,\r\n  \"FieldB\": \"xxx\",\r\n  \"FieldC\": 123.45\r\n}',400),(42,_binary '','2026-05-22 13:37:52.255622','POST','/device','{\r\n  \"DeviceId\": \"357370040159770\",\r\n  \"EventDateTime\": \"2014-05-12T05:09:48Z\",\r\n  \"FieldA\": 68,\r\n  \"FieldB\": \"xxx\",\r\n  \"FieldC\": 123.45\r\n}',400),(43,_binary '','2026-05-22 13:38:15.057236','POST','/device','{\r\n  \"RecordType\": \"xxx\",\r\n  \"DeviceId\": \"357370040159770\",\r\n  \"EventDateTime\": \"2014-05-12T05:09:48Z\",\r\n  \"FieldA\": 68,\r\n  \"FieldB\": \"xxx\",\r\n  \"FieldC\": 123.45\r\n}',200),(44,_binary '','2026-05-22 13:38:58.279914','POST','/nocontent','{\r\n  \"RecordType\": \"xxx\",\r\n  \"DeviceId\": \"357370040159770\",\r\n  \"EventDateTime\": \"2014-05-12T05:09:48Z\",\r\n  \"FieldA\": 68,\r\n  \"FieldB\": \"xxx\",\r\n  \"FieldC\": 123.45\r\n}',204),(45,_binary '','2026-05-22 13:39:11.545351','POST','/nocontent','{\r\n  \"RecordType\": \"xxx\",\r\n  \"DeviceId\": \"357370040159770\",\r\n  \"EventDateTime\": \"2014-05-12T05:09:48Z\",\r\n  \"FieldA\": 68,\r\n  \"FieldB\": \"xxx\",\r\n  \"FieldC\": 123.45\r\n}',204),(46,_binary '','2026-05-22 13:39:44.958756','POST','/anything-else','{\r\n  \"RecordType\": \"xxx\",\r\n  \"DeviceId\": \"357370040159770\",\r\n  \"EventDateTime\": \"2014-05-12T05:09:48Z\",\r\n  \"FieldA\": 68,\r\n  \"FieldB\": \"xxx\",\r\n  \"FieldC\": 123.45\r\n}',400),(47,_binary '','2026-05-22 13:39:50.766190','POST','/anything-else','{\r\n  \"RecordType\": \"xxx\",\r\n  \"DeviceId\": \"357370040159770\",\r\n  \"EventDateTime\": \"2014-05-12T05:09:48Z\",\r\n  \"FieldA\": 68,\r\n  \"FieldB\": \"xxx\",\r\n  \"FieldC\": 123.45\r\n}',400),(48,_binary '\0','2026-05-22 13:41:08.927989','POST','/echo',NULL,401),(49,_binary '\0','2026-05-22 13:41:20.162919','POST','/echo',NULL,401);
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

-- Dump completed on 2026-05-22 20:47:47
