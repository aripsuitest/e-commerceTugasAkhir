-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: tenangaja_db
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  UNIQUE KEY `Admin_email_key` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('089322f6-ecfa-4987-b537-d44c6d2574af','Konstruksi','fas fa-hard-hat','Pembangunan dan renovasi rumah, gedung, dan infrastruktur dengan tenaga ahli profesional.'),('6fd520b8-1969-4a16-8930-39ba14c55b45','Elektronik','fas fa-tv','Layanan instalasi, perbaikan, dan penjualan perangkat elektronik rumah tangga dan kantor.'),('c9b02c4e-4d77-4dc0-be9a-7a4b9e16a2f8','Otomotif','fas fa-car','Servis dan perawatan kendaraan bermotor, termasuk modifikasi, sparepart, dan inspeksi berkala.'),('e6a63cb8-e34a-4506-8103-94536cec6e81','Serba Bisa','fas fa-toolbox','Layanan umum seperti tukang, kebersihan, pengangkutan, hingga konsultasi solusi harian.');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favoriteworker`
--

DROP TABLE IF EXISTS `favoriteworker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favoriteworker` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `workerId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `FavoriteWorker_userId_workerId_key` (`userId`,`workerId`),
  KEY `FavoriteWorker_workerId_fkey` (`workerId`),
  CONSTRAINT `FavoriteWorker_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FavoriteWorker_workerId_fkey` FOREIGN KEY (`workerId`) REFERENCES `worker` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favoriteworker`
--

LOCK TABLES `favoriteworker` WRITE;
/*!40000 ALTER TABLE `favoriteworker` DISABLE KEYS */;
/*!40000 ALTER TABLE `favoriteworker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `workerId` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  KEY `Notification_userId_fkey` (`userId`),
  KEY `Notification_workerId_fkey` (`workerId`),
  CONSTRAINT `Notification_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Notification_workerId_fkey` FOREIGN KEY (`workerId`) REFERENCES `worker` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES ('00f06944-8c15-4cc6-9f0a-5ba944905aec','634c4c59-1b77-406e-a8bb-58a672da8e43',NULL,'Client from project #c909f943 give you 3 rating',1,'2025-05-21 15:31:24.985'),('04781b2e-7e2a-4901-b8c6-28d564e1380e','58508ba1-f76a-4b86-b459-cc3db2caba0d',NULL,'Your project status has been updated to completed',0,'2025-05-20 15:56:49.195'),('0af1a501-6811-4647-a82d-00d176b85f94','58508ba1-f76a-4b86-b459-cc3db2caba0d',NULL,'Your project status has been updated to accepted',1,'2025-05-12 13:47:59.994'),('14304a78-6a9b-4390-bb8e-3db03340cedb','23a33ea1-65b2-431b-8fca-bbd95cad83c5','079aecef-4a4a-40e8-a74a-df129ba1d899','Anda memiliki order baru dari ajax',0,'2025-05-25 13:14:26.270'),('1b9e4520-ac49-41f2-8b17-d6fdba1d395c','be0cf5e6-e46e-4fa4-9b20-0d5b418abdbc','3eb13756-d67c-46ae-9970-48d939422999','Anda memiliki order baru dari ajax',0,'2025-05-27 08:03:38.795'),('25da3496-298b-4f1a-b5f6-4710c5f2abdb','634c4c59-1b77-406e-a8bb-58a672da8e43',NULL,'Client has confirmed completion of project #c909f943',1,'2025-05-11 10:40:39.382'),('29928e0a-1bfe-4bf4-a26b-f1afc9c8299c','be0cf5e6-e46e-4fa4-9b20-0d5b418abdbc',NULL,'Your project status has been updated to accepted',0,'2025-05-25 14:03:32.641'),('311372c6-1602-4c95-9bf3-22ea9a92d88b','23a33ea1-65b2-431b-8fca-bbd95cad83c5','079aecef-4a4a-40e8-a74a-df129ba1d899','Anda memiliki order baru dari ajax',0,'2025-05-23 06:18:42.680'),('347ec9de-cbb7-4813-ba1d-1105462b2348','58508ba1-f76a-4b86-b459-cc3db2caba0d','e5b403d0-5a6b-4dfa-8795-95dea5a887d5','Anda memiliki order baru dari gemasajaa',0,'2025-05-20 14:36:50.578'),('45b2a8a7-f1e0-4960-87ad-0a6988c88b9b','634c4c59-1b77-406e-a8bb-58a672da8e43',NULL,'Client has confirmed completion of project #81bf2f1e',1,'2025-05-21 14:45:06.708'),('49692bbe-a465-42f1-9cd7-81a4db09b0c8','be0cf5e6-e46e-4fa4-9b20-0d5b418abdbc','3eb13756-d67c-46ae-9970-48d939422999','Anda memiliki order baru dari jarot',0,'2025-05-27 08:05:48.548'),('5551cfb9-1782-4e8f-a033-678833fe1fff',NULL,'e5b403d0-5a6b-4dfa-8795-95dea5a887d5','Project #1dde8e9c has been cancelled by the client',0,'2025-05-20 14:46:08.272'),('5eedd812-4afe-4213-916c-f750364289bc','58508ba1-f76a-4b86-b459-cc3db2caba0d',NULL,'Your project status has been updated to accepted',1,'2025-05-11 10:34:35.606'),('5f189460-55b5-4179-9e8e-a3c36cb1ceca','be0cf5e6-e46e-4fa4-9b20-0d5b418abdbc',NULL,'Your project status has been updated to accepted',0,'2025-05-23 06:19:17.001'),('627bd1dd-60c2-41b3-b2e6-4f28e65500bc','58508ba1-f76a-4b86-b459-cc3db2caba0d',NULL,'Your project status has been updated to completed',1,'2025-05-11 10:40:18.715'),('63074141-3e02-4e0c-98fb-8c4e3ec820a2','58508ba1-f76a-4b86-b459-cc3db2caba0d',NULL,'Your project status has been updated to accepted',0,'2025-05-22 14:15:52.135'),('7747f810-f1f1-4370-b1aa-df19b76f5f8d',NULL,'3eb13756-d67c-46ae-9970-48d939422999','Project #005a103d has been cancelled by the client',0,'2025-05-27 08:41:12.664'),('82699955-1caa-42a1-b85a-3224e1ede2e6','634c4c59-1b77-406e-a8bb-58a672da8e43','cad0002d-b5a8-483c-8ffe-5abf4c4e450e','Anda memiliki order baru dari Husein Wibowo',1,'2025-05-20 15:53:14.118'),('88a62d21-da60-41c8-9fea-84cc7d1d9016','23a33ea1-65b2-431b-8fca-bbd95cad83c5',NULL,'Your project status has been updated to accepted',0,'2025-05-27 08:06:13.821'),('8dd2e434-ed80-4416-adf3-8801fff01d38',NULL,'cad0002d-b5a8-483c-8ffe-5abf4c4e450e','Anda memiliki order baru dari Husein Wibowo',1,'2025-05-11 10:34:06.823'),('94b1116c-0bab-40b5-a476-2e49c451bcc9','58508ba1-f76a-4b86-b459-cc3db2caba0d',NULL,'Your project status has been updated to accepted',0,'2025-05-20 15:54:21.632'),('985aad9e-58ce-463f-bb97-6fc0a3745c2c','b7e986bc-f0a2-4c05-b359-6a9124dbf5e5',NULL,'Your project status has been updated to accepted',0,'2025-05-27 13:19:50.074'),('9b1a5829-41c4-4612-b438-f8ff93370fbd','634c4c59-1b77-406e-a8bb-58a672da8e43',NULL,'Client has confirmed completion of project #4588d0a5',0,'2025-05-22 14:19:02.458'),('a652fae9-8ede-4c0a-b9a9-78d9a5a9a576','23a33ea1-65b2-431b-8fca-bbd95cad83c5','079aecef-4a4a-40e8-a74a-df129ba1d899','Anda memiliki order baru dari ajax',0,'2025-05-25 14:02:20.196'),('ac2281dc-75f6-4556-aca4-80ebe341ddb0','23a33ea1-65b2-431b-8fca-bbd95cad83c5',NULL,'Your project status has been updated to accepted',0,'2025-05-27 08:42:56.012'),('b8513e0b-5739-4b06-bcd2-85c1cf74e243',NULL,'e5b403d0-5a6b-4dfa-8795-95dea5a887d5','Project #1dde8e9c has been cancelled by the client',0,'2025-05-20 14:46:08.274'),('c305f070-0822-4d89-9376-81e24217498a','634c4c59-1b77-406e-a8bb-58a672da8e43','cad0002d-b5a8-483c-8ffe-5abf4c4e450e','Anda memiliki order baru dari Husein Wibowo',1,'2025-05-12 13:46:30.014'),('db273417-af8c-45af-b5fb-06857dcedca7',NULL,'e5b403d0-5a6b-4dfa-8795-95dea5a887d5','Project #1dde8e9c has been cancelled by the client',0,'2025-05-20 14:50:14.783'),('e11c4e0e-384f-42b6-91ed-e380067fdb22','634c4c59-1b77-406e-a8bb-58a672da8e43','cad0002d-b5a8-483c-8ffe-5abf4c4e450e','Anda memiliki order baru dari Husein Wibowo',0,'2025-05-22 14:14:50.875'),('e873462d-97bf-428a-ab23-e9eb7ddd5b15','be0cf5e6-e46e-4fa4-9b20-0d5b418abdbc',NULL,'Your project status has been updated to accepted',0,'2025-05-25 13:15:01.548'),('e8def897-0db6-4e52-84b7-55cfc18969dd',NULL,'e5b403d0-5a6b-4dfa-8795-95dea5a887d5','Project #1dde8e9c has been cancelled by the client',0,'2025-05-20 14:49:46.307'),('e9bbad67-1635-49a3-8d1a-feb88d696aa6','634c4c59-1b77-406e-a8bb-58a672da8e43',NULL,'Client from project #81bf2f1e give you 5 rating',1,'2025-05-21 15:33:31.861'),('eac697cc-5e4b-422c-a446-3e8ba6163f6e','58508ba1-f76a-4b86-b459-cc3db2caba0d',NULL,'Your project status has been updated to completed',0,'2025-05-22 14:18:46.479'),('f2789448-a5fb-4215-8a48-5685e8d0731d','634c4c59-1b77-406e-a8bb-58a672da8e43',NULL,'Client from project #4588d0a5 give you 5 rating',0,'2025-05-22 14:19:34.354'),('f40ccc16-90ea-4fea-826c-1840a495d32a','be0cf5e6-e46e-4fa4-9b20-0d5b418abdbc','3eb13756-d67c-46ae-9970-48d939422999','Anda memiliki order baru dari bilal alghifari ',1,'2025-05-27 13:19:16.362'),('f84c29c1-c2bb-4248-9f3b-c872c6ab71a1','be0cf5e6-e46e-4fa4-9b20-0d5b418abdbc','3eb13756-d67c-46ae-9970-48d939422999','Anda memiliki order baru dari jarot',0,'2025-05-27 08:41:53.036');
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `workerId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('PENDING','ACCEPTED','IN_PROGRESS','COMPLETED','CANCELLED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `date` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `budget` double NOT NULL,
  `userConfirmed` tinyint(1) NOT NULL DEFAULT '0',
  `deadline` int NOT NULL DEFAULT '7',
  PRIMARY KEY (`id`),
  KEY `Order_userId_fkey` (`userId`),
  KEY `Order_workerId_fkey` (`workerId`),
  CONSTRAINT `Order_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `Order_workerId_fkey` FOREIGN KEY (`workerId`) REFERENCES `worker` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES ('005a103d-cdee-4a88-9276-401e6af77c54','be0cf5e6-e46e-4fa4-9b20-0d5b418abdbc','3eb13756-d67c-46ae-9970-48d939422999','CANCELLED','2025-05-27 08:03:38.745','Benerin pintu bolong',200000,0,7),('0507ba1f-b713-45f7-93f8-5fb0e5ea10e8','be0cf5e6-e46e-4fa4-9b20-0d5b418abdbc','079aecef-4a4a-40e8-a74a-df129ba1d899','ACCEPTED','2025-05-25 13:14:26.208','benerin gendeng',150000,0,7),('1dde8e9c-2b79-420d-aa4e-e0290f674eb4','634c4c59-1b77-406e-a8bb-58a672da8e43','e5b403d0-5a6b-4dfa-8795-95dea5a887d5','CANCELLED','2025-05-20 14:36:50.565','Saya mau order kak!',20000,0,7),('3e9cee34-9bb7-4852-ac1e-87b426416f7f','be0cf5e6-e46e-4fa4-9b20-0d5b418abdbc','079aecef-4a4a-40e8-a74a-df129ba1d899','ACCEPTED','2025-05-23 06:18:42.615','benerin panci soak',200000,0,7),('4588d0a5-b30a-4495-a190-a47e26f0ee07','58508ba1-f76a-4b86-b459-cc3db2caba0d','cad0002d-b5a8-483c-8ffe-5abf4c4e450e','COMPLETED','2025-05-22 14:14:50.857','test',200000,1,7),('5946dc52-eb4d-49e8-9b32-3053ab287825','23a33ea1-65b2-431b-8fca-bbd95cad83c5','3eb13756-d67c-46ae-9970-48d939422999','ACCEPTED','2025-05-27 08:05:48.541','benerin pintu bolong',200000,0,7),('81bf2f1e-4927-44db-bfae-c02a10634a2e','58508ba1-f76a-4b86-b459-cc3db2caba0d','cad0002d-b5a8-483c-8ffe-5abf4c4e450e','COMPLETED','2025-05-20 15:53:14.102','Saya mau order kak!',200000,1,3),('8b2e8152-d71a-4d8f-999f-97395d1756b6','58508ba1-f76a-4b86-b459-cc3db2caba0d','cad0002d-b5a8-483c-8ffe-5abf4c4e450e','IN_PROGRESS','2025-05-12 13:46:29.996','detail project',200000,0,7),('a1e9353d-e796-4122-aaed-e83f99ba6425','23a33ea1-65b2-431b-8fca-bbd95cad83c5','3eb13756-d67c-46ae-9970-48d939422999','ACCEPTED','2025-05-27 08:41:53.011','adadawdad',20000,0,7),('aa2672b8-f7c5-41bc-8bcb-ab404c2606d6','be0cf5e6-e46e-4fa4-9b20-0d5b418abdbc','079aecef-4a4a-40e8-a74a-df129ba1d899','ACCEPTED','2025-05-25 14:02:20.153','test',150000,0,7),('c051d6e5-ee77-4772-a1aa-0c3ecaace8a7','b7e986bc-f0a2-4c05-b359-6a9124dbf5e5','3eb13756-d67c-46ae-9970-48d939422999','ACCEPTED','2025-05-27 13:19:16.289','benerin pintu mas',250000,0,7),('c909f943-904a-4cee-ae21-fc7b7df0c0d8','58508ba1-f76a-4b86-b459-cc3db2caba0d','cad0002d-b5a8-483c-8ffe-5abf4c4e450e','COMPLETED','2025-05-11 10:34:06.813','Saya mau buat web',60,1,7);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `orderId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('PENDING','PAID','FAILED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `paidAt` datetime(3) DEFAULT NULL,
  `amount` double NOT NULL,
  `paymentReference` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirectUrl` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `snapToken` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Payment_orderId_key` (`orderId`),
  KEY `Payment_userId_fkey` (`userId`),
  CONSTRAINT `Payment_orderId_fkey` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `Payment_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES ('0933adc0-ddb7-4ad2-a328-a8332581b1b7','3e9cee34-9bb7-4852-ac1e-87b426416f7f','be0cf5e6-e46e-4fa4-9b20-0d5b418abdbc','MIDTRANS','PAID',NULL,200000,'PRJ-3e9cee34-1748181567745','https://app.sandbox.midtrans.com/snap/v4/redirection/08821672-f2ef-4d34-a606-96e364036ed0','08821672-f2ef-4d34-a606-96e364036ed0'),('4c67b67e-66c0-408c-a461-b3e9c16322e9','a1e9353d-e796-4122-aaed-e83f99ba6425','23a33ea1-65b2-431b-8fca-bbd95cad83c5','MIDTRANS','PAID',NULL,20000,'PRJ-a1e9353d-1748335401112','https://app.sandbox.midtrans.com/snap/v4/redirection/84a3c463-99e8-47e5-8b65-cb34b3530c04','84a3c463-99e8-47e5-8b65-cb34b3530c04'),('58832f44-accf-4991-8820-917157006e5b','0507ba1f-b713-45f7-93f8-5fb0e5ea10e8','be0cf5e6-e46e-4fa4-9b20-0d5b418abdbc','MIDTRANS','PENDING',NULL,150000,'PRJ-0507ba1f-1748180785704','https://app.midtrans.com/snap/v4/redirection/940b4101-831c-4a19-b6ec-48e4fd31a466','940b4101-831c-4a19-b6ec-48e4fd31a466'),('7eefa670-785a-46b5-93a0-364037d6074e','5946dc52-eb4d-49e8-9b32-3053ab287825','23a33ea1-65b2-431b-8fca-bbd95cad83c5','MIDTRANS','PENDING',NULL,200000,'PRJ-5946dc52-1748333192719','https://app.sandbox.midtrans.com/snap/v4/redirection/b538069e-7a65-4a92-8178-67c50130b169','b538069e-7a65-4a92-8178-67c50130b169'),('ac51f101-4e2d-45a0-b474-e9d5ff4f9ed4','8b2e8152-d71a-4d8f-999f-97395d1756b6','58508ba1-f76a-4b86-b459-cc3db2caba0d','MIDTRANS','PAID','2025-05-22 21:16:46.000',200000,'PRJ-8b2e8152-1747057818903','https://app.midtrans.com/snap/v4/redirection/f3383aea-006e-42fd-9d9d-32a4d8d1bc23','f3383aea-006e-42fd-9d9d-32a4d8d1bc23'),('b382b180-025e-4ba0-8a0d-f5c7ff4091a1','aa2672b8-f7c5-41bc-8bcb-ab404c2606d6','be0cf5e6-e46e-4fa4-9b20-0d5b418abdbc','MIDTRANS','PENDING',NULL,150000,'PRJ-aa2672b8-1748181870710','https://app.sandbox.midtrans.com/snap/v4/redirection/8030f27b-5367-47a9-b8a1-4bdbfeb45a4d','8030f27b-5367-47a9-b8a1-4bdbfeb45a4d'),('ca904f89-4d94-48e4-8d5b-25e296678262','81bf2f1e-4927-44db-bfae-c02a10634a2e','58508ba1-f76a-4b86-b459-cc3db2caba0d','MIDTRANS','PAID','2025-05-20 22:55:54.000',200000,'PRJ-81bf2f1e-1747756484962','https://app.midtrans.com/snap/v4/redirection/267f1ae8-dcef-45ae-a58e-edc9f728b6b7','267f1ae8-dcef-45ae-a58e-edc9f728b6b7'),('d7b9a6d5-cc69-4450-81e2-f9262afa74d1','c051d6e5-ee77-4772-a1aa-0c3ecaace8a7','b7e986bc-f0a2-4c05-b359-6a9124dbf5e5','MIDTRANS','PENDING',NULL,250000,'PRJ-c051d6e5-1748352026578','https://app.sandbox.midtrans.com/snap/v4/redirection/a06be4aa-327c-4155-a329-53305b8e388e','a06be4aa-327c-4155-a329-53305b8e388e'),('e36159d7-410a-4525-96f5-63ab3d6fad29','4588d0a5-b30a-4495-a190-a47e26f0ee07','58508ba1-f76a-4b86-b459-cc3db2caba0d','MIDTRANS','PAID','2025-05-22 21:17:13.000',200000,'PRJ-4588d0a5-1747923383342','https://app.midtrans.com/snap/v4/redirection/c7f55ce1-7b67-431d-9a72-f5c38b19810b','c7f55ce1-7b67-431d-9a72-f5c38b19810b'),('f9bdbd07-2d2c-43d5-a0ab-1ba7a6a79776','c909f943-904a-4cee-ae21-fc7b7df0c0d8','58508ba1-f76a-4b86-b459-cc3db2caba0d','MIDTRANS','PAID','2025-05-11 17:39:42.000',60,'PRJ-c909f943-1746959933263','https://app.midtrans.com/snap/v4/redirection/cd42b2b4-ec01-477c-9c7d-928f183aef4a','cd42b2b4-ec01-477c-9c7d-928f183aef4a');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `orderId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int NOT NULL,
  `comment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  UNIQUE KEY `Rating_orderId_key` (`orderId`),
  CONSTRAINT `Rating_orderId_fkey` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES ('3837f03c-fd0f-4038-a156-465bed449396','c909f943-904a-4cee-ae21-fc7b7df0c0d8',3,'pengerjaan ok','2025-05-21 15:31:24.975'),('79ab15f6-91e5-4274-abfb-0a7fcd6fc755','4588d0a5-b30a-4495-a190-a47e26f0ee07',5,'test','2025-05-22 14:19:34.345'),('df7ecf24-a440-4d9e-8c28-12fbcaf43983','81bf2f1e-4927-44db-bfae-c02a10634a2e',5,'oke banget','2025-05-21 15:33:31.847');
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategory`
--

DROP TABLE IF EXISTS `subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategory` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoryId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `SubCategory_categoryId_fkey` (`categoryId`),
  CONSTRAINT `SubCategory_categoryId_fkey` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategory`
