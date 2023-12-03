-- MySQL dump 10.13  Distrib 8.0.35, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: springboot-vue
-- ------------------------------------------------------
-- Server version	8.0.35

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

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户',
  `storage_id` int NOT NULL COMMENT '商品',
  `num` int DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`user_id`,`storage_id`) USING BTREE,
  KEY `storage_id` (`storage_id`) USING BTREE,
  CONSTRAINT `storage_id` FOREIGN KEY (`storage_id`) REFERENCES `goods` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_croatian_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `cate_id` int NOT NULL AUTO_INCREMENT,
  `catename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'AK47'),(2,'USP'),(3,'glock'),(5,'M4A1'),(6,'M4A4');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `store_id` int NOT NULL COMMENT '店家id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci DEFAULT NULL COMMENT '名称',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `create_time` datetime DEFAULT NULL COMMENT '出厂日期',
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci DEFAULT NULL COMMENT '封面地址',
  `state` int DEFAULT NULL COMMENT '是否上架，0否，1是',
  `sales_volume` int DEFAULT '0' COMMENT '销量',
  `cate_id` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE,
  KEY `goods_category_cate_id_fk` (`cate_id`),
  CONSTRAINT `goods_category_cate_id_fk` FOREIGN KEY (`cate_id`) REFERENCES `category` (`cate_id`),
  CONSTRAINT `store_id` FOREIGN KEY (`store_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_croatian_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (48,42,'USP-守护者',160.00,'2023-11-25 00:00:00','http://125.216.249.251:9090/files/ebc52f2e98f84d9d8c1184b4440f2a53',1,1,2),(49,42,'AK47-红线',2500.00,'2023-11-25 00:00:00','http://125.216.249.251:9090/files/186d528c57234774a85bf644beb57bce',1,1,1),(50,42,'USP-脑洞大开',21.00,'2023-11-25 00:00:00','http://125.216.249.251:9090/files/cb949d1fd5e347998d97b39ac0821717',1,2,2),(51,42,'glock-一目了然',3.00,'2023-11-25 00:00:00','http://125.216.249.251:9090/files/a8e92df244414080b830e47f9f418799',1,2,3),(56,42,'M4A1-闪回',3.00,'2023-11-25 00:00:00','http://125.216.249.251:9090/files/e281b2332d464ed4902931498ccb179b',1,0,5),(57,42,'M4A1-翼蜥',28.00,'2023-11-25 00:00:00','http://125.216.249.251:9090/files/99d85833f81f4a5884ef31b745016d78',1,0,5),(58,42,'AK47-可燃冰',38.00,'2023-11-25 00:00:00','http://125.216.249.251:9090/files/daa8e59a289f4c778879b301b174c122',1,0,1),(59,42,'AK47-墨岩',10.00,'2023-11-25 00:00:00','http://125.216.249.251:9090/files/d5099d1b27eb49268b5a97c42111c230',1,0,1),(60,42,'AK47-前线迷雾',67.00,'2023-11-25 00:00:00','http://125.216.249.251:9090/files/e77cd17a0c014ac8b41a168d916dff1d',1,0,1),(61,42,'AK47-二西莫夫',143.00,'2023-11-25 00:00:00','http://125.216.249.251:9090/files/2b3d2aafed9e430aa18825bf1681b266',1,1,1),(62,42,'AK47-夜愿',52.00,'2023-11-25 00:00:00','http://125.216.249.251:9090/files/ac43f80a75394da18e067e41ea848c42',1,0,1);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `local_date_time` datetime NOT NULL COMMENT '日志时间',
  `user_id` int NOT NULL COMMENT '客户id',
  `storage_id` int NOT NULL COMMENT '商品id',
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `log_f_userid` (`user_id`) USING BTREE,
  KEY `log_f_storageid` (`storage_id`) USING BTREE,
  CONSTRAINT `log_f_storageid` FOREIGN KEY (`storage_id`) REFERENCES `goods` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `log_f_userid` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_croatian_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (78,'2023-11-26 16:34:01',2,49,'浏览'),(79,'2023-11-26 16:34:06',2,48,'浏览'),(80,'2023-11-26 16:34:08',2,50,'浏览'),(81,'2023-11-26 16:34:41',2,50,'浏览'),(82,'2023-11-26 18:55:04',2,61,'浏览'),(83,'2023-11-26 19:29:29',2,50,'浏览'),(84,'2023-11-26 19:29:30',2,51,'浏览'),(85,'2023-11-26 19:29:33',2,49,'浏览'),(86,'2023-11-26 19:29:57',2,61,'购买'),(87,'2023-11-26 19:38:57',2,48,'浏览'),(88,'2023-11-26 19:38:59',2,51,'浏览'),(89,'2023-11-26 19:39:00',2,50,'浏览'),(90,'2023-11-28 19:49:43',2,49,'浏览'),(91,'2023-11-28 20:01:33',2,49,'购买');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `store_id` int NOT NULL,
  `storage_id` int NOT NULL,
  `num` int NOT NULL,
  `ostate` int NOT NULL COMMENT '发货状态：0没发货，1发货，2确认收货',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `custom_id` (`customer_id`) USING BTREE,
  KEY `order_storage_id` (`storage_id`) USING BTREE,
  KEY `order_store_id` (`store_id`) USING BTREE,
  CONSTRAINT `custom_id` FOREIGN KEY (`customer_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `order_storage_id` FOREIGN KEY (`storage_id`) REFERENCES `goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_store_id` FOREIGN KEY (`store_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_croatian_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (34,2,42,61,1,2),(35,2,42,49,1,2),(36,2,42,50,1,1),(37,2,42,51,1,1),(38,2,42,48,1,1),(39,2,42,50,1,0),(40,2,42,51,1,0);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci DEFAULT NULL COMMENT '\r\n用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci DEFAULT NULL,
  `steamname` varchar(255) COLLATE utf8mb4_croatian_ci DEFAULT NULL,
  `age` int DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci DEFAULT NULL,
  `account` decimal(10,2) DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci DEFAULT NULL,
  `role` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `role` (`role`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_croatian_ci ROW_FORMAT=DYNAMIC COMMENT='用户信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'123','123','123',NULL,NULL,10.00,NULL,3),(2,'1','1','1',NULL,NULL,4925.00,'1157479142@qq.com',1),(42,'12','12','12',NULL,'女',9366.00,'1157479142@qq.com',2),(43,'111','111','111',NULL,NULL,0.00,'111',2),(44,'654','654',NULL,NULL,NULL,0.00,'4',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-28 22:18:52
