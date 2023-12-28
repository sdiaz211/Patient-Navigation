CREATE DATABASE  IF NOT EXISTS `projectdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `projectdb`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: projectdb
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `aliquot_data`
--

DROP TABLE IF EXISTS `aliquot_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aliquot_data` (
  `sample_id` int NOT NULL,
  `id` int NOT NULL,
  `material` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sample_id` (`sample_id`),
  CONSTRAINT `aliquot_data_ibfk_1` FOREIGN KEY (`sample_id`) REFERENCES `sample_data` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aliquot_data`
--

LOCK TABLES `aliquot_data` WRITE;
/*!40000 ALTER TABLE `aliquot_data` DISABLE KEYS */;
INSERT INTO `aliquot_data` VALUES (65349,23162,'stool'),(12130,26697,'stool'),(82748,28458,'stool'),(50685,38165,'stool'),(43283,40575,'stool'),(29792,45148,'stool'),(55253,47243,'stool'),(94301,50837,'stool'),(43441,52249,'stool'),(31508,57524,'stool'),(73337,60164,'stool'),(45477,62034,'stool'),(53207,62750,'stool'),(93328,87693,'stool'),(62492,88029,'stool'),(22714,88076,'stool'),(56254,88647,'stool'),(21100,93972,'stool'),(33591,98306,'stool');
/*!40000 ALTER TABLE `aliquot_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add study',7,'add_study'),(26,'Can change study',7,'change_study'),(27,'Can delete study',7,'delete_study'),(28,'Can view study',7,'view_study');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'website','study');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-12-28 03:28:41.098963'),(2,'auth','0001_initial','2023-12-28 03:28:41.450549'),(3,'admin','0001_initial','2023-12-28 03:28:41.531510'),(4,'admin','0002_logentry_remove_auto_add','2023-12-28 03:28:41.537510'),(5,'admin','0003_logentry_add_action_flag_choices','2023-12-28 03:28:41.542510'),(6,'contenttypes','0002_remove_content_type_name','2023-12-28 03:28:41.591283'),(7,'auth','0002_alter_permission_name_max_length','2023-12-28 03:28:41.630278'),(8,'auth','0003_alter_user_email_max_length','2023-12-28 03:28:41.646552'),(9,'auth','0004_alter_user_username_opts','2023-12-28 03:28:41.652551'),(10,'auth','0005_alter_user_last_login_null','2023-12-28 03:28:41.714285'),(11,'auth','0006_require_contenttypes_0002','2023-12-28 03:28:41.717284'),(12,'auth','0007_alter_validators_add_error_messages','2023-12-28 03:28:41.722288'),(13,'auth','0008_alter_user_username_max_length','2023-12-28 03:28:41.762020'),(14,'auth','0009_alter_user_last_name_max_length','2023-12-28 03:28:41.805492'),(15,'auth','0010_alter_group_name_max_length','2023-12-28 03:28:41.819490'),(16,'auth','0011_update_proxy_permissions','2023-12-28 03:28:41.825059'),(17,'auth','0012_alter_user_first_name_max_length','2023-12-28 03:28:41.861478'),(18,'sessions','0001_initial','2023-12-28 03:28:41.884481'),(19,'website','0001_initial','2023-12-28 10:24:10.479080'),(20,'website','0002_rename_id2_study_identification','2023-12-28 10:24:10.489979');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_data`
--

DROP TABLE IF EXISTS `patient_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_data` (
  `study_id` int NOT NULL,
  `id` int NOT NULL,
  `sex` varchar(1) NOT NULL,
  `age` int NOT NULL,
  `is_consent` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Patient_data` (`study_id`),
  CONSTRAINT `Patient_data` FOREIGN KEY (`study_id`) REFERENCES `study_data` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_data`
--

LOCK TABLES `patient_data` WRITE;
/*!40000 ALTER TABLE `patient_data` DISABLE KEYS */;
INSERT INTO `patient_data` VALUES (4,10763,'F',98,'True'),(28,11143,'M',59,'True'),(28,11850,'F',13,'False'),(66,19644,'F',0,'False'),(28,20195,'M',30,'True'),(28,26477,'F',12,'False'),(66,29895,'M',91,'True'),(4,46241,'F',66,'True'),(66,47298,'F',87,'True'),(4,51260,'F',11,'False'),(28,52127,'F',38,'True'),(28,52432,'F',2,'False'),(66,56274,'F',88,'False'),(28,59999,'F',36,'False'),(4,62906,'F',26,'True'),(4,67700,'M',78,'True'),(28,68930,'F',36,'True'),(66,78503,'M',32,'True'),(4,83648,'F',90,'False'),(28,83664,'M',91,'False'),(28,88087,'M',64,'True'),(28,95169,'M',55,'True');
/*!40000 ALTER TABLE `patient_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sample_data`
--

DROP TABLE IF EXISTS `sample_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sample_data` (
  `study_id` int NOT NULL,
  `patient_id` int NOT NULL,
  `id` int NOT NULL,
  `material` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `study_id` (`study_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `sample_data_ibfk_1` FOREIGN KEY (`study_id`) REFERENCES `study_data` (`id`),
  CONSTRAINT `sample_data_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patient_data` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sample_data`
--

LOCK TABLES `sample_data` WRITE;
/*!40000 ALTER TABLE `sample_data` DISABLE KEYS */;
INSERT INTO `sample_data` VALUES (66,47298,12130,'stool'),(28,68930,21100,'stool'),(28,11850,22714,'stool'),(28,11143,29792,'stool'),(4,83648,31508,'stool'),(28,59999,33591,'stool'),(28,88087,43283,'stool'),(28,52432,43441,'stool'),(66,19644,45477,'stool'),(28,95169,50685,'stool'),(28,83664,53207,'stool'),(4,51260,55253,'stool'),(66,56274,56254,'stool'),(4,67700,62492,'stool'),(66,29895,65349,'stool'),(4,46241,73337,'stool'),(4,10763,82748,'stool'),(28,26477,93328,'stool'),(28,52127,94301,'stool');
/*!40000 ALTER TABLE `sample_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `study_1`
--

