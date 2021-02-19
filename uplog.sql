/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.5.40 : Database - uplog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`uplog` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `uplog`;

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `log_id` int(11) NOT NULL,
  `up_id` int(11) NOT NULL,
  `comment_content` varchar(400) DEFAULT NULL,
  `comment_date` date NOT NULL,
  `comment_id` int(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`comment_id`),
  KEY `FK_发表` (`up_id`),
  KEY `FK_属于` (`log_id`),
  CONSTRAINT `FK_发表` FOREIGN KEY (`up_id`) REFERENCES `up` (`up_id`),
  CONSTRAINT `FK_属于` FOREIGN KEY (`log_id`) REFERENCES `log` (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='评论表';

/*Data for the table `comment` */

insert  into `comment`(`log_id`,`up_id`,`comment_content`,`comment_date`,`comment_id`) values (98,1,'感谢你宝贵的意见，我们会认真对待的！','2021-01-10',6),(88,1,'一定不白嫖','2021-01-10',7),(85,1,'真强大','2021-01-10',8),(98,2,'很好！','2021-01-10',10),(87,1,'很好','2021-01-11',11),(98,1,'666','2021-01-11',12),(254,13,'确实','2021-01-13',14),(254,1,'6666','2021-01-15',15),(90,1,'有未成人内容问题！','2021-01-15',16),(258,1,'212','2021-01-16',17),(254,1,'测试举报！','2021-01-16',18),(85,1,'学','2021-01-17',19),(106,1,'测试','2021-01-18',20),(98,1,'举报测试！','2021-01-18',21),(98,1,'开始','2021-01-23',22);

/*Table structure for table `log` */

DROP TABLE IF EXISTS `log`;

CREATE TABLE `log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `up_id` int(11) NOT NULL,
  `log_title` varchar(100) NOT NULL,
  `log_content` text,
  `log_date` datetime NOT NULL,
  `log_top` int(11) DEFAULT NULL,
  `log_bottom` int(11) DEFAULT NULL,
  `log_update_date` date DEFAULT NULL,
  `log_state` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`),
  KEY `FK_拥有` (`up_id`),
  CONSTRAINT `FK_拥有` FOREIGN KEY (`up_id`) REFERENCES `up` (`up_id`)
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8 COMMENT='帖子表';

/*Data for the table `log` */

