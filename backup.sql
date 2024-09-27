-- MySQL dump 10.13  Distrib 5.7.44, for osx10.19 (x86_64)
--
-- Host: localhost    Database: emoreco_app_development
-- ------------------------------------------------------
-- Server version	5.7.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2024-09-16 10:46:44.655646','2024-09-16 10:46:44.655646');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emotion_lvs`
--

DROP TABLE IF EXISTS `emotion_lvs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emotion_lvs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `level` int(11) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emotion_lvs`
--

LOCK TABLES `emotion_lvs` WRITE;
/*!40000 ALTER TABLE `emotion_lvs` DISABLE KEYS */;
INSERT INTO `emotion_lvs` VALUES (1,1,'2020-02-02 00:00:00.000000','2020-02-02 00:00:00.000000'),(2,2,'2020-02-02 00:00:00.000000','2020-02-02 00:00:00.000000'),(3,3,'2020-02-02 00:00:00.000000','2020-02-02 00:00:00.000000'),(4,4,'2020-02-02 00:00:00.000000','2020-02-02 00:00:00.000000'),(5,5,'2020-02-02 00:00:00.000000','2020-02-02 00:00:00.000000'),(6,6,'2020-02-02 00:00:00.000000','2020-02-02 00:00:00.000000'),(7,7,'2020-02-02 00:00:00.000000','2020-02-02 00:00:00.000000'),(8,8,'2020-02-02 00:00:00.000000','2020-02-02 00:00:00.000000'),(9,9,'2020-02-02 00:00:00.000000','2020-02-02 00:00:00.000000'),(10,10,'2020-02-02 00:00:00.000000','2020-02-02 00:00:00.000000');
/*!40000 ALTER TABLE `emotion_lvs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `negative_tag_relations`
--

DROP TABLE IF EXISTS `negative_tag_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `negative_tag_relations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `negative_id` bigint(20) NOT NULL,
  `tag_id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_negative_tag_relations_on_negative_id` (`negative_id`),
  KEY `index_negative_tag_relations_on_tag_id` (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `negative_tag_relations`
--

LOCK TABLES `negative_tag_relations` WRITE;
/*!40000 ALTER TABLE `negative_tag_relations` DISABLE KEYS */;
INSERT INTO `negative_tag_relations` VALUES (1,1,1,'2024-09-27 01:44:19.872519','2024-09-27 01:44:19.872519'),(2,1,2,'2024-09-27 01:44:19.878099','2024-09-27 01:44:19.878099');
/*!40000 ALTER TABLE `negative_tag_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `negatives`
--

DROP TABLE IF EXISTS `negatives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `negatives` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `emotion_lv_id` bigint(20) NOT NULL,
  `negative_context` text,
  `user_id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_negatives_on_emotion_lv_id` (`emotion_lv_id`),
  KEY `index_negatives_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_349bd9e84a` FOREIGN KEY (`emotion_lv_id`) REFERENCES `emotion_lvs` (`id`),
  CONSTRAINT `fk_rails_92782a8132` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `negatives`
--

LOCK TABLES `negatives` WRITE;
/*!40000 ALTER TABLE `negatives` DISABLE KEYS */;
/*!40000 ALTER TABLE `negatives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positive_tag_relations`
--

DROP TABLE IF EXISTS `positive_tag_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `positive_tag_relations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `positive_id` bigint(20) NOT NULL,
  `tag_id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_positive_tag_relations_on_positive_id` (`positive_id`),
  KEY `index_positive_tag_relations_on_tag_id` (`tag_id`),
  CONSTRAINT `fk_rails_0b4808b420` FOREIGN KEY (`positive_id`) REFERENCES `positives` (`id`),
  CONSTRAINT `fk_rails_cdbb706a59` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positive_tag_relations`
--

LOCK TABLES `positive_tag_relations` WRITE;
/*!40000 ALTER TABLE `positive_tag_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `positive_tag_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positives`
--

DROP TABLE IF EXISTS `positives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `positives` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `emotion_lv_id` bigint(20) NOT NULL,
  `positive_context` text,
  `user_id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_positives_on_emotion_lv_id` (`emotion_lv_id`),
  KEY `index_positives_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_3e00e3628c` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_rails_5ae0d5ff68` FOREIGN KEY (`emotion_lv_id`) REFERENCES `emotion_lvs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positives`
--

LOCK TABLES `positives` WRITE;
/*!40000 ALTER TABLE `positives` DISABLE KEYS */;
/*!40000 ALTER TABLE `positives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20240916123006'),('20240916123100'),('20240916125202'),('20240917073753'),('20240923031520'),('20240923090657'),('20240923090723'),('20240924133906');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_tags_on_name_and_user_id` (`name`,`user_id`),
  KEY `index_tags_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_e689f6d0cc` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'電車',1,'2024-09-27 01:44:19.863130','2024-09-27 01:44:19.863130'),(2,'バス',1,'2024-09-27 01:44:19.876236','2024-09-27 01:44:19.876236');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime(6) DEFAULT NULL,
  `remember_created_at` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'iruka@iruka','$2a$12$enK1q95RKishjlC0CBeLkOsp8xuPsUOcD4SaGmqLFAsGFMB9Pm51C',NULL,NULL,NULL,'2024-09-17 05:33:22.386417','2024-09-17 05:33:22.386417'),(2,'akuma@akuma','$2a$12$0kk73ywa0dgJ3l1A5OgfkeGNBq0CRp01qFMQiZihbQUo0yjH0ue7y',NULL,NULL,NULL,'2024-09-17 09:31:58.193626','2024-09-17 09:31:58.193626'),(3,'sample@sample','$2a$12$9TZq8iQoGd5AYRdGA2tu5um7y7iexLpI2eHgh.XlmR1sHs5MgBBjO',NULL,NULL,NULL,'2024-09-17 13:03:45.535224','2024-09-17 13:03:45.535224'),(4,'homes@homes','$2a$12$ANwHco8eXhugj5KdKUBK2.cjGGbh0DXtpvm9KMLX7T1/Lc.II7GwK',NULL,NULL,NULL,'2024-09-26 02:32:54.892084','2024-09-26 02:32:54.892084');
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

-- Dump completed on 2024-09-28  0:02:50
