-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: news
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
INSERT INTO `category` VALUES (1,'科技'),(2,'游戏'),(3,'娱乐'),(4,'财经'),(5,'军事'),(6,'体育'),(7,'健康');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection`
--

DROP TABLE IF EXISTS `collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection` (
  `collection_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`collection_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection`
--

LOCK TABLES `collection` WRITE;
/*!40000 ALTER TABLE `collection` DISABLE KEYS */;
INSERT INTO `collection` VALUES (2,14,1),(3,10,1);
/*!40000 ALTER TABLE `collection` ENABLE KEYS */;
UNLOCK TABLES;

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
 1 AS `comment_number`,
 1 AS `create_time`,
 1 AS `pv`,
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'很厉害','2019-01-05 07:20:05',1,14),(2,'不错不错','2019-01-05 08:20:05',2,14),(3,'1111','2019-01-05 06:52:20',1,12),(4,'1111','2019-01-05 06:53:50',1,12),(5,'hahhah','2019-01-05 06:56:48',1,9),(6,'aaaakjhk','2019-01-05 06:57:19',1,9),(7,'aa','2019-01-05 06:58:32',1,9),(8,'aaa','2019-01-05 06:59:17',1,9),(9,'wewe','2019-01-05 07:00:43',1,9),(10,'wewe','2019-01-05 07:00:46',1,9),(11,'wewe','2019-01-05 07:00:47',1,9),(12,'wewe','2019-01-05 07:00:47',1,9),(13,'wewe','2019-01-05 07:00:47',1,9),(14,'wewe','2019-01-05 07:00:47',1,9),(15,'aaaa','2019-01-05 07:01:45',1,9),(16,'aaaa','2019-01-05 07:02:19',1,9),(17,'aaaa','2019-01-05 07:02:24',1,9),(18,'厉害了','2019-01-05 07:16:07',1,13);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (9,'伊能静谈与庾澄庆婚变 缺少安全感给对方造成压力','<p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\">新浪娱乐讯 近日，在伊能静某节目中谈与庾澄庆婚变，直言自己因缺少安全感而给对方造成太大的压力。</p><p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\">　　节目中，伊能静谈到自己的两段婚姻，直言自己经历第一段与庾澄庆的婚姻时，还沉浸在原生家庭带给自己的伤痛之中，“在还没有成熟的年龄出来工作”，对感情很恐惧，“遇到一个可靠的人的时候，我像抓了一个浮木，我希望他把我所有原生家庭的痛苦通通解决掉”，因此带给对方太多的压力，“他是找老婆的，干嘛给你治病啊？”因此，在认识先生秦昊之前，她花费了五年时间来调整自己，才有了现在的良好状态。</p>','新浪娱乐讯近日，在伊能静某节目中谈与庾澄庆婚变，直言自己因缺少安全感而给对方造成太大的压力。　　节目中，伊能静谈到自己的两段婚姻，直言自己经历第一段与庾澄庆','2019-01-05 02:20:05',1,42,0,13,3),(10,'《廉政风云》发布“金三角”特辑','<p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\">电影《廉政风云》近日发布了“金三角”特辑。</p><p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/200/w600h400/20190105/Jliz-hrfcctm4972864.jpg\" style=\"border-style: none; max-width: 500px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\"></p><p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;刘青云、张家辉与林嘉欣在戏里戏外的关系都有些复杂。电影里，三人诠释了一段非一般意义上的“三角关系”。刘青云饰演的陈敬慈与林嘉欣饰演江雪儿同在廉政公署工作，因为彼此间“秘密”太多，最终走到了将要离婚的边缘。此时，陈敬慈接办重大案件，张家辉饰演的许植尧是案件重要证人，却在上庭前忽然逃跑。江雪儿作为廉政公署的谈判专家，奉命飞往澳洲劝许植尧回来协助调查。</p><p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/200/w600h400/20190105/hBza-hrfcctm4972932.jpg\" style=\"border-style: none; max-width: 500px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;而在戏外，林嘉欣参与过张家辉导演的《驱魔人》，张家辉与刘青云合作过《扫毒》，刘青云与林嘉欣相识很多年，但三个人之间的合作，是第一次。林嘉欣坦言：“跟戏好的演员一起演戏，真的很好玩。”对于刘青云和张家辉谁合作更愉快的问题，林嘉欣说没有比较：“演技交流的话，两个人都非常过瘾。”</p><p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;而刘青云然对老友张家辉在片中的拼命给予了肯定。特辑中，可以看到张家辉有一场寒冬中的泳池戏，张家辉亲身下水出演，上来后冻得满脸通红瑟瑟发抖，却毫无怨言。对此，身为老友的刘青云大加赞赏：“他（张家辉）是一个很喜欢接受挑战的人。”</p><p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/200/w600h400/20190105/Be0m-hrfcctm4972995.jpg\" style=\"border-style: none; max-width: 500px;\"/></p><div style=\"color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\"></div><p><br/></p>','电影《廉政风云》近日发布了“金三角”特辑。刘青云、张家辉与林嘉欣在戏里戏外的关系都有些复杂。电影里，三人诠释了一段非一般意义上的“三角关系”。刘青云饰演的陈','2019-01-05 02:21:08',1,6,1,0,3),(12,'20万商家迎新年首份“福利”：部分非刻意违规可“以考代罚”','<p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; text-indent: 36px; width: 843px; white-space: normal;\">元旦刚过，京东平台超过20万商家就收到一份“福利”： 1月2日京东正式上线“以考代罚”功能，对商家部分非刻意导致的违规行为视情形给予考试机会，并对通过考试的商家抵消相应的扣分处罚。此举旨在打造更加积极健康的平台生态，让商家更快更好地了解和遵守平台规则，从而为消费者提供更优质的商品和服务。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; width: 843px; white-space: normal; text-align: center;\"><img src=\"https://upload.qudong.com/2019/0103/1546503570265.png\" border=\"0\" alt=\"微信图片_20190103161925\" style=\"margin: 0px 0px 20px; padding: 0px; list-style: none; font-size: 14px; color: rgb(102, 102, 102); outline: none; border-width: initial; border-style: none; overflow: hidden; max-width: 100%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; text-indent: 36px; width: 843px; white-space: normal;\"><strong style=\"margin: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); line-height: 34px;\">重学轻罚，助力商家可持续发展</strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; text-indent: 36px; width: 843px; white-space: normal;\">经过十几年的发展，电商平台的运营管理越来越规范。为了充分维护消费者的权益，同时让商家放心开店、省心赚钱，京东平台先后出台了上百项经营规则，违反规则的商家会受到严格的处罚。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; text-indent: 36px; width: 843px; white-space: normal;\">不过京东调研发现，不少商家的违规行为是忽略了对平台规则的学习，导致误操作或其他客观因素造成的，并非是刻意通过不当行为牟利。怎么帮助这部分商家尽快成长，而不是“一罚了之”？京东推出了“以考代罚”。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; width: 843px; white-space: normal; text-align: center;\"><img src=\"https://upload.qudong.com/2019/0103/1546503894130.jpg\" border=\"0\" alt=\"微信图片_20190103162443\" style=\"margin: 0px 0px 20px; padding: 0px; list-style: none; font-size: 14px; color: rgb(102, 102, 102); outline: none; border-width: initial; border-style: none; overflow: hidden; max-width: 100%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; text-indent: 36px; width: 843px; white-space: normal;\">“以考代罚”推出后，不少商家在卖家论坛里留言表示欢迎。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; text-indent: 36px; width: 843px; white-space: normal;\">“对商家违规行为的扣分和处理从来都不是京东平台治理的目的，”京东商城平台生态部规则管理＆商家提升总经理王博表示，“推出‘以考代罚’就是用人性化的方式将处罚与培训相结合，让商家更重视、更熟悉平台规则，帮助他们为消费者带来更好的购物体验，也推动他们在京东平台的可持续发展。“</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; text-indent: 36px; width: 843px; white-space: normal;\">哪些商家有机会“以考代罚”？商家要获取这一资格，需要先通过“店铺基础运营认证”：掌握入驻、仓配客售、广告投放、内容营销等一系列基础运营知识，完成认证考试。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; text-indent: 36px; width: 843px; white-space: normal;\">哪些违规行为可以“以考代罚”？京东近期发布了《以考代罚细则》新增公告，明确了纳入“以考代罚”的6大类型14种非刻意、非严重违规场景，包括滥发信息、描述不符、咚咚或400电话使用违规等。商家在一年中首次违反这些规定时，将不再只有申诉和接受处理这两个选项，还可参与“以考代罚”来抵消相应的扣分。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; text-indent: 36px; width: 843px; white-space: normal;\">“以考代罚”考什么？考试根据《京东开放平台商家积分管理规则》内容出具，考试若不合格，也可通过查看错题解析对平台规则“知其所以然”。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; text-indent: 36px; width: 843px; white-space: normal;\">截至目前，已有近10位商家参加了“以考代罚”考试。一位生鲜品类商家通过考试后说，考试确实能更加了解平台规则，让自己清楚到底哪儿做错了，也给了自己一次机会，对店铺良性运营很有帮助。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; width: 843px; white-space: normal; text-align: center;\"><img src=\"https://upload.qudong.com/2019/0103/1546503918582.jpg\" border=\"0\" alt=\"微信图片_20190103162432\" style=\"margin: 0px 0px 20px; padding: 0px; list-style: none; font-size: 14px; color: rgb(102, 102, 102); outline: none; border-width: initial; border-style: none; overflow: hidden; max-width: 100%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; text-indent: 36px; width: 843px; white-space: normal;\">商家满足“以考代罚”条件后，即可在商家后台—奖惩管理—违规管理看到入口</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; text-indent: 36px; width: 843px; white-space: normal;\"><strong style=\"margin: 0px; padding: 0px; list-style: none; color: rgb(102, 102, 102); line-height: 34px;\">以考代罚绝不是“只考不罚”</strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; text-indent: 36px; width: 843px; white-space: normal;\">可能有人会问：商家“以考代罚”是不是意味着不用受到严格的处罚？这相当于开了大胆违规的口子，商家的品质和服务、消费者的权益怎么保证？而且这对认真遵守规则的商家是不是不公平？</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; text-indent: 36px; width: 843px; white-space: normal;\">您大可放心。首先，“以考代罚”并不是不再对商家进行处罚，通过考试的商家可以抵消的仅仅是违规行为带来的扣分处理，其商品下架、删除、店铺降权等措施依然会执行。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; text-indent: 36px; width: 843px; white-space: normal;\">其次，“以考代罚”除了需要“店铺基础运营认证”，还有次数限制。虽然商家在违约单开具到申诉结果/违约单确认前对一项违规行为可多次重考，直至通过，但每一项违规行为在一年中只有一次“以考代罚”的机会，第二次违规就得认罚了。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; text-indent: 36px; width: 843px; white-space: normal;\">最后，绝不是所有违规行为都能获得“特赦”，发布非约定商品、虚假交易等严重违规行为均不能以考代罚。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; width: 843px; white-space: normal; text-align: center;\"><img src=\"https://upload.qudong.com/2019/0103/1546503940708.png\" border=\"0\" alt=\"微信图片_20190103162438\" style=\"margin: 0px 0px 20px; padding: 0px; list-style: none; font-size: 14px; color: rgb(102, 102, 102); outline: none; border-width: initial; border-style: none; overflow: hidden; max-width: 100%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; text-indent: 36px; width: 843px; white-space: normal;\">商家收到“罚单“后，申诉和考试可以同时进行。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; list-style: none; font-size: 17px; font-family: &quot;Microsoft YaHei&quot;; line-height: 34px; text-indent: 36px; width: 843px; white-space: normal;\">王博介绍，以“以考代罚”为标志的柔性治理避免了教条式、刻板化地执行规则，有利于打造更加包容公平、更有温度的平台生态，是京东综合治理计划迈出的第一步。未来，京东开放平台还将上线自动化预警、自动化诊断、商家帮扶计划等更多功能，推动平台综合治理的全面发展，让商家享受更好的开店体验，也让消费者获得更好的保障。</p><p><br/></p>','元旦刚过，京东平台超过20万商家就收到一份“福利”：1月2日京东正式上线“以考代罚”功能，对商家部分非刻意导致的违规行为视情形给予考试机会，并对通过考试的商','2019-01-05 02:26:47',1,10,0,2,1),(13,'荣耀周报：最强中路英雄，居然免费送？一级就能飞全图，有蓝还能1打5？','<p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">新的一年终于到了，请收下小弟迟到的新年快乐。不过新的一年肯定大家都有不一样的面貌，王者荣耀也不例外。话不多说，一起跟随小弟来看看新的一年王者荣耀发生的那些大事吧！</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/67/w440h427/20190105/iK4a-hrfcctm4773091.jpg\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">新英雄嫦娥上线 颜值高还非常暴力</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">伴随着这次的新版本上线体验服的同时，新英雄“嫦娥”也是进入了大家的视野。根据官方透露，背景故事为嫦娥作为魔道家族的公主，在一些魔道与神界的矛盾中迷失自我，无法理解于是隔绝了自己。同时官方也透露嫦娥的官方CP就是后羿！下面一起来看看嫦娥的技能介绍：</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">登场画面：</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/480/w250h230/20190105/fkgT-hrfcctm4773149.gif\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">技能介绍：</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">被动——月盈</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">嫦娥受到月光的守护，以自身法力值产生的护盾抵挡伤害；嫦娥的法力值越高造成的伤害越高，法术强度会提升嫦娥的最大法力值。</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/631/w365h266/20190105/pcet-hrfcctm4773209.gif\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">一技能——月辰</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">嫦娥向指定方向释放能量，对命中的第一个目标造成定身效果并标记；嫦娥的普攻与技能伤害能够引爆标记，对范围内的敌人造成法术伤害和减速效果。</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">被动：嫦娥的普通攻击变为法术伤害，每过5秒的第一次普攻射程提升。</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/2/w450h352/20190105/4_g7-hrfcctm4773343.gif\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">二技能——月璇</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">短暂的施法后，嫦娥在身边和指定位置召唤法力旋涡，吸取范围内敌人法力值并造成法术伤害，法力值不足的敌人将会受到额外的法术伤害。</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/622/w345h277/20190105/jSV4-hrfcctm4773426.gif\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">三技能——月芒</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">嫦娥解放狂暴的魔道力量，疯狂倾泻自身的法力值并随机向周围发射法力弹幕，对命中的敌人造成法术伤害</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/35/w500h335/20190105/_Ag1-hrfcctm4773506.gif\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">回城技能——归月、奔月</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">嫦娥点击回城后吟唱七秒后将嫦娥传送回己方基地；在之后的十秒内，嫦娥可以再次使用技能，飞回原来的位置</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/629/w237h392/20190105/F-rO-hrfcctm4773564.gif\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/586/w197h389/20190105/hxum-hrfcctm4773636.gif\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">小弟在这里就给大家斗胆来评价一下嫦娥了，可以看得出来蓝量对于嫦娥来说非常的珍贵，不仅可以生成护盾还能增加伤害。官方还特地给嫦娥配置了所未有吸蓝的机制，同时被动的10S内传送回也是推进体系中的核心。缺少团战切入和控制有些遗憾，但瑕不掩瑜，可见嫦娥技能之强大！</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/743/w355h388/20190105/DNCo-hrfcctm4773765.jpg\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">最大的重点来了！嫦娥，免费送！只为庆祝嫦娥四号成功登月！还和人民日报合作，太有排面了！看来为了年终奖，天美的策划也是拼了啊！</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/751/w432h319/20190105/kK30-hrfcctm4773806.jpg\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">新玩法日之塔上线 吕布也出霸气特效</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">这次新出来的日之塔其实就是一个多人组队通关的玩法。整个玩法包含两大关，每关都有简单、普通和困难三个难度，而且没关都有非常多的挑战和互动元素在里面。玩家胜利的目标就是组队击杀每关的BOSS，玩法中玩家可以解锁新的天赋和装备并有特殊的效果和技能。</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/107/w540h367/20190105/szZJ-hrfcctm4773848.png\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">同时在1月2日的更新中吕布的霸气特效“天下无双”专属特效礼包也上线，玩家购买有几率获得吕布的专属回城和击败特效，在小弟眼中这两个特效可以说非常的威武霸气了！</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/792/w540h252/20190105/h8uh-hrfcctm4773872.jpg\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/787/w455h332/20190105/s9uU-hrfcctm4773897.jpg\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">“王者出征”版本更新 多个功能升级</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">就在这次的“王者出征”新版本中，官方对于各方面的功能、画面、系统机制等都有着一定的改变，下面小弟将详细给大家透露一下体验服中的更新情况：</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">1、美术升级</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">这次官方在美术方面的升级可谓多个方面多个角度，大厅界面改版、峡谷地图改版、怪物模型改版、再加上画质突飞猛进的峡谷内高清地图等等都让整个游戏看起来逼真感觉十足。</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/600/w300h300/20190105/wzDF-hrfcctm4774151.gif\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/621/w342h279/20190105/1efW-hrfcctm4774196.gif\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">而游戏中的英雄模型以及皮肤的质感和精细程度也进行了一定的革新，并且在英雄的展示页面加上了背景故事中的区域画面。</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/17/w540h277/20190105/_pqn-hrfcctm4774214.jpg\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/789/w540h249/20190105/cpJJ-hrfcctm4774335.jpg\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">2.峡谷内机制调整</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">这里就包括小弟上周报道的关于兵线组成和属性调整、防御塔调整、野怪调整，还有地形方面的改动等等。</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/709/w534h175/20190105/N0GD-hrfcctm4774356.png\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">3.装备和英雄调整</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">在这次的新版本中，多数装备都有被调整，其中改动比较大的莫过于打野装备的BUFF叠加效果的下降以及辅助装备的技能改动。</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/775/w540h235/20190105/_vUS-hrfcctm4774400.jpg\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">在英雄调整方面，射手的射程范围进行了一定调整，而且在正式服中的英雄调整也和小弟前几次介绍的关于英雄调整别无二致，这里就不再赘述了。</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/15/w540h275/20190105/TxLR-hrfcctm4774436.jpg\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">体验服两次更新 三名英雄调整</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">在去年的12月29日以及今年的1月1日，体验服两次更新中共有三名英雄被调整。其中被加强的英雄有百里守约和明世隐，被削弱的则是新英雄嫦娥了。</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">在加强的英雄中，百里守约的射程从800提升至850，明世隐的一技能中增加了基础攻速以及等级加成。</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/676/w488h188/20190105/bWn8-hrfcctm4774459.png\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">而嫦娥在这两次更新中都上榜了，首先是被动的法术攻击增加的法力值和抵挡伤害值都下降，而且法力值抵挡伤害比例也从80%降低到60%。再有就是大招月芒伤害值两次更新都降低，但是耗蓝量下降。</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/10/w489h321/20190105/35se-hrfcctm4774486.png\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">那么看到这里本周的荣耀周报就要和大家说再见了。</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\">最后一个正惊问题：嫦娥出来后你觉得吴刚会出现吗？</p><p style=\"margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><img src=\"http://n.sinaimg.cn/translate/795/w454h341/20190105/2ZpZ-hrfcctm4774558.jpg\" style=\"display: block; margin: 0px auto; max-width: 500px;\"/></p><div class=\"mianze\" style=\"margin: 0px; padding: 0px; color: rgb(71, 71, 71); font-family: &quot;Microsoft Yahei&quot;, Simsun; white-space: normal;\"><strong>新浪声明：新浪网登载此文出于传递更多信息之目的，并不意味着赞同其观点或证实其描述。</strong></div><p><br/></p>','新的一年终于到了，请收下小弟迟到的新年快乐。不过新的一年肯定大家都有不一样的面貌，王者荣耀也不例外。话不多说，一起跟随小弟来看看新的一年王者荣耀发生的那些大','2019-01-05 02:28:07',1,11,0,1,2),(14,'中国第5种隐身飞机首飞 隐身比歼20强可飞敌纵深内部','<p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal;\">近日，网上某新闻媒体披露了航天科工集团飞航导弹研究院下属的海鹰无人机公司最新研发的“天鹰”无人机起降试飞视频。这也是我国首个公开试飞视频的飞翼无人机，也标志着我国第五种隐身飞机首飞获得成功，在此之前歼20、歼31、利剑和某型 无人机首飞均获得成功。本文根据2018年珠海航展上公开展出的“天鹰”无人机实物相关资料，以及试飞视频，对其性能做一简要分析。从体积和外形上看，“天鹰”无人机和航空工业沈阳飞机设计研究所研制的“利剑”无人机有着很大的区别。“利剑”无人机最大起飞重量达15吨，已属于大型战略无人机的范畴，其内置弹舱可载弹1.5-2吨，而“天鹰”无人机在珠海航展上公布的数据为：最大起飞重量达3吨级，仍然属于战术无人机的范畴，其内置弹舱载弹一般认为不会超过500公斤，主要用于高威胁前线战场环境下对重要目标实施渗透、攻击或抵近执行战役战术侦察任务。</p><div class=\"img_wrapper\" style=\"margin: 0px; padding: 0px; text-align: center; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal;\"><img src=\"http://n.sinaimg.cn/mil/crawl/129/w550h379/20190104/RJMJ-hqzxptp3733810.jpg\" alt=\"\" style=\"margin: 0px auto; padding: 0px; border-style: none; vertical-align: top; max-width: 640px; display: block;\"/><span class=\"img_descr\" style=\"margin: 5px auto; padding: 6px 0px; line-height: 20px; font-size: 16px; display: inline-block; zoom: 1; text-align: left; font-weight: 700;\"></span></div><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal;\">　　“利剑”无人机在研制之初就考虑到海军航空母舰的需要，以后很有可能上舰，因此采用了翼展较小的小展弦飞翼气动布局，其优点是飞行速度较高，虽不能超音速飞行，但最大飞速速度也已接近音速；而“天鹰”无人机采用了机翼翼展较长的大展弦比飞翼气动布局，其翼展达14-15米左右，几乎和利剑无人机的翼展不相上下。大展弦比飞翼气动布局阻力较大，最大飞行速度也较低，一般为0.6-0.8倍音速左右，但由于升力系数较高，却有着极其优异的航程，与其气动布局，大小尺寸相近的美国洛克希德·马丁公司的RQ-170“哨兵”飞翼无人机最大航程就可达4000至6000公里。航空发动机动力是“天鹰”无人机最不用担心的，由于航天科工集团飞航导弹研究院下属的飞航动力研究所具有完整的小型涡喷，涡扇，冲压及组合发动机研制生产能力，并已自行研制成功推力1000公斤级别的涡扇发动机，正好适配其自行研制的“天鹰”无人机。</p><div class=\"img_wrapper\" style=\"margin: 0px; padding: 0px; text-align: center; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal;\"><img src=\"http://n.sinaimg.cn/mil/crawl/57/w550h307/20190104/S94H-hqzxptp3733837.jpg\" alt=\"\" style=\"margin: 0px auto; padding: 0px; border-style: none; vertical-align: top; max-width: 640px; display: block;\"/><span class=\"img_descr\" style=\"margin: 5px auto; padding: 6px 0px; line-height: 20px; font-size: 16px; display: inline-block; zoom: 1; text-align: left; font-weight: 700;\"></span></div><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal;\">　　由于和中航工业和中国航发的关系较好，该1000公斤级涡扇发动机早已顺利完成在四川江油高空试车台和西安飞行试验研究院伊尔76运输机改装的飞行台的发动机鉴定工作，避免了动力受制于人的局面。隐身性能是飞翼无人机的最大优势，从珠海航展展出的“天鹰”无人机实机来看，由于其体积本来就小于歼20，加上特殊的隐身设计，所以其雷达反射截面积较小，具有极高隐身性。</p><div class=\"img_wrapper\" style=\"margin: 0px; padding: 0px; text-align: center; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal;\"><img src=\"http://n.sinaimg.cn/mil/crawl/40/w550h290/20190104/s022-hqzxptp3733867.jpg\" alt=\"\" style=\"margin: 0px auto; padding: 0px; border-style: none; vertical-align: top; max-width: 640px; display: block;\"/><span class=\"img_descr\" style=\"margin: 5px auto; padding: 6px 0px; line-height: 20px; font-size: 16px; display: inline-block; zoom: 1; text-align: left; font-weight: 700;\"></span></div><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal;\">　　在红外隐身方面，“天鹰”无人机也做了一定的考虑，其尾喷口为椭圆形而非标准的正圆型。据有关资料称，椭圆形尾喷管与正圆型尾喷管相比，可加快航空发动机外涵道空气与内涵道高温尾气的掺混速度，降低红外辐射系数。该飞机的飞控来源让人很感兴趣，由于飞翼布局无人机采用了翼身融合体的结构，取消了传统飞机的平尾和垂尾，但是因为其稳定性先天不足，使得飞翼无人机在强气流扰动时抗干扰能力差，航迹跟踪和稳定性控制十分困难。据公开资料称，“天鹰”无人机采用了基于神经网络补偿动态逆控制飞控系统，和美国的F35、X36战机的飞控系统技术水平相等。从公开的飞行起降视频来看，其飞行状态十分稳定，飞控系统具有良好的动态性能和稳态特性。</p><div class=\"img_wrapper\" style=\"margin: 0px; padding: 0px; text-align: center; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal;\"><img src=\"http://n.sinaimg.cn/mil/crawl/103/w550h353/20190104/1hLb-hqzxptp3733890.jpg\" alt=\"\" style=\"margin: 0px auto; padding: 0px; border-style: none; vertical-align: top; max-width: 640px; display: block;\"/><span class=\"img_descr\" style=\"margin: 5px auto; padding: 6px 0px; line-height: 20px; font-size: 16px; display: inline-block; zoom: 1; text-align: left; font-weight: 700;\"></span></div><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal;\">　　另据公开资料称，“天鹰”无人机还很有可能采用了我国有关科研部门自行研制的离子体激励器，除了可进一步提高无人机隐身性能外，还显著增加飞翼布局飞行器的最大升力系数，延缓失速发生，增强对飞机的机动控制能力，扩展了飞机飞行包线，极大的提高了飞翼布局无人机的飞行性能。（作者署名：未来巡航者）</p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal;\">　　《出鞘》完整内容请关注新浪军事官方微信抢先查看（查看详情请搜索微信公众号：sinamilnews），《出鞘》每天在新浪军事官方微信完整首发。</p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal;\">　　<span style=\"font-weight: 700 !important;\">本栏目所有文章目的在于传递更多信息，并不代表本网赞同其观点和对其真实性负责。凡本网注明版权所有的作品，版权均属于新浪网，凡署名作者的，版权则属原作者或出版人所有，未经本网或作者授权不得转载、摘编或利用其它方式使用上述作品。</span></p><p><br/></p>','近日，网上某新闻媒体披露了航天科工集团飞航导弹研究院下属的海鹰无人机公司最新研发的“天鹰”无人机起降试飞视频。这也是我国首个公开试飞视频的飞翼无人机，也标志','2019-01-05 02:35:54',1,28,1,2,1);
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
 1 AS `caregory_name`*/;
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
INSERT INTO `news_tag` VALUES (9,5),(10,6),(11,7),(11,8),(12,9),(13,10),(14,11),(14,12),(15,13),(15,14);
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
 1 AS `summary`,
 1 AS `author`,
 1 AS `comment_number`,
 1 AS `create_time`,
 1 AS `pv`*/;
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (4,'111'),(5,'伊能静'),(6,'廉政风云'),(7,'足球'),(8,'国足'),(9,'以考代罚'),(10,'王者'),(11,'无人机'),(12,'中国'),(13,'银行'),(14,'准备金率');
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
INSERT INTO `user` VALUES (1,'郑俊铭','3116005120','a89086c0a5103178ffee44592166dc3d','/image/user/62a5f5ce3bb44bf28626714a65b5602b.jpg','这个人傻的',1,'2019-01-04'),(2,'3116005120','13143371031','a89086c0a5103178ffee44592166dc3d','/image/user/62a5f5ce3bb44bf28626714a65b5602b.jpg',NULL,1,'2019-01-04');
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
/*!50001 VIEW `collection_news` AS select `n`.`news_id` AS `news_id`,`n`.`title` AS `title`,`n`.`summary` AS `summary`,`u2`.`nickname` AS `author`,`n`.`comment_number` AS `comment_number`,`n`.`create_time` AS `create_time`,`n`.`pv` AS `pv`,`n`.`user_id` AS `user_id` from (((`collection` `c` left join `user` `u` on((`c`.`user_id` = `u`.`user_id`))) left join `news` `n` on((`c`.`news_id` = `n`.`news_id`))) left join `user` `u2` on((`u2`.`user_id` = `n`.`user_id`))) */;
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
/*!50001 VIEW `news_detail` AS select `news`.`news_id` AS `news_id`,`news`.`title` AS `title`,`news`.`content` AS `content`,`user`.`user_id` AS `author_id`,`user`.`nickname` AS `author`,`news`.`pv` AS `pv`,`news`.`comment_number` AS `comment_number`,`news`.`create_time` AS `create_time`,`category`.`news_category_name` AS `caregory_name` from ((`news` join `user`) join `category`) where ((`news`.`user_id` = `user`.`user_id`) and (`news`.`category_id` = `category`.`category_id`)) */;
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
/*!50001 VIEW `search_news` AS select `news`.`news_id` AS `news_id`,`news`.`title` AS `title`,`news`.`summary` AS `summary`,`user`.`nickname` AS `author`,`news`.`comment_number` AS `comment_number`,`news`.`create_time` AS `create_time`,`news`.`pv` AS `pv` from (`news` join `user`) where (`news`.`user_id` = `user`.`user_id`) */;
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

-- Dump completed on 2019-01-06 13:19:09
