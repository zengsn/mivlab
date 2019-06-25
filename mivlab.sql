-- MySQL dump 10.13  Distrib 5.7.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mivlab
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `gitUsername` varchar(100) DEFAULT NULL,
  `TOKEN` varchar(255) DEFAULT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `CLIENT_SECRET` varchar(255) DEFAULT NULL,
  `email` varchar(45) DEFAULT '0',
  `outDate` varchar(255) DEFAULT NULL,
  `validataCode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9904 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (9901,'admin','as1234','zengsn','88602906f4b5b5676495cf41929723d9228b2e6a','b3149014960e48f42586','bfc1cb8b1e206c21ab5c9556aaaf7866ef305875','2639920015@qq.com','1550332951000','8226276a-2f79-4a6b-830d-81454a0dae4d'),(9902,'ww','123',NULL,NULL,NULL,NULL,'0',NULL,NULL),(9903,NULL,'222',NULL,NULL,NULL,NULL,'0',NULL,NULL);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classinfo`
--

DROP TABLE IF EXISTS `classinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classno` varchar(45) DEFAULT NULL,
  `classname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classinfo`
--

LOCK TABLES `classinfo` WRITE;
/*!40000 ALTER TABLE `classinfo` DISABLE KEYS */;
INSERT INTO `classinfo` VALUES (2,'151401','15计科1班'),(3,'151402','15计科2班'),(4,'151501','15网络1班'),(5,'151502','15网络2班'),(6,'151601','15软件1班'),(7,'151602','15软件2班'),(8,'161401','16软件1班'),(9,'161402','16软件2班'),(10,'161403','16软件3班'),(11,'161404','16软件4班'),(12,'1517','15惠经'),(13,'141501','14软件1班');
/*!40000 ALTER TABLE `classinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cno` varchar(45) DEFAULT NULL,
  `cname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'1','Android'),(2,'2','高级网页设计-angular'),(3,'3','高级网页设计-HTML5'),(10,'4','Java Web'),(11,'5','高级网页设计-WeChat'),(12,'6','C++'),(24,'7','C语言'),(25,'8','汇编语言'),(26,'9','软件工程'),(27,'10','计算机网络'),(28,'11','数据库概论');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseplan`
--

DROP TABLE IF EXISTS `courseplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseplan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `terms_id` int(11) DEFAULT NULL,
  `classinfo_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `adminTermsId_idx` (`terms_id`),
  KEY `adminClassinfoId_idx` (`classinfo_id`),
  KEY `adminCourseId_idx` (`course_id`),
  KEY `adminTId_idx` (`teacher_id`),
  CONSTRAINT `adminClassinfoId` FOREIGN KEY (`classinfo_id`) REFERENCES `classinfo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `adminCourseId` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `adminTId` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `adminTermsId` FOREIGN KEY (`terms_id`) REFERENCES `terms` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseplan`
--

LOCK TABLES `courseplan` WRITE;
/*!40000 ALTER TABLE `courseplan` DISABLE KEYS */;
INSERT INTO `courseplan` VALUES (2,2,2,2,2),(3,1,3,16,1),(6,2,3,2,2),(7,2,4,2,2),(8,2,5,2,2),(9,3,2,3,3),(10,3,3,3,3),(11,3,4,3,3),(28,3,3,16,10),(29,5,3,3,3),(30,1,2,1,2),(31,1,4,1,3),(32,1,3,1,2),(33,1,6,1,1),(34,1,7,1,1),(35,3,3,1,11),(36,3,2,1,11),(37,3,4,1,1),(38,3,5,1,1),(39,4,6,1,11),(40,4,7,1,11),(41,5,2,1,1),(42,5,3,1,1),(43,6,6,1,3),(44,6,7,1,3),(45,2,5,1,10),(46,8,8,1,3),(47,8,9,1,3),(48,8,10,1,3),(49,8,11,1,3),(52,13,3,1,10),(53,8,3,1,12),(54,16,3,1,3),(55,8,3,1,10),(56,13,3,3,11),(57,5,3,2,10),(58,6,3,3,3),(59,8,3,2,11);
/*!40000 ALTER TABLE `courseplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fnav`
--

DROP TABLE IF EXISTS `fnav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fnav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fnav`
--

LOCK TABLES `fnav` WRITE;
/*!40000 ALTER TABLE `fnav` DISABLE KEYS */;
INSERT INTO `fnav` VALUES (1,'中心概括'),(2,'教学资源'),(3,'成果转化'),(4,'校企合作'),(5,'师资队伍'),(6,'管理体系'),(7,'资源共享'),(8,'环境设备'),(9,'申报材料');
/*!40000 ALTER TABLE `fnav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gitrawdata`
--

DROP TABLE IF EXISTS `gitrawdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitrawdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` varchar(45) DEFAULT NULL,
  `filepath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gitrawdata`
--

LOCK TABLES `gitrawdata` WRITE;
/*!40000 ALTER TABLE `gitrawdata` DISABLE KEYS */;
INSERT INTO `gitrawdata` VALUES (3,'9901','22'),(5,'9901','resultList/zengsn/hzuapps/hzuapps-wechat-miniprogram-hzc-2017Result.csv'),(6,'9901','resultList/zengsn/hzuapps/hzuapps-java-webResult.csv'),(7,'2','w4'),(8,'3','3'),(9,'3','3'),(14,'1','resultList/zengsn/hzuapps/hzuapps-web-wechat-2017Result.csv'),(15,'1','resultList/zengsn/hzuapps/hzuapps-web-wechat-2017Result.csv'),(16,'1','resultList/zengsn/hzuapps/hzuapps-web-wechat-2017Result.csv'),(17,'1','resultList/zengsn/hzuapps/hzuapps-web-wechat-2017Result.csv'),(18,'1','resultList/zengsn/hzuapps/hzuapps-web-wechat-2017Result.csv'),(19,'1','resultList/zengsn/hzuapps/hzuapps-web-wechat-2017Result.csv'),(20,'1','resultList/zengsn/hzuapps/hzuapps-web-wechat-2017Result.csv'),(21,'1','resultList/zengsn/hzuapps/hzuapps-web-wechat-2017Result.csv'),(22,'1','resultList/zengsn/hzuapps/hzuapps-web-wechat-2017Result.csv'),(23,'1','resultList/zengsn/hzuapps/hzuapps-web-wechat-2017Result.csv'),(24,'9901','resultList/zengsn/hzuapps/hzuapps-web-wechat-2017Result.csv'),(25,'1','resultList/zengsn/hzuapps/hzuapps-wechat-miniprogram-hzc-2017Result.csv');
/*!40000 ALTER TABLE `gitrawdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indexshow`
--

DROP TABLE IF EXISTS `indexshow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indexshow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imgPath` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `footer_name` varchar(45) DEFAULT NULL,
  `footer_Addr` varchar(255) DEFAULT NULL,
  `bgColor` varchar(45) DEFAULT NULL,
  `wordColor` varchar(45) DEFAULT NULL,
  `logoPath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indexshow`
--

LOCK TABLES `indexshow` WRITE;
/*!40000 ALTER TABLE `indexshow` DISABLE KEYS */;
INSERT INTO `indexshow` VALUES (1,'(./css/images/banner.png)','惠州学院虚拟仿真教学实验室','惠州学院','惠州市惠城区演达大道46号','#800040','#ffffff','LogoImage/logo.png');
/*!40000 ALTER TABLE `indexshow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reposdate`
--

DROP TABLE IF EXISTS `reposdate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reposdate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Login` varchar(45) DEFAULT NULL,
  `Num` varchar(45) DEFAULT NULL,
  `IssueNumber` int(11) DEFAULT NULL,
  `IssueCount` int(11) DEFAULT NULL,
  `IssueLabels` varchar(45) DEFAULT NULL,
  `Events` int(11) DEFAULT NULL,
  `FirstTime` varchar(45) DEFAULT NULL,
  `Pulls` int(11) DEFAULT NULL,
  `PullDone` int(11) DEFAULT NULL,
  `PullGood` int(11) DEFAULT NULL,
  `PullLate` int(11) DEFAULT NULL,
  `PullCopy` int(11) DEFAULT NULL,
  `PullBad` int(11) DEFAULT NULL,
  `PullBug` int(11) DEFAULT NULL,
  `PullDemo` int(11) DEFAULT NULL,
  `PullInteresting` int(11) DEFAULT NULL,
  `Commits` int(11) DEFAULT NULL,
  `Additions` int(11) DEFAULT NULL,
  `Deletions` int(11) DEFAULT NULL,
  `ChangedFiles` int(11) DEFAULT NULL,
  `Comments` int(11) DEFAULT NULL,
  `ReviewComments` int(11) DEFAULT NULL,
  `org` varchar(100) DEFAULT NULL,
  `proj` varchar(100) DEFAULT NULL,
  `terms_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `tid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3553 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reposdate`
--

LOCK TABLES `reposdate` WRITE;
/*!40000 ALTER TABLE `reposdate` DISABLE KEYS */;
INSERT INTO `reposdate` VALUES (3068,'hao523577579','1517060333',0,0,'',0,'',4,1,0,0,0,0,0,0,0,2,2955,0,70,0,0,'hzuapps','wechat-miniprogram-hzc-2017',3,11,50,1),(3069,'lylsy0428','1517060319',102,1,'',4,'2017-10-25T03:37:44Z',6,1,2,0,0,0,0,0,0,11,1021,0,54,0,0,'hzuapps','wechat-miniprogram-hzc-2017',3,11,90,1),(3070,'wenjianyangwen','1517060328',122,1,'',0,'',4,1,0,0,0,0,0,0,0,11,935,0,48,0,0,'hzuapps','wechat-miniprogram-hzc-2017',3,11,76,1),(3071,'zfyyy','1517060341',118,1,'',1,'2017-11-01T02:53:10Z',4,1,0,0,0,0,0,0,0,6,586,0,52,0,0,'hzuapps','wechat-miniprogram-hzc-2017',3,11,76,1),(3072,'2521598730','null',112,1,'',1,'2017-10-25T03:31:42Z',5,1,1,0,0,0,0,0,0,7,1158,24,59,0,0,'hzuapps','wechat-miniprogram-hzc-2017',3,11,83,1),(3073,'1517060340','1517060340',0,0,'',0,'',1,1,0,0,0,0,0,0,0,1,593,0,56,0,0,'hzuapps','wechat-miniprogram-hzc-2017',3,11,23,1),(3074,'huanglingwen','1516090218',0,1,'',0,'',3,0,0,0,0,0,0,0,0,6,75,30,8,0,0,'hzuapps','wechat-miniprogram-hzc-2017',3,11,70,1),(3075,'870971217','1517060302',108,1,'',1,'2017-11-01T02:03:09Z',5,1,1,0,0,0,0,0,0,9,1484,0,73,0,0,'hzuapps','wechat-miniprogram-hzc-2017',3,11,83,1),(3076,'1517060322','1517060322',0,0,'',0,'',6,1,0,0,0,0,0,0,0,14,1169,2,43,1,0,'hzuapps','wechat-miniprogram-hzc-2017',3,11,100,1),(3077,'Mashaku','1517060308',0,0,'',0,'',6,1,0,0,0,0,0,0,0,10,1045,0,69,0,0,'hzuapps','wechat-miniprogram-hzc-2017',3,11,90,1),(3078,'linmaoquan','1517060316',0,1,'',0,'',3,0,0,0,0,0,0,0,0,3,54,0,4,0,0,'hzuapps','wechat-miniprogram-hzc-2017',3,11,46,1),(3079,'1517060305','1517060305',0,0,'',0,'',3,1,0,0,0,0,0,0,0,5,1088,0,59,0,0,'hzuapps','wechat-miniprogram-hzc-2017',3,11,63,1),(3080,'linwusheng','1517060318',0,0,'',0,'',5,1,0,0,0,0,0,0,0,9,1691,0,128,1,0,'hzuapps','wechat-miniprogram-hzc-2017',3,11,93,1),(3081,'qiu-bohong','1517060324',136,1,'',0,'',6,1,1,0,0,0,0,0,0,12,1338,0,72,0,0,'hzuapps','wechat-miniprogram-hzc-2017',3,11,90,1),(3082,'chenzhenxiong','1517060309',0,0,'',0,'',4,1,0,0,0,0,0,0,0,9,5944,0,308,0,0,'hzuapps','wechat-miniprogram-hzc-2017',3,11,76,1),(3083,'ZWTZHANG','1517060336',0,1,'',0,'',2,0,0,0,0,0,0,0,0,1,0,0,3,0,0,'hzuapps','wechat-miniprogram-hzc-2017',3,11,25,1),(3084,'CCCCJQ','1517060303',143,2,'',0,'',2,1,0,0,0,0,0,0,0,4,676,0,42,0,0,'hzuapps','wechat-miniprogram-hzc-2017',3,11,50,1),(3085,'ruan3zzk','1517060334',0,0,'',0,'',1,1,0,0,0,0,0,0,0,5,706,0,43,0,0,'hzuapps','wechat-miniprogram-hzc-2017',3,11,50,1),(3086,'xiaoyanhui123','1517060332',0,0,'',0,'',4,1,0,0,0,0,0,0,0,7,1010,0,49,1,0,'hzuapps','wechat-miniprogram-hzc-2017',3,11,86,1),(3087,'Sprite24','1517060321',124,1,'',1,'2017-11-01T01:43:58Z',6,2,2,0,0,0,0,0,0,8,1576,0,87,0,0,'hzuapps','wechat-miniprogram-hzc-2017',3,11,90,1),(3088,'liangfenghan','1517060329',128,1,'',0,'',5,1,0,0,0,0,0,0,0,5,1154,0,78,0,0,'hzuapps','wechat-miniprogram-hzc-2017',3,11,76,1),(3089,'13192350024','1517010101',123,1,'',1,'2017-11-01T01:32:15Z',5,1,0,0,0,0,0,0,0,11,940,3,32,0,0,'hzuapps','wechat-miniprogram-hzc-2017',3,11,83,1),(3090,'jackKiZhu','1517060342',113,2,'',1,'2017-10-25T03:36:38Z',6,1,0,0,0,0,0,0,0,11,1648,242,149,0,0,'hzuapps','wechat-miniprogram-hzc-2017',3,11,90,1),(3091,'azx2438201','1517010108',0,0,'',0,'',3,1,0,0,0,0,0,0,0,8,2169,0,52,0,0,'hzuapps','wechat-miniprogram-hzc-2017',3,11,70,1),(3092,'ChengZhiBin','1517060310',131,1,'',1,'2017-11-01T02:05:35Z',2,1,0,0,0,0,0,0,0,7,899,0,47,2,0,'hzuapps','wechat-miniprogram-hzc-2017',3,11,73,1),(3177,'KuhnHuge','1514080901236',47,1,'有点意思',12,'2017-10-28T14:09:06Z',6,1,0,3,0,0,0,0,0,8,1138,330,64,0,0,'hzuapps','web-wechat-2017',3,11,90,2),(3178,'adcGG','1514080901204',128,1,'',11,'2017-10-29T03:16:56Z',10,1,0,3,0,0,0,0,0,12,1191,78,57,0,0,'hzuapps','web-wechat-2017',3,11,90,2),(3179,'cs2JeX','1514080901203',92,1,'',12,'2017-10-26T01:48:24Z',6,1,1,0,0,0,0,0,1,8,847,464,65,1,0,'hzuapps','web-wechat-2017',3,11,100,2),(3180,'panweil','1514080901123',23,1,'',15,'2017-10-26T01:04:11Z',8,2,3,0,0,0,0,1,1,12,2138,121,367,5,0,'hzuapps','web-wechat-2017',3,11,100,2),(3181,'zhanquan','1514080901131',68,1,'',13,'2017-10-26T04:42:17Z',9,1,2,0,0,0,0,0,0,13,541,32,48,0,0,'hzuapps','web-wechat-2017',3,11,90,2),(3182,'Gracesa','1514080901238',18,1,'',13,'2017-10-27T03:14:07Z',8,1,1,0,0,0,0,0,0,8,1582,222,67,1,0,'hzuapps','web-wechat-2017',3,11,100,2),(3183,'Yangjiawei864','1514080901237',115,1,'',9,'2017-11-08T16:12:41Z',6,1,0,0,0,0,0,0,0,11,1563,712,81,2,0,'hzuapps','web-wechat-2017',3,11,100,2),(3184,'DanielLif','1514080901112',149,1,'',2,'2017-10-29T15:50:52Z',1,0,0,0,0,0,0,0,0,1,227,0,12,0,0,'hzuapps','web-wechat-2017',3,11,23,2),(3185,'zclsm','1512070501138',175,1,'有点意思',8,'2017-11-01T10:49:46Z',5,0,1,2,0,0,0,1,0,5,874,110,39,2,0,'hzuapps','web-wechat-2017',3,11,86,2),(3186,'ZHIHAOC','1514080901105',29,1,'',8,'2017-10-26T01:25:18Z',9,0,2,1,0,0,0,0,0,8,1161,103,33,2,0,'hzuapps','web-wechat-2017',3,11,100,2),(3187,'zhanghuihong','1514080901239',64,1,'有点意思',1,'2017-11-02T00:44:08Z',1,0,0,0,0,0,0,0,0,1,227,0,12,0,0,'hzuapps','web-wechat-2017',3,11,23,2),(3188,'huangmaoliu','1514080901232',72,1,'有点意思',7,'2017-11-01T10:46:25Z',10,1,0,1,0,0,0,0,0,7,1398,571,93,0,0,'hzuapps','web-wechat-2017',3,11,90,2),(3189,'lzhxh','1514080901218',101,1,'有点意思',13,'2017-10-26T05:05:57Z',6,1,1,1,0,0,0,0,0,10,2361,360,148,2,0,'hzuapps','web-wechat-2017',3,11,100,2),(3190,'tanyuhao','1514080901125',28,1,'有点意思',10,'2017-10-27T00:21:59Z',10,1,0,1,0,0,0,0,0,6,419,63,25,1,0,'hzuapps','web-wechat-2017',3,11,100,2),(3191,'CCGyyn','1514080901201',79,1,'有点意思',14,'2017-10-26T09:22:02Z',7,1,1,0,0,0,0,0,0,9,1242,133,48,1,0,'hzuapps','web-wechat-2017',3,11,100,2),(3192,'hhhhjq','1514080901211',102,1,'有点意思',13,'2017-10-26T05:39:56Z',6,1,1,0,0,0,0,0,0,11,876,223,45,2,0,'hzuapps','web-wechat-2017',3,11,100,2),(3193,'CchenWX','1514080901207',57,1,'有点意思',18,'2017-10-27T02:16:50Z',5,1,0,2,0,0,0,0,0,18,1350,691,84,0,0,'hzuapps','web-wechat-2017',3,11,83,2),(3194,'a505407658','1507070201123',40,1,'',17,'2017-10-29T10:51:17Z',9,1,0,2,0,0,0,0,0,16,984,610,66,0,0,'hzuapps','web-wechat-2017',3,11,90,2),(3195,'ldy12347','1513071001110',73,1,'',11,'2017-10-26T13:29:08Z',8,1,1,0,0,0,0,0,0,14,1653,84,74,0,0,'hzuapps','web-wechat-2017',3,11,90,2),(3196,'AllenMinD','1514080901122',9,1,'有点意思',23,'2017-10-26T00:45:24Z',10,1,5,0,0,0,0,0,0,20,3826,458,100,1,0,'hzuapps','web-wechat-2017',3,11,100,2),(3197,'DragonTeng','1514080901120',25,1,'',12,'2017-10-26T01:14:41Z',7,1,2,0,0,0,0,0,0,10,1868,617,99,0,0,'hzuapps','web-wechat-2017',3,11,90,2),(3198,'zhengsongmiao','1514080901137',37,1,'有点意思',8,'2017-10-29T03:18:36Z',9,1,1,0,0,0,0,0,0,31,2645,2253,101,0,0,'hzuapps','web-wechat-2017',3,11,90,2),(3199,'yuezhudxw','1514080901108',59,1,'',10,'2017-10-29T13:10:18Z',5,1,0,2,0,0,0,0,0,6,590,92,40,0,0,'hzuapps','web-wechat-2017',3,11,83,2),(3200,'Buruiwen','1509081602501',54,2,'',6,'2017-10-29T03:18:23Z',10,0,0,0,0,0,0,0,0,6,1044,523,108,0,0,'hzuapps','web-wechat-2017',3,11,90,2),(3201,'Emiya-Kiritsugu','1514080901202',45,1,'',10,'2017-10-29T11:53:01Z',6,2,0,0,0,0,0,0,0,11,800,99,50,0,0,'hzuapps','web-wechat-2017',3,11,90,2),(3202,'cuteboyjun','1514080901231',154,1,'',13,'2017-10-29T04:10:06Z',8,1,0,0,0,0,0,0,0,8,528,105,26,2,0,'hzuapps','web-wechat-2017',3,11,100,2),(3203,'laijunqiang','1514080901216',65,1,'',8,'2017-10-29T03:15:48Z',8,1,1,0,0,0,0,0,0,14,1022,65,60,0,0,'hzuapps','web-wechat-2017',3,11,90,2),(3204,'Reubon','1514080901225',93,1,'有点意思',14,'2017-10-29T12:31:05Z',8,1,0,2,0,0,0,0,0,15,902,262,62,1,0,'hzuapps','web-wechat-2017',3,11,100,2),(3205,'hzucyc','1514080901103',34,1,'',26,'2017-10-26T05:12:08Z',12,1,0,1,0,0,0,0,0,24,744,97,72,4,0,'hzuapps','web-wechat-2017',3,11,100,2),(3206,'Sephlroth','1514080901121',70,1,'',12,'2017-10-26T04:07:08Z',7,1,0,0,0,0,0,0,0,8,1343,191,74,3,0,'hzuapps','web-wechat-2017',3,11,100,2),(3207,'shawXXQ','1514080901234',46,1,'有点意思',12,'2017-10-26T01:12:57Z',6,1,3,0,0,0,0,0,1,13,670,100,48,1,0,'hzuapps','web-wechat-2017',3,11,100,2),(3208,'ShadowWarLock','1514080901117',26,1,'',19,'2017-10-26T00:54:25Z',8,1,3,0,0,0,0,0,0,27,710,279,71,0,0,'hzuapps','web-wechat-2017',3,11,90,2),(3209,'fengdejiyi712','1514080901222',36,1,'',17,'2017-10-26T04:51:29Z',8,1,3,0,0,0,0,0,0,13,600,107,32,0,0,'hzuapps','web-wechat-2017',3,11,90,2),(3210,'YJJJack','1514080901132',90,1,'',15,'2017-10-26T01:43:24Z',12,1,0,0,0,0,0,1,0,12,2674,1042,99,1,0,'hzuapps','web-wechat-2017',3,11,100,2),(3211,'Girlsmile','1514080901208',194,1,'',10,'2017-11-01T13:54:27Z',6,0,0,1,0,0,0,0,0,9,1127,0,40,0,0,'hzuapps','web-wechat-2017',3,11,90,2),(3212,'Hfenru','1514080901109',14,1,'',12,'2017-10-26T04:08:03Z',6,1,1,0,0,0,0,0,0,7,721,186,35,0,0,'hzuapps','web-wechat-2017',3,11,90,2),(3213,'czxuyixin','1514080901129',24,1,'',15,'2017-10-26T01:26:09Z',8,1,1,0,0,0,0,0,0,8,1666,1342,309,0,0,'hzuapps','web-wechat-2017',3,11,90,2),(3214,'teajoy','1514080901210',48,1,'',9,'2017-10-27T00:21:01Z',8,1,1,0,0,0,0,0,0,8,1137,347,58,4,0,'hzuapps','web-wechat-2017',3,11,100,2),(3215,'ZjChenyk','1514080901104',63,1,'有点意思',16,'2017-10-26T08:45:42Z',6,1,2,0,0,0,0,0,0,18,6935,0,199,0,0,'hzuapps','web-wechat-2017',3,11,90,2),(3216,'bigbigban','1514080901224',184,1,'',10,'2017-11-08T14:06:31Z',6,1,0,0,0,0,0,0,0,7,670,173,27,0,0,'hzuapps','web-wechat-2017',3,11,90,2),(3217,'Dlezai','1514080901107',21,1,'有点意思',12,'2017-10-26T09:34:39Z',8,1,2,0,0,0,0,0,0,9,895,274,28,0,0,'hzuapps','web-wechat-2017',3,11,90,2),(3218,'yug116','1514080901233',49,1,'',9,'2017-10-26T04:00:24Z',4,0,1,2,0,0,0,0,0,5,698,96,53,1,0,'hzuapps','web-wechat-2017',3,11,80,2),(3219,'wazhuroujuan','1514080901134',174,1,'',11,'2017-10-29T14:38:38Z',11,1,0,2,0,0,0,1,0,7,708,303,31,5,0,'hzuapps','web-wechat-2017',3,11,100,2),(3220,'Moxiuzhu','1514080901221',11,1,'',15,'2017-10-26T01:24:33Z',9,1,4,0,0,0,0,0,0,11,720,41,45,0,0,'hzuapps','web-wechat-2017',3,11,90,2),(3221,'879579620','1514080901229',10,1,'',14,'2017-10-26T05:07:44Z',6,1,3,0,0,0,0,0,1,14,1630,443,74,1,0,'hzuapps','web-wechat-2017',3,11,100,2),(3222,'MercyMo','1514080901106',61,1,'',13,'2017-10-26T01:00:01Z',9,1,4,0,0,0,0,0,0,9,843,96,42,3,0,'hzuapps','web-wechat-2017',3,11,100,2),(3223,'lautnerk','1514080901206',150,1,'',11,'2017-10-29T03:18:56Z',9,1,1,1,0,0,0,0,1,7,617,40,36,0,0,'hzuapps','web-wechat-2017',3,11,90,2),(3224,'FFFfire666','1514080901128',82,1,'有点意思',19,'2017-10-26T05:01:10Z',8,1,3,0,0,0,0,0,0,14,1094,216,51,5,0,'hzuapps','web-wechat-2017',3,11,100,2),(3225,'hongxiangliu','1514080901119',27,2,'',7,'2017-10-26T23:58:32Z',11,0,0,0,0,0,0,0,0,7,701,7,34,1,0,'hzuapps','web-wechat-2017',3,11,100,2),(3226,'hzuzkt','1514080901135',88,1,'有点意思',21,'2017-10-26T01:37:44Z',9,1,1,0,0,0,0,0,0,20,5104,4076,247,3,0,'hzuapps','web-wechat-2017',3,11,100,2),(3227,'lizhoupeng','1514080901113',33,1,'',16,'2017-10-26T01:30:19Z',8,1,1,0,0,0,0,0,0,11,936,271,76,0,0,'hzuapps','web-wechat-2017',3,11,90,2),(3228,'zengsn','null',6,6,'实验',28,'2017-12-05T11:52:28Z',4,0,0,0,0,0,0,0,0,4,4647,1525,150,0,0,'hzuapps','web-wechat-2017',3,11,63,2),(3229,'huangrenzhong','1514080901212',99,1,'',4,'2017-10-29T16:30:11Z',1,0,0,0,0,0,0,0,0,1,228,0,13,0,0,'hzuapps','web-wechat-2017',3,11,23,2),(3230,'zhouzech','1506081301243',78,1,'',10,'2017-10-30T13:27:28Z',5,0,0,1,0,0,0,0,0,5,904,535,82,0,0,'hzuapps','web-wechat-2017',3,11,76,2),(3231,'TBAatrox','1514080901133',161,1,'有点意思',12,'2017-10-29T12:18:12Z',7,2,1,0,0,0,0,0,0,24,780,95,43,1,0,'hzuapps','web-wechat-2017',3,11,100,2),(3232,'pig-w','1514080901230',89,1,'',9,'2017-10-29T03:16:18Z',11,1,0,4,0,0,0,0,0,10,485,14,30,1,0,'hzuapps','web-wechat-2017',3,11,100,2),(3233,'xukaitian','1506081301236',177,1,'',13,'2017-10-30T05:54:13Z',7,0,0,1,0,0,0,0,0,10,1730,80,83,0,0,'hzuapps','web-wechat-2017',3,11,90,2),(3234,'miamiluo96','1512120901132',329,1,'',2,'2017-11-15T13:14:18Z',1,0,0,1,0,0,0,0,0,1,228,0,12,0,0,'hzuapps','web-wechat-2017',3,11,23,2),(3235,'sk-2017','1514080901228',62,1,'有点意思',13,'2017-10-26T14:13:54Z',7,1,0,0,0,0,0,0,0,13,875,75,41,0,0,'hzuapps','web-wechat-2017',3,11,90,2),(3236,'351655914','1514080901116',38,1,'',10,'2017-10-26T04:07:48Z',6,1,5,0,0,0,0,0,1,6,681,139,25,0,0,'hzuapps','web-wechat-2017',3,11,90,2),(3237,'xwh511','1513071002132',16,1,'有点意思',13,'2017-10-26T01:37:30Z',8,1,0,0,0,0,0,0,0,13,1174,38,54,2,0,'hzuapps','web-wechat-2017',3,11,100,2),(3238,'ZhiHu-ZheYe','1514080901138',30,2,'有点意思',4,'2017-10-30T04:27:40Z',2,0,0,0,0,0,0,0,0,2,401,74,14,0,0,'hzuapps','web-wechat-2017',3,11,36,2),(3239,'1369949044','1514080901130',32,1,'有点意思',14,'2017-10-28T15:58:41Z',8,1,0,0,0,0,0,0,0,9,437,141,34,0,0,'hzuapps','web-wechat-2017',3,11,90,2),(3240,'chasel34','1514080901139',15,1,'',9,'2017-10-26T00:53:20Z',7,0,3,0,0,0,0,0,0,8,688,146,28,0,0,'hzuapps','web-wechat-2017',3,11,90,2),(3241,'MuZiL1','1514080901217',53,1,'',7,'2017-11-01T10:45:40Z',9,1,0,0,0,0,0,0,0,9,745,45,28,0,0,'hzuapps','web-wechat-2017',3,11,90,2),(3242,'NumenJamila','1514080901101',35,1,'',10,'2017-10-29T03:16:40Z',11,1,4,0,0,0,0,0,1,8,1522,293,40,2,0,'hzuapps','web-wechat-2017',3,11,100,2),(3243,'JIZHILING','1514080901214',55,1,'',6,'2017-11-01T10:47:12Z',10,1,0,1,0,0,0,0,0,8,1263,350,78,2,0,'hzuapps','web-wechat-2017',3,11,100,2),(3244,'leon0723','1514080901240',58,1,'',10,'2017-10-30T04:21:25Z',4,1,0,1,0,0,0,0,0,6,1280,61,25,2,0,'hzuapps','web-wechat-2017',3,11,86,2),(3245,'linhaohong','1514080901115',95,1,'',10,'2017-10-26T01:48:48Z',6,1,1,1,0,0,0,0,0,7,847,15,31,0,0,'hzuapps','web-wechat-2017',3,11,90,2),(3246,'YanRuan','1514080901114',20,1,'',12,'2017-10-26T01:20:14Z',6,1,3,0,0,0,0,0,0,14,1423,479,81,0,0,'hzuapps','web-wechat-2017',3,11,90,2),(3247,'guorunlin','1514080901209',130,1,'有点意思',13,'2017-10-27T02:01:25Z',8,1,1,0,0,0,0,0,0,13,832,33,32,0,0,'hzuapps','web-wechat-2017',3,11,90,2),(3248,'lwYU','1514080901111',157,1,'有点意思',10,'2017-10-29T10:36:16Z',7,1,0,0,0,0,0,0,0,8,785,40,36,1,0,'hzuapps','web-wechat-2017',3,11,100,2),(3249,'mmpmvpvip','1514080901226',50,1,'',13,'2017-10-29T11:48:16Z',6,1,0,0,0,0,0,0,0,7,826,24,36,0,0,'hzuapps','web-wechat-2017',3,11,90,2),(3250,'BrightLee121','1513071001116',42,1,'',10,'2017-10-26T07:28:45Z',5,1,0,0,0,0,0,1,0,6,930,98,38,1,0,'hzuapps','web-wechat-2017',3,11,93,2),(3251,'panxiaomian','1514080901223',19,1,'',13,'2017-10-26T01:43:33Z',8,1,1,0,0,0,0,0,0,8,1385,185,28,0,0,'hzuapps','web-wechat-2017',3,11,90,2),(3252,'Leezxy','1514080901110',166,1,'有点意思',13,'2017-10-29T13:06:57Z',5,1,0,0,0,0,0,0,0,7,387,34,27,0,0,'hzuapps','web-wechat-2017',3,11,83,2),(3253,'wmingl','1513071001131',75,1,'有点意思',15,'2017-10-30T12:53:09Z',8,1,1,0,0,0,0,0,0,12,719,135,47,0,0,'hzuapps','web-wechat-2017',3,11,90,2),(3254,'Zein-36','1514080901136',39,1,'',11,'2017-10-26T04:40:40Z',6,1,2,0,0,0,0,0,0,6,876,169,53,0,0,'hzuapps','web-wechat-2017',3,11,90,2),(3255,'wagez','1514080901140',13,1,'有点意思',11,'2017-10-26T04:07:23Z',6,1,1,0,0,0,0,0,0,14,795,244,23,0,0,'hzuapps','web-wechat-2017',3,11,90,2),(3256,'sunlightcold','1514080901205',41,1,'',8,'2017-10-27T00:19:28Z',11,1,2,0,1,0,0,0,1,8,2564,796,121,6,0,'hzuapps','web-wechat-2017',3,11,100,2),(3257,'jia-forest','1514080901220',52,1,'',4,'2017-10-29T12:46:11Z',2,0,0,0,0,0,0,0,0,2,505,2,23,0,0,'hzuapps','web-wechat-2017',3,11,36,2),(3258,'lanehunter','1514080901215',56,1,'',10,'2017-11-04T23:59:19Z',20,1,0,4,0,0,0,1,0,12,1724,79,36,1,0,'hzuapps','web-wechat-2017',3,11,100,2),(3259,'JMLUO','1514080901127',12,1,'',14,'2017-10-26T01:05:34Z',8,1,2,0,0,0,0,0,0,11,1096,95,66,1,0,'hzuapps','web-wechat-2017',3,11,100,2),(3260,'hongdi178','1507070201226',17,1,'有点意思',8,'2017-10-26T23:57:23Z',7,2,0,0,0,0,0,0,0,8,507,102,31,1,0,'hzuapps','web-wechat-2017',3,11,100,2),(3467,'LIMITAYANG','1414080902220',80,1,'',0,'',4,0,0,0,0,0,0,0,0,5,10167,2,23,0,0,'hzuapps','java-web',1,10,70,9901),(3468,'heymanheymanheyman','1414080902204',95,1,'',9,'2016-10-16T16:29:32Z',8,0,1,0,0,0,0,0,0,9,7789,91,41,3,0,'hzuapps','java-web',1,10,101,9901),(3469,'CaiRencai','1414080902228',93,1,'',0,'',9,0,0,0,0,0,0,0,0,17,566,34,16,1,0,'hzuapps','java-web',1,10,100,9901),(3470,'cyk0505','1414080902112',76,1,'',0,'',6,0,0,0,0,0,0,0,0,9,470,10,13,0,0,'hzuapps','java-web',1,10,90,9901),(3471,'zhengde','1414080902124',66,1,'',5,'2016-10-24T02:16:52Z',6,0,1,0,0,0,0,0,0,6,721,12,18,2,0,'hzuapps','java-web',1,10,101,9901),(3472,'Mr-bingo','1414080902108',63,1,'',5,'2016-10-18T14:50:35Z',7,0,3,0,0,0,0,1,0,13,3569,283,39,3,0,'hzuapps','java-web',1,10,103,9901),(3473,'Zhengzh00','1414080902210',240,1,'',0,'',14,0,1,0,0,0,0,0,0,16,1844,85,32,0,0,'hzuapps','java-web',1,10,91,9901),(3474,'gremm','1414080902109',75,1,'',0,'',3,0,0,0,0,0,0,0,0,6,256,0,7,0,0,'hzuapps','java-web',1,10,70,9901),(3475,'smallice','null',195,1,'',0,'',4,0,0,1,0,0,0,0,0,2,151,0,4,0,0,'hzuapps','java-web',1,10,45,9901),(3476,'choisound','1414080902226',0,0,'',0,'',7,0,1,0,0,0,0,0,0,9,819,98,32,5,0,'hzuapps','java-web',1,10,101,9901),(3477,'huangzejay','1414080902206',0,0,'',0,'',3,0,0,1,0,0,0,0,0,7,680,2,13,0,0,'hzuapps','java-web',1,10,69,9901),(3478,'TheBestP','1414080902137',73,2,'',0,'',5,0,0,1,0,0,0,0,0,9,825,63,25,2,0,'hzuapps','java-web',1,10,92,9901),(3479,'DarlieToothpaste','1414080902232',96,1,'',0,'',8,0,1,0,0,0,0,0,0,9,589,2,14,3,0,'hzuapps','java-web',1,10,101,9901),(3480,'7thSunday','1414080902234',224,1,'',0,'',7,0,1,0,0,0,0,1,0,18,562,46,21,2,0,'hzuapps','java-web',1,10,101,9901),(3481,'HCJ0HCJ','1414080902138',78,1,'',6,'2016-10-18T14:12:33Z',6,0,1,0,0,0,0,0,0,13,678,3,15,0,0,'hzuapps','java-web',1,10,91,9901),(3482,'Chaojudge','1414080902117',152,1,'',9,'2016-11-07T02:14:41Z',8,0,0,0,0,0,0,0,0,14,12169,1150,40,2,0,'hzuapps','java-web',1,10,100,9901),(3483,'yuhomx','1414080902140',101,1,'',0,'',6,0,1,0,0,0,0,0,0,7,1443,155,31,1,0,'hzuapps','java-web',1,10,101,9901),(3484,'ChowWd','1414080902221',173,1,'',0,'',7,0,1,0,0,0,0,0,0,6,506,0,12,0,0,'hzuapps','java-web',1,10,91,9901),(3485,'Huangjh14','1414080902218',74,1,'',0,'',2,0,0,2,0,0,0,0,0,2,122,0,4,0,0,'hzuapps','java-web',1,10,31,9901),(3486,'141zhongyiChen','1414080902128',53,1,'',0,'',1,0,0,0,0,0,0,0,0,1,179,0,3,0,0,'hzuapps','java-web',1,10,18,9901),(3487,'mpq1228','1406070302213',199,1,'',0,'',7,0,1,0,0,0,0,0,0,14,608,214,19,1,0,'hzuapps','java-web',1,10,101,9901),(3488,'nihaomahenhaoba','1414080902216',397,1,'',2,'2016-11-20T09:40:07Z',4,0,1,1,0,0,0,0,0,7,396,1,10,0,0,'hzuapps','java-web',1,10,76,9901),(3489,'zhangwanging','1414080902230',114,1,'',0,'',6,0,0,0,0,0,0,0,0,14,389,12,12,1,0,'hzuapps','java-web',1,10,100,9901),(3490,'bestwayr','1414080902202',109,1,'',20,'2016-10-19T16:32:57Z',9,0,0,0,0,0,0,0,0,152,809,102,22,0,0,'hzuapps','java-web',1,10,90,9901),(3491,'SlowSoulWen','1414080902237',94,1,'',0,'',10,0,0,3,0,0,0,0,0,14,10061,63,17,2,0,'hzuapps','java-web',1,10,97,9901),(3492,'chenshun2016','1414080902214',307,1,'',0,'',5,0,0,0,0,0,0,0,0,6,329,0,10,1,0,'hzuapps','java-web',1,10,93,9901),(3493,'ruizhuzhiling','1414080902114',86,1,'',6,'2016-11-07T05:00:35Z',16,0,1,0,0,0,0,0,0,28,1417,134,49,1,0,'hzuapps','java-web',1,10,101,9901),(3494,'LincoXiaoQ','1414080902212',62,1,'',6,'2016-11-12T04:52:01Z',7,0,2,0,0,0,0,0,0,7,1265,123,32,3,0,'hzuapps','java-web',1,10,102,9901),(3495,'fanslead','1414080902120',0,0,'',0,'',6,0,0,0,0,0,0,1,0,13,923,45,20,3,0,'hzuapps','java-web',1,10,100,9901),(3496,'tangjianliang','1414080902111',65,1,'',5,'2016-11-07T02:32:18Z',9,0,0,0,0,0,0,0,0,24,624,0,15,1,0,'hzuapps','java-web',1,10,100,9901),(3497,'hvvvvccc','1414080902103',68,1,'',0,'',10,0,1,0,0,0,0,0,0,7,739,135,19,2,0,'hzuapps','java-web',1,10,101,9901),(3498,'Ysom','1414080902233',179,1,'',4,'2016-10-19T15:26:59Z',8,0,1,0,0,0,0,0,0,8,868,183,16,0,0,'hzuapps','java-web',1,10,91,9901),(3499,'hahamg','1414080902222',85,1,'',0,'',6,0,1,0,0,0,0,1,0,13,530,80,11,1,0,'hzuapps','java-web',1,10,101,9901),(3500,'29liweiliang','1414080902129',60,1,'',0,'',6,0,0,0,0,0,0,0,0,7,595,200,20,0,0,'hzuapps','java-web',1,10,90,9901),(3501,'zoukewen','1414080902104',84,2,'',0,'',6,0,0,0,0,0,0,0,0,8,575,0,14,1,0,'hzuapps','java-web',1,10,100,9901),(3502,'liudao-yupeng','1413071001206',327,2,'',0,'',7,0,0,2,0,0,0,0,0,5,530,0,11,3,0,'hzuapps','java-web',1,10,91,9901),(3503,'630440348','1414080902126',70,1,'',10,'2016-10-20T03:24:37Z',8,0,1,0,0,0,0,1,0,8,561,0,16,0,0,'hzuapps','java-web',1,10,91,9901),(3504,'XXLiang1122','1414080902215',200,1,'',0,'',8,0,1,0,0,0,0,0,0,12,552,38,18,1,0,'hzuapps','java-web',1,10,101,9901),(3505,'Zjwjerry','1414080902203',126,1,'',0,'',11,0,1,0,0,0,0,0,0,28,1022,17,26,1,0,'hzuapps','java-web',1,10,101,9901),(3506,'hy346143551','1414080902101',91,2,'',1,'2016-11-10T12:47:42Z',6,0,0,3,0,0,0,0,0,5,328,0,9,2,0,'hzuapps','java-web',1,10,90,9901),(3507,'Danivy','1414080902205',170,1,'',0,'',9,0,3,0,0,0,0,0,0,13,508,38,13,2,0,'hzuapps','java-web',1,10,103,9901),(3508,'qiuwenqiol','1414080902119',72,2,'',0,'',10,0,0,0,0,0,0,0,0,18,1062,462,35,3,0,'hzuapps','java-web',1,10,100,9901),(3509,'gyy1238','1414080902115',56,1,'',0,'',9,0,0,0,0,0,0,0,0,12,1035,78,22,1,0,'hzuapps','java-web',1,10,100,9901),(3510,'pigosy','1414080902231',127,1,'',1,'2016-10-23T13:35:44Z',6,0,1,0,0,0,0,0,0,8,1114,113,25,2,0,'hzuapps','java-web',1,10,101,9901),(3511,'UncleCoke','1414080902130',92,1,'',0,'',7,0,1,0,0,0,0,0,0,13,1283,21,20,0,0,'hzuapps','java-web',1,10,91,9901),(3512,'iDream666','1414080902207',198,1,'',0,'',7,0,1,0,0,0,0,0,0,26,2299,144,24,4,0,'hzuapps','java-web',1,10,101,9901),(3513,'DarkRequiem','1414080902239',229,1,'',0,'',5,0,0,0,0,0,0,0,0,6,658,0,15,1,0,'hzuapps','java-web',1,10,93,9901),(3514,'zzwwhao','1414080902224',52,1,'',3,'2016-10-30T11:10:45Z',10,0,0,0,0,0,0,0,0,15,392,28,18,2,0,'hzuapps','java-web',1,10,100,9901),(3515,'1414080902208','1414080902208',226,1,'',3,'2016-11-21T01:43:58Z',6,0,0,0,0,0,0,0,0,7,593,26,16,1,0,'hzuapps','java-web',1,10,100,9901),(3516,'Hongsf','1414080902110',77,1,'',11,'2016-10-16T01:14:53Z',9,0,4,0,0,0,0,1,0,70,7017,0,19,0,0,'hzuapps','java-web',1,10,94,9901),(3517,'201609w','1414080902236',144,1,'',0,'',8,0,1,0,0,0,0,0,0,10,855,0,18,1,0,'hzuapps','java-web',1,10,101,9901),(3518,'Vialyn','1414080902131',105,1,'',9,'2016-10-20T03:16:50Z',12,0,0,0,0,0,0,0,0,11,1940,234,47,1,0,'hzuapps','java-web',1,10,100,9901),(3519,'HurricanGod','1414080902225',142,1,'',0,'',11,0,2,0,0,0,0,1,0,9,2270,93,29,2,0,'hzuapps','java-web',1,10,102,9901),(3520,'firesWu','1414080902229',0,0,'',0,'',7,0,0,3,0,0,0,0,0,11,298,76,10,2,0,'hzuapps','java-web',1,10,97,9901),(3521,'Hyelleto','1414080902107',190,1,'',0,'',2,0,0,0,0,0,0,0,0,6,298,68,6,0,0,'hzuapps','java-web',1,10,63,9901),(3522,'swindy1','1414080902219',59,1,'',0,'',7,0,1,0,0,0,0,0,0,12,1088,70,22,1,0,'hzuapps','java-web',1,10,101,9901),(3523,'chunliwang','1414080902141',106,2,'',3,'2016-10-28T14:01:45Z',8,0,0,1,0,0,0,0,0,3,212,0,6,1,0,'hzuapps','java-web',1,10,79,9901),(3524,'ch135','1414080902135',61,1,'',0,'',12,0,2,0,0,0,1,0,0,22,1229,227,58,4,0,'hzuapps','java-web',1,10,101,9901),(3525,'jordankobejames','1414080902116',121,1,'',2,'2016-10-24T02:47:12Z',8,0,0,0,0,0,2,1,0,11,1776,129,45,4,0,'hzuapps','java-web',1,10,98,9901),(3526,'jiushig','1414080902139',83,1,'',2,'2016-11-08T15:44:31Z',6,0,1,0,0,0,0,1,0,14,2464,29,32,2,0,'hzuapps','java-web',1,10,101,9901),(3527,'wuchubin','1414080902211',99,1,'',0,'',6,0,0,0,0,0,2,0,0,9,827,99,17,4,0,'hzuapps','java-web',1,10,98,9901),(3528,'Yveemi','1414080902240',90,1,'',0,'',5,0,2,0,0,0,0,0,0,10,653,7,14,1,0,'hzuapps','java-web',1,10,95,9901),(3529,'CXCong','1414080902105',82,1,'',0,'',7,0,0,1,0,0,0,0,0,15,543,0,16,3,0,'hzuapps','java-web',1,10,99,9901),(3530,'kangwen123','1414080902102',160,1,'',3,'2016-10-20T07:30:15Z',8,0,0,0,0,0,0,0,0,9,503,80,12,1,0,'hzuapps','java-web',1,10,100,9901),(3531,'Sm1les','1414080902201',107,1,'',0,'',6,0,2,0,0,0,0,0,0,10,737,38,23,0,0,'hzuapps','java-web',1,10,92,9901),(3532,'yoxiang','1414080902121',79,2,'',0,'',6,0,0,0,0,0,0,0,0,10,415,60,11,1,0,'hzuapps','java-web',1,10,100,9901),(3533,'WayhomeChen','1414080902106',153,1,'',0,'',9,0,1,0,0,0,0,1,0,6,4049,537,100,2,0,'hzuapps','java-web',1,10,101,9901),(3534,'oldslave','1414080902238',154,1,'',0,'',6,0,2,0,0,0,0,0,0,13,525,42,19,1,0,'hzuapps','java-web',1,10,102,9901),(3537,NULL,'1234',NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,1,1,11,1,1,NULL,NULL,11,11,NULL,'csa从输出','大V上拆分we',16,1,3123,9901),(3540,NULL,'1514080901114',NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,1,1,1,1,1,NULL,NULL,1,1,NULL,'a','aa',3,1,111,1),(3541,NULL,'1514080901114',NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,1,1,1,1,1,NULL,NULL,1,1,NULL,'1','1',13,1,111,1),(3542,NULL,'1514080901114',NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,1,1,1,1,1,NULL,NULL,1,1,NULL,'1','1',8,1,111,1),(3543,NULL,'1514080901114',NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,1,1,1,1,1,NULL,NULL,1,1,NULL,'1','1',5,1,111,1),(3544,NULL,'1514080901114',NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,1,1,1,1,1,NULL,NULL,1,1,NULL,'1','1',13,1,111,1),(3545,NULL,'1',NULL,NULL,NULL,NULL,NULL,1,1,1,1,11,1,1,1,1,1,NULL,NULL,1,1,NULL,'1','1',4,1,111,1),(3546,NULL,'1514080901114',NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,1,1,1,1,1,NULL,NULL,1,1,NULL,'1','1',2,1,111,1),(3547,NULL,'1514080901114',NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,1,1,1,1,1,NULL,NULL,1,1,NULL,'1','1',3,1,111,1),(3548,NULL,'1514080901114',NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,1,1,1,1,1,NULL,NULL,1,1,NULL,'1','1',6,1,111,1),(3549,NULL,'1514080901114',NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,1,1,1,1,1,NULL,NULL,1,1,NULL,'1','1',5,1,111,1),(3551,NULL,'1514080901114',NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,1,1,1,1,1,NULL,NULL,1,1,NULL,'1','1',14,12,111,1);
/*!40000 ALTER TABLE `reposdate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snav`
--

DROP TABLE IF EXISTS `snav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `snav_name` varchar(255) DEFAULT NULL,
  `remark` mediumtext,
  `fnav_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FnavId_idx` (`fnav_id`),
  CONSTRAINT `FnavId` FOREIGN KEY (`fnav_id`) REFERENCES `fnav` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snav`
--

LOCK TABLES `snav` WRITE;
/*!40000 ALTER TABLE `snav` DISABLE KEYS */;
INSERT INTO `snav` VALUES (17,'中心概括','<p>信息科学技术学院移动互联网虚拟仿真实验教学中心隶属于惠州学院计算机实验教学示范中心（省级，2012年），由二级学院直接管理，实行中心主任负责制。</p><p>信息科学技术学院移动互联网虚拟仿真实验教学中心依托信息科学技术学院现有3个专业计算机科学与技术、软件工程、网络工程，同时在建设计划中纳入对新申报的网络空间安全专业的支持，目标是建设及虚拟化5个与移动互联网相关的实验室（移动应用开发实验室、计算机网络技术实验室、计算机网络集成实验室、物联网实验室和网络信息安全虚拟仿真实验室）。</p><p>本着“虚实实验结合、实验教学与科研成果转化结合、模拟实验与与企业应用结合”的“三结合”建设理念，中心致力于建设开放式移动互联网虚拟仿真实验教学管理与共享平台，其中包含虚拟仿真实验教学系统（资源）7个：移动应用开发实验教学系统（实验项目8个）、HTML5高级网页实验教学系统（实验项目6个）、计算机网络实验教学系统（实验项目8项）、网络规划综合实验教学系统（综合实验项目1项）、路由与交换技术实验教学系统（实验项目8项）。目前已建成虚拟仿真实验课程5门，虚拟仿真实验项目30项。从2018年起，针对采用2016版培养方案的专业（大三），将建设和开设物联网应用与技术、网络安全、信息安全等实验课程。另外，实验中心也将支持和承担新申报专业“网络空间安全”的部分实验教学课程。最终形成的移动互联网虚拟仿真实验中心架构如图1所示。</p><figure class=\"image\"><img src=\"/allProjUpload/customizableSys/editorUploadImage/7096820180812figure1.png\"><figcaption>图1：实验中心组织架构图</figcaption></figure>',1),(18,'发展历程','<p>信息科学技术学院移动互联网虚拟仿真实验教学中心隶属于惠州学院计算机实验教学示范中心。惠州学院计算机实验教学示范中心成立于2004年，后于2012年被批准为广东省高等学校省级教学实验示范中心。</p><p>目前实验中心拥有计算机组成原理及微机接口、操作系统、网络工程、数字逻辑与数字系统、嵌入式系统、软件工程、多媒体技术、智能信息处理、移动应用开发、企业信息化等10个实验室；与企业联合建立了“公共安全协同创新中心”、“旭惠信息技术创新中心”、“公共信息安全技术研究联合实验室”、“新一代IT协同创新中心”、“惠州电商人才培训基地”，配置各类计算机设备1000余台，为教学和科学研究提供了良好的实验环境。</p>',1),(19,'队伍建设','<p>本虚拟仿真实验教学队伍以中青年教师为主，所有成员目前均从事一线实验教学工作，其中大部分成员为高级职称（68%），整个教学队伍具有较高的教学水平和优秀的教学成果，主要具体如下：</p><ol><li>教学队伍成员有优异的一线教学水平上。教学队伍成员均为计算机专业课程负责人和主讲教师，理论教学及实验教学工作量饱满，近年来平均教学评价结果均为优秀（90分）以上。其中，所有教授均参与计算机专业授课及虚拟实验教学，例如：彭刚（教授，院长）负责《软件项目管理》等课程的授课与实验，蔡昭权（教授）负责《计算机网络工程》的授课与实验。此外，其他教学队伍核心人员也直接担任主要课程的授课与实验工作，其中中心主任曾少宁（网络工程系主任）是《移动应用设计与开发》、《高级网页设计》等课程负责人，参与授课与虚拟实验教授，汪华斌（副教授）负责《计算机网络》课程的授课与实验。教学队伍基本覆盖中心的所有实验课程，并且具有较高的教学经验和水平。</li><li>教学队伍成员的教学成果显著。其中，中心主任曾少宁已主持过1项省级和2项校级教研教改课题，完成了1项双语示范课程，指导过2项省级大创项目和多项校级大创项目，曾经指导学生参加学科竞赛多次获得国家级和省级奖项，发表了多篇与虚拟实验教学技术相关的教学研究论文。核心成员彭刚教授2017年获得惠州学院校级教学成果一等奖。蔡昭权教授2017年入选广东省本科高校创新创业教育教学指导委员会。汪华斌、李慧老师各主持1项省级教研教改项目。此外，教学队伍其他成员也曾经主持或参与各级教学质量工程和教研教改项目。</li></ol>',1),(20,'虚拟仿真实验教学优势','<p>随着信息技术的发展，作为传统实验教学的一种有效的补充，虚拟仿真实验教学已经成为加强实践教学、提高教学质量的重要手段，它不仅可以在一定程度上代替传统的实验教学，而且可以克服传统实验的各种制约和弊端，从而有效地解决目前实验教学中存在的诸多问题。将虚拟实验教学融入现有教学体系，能够节约实验成本，提高学生素质。既解决了学校实验教学的实际问题，又顺应国家严抓教学质量、注重创新人才培养的精神。建立开放式基于网络与虚拟化技术的移动互联网虚拟仿真实验教学中心将成为信息科学技术学院实验室建设新的亮点和教学质量提升的助推器。</p><p><strong>一方面，所开设专业课程实验要求决定了需要有虚拟仿真实验教学中心的支持。</strong></p><p>（1）移动应用开发平台直接采购成本高，手机、平板电脑等移动实验设备难以管理。例如，在基于Android的移动应用开发课程实验中，需要为学生分配适合不同版本的移动平台实验环境，如果采用真机（Android手机）来实现，需要中心投入大量的资金购买手机设备，同时这些设备会给实验中心带来无法承担的管理风险。而采用虚拟化的技术，通过虚拟软件技术为学生分配实验机，则可以完全规避这些问题。</p><p>（2）软件定义网络（SDN）、虚拟网络设备等计算机网络新技术实验天生需要依托虚拟化软件实验平台，无法在单纯硬件的实验平台上进行。目前已经开设的路由、组网等实验课程，在传统IT架构中的网络中，其配置是一件非常繁琐的事情。采用虚拟化技术之后，无需对网络中每个节点的设备（路由器、交换机、防火墙）反复进行配置，网络中的设备本身就是自动化连通的。只需要在使用时定义好简单的网络规则即可。如果用户不喜欢网络设备（路由器、交换机、防火墙）自身内置的协议，还可以通过编程的方式对其进行修改，以实现更好的数据交换性能。除此之外，未来课程需要涉及的软件定义网络（SDN）等网络新代表了一种新趋势，是未来网络设备发展的主流之一。而开设这些新课程，都需要虚拟仿真实验环境的支持。</p><p>（3） 大型综合设计性网络实验成本高且实现难度困难。大型综合设计性网络实验，如大型校园网络需求分析、方案设计与系统集成，企业网搭建与应用，园区网互联及网站建设等大型综合设计性网络实验，是网络工程专业、物联网专业，以及相关的计算机专业网络工程实验的亮点和难点，如果能开展贴近现实的、大型校园网、企业网以及园区网的综合性实验，对学生综合利用网络工程的知识、提高学生实际网络集成的水平有极大的帮助。但由于大型综合设计性网络实验，需要的网络设备类型多、数量大、拓扑结构复杂多样，设置和调试复杂困难，实体实验室由于成本的原因，以及实验场地的限制，在实现上非常困难，难以实现。虚拟仿真实验环境中，增加新的实验设备容易，提供的拓扑结构可以非常复杂，可扩展性强，可根据教学需要灵活添加实验设备及典型实验，提供个性化定制服务；而且实验界面友好直观、所有的仿真网络实验设备操作贴近实际，真实感强；每个学生都可以在虚拟仿真环境中，独立或共同设计大型的综合型网络实验，受益的学生多，对提高学生实现网络集成的能力有极大的帮助，具有实体网络实验不可替代的作用。</p><p>（4） 网络安全类实验在实际网络中难以实现。采用防火墙、入侵检测、VPN等设备搭建网络安全实验平台，不但成本高，学生受益面窄，多个设备仅支持单个用户的配置操作，一个实验室需要配置多套相同的设备；而且仅支持对安全配置等偏工程应用类的实验，无法进行信息安全原理相关的教学和实验，更无法进行大型综合安全实验。在实体网络类实验室直接做网络安全类实验，由于实体网络类实验室线路与校园网络直连，因此可能造成病毒等不良数据外溢，严重影响校园网络安全，造成无法预料的严重后果，所以网络安全类实验在实际网络中难以实现，最好在虚拟仿真的环境下进行。中心根据真实网络及信息安全环境，基于真实的网络安全设备，采用硬件虚拟、软件仿真的方式，建立了一个技术先进、覆盖面广、扩展性强的网络信息安全虚拟仿真实验室，可以让学生通过独立操作或者分组合作，进行网络信息安全各个领域知识的学习和配套实验操作，通过虚拟仿真实验的操作，加快、加深理论知识的学习，同时通过仿真实验环境下理论知识的讲解加深对实际动手操作的理解，实现理论与实践教学的结合。特别是在虚拟仿真网络环境下，可以方便地进行网络攻防实验和大型综合安全实验，不会对实体的网络环境造成影响。</p><p>（5） 常规实验环境建设成本高。网络设备种类繁多，如果要购置较齐全的网络设备，初期投入成本高；而且网络技术变化快、设备生命周期有限、更新非常快，要建立非常完备且与时俱进的网络实验教学硬件环境是非常困难的，日常的实验室维护经费完全无法满足网络实验设备更新的要求。虚拟仿真实验教学平台，只需要少量的网络硬件，就可以硬件虚拟、软件仿真的方式实现网络实验设备的更新换代，更新周期短、成本低。而且利用软件扩展性好的特性，可以将少量的网络设备，虚拟成大量虚拟网络设备，更新硬件成本低。</p><p><strong>另一方面，现有实验室与实验课程的管理与实施决定了必须引入更为高效的虚拟仿真实验教学技术。</strong></p><p>虚拟仿真环境有利于提高实验考核的效率及可追溯性。常规实验环境中，所有考核环境均需要教师亲自检查，实验结果也无法以电子方式保存，或者必须通过录像等手段保存，而视频文件的保存、备份及查看均不够方便且耗费时间。在虚拟修真实验系统中，所有实验的环节和结果均以电子的方式保存，教师可以方便地检查和评测，其中有很大一部分工作，包括计分统计，都可以通过软件的方式自动完成，从而大大提高了实验考核的效果。</p><p>实体网络设备实验的优点是现场感好，与工程现实环境接近；但实体网络设备实验涉及到设备之间的连线问题，因此无法有效实现远程共享实验，特别是需要频繁更换设备连接方式的网络实验。网络虚拟仿真实验，可以在任何计算机上进行实验操作，可以在虚拟的环境中，更新设备以及设备之间的连线，可以实现最大程度的资源开放和共享。非常有利于有实验内容的网络类UOOC课程的实验教学，解决UOOC类课程只能局限于理论课，而无法向实验课推广的缺陷。</p>',1),(21,'移动平台与移动应用开发虚拟仿真实验教学平台','<p>移动互联网虚拟仿真实验教学中心首先要支持的是移动应用开发类课程，主要代表性课程为《移动应用开发》和《高级网页设计》两个课程。其中，《移动应用开发》为针对移动平台（Android）的应用开发课程，它需要实验室提供移动平台软件的支持；而《高级网页设计》则涉及移动平台上的高级网页开发技术，一样需要有移动平台的支持。</p>',2),(22,'计算机网络与工程虚拟仿真实验教学系统','<p>建设中...</p>',2),(23,'物联网应用与技术虚拟仿真实验教学系统','<p>建设中...</p>',2),(24,'网络信息安全虚拟仿真实验室及教学系统','<p>建设中...</p>',2),(25,'科研成果(近五年)转化而来的虚拟仿真实验教学内容','<p>暂无。</p>',3),(26,'移动互联网虚拟仿真实验室科研成果转化实验项目情况','<p>建设中...</p>',3),(28,'校企合作','<p>从2012年起，信息科学技术学院在原有实验室建设基础之上，创新地开始建设与企业直接对接的协同创新中心。截止到目前为止，与企业联合建立了“公共安全协同创新中心”、“旭惠信息技术创新中心”、“公共信息安全技术研究联合实验室”、“新一代IT协同创新中心”、“惠州电商人才培训基地”，配置各类计算机设备1000余台，为教学和科学研究提供了良好的实验环境，信息技术创新中心完全实现企业化管理，建立起了一个创新应用型人才培养机制，中心师生参与合作企业的信息技术产品的研发，完成的项目获得了企业的高度评价，并为企业创造了良好的经济效益，同时也促进了信息科学技术学院的学科建设。近年来，信息科学技术学院在全国及省级多个学科竞赛中取得了优异成绩，曾获得“全国大学生计算机设计大赛”总决赛一等奖以及全国软件外包设计大赛一等奖；2015年，全年参赛学生数超过200人次，有150多人次在全国、省、市学科竞赛中获奖，2016年有160多人才获得各类奖项。此外，学生创业热情高，部分学生在校期间或毕业后短期间内即走上了创业发展的道路。</p><p>2017年，以协同创新中心为主要亮点的“校企深度融合的创新应用型信息技术人才培养模式探索与实践”获得惠州学院校级教学成果一等奖（彭刚，院长）。</p>',4),(29,'公共安全协同创新中心','<p>建设中...</p>',4),(30,'旭惠信息技术创新中心','<p>建设中...</p>',4),(31,'公共信息安全技术研究联合实验室','<p>建设中...</p>',4),(32,'中心主任','<p>曾少宁（网络工程系主任）</p><p>科研成果：<a href=\"https://github.com/zengsn/research/\">https://github.com/zengsn/research/</a></p>',5),(33,'中心人员','<p>彭刚（院长，教授）、蒋辉（副院长，教授）、蔡昭权（教授）、 曾树洪（学院实验中心主任，高级实验师）、汪华斌（副教授）、 黄震（副教授）、徐涛（副教授）、肖东（高工）、李慧、陈朝华、袁秀莲</p>',5),(34,'队伍结构','<p>总人数13，平均年龄41岁，正高23%，副高38%，其他38%。</p>',5),(35,'教学水平','<p>本虚拟仿真实验教学队伍以中青年教师为主，所有成员目前均从事一线实验教学工作，其中大部分成员为高级职称（68%），整个教学队伍具有较高的教学水平和优秀的教学成果，主要具体如下：</p><ol><li>教学队伍成员有优异的一线教学水平上。教学队伍成员均为计算机专业课程负责人和主讲教师，理论教学及实验教学工作量饱满，近年来平均教学评价结果均为优秀（90分）以上。其中，所有教授均参与计算机专业授课及虚拟实验教学，例如：彭刚（教授，院长）负责《软件项目管理》等课程的授课与实验，蔡昭权（教授）负责《计算机网络工程》的授课与实验。此外，其他教学队伍核心人员也直接担任主要课程的授课与实验工作，其中中心主任曾少宁（网络工程系主任）是《移动应用设计与开发》、《高级网页设计》等课程负责人，参与授课与虚拟实验教授，汪华斌（副教授）负责《计算机网络》课程的授课与实验。教学队伍基本覆盖中心的所有实验课程，并且具有较高的教学经验和水平。</li><li>教学队伍成员的教学成果显著。其中，中心主任曾少宁已主持过1项省级和2项校级教研教改课题，完成了1项双语示范课程，指导过2项省级大创项目和多项校级大创项目，曾经指导学生参加学科竞赛多次获得国家级和省级奖项，发表了多篇与虚拟实验教学技术相关的教学研究论文。核心成员彭刚教授2017年获得惠州学院校级教学成果一等奖。蔡昭权教授2017年入选广东省本科高校创新创业教育教学指导委员会。汪华斌、李慧老师各主持1项省级教研教改项目。此外，教学队伍其他成员也曾经主持或参与各级教学质量工程和教研教改项目。</li></ol>',5),(36,'组织保障','<p>（1） 学院重视并支持中心的制度建设。学院特别重视实验教学工作，制定了一系列与计算机相关的实验室管理办法以及设备管理办法。学院非常重视实验教学规范化，规定每门实验课程均编印实验教学大纲，实验指导书，实验多媒体讲义等实验教学材料。</p><p>（2） 学院重视并支持中心的基础条件建设。学院实验指导思想明确，特别重视学生动手能力和创新能力的培养。以学生为本，将建设完成的各级实验中心和创新中心全方位向全校学生开放，学生可以根据自己的知识、能力和兴趣，到各实验教学中心做实验，或者参加创新中心的企业团队，从而进一步提高自己的动手能力和创新实验能力。</p><p>（3） 学院非常注重实验教学队伍的建设。将有经验的教师调整到实验教学第一线，其中学院的大部分教授都参与实验教学，进一步整合实验教学和实验队伍资源，调整实验室布局，更好地适应学科发展和学生培养的要求。</p>',6),(37,'制度保障','<p>（1） 建立虚拟仿真实验教学中心的管理体制。实验中心由二级学院管理，采中心主任负责制。在运行机制上，实验教学主任作为中心的第一责任人，在课程设置、教学改革、人员聘用、实验室管理和经费管理等方面具有较大的自主权，从而保证了教学资源的充分合理利用，形成了功能明确和管理有序的实验教学中心。实验教学中心实行按需设岗，按岗聘任实验教师。中心的本科实验教学实验室皆有专职实验技术人员负责管理，实验室主任由教学经验丰富，教学能力强的教师担任。实验教师不但具备扎实的理论知识、较全面的实验技能、严谨的科学态度与作风，而且是一个掌握多学科知识与技术的多面手，这样的实验教师才能适应开设多门实验课程的要求。实验中心仪器设备、实验人员、实验用房均由实验教学中心统一管理，实现了资源共享，转变了实验室专为某一课程或专业服务的观念，根据功能和学科特点进行重组和建设，减少重复投资，对实验室仪器设备进行实时动态管理，即从仪器设备的使用信息到仪器设备的使用状态有明确的“账目”；实验中心每年对实验仪器进行清查，做到帐物相符，提高了实验仪器设备的投资效益和使用效率。</p><p>（2） 建立虚拟仿真实验教学中心的教学质量保障制度。为了保证中心实验开出的质量，中心还经常组织理论课程主讲老师与实验指导老师的交流，在教学进度、实验项目安排、实验仪器采购与应用等方面进行协调，并对学生在实验过程中暴露出的问题进行沟通，对症下药，使理论课与实验课能更好地结合。每个学期末，中心还要收集每门实验课程的学生实验报告，分好、中、差三组，通过对这些实验报告进行分析、总结，找出该实验课程在项目设置、老师指导、学生完成等方面的成功与不足，对这些实验课程进行改革，不断完善，保证了实验课程质量的进一步提升。学校实验与设备部每学期至少到实验室听课1次，中心主任和实验室主任每学期至少到实验室听课2次，并对实验报告进行抽查，保证实验课的质量。对新开实验和开新实验的教师，组织有经验的实验教学老师进行听课，并帮助制定实验课程的教学计划和教学内容，提高实验课的教学质量。</p><p>（3） 制定了实验队伍建设政策措施。学校制定了一系列实验教学队伍建设的政策和措施，包括：教学实验中心管理办法、实验技术人员岗位职责与考核办法、实验室考核评比条例、实验技术成果评审奖励管理办法等规章制度。奖励教师完成的实验教学成果、论文、实验指导书等，奖励在各种竞赛中获得名次学生和在公开刊物上发表论文学生的指导教师。</p><p>（4） 制定了实验队伍培训制度措施。专门出台了实验队伍培训管理办法，对实验人员培训和继续深造提供经费支持，实验技术人员的培训，以在职、在岗的方式参加短期进修班、培训班为主；以通过在职进修、系统学习以及学历培养为辅，少部分人员可以考虑安排脱产进修，重点培养。</p>',6),(38,'管理规范','<p>首先，为了保证实验教学中心开放运行良好，除学校为实验中心制的各项相关管理制度外，中心还专业制定了适合计算机实验管理的相关制度，其中包括：</p><ol><li>《教学实验中心管理办法》；</li><li>《实验室管理办法》；</li><li>《实验室开放管理办法》；</li><li>《实验室设置与调整管理规定》；</li><li>《实验室基本信息收集及档案管理办法》；</li><li>《实验室实验室安全管理办法》。</li></ol><p>其次，建立良好的实验教学考评体系是提高实验教学质量的保证机制。除了根据学校制定的实验技术人员岗位职责与考核管理办法，每学年进行一次考核之外，中心还做了以下两个方面的工作：</p><ol><li>学生评教。每学期由二级学院组织期中教学检查和期末学生评教活动，由学生对每门实验课程按评估指标进行打分，作为对实验教师教学效果考评的一个重要依据，而且学院及时将评估结果反馈给实验教学老师，以便老师及时改进实验教学工作中的缺陷，进一步提高实验教学质量。</li><li>学院督导。聘请教学经验丰富、责任心强、学术水平高的老教授担任督导员，协助检查、监督实验教学工作的全过程，包括实验教学大纲和教学内容、教材的选用、考试以及成绩评定，帮助实验教学老师提高实验教学质量。</li></ol>',6),(39,'校内共享','<p>到目前为止，整个实验中心的资源共享仅限于二级学院范围之内，实验教学资源共享的范围及方式主要有3种：</p><ol><li><strong>专业内多课程共享</strong>：面向移动应用开发课程的网络实验平台，已经扩展到学院内部的其他编程类课程，如高级网页设计，并且也取得了一样好的教学效果。</li><li><strong>学院内多专业共享</strong>：除了网络工程专业之外，移动和网络两个方面的实验教学资源均同时支持计算机科学与技术和软件工程等学院内专业的同类课程实验。所有的实验课程及项目由3个专业的课程和学生共享使用。</li></ol>',7),(40,'校外共享','<p>建设中...</p>',7),(41,'进一步拓宽资源共享的渠道','<p>建设中...</p>',7),(42,'进一步优化和丰富共享资源','<p>建设中...</p>',7),(43,'仪器设备配置情况','<p>计算机实验中心自成立以来，经费来源主要包括学校和政府。近年来，广东省和惠州市已为中心投入经费约365余万元，这些经费全部用于实验教学设备的购置和维护，以及实验资源的开发。整个实验中心的设备利用率达99%，设备完好率达99%。</p><p>移动互联网虚拟仿真实验教学中心依托计算机实验教学示范中心，其中实验中心的经费来源具体见下表。</p>',8),(44,'环境与安全','<p>建设中...</p>',8),(45,'运行与维护','<p>建设中...</p>',8),(46,'网络管理与安全','<p>建设中...</p>',8),(47,'申报书','<p>近期发布。</p>',9),(48,'支撑材料','<p>建设中...</p>',9),(49,'政策措施和规章制度','<p>建设中...</p>',9);
/*!40000 ALTER TABLE `snav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sno` varchar(45) DEFAULT NULL,
  `sname` varchar(45) DEFAULT NULL,
  `sgender` varchar(45) DEFAULT NULL,
  `classinfo_id` varchar(45) DEFAULT NULL,
  `sphone` varchar(45) DEFAULT NULL,
  `spassword` varchar(45) DEFAULT NULL,
  `login` varchar(45) DEFAULT NULL,
  `git_id` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT '0',
  `outDate` varchar(255) DEFAULT NULL,
  `validataCode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=633 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'1514080901114','学生一','男','3','13100123569','as1234',NULL,NULL,'2639920015@qq.com','1550333324000','d1a1c2c0-716f-4cca-9c8c-5eeba1dcf41f'),(99,'1514080901207','学生二','男','2','12345678910','222',NULL,NULL,NULL,NULL,NULL),(100,'1514080901236','学生三','男','2','12345678910','222',NULL,NULL,NULL,NULL,NULL),(101,'1514080901204','学生四','男','2','12345678910','222',NULL,NULL,NULL,NULL,NULL),(102,'1514080901203','学生伍','男','2','12345678910','222',NULL,NULL,NULL,NULL,NULL),(103,'1514080901123','学六','男','3','12345678910','222',NULL,NULL,NULL,NULL,NULL),(105,'1514080901238','学期','男','2','12345678910','222',NULL,NULL,NULL,NULL,NULL),(106,'1514080901237','学把','男','2','12345678910','222',NULL,NULL,NULL,NULL,NULL),(107,'1514080901112','雪韭','男','3','12345678910','222',NULL,NULL,NULL,NULL,NULL),(108,'1512070501138','张思思','男','3','12345678910','222',NULL,NULL,NULL,NULL,NULL),(109,'1514080901216','圣衣','男','2','12345678910','222',NULL,NULL,NULL,NULL,NULL),(110,'1514080901105','声儿','女','3','12345678910','222',NULL,NULL,NULL,NULL,NULL),(111,'1514080901239','省三','男','2','12345678910','222',NULL,NULL,NULL,NULL,NULL),(112,'1514080901232','嵊泗','男','2','12345678910','222',NULL,NULL,NULL,NULL,NULL),(113,'1514080901218','升维','男','2','12345678910','222',NULL,NULL,NULL,NULL,NULL),(114,'1514080901125','盛柳','男','3','12345678910','222',NULL,NULL,NULL,NULL,NULL),(115,'1514080901201','生其','女','2','12345678910','222',NULL,NULL,NULL,NULL,NULL),(116,'1514080901211','胜巴','男','2','12345678910','222',NULL,NULL,NULL,NULL,NULL),(117,'1507070201123','张珊珊','女','3','12345678910','222',NULL,NULL,NULL,NULL,NULL),(119,'1513071001110','张柳柳','男','3','12345678910','222',NULL,NULL,NULL,NULL,NULL),(120,'1514080901122','陈佳','男','3','12345678910','222',NULL,NULL,NULL,NULL,NULL),(121,'1514080901120','陈怡','男','3','12345678910','222',NULL,NULL,NULL,NULL,NULL),(122,'1514080901137','陈三','男','3','12345678910','222',NULL,NULL,NULL,NULL,NULL),(123,'1514080901108','陈思','男','3','12345678910','222',NULL,NULL,NULL,NULL,NULL),(124,'1514080901118','陈武','男','3','12345678910','222',NULL,NULL,NULL,NULL,NULL),(125,'1509081602501','李尔尔','男','2','12345678910','222',NULL,NULL,NULL,NULL,NULL),(126,'1514080901202','陈留','男','2','12345678910','222',NULL,NULL,NULL,NULL,NULL),(127,'1514080901231','陈琦','男','2','12345678910','222',NULL,NULL,NULL,NULL,NULL),(128,'1514080901225','陈波','男','2','12345678910','222',NULL,NULL,NULL,NULL,NULL),(129,'1514080901103','陈酒','男','3','12345678910','222',NULL,NULL,NULL,NULL,NULL),(130,'1514080901135','刘艺','男','3','12345678910','222',NULL,NULL,NULL,NULL,NULL),(131,'1514080901121','刘二','男','3','12345678910','222',NULL,NULL,NULL,NULL,NULL),(132,'1514080901234','刘三','男','2','12345678910','222',NULL,NULL,NULL,NULL,NULL),(133,'1514080901117','刘思','男','3','12345678910','222',NULL,NULL,NULL,NULL,NULL),(134,'1514080901222','刘武','男','2','12345678910','222',NULL,NULL,NULL,NULL,NULL),(135,'1514080901132','刘柳','男','3','12345678910','222',NULL,NULL,NULL,NULL,NULL),(136,'1514080901208','刘琦','男','2','12345678910','222',NULL,NULL,NULL,NULL,NULL),(137,'1514080901109','刘坝','男','3','12345678910','222',NULL,NULL,NULL,NULL,NULL),(138,'1514080901129','刘就','男','3','12345678910','222',NULL,NULL,NULL,NULL,NULL),(139,'1514080901210','戚时','男','2','12345678910','222',NULL,NULL,NULL,NULL,NULL),(140,'1514080901104','戚一','男','3','12345678910','222',NULL,NULL,NULL,NULL,NULL),(141,'1514080901224','戚而','男','2','12345678910','222',NULL,NULL,NULL,NULL,NULL),(142,'1514080901107','戚三','男','3','12345678910','222',NULL,NULL,NULL,NULL,NULL),(143,'1514080901233','戚斯','男','2','12345678910','222',NULL,NULL,NULL,NULL,NULL),(144,'1514080901110','戚无','男','3','12345678910','222',NULL,NULL,NULL,NULL,NULL),(145,'1514080901134','戚流','男','3','12345678910','222',NULL,NULL,NULL,NULL,NULL),(146,'1514080901229','戚其','男','2','12345678910','222',NULL,NULL,NULL,NULL,NULL),(147,'1514080901106','戚巴','男','3','12345678910','222',NULL,NULL,NULL,NULL,NULL),(148,'1514080901206','戚九','男','2','12345678910','222',NULL,NULL,NULL,NULL,NULL),(149,'1514080901128','倪一','男','3','12345678910','222',NULL,NULL,NULL,NULL,NULL),(150,'1514080901130','倪而','男','3','12345678910','222',NULL,NULL,NULL,NULL,NULL),(151,'1514080901119','倪三','男','3','12345678910','222',NULL,NULL,NULL,NULL,NULL),(152,'1514080901113','尼斯','男','3','12345678910','222',NULL,NULL,NULL,NULL,NULL),(153,'1514080901212','尼巫','男','2','12345678910','222',NULL,NULL,NULL,NULL,NULL),(154,'1506081301243','张尔尔','男','2','12345678910','222',NULL,NULL,NULL,NULL,NULL),(155,'1514080901226','逆流','男','2','12345678910','222',NULL,NULL,NULL,NULL,NULL),(156,'1513071002132','伍意义','男','3','12345678910','222',NULL,NULL,NULL,NULL,NULL),(157,'1514080901133','倪戚','男','3','12345678910','222',NULL,NULL,NULL,NULL,NULL),(159,'1506081301236','张一一','男','2','13101023012','222',NULL,NULL,NULL,NULL,NULL),(160,'1514080901240','倪拔','男','2','12345678910','222',NULL,NULL,NULL,NULL,NULL),(161,'1512120901132','张五五','男','3','12345678910','222',NULL,NULL,NULL,NULL,NULL),(162,'1514080901228','倪酒','男','2','12345678910','222',NULL,NULL,NULL,NULL,NULL),(163,'1514080901116','就一','男','3','12345678910','222',NULL,NULL,NULL,NULL,NULL),(164,'1514080901138','九二','男','3','12345678910','222',NULL,NULL,NULL,NULL,NULL),(166,'1514080901217','九三','男','2','12345678910','222',NULL,NULL,NULL,NULL,NULL),(167,'1514080901213','就是','男','2','12345678910','222',NULL,NULL,NULL,NULL,NULL),(168,'1514080901101','九五','男','3','12345678910','222',NULL,NULL,NULL,NULL,NULL),(169,'1514080901214','九六','男','2','12345678910','222',NULL,NULL,NULL,NULL,NULL),(170,'1514080901115','九千','男','3','12345678910','222',NULL,NULL,NULL,NULL,NULL),(172,'1514080901209','球吧','男','2','12345678910','222',NULL,NULL,NULL,NULL,NULL),(173,'1514080901111','球球','男','3','12345678910','222',NULL,NULL,NULL,NULL,NULL),(174,'1513071001116','李山三','男','3','12345678910','222',NULL,NULL,NULL,NULL,NULL),(175,'1514080901223','闪烁','男','2','12345678910','222',NULL,NULL,NULL,NULL,NULL),(176,'1513071001131','李斯斯','男','3','12345678910','222',NULL,NULL,NULL,NULL,NULL),(177,'1514080901136','司思睿','男','3','12345678910','222',NULL,NULL,NULL,NULL,NULL),(178,'1514080901140','李进','男','3','12345678910','222',NULL,NULL,NULL,NULL,NULL),(179,'1514080901205','张金','男','2','12345678910','222',NULL,NULL,NULL,NULL,NULL),(180,'1514080901139','刘茹','男','3','12345678910','222',NULL,NULL,NULL,NULL,NULL),(181,'1514080901220','孟子然','男','2','12345678910','222',NULL,NULL,NULL,NULL,NULL),(182,'1514080901215','孟欣','男','2','12345678910','222',NULL,NULL,NULL,NULL,NULL),(183,'1514080901127','孟获','男','3','12345678910','222',NULL,NULL,NULL,NULL,NULL),(184,'1514080901221','蒙医','男','2','12345678910','222',NULL,NULL,NULL,NULL,NULL),(185,'1507070201226','李依依','女','2','12345678910','222',NULL,NULL,NULL,NULL,NULL),(187,'1614080902408','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(188,'1614080901136','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(189,'1614080901142','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(190,'1614080901138','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(193,'1614080902106','张小4','男','8','123','224',NULL,NULL,NULL,NULL,NULL),(194,'1614080901231','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(195,'1614080902237','张小5','男','9','123','225',NULL,NULL,NULL,NULL,NULL),(197,'1614080901239','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(198,'1614080902421','张小6','男','11','124','226',NULL,NULL,NULL,NULL,NULL),(199,'1614080901142','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(200,'1614080902406','张小7','男','11','125','227',NULL,NULL,NULL,NULL,NULL),(201,'1614080901128','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(202,'1614080902308','张小8','男','10','126','228',NULL,NULL,NULL,NULL,NULL),(203,'1614080902411','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(204,'1614080902233','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(205,'1614080902210','张小11','男','9','129','231',NULL,NULL,NULL,NULL,NULL),(206,'1614080902219','张小12','男','9','130','232',NULL,NULL,NULL,NULL,NULL),(207,'1614080901101','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(208,'1606081301325','张小13','男','8','131','233',NULL,NULL,NULL,NULL,NULL),(210,'1614080902227','张小15','男','9','133','235',NULL,NULL,NULL,NULL,NULL),(211,'1614080902412','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(212,'1614080902401','张小16','男','11','134','236',NULL,NULL,NULL,NULL,NULL),(213,'1613071002205','张小17','男','9','135','237',NULL,NULL,NULL,NULL,NULL),(214,'1614080902128','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(215,'1614080901118','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(216,'1614080902129','张小19','男','8','137','239',NULL,NULL,NULL,NULL,NULL),(217,'1614080902414','张小20','男','11','138','240',NULL,NULL,NULL,NULL,NULL),(218,'1614080902306','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(219,'1614080902336','张小22','男','10','140','242',NULL,NULL,NULL,NULL,NULL),(220,'1614080901143','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(221,'1614080902301','张小23','男','10','141','243',NULL,NULL,NULL,NULL,NULL),(222,'1614080902223','张小24','男','9','142','244',NULL,NULL,NULL,NULL,NULL),(223,'1614080902307','张小25','男','10','143','245',NULL,NULL,NULL,NULL,NULL),(224,'1614080902217','张小26','男','9','144','246',NULL,NULL,NULL,NULL,NULL),(225,'1614080901103','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(226,'1614080902437','张小27','男','11','145','247',NULL,NULL,NULL,NULL,NULL),(228,'1614080902208','张小29','男','9','147','249',NULL,NULL,NULL,NULL,NULL),(229,'1614080901238','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(230,'1614080901214','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(231,'1614080902345','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(233,'1614080901121','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(234,'1614080902410','张小31','男','11','149','251',NULL,NULL,NULL,NULL,NULL),(235,'1614080901204','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(236,'1614080902202','张小33','男','9','151','253',NULL,NULL,NULL,NULL,NULL),(237,'1614080902409','张小32','男','11','150','252',NULL,NULL,NULL,NULL,NULL),(238,'1612070501311','张小34','男','9','152','254',NULL,NULL,NULL,NULL,NULL),(239,'1614080902126','张小35','男','8','153','255',NULL,NULL,NULL,NULL,NULL),(240,'1614080901212','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(241,'1514080902219','张小36','男','8','154','256',NULL,NULL,NULL,NULL,NULL),(242,'1614080901244','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(243,'1614080902403','张小1','男','11','123','qqq222',NULL,NULL,NULL,NULL,NULL),(244,'1614080902313','张小37','男','10','155','257',NULL,NULL,NULL,NULL,NULL),(245,'1614080902104','张小28','男','8','146','248',NULL,NULL,NULL,NULL,NULL),(246,'1614080902422','张小38','男','11','156','258',NULL,NULL,NULL,NULL,NULL),(247,'1614080902238','张小39','男','9','157','259',NULL,NULL,NULL,NULL,NULL),(248,'1614080902240','张小40','男','9','158','260',NULL,NULL,NULL,NULL,NULL),(249,'1614080902234','张小41','男','9','159','261',NULL,NULL,NULL,NULL,NULL),(250,'1614080902127','张小42','男','8','160','262',NULL,NULL,NULL,NULL,NULL),(251,'1614080901111','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(252,'1606081301233','张小43','男','8','161','263',NULL,NULL,NULL,NULL,NULL),(254,'1614080902326','张小44','男','10','162','264',NULL,NULL,NULL,NULL,NULL),(255,'1614080902341','张小72','男','10','190','292',NULL,NULL,NULL,NULL,NULL),(256,'1614080901107','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(257,'1614080902321','张小46','男','10','164','266',NULL,NULL,NULL,NULL,NULL),(258,'1614080902438','张小116','男','11','234','336',NULL,NULL,NULL,NULL,NULL),(259,'1614080902433','张小48','男','11','166','268',NULL,NULL,NULL,NULL,NULL),(260,'1614080902136','张小49','男','8','167','269',NULL,NULL,NULL,NULL,NULL),(261,'1614080902439','张小47','男','11','165','267',NULL,NULL,NULL,NULL,NULL),(262,'1609081602618','张小50','男','9','168','270',NULL,NULL,NULL,NULL,NULL),(263,'1614080901216','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(264,'1614080902232','张小51','男','9','169','271',NULL,NULL,NULL,NULL,NULL),(266,'1614080902112','张小53','男','8','171','273',NULL,NULL,NULL,NULL,NULL),(267,'1614080902344','张小54','男','10','172','274',NULL,NULL,NULL,NULL,NULL),(268,'1614080901110','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(269,'1614080901224','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(270,'1614080901122','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(271,'1614080901228','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(272,'1614080902413','张小56','男','11','174','276',NULL,NULL,NULL,NULL,NULL),(273,'1614080902319','张小57','男','10','175','277',NULL,NULL,NULL,NULL,NULL),(275,'1614080902224','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(276,'1614080902310','张小61','男','10','179','281',NULL,NULL,NULL,NULL,NULL),(277,'1614080901125','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(278,'1614080902317','张小62','男','10','180','282',NULL,NULL,NULL,NULL,NULL),(279,'1614080902431','张小63','男','11','181','283',NULL,NULL,NULL,NULL,NULL),(281,'1614080902440','张小64','男','11','182','284',NULL,NULL,NULL,NULL,NULL),(282,'1614080902146','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(283,'1614080901221','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(284,'1614080901102','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(285,'1613071002201','张小65','男','9','183','285',NULL,NULL,NULL,NULL,NULL),(288,'1614080901238','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(289,'1614080902121','张小67','男','8','185','287',NULL,NULL,NULL,NULL,NULL),(290,'1614080902442','张小68','男','11','186','288',NULL,NULL,NULL,NULL,NULL),(291,'1614080902230','张小69','男','9','187','289',NULL,NULL,NULL,NULL,NULL),(292,'1614080901211','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(293,'1614080902302','张小71','男','10','189','291',NULL,NULL,NULL,NULL,NULL),(294,'1613090502218','张小70','男','9','188','290',NULL,NULL,NULL,NULL,NULL),(296,'1614080901207','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(297,'1614080901119','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(298,'1614080902141','张小73','男','8','191','293',NULL,NULL,NULL,NULL,NULL),(299,'1614080902432','张小74','男','11','192','294',NULL,NULL,NULL,NULL,NULL),(300,'1614080901129','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(301,'1614080902436','张小75','男','11','193','295',NULL,NULL,NULL,NULL,NULL),(302,'1614080901127','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(303,'1614080901141','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(304,'1614080902211','张小76','男','9','194','296',NULL,NULL,NULL,NULL,NULL),(305,'1614080901123','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(306,'1614080901209','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(307,'1614080901132','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(308,'1614080902427','张小77','男','11','195','297',NULL,NULL,NULL,NULL,NULL),(309,'1614080901240','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(311,'1614080902221','张小79','男','9','197','299',NULL,NULL,NULL,NULL,NULL),(312,'1614080902128','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(313,'1614080902314','张小81','男','10','199','301',NULL,NULL,NULL,NULL,NULL),(314,'1614080902130','张小80','男','8','198','300',NULL,NULL,NULL,NULL,NULL),(316,'1614080902411','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(317,'1614080902132','张小83','男','8','201','303',NULL,NULL,NULL,NULL,NULL),(318,'1614080902306','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(319,'1614080902111','张小85','男','8','203','305',NULL,NULL,NULL,NULL,NULL),(320,'1614080902207','张小86','男','9','204','306',NULL,NULL,NULL,NULL,NULL),(321,'1614080901129','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(322,'1614080902416','张小87','男','11','205','307',NULL,NULL,NULL,NULL,NULL),(323,'1614080902407','张小88','男','11','206','308',NULL,NULL,NULL,NULL,NULL),(324,'1614080901104','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(325,'1614080902425','张小89','男','11','207','309',NULL,NULL,NULL,NULL,NULL),(326,'1609081602308','张小14','男','9','132','234',NULL,NULL,NULL,NULL,NULL),(328,'1614080901225','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(329,'1606070302235','张小90','男','8','208','310',NULL,NULL,NULL,NULL,NULL),(330,'1614080902118','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(331,'1614080901110','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(332,'1614080902305','张小91','男','10','209','311',NULL,NULL,NULL,NULL,NULL),(333,'1614080902125','张小93','男','8','211','313',NULL,NULL,NULL,NULL,NULL),(334,'1614080902424','张小92','男','11','210','312',NULL,NULL,NULL,NULL,NULL),(335,'1614080901230','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(336,'1614080902417','张小94','男','11','212','314',NULL,NULL,NULL,NULL,NULL),(338,'1614080901210','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(339,'1614080902328','张小96','男','10','214','316',NULL,NULL,NULL,NULL,NULL),(340,'1614080901130','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(341,'1614080902128','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(342,'1614080901134','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(346,'1614080902143','张小101','男','8','219','321',NULL,NULL,NULL,NULL,NULL),(347,'1614080902229','张小102','男','9','220','322',NULL,NULL,NULL,NULL,NULL),(348,'1614080902318','张小103','男','10','221','323',NULL,NULL,NULL,NULL,NULL),(349,'1614080901116','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(350,'1614080902235','张小104','男','9','222','324',NULL,NULL,NULL,NULL,NULL),(351,'1614080901136','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(352,'1614080901206','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(353,'1614080901113','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(354,'1614080902220','张小105','男','9','223','325',NULL,NULL,NULL,NULL,NULL),(355,'1614080902137','张小106','男','8','224','326',NULL,NULL,NULL,NULL,NULL),(356,'1614080902139','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(357,'1614080902108','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(360,'1613090502214','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(361,'1614080901144','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(362,'1614080902435','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(363,'1614080902415','张小111','男','11','229','331',NULL,NULL,NULL,NULL,NULL),(365,'1614080902324','张小113','男','10','231','333',NULL,NULL,NULL,NULL,NULL),(366,'1614080901219','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(367,'1614080902120','张小114','男','8','232','334',NULL,NULL,NULL,NULL,NULL),(368,'1614080901229','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(369,'1614080901220','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(370,'1614080902312','张小115','男','10','233','335',NULL,NULL,NULL,NULL,NULL),(373,'1614080902212','张小117','男','9','235','337',NULL,NULL,NULL,NULL,NULL),(374,'1614080902119','张小118','男','8','236','338',NULL,NULL,NULL,NULL,NULL),(375,'1614080901131','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(376,'1614080902445','张小119','男','11','237','339',NULL,NULL,NULL,NULL,NULL),(377,'1614080902231','张小120','男','9','238','340',NULL,NULL,NULL,NULL,NULL),(378,'1614080901237','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(379,'1614080902418','张小121','男','11','239','341',NULL,NULL,NULL,NULL,NULL),(380,'1614080902116','张小122','男','8','240','342',NULL,NULL,NULL,NULL,NULL),(381,'1614080902122','张小123','男','8','241','343',NULL,NULL,NULL,NULL,NULL),(382,'1614080901208','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(383,'1614080901114','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(384,'1614080902209','张小124','男','9','242','344',NULL,NULL,NULL,NULL,NULL),(386,'1614080902109','张小125','男','8','243','345',NULL,NULL,NULL,NULL,NULL),(387,'1614080902426','张小126','男','11','244','346',NULL,NULL,NULL,NULL,NULL),(388,'1614080902329','张小127','男','10','245','347',NULL,NULL,NULL,NULL,NULL),(389,'1614080902333','张小128','男','10','246','348',NULL,NULL,NULL,NULL,NULL),(390,'1606081301337','张小129','男','8','247','349',NULL,NULL,NULL,NULL,NULL),(391,'1614080902332','张小130','男','10','248','350',NULL,NULL,NULL,NULL,NULL),(392,'1614080902242','张小97','男','9','215','317',NULL,NULL,NULL,NULL,NULL),(393,'1614080902243','张小132','男','9','250','352',NULL,NULL,NULL,NULL,NULL),(394,'1614080902103','张小133','男','8','251','353',NULL,NULL,NULL,NULL,NULL),(395,'1613071002123','张小134','男','9','252','354',NULL,NULL,NULL,NULL,NULL),(396,'1614080901217','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(397,'1614080902316','张小110','男','10','228','330',NULL,NULL,NULL,NULL,NULL),(399,'1614080901112','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(401,'1606070302124','张小193','男','8','311','413',NULL,NULL,NULL,NULL,NULL),(402,'1614080902444','张小137','男','11','255','357',NULL,NULL,NULL,NULL,NULL),(403,'1614080901112','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(404,'1614080901135','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(406,'1614080902225','张小138','男','9','256','358',NULL,NULL,NULL,NULL,NULL),(407,'1614080902218','张小139','男','9','257','359',NULL,NULL,NULL,NULL,NULL),(408,'1614080902405','张小140','男','11','258','360',NULL,NULL,NULL,NULL,NULL),(409,'1614080901224','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(410,'1614080902419','张小141','男','11','259','361',NULL,NULL,NULL,NULL,NULL),(411,'1612070501328','张小142','男','9','260','362',NULL,NULL,NULL,NULL,NULL),(412,'1614080902214','张小143','男','9','261','363',NULL,NULL,NULL,NULL,NULL),(413,'1614080902441','张小144','男','11','262','364',NULL,NULL,NULL,NULL,NULL),(414,'1614080901234','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(415,'1614080902315','张小3','男','10','123','223',NULL,NULL,NULL,NULL,NULL),(416,'1614080902430','张小145','男','11','263','365',NULL,NULL,NULL,NULL,NULL),(418,'1606081301137','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(419,'1614080902206','张小55','男','9','173','275',NULL,NULL,NULL,NULL,NULL),(420,'1614080901209','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(421,'1614080901109','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(422,'1614080902311','张小147','男','10','265','367',NULL,NULL,NULL,NULL,NULL),(423,'1614080901106','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(424,'1614080901115','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(425,'1614080901145','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(427,'1614080902327','张小149','男','10','267','369',NULL,NULL,NULL,NULL,NULL),(428,'1614080902236','张小99','男','9','217','319',NULL,NULL,NULL,NULL,NULL),(429,'1614080902204','张小150','男','9','268','370',NULL,NULL,NULL,NULL,NULL),(431,'1614080902115','张小151','男','8','269','371',NULL,NULL,NULL,NULL,NULL),(432,'1614080902434','张小153','男','11','271','373',NULL,NULL,NULL,NULL,NULL),(433,'1614080902304','张小152','男','10','270','372',NULL,NULL,NULL,NULL,NULL),(434,'1614080902145','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(435,'1606081301318','张小155','男','8','273','375',NULL,NULL,NULL,NULL,NULL),(436,'1614080902335','张小156','男','10','274','376',NULL,NULL,NULL,NULL,NULL),(437,'1614080902205','张小157','男','9','275','377',NULL,NULL,NULL,NULL,NULL),(438,'1614080902113','张小158','男','8','276','378',NULL,NULL,NULL,NULL,NULL),(439,'1614080902337','张小159','男','10','277','379',NULL,NULL,NULL,NULL,NULL),(440,'1606070302104','张小161','男','8','279','381',NULL,NULL,NULL,NULL,NULL),(441,'1614080902228','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(442,'1614080902325','张小162','男','10','280','382',NULL,NULL,NULL,NULL,NULL),(443,'1614080901139','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(444,'1614080902303','张小163','男','10','281','383',NULL,NULL,NULL,NULL,NULL),(445,'1614080902102','张小164','男','8','282','384',NULL,NULL,NULL,NULL,NULL),(446,'1614080902101','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(447,'1614080901235','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(448,'1614080902105','张小166','男','8','284','386',NULL,NULL,NULL,NULL,NULL),(450,'1614080902215','张小167','男','9','285','387',NULL,NULL,NULL,NULL,NULL),(451,'1614080902140','张小168','男','8','286','388',NULL,NULL,NULL,NULL,NULL),(452,'1614080902244','张小169','男','9','287','389',NULL,NULL,NULL,NULL,NULL),(453,'1614080902331','张小172','男','10','290','392',NULL,NULL,NULL,NULL,NULL),(454,'1614080902339','张小171','男','10','289','391',NULL,NULL,NULL,NULL,NULL),(455,'1614080902402','张小170','男','11','288','390',NULL,NULL,NULL,NULL,NULL),(456,'1614080901222','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(457,'1614080901245','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(458,'1614080902343','张小173','男','10','291','393',NULL,NULL,NULL,NULL,NULL),(459,'1614080902226','张小174','男','9','292','394',NULL,NULL,NULL,NULL,NULL),(460,'1614080902443','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(461,'1614080902241','张小175','男','9','293','395',NULL,NULL,NULL,NULL,NULL),(462,'1614080902124','张小176','男','8','294','396',NULL,NULL,NULL,NULL,NULL),(464,'1614080901140','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(465,'1614080901218','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(466,'1614080902404','张小177','男','11','295','397',NULL,NULL,NULL,NULL,NULL),(467,'1614080902117','张小178','男','8','296','398',NULL,NULL,NULL,NULL,NULL),(470,'1614080901121','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(471,'1614080902135','张小182','男','8','300','402',NULL,NULL,NULL,NULL,NULL),(472,'1614080901241','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(473,'1614080902144','张小183','男','8','301','403',NULL,NULL,NULL,NULL,NULL),(474,'1614080902110','张小185','男','8','303','405',NULL,NULL,NULL,NULL,NULL),(475,'1614080902213','张小184','男','9','302','404',NULL,NULL,NULL,NULL,NULL),(476,'1614080902201','张小187','男','9','305','407',NULL,NULL,NULL,NULL,NULL),(477,'1614080902340','张小186','男','10','304','406',NULL,NULL,NULL,NULL,NULL),(478,'1614080901133','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(479,'1614080901137','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(480,'1614080902342','张小188','男','10','306','408',NULL,NULL,NULL,NULL,NULL),(481,'1614080902322','张小189','男','10','307','409',NULL,NULL,NULL,NULL,NULL),(482,'1614080902131','张小190','男','8','308','410',NULL,NULL,NULL,NULL,NULL),(483,'1614080901124','学生名','男','4','123','222',NULL,NULL,NULL,NULL,NULL),(484,'1614080902138','张小192','男','8','310','412',NULL,NULL,NULL,NULL,NULL),(485,'1614080902222','张小191','男','9','309','411',NULL,NULL,NULL,NULL,NULL),(487,'1614080902338','张小194','男','10','312','414',NULL,NULL,NULL,NULL,NULL),(488,'1614080902330','张小195','男','10','313','415',NULL,NULL,NULL,NULL,NULL),(489,'1614080902216','张小196','男','9','314','416',NULL,NULL,NULL,NULL,NULL),(490,'1614080902134','张小197','男','8','315','417',NULL,NULL,NULL,NULL,NULL),(491,'1614080902107','张小98','男','8','216','318',NULL,NULL,NULL,NULL,NULL),(492,'1614080902114','张小180','男','8','298','400',NULL,NULL,NULL,NULL,NULL),(493,'1614080902142','张小148','男','8','266','368',NULL,NULL,NULL,NULL,NULL),(494,'1508081001217','张小107','男','8','225','327',NULL,NULL,NULL,NULL,NULL),(495,'1613071002206','张小52','男','9','170','272',NULL,NULL,NULL,NULL,NULL),(496,'1614080902239','张小179','男','9','297','399',NULL,NULL,NULL,NULL,NULL),(497,'1614080902309','张小21','男','10','139','241',NULL,NULL,NULL,NULL,NULL),(498,'1614080902320','张小66','男','10','184','286',NULL,NULL,NULL,NULL,NULL),(499,'1614080902423','张小112','男','11','230','332',NULL,NULL,NULL,NULL,NULL),(500,'1614080902428','张小82','男','11','200','302',NULL,NULL,NULL,NULL,NULL),(501,'1614080902429','张小136','男','11','254','356',NULL,NULL,NULL,NULL,NULL),(527,'1517060333','张小16','男','12','134','236',NULL,NULL,NULL,NULL,NULL),(528,'1517060319','张小170','男','12','288','390',NULL,NULL,NULL,NULL,NULL),(529,'1517060328','张小1','男','12','123','qqq222',NULL,NULL,NULL,NULL,NULL),(530,'1517060341','张小177','男','12','295','397',NULL,NULL,NULL,NULL,NULL),(531,'1517060340','张小7','男','12','125','227',NULL,NULL,NULL,NULL,NULL),(532,'1516090218','张小88','男','12','206','308',NULL,NULL,NULL,NULL,NULL),(533,'1517060302','张小32','男','12','150','252',NULL,NULL,NULL,NULL,NULL),(534,'1517060322','张小31','男','12','149','251',NULL,NULL,NULL,NULL,NULL),(535,'1517060308','张小56','男','12','174','276',NULL,NULL,NULL,NULL,NULL),(536,'1517060316','张小20','男','12','138','240',NULL,NULL,NULL,NULL,NULL),(537,'1517060305','张小111','男','12','229','331',NULL,NULL,NULL,NULL,NULL),(538,'1517060318','张小87','男','12','205','307',NULL,NULL,NULL,NULL,NULL),(539,'1517060324','张小58','男','12','176','278',NULL,NULL,NULL,NULL,NULL),(540,'1517060309','张小94','男','12','212','314',NULL,NULL,NULL,NULL,NULL),(541,'1517060336','张小121','男','12','239','341',NULL,NULL,NULL,NULL,NULL),(542,'1517060303','张小141','男','12','259','361',NULL,NULL,NULL,NULL,NULL),(543,'1517060334','张小6','男','12','124','226',NULL,NULL,NULL,NULL,NULL),(544,'1517060332','张小38','男','12','156','258',NULL,NULL,NULL,NULL,NULL),(545,'1517060321','张小112','男','12','230','332',NULL,NULL,NULL,NULL,NULL),(546,'1517060329','张小92','男','12','210','312',NULL,NULL,NULL,NULL,NULL),(547,'1517010101','张小89','男','12','207','309',NULL,NULL,NULL,NULL,NULL),(548,'1517060342','张小126','男','12','244','346',NULL,NULL,NULL,NULL,NULL),(549,'1517010108','张小77','男','12','195','297',NULL,NULL,NULL,NULL,NULL),(550,'1517060310','张小82','男','12','200','302',NULL,NULL,NULL,NULL,NULL),(557,'1414080902108','张小32','男','13','150','252',NULL,NULL,NULL,NULL,NULL),(558,'1414080902210','张小31','男','13','149','251',NULL,NULL,NULL,NULL,NULL),(559,'1414080902109','张小77','男','13','195','297',NULL,NULL,NULL,NULL,NULL),(560,'1414080902226','张小111','男','13','229','331',NULL,NULL,NULL,NULL,NULL),(561,'1414080902237','张小88','男','13','206','308',NULL,NULL,NULL,NULL,NULL),(562,'1414080902206','张小58','男','13','176','278',NULL,NULL,NULL,NULL,NULL),(563,'1414080902137','张小121','男','13','239','341',NULL,NULL,NULL,NULL,NULL),(564,'1414080902232','张小141','男','13','259','361',NULL,NULL,NULL,NULL,NULL),(565,'1414080902234','张小6','男','13','124','226',NULL,NULL,NULL,NULL,NULL),(566,'1414080902138','张小38','男','13','156','258',NULL,NULL,NULL,NULL,NULL),(567,'1414080902117','张小112','男','13','230','332',NULL,NULL,NULL,NULL,NULL),(568,'1414080902140','张小130','男','13','248','350',NULL,NULL,NULL,NULL,NULL),(569,'1414080902221','张小89','男','13','207','309',NULL,NULL,NULL,NULL,NULL),(570,'1414080902218','张小126','男','13','244','346',NULL,NULL,NULL,NULL,NULL),(571,'1414080902128','张小82','男','13','200','302',NULL,NULL,NULL,NULL,NULL),(572,'1406070302213','张小83','男','13','201','303',NULL,NULL,NULL,NULL,NULL),(573,'1414080902216','张小84','男','13','202','304',NULL,NULL,NULL,NULL,NULL),(574,'1414080902227','张小85','男','13','203','305',NULL,NULL,NULL,NULL,NULL),(575,'1414080902230','张小86','男','13','204','306',NULL,NULL,NULL,NULL,NULL),(576,'1414080902202','张小87','男','13','205','307',NULL,NULL,NULL,NULL,NULL),(577,'1414080902214','张小89','男','13','207','309',NULL,NULL,NULL,NULL,NULL),(578,'1414080902114','张小90','男','13','208','310',NULL,NULL,NULL,NULL,NULL),(579,'1414080902212','张小93','男','13','211','313',NULL,NULL,NULL,NULL,NULL),(580,'1414080902120','张小92','男','13','210','312',NULL,NULL,NULL,NULL,NULL),(581,'1414080902111','张小107','男','13','225','327',NULL,NULL,NULL,NULL,NULL),(582,'1414080902103','张小95','男','13','213','315',NULL,NULL,NULL,NULL,NULL),(583,'1414080902233','张小96','男','13','214','316',NULL,NULL,NULL,NULL,NULL),(584,'1414080902222','张小97','男','13','215','317',NULL,NULL,NULL,NULL,NULL),(585,'1414080902129','张小98','男','13','216','318',NULL,NULL,NULL,NULL,NULL),(586,'1413071001206','张小100','男','13','218','320',NULL,NULL,NULL,NULL,NULL),(587,'1414080902126','张小101','男','13','219','321',NULL,NULL,NULL,NULL,NULL),(588,'1414080902215','张小102','男','13','220','322',NULL,NULL,NULL,NULL,NULL),(589,'1414080902203','张小103','男','13','221','323',NULL,NULL,NULL,NULL,NULL),(590,'1414080902101','张小104','男','13','222','324',NULL,NULL,NULL,NULL,NULL),(591,'1414080902125','张小105','男','13','223','325',NULL,NULL,NULL,NULL,NULL),(592,'1414080902205','张小106','男','13','224','326',NULL,NULL,NULL,NULL,NULL),(593,'1414080902119','张小108','男','13','226','328',NULL,NULL,NULL,NULL,NULL),(594,'1414080902115','张小109','男','13','227','329',NULL,NULL,NULL,NULL,NULL),(595,'1414080902231','张小110','男','13','228','330',NULL,NULL,NULL,NULL,NULL),(596,'1414080902113','张小111','男','13','229','331',NULL,NULL,NULL,NULL,NULL),(597,'1414080902130','张小112','男','13','230','332',NULL,NULL,NULL,NULL,NULL),(598,'1414080902207','张小113','男','13','231','333',NULL,NULL,NULL,NULL,NULL),(599,'1414080902239','张小132','男','13','250','352',NULL,NULL,NULL,NULL,NULL),(600,'1414080902224','张小115','男','13','233','335',NULL,NULL,NULL,NULL,NULL),(601,'1414080902208','张小116','男','13','234','336',NULL,NULL,NULL,NULL,NULL),(602,'1414080902110','张小117','男','13','235','337',NULL,NULL,NULL,NULL,NULL),(603,'1414080902236','张小141','男','13','259','361',NULL,NULL,NULL,NULL,NULL),(604,'1414080902131','张小121','男','13','239','341',NULL,NULL,NULL,NULL,NULL),(605,'1414080902225','张小120','男','13','238','340',NULL,NULL,NULL,NULL,NULL),(606,'1414080902229','张小122','男','13','240','342',NULL,NULL,NULL,NULL,NULL),(607,'1414080902107','张小123','男','13','241','343',NULL,NULL,NULL,NULL,NULL),(608,'1414080902219','张小124','男','13','242','344',NULL,NULL,NULL,NULL,NULL),(609,'1414080902141','张小125','男','13','243','345',NULL,NULL,NULL,NULL,NULL),(610,'1414080902213','张小126','男','13','244','346',NULL,NULL,NULL,NULL,NULL),(611,'1414080902135','张小127','男','13','245','347',NULL,NULL,NULL,NULL,NULL),(612,'1414080902116','张小128','男','13','246','348',NULL,NULL,NULL,NULL,NULL),(613,'1414080902139','张小129','男','13','247','349',NULL,NULL,NULL,NULL,NULL),(614,'1414080902211','张小131','男','13','249','351',NULL,NULL,NULL,NULL,NULL),(615,'1414080902240','张小134','男','13','252','354',NULL,NULL,NULL,NULL,NULL),(616,'1414080902134','张小135','男','13','253','355',NULL,NULL,NULL,NULL,NULL),(617,'1414080902105','张小136','男','13','254','356',NULL,NULL,NULL,NULL,NULL),(618,'1414080902102','张小137','男','13','255','357',NULL,NULL,NULL,NULL,NULL),(619,'1414080902217','张小138','男','13','256','358',NULL,NULL,NULL,NULL,NULL),(620,'1414080902201','张小139','男','13','257','359',NULL,NULL,NULL,NULL,NULL),(621,'1414080902121','张小140','男','13','258','360',NULL,NULL,NULL,NULL,NULL),(622,'1414080902106','张小142','男','13','260','362',NULL,NULL,NULL,NULL,NULL),(623,'1414080902238','张小143','男','13','261','363',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stutask`
--

DROP TABLE IF EXISTS `stutask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stutask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teatask_id` int(11) DEFAULT NULL,
  `stu_id` int(11) DEFAULT NULL,
  `stusy_remark` mediumtext,
  `score` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `teatask_id_idx` (`teatask_id`),
  KEY `stu_id_idx` (`stu_id`),
  CONSTRAINT `stu_id` FOREIGN KEY (`stu_id`) REFERENCES `students` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `teatask_id` FOREIGN KEY (`teatask_id`) REFERENCES `teatask` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stutask`
--

LOCK TABLES `stutask` WRITE;
/*!40000 ALTER TABLE `stutask` DISABLE KEYS */;
INSERT INTO `stutask` VALUES (13,31,1,'<p>AV个人更会让和认识三方通话无服务服务服务</p>',NULL),(14,24,1,'<p>asdasf好，有</p>',NULL),(15,37,1,'<p>完成作业</p>',NULL),(16,35,1,'<p>dddddddddddddddddd</p>',NULL),(17,32,1,'<p>ds</p><figure class=\"image\"><img src=\"zyUploadImage/0.jpg\"></figure>',NULL),(18,30,1,'<ol><li>cwcwc</li></ol>',NULL),(19,27,1,'<p>cccccccccccccccccccccc</p>',NULL),(20,36,1,'<p>ggggggggggggg</p>',NULL),(21,34,1,'<p>gggggggggggg</p>',NULL),(22,33,1,'<p>gggggggggggg</p>',NULL);
/*!40000 ALTER TABLE `stutask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tName` varchar(45) DEFAULT NULL,
  `tNo` varchar(45) DEFAULT NULL,
  `sex` varchar(45) DEFAULT NULL,
  `tPhone` varchar(45) DEFAULT NULL,
  `tAddr` varchar(45) DEFAULT NULL,
  `tPwd` varchar(45) DEFAULT NULL,
  `gitUsername` varchar(100) DEFAULT NULL,
  `TOKEN` varchar(255) DEFAULT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `CLIENT_SECRET` varchar(255) DEFAULT NULL,
  `proftitle` varchar(45) DEFAULT NULL,
  `email` varchar(255) DEFAULT '0',
  `outDate` varchar(255) DEFAULT NULL,
  `validataCode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (1,'张三三','131001','男','13112345678','广东省惠州市河南岸街道','123qwe','zengsn','88602906f4b5b5676495cf41929723d9228b2e6a','b3149014960e48f42586','bfc1cb8b1e206c21ab5c9556aaaf7866ef305875','副教授','1370763849@qq.com','1550333167000','d7a77d29-d47f-4f8f-b80b-443956176631'),(2,'李四','131002','男','13102020202','广东省惠州市河南岸','as1234','zengsn','88602906f4b5b5676495cf41929723d9228b2e6a','client_id=b3149014960e48f42586','client_secret=bfc1cb8b1e206c21ab5c9556aaaf7866ef305875','讲师','1370763849@qq.com','1550333766000','40b4b0e3-ca0b-4f87-b437-445cf3e057fd'),(3,'弦五','131003','女','13102020202','广东省惠州市河南岸','222',NULL,NULL,NULL,NULL,'教授','0',NULL,NULL),(16,'柳柳','131004','女','13212345612','广东省','123',NULL,NULL,NULL,NULL,'讲师','0',NULL,NULL),(25,'angl','131005','男','13102020230','www.baidu.com','w',NULL,NULL,NULL,NULL,'助教','0',NULL,NULL),(32,'李白','131006','男','13112345678','1','1',NULL,NULL,NULL,NULL,'助教','0',NULL,NULL),(33,'李赛','131007','男','13149857264','4','1',NULL,NULL,NULL,NULL,'助教','0',NULL,NULL),(34,'陈结','131008','男','13149857264','1','4',NULL,NULL,NULL,NULL,'助教','0',NULL,NULL),(35,'张家奇','131009','男','13149857264','5268','456456',NULL,NULL,NULL,NULL,'助教','0',NULL,NULL),(36,'梁威','1310010','男','13149857264','和平','5825648',NULL,NULL,NULL,NULL,'教授','0',NULL,NULL),(37,'李6','131598','男','13149857264','55858','666',NULL,NULL,NULL,NULL,'助教','0',NULL,NULL);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teatask`
--

DROP TABLE IF EXISTS `teatask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teatask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `terms_id` int(11) DEFAULT NULL,
  `classinfo_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `remark` mediumtext,
  `deadline` varchar(45) DEFAULT NULL,
  `time` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teatask`
--

LOCK TABLES `teatask` WRITE;
/*!40000 ALTER TABLE `teatask` DISABLE KEYS */;
INSERT INTO `teatask` VALUES (23,5,2,1,1,'tttfbsgbryh','<p>ntntmydfgt gsdtk fhjy yh th dyth rtyuj&nbsp;</p><figure class=\"image\"><img src=\"editorUploadImage/79608201902010.jpg\"></figure>','2019-02-08','2019-02-01 12:09:52'),(24,5,3,1,1,'test','<p>我热情GV额问题吧</p><figure class=\"image\"><img src=\"editorUploadImage/89368201902150.jpg\"></figure>','2019-02-17','2019-02-15 15:52:25'),(25,5,3,1,1,'test2','<p>作业你DAU纷乱变绿v</p>','2019-02-13','2019-02-15 15:52:57'),(26,8,9,1,3,'测试','<p>全尺寸发VB录得VB</p>','2019-02-23','2019-02-16 13:30:53'),(27,5,3,1,1,'CS','<p>EFWRRRRRRRRRRRWF</p>','2019-02-23','2019-02-16 13:31:37'),(28,5,2,1,1,'DVWVWVSFVFV','<p>SFFFFFFFFFFFFFFFFFFFFFFFFFFV</p>','2019-02-22','2019-02-16 13:31:52'),(29,5,3,1,1,'VDABADBG','<p>BDGBGBGFBS</p>','2019-02-22','2019-02-16 13:32:13'),(30,5,3,1,1,'FBFGBFGBFGB','<p>完成作业</p>','2019-02-24','2019-02-16 13:32:26'),(31,5,3,1,1,'千万','<p>威风威风</p>','2019-02-23','2019-02-16 13:33:04'),(32,5,3,1,1,'发服务','<p>vs阿爸</p>','2019-02-23','2019-02-16 16:48:52'),(33,5,3,1,1,'发服务围绕服务人','<p>vs阿爸发文日v我</p>','2019-02-22','2019-02-16 16:49:04'),(34,5,3,1,1,'发服务围绕服务人','<p>啊啊啊啊啊啊啊啊啊</p>','2019-02-22','2019-02-16 16:49:09'),(35,5,3,1,1,'发服务围绕服务人','<p>222222222222222</p>','2019-02-22','2019-02-16 16:49:13'),(36,5,3,1,1,'发服务围绕服务人','<p>222222222222222333333</p>','2019-02-22','2019-02-16 16:49:17'),(37,5,3,1,1,'发服务围绕服务人3','<p>222222222222222333333</p>','2019-02-22','2019-02-16 16:49:21'),(38,5,3,1,1,'发服务围绕服务人33','<p>222222222222222333333</p>','2019-02-06','2019-02-16 16:49:24'),(39,5,3,1,1,'发服务围绕服务人333','<p>222222222222222333333</p>','2019-02-06','2019-02-16 16:49:28'),(40,8,11,1,3,'实验一','<p>cadc</p>','2019-02-24','2019-02-16 19:37:24');
/*!40000 ALTER TABLE `teatask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terms`
--

DROP TABLE IF EXISTS `terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `terms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `termno` varchar(45) DEFAULT NULL,
  `termname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=ujis;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terms`
--

LOCK TABLES `terms` WRITE;
/*!40000 ALTER TABLE `terms` DISABLE KEYS */;
INSERT INTO `terms` VALUES (1,'1','2016（1）'),(2,'2','2016（2）'),(3,'3','2017（1）'),(4,'4','2017（2）'),(5,'5','2018（1）'),(6,'6','2018（2）'),(8,'7','2019（1）'),(13,'8','2019（2）'),(14,'9','2020（1）'),(15,'10','2020（2）'),(16,'11','2021（1）');
/*!40000 ALTER TABLE `terms` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-16 23:56:05
