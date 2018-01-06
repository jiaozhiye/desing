DROP TABLE IF EXISTS `zh_article`;
CREATE TABLE IF NOT EXISTS `zh_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(5) unsigned NOT NULL COMMENT '从属分类ID',
  `title` varchar(100) NOT NULL COMMENT '文章标题',
  `description` varchar(200) DEFAULT NULL COMMENT '文章简介',
  `content_id` int(5) unsigned DEFAULT NULL COMMENT '内容ID',
  `attach_file` varchar(200) DEFAULT NULL COMMENT '附件路径',
  `path` varchar(100) DEFAULT NULL COMMENT '图片路径',
  `thumb_path` varchar(100) DEFAULT NULL COMMENT '缩略图路径',
  `author` int(5) unsigned DEFAULT NULL COMMENT '作者ID，用户名',
  `add_time` varchar(20) NOT NULL COMMENT '创建时间',
  `last_time` varchar(20) NOT NULL COMMENT '最后修改时间',
  `order_list` int(2) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `disable` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '数据是否有效',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `zh_classify`;
CREATE TABLE IF NOT EXISTS `zh_classify` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父类ID',
  `depth` varchar(20) NOT NULL DEFAULT '0' COMMENT '分类的深度',
  `title` varchar(20) NOT NULL COMMENT '分类名称',
  `description` varchar(100) DEFAULT NULL COMMENT '分类描述',
  `path` varchar(100) NOT NULL COMMENT '分类图片路径',
  `thumb_path` varchar(100) NOT NULL COMMENT '分类缩略图路径',
  `add_time` varchar(20) NOT NULL COMMENT '创建时间',
  `last_time` varchar(20) NOT NULL COMMENT '最后修改时间',
  `order_list` int(2) unsigned NOT NULL DEFAULT '0' COMMENT '分类排序',
  `disable` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '数据是否有效',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `zh_content`;
CREATE TABLE IF NOT EXISTS `zh_content` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL COMMENT '文章内容',
  `add_time` varchar(20) NOT NULL COMMENT '创建时间',
  `last_time` varchar(20) NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `zh_site_access`;
CREATE TABLE IF NOT EXISTS `zh_site_access` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) unsigned NOT NULL COMMENT '外键-用户组id',
  `site_nav_mark` varchar(20) NOT NULL COMMENT '外键-系统分类标识',
  `access` tinyint(1) unsigned NOT NULL COMMENT '权限',
  `add_time` varchar(20) NOT NULL COMMENT '创建时间',
  `last_time` varchar(20) NOT NULL COMMENT '最后修改时间',
  `disable` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '数据是否有效',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=415 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `zh_site_config`;
CREATE TABLE IF NOT EXISTS `zh_site_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '网站标题',
  `keywords` varchar(100) DEFAULT NULL COMMENT '网站关键字',
  `description` text COMMENT '网站描述',
  `copy` varchar(50) DEFAULT NULL COMMENT '版权所有',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮箱',
  `records` varchar(50) DEFAULT NULL COMMENT '备案信息',
  `add_time` varchar(20) NOT NULL COMMENT '创建时间',
  `last_time` varchar(20) NOT NULL COMMENT '最后修改时间',
  `disable` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '数据有效标识',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `zh_site_nav`;
CREATE TABLE IF NOT EXISTS `zh_site_nav` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(5) unsigned NOT NULL COMMENT '从属父类id',
  `depth` varchar(10) NOT NULL COMMENT '分类结构',
  `name` varchar(20) NOT NULL COMMENT '分类名称',
  `link` varchar(20) DEFAULT NULL COMMENT '页面路由地址',
  `mark` varchar(20) DEFAULT NULL COMMENT '分类标识符',
  `add_time` varchar(20) NOT NULL COMMENT '创建时间',
  `last_time` varchar(20) NOT NULL COMMENT '最后修改时间',
  `order_list` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '分类排序',
  `disable` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '数据是否有效',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `zh_user`;
CREATE TABLE IF NOT EXISTS `zh_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` varchar(60) NOT NULL COMMENT '邮箱',
  `add_time` varchar(20) NOT NULL COMMENT '创建时间',
  `last_sign_time` varchar(20) NOT NULL COMMENT '最后一次登录时间',
  `disable` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '数据有效标识符',
  `user_group_id` int(11) unsigned NOT NULL COMMENT '外键-用户组id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `zh_user_group`;
