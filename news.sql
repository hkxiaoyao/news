-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: news
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.18.04.1

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `news_category_name` varchar(45) NOT NULL COMMENT '新闻类别名',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'科技'),(2,'游戏'),(3,'娱乐'),(4,'财经'),(5,'军事'),(6,'体育'),(8,'政治');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection`
--

DROP TABLE IF EXISTS `collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection` (
  `user_id` int(11) NOT NULL,
  `news_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`news_id`),
  KEY `fk_collection_2_idx` (`news_id`),
  CONSTRAINT `fk_collection_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_collection_2` FOREIGN KEY (`news_id`) REFERENCES `news` (`news_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection`
--

LOCK TABLES `collection` WRITE;
/*!40000 ALTER TABLE `collection` DISABLE KEYS */;
INSERT INTO `collection` VALUES (1,9),(2,12),(2,14),(1,19),(1,22),(1,24),(2,24);
/*!40000 ALTER TABLE `collection` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger increase_collection_number
  after insert
  on collection
  for each row
  update news
  set collection = collection + 1
  where news_id = NEW.news_id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger decrease_collection_number
  after delete
  on collection
  for each row
  update news
  set collection = collection - 1
  where news_id = OLD.news_id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `collection_news`
--

DROP TABLE IF EXISTS `collection_news`;
/*!50001 DROP VIEW IF EXISTS `collection_news`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `collection_news` AS SELECT 
 1 AS `news_id`,
 1 AS `title`,
 1 AS `summary`,
 1 AS `author`,
 1 AS `create_time`,
 1 AS `user_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `news_id` int(11) NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `fk_comment_1_idx` (`user_id`),
  KEY `fk_comment_2_idx` (`news_id`),
  CONSTRAINT `fk_comment_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_2` FOREIGN KEY (`news_id`) REFERENCES `news` (`news_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'很厉害','2019-01-05 07:20:05',1,14),(2,'不错不错','2019-01-05 08:20:05',2,14),(3,'1111','2019-01-05 06:52:20',1,12),(4,'1111','2019-01-05 06:53:50',1,12),(5,'hahhah','2019-01-05 06:56:48',1,9),(6,'aaaakjhk','2019-01-05 06:57:19',1,9),(7,'aa','2019-01-05 06:58:32',1,9),(8,'aaa','2019-01-05 06:59:17',1,9),(9,'wewe','2019-01-05 07:00:43',1,9),(10,'wewe','2019-01-05 07:00:46',1,9),(11,'wewe','2019-01-05 07:00:47',1,9),(12,'wewe','2019-01-05 07:00:47',1,9),(13,'wewe','2019-01-05 07:00:47',1,9),(14,'wewe','2019-01-05 07:00:47',1,9),(15,'aaaa','2019-01-05 07:01:45',1,9),(16,'aaaa','2019-01-05 07:02:19',1,9),(17,'aaaa','2019-01-05 07:02:24',1,9),(18,'厉害了','2019-01-05 07:16:07',1,13),(19,'游戏行业','2019-01-09 12:09:51',2,22),(20,'腾讯一家独大','2019-01-09 12:10:22',1,22);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger increase_comment_number
  after insert on comment
  for each row 
  update news
  set comment_number = comment_number + 1
  where news_id = NEW.news_id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `index_news`
--

DROP TABLE IF EXISTS `index_news`;
/*!50001 DROP VIEW IF EXISTS `index_news`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `index_news` AS SELECT 
 1 AS `news_id`,
 1 AS `title`,
 1 AS `summary`,
 1 AS `author`,
 1 AS `comment_number`,
 1 AS `create_time`,
 1 AS `pv`,
 1 AS `category_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `content` text NOT NULL,
  `summary` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `pv` int(11) NOT NULL DEFAULT '0',
  `collection` int(11) NOT NULL DEFAULT '0',
  `comment_number` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`news_id`),
  KEY `_idx` (`user_id`),
  CONSTRAINT `fk_news_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (9,'伊能静谈与庾澄庆婚变 缺少安全感给对方造成压力','<p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\">新浪娱乐讯 近日，在伊能静某节目中谈与庾澄庆婚变，直言自己因缺少安全感而给对方造成太大的压力。</p><p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\">　　节目中，伊能静谈到自己的两段婚姻，直言自己经历第一段与庾澄庆的婚姻时，还沉浸在原生家庭带给自己的伤痛之中，“在还没有成熟的年龄出来工作”，对感情很恐惧，“遇到一个可靠的人的时候，我像抓了一个浮木，我希望他把我所有原生家庭的痛苦通通解决掉”，因此带给对方太多的压力，“他是找老婆的，干嘛给你治病啊？”因此，在认识先生秦昊之前，她花费了五年时间来调整自己，才有了现在的良好状态。</p>','新浪娱乐讯近日，在伊能静某节目中谈与庾澄庆婚变，直言自己因缺少安全感而给对方造成太大的压力。　　节目中，伊能静谈到自己的两段婚姻，直言自己经历第一段与庾澄庆','2019-01-05 02:20:05',1,62,0,13,3),(10,'《廉政风云》发布“金三角”特辑','<p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\">电影《廉政风云》近日发布了“金三角”特辑。</p><p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/200/w600h400/20190105/Jliz-hrfcctm4972864.jpg\" style=\"border-style: none; max-width: 500px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\"></p><p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;刘青云、张家辉与林嘉欣在戏里戏外的关系都有些复杂。电影里，三人诠释了一段非一般意义上的“三角关系”。刘青云饰演的陈敬慈与林嘉欣饰演江雪儿同在廉政公署工作，因为彼此间“秘密”太多，最终走到了将要离婚的边缘。此时，陈敬慈接办重大案件，张家辉饰演的许植尧是案件重要证人，却在上庭前忽然逃跑。江雪儿作为廉政公署的谈判专家，奉命飞往澳洲劝许植尧回来协助调查。</p><p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/200/w600h400/20190105/hBza-hrfcctm4972932.jpg\" style=\"border-style: none; max-width: 500px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;而在戏外，林嘉欣参与过张家辉导演的《驱魔人》，张家辉与刘青云合作过《扫毒》，刘青云与林嘉欣相识很多年，但三个人之间的合作，是第一次。林嘉欣坦言：“跟戏好的演员一起演戏，真的很好玩。”对于刘青云和张家辉谁合作更愉快的问题，林嘉欣说没有比较：“演技交流的话，两个人都非常过瘾。”</p><p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;而刘青云然对老友张家辉在片中的拼命给予了肯定。特辑中，可以看到张家辉有一场寒冬中的泳池戏，张家辉亲身下水出演，上来后冻得满脸通红瑟瑟发抖，却毫无怨言。对此，身为老友的刘青云大加赞赏：“他（张家辉）是一个很喜欢接受挑战的人。”</p><p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/200/w600h400/20190105/Be0m-hrfcctm4972995.jpg\" style=\"border-style: none; max-width: 500px;\"/></p><div style=\"color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\"></div><p><br/></p>','电影《廉政风云》近日发布了“金三角”特辑。刘青云、张家辉与林嘉欣在戏里戏外的关系都有些复杂。电影里，三人诠释了一段非一般意义上的“三角关系”。刘青云饰演的陈','2019-01-05 02:21:08',1,7,0,0,3),(12,'20万商家迎新年首份“福利”：部分非刻意违规可“以考代罚”','<p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; text-indent: 36px; width: 843px; white-space: normal;\">元旦刚过，京东平台超过20万商家就收到一份“福利”： 1月2日京东正式上线“以考代罚”功能，对商家部分非刻意导致的违规行为视情形给予考试机会，并对通过考试的商家抵消相应的扣分处罚。此举旨在打造更加积极健康的平台生态，让商家更快更好地了解和遵守平台规则，从而为消费者提供更优质的商品和服务。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; width: 843px; white-space: normal; text-align: center;\"><img src=\"https://upload.qudong.com/2019/0103/1546503570265.png\" border=\"0\" alt=\"微信图片_20190103161925\" style=\"margin: 0px 0px 20px; padding: 0px; list-style: none; font-size: 14px; color: rgb(102, 102, 102); outline: none; border-width: initial; border-style: none; overflow: hidden; max-width: 100%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; text-indent: 36px; width: 843px; white-space: normal;\"><strong style=\"margin: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); line-height: 34px;\">重学轻罚，助力商家可持续发展</strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; text-indent: 36px; width: 843px; white-space: normal;\">经过十几年的发展，电商平台的运营管理越来越规范。为了充分维护消费者的权益，同时让商家放心开店、省心赚钱，京东平台先后出台了上百项经营规则，违反规则的商家会受到严格的处罚。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; text-indent: 36px; width: 843px; white-space: normal;\">不过京东调研发现，不少商家的违规行为是忽略了对平台规则的学习，导致误操作或其他客观因素造成的，并非是刻意通过不当行为牟利。怎么帮助这部分商家尽快成长，而不是“一罚了之”？京东推出了“以考代罚”。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; width: 843px; white-space: normal; text-align: center;\"><img src=\"https://upload.qudong.com/2019/0103/1546503894130.jpg\" border=\"0\" alt=\"微信图片_20190103162443\" style=\"margin: 0px 0px 20px; padding: 0px; list-style: none; font-size: 14px; color: rgb(102, 102, 102); outline: none; border-width: initial; border-style: none; overflow: hidden; max-width: 100%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; text-indent: 36px; width: 843px; white-space: normal;\">“以考代罚”推出后，不少商家在卖家论坛里留言表示欢迎。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; text-indent: 36px; width: 843px; white-space: normal;\">“对商家违规行为的扣分和处理从来都不是京东平台治理的目的，”京东商城平台生态部规则管理＆商家提升总经理王博表示，“推出‘以考代罚’就是用人性化的方式将处罚与培训相结合，让商家更重视、更熟悉平台规则，帮助他们为消费者带来更好的购物体验，也推动他们在京东平台的可持续发展。“</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; text-indent: 36px; width: 843px; white-space: normal;\">哪些商家有机会“以考代罚”？商家要获取这一资格，需要先通过“店铺基础运营认证”：掌握入驻、仓配客售、广告投放、内容营销等一系列基础运营知识，完成认证考试。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; text-indent: 36px; width: 843px; white-space: normal;\">哪些违规行为可以“以考代罚”？京东近期发布了《以考代罚细则》新增公告，明确了纳入“以考代罚”的6大类型14种非刻意、非严重违规场景，包括滥发信息、描述不符、咚咚或400电话使用违规等。商家在一年中首次违反这些规定时，将不再只有申诉和接受处理这两个选项，还可参与“以考代罚”来抵消相应的扣分。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; text-indent: 36px; width: 843px; white-space: normal;\">“以考代罚”考什么？考试根据《京东开放平台商家积分管理规则》内容出具，考试若不合格，也可通过查看错题解析对平台规则“知其所以然”。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; text-indent: 36px; width: 843px; white-space: normal;\">截至目前，已有近10位商家参加了“以考代罚”考试。一位生鲜品类商家通过考试后说，考试确实能更加了解平台规则，让自己清楚到底哪儿做错了，也给了自己一次机会，对店铺良性运营很有帮助。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; width: 843px; white-space: normal; text-align: center;\"><img src=\"https://upload.qudong.com/2019/0103/1546503918582.jpg\" border=\"0\" alt=\"微信图片_20190103162432\" style=\"margin: 0px 0px 20px; padding: 0px; list-style: none; font-size: 14px; color: rgb(102, 102, 102); outline: none; border-width: initial; border-style: none; overflow: hidden; max-width: 100%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; text-indent: 36px; width: 843px; white-space: normal;\">商家满足“以考代罚”条件后，即可在商家后台—奖惩管理—违规管理看到入口</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; text-indent: 36px; width: 843px; white-space: normal;\"><strong style=\"margin: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); line-height: 34px;\">以考代罚绝不是“只考不罚”</strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; text-indent: 36px; width: 843px; white-space: normal;\">可能有人会问：商家“以考代罚”是不是意味着不用受到严格的处罚？这相当于开了大胆违规的口子，商家的品质和服务、消费者的权益怎么保证？而且这对认真遵守规则的商家是不是不公平？</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; text-indent: 36px; width: 843px; white-space: normal;\">您大可放心。首先，“以考代罚”并不是不再对商家进行处罚，通过考试的商家可以抵消的仅仅是违规行为带来的扣分处理，其商品下架、删除、店铺降权等措施依然会执行。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; text-indent: 36px; width: 843px; white-space: normal;\">其次，“以考代罚”除了需要“店铺基础运营认证”，还有次数限制。虽然商家在违约单开具到申诉结果/违约单确认前对一项违规行为可多次重考，直至通过，但每一项违规行为在一年中只有一次“以考代罚”的机会，第二次违规就得认罚了。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; text-indent: 36px; width: 843px; white-space: normal;\">最后，绝不是所有违规行为都能获得“特赦”，发布非约定商品、虚假交易等严重违规行为均不能以考代罚。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; width: 843px; white-space: normal; text-align: center;\"><img src=\"https://upload.qudong.com/2019/0103/1546503940708.png\" border=\"0\" alt=\"微信图片_20190103162438\" style=\"margin: 0px 0px 20px; padding: 0px; list-style: none; font-size: 14px; color: rgb(102, 102, 102); outline: none; border-width: initial; border-style: none; overflow: hidden; max-width: 100%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; text-indent: 36px; width: 843px; white-space: normal;\">商家收到“罚单“后，申诉和考试可以同时进行。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; text-indent: 36px; width: 843px; white-space: normal;\">王博介绍，以“以考代罚”为标志的柔性治理避免了教条式、刻板化地执行规则，有利于打造更加包容公平、更有温度的平台生态，是京东综合治理计划迈出的第一步。未来，京东开放平台还将上线自动化预警、自动化诊断、商家帮扶计划等更多功能，推动平台综合治理的全面发展，让商家享受更好的开店体验，也让消费者获得更好的保障。</p><p><br/></p>','元旦刚过，京东平台超过20万商家就收到一份“福利”：1月2日京东正式上线“以考代罚”功能，对商家部分非刻意导致的违规行为视情形给予考试机会，并对通过考试的商','2019-01-05 02:26:47',1,30,0,2,1),(13,'荣耀周报：最强中路英雄，居然免费送？一级就能飞全图，有蓝还能1打5？','<p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">新的一年终于到了，请收下小弟迟到的新年快乐。不过新的一年肯定大家都有不一样的面貌，王者荣耀也不例外。话不多说，一起跟随小弟来看看新的一年王者荣耀发生的那些大事吧！</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/67/w440h427/20190105/iK4a-hrfcctm4773091.jpg\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">新英雄嫦娥上线 颜值高还非常暴力</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">伴随着这次的新版本上线体验服的同时，新英雄“嫦娥”也是进入了大家的视野。根据官方透露，背景故事为嫦娥作为魔道家族的公主，在一些魔道与神界的矛盾中迷失自我，无法理解于是隔绝了自己。同时官方也透露嫦娥的官方CP就是后羿！下面一起来看看嫦娥的技能介绍：</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">登场画面：</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/480/w250h230/20190105/fkgT-hrfcctm4773149.gif\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">技能介绍：</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">被动——月盈</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">嫦娥受到月光的守护，以自身法力值产生的护盾抵挡伤害；嫦娥的法力值越高造成的伤害越高，法术强度会提升嫦娥的最大法力值。</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/631/w365h266/20190105/pcet-hrfcctm4773209.gif\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">一技能——月辰</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">嫦娥向指定方向释放能量，对命中的第一个目标造成定身效果并标记；嫦娥的普攻与技能伤害能够引爆标记，对范围内的敌人造成法术伤害和减速效果。</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">被动：嫦娥的普通攻击变为法术伤害，每过5秒的第一次普攻射程提升。</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/2/w450h352/20190105/4_g7-hrfcctm4773343.gif\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">二技能——月璇</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">短暂的施法后，嫦娥在身边和指定位置召唤法力旋涡，吸取范围内敌人法力值并造成法术伤害，法力值不足的敌人将会受到额外的法术伤害。</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/622/w345h277/20190105/jSV4-hrfcctm4773426.gif\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">三技能——月芒</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">嫦娥解放狂暴的魔道力量，疯狂倾泻自身的法力值并随机向周围发射法力弹幕，对命中的敌人造成法术伤害</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/35/w500h335/20190105/_Ag1-hrfcctm4773506.gif\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">回城技能——归月、奔月</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">嫦娥点击回城后吟唱七秒后将嫦娥传送回己方基地；在之后的十秒内，嫦娥可以再次使用技能，飞回原来的位置</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/629/w237h392/20190105/F-rO-hrfcctm4773564.gif\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/586/w197h389/20190105/hxum-hrfcctm4773636.gif\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">小弟在这里就给大家斗胆来评价一下嫦娥了，可以看得出来蓝量对于嫦娥来说非常的珍贵，不仅可以生成护盾还能增加伤害。官方还特地给嫦娥配置了所未有吸蓝的机制，同时被动的10S内传送回也是推进体系中的核心。缺少团战切入和控制有些遗憾，但瑕不掩瑜，可见嫦娥技能之强大！</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/743/w355h388/20190105/DNCo-hrfcctm4773765.jpg\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">最大的重点来了！嫦娥，免费送！只为庆祝嫦娥四号成功登月！还和人民日报合作，太有排面了！看来为了年终奖，天美的策划也是拼了啊！</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/751/w432h319/20190105/kK30-hrfcctm4773806.jpg\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">新玩法日之塔上线 吕布也出霸气特效</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">这次新出来的日之塔其实就是一个多人组队通关的玩法。整个玩法包含两大关，每关都有简单、普通和困难三个难度，而且没关都有非常多的挑战和互动元素在里面。玩家胜利的目标就是组队击杀每关的BOSS，玩法中玩家可以解锁新的天赋和装备并有特殊的效果和技能。</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/107/w540h367/20190105/szZJ-hrfcctm4773848.png\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">同时在1月2日的更新中吕布的霸气特效“天下无双”专属特效礼包也上线，玩家购买有几率获得吕布的专属回城和击败特效，在小弟眼中这两个特效可以说非常的威武霸气了！</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/792/w540h252/20190105/h8uh-hrfcctm4773872.jpg\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/787/w455h332/20190105/s9uU-hrfcctm4773897.jpg\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">“王者出征”版本更新 多个功能升级</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">就在这次的“王者出征”新版本中，官方对于各方面的功能、画面、系统机制等都有着一定的改变，下面小弟将详细给大家透露一下体验服中的更新情况：</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">1、美术升级</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">这次官方在美术方面的升级可谓多个方面多个角度，大厅界面改版、峡谷地图改版、怪物模型改版、再加上画质突飞猛进的峡谷内高清地图等等都让整个游戏看起来逼真感觉十足。</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/600/w300h300/20190105/wzDF-hrfcctm4774151.gif\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/621/w342h279/20190105/1efW-hrfcctm4774196.gif\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">而游戏中的英雄模型以及皮肤的质感和精细程度也进行了一定的革新，并且在英雄的展示页面加上了背景故事中的区域画面。</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/17/w540h277/20190105/_pqn-hrfcctm4774214.jpg\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/789/w540h249/20190105/cpJJ-hrfcctm4774335.jpg\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">2.峡谷内机制调整</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">这里就包括小弟上周报道的关于兵线组成和属性调整、防御塔调整、野怪调整，还有地形方面的改动等等。</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/709/w534h175/20190105/N0GD-hrfcctm4774356.png\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">3.装备和英雄调整</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">在这次的新版本中，多数装备都有被调整，其中改动比较大的莫过于打野装备的BUFF叠加效果的下降以及辅助装备的技能改动。</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/775/w540h235/20190105/_vUS-hrfcctm4774400.jpg\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">在英雄调整方面，射手的射程范围进行了一定调整，而且在正式服中的英雄调整也和小弟前几次介绍的关于英雄调整别无二致，这里就不再赘述了。</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/15/w540h275/20190105/TxLR-hrfcctm4774436.jpg\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">体验服两次更新 三名英雄调整</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">在去年的12月29日以及今年的1月1日，体验服两次更新中共有三名英雄被调整。其中被加强的英雄有百里守约和明世隐，被削弱的则是新英雄嫦娥了。</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">在加强的英雄中，百里守约的射程从800提升至850，明世隐的一技能中增加了基础攻速以及等级加成。</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/676/w488h188/20190105/bWn8-hrfcctm4774459.png\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">而嫦娥在这两次更新中都上榜了，首先是被动的法术攻击增加的法力值和抵挡伤害值都下降，而且法力值抵挡伤害比例也从80%降低到60%。再有就是大招月芒伤害值两次更新都降低，但是耗蓝量下降。</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/10/w489h321/20190105/35se-hrfcctm4774486.png\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">那么看到这里本周的荣耀周报就要和大家说再见了。</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">最后一个正惊问题：嫦娥出来后你觉得吴刚会出现吗？</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/795/w454h341/20190105/2ZpZ-hrfcctm4774558.jpg\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><div class=\"mianze\" style=\"margin: 0px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><strong>新浪声明：新浪网登载此文出于传递更多信息之目的，并不意味着赞同其观点或证实其描述。</strong></div><p><br/></p>','新的一年终于到了，请收下小弟迟到的新年快乐。不过新的一年肯定大家都有不一样的面貌，王者荣耀也不例外。话不多说，一起跟随小弟来看看新的一年王者荣耀发生的那些大','2019-01-05 02:28:07',1,19,0,1,2),(14,'中国第5种隐身飞机首飞 隐身比歼20强可飞敌纵深内部','<p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal;\">近日，网上某新闻媒体披露了航天科工集团飞航导弹研究院下属的海鹰无人机公司最新研发的“天鹰”无人机起降试飞视频。这也是我国首个公开试飞视频的飞翼无人机，也标志着我国第五种隐身飞机首飞获得成功，在此之前歼20、歼31、利剑和某型 无人机首飞均获得成功。本文根据2018年珠海航展上公开展出的“天鹰”无人机实物相关资料，以及试飞视频，对其性能做一简要分析。从体积和外形上看，“天鹰”无人机和航空工业沈阳飞机设计研究所研制的“利剑”无人机有着很大的区别。“利剑”无人机最大起飞重量达15吨，已属于大型战略无人机的范畴，其内置弹舱可载弹1.5-2吨，而“天鹰”无人机在珠海航展上公布的数据为：最大起飞重量达3吨级，仍然属于战术无人机的范畴，其内置弹舱载弹一般认为不会超过500公斤，主要用于高威胁前线战场环境下对重要目标实施渗透、攻击或抵近执行战役战术侦察任务。</p><div class=\"img_wrapper\" style=\"margin: 0px; padding: 0px; text-align: center; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal;\"><img src=\"http://n.sinaimg.cn/mil/crawl/129/w550h379/20190104/RJMJ-hqzxptp3733810.jpg\" alt=\"\" style=\"margin: 0px auto; padding: 0px; border-style: none; vertical-align: top; max-width: 640px; display: block;\"/><span class=\"img_descr\" style=\"margin: 5px auto; padding: 6px 0px; line-height: 20px; font-size: 16px; display: inline-block; zoom: 1; text-align: left; font-weight: 700;\"></span></div><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal;\">　　“利剑”无人机在研制之初就考虑到海军航空母舰的需要，以后很有可能上舰，因此采用了翼展较小的小展弦飞翼气动布局，其优点是飞行速度较高，虽不能超音速飞行，但最大飞速速度也已接近音速；而“天鹰”无人机采用了机翼翼展较长的大展弦比飞翼气动布局，其翼展达14-15米左右，几乎和利剑无人机的翼展不相上下。大展弦比飞翼气动布局阻力较大，最大飞行速度也较低，一般为0.6-0.8倍音速左右，但由于升力系数较高，却有着极其优异的航程，与其气动布局，大小尺寸相近的美国洛克希德·马丁公司的RQ-170“哨兵”飞翼无人机最大航程就可达4000至6000公里。航空发动机动力是“天鹰”无人机最不用担心的，由于航天科工集团飞航导弹研究院下属的飞航动力研究所具有完整的小型涡喷，涡扇，冲压及组合发动机研制生产能力，并已自行研制成功推力1000公斤级别的涡扇发动机，正好适配其自行研制的“天鹰”无人机。</p><div class=\"img_wrapper\" style=\"margin: 0px; padding: 0px; text-align: center; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal;\"><img src=\"http://n.sinaimg.cn/mil/crawl/57/w550h307/20190104/S94H-hqzxptp3733837.jpg\" alt=\"\" style=\"margin: 0px auto; padding: 0px; border-style: none; vertical-align: top; max-width: 640px; display: block;\"/><span class=\"img_descr\" style=\"margin: 5px auto; padding: 6px 0px; line-height: 20px; font-size: 16px; display: inline-block; zoom: 1; text-align: left; font-weight: 700;\"></span></div><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal;\">　　由于和中航工业和中国航发的关系较好，该1000公斤级涡扇发动机早已顺利完成在四川江油高空试车台和西安飞行试验研究院伊尔76运输机改装的飞行台的发动机鉴定工作，避免了动力受制于人的局面。隐身性能是飞翼无人机的最大优势，从珠海航展展出的“天鹰”无人机实机来看，由于其体积本来就小于歼20，加上特殊的隐身设计，所以其雷达反射截面积较小，具有极高隐身性。</p><div class=\"img_wrapper\" style=\"margin: 0px; padding: 0px; text-align: center; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal;\"><img src=\"http://n.sinaimg.cn/mil/crawl/40/w550h290/20190104/s022-hqzxptp3733867.jpg\" alt=\"\" style=\"margin: 0px auto; padding: 0px; border-style: none; vertical-align: top; max-width: 640px; display: block;\"/><span class=\"img_descr\" style=\"margin: 5px auto; padding: 6px 0px; line-height: 20px; font-size: 16px; display: inline-block; zoom: 1; text-align: left; font-weight: 700;\"></span></div><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal;\">　　在红外隐身方面，“天鹰”无人机也做了一定的考虑，其尾喷口为椭圆形而非标准的正圆型。据有关资料称，椭圆形尾喷管与正圆型尾喷管相比，可加快航空发动机外涵道空气与内涵道高温尾气的掺混速度，降低红外辐射系数。该飞机的飞控来源让人很感兴趣，由于飞翼布局无人机采用了翼身融合体的结构，取消了传统飞机的平尾和垂尾，但是因为其稳定性先天不足，使得飞翼无人机在强气流扰动时抗干扰能力差，航迹跟踪和稳定性控制十分困难。据公开资料称，“天鹰”无人机采用了基于神经网络补偿动态逆控制飞控系统，和美国的F35、X36战机的飞控系统技术水平相等。从公开的飞行起降视频来看，其飞行状态十分稳定，飞控系统具有良好的动态性能和稳态特性。</p><div class=\"img_wrapper\" style=\"margin: 0px; padding: 0px; text-align: center; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal;\"><img src=\"http://n.sinaimg.cn/mil/crawl/103/w550h353/20190104/1hLb-hqzxptp3733890.jpg\" alt=\"\" style=\"margin: 0px auto; padding: 0px; border-style: none; vertical-align: top; max-width: 640px; display: block;\"/><span class=\"img_descr\" style=\"margin: 5px auto; padding: 6px 0px; line-height: 20px; font-size: 16px; display: inline-block; zoom: 1; text-align: left; font-weight: 700;\"></span></div><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal;\">　　另据公开资料称，“天鹰”无人机还很有可能采用了我国有关科研部门自行研制的离子体激励器，除了可进一步提高无人机隐身性能外，还显著增加飞翼布局飞行器的最大升力系数，延缓失速发生，增强对飞机的机动控制能力，扩展了飞机飞行包线，极大的提高了飞翼布局无人机的飞行性能。（作者署名：未来巡航者）</p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal;\">　　《出鞘》完整内容请关注新浪军事官方微信抢先查看（查看详情请搜索微信公众号：sinamilnews），《出鞘》每天在新浪军事官方微信完整首发。</p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal;\">　　<span style=\"font-weight: 700 !important;\">本栏目所有文章目的在于传递更多信息，并不代表本网赞同其观点和对其真实性负责。凡本网注明版权所有的作品，版权均属于新浪网，凡署名作者的，版权则属原作者或出版人所有，未经本网或作者授权不得转载、摘编或利用其它方式使用上述作品。</span></p><p><br/></p>','近日，网上某新闻媒体披露了航天科工集团飞航导弹研究院下属的海鹰无人机公司最新研发的“天鹰”无人机起降试飞视频。这也是我国首个公开试飞视频的飞翼无人机，也标志','2019-01-05 02:35:54',1,42,0,2,1),(17,'正风肃纪 久久为功 ——党的十九大以来全面从严治党成果巡礼之三','<p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(34, 34, 34); white-space: normal;\">6.9万起&nbsp;</p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(34, 34, 34); white-space: normal;\">　　9.7万人&nbsp;</p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(34, 34, 34); white-space: normal;\">　　6.9万人</p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(34, 34, 34); white-space: normal;\">　　党的十九大以来，截至2018年11月底，全国共查处违反中央八项规定精神问题6.9万起，处理党员干部9.7万人，给予党纪政务处分6.9万人。</p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(34, 34, 34); white-space: normal;\">　　13.31万个</p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(34, 34, 34); white-space: normal;\">　　18.01万人</p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(34, 34, 34); white-space: normal;\">　　党的十九大以来，截至2018年11月底，全国共查处扶贫领域腐败和作风问题13.31万个、处理18.01万人。</p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(34, 34, 34); white-space: normal;\">　　　　　　</p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(34, 34, 34); white-space: normal;\">　　“巩固拓展作风建设成果，坚定不移纠‘四风’、树新风。”前不久召开的中共中央政治局会议对作风建设提出了明确要求。如何扫除作风之弊，根治“四风”顽疾？答案在于常抓不懈、久久为功。</p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(34, 34, 34); white-space: normal;\">　　党的十九大以来，中央纪委国家监委把落实中央八项规定精神、纠正“四风”作为工作的重中之重，认真研究部署，强化督促指导，狠抓工作落实。各级纪检监察机关聚焦监督执纪问责，层层压实责任，继续紧盯享乐奢靡问题，全面启动整治形式主义、官僚主义问题，持续正风肃纪、保持高压态势，作风建设不断深入，成为党的建设一张金色名片。</p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(34, 34, 34); white-space: normal;\"><strong>　　严格执纪，推动中央八项规定精神落细落实</strong></p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(34, 34, 34); white-space: normal;\">　　一年多来，中央纪委国家监委网站每个月定期通报全国违反中央八项规定精神问题情况。党的十九大以来，截至2018年11月底，全国共查处违反中央八项规定精神问题6.9万起，处理党员干部9.7万人，给予党纪政务处分6.9万人。</p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(34, 34, 34); white-space: normal;\">　　“河北省涿鹿县财政局违规发放津补贴问题”“江西省上高县泗溪镇马岗水库管理所所长罗耀华违规使用公车问题”“北京市紫光影城违规发放购物卡、公款吃喝等问题”……2018年中秋国庆期间，中央纪委国家监委网站推出“中秋国庆期间违反中央八项规定精神问题监督举报曝光专区”，从9月20日起，分3次对各地各单位查处的35起违反中央八项规定精神问题点名道姓通报曝光，体现出各级纪检监察机关铁面执纪、寸步不让的坚决态度，对“四风”动真碰硬、严查严处，让干部树立知畏知止的红线意识。</p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(34, 34, 34); white-space: normal;\">　　每逢元旦春节、五一端午、中秋国庆等重要节点，中央纪委国家监委均制定节日期间落实中央八项规定精神、整治“四风”工作方案，通过集中通报曝光、开设监督举报专区等形式，持续对纠“四风”打招呼、发信号、提要求；各级纪检监察机关遴选典型问题，点名道姓、公开曝光，持续释放正风肃纪的强烈信号，强化“不敢”的震慑。</p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(34, 34, 34); white-space: normal;\">　　实践中，一些地区和部门在重要节点期间主动出击，强化监督检查。有的协调财政、审计、税务等有关职能部门参加，上下联动、分工负责，加大节日期间检查力度；有的多管齐下、媒体跟进，采取快查快处等方式，及时发现违反中央八项规定精神问题，集中整治“四风”和隐形变异问题。紧盯节点、寸步不让，管出了习惯、抓出了成效，推动了干部作风持续向好。</p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(34, 34, 34); white-space: normal;\">　　一年来，各级纪检监察机关抓牢“两个责任”，通过追责问责倒逼履职尽责。湖北省高级人民法院党组副书记、副院长覃文萍因分管单位和部门多次发生违反中央八项规定精神等问题被问责；福建省上杭县泮境乡党委原书记李英荣，纪委原书记钟东荣因该乡损害群众利益的不正之风和腐败问题多发被问责……</p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(34, 34, 34); white-space: normal;\">　　各地坚持“一案双查”，既处分当事人，更倒查主体责任和监督责任，不少部门、单位“一把手”及纪检监察机关负责人因失责失察甚至袒护包庇“四风”问题而受到严厉追责问责，压力层层传导，进一步压紧压实“两个责任”。</p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(34, 34, 34); white-space: normal;\"><strong>　　聚焦重点，集中整治形式主义、官僚主义</strong></p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(34, 34, 34); white-space: normal;\">　　甘肃省财政厅农业二处原处长金中等人作风慵懒，只当“二传手”，致使4000万元中央财政下达的专项扶贫资金在省级财政滞留长达146天；湖北黄石市不动产登记中心原负责人谌宏等人擅自作出每天限号50个的决定，甚至出现“哪怕闲着，没有号，也不受理登记”的情况……2018年11月28日，中央纪委公开曝光6起形式主义、官僚主义典型问题，引起广泛关注，形成强大震慑。</p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(34, 34, 34); white-space: normal;\">　　党的十九大以来，习近平总书记对反对形式主义、官僚主义作出一系列重要指示。中央纪委组织多次专题学习，并全面了解分析当前形式主义、官僚主义的主要表现形式。2018年9月，中央纪委印发《关于贯彻落实习近平总书记重要指示精神集中整治形式主义、官僚主义的工作意见》（简称《工作意见》），明确了重点整治的在贯彻落实中央重大决策部署中空喊口号、不担当不作为不负责、漠视群众利益和疾苦等12类具体问题，提出了具体工作措施。</p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(34, 34, 34); white-space: normal;\">　　各地各部门结合自身实际贯彻落实《工作意见》，采用多种形式全面启动、部署开展整治形式主义、官僚主义工作。安徽以领导机关为主要对象整治形式主义、官僚主义，省纪委监委组织3个调研组赴各省辖市及32个县（市、区）实地调研，对发现的问题，向全省各省辖市和23个省直单位点对点反馈意见建议196条；浙江派出11路专项督导调研组，由省纪委监委领导带队，开展明察暗访，对干部群众反映强烈、具有典型性的问题线索挂牌督办；山东2018年以来共查处形式主义、官僚主义问题4074起，给予党纪政务处分3250人……</p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(34, 34, 34); white-space: normal;\">　　对查处的典型形式主义、官僚主义问题，各地第一时间通报曝光，发挥警示教育作用。2018年以来，中央纪委先后分两批通报曝光了13起形式主义、官僚主义问题。福建、浙江等地紧扣防范化解重大风险、精准脱贫、污染防治等重点领域，对表态多调门高、行动少落实差等突出问题进行通报曝光。这一切释放出从严从紧的强烈信号。</p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(34, 34, 34); white-space: normal;\"><strong>　　发力“拍蝇”，狠刹群众身边不正之风</strong></p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(34, 34, 34); white-space: normal;\">　　“人民群众反对什么、痛恨什么，我们就要坚决防范和纠正什么。”2018年，各级纪检监察机关坚持以人民为中心的工作理念，把整治群众身边的腐败和作风问题作为极其重要的政治任务，“打虎”的同时，发力“拍蝇”，重点整治侵害群众利益的“蝇贪”，深入治理扶贫领域腐败和作风问题，以实际行动不断增强群众的获得感、幸福感、安全感。</p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(34, 34, 34); white-space: normal;\">　　2018年是脱贫攻坚的关键一年。中央纪委国家监委和各级纪检监察机关认真履行职责，为脱贫攻坚提供坚强纪律保证。中央纪委印发《关于2018年至2020年开展扶贫领域腐败和作风问题专项治理的工作方案》，对坚决整治扶贫领域损害群众利益的突出问题和不正之风作出明确要求。8月25日，中央纪委国家监委会同国务院扶贫办在陕西延安召开深化专项治理扶贫领域腐败和作风问题工作推进会，强调要督促党委、政府履行好脱贫攻坚主体责任，着力解决形式主义、官僚主义和不担当不作为等作风问题。</p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(34, 34, 34); white-space: normal;\">　　一年来，各级纪检监察机关建立了与扶贫、财政、民政、审计以及信访等部门的全天候、即时化沟通衔接机制，对群众反映的扶贫领域作风问题线索，一律优先受理、从快办理，确保每一个线索都妥善处理到位。党的十九大以来，截至2018年11月底，全国共查处扶贫领域腐败和作风问题13.31万个、处理18.01万人。</p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(34, 34, 34); white-space: normal;\">　　地方各级党委（党组）、纪委监委认真履行全面从严治党主体责任、监督责任，把解决群众反映强烈问题作为重要政治任务，在整治群众身边腐败和作风问题上积极作为，有力推动了党中央惠民政策真正落地见效。四川省纪委监委针对“一卡通”发放、管理、使用中存在的违纪违法问题，于2018年部署开展了惠民惠农财政补贴资金“一卡通”管理问题专项治理，集中整治私自保管代管、违规扣留扣押群众“一卡通”以及利用群众“一卡通”雁过拔毛、截留挪用等问题，有关做法经验在全国十几个省份推广。重庆市纪委监委专门设立民生监督室，紧盯民生项目资金开展常态化监督检查，针对教育、医疗、住房等领域突出问题开展深度清理整顿，督促有关部门开展党员干部亲属涉权事项公开，“一竿子插到底”监督“微权力”运行。</p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(34, 34, 34); white-space: normal;\">　　“作风建设只有进行时，没有完成时。我们将加大监督检查和执纪问责力度，盯紧盯住享乐奢靡老问题，密切关注新动向，着力纠正和整治形式主义、官僚主义，不断巩固拓展落实中央八项规定精神成果，推动化风成俗，形成长效。”中央纪委国家监委党风政风监督室有关负责人表示。</p><p><br/></p>','6.9万起　　9.7万人　　6.9万人　　党的十九大以来，截至2018年11月底，全国共查处违反中央八项规定精神问题6.9万起，处理党员干部9.7万人，给予','2019-01-09 10:39:21',2,0,0,0,8),(18,'从长期大势认识当前形势 ——二论深刻把握新形势下做好经济工作的规律性认识','<p style=\"color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;; font-size: 14px; text-indent: 21px; white-space: normal; background-color: rgb(247, 250, 255);\">“不谋万世者，不足谋一时；不谋全局者，不足谋一域”。做好新形势下经济工作，必须从长期大势认识当前形势，认清我国长期向好发展前景。这既是我们党在实践中对经济工作规律性认识的进一步深化，也是科学分析经济形势、牢牢把握经济工作主动权的重要方法和基本原则。</p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;; font-size: 14px; text-indent: 21px; white-space: normal; background-color: rgb(247, 250, 255);\">刚刚过去的2018年，在以习近平同志为核心的党中央坚强领导下，全国上下坚持稳中求进工作总基调，按照高质量发展要求，有效应对外部环境深刻变化，深入推进供给侧结构性改革，三大攻坚战开局良好，国民经济运行继续保持总体平稳、稳中有进态势，较好完成全年经济社会发展主要目标任务。从长远看，基于我国发展拥有足够的韧性、巨大的潜力，经济长期向好的态势不会改变，这是我国经济形势的主流。</p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;; font-size: 14px; text-indent: 21px; white-space: normal; background-color: rgb(247, 250, 255);\">但同时也要看到，在发展中还面临一些突出矛盾和问题。主要是，经济运行稳中有变、变中有忧，外部环境复杂严峻，经济面临下行压力。这就要求我们必须着眼于长期大势，科学分析当前形势，抽丝剥茧抓住主要矛盾，有针对性地加以解决。</p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;; font-size: 14px; text-indent: 21px; white-space: normal; background-color: rgb(247, 250, 255);\">从长期大势认识当前形势，既要看当前，也要看长远。立足基本国情，始终保持顺应长远发展要求的战略定力。国民经济运行是复杂的系统工程，主要经济指标出现变化，往往牵涉其背后诸多变量的相互作用。其中，既有短期因素的影响，也有长期因素的困扰；既有周期性变化的原因，也有结构性矛盾的制约。</p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;; font-size: 14px; text-indent: 21px; white-space: normal; background-color: rgb(247, 250, 255);\">面对纷繁多变的经济形势，切忌“一叶障目不见泰山”，眉毛胡子一把抓。比如，前些时候，全国规模以上工业增加值和市场销售增速均有所放缓，有人担心中国经济增长是否会出现较大回落。对于这种局部的短期变化，既不可掉以轻心，也不必过度担忧，尤其不能动摇着眼于长远发展的战略定力。这是因为，我国不仅是世界最大、人口最多的发展中国家，还是全球第二大经济体、第一大货物贸易出口国。经济总量大、影响因素多，有些经济指标出现短期波动，是一个大国发展的必然现象。改革开放40年，我国国内生产总值年均实际增长9.5%，远高于同期世界经济2.9%左右的年均增速，但国民经济长期在波浪中前行。这说明，只要确保经济运行处在合理区间，部分指标上下波动，并不会改变我国经济基本面和长期向好的发展趋势。</p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;; font-size: 14px; text-indent: 21px; white-space: normal; background-color: rgb(247, 250, 255);\">从长期大势认识当前形势，既要有善于捕捉重大机遇的全球视野，又要有洞悉矛盾本质的全局眼光。认清我国发展重要战略机遇新内涵，主动出击、积极作为。从国际看，当今世界正面临百年未有之大变局，世界发展呈现各种矛盾相互交织、相互作用的复杂特征。一方面，世界多极化加速推进，不同思想文化相互激荡，世界经济格局发生深刻演变，大国关系面临深入调整；另一方面，经济全球化大势不可逆转，各种文明交流互鉴，国际力量对比继续朝着有利于世界和平与发展的方向演进。我国发展的重要战略机遇期、中华民族伟大复兴的重大机遇，就蕴含在危和机同生并存的变局之中。从国内看，当前经济运行稳中有变，主要是外部环境深刻变化；经济运行变中有忧，主要是供给侧结构性矛盾仍然是制约经济高质量发展的主要障碍。外部环境变化与内部结构性矛盾交织，短期因素与长期因素相互作用，导致经济面临下行压力，是我们通往现代化进程中必然遇到的阻力和无可回避的挑战。说到底，就是我国经济增速换挡、结构调整阵痛的影响依然存在，化解多年来积累的深层次矛盾的任务还十分艰巨。为此，唯有紧扣重要战略机遇新内涵，加快经济结构优化升级，提升科技创新能力，深化改革开放，加快绿色发展，主动参与全球经济治理体系变革，才能化危为机、转危为安，变经济下行压力为加快推进经济高质量发展的动力。</p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;; font-size: 14px; text-indent: 21px; white-space: normal; background-color: rgb(247, 250, 255);\">从长期大势认识当前形势，既要面向未来不断开拓进取，还要直面现实扫清发展障碍。从未来发展大势看，新一轮科技革命和产业变革引发深刻变化，产业链、价值链、供应链不断延伸和拓展，带动了生产要素全球流动。这就要求我们必须深入实施创新驱动发展战略，积极推进现代化经济体系建设。一方面，要更加注重利用技术创新和规模效应，不断提升产业链水平，形成新的竞争优势；另一方面，还要加快建设统一开放、竞争有序的现代市场体系，畅通国民经济循环，提高金融体系服务实体经济能力，形成国内市场和生产主体、经济增长和就业扩大、金融和实体经济的良性循环。从当前面临的突出问题看，我国经济运行主要矛盾仍然是供给侧结构性的。这就要求我们必须坚持以供给侧结构性改革为主线不动摇，不断巩固“三去一降一补”重要成果，加大发展方式转变和结构调整力度，推动更多产能过剩行业及时出清。绝不能纠结于眼前代价、惧怕调整“阵痛”而行动迟缓，更不能给高质量发展遗留障碍。</p><p style=\"color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;; font-size: 14px; text-indent: 21px; white-space: normal; background-color: rgb(247, 250, 255);\">着眼于长期大势认清当前形势和我国长期向好发展前景，既是增强我们做好经济工作的信心源泉，更是激励我们创造性贯彻落实中央决策部署的目标动力。只要我们始终不渝坚持以习近平新时代中国特色社会主义经济思想为指导，顺应发展大势，把握发展规律，不畏艰险、坚定前行，就一定会赢得更大的发展主动权。</p><p><br/></p>','“不谋万世者，不足谋一时；不谋全局者，不足谋一域”。做好新形势下经济工作，必须从长期大势认识当前形势，认清我国长期向好发展前景。这既是我们党在实践中对经济工','2019-01-09 10:40:32',2,0,0,0,4),(19,'美海军部长向特朗普许诺：福特号航母问题将被修复否则可以解雇他','<p style=\"margin-top: 0px; margin-bottom: 32px; padding: 0px; text-indent: 28px; line-height: 32px; text-align: justify; overflow-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; white-space: normal;\">原标题：美海军部长向特朗普许诺：福特号航母问题将被修复否则可以解雇他</p><p style=\"margin-top: 0px; margin-bottom: 32px; padding: 0px; text-indent: 28px; line-height: 32px; text-align: justify; overflow-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; white-space: normal;\"><img src=\"http://e0.ifengimg.com/06/2019/0109/00679764853CEAAECEE4FF4AD6FD7F4B1B7349ED_size174_w960_h480.jpeg\" style=\"vertical-align: bottom; display: block; margin: 0px auto; max-width: 100%; height: auto;\"/></p><p style=\"margin-top: 0px; margin-bottom: 32px; padding: 0px; text-indent: 28px; line-height: 32px; text-align: justify; overflow-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; white-space: normal;\">像大多数一流的战舰一样，福特号航母在其建造和测试过程中遇到了问题，特别是因为它带来了一系列新技术。</p><p style=\"margin-top: 0px; margin-bottom: 32px; padding: 0px; text-indent: 28px; line-height: 32px; text-align: justify; overflow-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; white-space: normal;\">但这艘价值130亿美元的航空母舰引起了特别关注，现在海军部长理查德·斯宾塞正在努力确保一个大问题得到解决。</p><p style=\"margin-top: 0px; margin-bottom: 32px; padding: 0px; text-indent: 28px; line-height: 32px; text-align: justify; overflow-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; white-space: normal;\">福特号航母的新型电磁弹射系统一直是唐纳德特朗普总统特别关注的焦点。他2017年5月表达了对系统和沮丧，因为已经提到几次。<br/></p><p style=\"margin-top: 0px; margin-bottom: 32px; padding: 0px; text-indent: 28px; line-height: 32px; text-align: justify; overflow-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; white-space: normal;\">包括参议院军事委员会主席参议员詹姆斯·因霍夫在内的其他官员反对运营商的使用磁铁电梯提运武器的长期使用问题，这些电梯使用磁铁而不是电缆将弹药提升到驾驶舱。</p><p style=\"margin-top: 0px; margin-bottom: 32px; padding: 0px; text-indent: 28px; line-height: 32px; text-align: justify; overflow-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; white-space: normal;\"><img src=\"http://e0.ifengimg.com/04/2019/0109/88FFE5626F42C03742F3951FB0780D1228A7E572_size69_w750_h563.jpeg\" style=\"vertical-align: bottom; display: block; margin: 0px auto; max-width: 100%; height: auto;\"/></p><p style=\"margin-top: 0px; margin-bottom: 32px; padding: 0px; text-indent: 28px; line-height: 32px; text-align: justify; overflow-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; white-space: normal;\">该航空公司的11部电梯在2017年5月交付时没有安装 - 延迟32个月。但是海军接受并委托了这艘航母，经过一年的海上试验后，于2018年7月了安全后期。</p><p style=\"margin-top: 0px; margin-bottom: 32px; padding: 0px; text-indent: 28px; line-height: 32px; text-align: justify; overflow-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; white-space: normal;\">后安全期的开始被另一个缺陷推迟，并且从8个月延长到一年，以处理正常工作和推迟的工作，例如电梯的安装和升级后的高级战斗机拦阻索，也面临技术问题。</p><p style=\"margin-top: 0px; margin-bottom: 32px; padding: 0px; text-indent: 28px; line-height: 32px; text-align: justify; overflow-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; white-space: normal;\">海军表示，电梯将在今年夏天的安置后期结束时进行安装和测试，6部电梯将在今年夏天完成测试和安全，其他5部将在7月之后完成。</p><p style=\"margin-top: 0px; margin-bottom: 32px; padding: 0px; text-indent: 28px; line-height: 32px; text-align: justify; overflow-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; white-space: normal;\">斯宾塞星期二说，在12月的陆军 - 海军足球比赛的讨论中，他给了特朗普一个高风险的承诺。如果福特号航母的问题不能解决，你可以解雇我。</p><p style=\"margin-top: 0px; margin-bottom: 32px; padding: 0px; text-indent: 28px; line-height: 32px; text-align: justify; overflow-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; white-space: normal;\">“我们将完成它。我知道我会完成它，”他补充说。“我还没有被任何人解雇过;被总统解雇真的不在我的名单之上。”<br/></p><p style=\"margin-top: 0px; margin-bottom: 32px; padding: 0px; text-indent: 28px; line-height: 32px; text-align: justify; overflow-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; white-space: normal;\"><img src=\"http://e0.ifengimg.com/08/2019/0109/E4DDEE257937B426CBE47E655F81C604B8422AD7_size50_w750_h462.jpeg\" style=\"vertical-align: bottom; display: block; margin: 0px auto; max-width: 100%; height: auto;\"/></p><p style=\"margin-top: 0px; margin-bottom: 32px; padding: 0px; text-indent: 28px; line-height: 32px; text-align: justify; overflow-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; white-space: normal;\">在所有先进武器电梯工作之前，我们只有10架可运营的航空母舰，尽管需要12架。”</p><p style=\"margin-top: 0px; margin-bottom: 32px; padding: 0px; text-indent: 28px; line-height: 32px; text-align: justify; overflow-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; white-space: normal;\">福特是同级航母中的第一艘，而下一辆福特级航母，约翰肯尼迪号航空母舰正由弗吉尼亚州纽波特纽斯的亨廷顿伊格纳尔斯建造，CVN80和CVN81将一起建造。</p><p style=\"margin-top: 0px; margin-bottom: 32px; padding: 0px; text-indent: 28px; line-height: 32px; text-align: justify; overflow-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; white-space: normal;\"><img src=\"http://e0.ifengimg.com/01/2019/0109/57894F26FD04AF2E8D724D260C9DEDD4FBD395AC_size104_w750_h499.jpeg\" style=\"vertical-align: bottom; display: block; margin: 0px auto; max-width: 100%; height: auto;\"/></p><p style=\"margin-top: 0px; margin-bottom: 32px; padding: 0px; text-indent: 28px; line-height: 32px; text-align: justify; overflow-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; white-space: normal;\">海军已经表示将在前三艘福特级航母上花费约430亿美元，比单独采购第三艘和第四艘航母会节省40亿美元，整个计划预计耗资580亿美元。</p><p style=\"margin-top: 0px; margin-bottom: 32px; padding: 0px; text-indent: 28px; line-height: 32px; text-align: justify; overflow-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; white-space: normal;\">弗吉尼亚州民主党参议员蒂姆凯恩在向立法者通报了这一决定后说：“这一明智之举将节省纳税人的资金并帮助确保造船厂能够维持熟练的劳动力来完成工作。”</p><p><br/></p>','原标题：美海军部长向特朗普许诺：福特号航母问题将被修复否则可以解雇他像大多数一流的战舰一样，福特号航母在其建造和测试过程中遇到了问题，特别是因为它带来了一系','2019-01-09 10:42:17',2,2,0,0,5),(20,'稳定发挥！阿不都沙拉木首节5投4中砍下11分','<div class=\"artical-importantPic\" style=\"margin: 0px 0px 20px; padding: 0px; text-align: center; color: rgb(26, 41, 57); font-family: &quot;lucida grande&quot;, tahoma, verdana, arial, 宋体, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(252, 253, 253);\"><img src=\"https://c1.hoopchina.com.cn/uploads/star/event/images/190109/6eef9a22821b4cef8dcc51078792ed4b0e485bc4.jpg\" alt=\"稳定发挥！阿不都沙拉木首节5投4中砍下11分\" style=\"vertical-align: top; max-width: 660px;\"/></div><div class=\"artical-main-content\" style=\"margin: 0px; padding: 0px; color: rgb(26, 41, 57); font-family: &quot;lucida grande&quot;, tahoma, verdana, arial, 宋体, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(252, 253, 253);\"><p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px;\">虎扑1月9日讯&nbsp;2018-19赛季CBA常规赛第30轮，新疆坐镇主场迎战广东队，首节比赛结束，新疆22-30广东暂时落后。</p><p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px;\">首节比赛，阿不都沙拉木首发登场，砍下11分1篮板1助攻1抢断，其中两分球2投2中，三分球3投2中。</p><p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px;\"><img alt=\"\" src=\"https://c1.hoopchina.com.cn/uploads/images/20190109/20/016b6724d25f51e0c6196f3b6acf97a4.jpg\" style=\"vertical-align: top; max-width: 660px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px;\">截止至本场比赛以前，阿不都沙拉木共为新疆出战27场比赛，场均出战37分钟，可以贡献18分7.4篮板1.4助攻1盖帽0.8抢断。</p></div><p><br/></p>','虎扑1月9日讯2018-19赛季CBA常规赛第30轮，新疆坐镇主场迎战广东队，首节比赛结束，新疆22-30广东暂时落后。首节比赛，阿不都沙拉木首发登场，砍下','2019-01-09 10:44:07',2,0,0,0,6),(21,'热点丨华为辟谣：与袁隆平公司合作培养水稻系谣言','<div class=\"text-title\" style=\"border: 0px; margin: 0px; padding: 0px; font-size: 12px; position: relative; top: -6px; color: rgb(102, 102, 102); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal;\"><div class=\"article-info\" style=\"border: 0px; margin: 0px; padding: 15px 0px 0px; font-size: 14px; line-height: 20px; color: rgb(153, 153, 153);\"><img src=\"http://5b0988e595225.cdn.sohucs.com/images/20190108/0d13d90a9de9487a98628cf57e041f97.jpeg\" style=\"color: rgb(25, 25, 25); font-size: 16px; margin: 10px auto 0px; padding: 0px; display: block; max-width: 100%; height: auto;\"/></div></div><p><article class=\"article\" id=\"mp-editor\" style=\"border: 0px; margin: 0px; padding: 5px 0px 0px; color: rgb(25, 25, 25); line-height: 1.9; overflow: hidden auto; outline: 0px; tab-size: 4; overflow-wrap: break-word; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal;\"><p style=\"border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">铅笔道1月8日讯，华为今日晚间发布声明称： 从昨天开始网络上出现“华为宣布与袁隆平公司合作培养水稻”等不实消息，此消息不属实，华为没有任何从事水稻种植业务的计划，也没有发布任何与此相关的消息。华为称，当前，传统行业面临数字化转型的机遇与挑战，华为坚持“有所为，有所不为”，聚焦打造ICT领域技术优势，使能客户数字化转型，不会进入不擅长且没有优势的行业。</span></p><p style=\"border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0;\"><img src=\"http://5b0988e595225.cdn.sohucs.com/images/20190108/536b316c352a48ca8fb054c55e2f95b2.png\" style=\"margin: 10px auto 0px; padding: 0px; display: block; max-width: 100%; height: auto;\"/></p><p style=\"border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">昨日，华为轮值董事长胡厚崑透露与中国杂交水稻之父袁隆平合作，培育海水稻，通过土壤数字化，让盐碱地上长出水稻，从15亿亩盐碱地里改造出1亿亩的良田。胡厚崑表示，盐碱地改良的核心技术是“四维改造法”，包括培育新的水稻品种、对植物和土壤进行调节，整套方法的基础是“要素物联网系统”。</span></p><p style=\"border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">据悉，华为与袁隆平双方将共同研发并向客户提供农业物联网系统解决方案，计划今年在国内部署两到三朵“沃土云”，位于青岛城阳的沃土云平台已经基本搭建完成进入试运行状态。</span></p></article></p><p><br/></p>','铅笔道1月8日讯，华为今日晚间发布声明称：从昨天开始网络上出现“华为宣布与袁隆平公司合作培养水稻”等不实消息，此消息不属实，华为没有任何从事水稻种植业务的计','2019-01-09 10:49:18',2,0,0,0,1),(22,'广电：网络游戏审批正式解冻 首批过审不见腾讯','<p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; border: 0px; outline: 0px; font-size: 14px; vertical-align: baseline; color: rgb(85, 85, 85); font-family: Verdana; white-space: normal;\">根据昨日晚间的消息，时隔9个月，国家新闻出版广电总局正式公布了2018年12月份的国产网络游戏审批信息，共计80款游戏，其中包括67款手游、6款端游、6款页游、1款PS4游戏。</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; border: 0px; outline: 0px; font-size: 14px; vertical-align: baseline; color: rgb(85, 85, 85); font-family: Verdana; white-space: normal;\">  同时名单中可以看到巨人旗下一款游戏，四三九九两款游戏，以及三七互娱和中青宝代理的游戏，但没有见到腾讯和网易旗下的游戏。</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; border: 0px; outline: 0px; font-size: 14px; vertical-align: baseline; color: rgb(85, 85, 85); font-family: Verdana; white-space: normal;\">  12月21日，2018中国游戏产业年会召开，中宣部出版局副局长冯士新在会上表示，“首批送审游戏”已经完成审核，正在抓紧核发版号，但申报游戏存量很大，需要时间消化，希望大家保持耐心。</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; border: 0px; outline: 0px; font-size: 14px; vertical-align: baseline; color: rgb(85, 85, 85); font-family: Verdana; white-space: normal;\">  名单如下：</p><center style=\"color: rgb(85, 85, 85); font-family: Verdana; font-size: 14px; white-space: normal;\"><img border=\"1\" alt=\"广电总局：网络游戏审批正式解冻 首批过审不见腾讯\" src=\"http://s2.doyo.cn/img/5c/28/23bc9e9e78a015000375.png_news\" width=\"550\" height=\"3036\" style=\"margin: 0px; padding: 0px; outline: 0px; vertical-align: baseline;\"/></center><p><br/></p>','根据昨日晚间的消息，时隔9个月，国家新闻出版广电总局正式公布了2018年12月份的国产网络游戏审批信息，共计80款游戏，其中包括67款手游、6款端游、6款页','2019-01-09 10:50:51',2,5,0,2,2),(23,'何炅爸爸开餐厅拖欠工资 ？员工拉横幅讨薪','<p class=\"detailPic\" style=\"margin: 0px auto; padding: 0px; text-indent: 28px; line-height: 32px; text-align: center; overflow-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; white-space: normal;\"><img src=\"http://p3.ifengimg.com/2019_02/F8DE8163F809A5BBE1E9E498A119DCE1BDBA21D8_w620_h465.jpg\" alt=\"\" style=\"vertical-align: bottom; display: block; margin: 0px auto; max-width: 100%; height: auto;\"/></p><p class=\"picIntro\" style=\"margin-top: 0px; margin-bottom: 32px; padding: 0px; font-size: 14px; line-height: 32px; text-align: center; overflow-wrap: break-word; word-break: normal; font-family: 楷体_gb2312, 楷体; color: rgb(43, 43, 43); white-space: normal;\">何炅</p><p style=\"margin-top: 0px; margin-bottom: 32px; padding: 0px; text-indent: 28px; line-height: 32px; text-align: justify; overflow-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; white-space: normal;\">1月8日，有网友爆料称何炅爸爸开的餐厅“炅爸爸小海鲜”拖欠员工工资不发，一怒之下员工直接在店门口拉横幅讨薪，讨薪网友晒出讨薪现场的视频，有网友截取了几张图片。</p><p class=\"detailPic\" style=\"margin: 0px auto; padding: 0px; text-indent: 28px; line-height: 32px; text-align: center; overflow-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; white-space: normal;\"><img src=\"http://p2.ifengimg.com/2019_02/413BE874473F4E9E8B5C6B52127795DC1877C2A3_w630_h439.jpg\" alt=\"\" style=\"vertical-align: bottom; display: block; margin: 0px auto; max-width: 100%; height: auto;\"/></p><p class=\"picIntro\" style=\"margin-top: 0px; margin-bottom: 32px; padding: 0px; font-size: 14px; line-height: 32px; text-align: center; overflow-wrap: break-word; word-break: normal; font-family: 楷体_gb2312, 楷体; color: rgb(43, 43, 43); white-space: normal;\">视频截图</p><p style=\"margin-top: 0px; margin-bottom: 32px; padding: 0px; text-indent: 28px; line-height: 32px; text-align: justify; overflow-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; white-space: normal;\">从截图中可以看到，何炅爸爸的餐厅门口被拉上了“黑心老板，还我血汗钱”的横幅。讨薪员工透露自己手中有欠条，有的还有合同，有很多网友得知此事后纷纷向何炅求证此事，并希望何炅赶紧出面解决此事。有媒体试图向何炅方求证，还未得到回应。</p><p class=\"detailPic\" style=\"margin: 0px auto; padding: 0px; text-indent: 28px; line-height: 32px; text-align: center; overflow-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; white-space: normal;\"><img src=\"http://p0.ifengimg.com/2019_02/DE0963719ADC273BE18E3ACEDD67EEC2B3B3102B_w630_h355.jpg\" alt=\"\" style=\"vertical-align: bottom; display: block; margin: 0px auto; max-width: 100%; height: auto;\"/></p><p class=\"picIntro\" style=\"margin-top: 0px; margin-bottom: 32px; padding: 0px; font-size: 14px; line-height: 32px; text-align: center; overflow-wrap: break-word; word-break: normal; font-family: 楷体_gb2312, 楷体; color: rgb(43, 43, 43); white-space: normal;\">网友爆料图</p><p style=\"margin-top: 0px; margin-bottom: 32px; padding: 0px; text-indent: 28px; line-height: 32px; text-align: justify; overflow-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; white-space: normal;\">据悉，这家名为“炅爸爸小海鲜”是何炅爸爸首创的，在简介上面明确指出首创的何畏先生就是何炅之父，店门口的招牌和品牌商品都是何炅爸爸本人的头像。谢娜和快乐家族也经常在网上做宣传，何炅不仅帮爸爸站台，还经常录视频为爸爸的餐厅拉拢人气。</p><p class=\"detailPic\" style=\"margin: 0px auto; padding: 0px; text-indent: 28px; line-height: 32px; text-align: center; overflow-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; white-space: normal;\"><img src=\"http://p3.ifengimg.com/2019_02/8C56B5F773F967A35C84C20F04F942227C95B840_w630_h593.jpg\" alt=\"\" style=\"vertical-align: bottom; display: block; margin: 0px auto; max-width: 100%; height: auto;\"/></p><p class=\"picIntro\" style=\"margin-top: 0px; margin-bottom: 32px; padding: 0px; font-size: 14px; line-height: 32px; text-align: center; overflow-wrap: break-word; word-break: normal; font-family: 楷体_gb2312, 楷体; color: rgb(43, 43, 43); white-space: normal;\">谢娜为该店做宣传</p><p style=\"margin-top: 0px; margin-bottom: 32px; padding: 0px; text-indent: 28px; line-height: 32px; text-align: justify; overflow-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; white-space: normal;\">网友得知此事后也是纷纷提出自己观点，有的网友说应先了解真相，再下结论：“不要妄下定论，这个是肯定事出有因，应该与何老师本人无关，先听听本人怎么说吧！”也有网友表示气愤，觉得拖欠工资就是不应该：“不管是谁，拖欠别人的血汗钱就是不对。赶紧把钱给了才是正理。”</p>','何炅1月8日，有网友爆料称何炅爸爸开的餐厅“炅爸爸小海鲜”拖欠员工工资不发，一怒之下员工直接在店门口拉横幅讨薪，讨薪网友晒出讨薪现场的视频，有网友截取了几张','2019-01-09 10:53:05',1,0,0,0,3),(24,'路威&哈雷尔各砍20+10 快船大胜黄蜂三连胜','<p align=\"center\" style=\"margin-top: 0px; margin-bottom: 29px; padding: 0px; list-style: none; border: none; line-height: 28px; color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;, Arial, 寰蒋闆呴粦, SimSun, 瀹嬩綋; white-space: normal;\"><img src=\"http://img1.gtimg.com/chinanba/pics/hv1/97/160/2302/149728447.jpg\" style=\"border-width: initial; border-style: none; vertical-align: bottom; margin: 0px; padding: 0px; list-style: none; max-width: 870px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 29px; padding: 0px; list-style: none; border: none; line-height: 28px; color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;, Arial, 寰蒋闆呴粦, SimSun, 瀹嬩綋; white-space: normal; text-indent: 2em;\">北京时间1月9日，NBA常规赛继续进行，快船主场128-109大胜黄蜂，取得三连胜。路-威廉姆斯27分10助攻，哈雷尔23分11篮板5助攻，加里纳利20分5篮板4助攻，托拜厄斯-哈里斯23分6篮板；黄蜂队杰里米-兰姆16分6篮板，马文-威廉姆斯14分7篮板，肯巴-沃克13分4篮板5助攻（末节没有得分），替补托尼-帕克12分，马利克-蒙克24分。</p><p style=\"margin-top: 0px; margin-bottom: 29px; padding: 0px; list-style: none; border: none; line-height: 28px; color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;, Arial, 寰蒋闆呴粦, SimSun, 瀹嬩綋; white-space: normal; text-indent: 2em;\"><a target=\"_blank\" href=\"https://china.nba.com/boxscore/#!/0021800606\" _fcksavedurl=\"https://china.nba.com/boxscore/#!/0021800606\" style=\"color: rgb(20, 23, 26); outline: 0px; border-bottom: 1px dotted rgb(83, 109, 166);\">技术统计</a>&nbsp;<a target=\"_blank\" href=\"https://nbachina.qq.com/a/20190109/006997.htm#p=1\" _fcksavedurl=\"https://nbachina.qq.com/a/20190109/006997.htm#p=1\" style=\"color: rgb(20, 23, 26); outline: 0px; border-bottom: 1px dotted rgb(83, 109, 166);\">比赛图集</a></p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; list-style: none; border: none; line-height: 28px; color: rgb(0, 0, 0); white-space: normal; text-indent: 2em; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif;\"><span style=\"font-weight: 700; margin: 0px; padding: 0px;\">比赛回顾</span></p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; list-style: none; border: none; line-height: 28px; color: rgb(0, 0, 0); white-space: normal; text-indent: 2em; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif;\">首节还剩10分26秒时，接到加里纳利的传球，哈里斯三分远投得手。还剩4分27秒时，加里纳利在埃尔南戈麦斯投篮时犯规，送给黄蜂1次罚球机会。还剩1分36秒时，贝弗利出现传球失误，被葛拉罕抢断。快船对篮板发起疯狂进攻，本节共抢下17个篮板，包括4个前场篮板，其中戈塔特一人就贡献4个篮板球。快船打出流畅配合，此节全队共完成8次助攻，其中加里纳利一人就为队友送出2次传球。快船在防守端筑起铜墙铁壁，此节送4记盖帽，将对手的投篮命中率压制到35.71%。首节战罢，本节比分定格为33-24，快船暂时领先。</p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; list-style: none; border: none; line-height: 28px; color: rgb(0, 0, 0); white-space: normal; text-indent: 2em; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif;\">次节回来还剩5分9秒时，布里奇斯助攻，麦基吉三分远投命中。还剩25秒时，埃尔南戈麦斯出现传球失误，被哈雷尔抢断。还剩25秒时，马文-威廉姆斯在哈雷尔投篮时犯规，送给快船2次罚球机会。黄蜂内线优势巨大，本节共抢下16个篮板，包括4个前场篮板，其中兰姆一人就贡献3个篮板球，凭借篮下优势将差距缩小为5分。快船打出流畅配合，此节全队共完成8次助攻，其中路威一人就为队友送出4次传球。半场结束，本节比分定格为62-57，快船暂时领先。</p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; list-style: none; border: none; line-height: 28px; color: rgb(0, 0, 0); white-space: normal; text-indent: 2em; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif;\">进入第三节还剩4分59秒时，埃尔南戈麦斯送精妙传球，马文-威廉姆斯三分远投命中。还剩1分22秒时，贝弗利出现传球失误，被巴图姆抢断。还剩1分2秒时，葛拉罕在路威投篮时犯规，送给快船2次罚球机会。三节打完，黄蜂以77-86落后。</p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; list-style: none; border: none; line-height: 28px; color: rgb(0, 0, 0); white-space: normal; text-indent: 2em; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif;\">第四节还剩11分12秒时，帕克送精妙传球，马利克-莫克三分远投命中。还剩8分36秒时，哈雷尔在帕克投篮时犯规，送给黄蜂2次罚球机会。还剩42秒时，布里奇斯手滑丢球，被夏-吉尔杰斯-亚历山大抢断。快船三分如雨，全队本节投10粒三分球，命中率60.00%。黄蜂多次冲击篮筐，获得19次罚球机会，罚中16球，罚球命中率达到84.21%。快船此节手感颇佳，全队投篮命中率达到64.00%，与黄蜂的40.00%相比更胜一筹，其中路威仅此节得到14分。比赛结束，快船以128-109战胜黄蜂，取得本场比赛的胜利。</p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; list-style: none; border: none; line-height: 28px; color: rgb(0, 0, 0); white-space: normal; text-indent: 2em; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif;\"><span style=\"font-weight: 700; margin: 0px; padding: 0px;\">双方首发阵容</span></p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; list-style: none; border: none; line-height: 28px; color: rgb(0, 0, 0); white-space: normal; text-indent: 2em; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif;\">黄蜂：兰姆、马文-威廉姆斯、沃克、巴图姆、比永博</p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; list-style: none; border: none; line-height: 28px; color: rgb(0, 0, 0); white-space: normal; text-indent: 2em; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif;\">快船：哈里斯、加里纳利、布拉德利、夏-吉尔杰斯-亚历山大、戈塔特</p>','北京时间1月9日，NBA常规赛继续进行，快船主场128-109大胜黄蜂，取得三连胜。路-威廉姆斯27分10助攻，哈雷尔23分11篮板5助攻，加里纳利20分5','2019-01-09 10:54:36',1,4,0,0,6);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `news_detail`
--

DROP TABLE IF EXISTS `news_detail`;
/*!50001 DROP VIEW IF EXISTS `news_detail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `news_detail` AS SELECT 
 1 AS `news_id`,
 1 AS `title`,
 1 AS `content`,
 1 AS `author_id`,
 1 AS `author`,
 1 AS `pv`,
 1 AS `comment_number`,
 1 AS `create_time`,
 1 AS `category_name`,
 1 AS `category_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `news_tag`
--

DROP TABLE IF EXISTS `news_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_tag` (
  `news_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_tag`
--

LOCK TABLES `news_tag` WRITE;
/*!40000 ALTER TABLE `news_tag` DISABLE KEYS */;
INSERT INTO `news_tag` VALUES (9,5),(10,6),(11,7),(11,8),(12,9),(13,10),(14,11),(14,12),(15,13),(15,14),(16,15),(17,16),(17,17),(18,18),(19,19),(19,20),(20,21),(21,22),(21,23),(22,24),(22,25),(23,26),(23,27),(24,28);
/*!40000 ALTER TABLE `news_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `search_news`
--

DROP TABLE IF EXISTS `search_news`;
/*!50001 DROP VIEW IF EXISTS `search_news`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `search_news` AS SELECT 
 1 AS `news_id`,
 1 AS `title`,
 1 AS `comment_number`,
 1 AS `create_time`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `subscribe`
--

DROP TABLE IF EXISTS `subscribe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscribe` (
  `user_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`author_id`),
  KEY `fk_subscribe_2_idx` (`author_id`),
  CONSTRAINT `fk_subscribe_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_subscribe_2` FOREIGN KEY (`author_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribe`
--

LOCK TABLES `subscribe` WRITE;
/*!40000 ALTER TABLE `subscribe` DISABLE KEYS */;
INSERT INTO `subscribe` VALUES (2,1),(1,2);
/*!40000 ALTER TABLE `subscribe` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger increase_subscribe_number
  after insert on subscribe
  for each row
  update user
  set subscribe_number = subscribe_number + 1
  where user_id = new.author_id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger decrease_subscribe_number
  after delete on subscribe
  for each row 
  update user
  set subscribe_number = subscribe_number - 1
  where user_id = OLD.author_id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(45) NOT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (4,'111'),(5,'伊能静'),(6,'廉政风云'),(7,'足球'),(8,'国足'),(9,'以考代罚'),(10,'王者'),(11,'无人机'),(12,'中国'),(13,'银行'),(14,'准备金率'),(15,'哈哈'),(16,'十九大'),(17,'反腐'),(18,'经济'),(19,'美国'),(20,'航母'),(21,'篮球'),(22,'华为'),(23,'袁隆平'),(24,'广电'),(25,'腾讯'),(26,'何炅'),(27,'讨薪'),(28,'NBA');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` varchar(32) NOT NULL COMMENT '昵称',
  `username` varchar(32) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL,
  `image_path` varchar(255) NOT NULL COMMENT '头像路径',
  `brief_introduction` varchar(255) DEFAULT NULL COMMENT '简介',
  `subscribe_number` smallint(6) NOT NULL DEFAULT '0' COMMENT '订阅数',
  `create_time` date NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'郑俊铭','3116005120','a89086c0a5103178ffee44592166dc3d','/image/user/62a5f5ce3bb44bf28626714a65b5602b.jpg','这个人傻的',1,'2019-01-04'),(2,'周黑长','13143371031','a89086c0a5103178ffee44592166dc3d','/image/user/62a5f5ce3bb44bf28626714a65b5602b.jpg',NULL,1,'2019-01-04');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `collection_news`
--

/*!50001 DROP VIEW IF EXISTS `collection_news`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `collection_news` AS select `n`.`news_id` AS `news_id`,`n`.`title` AS `title`,`n`.`summary` AS `summary`,`u2`.`nickname` AS `author`,`n`.`create_time` AS `create_time`,`u`.`user_id` AS `user_id` from (((`collection` `c` left join `user` `u` on((`c`.`user_id` = `u`.`user_id`))) left join `news` `n` on((`c`.`news_id` = `n`.`news_id`))) left join `user` `u2` on((`u2`.`user_id` = `n`.`user_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `index_news`
--

/*!50001 DROP VIEW IF EXISTS `index_news`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `index_news` AS select `news`.`news_id` AS `news_id`,`news`.`title` AS `title`,`news`.`summary` AS `summary`,`user`.`nickname` AS `author`,`news`.`comment_number` AS `comment_number`,`news`.`create_time` AS `create_time`,`news`.`pv` AS `pv`,`news`.`category_id` AS `category_id` from (`news` join `user`) where (`news`.`user_id` = `user`.`user_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `news_detail`
--

/*!50001 DROP VIEW IF EXISTS `news_detail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `news_detail` AS select `news`.`news_id` AS `news_id`,`news`.`title` AS `title`,`news`.`content` AS `content`,`user`.`user_id` AS `author_id`,`user`.`nickname` AS `author`,`news`.`pv` AS `pv`,`news`.`comment_number` AS `comment_number`,`news`.`create_time` AS `create_time`,`category`.`news_category_name` AS `category_name`,`category`.`category_id` AS `category_id` from ((`news` join `user`) join `category`) where ((`news`.`user_id` = `user`.`user_id`) and (`news`.`category_id` = `category`.`category_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `search_news`
--

/*!50001 DROP VIEW IF EXISTS `search_news`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `search_news` AS select `news`.`news_id` AS `news_id`,`news`.`title` AS `title`,`news`.`comment_number` AS `comment_number`,`news`.`create_time` AS `create_time` from (`news` join `user`) where (`news`.`user_id` = `user`.`user_id`) */;
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