--

LOCK TABLES `subcategory` WRITE;
/*!40000 ALTER TABLE `subcategory` DISABLE KEYS */;
INSERT INTO `subcategory` VALUES ('0ce1c181-8b41-4a8c-95f2-4a61377191ba','Cat Rumah','089322f6-ecfa-4987-b537-d44c6d2574af'),('2ba8298f-4067-4b93-b979-97e8e0963417','Bangunan','089322f6-ecfa-4987-b537-d44c6d2574af'),('4adae7fc-9e09-4a7e-a8c9-d8e3bddfce74','Ac','6fd520b8-1969-4a16-8930-39ba14c55b45'),('5831490d-cdbf-4906-8472-9c20d23da7a2','Tv','6fd520b8-1969-4a16-8930-39ba14c55b45'),('5d6f238e-ae1b-4389-982c-60997e16158d','Ganti Ban','c9b02c4e-4d77-4dc0-be9a-7a4b9e16a2f8'),('838e0d93-5c5c-418a-bb30-7df2d97700eb','benerin panci','e6a63cb8-e34a-4506-8103-94536cec6e81'),('88e8788b-d35d-456e-8a77-bac5155736ca','Radio Klasik','6fd520b8-1969-4a16-8930-39ba14c55b45'),('a767d400-1790-404a-8269-39225dd35033','nyapu halaman','e6a63cb8-e34a-4506-8103-94536cec6e81');
/*!40000 ALTER TABLE `subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_pic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('user','admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  PRIMARY KEY (`id`),
  UNIQUE KEY `User_email_key` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('01d46441-9c02-4e6a-afae-ac7f242e03c1','mahmood','mahmood@gmail.com','$2b$10$gOa/E5VwyETtgHZcsadYOeT2Pk6V21zkN2oOTrDnyirxVi8ZyvUHu','082280994738','arab','/uploads/1747155814221_mahmood.jpg','male','user'),('23a33ea1-65b2-431b-8fca-bbd95cad83c5','jarot','muhammadarif30922@gmail.com','$2b$10$NUo5AUCuF.WACbCsi0gP6uyv2RscrKL8vUw0kE6BaYDsUxdx.NAPe','0899982212','Purwokerto',NULL,'male','user'),('58508ba1-f76a-4b86-b459-cc3db2caba0d','Husein Wibowo','husein@gmail.com','$2b$10$e2aLncxqRLLQ/Jpcc4wV6ea5VaKS9HneukQOji6InGpT4gCf8MTgW','082280994738','Sindangbarang Kec. Bogor Bar. Kota Bogor Jawa Barat','/uploads/1746930030068_avatar-1.png','perempuan','user'),('634c4c59-1b77-406e-a8bb-58a672da8e43','gemasajaa','bocilpes523@gmail.com','$2b$10$sw6u4kRHiKd/Gog4r9cefeEoVDIdH9sfX3dtH5.gktn9QXrFFwXxq','08966988765','Jl Desa Wiradadi Rt 4 Rw 2 Kecamatan Sokaraja','/uploads/1746670634785_WhatsApp_Image_2025-04-04_at_10.20.14-removebg-preview.png','laki-laki','user'),('8949fbd8-8530-4dd3-99fb-2a2b3cdcfecc','RAHMAT AGEM PRATAMA','admin@gmail.com','$2b$10$3x/Zv2eRYjtJncx4UAMFOOdqIrbmSWi7gTMSEDsgNuLlelEuz3xou','08966988765','Jl. Kandang Mas 3 Rt 20 Rw 06',NULL,'male','admin'),('98edbb52-aeb9-49e1-a4ff-d69b0c6c9d46','muhammadarif','muhammadarif@gmail.com','$2b$10$npvMRFTwYi.f3kZwfmkYSO74yKM.K/43k6.HAsjcXFKfmhTLlxKiG','89669751283','jl sawo',NULL,'laki-laki','user'),('9d50bf6b-7015-489a-b5eb-25747ba1e8c4','aripsuitest','aripsuitest@gmail.com','$2b$10$tz0HcOU3L.OEmqg9WbpEau36oKzB6wlGZluFLdT1yrx3SkFUdsGFq','08766756251','Jl pintu air 1 no 5',NULL,'male','user'),('b7e986bc-f0a2-4c05-b359-6a9124dbf5e5','bilal alghifari ','bilalalghifari@gmail.com','$2b$10$PCcG6JowGeeUE4ihbD9uDOBc84TpkUgL5oxBXFnps4oMGU7MeozmW','89669751283','Jl Pintu Air 1 no 5',NULL,'male','user'),('be0cf5e6-e46e-4fa4-9b20-0d5b418abdbc','ajax','kurtingsuitest@gmail.com','$2b$10$7Uqma3NFnS3z5JbaCs80o.d0e2xWtKxLJ1ndCtbuQz9f3cxvK/ipy','085772509918','Jl desa wiradadi','/uploads/1748332357840_image-2.jpg','male','user'),('c20a1c11-eaee-448e-8e12-7e8f91922052','newaccount','newaccount@gmail.com','$2b$10$mxa8sowTMeOOv7tlHXYZzOROiJA7CxGMTcCymCqAsiHxLeOUNCg4.','082280994738','indonesia',NULL,'male','user');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker`
--

DROP TABLE IF EXISTS `worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `worker` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `banner` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Worker_userId_key` (`userId`),
  CONSTRAINT `Worker_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker`
--

LOCK TABLES `worker` WRITE;
/*!40000 ALTER TABLE `worker` DISABLE KEYS */;
INSERT INTO `worker` VALUES ('079aecef-4a4a-40e8-a74a-df129ba1d899','23a33ea1-65b2-431b-8fca-bbd95cad83c5','Servis Tv [Tv]','active',NULL),('08f69053-475c-4e16-af8f-5c2f839a0407','c20a1c11-eaee-448e-8e12-7e8f91922052','saya bisa bantu anda [Cat Rumah, Bangunan]','active',NULL),('3eb13756-d67c-46ae-9970-48d939422999','be0cf5e6-e46e-4fa4-9b20-0d5b418abdbc','Memperbaiki rumah dengan baik dan benar [Cat Rumah, Bangunan]','active',NULL),('c64b6b68-9a1a-47c4-9e5b-a01fc4b8a176','01d46441-9c02-4e6a-afae-ac7f242e03c1','Haloo, Nama Saya Mahmood','active',NULL),('cad0002d-b5a8-483c-8ffe-5abf4c4e450e','634c4c59-1b77-406e-a8bb-58a672da8e43','Helloworld, this is gema! [Ac, Tv, Radio Klasik]','active','/uploads/1746937097233_Porto-Kemasan-8-scaled.jpg'),('e5b403d0-5a6b-4dfa-8795-95dea5a887d5','58508ba1-f76a-4b86-b459-cc3db2caba0d','Helloworld, Saya Husein','active',NULL);
/*!40000 ALTER TABLE `worker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workercategory`
--

DROP TABLE IF EXISTS `workercategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workercategory` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `workerId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoryId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `WorkerCategory_workerId_fkey` (`workerId`),
  KEY `WorkerCategory_categoryId_fkey` (`categoryId`),
  CONSTRAINT `WorkerCategory_categoryId_fkey` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `WorkerCategory_workerId_fkey` FOREIGN KEY (`workerId`) REFERENCES `worker` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workercategory`
--

LOCK TABLES `workercategory` WRITE;
/*!40000 ALTER TABLE `workercategory` DISABLE KEYS */;
INSERT INTO `workercategory` VALUES ('05ee4fe3-a69f-4cb2-ae27-8124ab0733a6','079aecef-4a4a-40e8-a74a-df129ba1d899','6fd520b8-1969-4a16-8930-39ba14c55b45'),('21d360ab-3507-4bf9-a792-fbb9eade7f0a','c64b6b68-9a1a-47c4-9e5b-a01fc4b8a176','089322f6-ecfa-4987-b537-d44c6d2574af'),('4d0eb76d-cf54-4228-8050-a76d5d6cb213','3eb13756-d67c-46ae-9970-48d939422999','089322f6-ecfa-4987-b537-d44c6d2574af'),('68f3151b-8cdd-42f0-b670-b6fb49866231','e5b403d0-5a6b-4dfa-8795-95dea5a887d5','089322f6-ecfa-4987-b537-d44c6d2574af'),('c821c8b8-91ec-4cf6-ba5e-3bd280db8ce4','08f69053-475c-4e16-af8f-5c2f839a0407','089322f6-ecfa-4987-b537-d44c6d2574af'),('df034235-fa0c-4bfa-aae5-31cddf5b6eb6','cad0002d-b5a8-483c-8ffe-5abf4c4e450e','6fd520b8-1969-4a16-8930-39ba14c55b45');
/*!40000 ALTER TABLE `workercategory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-02 22:18:35