CREATE TABLE IF NOT EXISTS `zh_user_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL COMMENT '用户组名称',
  `description` varchar(200) NOT NULL COMMENT '用户组描述',
  `add_time` varchar(20) NOT NULL COMMENT '创建时间',
  `last_time` varchar(20) NOT NULL COMMENT '最后修改时间',
  `disable` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '数据有效标识',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

INSERT INTO `zh_article` (`id`,`cid`,`title`,`description`,`content_id`,`attach_file`,`path`,`thumb_path`,`author`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (1,1,'qwe','qwe',NULL,NULL,'images\\article\\20170314090716_9879.png','images\\article\\thumb_20170314090716_9879.png',NULL,'20170314090718','20170314090718',0,1);
INSERT INTO `zh_article` (`id`,`cid`,`title`,`description`,`content_id`,`attach_file`,`path`,`thumb_path`,`author`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (3,1,'qwe','qwe',NULL,NULL,'images\\article\\20170314090716_9879.png','images\\article\\thumb_20170314090716_9879.png',NULL,'20170314091218','20170314091218',1,1);
INSERT INTO `zh_article` (`id`,`cid`,`title`,`description`,`content_id`,`attach_file`,`path`,`thumb_path`,`author`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (21,53,'dsfgdfgdfg','sdfsdg那就',21,'files\\20170424093838_5098.rar','images\\article\\20170424093828_9382.png','images\\article\\thumb_20170424093828_9382.png',1,'20170424093841','20170424093858',0,1);
INSERT INTO `zh_article` (`id`,`cid`,`title`,`description`,`content_id`,`attach_file`,`path`,`thumb_path`,`author`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (6,1,'wer','wer',6,NULL,'images\\article\\20170314095051_5512.png','images\\article\\thumb_20170314095051_5512.png',NULL,'20170314095053','20170314095053',0,1);
INSERT INTO `zh_article` (`id`,`cid`,`title`,`description`,`content_id`,`attach_file`,`path`,`thumb_path`,`author`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (15,1,'fdsafsa','',15,'files\\20170424124117_7898.rar,files\\20170424124117_8433.rar','','',1,'20170424124120','20170424124120',0,1);
INSERT INTO `zh_article` (`id`,`cid`,`title`,`description`,`content_id`,`attach_file`,`path`,`thumb_path`,`author`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (16,1,'qwe','',16,'','','',1,'20170424010149','20170424010149',0,1);
INSERT INTO `zh_article` (`id`,`cid`,`title`,`description`,`content_id`,`attach_file`,`path`,`thumb_path`,`author`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (17,1,'dfgd','fg',17,'files\\20170424010212_3314.rar','','',1,'20170424010215','20170424010215',0,1);
INSERT INTO `zh_article` (`id`,`cid`,`title`,`description`,`content_id`,`attach_file`,`path`,`thumb_path`,`author`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (18,52,'werwe','ert',18,'files\\20170424010349_8673.rar,files\\20170424010349_7196.rar','','',1,'20170424010353','20170424010353',0,1);
INSERT INTO `zh_article` (`id`,`cid`,`title`,`description`,`content_id`,`attach_file`,`path`,`thumb_path`,`author`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (22,57,'5476457','4564574',22,'files\\20170424094341_1186.rar','images\\article\\20170424094326_8432.png','images\\article\\thumb_20170424094326_8432.png',NULL,'20170424094343','20170424094343',0,1);
INSERT INTO `zh_article` (`id`,`cid`,`title`,`description`,`content_id`,`attach_file`,`path`,`thumb_path`,`author`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (20,2,'gfhufutfdytf','fghqwrqw',20,'files\\20170424010542_0563.rar,files\\20170424010602_9636.rar','images\\article\\20170424010550_6036.png','images\\article\\thumb_20170424010550_6036.png',1,'20170424010604','20170424092102',3,1);
INSERT INTO `zh_article` (`id`,`cid`,`title`,`description`,`content_id`,`attach_file`,`path`,`thumb_path`,`author`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (23,55,'fdsfsdgsdg','sdfsdgf',23,'files\\20170424100121_4467.rar','','',1,'20170424100124','20170424100124',0,1);
INSERT INTO `zh_article` (`id`,`cid`,`title`,`description`,`content_id`,`attach_file`,`path`,`thumb_path`,`author`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (24,1,'asfagf','',24,'','','',1,'20170424100210','20170424100210',0,1);
INSERT INTO `zh_article` (`id`,`cid`,`title`,`description`,`content_id`,`attach_file`,`path`,`thumb_path`,`author`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (25,1,'sdsg','',25,'files\\20170424100230_0207.rar,files\\20170424100230_6426.rar','','',1,'20170424100233','20170424100233',0,1);
INSERT INTO `zh_article` (`id`,`cid`,`title`,`description`,`content_id`,`attach_file`,`path`,`thumb_path`,`author`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (26,1,'56757','',26,'','','',1,'20170424100253','20170424100253',0,1);
INSERT INTO `zh_article` (`id`,`cid`,`title`,`description`,`content_id`,`attach_file`,`path`,`thumb_path`,`author`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (27,7,'awdfesaf','',27,'files\\20170424100446_8601.rar,files\\20170424100446_9470.rar','','',1,'20170424100449','20170424100449',0,1);
INSERT INTO `zh_article` (`id`,`cid`,`title`,`description`,`content_id`,`attach_file`,`path`,`thumb_path`,`author`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (28,1,'asfasf','',28,'','','',1,'20170424100502','20170424100502',0,1);
INSERT INTO `zh_article` (`id`,`cid`,`title`,`description`,`content_id`,`attach_file`,`path`,`thumb_path`,`author`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (29,58,'rturtu','rtu',29,'files\\20170424100522_8622.rar','images\\article\\20170424100528_9990.png','images\\article\\thumb_20170424100528_9990.png',1,'20170424100540','20170424100540',0,1);
INSERT INTO `zh_article` (`id`,`cid`,`title`,`description`,`content_id`,`attach_file`,`path`,`thumb_path`,`author`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (30,50,'dsgdg','sdgdsg',30,'files\\20170424100610_1608.rar,files\\20170424100643_9419.rar','images\\article\\20170424100615_4694.png','images\\article\\thumb_20170424100615_4694.png',1,'20170424100650','20170424100650',0,1);
INSERT INTO `zh_article` (`id`,`cid`,`title`,`description`,`content_id`,`attach_file`,`path`,`thumb_path`,`author`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (31,64,'fsdsfsdfsdf','sdfsdfsdf',31,'files\\20170424100940_3063.rar','images\\article\\20170424100945_9009.png','images\\article\\thumb_20170424100945_9009.png',1,'20170424100948','20170424101940',2,1);
INSERT INTO `zh_article` (`id`,`cid`,`title`,`description`,`content_id`,`attach_file`,`path`,`thumb_path`,`author`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (32,53,'你好','你好',32,'files\\20170424110742_2778.rar','images\\article\\20170424110718_6536.png','images\\article\\thumb_20170424110718_6536.png',1,'20170424103526','20170424110746',0,1);
INSERT INTO `zh_article` (`id`,`cid`,`title`,`description`,`content_id`,`attach_file`,`path`,`thumb_path`,`author`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (33,1,'觉得看得开','',33,'files\\20170424103758_5378.zip','','',1,'20170424103810','20170424103810',1,1);
INSERT INTO `zh_article` (`id`,`cid`,`title`,`description`,`content_id`,`attach_file`,`path`,`thumb_path`,`author`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (34,55,'wer','wer',34,'files\\20170424111602_4859.rar,files\\20170424111602_4783.rar,files\\20170424111603_5436.rar','','',1,'20170424111605','20170428045152',0,1);
INSERT INTO `zh_article` (`id`,`cid`,`title`,`description`,`content_id`,`attach_file`,`path`,`thumb_path`,`author`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (35,1,'asd','',35,'files\\20170424115054_0989.rar','','',1,'20170424115056','20170425121345',0,1);
INSERT INTO `zh_article` (`id`,`cid`,`title`,`description`,`content_id`,`attach_file`,`path`,`thumb_path`,`author`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (36,4,'asdsdfsgfdg','',36,'files\\20170424115121_0887.rar,files\\20170424115122_8850.rar','images\\article\\20170425042210_8100.jpg','images\\article\\thumb_20170425042210_8100.jpg',1,'20170424115124','20170425042216',0,1);
INSERT INTO `zh_article` (`id`,`cid`,`title`,`description`,`content_id`,`attach_file`,`path`,`thumb_path`,`author`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (37,4,'asd','',37,'','','',1,'20170424115144','20170425041717',0,1);
INSERT INTO `zh_article` (`id`,`cid`,`title`,`description`,`content_id`,`attach_file`,`path`,`thumb_path`,`author`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (38,5,'asdsadfsd','sdf',38,'files\\20170425040324_7811.rar,files\\20170425040324_5592.rar','images\\article\\20170425041012_5710.JPG','images\\article\\thumb_20170425041012_5710.JPG',1,'20170424115206','20170817062337',2,1);
INSERT INTO `zh_article` (`id`,`cid`,`title`,`description`,`content_id`,`attach_file`,`path`,`thumb_path`,`author`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (44,3,'sad','asdasd',44,'','','',1,'20170913101906','20170913101906',0,1);

INSERT INTO `zh_classify` (`id`,`pid`,`depth`,`title`,`description`,`path`,`thumb_path`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (1,0,'0','一级分类1','asdqwe','images\\classify\\20170425034333_3288.png','images\\classify\\thumb_20170425034333_3288.png','20161212121212','20170704115643',3,1);
INSERT INTO `zh_classify` (`id`,`pid`,`depth`,`title`,`description`,`path`,`thumb_path`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (2,1,'0-1','二级分类1',NULL,'images\\classify\\20170425092739_6990.png','images\\classify\\thumb_20170425092739_6990.png','20161212121212','20170425092910',0,1);
INSERT INTO `zh_classify` (`id`,`pid`,`depth`,`title`,`description`,`path`,`thumb_path`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (3,2,'0-1-2','三级分类1',NULL,'','','20161212121212','20161212121212',0,1);
INSERT INTO `zh_classify` (`id`,`pid`,`depth`,`title`,`description`,`path`,`thumb_path`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (4,1,'0-1','二级分类2',NULL,'','','20161212121212','20161212121212',0,1);
INSERT INTO `zh_classify` (`id`,`pid`,`depth`,`title`,`description`,`path`,`thumb_path`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (5,0,'0','一级分类2',NULL,'','','20161212121212','20161212121212',2,1);
INSERT INTO `zh_classify` (`id`,`pid`,`depth`,`title`,`description`,`path`,`thumb_path`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (7,2,'0-1-2','三级分类2','bbb','','','20161212121212','20170112114517',0,1);
INSERT INTO `zh_classify` (`id`,`pid`,`depth`,`title`,`description`,`path`,`thumb_path`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (50,4,'0-1-4','三级分类3','三级分类3','','','20170111113526','20170111113526',0,1);
INSERT INTO `zh_classify` (`id`,`pid`,`depth`,`title`,`description`,`path`,`thumb_path`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (52,5,'0-5','qweqwe',NULL,'','','20170114100055','20170116024254',0,1);
INSERT INTO `zh_classify` (`id`,`pid`,`depth`,`title`,`description`,`path`,`thumb_path`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (53,5,'0-5','2222222','asdasd','','','20170114100309','20170702102320',0,1);
INSERT INTO `zh_classify` (`id`,`pid`,`depth`,`title`,`description`,`path`,`thumb_path`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (57,53,'0-5-53','33333',NULL,'','','20170115015019','20170425034804',0,1);
INSERT INTO `zh_classify` (`id`,`pid`,`depth`,`title`,`description`,`path`,`thumb_path`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (55,52,'0-5-52','aaa',NULL,'images\\classify\\20170202090125_4516.png','images\\classify\\thumb_20170202090125_4516.png','20170114102939','20170202090126',0,1);
INSERT INTO `zh_classify` (`id`,`pid`,`depth`,`title`,`description`,`path`,`thumb_path`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (64,4,'0-1-4','三级分类4','三级分类4','','','20170119064715','20170202080835',0,1);
INSERT INTO `zh_classify` (`id`,`pid`,`depth`,`title`,`description`,`path`,`thumb_path`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (71,53,'0-5-53','4444','4','','','20170425040453','20170425040453',0,1);

INSERT INTO `zh_content` (`id`,`content`,`add_time`,`last_time`) VALUES (1,'<p><img src=\"http://127.0.0.1:2080/temp/20170314092327_2507.png\" alt=\"public\" style=\"max-width:100%;\"><br></p><p><br></p>','20170314092330','20170314092330');
INSERT INTO `zh_content` (`id`,`content`,`add_time`,`last_time`) VALUES (2,'<p><img src=\"http://127.0.0.1:2080/temp/20170314092327_2507.png\" alt=\"public\" style=\"max-width:100%;\"><br></p><p><br></p>','20170314092402','20170314092402');
INSERT INTO `zh_content` (`id`,`content`,`add_time`,`last_time`) VALUES (3,'<p><img src=\"http://127.0.0.1:2080/temp/20170314092327_2507.png\" alt=\"public\" style=\"max-width:100%;\"><br></p><p><br></p>','20170314092417','20170314092417');
INSERT INTO `zh_content` (`id`,`content`,`add_time`,`last_time`) VALUES (22,'<p>5747</p>','20170424094343','20170424094343');
INSERT INTO `zh_content` (`id`,`content`,`add_time`,`last_time`) VALUES (21,'<p>sdgsdgdsfg<img src=\"http://127.0.0.1:2080/images/article/20170424093825_9045.png\" alt=\"QQ拼音截图未命名\" style=\"font-size: 14px; line-height: 1; max-width: 100%;\"></p><p><br></p>','20170424093841','20170424093858');
INSERT INTO `zh_content` (`id`,`content`,`add_time`,`last_time`) VALUES (6,'<p><img src=\"http://127.0.0.1:2080/images/article/20170314095047_5880.png\" alt=\"public\" style=\"max-width:100%;\"><br></p><p><br></p>','20170314095053','20170314095053');
INSERT INTO `zh_content` (`id`,`content`,`add_time`,`last_time`) VALUES (15,'<p>asfsad</p>','20170424124120','20170424124120');
INSERT INTO `zh_content` (`id`,`content`,`add_time`,`last_time`) VALUES (16,'','20170424010149','20170424010149');
INSERT INTO `zh_content` (`id`,`content`,`add_time`,`last_time`) VALUES (17,'<p>dfg</p>','20170424010215','20170424010215');
INSERT INTO `zh_content` (`id`,`content`,`add_time`,`last_time`) VALUES (8,'<p>asf</p>','20170423044419','20170423044419');
INSERT INTO `zh_content` (`id`,`content`,`add_time`,`last_time`) VALUES (18,'<p>erte</p>','20170424010353','20170424010353');
INSERT INTO `zh_content` (`id`,`content`,`add_time`,`last_time`) VALUES (23,'<p>sdg</p>','20170424100124','20170424100124');
INSERT INTO `zh_content` (`id`,`content`,`add_time`,`last_time`) VALUES (20,'<p>fghjjjjjjjjjjjjjjjjjjjjjjjjjjj</p>','20170424010604','20170424092102');
INSERT INTO `zh_content` (`id`,`content`,`add_time`,`last_time`) VALUES (24,'','20170424100210','20170424100210');
INSERT INTO `zh_content` (`id`,`content`,`add_time`,`last_time`) VALUES (25,'','20170424100233','20170424100233');
INSERT INTO `zh_content` (`id`,`content`,`add_time`,`last_time`) VALUES (26,'','20170424100253','20170424100253');
INSERT INTO `zh_content` (`id`,`content`,`add_time`,`last_time`) VALUES (27,'','20170424100449','20170424100449');
INSERT INTO `zh_content` (`id`,`content`,`add_time`,`last_time`) VALUES (28,'<p>afdsa</p>','20170424100502','20170424100502');
INSERT INTO `zh_content` (`id`,`content`,`add_time`,`last_time`) VALUES (29,'<p>rtu</p>','20170424100540','20170424100540');
INSERT INTO `zh_content` (`id`,`content`,`add_time`,`last_time`) VALUES (30,'<p>sdgsdg</p>','20170424100650','20170424100650');
INSERT INTO `zh_content` (`id`,`content`,`add_time`,`last_time`) VALUES (31,'<p>sdfsdf</p>','20170424100948','20170424101940');
INSERT INTO `zh_content` (`id`,`content`,`add_time`,`last_time`) VALUES (32,'<p>你好</p>','20170424103526','20170424110746');
INSERT INTO `zh_content` (`id`,`content`,`add_time`,`last_time`) VALUES (33,'','20170424103810','20170424103810');
INSERT INTO `zh_content` (`id`,`content`,`add_time`,`last_time`) VALUES (34,'<p>wer</p>','20170424111605','20170428045152');
INSERT INTO `zh_content` (`id`,`content`,`add_time`,`last_time`) VALUES (35,'<p>asd</p>','20170424115056','20170425121345');
INSERT INTO `zh_content` (`id`,`content`,`add_time`,`last_time`) VALUES (36,'<p>sfd</p>','20170424115124','20170425042216');
INSERT INTO `zh_content` (`id`,`content`,`add_time`,`last_time`) VALUES (37,'<p>asd</p>','20170424115144','20170425041717');
INSERT INTO `zh_content` (`id`,`content`,`add_time`,`last_time`) VALUES (38,'<p>asd你好</p>','20170424115206','20170817062337');
INSERT INTO `zh_content` (`id`,`content`,`add_time`,`last_time`) VALUES (44,'<p>asdasd</p>','20170913101906','20170913101906');

INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (1,1,'sysinfo',1,'20161217101010','20161217101010',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (2,1,'globalconf',1,'20161217101010','20161217101010',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (3,1,'dbcopy',1,'20161217101010','20161217101010',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (4,1,'dbrestore',1,'20161217101010','20161217101010',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (5,1,'addgroup',1,'20161217101010','20161217101010',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (6,1,'editgroup',1,'20161217101010','20161217101010',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (7,1,'adduser',1,'20161217101010','20161217101010',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (8,1,'edituser',1,'20161217101010','20161217101010',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (82,34,'sysinfo',1,'20161218084323','20161218084323',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (83,34,'globalconf',0,'20161218084323','20161218084323',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (84,34,'dbcopy',0,'20161218084323','20161218084323',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (85,34,'dbrestore',0,'20161218084323','20161218084323',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (86,34,'addgroup',0,'20161218084323','20161218084323',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (87,34,'editgroup',0,'20161218084323','20161218084323',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (88,34,'adduser',1,'20161218084323','20161218084323',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (89,34,'edituser',1,'20161218084323','20161218084323',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (90,35,'sysinfo',1,'20161218084536','20161218084536',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (91,35,'globalconf',0,'20161218084536','20161218084536',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (92,35,'dbcopy',0,'20161218084536','20161218084536',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (93,35,'dbrestore',0,'20161218084536','20161218084536',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (94,35,'addgroup',0,'20161218084536','20161218084536',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (95,35,'editgroup',0,'20161218084536','20161218084536',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (96,35,'adduser',1,'20161218084536','20161218084536',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (97,35,'edituser',1,'20161218084536','20161218084536',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (98,36,'sysinfo',1,'20161218084554','20161218084554',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (99,36,'globalconf',0,'20161218084554','20161218084554',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (100,36,'dbcopy',0,'20161218084554','20161218084554',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (101,36,'dbrestore',0,'20161218084554','20161218084554',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (102,36,'addgroup',0,'20161218084554','20161218084554',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (103,36,'editgroup',0,'20161218084554','20161218084554',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (104,36,'adduser',1,'20161218084554','20161218084554',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (105,36,'edituser',1,'20161218084554','20161218084554',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (106,1,'addclassify',1,'20161218084554','20161218084554',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (107,1,'editclassify',1,'20161218084554','20161218084554',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (108,1,'addarticle',1,'20161218084554','20161218084554',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (109,1,'editarticle',1,'20161218084554','20161218084554',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (412,61,'editarticle',0,'20170428051814','20170428051814',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (411,61,'addarticle',1,'20170428051814','20170428051814',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (410,61,'editclassify',0,'20170428051814','20170428051814',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (409,61,'addclassify',0,'20170428051814','20170428051814',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (408,61,'edituser',0,'20170428051814','20170428051814',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (407,61,'adduser',0,'20170428051814','20170428051814',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (406,61,'editgroup',0,'20170428051814','20170428051814',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (405,61,'addgroup',0,'20170428051814','20170428051814',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (404,61,'dbrestore',0,'20170428051814','20170428051814',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (403,61,'dbcopy',0,'20170428051814','20170428051814',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (402,61,'globalconf',0,'20170428051814','20170428051814',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (401,61,'sysinfo',0,'20170428051814','20170428051814',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (413,1,'addnav',0,'20170428051814','20170428051814',1);
INSERT INTO `zh_site_access` (`id`,`user_group_id`,`site_nav_mark`,`access`,`add_time`,`last_time`,`disable`) VALUES (414,1,'editnav',0,'20170428051814','20170428051814',1);

INSERT INTO `zh_site_config` (`id`,`title`,`keywords`,`description`,`copy`,`address`,`phone`,`email`,`records`,`add_time`,`last_time`,`disable`) VALUES (1,'qwe1','qwe2','qwe','qwe','qwe','110',NULL,'qwe','20161212101010','20171005093048',1);

INSERT INTO `zh_site_nav` (`id`,`pid`,`depth`,`name`,`link`,`mark`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (1,0,'0','系统配置','','','20161212101010','20170703060509',1,1);
INSERT INTO `zh_site_nav` (`id`,`pid`,`depth`,`name`,`link`,`mark`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (2,1,'0-1','系统信息','#!/sysinfo','sysinfo','20161212101010','20161212101010',0,1);
INSERT INTO `zh_site_nav` (`id`,`pid`,`depth`,`name`,`link`,`mark`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (3,1,'0-1','全局配置','#!/globalconf','globalconf','20161212101010','20161212101010',0,1);
INSERT INTO `zh_site_nav` (`id`,`pid`,`depth`,`name`,`link`,`mark`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (4,0,'0','数据库管理','','','20161212101010','20161212101010',2,1);
INSERT INTO `zh_site_nav` (`id`,`pid`,`depth`,`name`,`link`,`mark`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (5,4,'0-4','数据库备份','#!/dbcopy','dbcopy','20161212101010','20161212101010',0,1);
INSERT INTO `zh_site_nav` (`id`,`pid`,`depth`,`name`,`link`,`mark`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (6,4,'0-4','数据库还原','#!/dbrestore','dbrestore','20161212101010','20161212101010',0,1);
INSERT INTO `zh_site_nav` (`id`,`pid`,`depth`,`name`,`link`,`mark`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (7,0,'0','用户组管理','','','20161212101010','20161212101010',3,1);
INSERT INTO `zh_site_nav` (`id`,`pid`,`depth`,`name`,`link`,`mark`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (8,7,'0-7','添加用户组','#!/addgroup','addgroup','20161212101010','20161212101010',0,1);
INSERT INTO `zh_site_nav` (`id`,`pid`,`depth`,`name`,`link`,`mark`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (9,7,'0-7','编辑用户组','#!/editgroup','editgroup','20161212101010','20161212101010',0,1);
INSERT INTO `zh_site_nav` (`id`,`pid`,`depth`,`name`,`link`,`mark`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (10,0,'0','用户管理','','','20161212101010','20161212101010',4,1);
INSERT INTO `zh_site_nav` (`id`,`pid`,`depth`,`name`,`link`,`mark`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (11,10,'0-10','添加用户','#!/adduser','adduser','20161212101010','20161212101010',0,1);
INSERT INTO `zh_site_nav` (`id`,`pid`,`depth`,`name`,`link`,`mark`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (12,10,'0-10','编辑用户','#!/edituser','edituser','20161212101010','20161212101010',0,1);
INSERT INTO `zh_site_nav` (`id`,`pid`,`depth`,`name`,`link`,`mark`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (13,0,'0','分类管理','','','20161212101010','20161212101010',5,1);
INSERT INTO `zh_site_nav` (`id`,`pid`,`depth`,`name`,`link`,`mark`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (14,13,'0-13','添加分类','#!/addclassify','addclassify','20161212101010','20161212101010',0,1);
INSERT INTO `zh_site_nav` (`id`,`pid`,`depth`,`name`,`link`,`mark`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (15,13,'0-13','编辑分类','#!/editclassify','editclassify','20161212101010','20161212101010',0,1);
INSERT INTO `zh_site_nav` (`id`,`pid`,`depth`,`name`,`link`,`mark`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (16,0,'0','文章管理','','','20161212101010','20161212101010',6,1);
INSERT INTO `zh_site_nav` (`id`,`pid`,`depth`,`name`,`link`,`mark`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (17,16,'0-16','添加文章','#!/addarticle','addarticle','20161212101010','20161212101010',0,1);
INSERT INTO `zh_site_nav` (`id`,`pid`,`depth`,`name`,`link`,`mark`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (18,16,'0-16','编辑文章','#!/editarticle','editarticle','20161212101010','20161212101010',0,1);
INSERT INTO `zh_site_nav` (`id`,`pid`,`depth`,`name`,`link`,`mark`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (19,0,'0','建站管理','','','20161212101010','20170703063428',99,1);
INSERT INTO `zh_site_nav` (`id`,`pid`,`depth`,`name`,`link`,`mark`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (20,19,'0-19','添加导航','#!/addnav','addnav','20161212101010','20161212101010',0,1);
INSERT INTO `zh_site_nav` (`id`,`pid`,`depth`,`name`,`link`,`mark`,`add_time`,`last_time`,`order_list`,`disable`) VALUES (21,19,'0-19','编辑导航','#!/editnav','editnav','20161212101010','20161212101010',0,1);

INSERT INTO `zh_user` (`id`,`username`,`password`,`email`,`add_time`,`last_sign_time`,`disable`,`user_group_id`) VALUES (1,'qwe','76d80224611fc919a5d54f0ff9fba446','qwe@163.com','20161212101010','20171005093313',1,1);
INSERT INTO `zh_user` (`id`,`username`,`password`,`email`,`add_time`,`last_sign_time`,`disable`,`user_group_id`) VALUES (16,'jiaozhiye','d84ffcb19754f9f793579561b3e4c499','jiaozhiye@163.com','20161218084736','20161218091957',1,1);
INSERT INTO `zh_user` (`id`,`username`,`password`,`email`,`add_time`,`last_sign_time`,`disable`,`user_group_id`) VALUES (17,'yuhuan','e10adc3949ba59abbe56e057f20f883e','yuhuan@163.com','20161218084832','20161218084832',1,34);
INSERT INTO `zh_user` (`id`,`username`,`password`,`email`,`add_time`,`last_sign_time`,`disable`,`user_group_id`) VALUES (18,'lvmeng','efe6398127928f1b2e9ef3207fb82663','123456@qq.com','20161218084948','20170314073353',1,35);
INSERT INTO `zh_user` (`id`,`username`,`password`,`email`,`add_time`,`last_sign_time`,`disable`,`user_group_id`) VALUES (19,'lvvjia','e10adc3949ba59abbe56e057f20f883e','lvjia@163.com','20161218091310','20161218092842',1,36);

INSERT INTO `zh_user_group` (`id`,`name`,`description`,`add_time`,`last_time`,`disable`) VALUES (1,'超级管理员','超级管理员','20161212101010','20170830045159',1);
INSERT INTO `zh_user_group` (`id`,`name`,`description`,`add_time`,`last_time`,`disable`) VALUES (34,'网站编辑','网站资料的上传','20161218084323','20161218084323',1);
INSERT INTO `zh_user_group` (`id`,`name`,`description`,`add_time`,`last_time`,`disable`) VALUES (35,'编辑部1','网络编辑','20161218084536','20161218092708',1);
INSERT INTO `zh_user_group` (`id`,`name`,`description`,`add_time`,`last_time`,`disable`) VALUES (36,'编辑部2','网络编辑','20161218084554','20170428045219',0);
INSERT INTO `zh_user_group` (`id`,`name`,`description`,`add_time`,`last_time`,`disable`) VALUES (61,'编辑部3','编辑部3','20170428051814','20170428051814',1);