insert  into `log`(`log_id`,`up_id`,`log_title`,`log_content`,`log_date`,`log_top`,`log_bottom`,`log_update_date`,`log_state`) values (84,1,'C#简单学生信息管理系统（C#课程设计）','<p><span style=\"color: rgb(85, 86, 102); font-family: -apple-system, &quot;SF UI Text&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-variant-ligatures: common-ligatures; background-color: rgb(238, 240, 244);\">我以前在CSDN上面，发布的一款学生管理系统，有的同学觉得太难了，所以，这里我就选取一个简单的，大家可以自行修改，我选取的也是CSDN上面比较热门的一款学生信息管理系统，大家也在寻求源码，原文地址：</span><a href=\"https://blog.csdn.net/yang_shuai_/article/details/91049611\" style=\"box-sizing: border-box; outline: none; margin: 0px; padding: 0px; text-decoration-line: none; cursor: pointer; background-color: rgb(238, 240, 244); color: rgb(103, 149, 181); overflow-wrap: break-word; font-family: -apple-system, &quot;SF UI Text&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-variant-ligatures: common-ligatures; white-space: normal;\">https://blog.csdn.net/yang_shuai_/article/details/91049611</a><span style=\"color: rgb(85, 86, 102); font-family: -apple-system, &quot;SF UI Text&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-variant-ligatures: common-ligatures; background-color: rgb(238, 240, 244);\">&nbsp;我这边将源码的数据库重新</span></p><p><span style=\"color: rgb(85, 86, 102); font-family: -apple-system, &quot;SF UI Text&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-variant-ligatures: common-ligatures; background-color: rgb(238, 240, 244);\">设计了一下，并且也出了安装视频,大家关注一下小R，即</span><span style=\"color: rgb(85, 86, 102); font-family: -apple-system, &quot;SF UI Text&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-variant-ligatures: common-ligatures; background-color: rgb(238, 240, 244);\">可获取源码哦</span><br/></p><p><span style=\"color: rgb(85, 86, 102); font-family: -apple-system, &quot;SF UI Text&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-variant-ligatures: common-ligatures; background-color: rgb(238, 240, 244);\"><br/></span></p><p><span style=\"color: rgb(85, 86, 102); font-family: -apple-system, &quot;SF UI Text&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-variant-ligatures: common-ligatures; background-color: rgb(238, 240, 244);\"><br/></span></p><p><span style=\"color: rgb(85, 86, 102); font-family: -apple-system, &quot;SF UI Text&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-variant-ligatures: common-ligatures; background-color: rgb(238, 240, 244);\"><br/></span></p>','2021-01-09 20:48:13',0,1,'2021-01-13',1),(85,1,'仿面具公园源码面具公园app搭建简单教程','<p><span style=\"color: rgb(77, 77, 77); font-family: -apple-system, &quot;SF UI Text&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-variant-ligatures: common-ligatures; background-color: rgb(255, 255, 255);\">可能是2020年兴起的陌生人社交APP，越来越多的人开始投身社交市场，准备做社交APP。 估计都是看到面具这个app是真赚钱了吧 ，刚好我前段时间也在朋友那里花了15000大洋买了一套类似于面具公园的源码，这里简单的跟大家分享下</span></p>','2021-01-09 20:50:12',102,0,'2021-01-09',1),(86,1,'Vue + Spring Boot 项目实战（一）：项目简介','<p><span style=\"color: rgb(77, 77, 77); font-family: -apple-system, &quot;SF UI Text&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-variant-ligatures: common-ligatures; background-color: rgb(255, 255, 255);\">之前写了一些关于 Java EE 的文章，主要是理论性质的，目的是帮助大家快速了解 Java EE 的核心内容，早日爬出这个陈旧又绕不开的坑，进入 Java Web 开发的新天地。当然只有理论是不够的，有很多细节需要在实践中理解，所以我决定做一个实践教程。</span></p>','2021-01-09 20:50:42',23,0,'2021-01-09',1),(87,1,'学习Java的9张思维导图','<p><span style=\"color: rgb(77, 77, 77); font-family: -apple-system, &quot;SF UI Text&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-variant-ligatures: common-ligatures; background-color: rgb(255, 255, 255);\">我的目标是根据这个教程，可以帮助&nbsp;</span><span style=\"box-sizing: border-box; outline: 0px; font-weight: 700; overflow-wrap: break-word; color: rgb(77, 77, 77); font-family: -apple-system, &quot;SF UI Text&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-variant-ligatures: common-ligatures; background-color: rgb(255, 255, 255);\">新入行的或是刚开始学习相关技术</span><span style=\"color: rgb(77, 77, 77); font-family: -apple-system, &quot;SF UI Text&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-variant-ligatures: common-ligatures; background-color: rgb(255, 255, 255);\">&nbsp;的小伙伴们把一个完整的项目还原出来，建立起对前后端分离式 Web 开发的整体认知。</span></p>','2021-01-09 20:51:40',22,13,'2021-01-09',1),(88,1,'友善白嫖哈。','<p><span style=\"color: rgb(77, 77, 77); font-family: -apple-system, &quot;SF UI Text&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-variant-ligatures: common-ligatures; background-color: rgb(255, 255, 255);\">开个玩笑，叫白卷是因为它随着教程进展逐渐完善，象征着知识的从无到有，从有到多。</span></p>','2021-01-09 20:52:16',NULL,NULL,'2021-01-09',1),(89,1,'关于大学计算机相关专业学习路线的见解与分析','<p><span style=\"color: rgb(77, 77, 77); font-family: -apple-system, &quot;SF UI Text&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-variant-ligatures: common-ligatures; background-color: rgb(255, 255, 255);\">阅读本文首先需要你明确自己的专业是偏硬还是偏软（本文以计算机科学与技术专业为主，不涉及偏硬件的内容）。文章目录链接如下：</span></p>','2021-01-09 20:53:44',23,0,'2021-01-09',1),(90,1,'vuex刷新后数据丢失怎么解决','<p><span style=\"color: rgb(77, 77, 77); font-family: -apple-system, &quot;SF UI Text&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-variant-ligatures: common-ligatures; background-color: rgb(255, 255, 255);\">我们在写vue项目的时候，经常要用到vuex作为内存来储存，但是我们存放在vuex中的数据（用户数据，当前页面的数据等等）在刷新后就会丢失，那么如何解决呢？超级简单。</span></p>','2021-01-09 20:54:04',NULL,NULL,'2021-01-09',1),(91,1,'基于Opencv的口罩佩戴识别系统','<p>疫情之下，有人选择负重前行，有人在年假与工作中毅然选择后者。感谢“疫”路有你，祝愿祖国繁荣昌盛，国泰民安！</p>','2021-01-09 20:54:35',11,0,'2021-01-09',1),(92,1,'自学编程的 6 个致命误区','<p><span style=\"color: rgb(77, 77, 77); font-family: -apple-system, &quot;SF UI Text&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-variant-ligatures: common-ligatures; background-color: rgb(255, 255, 255);\">嗨，小伙伴们大家好，我是沉默王二。本篇文章来和大家聊聊自学编程中的一些误区——这是我在 B 站上看了羊哥的一期视频后有感而发的文章。因为确实有很多读者也曾私信问过我这些方面的问题，很有代表性，所以我就结合自己的亲身体会来谈一谈，希望对小伙伴们有所启发。</span></p>','2021-01-09 20:56:07',NULL,NULL,'2021-01-09',1),(93,1,'Java高质量面试总结','<p><span style=\"color: rgba(0, 0, 0, 0.75); font-family: -apple-system, &quot;SF UI Text&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-variant-ligatures: common-ligatures; background-color: rgb(255, 255, 255);\">一般都是由浅到深去问,思路是:</span></p><ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p>先考察基础是否过关,因为基础知识决定了一个技术人员发展的上限</p></li></ul><p><br/></p><p><span style=\"color: rgba(0, 0, 0, 0.75); font-family: -apple-system, &quot;SF UI Text&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-variant-ligatures: common-ligatures; background-color: rgb(255, 255, 255);\">一般都是由浅到深去问,思路是:</span></p><ul class=\" list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>先考察基础是否过关,因为基础知识决定了一个技术人员发展的上限</p></li></ul><p><br/></p><p><span style=\"color: rgba(0, 0, 0, 0.75); font-family: -apple-system, &quot;SF UI Text&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-variant-ligatures: common-ligatures; background-color: rgb(255, 255, 255);\">一般都是由浅到深去问,思路是:</span></p><ul class=\" list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>先考察基础是否过关,因为基础知识决定了一个技术人员发展的上限</p></li></ul><p><br/></p><p><span style=\"color: rgba(0, 0, 0, 0.75); font-family: -apple-system, &quot;SF UI Text&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-variant-ligatures: common-ligatures; background-color: rgb(255, 255, 255);\">一般都是由浅到深去问,思路是:</span></p><ul class=\" list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>先考察基础是否过关,因为基础知识决定了一个技术人员发展的上限</p></li></ul><p><br/></p><p><span style=\"color: rgba(0, 0, 0, 0.75); font-family: -apple-system, &quot;SF UI Text&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-variant-ligatures: common-ligatures; background-color: rgb(255, 255, 255);\">一般都是由浅到深去问,思路是:</span></p><ul class=\" list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>先考察基础是否过关,因为基础知识决定了一个技术人员发展的上限</p></li></ul><p><br/></p><p><br/></p>','2021-01-09 20:57:09',NULL,NULL,'2021-01-13',1),(94,1,'Java全套视频教程免费下载','<p><span style=\"color: rgb(25, 31, 37); font-family: -apple-system, &quot;SF UI Text&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif, SimHei, SimSun; background-color: rgb(255, 255, 255);\">你是否一直苦于Java学习资料太多太杂，没有能力辨别哪套视频教程最适合自己？你是否既想自学又想快速提升？你是否期望快速入门，系统学习？？</span></p>','2021-01-09 20:57:35',21,2,'2021-01-09',1),(95,1,'大四学生如何求Java工作？','<p><span style=\"color: rgb(77, 77, 77); font-family: -apple-system, &quot;SF UI Text&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-variant-ligatures: common-ligatures; background-color: rgb(255, 255, 255);\">有读者给我留言：大四的学生如何求一份Java的工作？并且还特别强调了他非科班和文凭不出众的事实背景。我想这个问题具有代表性，所以写一些个人的建议，希望能帮到一些人。</span></p>','2021-01-09 20:57:55',0,1,'2021-01-09',1),(96,1,'35款帮助你加薪的IDEA神器插件！','<p><span style=\"color: rgb(85, 86, 102); font-family: -apple-system, &quot;SF UI Text&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-variant-ligatures: common-ligatures; background-color: rgb(238, 240, 244);\">全栈必备，作为一个全能的程序员 ，用鼠标，太伤自尊了，他就可以帮到你</span><br/><code style=\"box-sizing: border-box; outline: 0px; font-family: &quot;Source Code Pro&quot;, &quot;DejaVu Sans Mono&quot;, &quot;Ubuntu Mono&quot;, &quot;Anonymous Pro&quot;, &quot;Droid Sans Mono&quot;, Menlo, Monaco, Consolas, Inconsolata, Courier, monospace, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, sans-serif; font-size: 14px; line-height: 22px; color: rgb(199, 37, 78); background-color: rgb(249, 242, 244); border-radius: 2px; padding: 2px 4px; overflow-wrap: break-word; font-variant-ligatures: common-ligatures; white-space: normal;\">AceJump</code><span style=\"color: rgb(85, 86, 102); font-family: -apple-system, &quot;SF UI Text&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-variant-ligatures: common-ligatures; background-color: rgb(238, 240, 244);\">其实是一款能够代替鼠标的软件，只要安装了这款插件，可以在代码中跳转到任意位置。按快捷键进入 AceJump 模式后（默认是 Ctrl+J），再按任一个字符，插件就会在屏幕中这个字符的所有出现位置都打上标签，你只要再按一下标签的字符，就能把光标移到该位置上。换言之，你要移动光标时，眼睛一直看着目标位置就行了，根本不用管光标的当前位置。</span></p>','2021-01-09 20:58:21',NULL,NULL,'2021-01-09',1),(97,1,'官方','<p>发布了最新版本！</p>','2021-01-09 22:17:11',21,22,'2021-01-09',-1),(98,2,'给官方的建议贴','<p>你好，我是一名在校大学生...</p>','2021-01-10 01:02:33',13,2,'2021-01-10',1),(100,1,'过去的榜首','相爱不一定能走到最后....','2020-12-30 10:13:26',888,NULL,NULL,-1),(105,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,-1),(106,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,-1),(107,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(108,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(109,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(110,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(111,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(112,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(113,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(114,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(115,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(116,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(117,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(118,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(119,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(120,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(121,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(122,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(123,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(124,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(125,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(126,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(127,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(128,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(129,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(130,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(131,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(132,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(133,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(134,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(135,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(136,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(137,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(138,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(139,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(140,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(141,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(142,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(143,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(144,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(145,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(146,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(147,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(148,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(149,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(150,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(151,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(152,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(153,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(154,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(155,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(156,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(157,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(158,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(159,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(160,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(161,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(162,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(163,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(164,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(165,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(166,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(167,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(168,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(169,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(170,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(171,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(172,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(173,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(174,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(175,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(176,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(177,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(178,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(179,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(180,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(181,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(182,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(183,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(184,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(185,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(186,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(187,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(188,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(189,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(190,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(191,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(192,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(193,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(194,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(195,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(196,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(197,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(198,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(199,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(200,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(201,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(202,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(203,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(204,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(205,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(206,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(207,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(208,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(209,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(210,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(211,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(212,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(213,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(214,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(215,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(216,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(217,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(218,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(219,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(220,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(221,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(222,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(223,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(224,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(225,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(226,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(227,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(228,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(229,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(230,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(231,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(232,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(233,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(234,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(235,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(236,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(237,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(238,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(239,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(240,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(241,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(242,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(243,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(244,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(245,1,'学习了嘻嘻','学习了嘻嘻','2021-01-02 00:00:00',NULL,NULL,NULL,1),(254,13,'猿主简介','<p>它是个逗逼...</p>','2021-01-13 17:13:36',1,0,'2021-01-13',-1),(256,1,'测试通过','<p>测试通过</p>','2021-01-16 22:06:01',NULL,NULL,'2021-01-16',-1),(257,1,'212','<p>2121</p>','2021-01-16 22:19:14',NULL,NULL,'2021-01-16',-1),(258,1,'212','<p>2122</p>','2021-01-16 22:19:31',NULL,NULL,'2021-01-16',-1),(259,1,'开心','<p>开心</p>','2021-01-18 14:08:55',NULL,NULL,'2021-01-18',-1),(260,1,'测试通过','<p>212</p>','2021-01-18 14:31:38',NULL,NULL,'2021-01-18',-1),(261,1,'1212学23213','<p>埒</p><p><br/></p>','2021-01-18 14:43:39',NULL,NULL,'2021-01-18',-1),(262,1,'23213好学2321','<pre style=\"background-color:#2b2b2b;color:#a9b7c6;font-family:&#39;JetBrains Mono&#39;,monospace;font-size:9.8pt;\">sosVal=&quot;&quot;;</pre><p><br/></p>','2021-01-18 14:43:54',NULL,NULL,'2021-01-18',-1),(263,1,'21212','<p>1212</p>','2021-01-18 14:43:59',NULL,NULL,'2021-01-18',-1),(264,1,'别翻车','<p>666</p>','2021-01-18 14:52:19',NULL,NULL,'2021-01-18',-1);

/*Table structure for table `point_log` */

DROP TABLE IF EXISTS `point_log`;

CREATE TABLE `point_log` (
  `up_id` int(11) DEFAULT NULL,
  `log_id` int(11) DEFAULT NULL,
  `point_date` datetime NOT NULL,
  `point_type` int(11) DEFAULT NULL,
  KEY `up_id` (`up_id`),
  KEY `log_id` (`log_id`),
  CONSTRAINT `point_log_ibfk_1` FOREIGN KEY (`up_id`) REFERENCES `up` (`up_id`),
  CONSTRAINT `point_log_ibfk_2` FOREIGN KEY (`log_id`) REFERENCES `log` (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `point_log` */

insert  into `point_log`(`up_id`,`log_id`,`point_date`,`point_type`) values (1,86,'2021-01-11 17:22:13',1),(1,91,'2021-01-11 17:16:55',0),(2,98,'2021-01-23 11:02:13',1),(1,85,'2021-01-15 09:57:46',1),(1,87,'2021-01-11 19:40:18',-1),(1,95,'2021-01-12 15:14:44',-1),(1,89,'2021-01-12 20:58:35',1),(1,84,'2021-01-12 23:55:13',-1),(13,254,'2021-01-13 17:44:37',1);

/*Table structure for table `report` */

DROP TABLE IF EXISTS `report`;

CREATE TABLE `report` (
  `log_id` int(11) NOT NULL,
  `report_upid` int(11) NOT NULL,
  `report_content` text,
  `report_start` int(11) NOT NULL DEFAULT '-1',
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_date` datetime NOT NULL,
  PRIMARY KEY (`report_id`),
  KEY `log_id` (`log_id`),
  KEY `report_upid` (`report_upid`),
  CONSTRAINT `report_ibfk_1` FOREIGN KEY (`log_id`) REFERENCES `log` (`log_id`),
  CONSTRAINT `report_ibfk_2` FOREIGN KEY (`report_upid`) REFERENCES `up` (`up_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `report` */

insert  into `report`(`log_id`,`report_upid`,`report_content`,`report_start`,`report_id`,`report_date`) values (260,1,'测试举报！',-1,19,'2021-01-18 14:32:10');

/*Table structure for table `up` */

DROP TABLE IF EXISTS `up`;

CREATE TABLE `up` (
  `up_id` int(11) NOT NULL AUTO_INCREMENT,
  `up_pname` char(25) NOT NULL,
  `up_ptext` varchar(70) DEFAULT NULL,
  `up_name` char(25) NOT NULL,
  `up_password` char(25) NOT NULL,
  `up_cdate` date NOT NULL,
  `up_headImg` varchar(100) DEFAULT NULL,
  `up_power` int(20) NOT NULL,
  PRIMARY KEY (`up_id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8 COMMENT='博主表';

/*Data for the table `up` */

insert  into `up`(`up_id`,`up_pname`,`up_ptext`,`up_name`,`up_password`,`up_cdate`,`up_headImg`,`up_power`) values (1,'猿记官方账号','创新是血液','admin','zjazn','2021-01-05','/img/upHeadImg/99F9976AA4744AE49914226106DEF0B2.jpg',1000),(2,'全栈的小庄','热爱才是动力','root','root','2021-01-08','/img/k9.jpg',100),(13,'猿主','创新无止境，且不自傲','18476305640','zjazn','2021-01-13','/img/upHeadImg/EF34872E0BFD48668C540CA0A62EE277.jpg',0),(14,'我很污~','我很污~','10086','10086','2021-01-15','/img/upHeadImg/16014BAED003456FBD850FB26991A07C.jpg',-1),(15,'小庄z','iii','188','zjazn','2021-01-22',NULL,100),(16,'小庄z','iii','188','zjazn','2021-01-22',NULL,100),(121,'1','iii','188','zjazn','2021-01-22',NULL,100);

/* Trigger structure for table `log` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `logIfDel` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `logIfDel` BEFORE DELETE ON `log` FOR EACH ROW BEGIN
	delete from comment where log_id=old.log_id;
	DELETE FROM point_log WHERE log_id=old.log_id;
	delete from report where log_id=old.log_id;
    END */$$


DELIMITER ;

/* Trigger structure for table `up` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `upIfDel` */$$

/*!50003 CREATE */  /*!50003 TRIGGER `upIfDel` BEFORE DELETE ON `up` FOR EACH ROW BEGIN
	delete from log where up_id=old.up_id;
    END */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
