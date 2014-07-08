-- MySQL dump 10.14  Distrib 5.5.32-MariaDB, for Linux (i686)
--
-- Host: localhost    Database: stocktrader
-- ------------------------------------------------------
-- Server version	5.5.32-MariaDB

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
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `id` int(10) unsigned zerofill NOT NULL,
  `action` char(7) NOT NULL,
  `symbol` varchar(12) NOT NULL,
  `shares` int(11) NOT NULL,
  `price` double NOT NULL,
  `date` datetime NOT NULL,
  KEY `id` (`id`),
  CONSTRAINT `history_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES (0000000008,'buy','YHOO',10,36.38,'2014-04-18 11:59:00'),(0000000008,'sell','YHOO',20,36.38,'2014-04-18 11:59:59'),(0000000008,'buy','YHOO',10,36.38,'2014-04-18 12:01:09'),(0000000008,'sell','YHOO',10,36.38,'2014-04-18 12:01:16'),(0000000008,'deposit','$',0,2100,'2014-04-18 14:16:19'),(0000000008,'buy','AMZN',10,324.91,'2014-04-18 14:34:50'),(0000000034,'buy','AMZN',10,324.91,'2014-04-18 14:44:37'),(0000000034,'sell','AMZN',10,324.91,'2014-04-18 14:44:44'),(0000000034,'deposit','$',0,1007,'2014-04-18 14:45:09');
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio`
--

DROP TABLE IF EXISTS `portfolio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portfolio` (
  `id` int(10) unsigned NOT NULL,
  `symbol` varchar(12) NOT NULL,
  `shares` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`symbol`),
  CONSTRAINT `portfolio_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio`
--

LOCK TABLES `portfolio` WRITE;
/*!40000 ALTER TABLE `portfolio` DISABLE KEYS */;
INSERT INTO `portfolio` VALUES (6,'GOOG',6),(8,'AMZN',10);
/*!40000 ALTER TABLE `portfolio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cash` decimal(65,4) unsigned NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'caesar','$1$50$GHABNWBNE/o4VL7QjmQ6x0',10000.0000),(2,'hirschhorn','$1$50$lJS9HiGK6sphej8c4bnbX.',10000.0000),(3,'jharvard','$1$50$RX3wnAMNrGIbgzbRYrxM1/',10000.0000),(4,'malan','$1$HA$azTGIMVlmPi9W9Y12cYSj/',10000.0000),(5,'milo','$1$HA$6DHumQaK4GhpX8QE23C8V1',10000.0000),(6,'skroob','$1$50$euBi4ugiJmbpIbvTTfmfI.',10000.0000),(7,'zamyla','$1$50$uwfqB45ANW.9.6qaQ.DcF.',10000.0000),(8,'mp1pro','$1$D8NVVnML$sXcmEZWHvSTFTgps7jJa81',9850.9000),(18,'jack','$1$bcfuSZ8T$luIuvFbGs6/0OoD4yg.1Y/',10000.0000),(19,'jacky','$1$Oceuyu/J$Yz0yzCp4M5LPL2yNXzGQ51',10000.0000),(20,'jack1','$1$xb/5MewF$ZBmsKFbAfIubyaAFq2cAS.',10000.0000),(21,'jack21','$1$P8owAg8E$wrKloQ4zXTFbPPEErcOds/',10000.0000),(22,'catch22','$1$yA4fky6n$NcLpEaua5vrWWNUYURKFr.',10000.0000),(23,'crazy23','$1$W5eF.xAw$hVEwa/EZngmhtPZCYU7FC/',10000.0000),(24,'crazy24','$1$IjDOcEy5$AXQb7fbdqq1ZsRVfdOxwa/',10000.0000),(25,'crazy25','$1$cGsv0SBQ$663i1SZCqkNiTCla6ILn7.',10000.0000),(26,'crazy26','$1$Mb1GHV3o$LTNZQGmEdND9wP9dcCOjI.',10000.0000),(27,'crazy27','$1$jYD9lVyd$Gm2RjjO2mJi4mwTphF54A/',10000.0000),(28,'crazy28','$1$Q7kTHPva$bGEa.DC4U/lvO9s5bAEPO1',10000.0000),(29,'crazy29','$1$9wF8o0kF$0xYCbaF83eeNVDaEKkCv9.',10000.0000),(30,'dirty30','$1$3t4ARVxt$xoPYBZ6QhQnDbNCeYeKzP1',10000.0000),(31,'dirty31','$1$ffiMHLhu$hGqBnwpWwe9xUUOTwSBKP.',10000.0000),(32,'dirty32','$1$D9QrRTt8$AahZ72vs2pX4zcFl/rit9/',10000.0000),(33,'dirty33','$1$2SlOpj86$qaIn/Ay61ESTJNtQnU8jz/',10000.0000),(34,'dirty34','$1$yS5ATQrR$gJeghIFP/yEtJ.VteceIr/',11007.0000);
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

-- Dump completed on 2014-04-18 15:34:05