DROP TABLE IF EXISTS `study_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `study_1` (
  `study_id` int NOT NULL,
  `age` int NOT NULL,
  `data` int NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_1`
--

LOCK TABLES `study_1` WRITE;
/*!40000 ALTER TABLE `study_1` DISABLE KEYS */;
INSERT INTO `study_1` VALUES (4,11,832,'Protein Quantification - Zonulin'),(4,66,821,'Protein Quantification - Zonulin'),(4,78,585,'Protein Quantification - Zonulin'),(4,90,127,'Protein Quantification - Zonulin'),(4,98,502,'Protein Quantification - Zonulin');
/*!40000 ALTER TABLE `study_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `study_2`
--

DROP TABLE IF EXISTS `study_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `study_2` (
  `study_id` int NOT NULL,
  `age` int NOT NULL,
  `data` int NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_2`
--

LOCK TABLES `study_2` WRITE;
/*!40000 ALTER TABLE `study_2` DISABLE KEYS */;
INSERT INTO `study_2` VALUES (28,2,114,'Protein Quantification - Zonulin'),(28,12,897,'Protein Quantification - Zonulin'),(28,13,128,'Protein Quantification - Zonulin'),(28,36,21,'Protein Quantification - Zonulin'),(28,36,44,'Protein Quantification - Zonulin'),(28,38,456,'Protein Quantification - Zonulin'),(28,55,411,'Protein Quantification - Zonulin'),(28,59,498,'Protein Quantification - Zonulin'),(28,64,699,'Protein Quantification - Zonulin'),(28,91,602,'Protein Quantification - Zonulin');
/*!40000 ALTER TABLE `study_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `study_3`
--

DROP TABLE IF EXISTS `study_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `study_3` (
  `study_id` int NOT NULL,
  `age` int NOT NULL,
  `data` int NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_3`
--

LOCK TABLES `study_3` WRITE;
/*!40000 ALTER TABLE `study_3` DISABLE KEYS */;
INSERT INTO `study_3` VALUES (66,0,916,'Protein Quantification - Zonulin'),(66,87,342,'Protein Quantification - Zonulin'),(66,88,185,'Protein Quantification - Zonulin'),(66,91,91,'Protein Quantification - Zonulin');
/*!40000 ALTER TABLE `study_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `study_data`
--

DROP TABLE IF EXISTS `study_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `study_data` (
  `id` int NOT NULL,
  `researcher` varchar(50) NOT NULL,
  `num_target_patients` int NOT NULL,
  `num_recorded_patients` int NOT NULL,
  `num_target_samples` int NOT NULL,
  `num_samples_collected` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `researcher` (`researcher`),
  CONSTRAINT `study_data_chk_1` CHECK ((`num_recorded_patients` <= `num_target_patients`)),
  CONSTRAINT `study_data_chk_2` CHECK ((`num_samples_collected` <= `num_target_samples`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_data`
--

LOCK TABLES `study_data` WRITE;
/*!40000 ALTER TABLE `study_data` DISABLE KEYS */;
INSERT INTO `study_data` VALUES (4,'Nguyen',18,6,30,5),(28,'Brown',12,11,22,10),(66,'Ross',7,5,12,4);
/*!40000 ALTER TABLE `study_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_data`
--

DROP TABLE IF EXISTS `test_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_data` (
  `type` varchar(50) NOT NULL,
  `data` int NOT NULL,
  `aliquot_id` int NOT NULL,
  PRIMARY KEY (`aliquot_id`),
  CONSTRAINT `test_data_ibfk_1` FOREIGN KEY (`aliquot_id`) REFERENCES `aliquot_data` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_data`
--

LOCK TABLES `test_data` WRITE;
/*!40000 ALTER TABLE `test_data` DISABLE KEYS */;
INSERT INTO `test_data` VALUES ('Protein Quantification - Zonulin',91,23162),('Protein Quantification - Zonulin',342,26697),('Protein Quantification - Zonulin',502,28458),('Protein Quantification - Zonulin',411,38165),('Protein Quantification - Zonulin',699,40575),('Protein Quantification - Zonulin',498,45148),('Protein Quantification - Zonulin',832,47243),('Protein Quantification - Zonulin',456,50837),('Protein Quantification - Zonulin',114,52249),('Protein Quantification - Zonulin',127,57524),('Protein Quantification - Zonulin',821,60164),('Protein Quantification - Zonulin',916,62034),('Protein Quantification - Zonulin',602,62750),('Protein Quantification - Zonulin',897,87693),('Protein Quantification - Zonulin',585,88029),('Protein Quantification - Zonulin',128,88076),('Protein Quantification - Zonulin',185,88647),('Protein Quantification - Zonulin',44,93972),('Protein Quantification - Zonulin',21,98306);
/*!40000 ALTER TABLE `test_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_study`
--

DROP TABLE IF EXISTS `website_study`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website_study` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `identification` int NOT NULL,
  `researcher` varchar(50) NOT NULL,
  `num_target_patients` int NOT NULL,
  `num_recorded_patients` int NOT NULL,
  `num_target_samples` int NOT NULL,
  `num_samples_collected` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_study`
--

LOCK TABLES `website_study` WRITE;
/*!40000 ALTER TABLE `website_study` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_study` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'projectdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-28  9:54:33
