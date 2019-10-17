-- MySQL dump 10.14  Distrib 5.5.60-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: gistandard
-- ------------------------------------------------------
-- Server version	5.5.60-MariaDB

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
-- Table structure for table `adm_asset`
--

DROP TABLE IF EXISTS `adm_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_asset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetNum` varchar(128) COLLATE utf8_bin NOT NULL,
  `brand` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `model` varchar(30) COLLATE utf8_bin NOT NULL,
  `warehouse` varchar(20) COLLATE utf8_bin NOT NULL,
  `price` int(11) DEFAULT NULL,
  `buyDate` date NOT NULL,
  `warrantyDate` date NOT NULL,
  `status` varchar(20) COLLATE utf8_bin NOT NULL,
  `customer` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `operator` varchar(20) COLLATE utf8_bin NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `desc` longtext COLLATE utf8_bin,
  `assetType_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adm_asset_assetType_id_8ff054dc_fk_adm_assettype_id` (`assetType_id`),
  KEY `adm_asset_owner_id_7dbcc0e1_fk_users_userprofile_id` (`owner_id`),
  CONSTRAINT `adm_asset_assetType_id_8ff054dc_fk_adm_assettype_id` FOREIGN KEY (`assetType_id`) REFERENCES `adm_assettype` (`id`),
  CONSTRAINT `adm_asset_owner_id_7dbcc0e1_fk_users_userprofile_id` FOREIGN KEY (`owner_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_asset`
--

LOCK TABLES `adm_asset` WRITE;
/*!40000 ALTER TABLE `adm_asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `adm_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adm_assetfile`
--

DROP TABLE IF EXISTS `adm_assetfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_assetfile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `upload_user` varchar(20) COLLATE utf8_bin NOT NULL,
  `file_content` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `add_time` datetime(6) NOT NULL,
  `asset_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adm_assetfile_asset_id_60c8e487_fk_adm_asset_id` (`asset_id`),
  CONSTRAINT `adm_assetfile_asset_id_60c8e487_fk_adm_asset_id` FOREIGN KEY (`asset_id`) REFERENCES `adm_asset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_assetfile`
--

LOCK TABLES `adm_assetfile` WRITE;
/*!40000 ALTER TABLE `adm_assetfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `adm_assetfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adm_assetlog`
--

DROP TABLE IF EXISTS `adm_assetlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_assetlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operator` varchar(20) COLLATE utf8_bin NOT NULL,
  `desc` longtext COLLATE utf8_bin NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `asset_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `adm_assetlog_asset_id_66a32c81_fk_adm_asset_id` (`asset_id`),
  CONSTRAINT `adm_assetlog_asset_id_66a32c81_fk_adm_asset_id` FOREIGN KEY (`asset_id`) REFERENCES `adm_asset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_assetlog`
--

LOCK TABLES `adm_assetlog` WRITE;
/*!40000 ALTER TABLE `adm_assetlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `adm_assetlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adm_assettype`
--

DROP TABLE IF EXISTS `adm_assettype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_assettype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_bin NOT NULL,
  `desc` longtext COLLATE utf8_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_assettype`
--

LOCK TABLES `adm_assettype` WRITE;
/*!40000 ALTER TABLE `adm_assettype` DISABLE KEYS */;
/*!40000 ALTER TABLE `adm_assettype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adm_customer`
--

DROP TABLE IF EXISTS `adm_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit` varchar(50) COLLATE utf8_bin NOT NULL,
  `address` varchar(100) COLLATE utf8_bin NOT NULL,
  `name` varchar(20) COLLATE utf8_bin NOT NULL,
  `phone` varchar(30) COLLATE utf8_bin NOT NULL,
  `status` tinyint(1) NOT NULL,
  `desc` longtext COLLATE utf8_bin,
  `add_time` datetime(6) NOT NULL,
  `belongs_to_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adm_customer_belongs_to_id_e4e83cb1_fk_users_userprofile_id` (`belongs_to_id`),
  CONSTRAINT `adm_customer_belongs_to_id_e4e83cb1_fk_users_userprofile_id` FOREIGN KEY (`belongs_to_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_customer`
--

LOCK TABLES `adm_customer` WRITE;
/*!40000 ALTER TABLE `adm_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `adm_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adm_equipment`
--

DROP TABLE IF EXISTS `adm_equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_equipment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) COLLATE utf8_bin NOT NULL,
  `equipment_model` varchar(50) COLLATE utf8_bin NOT NULL,
  `buy_date` date NOT NULL,
  `warranty_date` date NOT NULL,
  `accounting` tinyint(1) NOT NULL,
  `config_desc` longtext COLLATE utf8_bin,
  `customer_id` int(11) DEFAULT NULL,
  `equipment_type_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adm_equipment_customer_id_b2df97df_fk_adm_customer_id` (`customer_id`),
  KEY `adm_equipment_equipment_type_id_51991b84_fk_adm_equipmenttype_id` (`equipment_type_id`),
  KEY `adm_equipment_supplier_id_1681cded_fk_adm_supplier_id` (`supplier_id`),
  CONSTRAINT `adm_equipment_customer_id_b2df97df_fk_adm_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `adm_customer` (`id`),
  CONSTRAINT `adm_equipment_equipment_type_id_51991b84_fk_adm_equipmenttype_id` FOREIGN KEY (`equipment_type_id`) REFERENCES `adm_equipmenttype` (`id`),
  CONSTRAINT `adm_equipment_supplier_id_1681cded_fk_adm_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `adm_supplier` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_equipment`
--

LOCK TABLES `adm_equipment` WRITE;
/*!40000 ALTER TABLE `adm_equipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `adm_equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adm_equipment_service_info`
--

DROP TABLE IF EXISTS `adm_equipment_service_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_equipment_service_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `equipment_id` int(11) NOT NULL,
  `serviceinfo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `adm_equipment_service_in_equipment_id_serviceinfo_eb6d8cdc_uniq` (`equipment_id`,`serviceinfo_id`),
  KEY `adm_equipment_servic_serviceinfo_id_164b58fe_fk_adm_servi` (`serviceinfo_id`),
  CONSTRAINT `adm_equipment_servic_equipment_id_a2dc894b_fk_adm_equip` FOREIGN KEY (`equipment_id`) REFERENCES `adm_equipment` (`id`),
  CONSTRAINT `adm_equipment_servic_serviceinfo_id_164b58fe_fk_adm_servi` FOREIGN KEY (`serviceinfo_id`) REFERENCES `adm_serviceinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_equipment_service_info`
--

LOCK TABLES `adm_equipment_service_info` WRITE;
/*!40000 ALTER TABLE `adm_equipment_service_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `adm_equipment_service_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adm_equipmenttype`
--

DROP TABLE IF EXISTS `adm_equipmenttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_equipmenttype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_bin NOT NULL,
  `desc` longtext COLLATE utf8_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_equipmenttype`
--

LOCK TABLES `adm_equipmenttype` WRITE;
/*!40000 ALTER TABLE `adm_equipmenttype` DISABLE KEYS */;
/*!40000 ALTER TABLE `adm_equipmenttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adm_serviceinfo`
--

DROP TABLE IF EXISTS `adm_serviceinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_serviceinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext COLLATE utf8_bin NOT NULL,
  `is_reminding` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `writer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adm_serviceinfo_writer_id_911d31a1_fk_users_userprofile_id` (`writer_id`),
  CONSTRAINT `adm_serviceinfo_writer_id_911d31a1_fk_users_userprofile_id` FOREIGN KEY (`writer_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_serviceinfo`
--

LOCK TABLES `adm_serviceinfo` WRITE;
/*!40000 ALTER TABLE `adm_serviceinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `adm_serviceinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adm_supplier`
--

DROP TABLE IF EXISTS `adm_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company` varchar(30) COLLATE utf8_bin NOT NULL,
  `address` varchar(100) COLLATE utf8_bin NOT NULL,
  `linkname` varchar(20) COLLATE utf8_bin NOT NULL,
  `phone` varchar(20) COLLATE utf8_bin NOT NULL,
  `status` tinyint(1) NOT NULL,
  `desc` longtext COLLATE utf8_bin,
  `add_time` datetime(6) NOT NULL,
  `belongs_to_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adm_supplier_belongs_to_id_f72b527a_fk_users_userprofile_id` (`belongs_to_id`),
  CONSTRAINT `adm_supplier_belongs_to_id_f72b527a_fk_users_userprofile_id` FOREIGN KEY (`belongs_to_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_supplier`
--

LOCK TABLES `adm_supplier` WRITE;
/*!40000 ALTER TABLE `adm_supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `adm_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can view group',2,'view_group'),(8,'Can view permission',1,'view_permission'),(9,'Can add content type',3,'add_contenttype'),(10,'Can change content type',3,'change_contenttype'),(11,'Can delete content type',3,'delete_contenttype'),(12,'Can view content type',3,'view_contenttype'),(13,'Can add session',4,'add_session'),(14,'Can change session',4,'change_session'),(15,'Can delete session',4,'delete_session'),(16,'Can view session',4,'view_session'),(17,'Can add 用户信息',5,'add_userprofile'),(18,'Can change 用户信息',5,'change_userprofile'),(19,'Can delete 用户信息',5,'delete_userprofile'),(20,'Can add 组织架构',6,'add_structure'),(21,'Can change 组织架构',6,'change_structure'),(22,'Can delete 组织架构',6,'delete_structure'),(23,'Can view 组织架构',6,'view_structure'),(24,'Can view 用户信息',5,'view_userprofile'),(25,'Can add 菜单',7,'add_menu'),(26,'Can change 菜单',7,'change_menu'),(27,'Can delete 菜单',7,'delete_menu'),(28,'Can add 角色',8,'add_role'),(29,'Can change 角色',8,'change_role'),(30,'Can delete 角色',8,'delete_role'),(31,'Can view 菜单',7,'view_menu'),(32,'Can view 角色',8,'view_role'),(33,'Can add 发件邮箱设置',9,'add_emailsetup'),(34,'Can change 发件邮箱设置',9,'change_emailsetup'),(35,'Can delete 发件邮箱设置',9,'delete_emailsetup'),(36,'Can add 系统设置',10,'add_systemsetup'),(37,'Can change 系统设置',10,'change_systemsetup'),(38,'Can delete 系统设置',10,'delete_systemsetup'),(39,'Can view 发件邮箱设置',9,'view_emailsetup'),(40,'Can view 系统设置',10,'view_systemsetup'),(41,'Can add 资产管理',11,'add_asset'),(42,'Can change 资产管理',11,'change_asset'),(43,'Can delete 资产管理',11,'delete_asset'),(44,'Can add asset file',12,'add_assetfile'),(45,'Can change asset file',12,'change_assetfile'),(46,'Can delete asset file',12,'delete_assetfile'),(47,'Can add asset log',13,'add_assetlog'),(48,'Can change asset log',13,'change_assetlog'),(49,'Can delete asset log',13,'delete_assetlog'),(50,'Can add 资产类型',14,'add_assettype'),(51,'Can change 资产类型',14,'change_assettype'),(52,'Can delete 资产类型',14,'delete_assettype'),(53,'Can add 客户管理',15,'add_customer'),(54,'Can change 客户管理',15,'change_customer'),(55,'Can delete 客户管理',15,'delete_customer'),(56,'Can add 设备管理',16,'add_equipment'),(57,'Can change 设备管理',16,'change_equipment'),(58,'Can delete 设备管理',16,'delete_equipment'),(59,'Can add 设备类型',17,'add_equipmenttype'),(60,'Can change 设备类型',17,'change_equipmenttype'),(61,'Can delete 设备类型',17,'delete_equipmenttype'),(62,'Can add service info',18,'add_serviceinfo'),(63,'Can change service info',18,'change_serviceinfo'),(64,'Can delete service info',18,'delete_serviceinfo'),(65,'Can add 分销商管理',19,'add_supplier'),(66,'Can change 分销商管理',19,'change_supplier'),(67,'Can delete 分销商管理',19,'delete_supplier'),(68,'Can view 资产管理',11,'view_asset'),(69,'Can view asset file',12,'view_assetfile'),(70,'Can view asset log',13,'view_assetlog'),(71,'Can view 资产类型',14,'view_assettype'),(72,'Can view 客户管理',15,'view_customer'),(73,'Can view 设备管理',16,'view_equipment'),(74,'Can view 设备类型',17,'view_equipmenttype'),(75,'Can view service info',18,'view_serviceinfo'),(76,'Can view 分销商管理',19,'view_supplier'),(77,'Can add 工单信息',20,'add_workorder'),(78,'Can change 工单信息',20,'change_workorder'),(79,'Can delete 工单信息',20,'delete_workorder'),(80,'Can add 执行记录',21,'add_workorderrecord'),(81,'Can change 执行记录',21,'change_workorderrecord'),(82,'Can delete 执行记录',21,'delete_workorderrecord'),(83,'Can view 工单信息',20,'view_workorder'),(84,'Can view 执行记录',21,'view_workorderrecord'),(85,'Can add Bookmark',22,'add_bookmark'),(86,'Can change Bookmark',22,'change_bookmark'),(87,'Can delete Bookmark',22,'delete_bookmark'),(88,'Can add log entry',23,'add_log'),(89,'Can change log entry',23,'change_log'),(90,'Can delete log entry',23,'delete_log'),(91,'Can add User Setting',24,'add_usersettings'),(92,'Can change User Setting',24,'change_usersettings'),(93,'Can delete User Setting',24,'delete_usersettings'),(94,'Can add User Widget',25,'add_userwidget'),(95,'Can change User Widget',25,'change_userwidget'),(96,'Can delete User Widget',25,'delete_userwidget'),(97,'Can view Bookmark',22,'view_bookmark'),(98,'Can view log entry',23,'view_log'),(99,'Can view User Setting',24,'view_usersettings'),(100,'Can view User Widget',25,'view_userwidget');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8_bin NOT NULL,
  `model` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (11,'adm','asset'),(12,'adm','assetfile'),(13,'adm','assetlog'),(14,'adm','assettype'),(15,'adm','customer'),(16,'adm','equipment'),(17,'adm','equipmenttype'),(18,'adm','serviceinfo'),(19,'adm','supplier'),(2,'auth','group'),(1,'auth','permission'),(3,'contenttypes','contenttype'),(20,'personal','workorder'),(21,'personal','workorderrecord'),(7,'rbac','menu'),(8,'rbac','role'),(4,'sessions','session'),(9,'system','emailsetup'),(10,'system','systemsetup'),(6,'users','structure'),(5,'users','userprofile'),(22,'xadmin','bookmark'),(23,'xadmin','log'),(24,'xadmin','usersettings'),(25,'xadmin','userwidget');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'rbac','0001_initial','2018-06-30 16:56:16.046454'),(2,'contenttypes','0001_initial','2018-06-30 16:56:16.059679'),(3,'contenttypes','0002_remove_content_type_name','2018-06-30 16:56:16.089802'),(4,'auth','0001_initial','2018-06-30 16:56:16.362006'),(5,'auth','0002_alter_permission_name_max_length','2018-06-30 16:56:16.379350'),(6,'auth','0003_alter_user_email_max_length','2018-06-30 16:56:16.385483'),(7,'auth','0004_alter_user_username_opts','2018-06-30 16:56:16.392668'),(8,'auth','0005_alter_user_last_login_null','2018-06-30 16:56:16.399060'),(9,'auth','0006_require_contenttypes_0002','2018-06-30 16:56:16.401779'),(10,'auth','0007_alter_validators_add_error_messages','2018-06-30 16:56:16.407567'),(11,'auth','0008_alter_user_username_max_length','2018-06-30 16:56:16.413679'),(12,'users','0001_initial','2018-06-30 16:56:16.735182'),(13,'adm','0001_initial','2018-06-30 16:56:16.851276'),(14,'adm','0002_auto_20180607_1211','2018-06-30 16:56:17.220104'),(15,'personal','0001_initial','2018-06-30 16:56:17.237795'),(16,'personal','0002_auto_20180607_1211','2018-06-30 16:56:17.526862'),(17,'sessions','0001_initial','2018-06-30 16:56:17.539048'),(18,'system','0001_initial','2018-06-30 16:56:17.555789'),(19,'xadmin','0001_initial','2018-06-30 16:56:17.736810'),(20,'personal','0003_auto_20181212_1642','2018-12-12 16:42:07.000000'),(21,'personal','0004_auto_20181212_1832','2018-12-12 18:32:13.000000'),(22,'personal','0005_auto_20181212_2001','2018-12-12 20:01:17.000000'),(23,'personal','0006_workorder_approver','2018-12-12 21:01:07.000000'),(24,'personal','0007_auto_20181213_1227','2018-12-13 12:27:26.000000'),(25,'personal','0008_auto_20181213_1550','2018-12-25 17:21:57.000000'),(26,'personal','0009_auto_20181218_1053','2018-12-25 17:21:58.000000'),(27,'personal','0010_auto_20181218_1549','2018-12-25 17:21:58.000000'),(28,'users','0002_auto_20181225_1912','2018-12-25 19:12:52.000000');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_bin NOT NULL,
  `session_data` longtext COLLATE utf8_bin NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('9gpcjawiye5mbda8bso8zro9qav97i1k','OGMyNDZiOTUyNDhiYzUzYTEzMTM1ZmRmZmU0MmQyMjg1MTFhYjNkMjp7Il9hdXRoX3VzZXJfaWQiOiIxNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxZTU4NzgxMGZiYmEwZmE4Zjk1NTRiYzdlNGU5NTRjMDk1NGM0YTRhIn0=','2018-12-12 23:20:27.000000'),('a2dkdwlaksdel18m5qqol3whip3a9vsd','MjY0NmU4OGEzZTg5YWQ2OWVkNzlhNzJlMjM2NmNkZGJkYzA5ZDU3ODp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwZGQzOGZlYmZkMjJlMmJmMGI1ZTkyZjZjY2U0ZDg5NDJhZWIzODdkIn0=','2018-12-13 11:48:33.000000'),('bdyz1gr6lnj9j50gwvfv8y0sff8qfq9g','MTdkOWI5ZjQwNmRmYzcxNjVmNGFhODNjMTMwMWVlZjViOTYwMzM1Zjp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYThmMjI4ZjIyMzcxOGVhMTRhYmNmNzQ1ZDkwNmRkNzQ2NTAzZmJmIn0=','2018-12-12 18:52:52.000000'),('cmenlp1jf01aeb6rp8vcfcqkx3pd5xor','MjY0NmU4OGEzZTg5YWQ2OWVkNzlhNzJlMjM2NmNkZGJkYzA5ZDU3ODp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwZGQzOGZlYmZkMjJlMmJmMGI1ZTkyZjZjY2U0ZDg5NDJhZWIzODdkIn0=','2018-12-13 14:41:18.000000'),('cuxlqls5g6vhi048cri4t530s1h579xz','NDFmZGRmODk4Y2YyYjIzZjAwMjhiNGU1NGVhNGJhZmNhNDE0ZDk0ZDp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNWI0YzJlZDUyODhhY2EyZmEzYWJiMjAxNmFkMDJkZmVhNTNjYzExIn0=','2018-06-30 17:46:52.344255'),('dkhywsllkruzjt0vxrn0e6s53dmk408x','YzA0NTZkZjYwNjVjODk1MzlhMDRiZTYyZjVhYTYyN2FhZjI0Y2RmMDp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5YWIyNzIzNDMxNjIxYTA4ZWM4OGEyYTQyNmQzMzIwZTBhY2Q1MjNkIn0=','2018-12-12 16:56:29.000000'),('g2n5rh7o7op32v2pz3nun7o1uuqt4adf','MjY0NmU4OGEzZTg5YWQ2OWVkNzlhNzJlMjM2NmNkZGJkYzA5ZDU3ODp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwZGQzOGZlYmZkMjJlMmJmMGI1ZTkyZjZjY2U0ZDg5NDJhZWIzODdkIn0=','2018-12-26 10:19:51.000000'),('h3osl9ztxv25ba493b8arf0dksn00mua','MjY0NmU4OGEzZTg5YWQ2OWVkNzlhNzJlMjM2NmNkZGJkYzA5ZDU3ODp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwZGQzOGZlYmZkMjJlMmJmMGI1ZTkyZjZjY2U0ZDg5NDJhZWIzODdkIn0=','2018-12-25 19:41:03.000000'),('ijcbs4wv5ykqzf70nll1wnkuxm6aeeio','MTdkOWI5ZjQwNmRmYzcxNjVmNGFhODNjMTMwMWVlZjViOTYwMzM1Zjp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYThmMjI4ZjIyMzcxOGVhMTRhYmNmNzQ1ZDkwNmRkNzQ2NTAzZmJmIn0=','2018-12-26 14:40:28.000000'),('k3suy33msdd0atoe7tnn83cz8ab5rlwd','OGMyNDZiOTUyNDhiYzUzYTEzMTM1ZmRmZmU0MmQyMjg1MTFhYjNkMjp7Il9hdXRoX3VzZXJfaWQiOiIxNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxZTU4NzgxMGZiYmEwZmE4Zjk1NTRiYzdlNGU5NTRjMDk1NGM0YTRhIn0=','2018-12-26 11:16:17.000000'),('ko9knhz5ry5vesxc8ee2qsj54f3rlunw','MjY0NmU4OGEzZTg5YWQ2OWVkNzlhNzJlMjM2NmNkZGJkYzA5ZDU3ODp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwZGQzOGZlYmZkMjJlMmJmMGI1ZTkyZjZjY2U0ZDg5NDJhZWIzODdkIn0=','2018-12-26 12:28:52.000000'),('oldpn61k94oeklk870hcn8h5wn6dn4nx','MjY0NmU4OGEzZTg5YWQ2OWVkNzlhNzJlMjM2NmNkZGJkYzA5ZDU3ODp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwZGQzOGZlYmZkMjJlMmJmMGI1ZTkyZjZjY2U0ZDg5NDJhZWIzODdkIn0=','2018-12-13 13:45:02.000000'),('oooysx4rtbwdgt8r5cl7naw2tigdc8nx','MWE3ZTFmOWIxOTBlNzI0MWI1YzhhMWRmYzZlNzMwN2VlMThiMTg1Yzp7Il9hdXRoX3VzZXJfaWQiOiIxMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwOWE3YTRjNmM3OTQ1NDVmMDJhMzQwNTdhYzc3YjU3YmIyYWQ1NmE0In0=','2018-12-12 18:05:58.000000'),('ra371kpk6g1r9nh6h3hiy0w2bw2d9bu2','ZTg4NjI4MzNmMWYxMjAwZDdkZTcyYjFjZGM4M2U5OWZiZThiZDY4MTp7Il9hdXRoX3VzZXJfaWQiOiIxNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NWQyYjM5MzJhMGI4NjU0OTczODkyZDhiOTVlNDlkNWI0YjBjMzUzIn0=','2018-12-26 12:47:15.000000'),('s4sw5hvh7hoo063n62pz9eykhw86awvg','OGMyNDZiOTUyNDhiYzUzYTEzMTM1ZmRmZmU0MmQyMjg1MTFhYjNkMjp7Il9hdXRoX3VzZXJfaWQiOiIxNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxZTU4NzgxMGZiYmEwZmE4Zjk1NTRiYzdlNGU5NTRjMDk1NGM0YTRhIn0=','2018-12-13 12:49:51.000000'),('w145pi59dr7nnn4snextitnsjdv2d30i','MjE2MTgyNWI3NzYyMmQwY2U2MzBhYTdiNGE2ZGI2MzA2YzEyNjIyYTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxMmI4NWM0NGUxNDc4YWVjMGJiNzU5ZGFhYTlhYzQwYjMyYjkzNGJiIn0=','2018-06-30 22:49:15.255906'),('yi8k2g93xxk25651zbbhhjt10457orz3','MTdkOWI5ZjQwNmRmYzcxNjVmNGFhODNjMTMwMWVlZjViOTYwMzM1Zjp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYThmMjI4ZjIyMzcxOGVhMTRhYmNmNzQ1ZDkwNmRkNzQ2NTAzZmJmIn0=','2018-12-13 09:34:23.000000');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_workorder`
--

DROP TABLE IF EXISTS `personal_workorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_workorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(10) COLLATE utf8_bin NOT NULL,
  `title` varchar(50) COLLATE utf8_bin NOT NULL,
  `type` varchar(10) COLLATE utf8_bin NOT NULL,
  `status` varchar(10) COLLATE utf8_bin NOT NULL,
  `do_time` datetime(6) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `content` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `file_content` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `proposer_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `approver_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `personal_workorder_customer_id_784cd4e0_fk_adm_customer_id` (`customer_id`),
  KEY `personal_workorder_proposer_id_dbe7f650_fk_users_userprofile_id` (`proposer_id`),
  KEY `personal_workorder_receiver_id_b436f6a3_fk_users_userprofile_id` (`receiver_id`),
  KEY `personal_workorder_sender_id_ba00e488_fk_users_userprofile_id` (`sender_id`),
  KEY `personal_workorder_approver_id_8151e1b9_fk_users_userprofile_id` (`approver_id`),
  CONSTRAINT `personal_workorder_approver_id_8151e1b9_fk_users_userprofile_id` FOREIGN KEY (`approver_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `personal_workorder_customer_id_784cd4e0_fk_adm_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `adm_customer` (`id`),
  CONSTRAINT `personal_workorder_proposer_id_dbe7f650_fk_users_userprofile_id` FOREIGN KEY (`proposer_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `personal_workorder_receiver_id_b436f6a3_fk_users_userprofile_id` FOREIGN KEY (`receiver_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `personal_workorder_sender_id_ba00e488_fk_users_userprofile_id` FOREIGN KEY (`sender_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_workorder`
--

LOCK TABLES `personal_workorder` WRITE;
/*!40000 ALTER TABLE `personal_workorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_workorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_workorderrecord`
--

DROP TABLE IF EXISTS `personal_workorderrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_workorderrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `record_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `content` varchar(500) COLLATE utf8_bin NOT NULL,
  `file_content` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `add_time` datetime(6) NOT NULL,
  `name_id` int(11) NOT NULL,
  `work_order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `personal_workorderre_name_id_cf06c8ba_fk_users_use` (`name_id`),
  KEY `personal_workorderre_work_order_id_fe6a58a9_fk_personal_` (`work_order_id`),
  CONSTRAINT `personal_workorderre_name_id_cf06c8ba_fk_users_use` FOREIGN KEY (`name_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `personal_workorderre_work_order_id_fe6a58a9_fk_personal_` FOREIGN KEY (`work_order_id`) REFERENCES `personal_workorder` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_workorderrecord`
--

LOCK TABLES `personal_workorderrecord` WRITE;
/*!40000 ALTER TABLE `personal_workorderrecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_workorderrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_menu`
--

DROP TABLE IF EXISTS `rbac_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbac_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `is_top` tinyint(1) NOT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `url` varchar(128) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `url` (`url`),
  KEY `rbac_menu_parent_id_60a5b178_fk_rbac_menu_id` (`parent_id`),
  CONSTRAINT `rbac_menu_parent_id_60a5b178_fk_rbac_menu_id` FOREIGN KEY (`parent_id`) REFERENCES `rbac_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_menu`
--

LOCK TABLES `rbac_menu` WRITE;
/*!40000 ALTER TABLE `rbac_menu` DISABLE KEYS */;
INSERT INTO `rbac_menu` VALUES (1,'系统',1,NULL,'SYSTEM','/system/',NULL),(2,'行政',1,NULL,'ADM','/adm/',NULL),(3,'人事',0,NULL,'PERSONNEL','/personnel/',NULL),(4,'流程',1,NULL,'FLOW','/flow/',NULL),(5,'我的工作台',0,NULL,'PERSONAL','/personal/',NULL),(6,'基础设置',0,'fa fa-gg','SYSTEM-BASIC',NULL,1),(7,'权限管理',0,'fa fa-user-plus','SYSTEM-RBAC',NULL,1),(8,'系统工具',0,'fa fa-wrench','SYSTEM-TOOLS',NULL,1),(9,'组织架构',0,NULL,'SYSTEM-BASIC-STRUCTURE','/system/basic/structure/',6),(10,'用户管理',0,NULL,'SYSTEM-BASIC-USER','/system/basic/user/',6),(11,'菜单管理',0,NULL,'SYSTEM-RBAC-MENU','/system/rbac/menu/',7),(12,'角色管理',0,NULL,'SYSTEM-RBAC-ROLE','/system/rbac/role/',7),(15,'组织架构：列表',0,NULL,'SYSTEM-BASIC-STRUCTURE-LIST','/system/basic/structure/list',9),(16,'组织架构：详情',0,NULL,'SYSTEM-BASIC-STRUCTURE-DETAIL','/system/basic/structure/detail',9),(17,'组织架构：删除',0,NULL,'SYSTEM-BASIC-STRUCTURE-DELETE','/system/basic/structure/delete',9),(18,'组织架构：关联用户',0,NULL,'SYSTEM-BASIC-STRUCTURE-ADD_USER','/system/basic/structure/add_user',9),(19,'用户管理：列表',0,NULL,'SYSTEM-BASIC-USER-LIST','/system/basic/user/list',10),(20,'用户管理：详情',0,NULL,'SYSTEM-BASIC-USER','/system/basic/user/detail',10),(21,'用户管理：修改',0,NULL,'SYSTEM-BASIC-USER-UPDATE','/system/basic/user/update',10),(22,'用户管理：创建',0,NULL,'SYSTEM-BASIC-USER-CREATE','/system/basic/user/create',10),(23,'用户管理：删除',0,NULL,'SYSTEM-BASIC-USER-DELETE','/system/basic/user/delete',10),(24,'用户管理：启用',0,NULL,'SYSTEM-BASIC-USER-ENABLE','/system/basic/user/enable',10),(25,'用户管理：禁用',0,NULL,'SYSTEM-BASIC-USER-DISABLE','/system/basic/user/disable',10),(26,'用户管理：修改用户密码',0,NULL,'SYSTEM-BASIC-USER-AdminPasswdChange','/system/basic/user/adminpasswdchange',10),(27,'角色管理：列表',0,NULL,'SYSTEM-RBAC-ROLE-LIST','/system/rbac/role/list',12),(28,'角色管理：详情-编辑',0,NULL,'SYSTEM-RBAC-ROLE-DETAIL','/system/rbac/role/detail',12),(29,'角色管理：删除',0,NULL,'SYSTEM-RBAC-ROLE-DELETE','/system/rbac/role/delete',12),(30,'角色管理：关联菜单',0,NULL,'SYSTEM-RBAC-ROLE-ROLE_MENU','/system/rbac/role/role_menu',12),(31,'角色管理：菜单列表',0,NULL,'SYSTEM-RBAC-ROLE-ROLE_MENU_LIST','/system/rbac/role/role_menu_list',12),(32,'角色管理：关联用户',0,NULL,'SYSTEM-RBAC-ROLE-ROLE_LIST','/system/rbac/role/role_user',12),(33,'菜单管理：列表',0,NULL,'SYSTEM-RBAC-MENU-LIST','/system/rbac/menu/list',11),(34,'系统设置',0,NULL,'SYSTEM-TOOLS-SYSTEM_SETUP','/system/tools/system_setup/',8),(35,'发件邮箱设置',0,NULL,'SYSTEM-TOOLS-EMAIL_SETUP','/system/tools/email_setup/',8),(36,'基础管理',0,'fa fa-gg','ADM-BSM',NULL,2),(37,'分销商管理',0,NULL,'ADM-BSM-SUPPLIER','/adm/bsm/supplier/',36),(38,'供应商管理：列表',0,NULL,'ADM-BSM-SUPPLIER-LIST','/adm/bsm/supplier/list',37),(39,'基础管理：详情-修改',0,NULL,'ADM-BSM-SUPPLIER-DETAIL','/adm/bsm/supplier/detail',37),(40,'供应商管理：删除',0,NULL,'ADM-BSM-SUPPLIER-DELETE','/adm/bsm/supplier/delete',37),(41,'资产类型',0,NULL,'ADM-BSM-ASSETTYPE','/adm/bsm/assettype/',36),(42,'资产类型：列表',0,NULL,'ADM-BSM-ASSETTYPE-LIST','/adm/bsm/assettype/list',41),(43,'资产类型：编辑-详情',0,NULL,'ADM-BSM-ASSETYPE-DETAIL','/adm/bsm/assettype/detail',41),(44,'资产类型：删除',0,NULL,'ADM-BSM-ASSETTYPE-DELETE','/adm/bsm/assettype/delete',41),(45,'客户信息',0,NULL,'ADM-BSM-CUSTOMER','/adm/bsm/customer/',36),(46,'客户信息：列表',0,NULL,'ADM-BSM-CUSTOMER-LIST','/adm/bsm/customer/list',45),(47,'客户信息：编辑-详情',0,NULL,'ADM-BSM-CUSTOMER-DETAIL','/adm/bsm/customer/detail',45),(48,'客户信息：删除',0,NULL,'ADM-BSM-CUSTOMER-DELETE','/adm/bsm/customer/delete',45),(49,'设备类型',0,NULL,'ADM-BSM-EQUIPMENTTYPE','/adm/bsm/equipmenttype/',36),(50,'资产管理',1,'fa fa-desktop','ADM-ASSET','/adm/asset/',2),(51,'设备管理',0,'fa fa-keyboard-o','ADM-EQUIPMENT','/adm/equipment/',2),(52,'用户管理：修改个人密码',0,NULL,'SYSTEM-BASIC-USER-PASSWDCHANGE','/system/basic/user/passwdchange',10),(53,'设备类型：列表',0,NULL,'ADM-BSM-EQUIPMENTTYPE-LIST','/adm/bsm/equipmenttype/list',49),(54,'设备类型：编辑-详情',0,NULL,'ADM-BSM-EQUIPMENTTYPE-DETAIL','/adm/bsm/equipmenttype/detail',49),(55,'设备类型：删除',0,NULL,'ADM-BSM-EQUIPMENTTYPE-DELETE','/adm/bsm/equipmenttype/delete',49),(56,'设备管理：列表',0,NULL,'ADM-EQUIPMENT-LIST','/adm/equipment/list',51),(57,'设备管理：新建-修改',0,NULL,'ADM-EQUIPMENT-CREATE','/adm/equipment/create',51),(58,'设备管理：删除',0,NULL,'ADM-EQUIPMENT-DELETE','/adm/equipment/delete',51),(59,'设备管理：详情',0,NULL,'ADM-EQUIPMENT-DETAIL','/adm/equipment/detail',51),(60,'设备管理：维保更新',0,NULL,'ADM-EQUIPMENT-SERVICEINFO','/adm/equipment/serviceinfoupdate',51),(61,'个人中心',0,'fa fa-user-plus','PERSONAL-USERINFO','/personal/userinfo',5),(62,'上传头像',0,NULL,'PERSONAL-USERINFO-UPLOADIMAGE','/personal/uploadimage',61),(63,'修改密码',0,NULL,'PERSONAL-USERINFO-PASSWORDCHANGE','/personal/passwordchange',61),(64,'内部通信',0,'fa fa-book','PERSONAL-PHONEBOOK','/personal/phonebook',5),(65,'菜单管理：详情-修改',0,NULL,'SYSTEM-RBAC-MENU-DETAIL','/system/rbac/menu/detail',11),(66,'工单管理',1,'fa fa-list-alt','PERSONAL-WORKORDER',NULL,5),(67,'我创建的工单',1,'fa fa-caret-right','PERSONAL-WORKORDER_ICRT','/personal/workorder_Icrt/',66),(68,'我创建的工单：创建',1,NULL,'PERSONAL-WORKORDER_ICRT-CREATE','/personal/workorder_Icrt/create',67),(69,'我创建的工单：列表',1,NULL,'PERSONAL-WORKORDER_ICRT-LIST','/personal/workorder_Icrt/list',67),(70,'我创建的工单：详情',1,NULL,'PERSONAL-WORKORDER-DETAIL','/personal/workorder_Icrt/detail',67),(71,'我创建的工单：删除',1,NULL,'PERSONAL-WORKORDER_ICRT-DELETE','/personal/workorder_Icrt/delete',67),(72,'我创建的工单：修改',1,NULL,'PERSONAL-WORKORDER-UPDATE','/personal/workorder_Icrt/update',67),(73,'我派发的工单',1,'fa fa-caret-right','PERSONAL-WORKORDER_APP','/personal/workorder_app/',66),(74,'我收到的工单',1,'fa fa-caret-right','PERSONAL-WORKORDER_REC','/personal/workorder_rec/',66),(75,'我派发的工单：派发',1,NULL,'PERSONAL-WORKORDER_APP-SEND','/personal/workorder_app/send',73),(76,'我收到的工单：执行',1,NULL,'PERSONAL-WORKORDER-EXECUTE','/personal/workorder_rec/execute',74),(77,'我收到的工单：确认',1,NULL,'PERSONAL-WORKORDER_REC-FINISH','/personal/workorder_rec/finish',74),(78,'资产管理：列表',1,NULL,'ADM-ASSET-LIST','/adm/asset/list',50),(79,'资产管理：创建',1,NULL,'ADM-ASSET-CREATE','/adm/asset/create',50),(80,'资产管理：修改',1,NULL,'ADM-ASSET-UPDATE','/adm/asset/update',50),(81,'资产管理：详情',1,NULL,'ADM-ASSET-DETAIL','/adm/asset/detail',50),(82,'资产管理：删除',1,NULL,'ADM-ASSET-DELETE','/adm/asset/delete',50),(83,'我创建的工单：上传项目资料',1,NULL,'PERSONAL-WORKORDER-PROJECT_UPLOAD','/personal/workorder_Icrt/upload',67),(84,'我收到的工单：上传配置资料',1,NULL,'PERSONAL-WORKORDER-UPLOAD','/personal/workorder_rec/upload',74),(85,'工单统计',1,NULL,'PERSONAL-WORKORDER-ALL','/personal/workorder_all/',66),(86,'资产管理：上传',1,NULL,'ADM-ASSET-UPLOAD','/adm/asset/upload',50),(87,'我收到的工单：退回',1,NULL,'PERSONAL-WORKORDER-RETURN','/personal/workorder_rec/return',74),(88,'工单文档',1,'fa  fa-folder','PERSONAL-DOCUMENT','/personal/document/',5),(89,'工单文档：列表',1,NULL,'PERSONAL-DOCUMENT-LIST','/personal/document/list',88),(90,'我审批的工单',1,'fa fa-caret-right','PERSONAL-WORKORDER_SHENPI','/personal/workorder_shenpi/',66),(91,'我审批的工单：审批',1,NULL,'PERSONAL-WORKORDER_SHENPI-APPROVE','/personal/workorder_shenpi/approve',90);
/*!40000 ALTER TABLE `rbac_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_role`
--

DROP TABLE IF EXISTS `rbac_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbac_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_role`
--

LOCK TABLES `rbac_role` WRITE;
/*!40000 ALTER TABLE `rbac_role` DISABLE KEYS */;
INSERT INTO `rbac_role` VALUES (1,'系统'),(6,'行政'),(7,'人力'),(8,'技术'),(9,'销售'),(10,'管理'),(11,'核算'),(12,'派发'),(13,'审批');
/*!40000 ALTER TABLE `rbac_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_role_permissions`
--

DROP TABLE IF EXISTS `rbac_role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbac_role_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rbac_role_permissions_role_id_menu_id_8ba9f835_uniq` (`role_id`,`menu_id`),
  KEY `rbac_role_permissions_menu_id_bb73fb9a_fk_rbac_menu_id` (`menu_id`),
  CONSTRAINT `rbac_role_permissions_menu_id_bb73fb9a_fk_rbac_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `rbac_menu` (`id`),
  CONSTRAINT `rbac_role_permissions_role_id_d10416cb_fk_rbac_role_id` FOREIGN KEY (`role_id`) REFERENCES `rbac_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3196 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_role_permissions`
--

LOCK TABLES `rbac_role_permissions` WRITE;
/*!40000 ALTER TABLE `rbac_role_permissions` DISABLE KEYS */;
INSERT INTO `rbac_role_permissions` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(59,1,15),(54,1,16),(55,1,17),(56,1,18),(57,1,19),(58,1,20),(60,1,21),(61,1,22),(62,1,23),(63,1,24),(64,1,25),(65,1,26),(68,1,27),(69,1,28),(70,1,29),(71,1,30),(72,1,31),(66,1,32),(67,1,33),(78,1,34),(79,1,35),(80,1,36),(81,1,37),(82,1,38),(83,1,39),(84,1,40),(85,1,41),(86,1,42),(87,1,43),(88,1,44),(276,1,45),(277,1,46),(278,1,47),(279,1,48),(371,1,52),(2305,6,2),(2325,6,5),(2306,6,36),(2307,6,37),(2308,6,38),(2309,6,41),(2310,6,42),(2311,6,43),(2312,6,45),(2313,6,46),(2314,6,49),(2316,6,50),(2322,6,51),(2315,6,53),(2323,6,56),(2324,6,59),(2326,6,61),(2327,6,62),(2328,6,63),(2329,6,64),(2330,6,66),(2331,6,67),(2332,6,68),(2333,6,69),(2334,6,70),(2335,6,71),(2336,6,72),(2338,6,74),(2339,6,76),(2340,6,77),(2317,6,78),(2318,6,79),(2319,6,80),(2320,6,81),(2337,6,83),(2341,6,84),(2321,6,86),(1505,7,2),(1525,7,5),(1506,7,36),(1507,7,37),(1508,7,38),(1509,7,39),(1510,7,41),(1511,7,42),(1512,7,43),(1513,7,45),(1514,7,46),(1515,7,47),(1516,7,49),(1519,7,50),(1520,7,51),(1517,7,53),(1518,7,54),(1521,7,56),(1522,7,57),(1523,7,59),(1524,7,60),(1526,7,61),(1527,7,62),(1528,7,63),(1529,7,64),(1530,7,66),(1531,7,67),(1532,7,68),(1533,7,69),(1534,7,70),(1535,7,71),(1536,7,72),(1537,7,74),(1538,7,76),(1539,7,77),(2878,8,1),(2909,8,2),(2940,8,5),(2879,8,6),(2895,8,7),(2906,8,8),(2880,8,9),(2885,8,10),(2896,8,11),(2899,8,12),(2881,8,15),(2882,8,16),(2883,8,17),(2884,8,18),(2886,8,19),(2887,8,20),(2888,8,21),(2889,8,22),(2890,8,23),(2891,8,24),(2892,8,25),(2893,8,26),(2900,8,27),(2901,8,28),(2902,8,29),(2903,8,30),(2904,8,31),(2905,8,32),(2897,8,33),(2907,8,34),(2908,8,35),(2910,8,36),(2911,8,37),(2912,8,38),(2913,8,39),(2914,8,40),(2915,8,41),(2916,8,42),(2917,8,43),(2918,8,44),(2919,8,45),(2920,8,46),(2921,8,47),(2922,8,48),(2923,8,49),(2927,8,50),(2934,8,51),(2894,8,52),(2924,8,53),(2925,8,54),(2926,8,55),(2935,8,56),(2936,8,57),(2937,8,58),(2938,8,59),(2939,8,60),(2941,8,61),(2942,8,62),(2943,8,63),(2944,8,64),(2898,8,65),(2945,8,66),(2946,8,67),(2947,8,68),(2948,8,69),(2949,8,70),(2950,8,71),(2951,8,72),(2953,8,74),(2954,8,76),(2955,8,77),(2928,8,78),(2929,8,79),(2930,8,80),(2931,8,81),(2932,8,82),(2952,8,83),(2956,8,84),(2958,8,85),(2933,8,86),(2957,8,87),(2832,9,2),(2854,9,5),(2833,9,36),(2834,9,37),(2835,9,38),(2836,9,39),(2837,9,41),(2838,9,42),(2839,9,43),(2840,9,45),(2841,9,46),(2842,9,47),(2843,9,49),(2846,9,50),(2849,9,51),(2844,9,53),(2845,9,54),(2850,9,56),(2851,9,57),(2852,9,59),(2853,9,60),(2855,9,61),(2856,9,62),(2857,9,63),(2858,9,64),(2859,9,66),(2860,9,67),(2861,9,68),(2862,9,69),(2863,9,70),(2864,9,71),(2865,9,72),(2867,9,74),(2868,9,76),(2869,9,77),(2847,9,78),(2848,9,81),(2866,9,83),(2870,9,84),(2871,9,87),(2872,9,88),(2873,9,89),(2705,10,1),(2736,10,2),(2767,10,5),(2706,10,6),(2722,10,7),(2733,10,8),(2707,10,9),(2712,10,10),(2723,10,11),(2726,10,12),(2708,10,15),(2709,10,16),(2710,10,17),(2711,10,18),(2713,10,19),(2714,10,20),(2715,10,21),(2716,10,22),(2717,10,23),(2718,10,24),(2719,10,25),(2720,10,26),(2727,10,27),(2728,10,28),(2729,10,29),(2730,10,30),(2731,10,31),(2732,10,32),(2724,10,33),(2734,10,34),(2735,10,35),(2737,10,36),(2738,10,37),(2739,10,38),(2740,10,39),(2741,10,40),(2742,10,41),(2743,10,42),(2744,10,43),(2745,10,44),(2746,10,45),(2747,10,46),(2748,10,47),(2749,10,48),(2750,10,49),(2754,10,50),(2761,10,51),(2721,10,52),(2751,10,53),(2752,10,54),(2753,10,55),(2762,10,56),(2763,10,57),(2764,10,58),(2765,10,59),(2766,10,60),(2768,10,61),(2769,10,62),(2770,10,63),(2771,10,64),(2725,10,65),(2772,10,66),(2773,10,67),(2774,10,68),(2775,10,69),(2776,10,70),(2777,10,71),(2778,10,72),(2780,10,73),(2782,10,74),(2781,10,75),(2783,10,76),(2784,10,77),(2755,10,78),(2756,10,79),(2757,10,80),(2758,10,81),(2759,10,82),(2779,10,83),(2785,10,84),(2787,10,85),(2760,10,86),(2786,10,87),(2788,10,88),(2789,10,89),(3113,12,1),(3144,12,2),(3175,12,5),(3114,12,6),(3130,12,7),(3141,12,8),(3115,12,9),(3120,12,10),(3131,12,11),(3134,12,12),(3116,12,15),(3117,12,16),(3118,12,17),(3119,12,18),(3121,12,19),(3122,12,20),(3123,12,21),(3124,12,22),(3125,12,23),(3126,12,24),(3127,12,25),(3128,12,26),(3135,12,27),(3136,12,28),(3137,12,29),(3138,12,30),(3139,12,31),(3140,12,32),(3132,12,33),(3142,12,34),(3143,12,35),(3145,12,36),(3146,12,37),(3147,12,38),(3148,12,39),(3149,12,40),(3150,12,41),(3151,12,42),(3152,12,43),(3153,12,44),(3154,12,45),(3155,12,46),(3156,12,47),(3157,12,48),(3158,12,49),(3162,12,50),(3169,12,51),(3129,12,52),(3159,12,53),(3160,12,54),(3161,12,55),(3170,12,56),(3171,12,57),(3172,12,58),(3173,12,59),(3174,12,60),(3176,12,61),(3177,12,62),(3178,12,63),(3179,12,64),(3133,12,65),(3180,12,66),(3181,12,67),(3182,12,68),(3183,12,69),(3184,12,70),(3185,12,71),(3186,12,72),(3188,12,73),(3190,12,74),(3189,12,75),(3191,12,76),(3192,12,77),(3163,12,78),(3164,12,79),(3165,12,80),(3166,12,81),(3167,12,82),(3187,12,83),(3193,12,84),(3195,12,85),(3168,12,86),(3194,12,87),(3030,13,1),(3061,13,2),(3092,13,5),(3031,13,6),(3047,13,7),(3058,13,8),(3032,13,9),(3037,13,10),(3048,13,11),(3051,13,12),(3033,13,15),(3034,13,16),(3035,13,17),(3036,13,18),(3038,13,19),(3039,13,20),(3040,13,21),(3041,13,22),(3042,13,23),(3043,13,24),(3044,13,25),(3045,13,26),(3052,13,27),(3053,13,28),(3054,13,29),(3055,13,30),(3056,13,31),(3057,13,32),(3049,13,33),(3059,13,34),(3060,13,35),(3062,13,36),(3063,13,37),(3064,13,38),(3065,13,39),(3066,13,40),(3067,13,41),(3068,13,42),(3069,13,43),(3070,13,44),(3071,13,45),(3072,13,46),(3073,13,47),(3074,13,48),(3075,13,49),(3079,13,50),(3086,13,51),(3046,13,52),(3076,13,53),(3077,13,54),(3078,13,55),(3087,13,56),(3088,13,57),(3089,13,58),(3090,13,59),(3091,13,60),(3093,13,61),(3094,13,62),(3095,13,63),(3096,13,64),(3050,13,65),(3097,13,66),(3098,13,67),(3099,13,68),(3100,13,69),(3101,13,70),(3102,13,71),(3103,13,72),(3105,13,74),(3106,13,76),(3107,13,77),(3080,13,78),(3081,13,79),(3082,13,80),(3083,13,81),(3084,13,82),(3104,13,83),(3108,13,84),(3110,13,85),(3085,13,86),(3109,13,87),(3111,13,90),(3112,13,91);
/*!40000 ALTER TABLE `rbac_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_emailsetup`
--

DROP TABLE IF EXISTS `system_emailsetup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_emailsetup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emailHost` varchar(30) COLLATE utf8_bin NOT NULL,
  `emailPort` int(11) NOT NULL,
  `emailUser` varchar(100) COLLATE utf8_bin NOT NULL,
  `emailPassword` varchar(30) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_emailsetup`
--

LOCK TABLES `system_emailsetup` WRITE;
/*!40000 ALTER TABLE `system_emailsetup` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_emailsetup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_systemsetup`
--

DROP TABLE IF EXISTS `system_systemsetup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_systemsetup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginTitle` varchar(20) DEFAULT NULL,
  `mainTitle` varchar(20) DEFAULT NULL,
  `headTitle` varchar(20) DEFAULT NULL,
  `copyright` varchar(100) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_systemsetup`
--

LOCK TABLES `system_systemsetup` WRITE;
/*!40000 ALTER TABLE `system_systemsetup` DISABLE KEYS */;
INSERT INTO `system_systemsetup` VALUES (13,'全民点游工单系统','IDianU','IDianU','Copyright © 2018-12 全民点游科技',NULL);
/*!40000 ALTER TABLE `system_systemsetup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_structure`
--

DROP TABLE IF EXISTS `users_structure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_structure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `type` varchar(20) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_structure_parent_id_e73fd647_fk_users_structure_id` (`parent_id`),
  CONSTRAINT `users_structure_parent_id_e73fd647_fk_users_structure_id` FOREIGN KEY (`parent_id`) REFERENCES `users_structure` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_structure`
--

LOCK TABLES `users_structure` WRITE;
/*!40000 ALTER TABLE `users_structure` DISABLE KEYS */;
INSERT INTO `users_structure` VALUES (5,'深圳市全民点游科技有限公司','firm',NULL),(9,'销售部','department',5),(11,'商务中心','department',5),(12,'行政中心','department',5),(13,'财务','department',9),(15,'销售部-内','department',5),(16,'运维部','department',5),(17,'开发部','department',5);
/*!40000 ALTER TABLE `users_structure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile`
--

DROP TABLE IF EXISTS `users_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `name` varchar(20) NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `post` varchar(50) DEFAULT NULL,
  `joined_date` date DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `superior_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `users_userprofile_department_id_b060d851_fk_users_structure_id` (`department_id`),
  KEY `users_userprofile_superior_id_3869391f_fk_users_userprofile_id` (`superior_id`),
  CONSTRAINT `users_userprofile_department_id_b060d851_fk_users_structure_id` FOREIGN KEY (`department_id`) REFERENCES `users_structure` (`id`),
  CONSTRAINT `users_userprofile_superior_id_3869391f_fk_users_userprofile_id` FOREIGN KEY (`superior_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile`
--

LOCK TABLES `users_userprofile` WRITE;
/*!40000 ALTER TABLE `users_userprofile` DISABLE KEYS */;
INSERT INTO `users_userprofile` VALUES (11,'pbkdf2_sha256$36000$Xg14aV8p3gYs$upPFs8WucX4siUc1wmt4f2gQp4uv5LkiAtsQhEr7bmg=','2018-12-26 14:17:07.000000',1,'admin','','',1,1,'2017-12-12 16:51:00.000000','管理员',NULL,'male','13813836955','admin@sandbox.com','image/default.jpg',NULL,NULL,NULL,NULL),(13,'pbkdf2_sha256$36000$sNKCpGklDKkJ$ZglME6Cuec9T7OEBrJHNbUya8z/Ie5YAscv6Jm4p3AQ=','2018-12-26 14:18:06.000000',0,'haoqinfeng','','',0,1,'2018-12-12 16:45:05.000000','郝沁峰',NULL,'male','18680358912','haoqinfeng@zywamail.com','image/default.jpg','运维',NULL,16,NULL),(14,'pbkdf2_sha256$36000$wgzOGCNBsPBG$yVVPuhLEcmF7UPxvptPA/i1iy8jHCposO7zfR2Uc5is=','2018-12-26 12:27:02.000000',0,'zzx','','',0,1,'2018-12-12 16:45:48.000000','张志祥','1993-03-13','male','13728978429','zhangzhixiang@zywamail.com','image/张志祥/devops_20181225_192020.jpg','运维','2018-11-06',16,13),(15,'pbkdf2_sha256$36000$e33dODijPSiJ$SjB4ezsWUIjcn/EsGrEkdpZ0/gkS8gv3h5y6E8UKY4s=','2018-12-26 14:11:59.000000',0,'yy','','',0,1,'2018-12-12 20:34:16.000000','杨宇',NULL,'male','13537673785','1074060710@qq.com','image/杨宇/zywa_20181225_191919.jpg','开发',NULL,17,16),(16,'pbkdf2_sha256$36000$1wMIddQq00FA$pRPymihKRah+YZIropzLKXHG4ODPsprEy96UrWwLTsk=','2018-12-26 14:16:49.000000',0,'wangwenquan','','',0,1,'2018-12-12 20:59:44.000000','王文泉',NULL,'male','18500540611','zzx199313@sina.com','image/default.jpg','开发',NULL,17,NULL),(17,'pbkdf2_sha256$36000$wWgH81TksNuk$ENkH0LEvSUHX4xwvtlJHSgu21cS+zDjMhpRlANhhJ6o=','2018-12-26 11:51:20.000000',0,'xuleijie','','',0,1,'2018-12-26 10:29:28.000000','徐磊杰','1993-10-12','male','15718826968','xuleijie@zywamail.com','image/default.jpg','运维','2018-11-08',16,13),(18,'pbkdf2_sha256$36000$9k2DYwWX52N6$esokPsnUXSOE8qelpg80YPI2pVbayu1NP44XPOS+TeY=',NULL,0,'leishanyi','','',0,1,'2018-12-26 10:33:34.000000','雷善义',NULL,'male','15361503661','leishanyi@idianyou.cn','image/default.jpg','运维',NULL,16,13),(19,'pbkdf2_sha256$36000$caX9FvFSzufW$W+rBPmhycmRE62CGObnE+YiywQ5FIU5DOElgaND7WA8=',NULL,0,'wangwei','','',0,1,'2018-12-26 10:35:16.000000','王维',NULL,'male','13128841321','wangwei1@zywamail.com','image/default.jpg','运维',NULL,16,13);
/*!40000 ALTER TABLE `users_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile_groups`
--

DROP TABLE IF EXISTS `users_userprofile_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_group_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofile_gr_userprofile_id_a4496a80_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_groups`
--

LOCK TABLES `users_userprofile_groups` WRITE;
/*!40000 ALTER TABLE `users_userprofile_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_userprofile_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile_roles`
--

DROP TABLE IF EXISTS `users_userprofile_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_roles_userprofile_id_role_id_81c255df_uniq` (`userprofile_id`,`role_id`),
  KEY `users_userprofile_roles_role_id_740e5521_fk_rbac_role_id` (`role_id`),
  CONSTRAINT `users_userprofile_ro_userprofile_id_ae49de2a_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_roles_role_id_740e5521_fk_rbac_role_id` FOREIGN KEY (`role_id`) REFERENCES `rbac_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_roles`
--

LOCK TABLES `users_userprofile_roles` WRITE;
/*!40000 ALTER TABLE `users_userprofile_roles` DISABLE KEYS */;
INSERT INTO `users_userprofile_roles` VALUES (84,11,10),(87,13,12),(88,14,8),(89,15,8),(91,16,13),(92,17,8),(93,18,8),(94,19,8);
/*!40000 ALTER TABLE `users_userprofile_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile_user_permissions`
--

DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_p_userprofile_id_permissio_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_us_permission_id_393136b6_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_userprofile_us_permission_id_393136b6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_userprofile_us_userprofile_id_34544737_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_user_permissions`
--

LOCK TABLES `users_userprofile_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_userprofile_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_userprofile_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_bookmark`
--

DROP TABLE IF EXISTS `xadmin_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8_bin NOT NULL,
  `url_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `query` varchar(1000) COLLATE utf8_bin NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_content_type_id_60941679_fk_django_co` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_bookmark`
--

LOCK TABLES `xadmin_bookmark` WRITE;
/*!40000 ALTER TABLE `xadmin_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_log`
--

DROP TABLE IF EXISTS `xadmin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) COLLATE utf8_bin DEFAULT NULL,
  `object_id` longtext COLLATE utf8_bin,
  `object_repr` varchar(200) COLLATE utf8_bin NOT NULL,
  `action_flag` varchar(32) COLLATE utf8_bin NOT NULL,
  `message` longtext COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_log`
--

LOCK TABLES `xadmin_log` WRITE;
/*!40000 ALTER TABLE `xadmin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_usersettings`
--

DROP TABLE IF EXISTS `xadmin_usersettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) COLLATE utf8_bin NOT NULL,
  `value` longtext COLLATE utf8_bin NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_usersettings`
--

LOCK TABLES `xadmin_usersettings` WRITE;
/*!40000 ALTER TABLE `xadmin_usersettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_usersettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_userwidget`
--

DROP TABLE IF EXISTS `xadmin_userwidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) COLLATE utf8_bin NOT NULL,
  `widget_type` varchar(50) COLLATE utf8_bin NOT NULL,
  `value` longtext COLLATE utf8_bin NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_userwidget`
--

LOCK TABLES `xadmin_userwidget` WRITE;
/*!40000 ALTER TABLE `xadmin_userwidget` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_userwidget` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-26 14:24:08
