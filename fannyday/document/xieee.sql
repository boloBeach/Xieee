/*
Navicat MySQL Data Transfer

Source Server         : 172.17.111.191-mysql
Source Server Version : 50621
Source Host           : 172.17.111.191:3306
Source Database       : xieee

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-02-03 14:21:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for about_as
-- ----------------------------
DROP TABLE IF EXISTS `about_as`;
CREATE TABLE `about_as` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1024) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of about_as
-- ----------------------------
INSERT INTO `about_as` VALUES ('1', '张兵，孙武斌，李华');

-- ----------------------------
-- Table structure for blogroll
-- ----------------------------
DROP TABLE IF EXISTS `blogroll`;
CREATE TABLE `blogroll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1024) NOT NULL DEFAULT '',
  `url` varchar(1024) NOT NULL DEFAULT 'http://www.baidu.com',
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_delete` char(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blogroll
-- ----------------------------
INSERT INTO `blogroll` VALUES ('1', '百度贴吧', 'http://tieba.baidu.com/', '2015-01-12 15:48:03', '1');

-- ----------------------------
-- Table structure for catalog
-- ----------------------------
DROP TABLE IF EXISTS `catalog`;
CREATE TABLE `catalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1024) NOT NULL DEFAULT '',
  `parent_catalog_id` int(11) NOT NULL DEFAULT '0',
  `url` varchar(1024) NOT NULL DEFAULT '',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_delete` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of catalog
-- ----------------------------
INSERT INTO `catalog` VALUES ('1', '首页', '0', 'showIndex', '2015-01-02 17:00:31', '1');
INSERT INTO `catalog` VALUES ('2', '美女', '0', 'showIndex', '2015-01-12 15:22:57', '1');
INSERT INTO `catalog` VALUES ('3', '今日囧图', '0', 'showIndex', '2015-01-28 10:22:33', '1');
INSERT INTO `catalog` VALUES ('4', '搞笑gif', '0', 'showIndex', '2015-01-28 10:22:44', '1');
INSERT INTO `catalog` VALUES ('5', '专业吐槽', '0', 'showIndex', '2015-01-28 10:22:56', '1');
INSERT INTO `catalog` VALUES ('6', '恶搞ps', '0', 'showIndex', '2015-01-28 10:23:02', '1');
INSERT INTO `catalog` VALUES ('7', '搞笑漫画', '0', 'showIndex', '2015-01-28 10:23:10', '1');

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `resource_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `collect_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for commont
-- ----------------------------
DROP TABLE IF EXISTS `commont`;
CREATE TABLE `commont` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `ip` varchar(32) DEFAULT '',
  `address` varchar(128) DEFAULT '',
  `content` varchar(2000) DEFAULT '',
  `top_count` int(11) NOT NULL DEFAULT '1',
  `down_count` int(11) NOT NULL DEFAULT '0',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_delete` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `commont_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of commont
-- ----------------------------
INSERT INTO `commont` VALUES ('1', '1', '1', '192.168.1.1', '成都市', '太搞笑了。真的。', '1', '0', '2015-01-02 17:02:51', '1');

-- ----------------------------
-- Table structure for contanct
-- ----------------------------
DROP TABLE IF EXISTS `contanct`;
CREATE TABLE `contanct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `constact_name` varchar(1024) NOT NULL DEFAULT '',
  `email` varchar(1024) NOT NULL DEFAULT 'bolobeach@gmail.com',
  `telphone` varchar(512) NOT NULL DEFAULT '',
  `address` varchar(128) NOT NULL DEFAULT '',
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_delete` char(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contanct
-- ----------------------------
INSERT INTO `contanct` VALUES ('1', '张兵', 'bolobeach@gmail.com', '110', '四川省成都市', '2015-01-12 15:50:57', '1');

-- ----------------------------
-- Table structure for cooperation
-- ----------------------------
DROP TABLE IF EXISTS `cooperation`;
CREATE TABLE `cooperation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1024) NOT NULL DEFAULT '',
  `url` varchar(1024) NOT NULL DEFAULT 'http://www.baidu.com',
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_delete` char(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cooperation
-- ----------------------------
INSERT INTO `cooperation` VALUES ('1', '百度', 'http://www.baidu.com', '2015-01-12 15:51:43', '1');

-- ----------------------------
-- Table structure for pageurl
-- ----------------------------
DROP TABLE IF EXISTS `pageurl`;
CREATE TABLE `pageurl` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `url` varchar(2000) DEFAULT NULL,
  `title` varchar(2000) DEFAULT '',
  `is_delete` char(255) NOT NULL DEFAULT '1',
  `modify-time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42584 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pageurl
-- ----------------------------
INSERT INTO `pageurl` VALUES ('41394', 'http://www.lebazi.com/n/20150109/8916.html', '唐馨baby福利自拍私房照诱惑写真套图全集', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41395', 'http://www.lebazi.com/n/20150109/8913.html', '沫晓伊baby丰乳翘臀性感透视内衣私房写真照', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41396', 'http://www.lebazi.com/n/20150109/8912.html', '超性感女模沈璐Lulu露巨乳拍足球宝贝写真照 附内衣照', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41397', 'http://www.lebazi.com/n/20150109/8911.html', '推女郎陈美琳-Mandy微博晒性感半裸自拍私房照', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41398', 'http://www.lebazi.com/n/20150109/8910.html', '推女郎曾水-Raeka粉色兔女郎性感写真照挑逗你', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41399', 'http://www.lebazi.com/n/20150109/8909.html', '微博红人G奶波霸女皇赵潇潇黑色情趣内衣诱惑图片合集', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41400', 'http://www.lebazi.com/n/20150109/8908.html', '推女郎乔雅冰Baby全裸丁字裤火辣性感诱惑照写真', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41401', 'http://www.lebazi.com/n/20150106/8907.html', '爱与欲望之学园邪恶漫画邪恶篇：第一次看到', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41402', 'http://www.lebazi.com/n/20130815/5638.html', '成人gif_美女脱光衣服gif：偶买噶的，我快受不住了', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41403', 'http://www.lebazi.com/n/20130526/485.html', '这下给杯具了！', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41404', 'http://www.lebazi.com/n/20130524/301.html', '美女的脚上功夫真棒啊！', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41405', 'http://www.lebazi.com/n/20130706/4097.html', '邪恶漫画：好悲剧的小章鱼，其实这女的是熟客了~', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41406', 'http://www.lebazi.com/n/20130804/5326.html', '美女翻转gif动图：动作一气呵成，妹子好功夫', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41407', 'http://www.lebazi.com/n/20131112/6495.html', '优酷爆笑视频：大话2之神秘法宝篇', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41408', 'http://www.lebazi.com/n/20140815/8280.html', '日本h动漫美女漫画全集：波涛胸涌异常销魂图', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41409', 'http://www.lebazi.com/n/20130622/3574.html', '尼玛，警察大哥，你这是什么技能？', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41410', 'http://www.lebazi.com/n/20150106/8898.html', '各种爆笑内涵gif动态图大全：总有一张让你笑！', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41411', 'http://www.lebazi.com/n/20150106/8897.html', '美女装蜡像整人gif动图：美女，你那么调皮家里人造吗？', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41412', 'http://www.lebazi.com/n/20140309/7465.html', '色你妹成人gif邪恶动态图精选：男人xxoo女人的动态图', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41413', 'http://www.lebazi.com/n/20140822/8380.html', '看了还想看的gif邪恶动态图：又黄又色的邪恶gif动态图片出处', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41414', 'http://www.lebazi.com/n/20140729/8160.html', '色你妹gif动态邪恶图片_xxoo成人没内涵邪恶gif动态：各种男女xo成人gif动态图片 屌丝准备纸巾吧', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41415', 'http://www.lebazi.com/n/20140808/8209.html', '又黄又色波多野结衣xxoo成人邪恶没内涵gif动图：宅男撸管必备福利图片（第十三期）', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41416', 'http://www.lebazi.com/n/20140819/8370.html', '又黄又色邪恶成人gif动态图片：看了还想看的gif邪恶动态图', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41417', 'http://www.lebazi.com/n/20141020/8660.html', '乐吧子邪恶动态图大全：日本av女优gif出处番号（第二期）', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41418', 'http://www.lebazi.com/n/20140302/7338.html', '2014成人gif邪恶美女gif动图精选', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41419', 'http://www.lebazi.com/n/20140813/8263.html', '男女激情叉叉邪恶内涵gif动态图精选_可以拿来撸的邪恶内涵gif动态图片：你个混蛋怎么那么慢', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41420', 'http://www.lebazi.com/n/20140805/8193.html', '27报邪恶内涵诱惑h美女真人秀Gif动态图片合集：真人秀在上演多赞多种（第十三期）', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41421', 'http://www.lebazi.com/n/20140825/8391.html', '又黄又色邪恶成人邪恶gif动态图片出处：看了还想看的gif邪恶动态图', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41422', 'http://www.lebazi.com/n/20140804/8192.html', '邪恶成人xxoo真人没内涵搞笑gif动态图精选：美女我知道你喜欢这样的（第十二期）', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41423', 'http://www.lebazi.com/n/20141022/8666.html', '乐吧子邪恶动态图出处大全：屌丝福利之男女成人邪恶gif动态图 看的我真的是醉了', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41424', 'http://www.lebazi.com/n/20140926/8562.html', '岛国av女优邪恶gif动态图片出处：美女邪恶gif动态图片出处（第二期）', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41425', 'http://www.lebazi.com/n/20140713/8015.html', '又黄又色邪恶成人gif搞笑动态图片：宅男撸管必备福利图片（第1期）', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41426', 'http://www.lebazi.com/n/20141016/8645.html', '岛国东京热xxoo成人邪恶gif动态图出处番号大全：宅男撸管必备福利图片', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41427', 'http://www.lebazi.com/n/20141102/8692.html', '乐吧子邪恶内涵gif动态图大全：日本最红av女优gif番号出处（第三期）', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41428', 'http://www.lebazi.com/n/20140813/8259.html', '男女激情内涵邪恶gif动态图精选：各种成人诱惑gif动态图片 宅男撸管必备合集', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41429', 'http://www.lebazi.com/n/20141211/8859.html', '色色男与色妹妹gif出处：真上火3分钟也敢和老娘出来约炮！', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41430', 'http://www.lebazi.com/n/20140520/7746.html', '色你妹邪恶gif动态图片大全：各种男女xxoo激情无下限gif图片~', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41431', 'http://www.lebazi.com/n/20140828/8413.html', '日本二次元h性感动漫美少女：爆乳动漫美女比基尼白嫩肌肤图集', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41432', 'http://www.lebazi.com/n/20140801/8182.html', '色小组思春期少女漫画_大吴哥邪恶少女h漫画：（剧场的男女）今天介绍那男的怎么样？', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41433', 'http://www.lebazi.com/n/20130822/5789.html', '大吴哥娱乐邪恶漫画：神偷伤不起_邪恶漫画色系图片', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41434', 'http://www.lebazi.com/n/20131126/6745.html', '邪恶漫画不知火舞：屌丝注定要跟右手做一辈子好盆友_爱神之箭', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41435', 'http://www.lebazi.com/n/20130726/4910.html', '色系军团漫画之好神仙：谢谢神仙爷爷帮我去除了黑点', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41436', 'http://www.lebazi.com/n/20141210/8832.html', '色小组二次元h邪恶漫画：旅馆的选择', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41437', 'http://www.lebazi.com/n/20130707/4121.html', '色系军团漫画：相信欧巴，你个傻蛋，注定单身啊`', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41438', 'http://www.lebazi.com/n/20140909/8461.html', '大吴哥邪恶少女漫画_少女h漫画邪恶篇：囚禁系列', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41439', 'http://www.lebazi.com/n/20140618/7841.html', '邪恶漫画爱丽丝学园_无翼鸟邪恶漫画欲望：快速擦皮鞋', '1', '2015-01-28 12:34:46');
INSERT INTO `pageurl` VALUES ('41440', 'http://www.lebazi.com8916_2.html', '下一页', '1', '2015-01-28 12:35:00');
INSERT INTO `pageurl` VALUES ('41441', 'http://www.lebazi.com/n/20140813/8257.html', '梦龙y传系列_梦龙y传漫画全集第34话：奖励篇', '1', '2015-01-28 12:35:00');
INSERT INTO `pageurl` VALUES ('41442', 'http://www.lebazi.com/n/20130714/4478.html', '美女楼梯扭屁股gif动图', '1', '2015-01-28 12:35:00');
INSERT INTO `pageurl` VALUES ('41443', 'http://www.lebazi.com/n/20130713/4365.html', '美女gif：PP好滑呀', '1', '2015-01-28 12:35:00');
INSERT INTO `pageurl` VALUES ('41444', 'http://www.lebazi.com/n/20130615/1143.html', '有其父必有其女，真是好有爱的两父女~', '1', '2015-01-28 12:35:00');
INSERT INTO `pageurl` VALUES ('41445', 'http://www.lebazi.com/n/20140323/7591.html', '没内涵邪恶gif：小孩子看到大胸很惊讶gif动图', '1', '2015-01-28 12:35:00');
INSERT INTO `pageurl` VALUES ('41446', 'http://www.lebazi.com/n/20130724/4810.html', '胖MM的烦恼gif：有些事情像身上的肉肉一样总是甩不掉', '1', '2015-01-28 12:35:00');
INSERT INTO `pageurl` VALUES ('41447', 'http://www.lebazi.com/n/20140209/7048.html', '俩妹子恶搞xxoo姿势gif动图：你这个疯子，放开那个妹纸，让我来！', '1', '2015-01-28 12:35:00');
INSERT INTO `pageurl` VALUES ('41448', 'http://www.lebazi.com/n/20130803/5187.html', '雷人gif动图：好大的勺子啊', '1', '2015-01-28 12:35:00');
INSERT INTO `pageurl` VALUES ('41449', 'http://www.lebazi.com/n/20130724/4805.html', '呼啦圈的创意玩法gif动图', '1', '2015-01-28 12:35:00');
INSERT INTO `pageurl` VALUES ('41450', 'http://www.lebazi.com/n/20130611/1011.html', '哇，这水好好玩的~~', '1', '2015-01-28 12:35:00');
INSERT INTO `pageurl` VALUES ('41451', 'http://www.lebazi.com/n/20140706/8010.html', '色系军团邪恶漫画_大吴哥娱乐邪恶漫画：对自由的意志', '1', '2015-01-28 12:35:00');
INSERT INTO `pageurl` VALUES ('41452', 'http://www.lebazi.com/n/20130907/5957.html', '18进禁邪恶漫画：检查门_不知火舞邪恶漫画集', '1', '2015-01-28 12:35:00');
INSERT INTO `pageurl` VALUES ('41453', 'http://www.lebazi.com/n/20130519/52.html', '邪恶漫画：师傅和鼻孔都悲剧了', '1', '2015-01-28 12:35:00');
INSERT INTO `pageurl` VALUES ('41454', 'http://www.lebazi.com/n/20140727/8151.html', '少女漫画邪恶篇_无翼鸟一库邪恶h漫画：电车里的双飞', '1', '2015-01-28 12:35:00');
INSERT INTO `pageurl` VALUES ('41455', 'http://www.lebazi.com/n/20140623/7879.html', '乐张不入妖妖小精漫画全集_妖妖小精色系军团：稻草人施法', '1', '2015-01-28 12:35:00');
INSERT INTO `pageurl` VALUES ('41456', 'http://www.lebazi.com8913_2.html', '下一页', '1', '2015-01-28 12:35:01');
INSERT INTO `pageurl` VALUES ('41457', 'http://www.lebazi.com8912_2.html', '下一页', '1', '2015-01-28 12:35:02');
INSERT INTO `pageurl` VALUES ('41458', 'http://www.lebazi.com8911_2.html', '下一页', '1', '2015-01-28 12:35:03');
INSERT INTO `pageurl` VALUES ('41459', 'http://www.lebazi.com8910_2.html', '下一页', '1', '2015-01-28 12:35:04');
INSERT INTO `pageurl` VALUES ('41460', 'http://www.lebazi.com8909_2.html', '下一页', '1', '2015-01-28 12:35:05');
INSERT INTO `pageurl` VALUES ('41461', 'http://www.lebazi.com8908_2.html', '下一页', '1', '2015-01-28 12:35:06');
INSERT INTO `pageurl` VALUES ('41462', 'http://www.lebazi.com/n/20150106/8895.html', '超美嫩模@金小小猫儿圣诞私房照写真全集 附其它生活写真照', '1', '2015-01-28 12:35:06');
INSERT INTO `pageurl` VALUES ('41463', 'http://www.lebazi.com8907_2.html', '下一页', '1', '2015-01-28 12:35:07');
INSERT INTO `pageurl` VALUES ('41464', 'http://www.lebazi.com/n/20150106/8906.html', '二次元h邪恶漫画：可歪曲的手机', '1', '2015-01-28 12:35:07');
INSERT INTO `pageurl` VALUES ('41465', 'http://www.lebazi.com/n/20130815/5637.html', '下一页', '1', '2015-01-28 12:35:07');
INSERT INTO `pageurl` VALUES ('41466', 'http://www.lebazi.com/n/20130815/5639.html', '恶搞金正恩奥巴马搞笑gif动态图片', '1', '2015-01-28 12:35:07');
INSERT INTO `pageurl` VALUES ('41467', 'http://www.lebazi.com/n/20140326/7631.html', '老湿视频作品系列全集_老湿视频不吐不快之完爆一代宗师', '1', '2015-01-28 12:35:07');
INSERT INTO `pageurl` VALUES ('41468', 'http://www.lebazi.com/n/20130716/4592.html', '体操MM露内裤gif动图', '1', '2015-01-28 12:35:07');
INSERT INTO `pageurl` VALUES ('41469', 'http://www.lebazi.com/n/20131103/6222.html', '2B青年成人gif：捡肥皂是如何炼成的', '1', '2015-01-28 12:35:07');
INSERT INTO `pageurl` VALUES ('41470', 'http://www.lebazi.com/n/20130916/6004.html', '性感美女和丝袜美女你们更加喜欢哪种呢', '1', '2015-01-28 12:35:07');
INSERT INTO `pageurl` VALUES ('41471', 'http://www.lebazi.com/n/20140829/8423.html', '高挑清新软妹子性感翘臀美女撸管福利图：黑丝丝教师爆乳翘臀图集', '1', '2015-01-28 12:35:07');
INSERT INTO `pageurl` VALUES ('41472', 'http://www.lebazi.com/n/20140818/8331.html', '色系军团蚂蚁与蜂蜜邪恶系列漫画全集：第一集 证明清白', '1', '2015-01-28 12:35:07');
INSERT INTO `pageurl` VALUES ('41473', 'http://www.lebazi.com/n/20130610/958.html', '杰伦好无辜!', '1', '2015-01-28 12:35:07');
INSERT INTO `pageurl` VALUES ('41474', 'http://www.lebazi.com/n/20130803/5213.html', '邪恶漫画之新花样：挡住黑奶嘴继续撸', '1', '2015-01-28 12:35:07');
INSERT INTO `pageurl` VALUES ('41475', 'http://www.lebazi.com/n/20131009/6067.html', '美女买东西遭2B青年千年杀爆菊gif动图', '1', '2015-01-28 12:35:07');
INSERT INTO `pageurl` VALUES ('41476', 'http://www.lebazi.com/n/20130613/1060.html', '真的是一个好注意~~', '1', '2015-01-28 12:35:07');
INSERT INTO `pageurl` VALUES ('41477', 'http://www.lebazi.com/n/20141012/8620.html', '韩国邪恶漫画“人鱼公主传”全集连载：第20集', '1', '2015-01-28 12:35:07');
INSERT INTO `pageurl` VALUES ('41478', 'http://www.lebazi.com/n/20130818/5728.html', '邪恶漫画色系图片：夫妇的愿望_初音未来h邪恶漫画', '1', '2015-01-28 12:35:07');
INSERT INTO `pageurl` VALUES ('41479', 'http://www.lebazi.com/n/20140812/8229.html', '梦龙y传系列_梦龙y传漫画全集第7话：没有钱', '1', '2015-01-28 12:35:07');
INSERT INTO `pageurl` VALUES ('41480', 'http://www.lebazi.com/n/20131115/6525.html', '不知火舞邪恶内涵漫画集：次品_错有错着啊，长得猥琐的肉棒很有市场的', '1', '2015-01-28 12:35:07');
INSERT INTO `pageurl` VALUES ('41481', 'http://www.lebazi.com/n/20140208/7033.html', '色系军团邪恶漫画：金字塔不要低头', '1', '2015-01-28 12:35:07');
INSERT INTO `pageurl` VALUES ('41482', 'http://www.lebazi.com/n/20130526/484.html', '下一页', '1', '2015-01-28 12:35:08');
INSERT INTO `pageurl` VALUES ('41483', 'http://www.lebazi.com/n/20130526/486.html', '你妈逼的，对，是他妈逼的', '1', '2015-01-28 12:35:08');
INSERT INTO `pageurl` VALUES ('41484', 'http://www.lebazi.com/n/20130615/1122.html', '这一定是个女的，下手也太狠了~', '1', '2015-01-28 12:35:08');
INSERT INTO `pageurl` VALUES ('41485', 'http://www.lebazi.com/n/20130610/965.html', '男人瞬间变女人，如果不看头的话', '1', '2015-01-28 12:35:08');
INSERT INTO `pageurl` VALUES ('41486', 'http://www.lebazi.com/n/20140730/8162.html', '少女漫画h邪恶篇_色小组二次元h邪恶漫画：双飞混浴', '1', '2015-01-28 12:35:08');
INSERT INTO `pageurl` VALUES ('41487', 'http://www.lebazi.com/n/20130528/658.html', '搞笑视频：各国人看“两女一杯，两女一指”大全！', '1', '2015-01-28 12:35:08');
INSERT INTO `pageurl` VALUES ('41488', 'http://www.lebazi.com/n/20130802/5148.html', '喵星人调戏小白兔gif动图：小白兔好萌啊', '1', '2015-01-28 12:35:08');
INSERT INTO `pageurl` VALUES ('41489', 'http://www.lebazi.com/n/20140706/8004.html', '二次元邪恶漫画_日本美女邪恶漫画：特卖品', '1', '2015-01-28 12:35:08');
INSERT INTO `pageurl` VALUES ('41490', 'http://www.lebazi.com/n/20140715/8080.html', '暴走漫画全集_暴走漫画之糗事动漫：少年不知精珍贵，老来望X空流泪', '1', '2015-01-28 12:35:08');
INSERT INTO `pageurl` VALUES ('41491', 'http://www.lebazi.com/n/20130726/4903.html', '美女搞笑翻筋斗gif动图', '1', '2015-01-28 12:35:08');
INSERT INTO `pageurl` VALUES ('41492', 'http://www.lebazi.com/n/20141226/8884.html', '爱与欲望之学园邪恶h漫画：温泉池无套直入', '1', '2015-01-28 12:35:08');
INSERT INTO `pageurl` VALUES ('41493', 'http://www.lebazi.com/n/20141017/8649.html', '色小组二次元h邪恶漫画_大吴哥邪恶少女h漫画：最后之手', '1', '2015-01-28 12:35:08');
INSERT INTO `pageurl` VALUES ('41494', 'http://www.lebazi.com/n/20130718/4670.html', '色系军团漫画：会说话的小熊的终极用途', '1', '2015-01-28 12:35:08');
INSERT INTO `pageurl` VALUES ('41495', 'http://www.lebazi.com/n/20150106/8902.html', '色小组二次元h邪恶漫画：新婚之痛！', '1', '2015-01-28 12:35:08');
INSERT INTO `pageurl` VALUES ('41496', 'http://www.lebazi.com/n/20140906/8456.html', '披萨恋恋曲少女漫画邪恶篇153-160章节：马上受死吧！', '1', '2015-01-28 12:35:08');
INSERT INTO `pageurl` VALUES ('41497', 'http://www.lebazi.com/n/20140626/7942.html', '色小组二次元h邪恶漫画_日本少女h邪恶漫画：性感的特洛伊木马', '1', '2015-01-28 12:35:08');
INSERT INTO `pageurl` VALUES ('41498', 'http://www.lebazi.com/n/20130524/300.html', '下一页', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41499', 'http://www.lebazi.com/n/20130524/302.html', '向消防员童鞋致敬!!!', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41500', 'http://www.lebazi.com/n/20130528/627.html', '小女生真可爱啊，不过是不是做那个什么。。的。', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41501', 'http://www.lebazi.com/n/20130525/471.html', '奶奶，你是肿么了?', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41502', 'http://www.lebazi.com/n/20140208/7037.html', '色系军团邪恶漫画：品尝师', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41503', 'http://www.lebazi.com/n/20140817/8297.html', '邪恶漫画色系军团寡妇三代漫画第12集：获救？', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41504', 'http://www.lebazi.com/n/20130528/661.html', '史上最没节操的农药广告！导演，您真的确定这单单只是农药广告？', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41505', 'http://www.lebazi.com/n/20130619/3496.html', '啊~尼玛，吓死我了~小妹妹帮我也拍张照呗，我们合影好不~', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41506', 'http://www.lebazi.com/n/20130525/334.html', '哈哈...看到这样的女的要小心', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41507', 'http://www.lebazi.com/n/20131212/6876.html', '男人搞基当众亲吻gif动态图', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41508', 'http://www.lebazi.com/n/20131129/6794.html', 'QQ表情:调皮的胎儿', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41509', 'http://www.lebazi.com/n/20140715/8046.html', '无翼鸟一库邪恶漫画_日本邪恶h漫画：如同习惯', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41510', 'http://www.lebazi.com/n/20140726/8139.html', '色小组二次元h邪恶漫画_韩国邪恶h漫画：丰满的臀部', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41511', 'http://www.lebazi.com/n/20140715/8025.html', '日本少女h邪恶漫画_无翼鸟一库邪恶漫画：用途', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41512', 'http://www.lebazi.com/n/20130815/5678.html', '色小组漫画全集_大吴哥娱乐邪恶漫画之办法', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41513', 'http://www.lebazi.com/n/20131119/6541.html', '色小组邪恶漫画全集：大鼻孔你要干什么，快把裤子穿上_战术', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41514', 'http://www.lebazi.com/n/20130709/4196.html', '邪恶漫画：“应急患者”之女友有吃手指的习惯', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41515', 'http://www.lebazi.com/n/20130706/4096.html', '下一页', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41516', 'http://www.lebazi.com/n/20130706/4098.html', '邪恶漫画：磨蹭原来是有预谋的~', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41517', 'http://www.lebazi.com/n/20140807/8200.html', '日本少女h邪恶漫画：二次元动漫美女与男友激情拥吻翘臀图', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41518', 'http://www.lebazi.com/n/20130524/297.html', '老板,来3个B孕套...老板都吓懵了！', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41519', 'http://www.lebazi.com/n/20130822/5795.html', '搞笑gif：Scream & Shout混音版美女GIF动图大全', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41520', 'http://www.lebazi.com/n/20130815/5681.html', '邪恶漫画色系图片_色小组漫画全集之画像', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41521', 'http://www.lebazi.com/n/20140826/8402.html', '万万没想到优酷搞笑视频第10集：最强选秀王', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41522', 'http://www.lebazi.com/n/20130525/380.html', '我打，我打，我打打打', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41523', 'http://www.lebazi.com/n/20130715/4511.html', '美女脱裤子诱惑gif动图：美女真是好身材', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41524', 'http://www.lebazi.com/n/20130813/5570.html', '熊猫gif动图：粑粑麻麻你们在干嘛，我晕', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41525', 'http://www.lebazi.com/n/20130531/798.html', '小盆友洗澡好happy！', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41526', 'http://www.lebazi.com/n/20140818/8328.html', '土豆《神街访》街头采访爆笑视频：你介意男友第一次不是给你吗？', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41527', 'http://www.lebazi.com/n/20140913/8476.html', '吃果果大作战动漫邪恶少女漫画第9章：降妖', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41528', 'http://www.lebazi.com/n/20130804/5333.html', '18禁漫画之关键时刻：天使你的节操哪儿去了', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41529', 'http://www.lebazi.com/n/20140812/8248.html', '梦龙y传系列_梦龙y传漫画全集第25话：危机中的九尾狐', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41530', 'http://www.lebazi.com/n/20141125/8779.html', '小黄哥爱看少女漫画：会长是女仆邪恶篇', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41531', 'http://www.lebazi.com/n/20130530/742.html', '邪恶漫画：之“连续发射”', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41532', 'http://www.lebazi.com/n/20130804/5325.html', '下一页', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41533', 'http://www.lebazi.com/n/20130804/5327.html', '美女喝饮料雷人夸张表情gif动图：姐，你喝的是柠檬吧？', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41534', 'http://www.lebazi.com/n/20140716/8089.html', '微播江湖_配音搞笑视频：耍宝机器人 麻麻我根本停不下来', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41535', 'http://www.lebazi.com/n/20131129/6793.html', 'QQ表情: 今晚找小姐去', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41536', 'http://www.lebazi.com/n/20141201/8803.html', '动漫美女黄漫图片：制服可人姐姐', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41537', 'http://www.lebazi.com/n/20141207/8817.html', '色系动漫超级美少女黄漫图片邪恶篇', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41538', 'http://www.lebazi.com/n/20131103/6230.html', '成人gif内涵图片：人类牙疼的真相', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41539', 'http://www.lebazi.com/n/20140512/7687.html', '内涵漫画色系图片：天然纪念品水赖', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41540', 'http://www.lebazi.com/n/20140616/7794.html', '思春期少女漫画_狂野少女漫画：少女好困扰系列', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41541', 'http://www.lebazi.com/n/20130626/3667.html', '内涵图：冠希哥找女友的标准~~', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41542', 'http://www.lebazi.com/n/20130818/5732.html', '邪恶漫画色系图片：特别的神灯_无翼鸟邪恶漫画全集', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41543', 'http://www.lebazi.com/n/20140620/7868.html', '脑残对话：我去炸了学校，Ma了个巴子！', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41544', 'http://www.lebazi.com/n/20140305/7349.html', '18禁不知火舞邪恶漫画：湿姐的诱惑', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41545', 'http://www.lebazi.com/n/20131126/6728.html', '色系军团不知火舞h吧福利：屌丝们别傻了，你们的女神都让导演用过了_发布会', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41546', 'http://www.lebazi.com/n/20130728/4989.html', '色系军团漫画之怪叔叔你真是有远见呀', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41547', 'http://www.lebazi.com/n/20140808/8211.html', '恋姐倾心少女h漫画之双手捂胸挡不住诱惑：日本动漫h美少女秀情感身材', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41548', 'http://www.lebazi.com/n/20140626/7946.html', '色小组思春期少女漫画_大吴哥邪恶少女h漫画：移动的点', '1', '2015-01-28 12:35:09');
INSERT INTO `pageurl` VALUES ('41549', 'http://www.lebazi.com/n/20131112/6496.html', '搞笑视频笑死人不偿命：打死不说新年快乐！', '1', '2015-01-28 12:35:10');
INSERT INTO `pageurl` VALUES ('41550', 'http://www.lebazi.com/n/20131112/6494.html', '优酷爆笑视频：搞笑的2013微春晚!', '1', '2015-01-28 12:35:10');
INSERT INTO `pageurl` VALUES ('41551', 'http://www.lebazi.com/n/20130811/5491.html', '邪恶漫画之纸的战争', '1', '2015-01-28 12:35:10');
INSERT INTO `pageurl` VALUES ('41552', 'http://www.lebazi.com/n/20130707/4112.html', '下手也太重了，估计这下那人得脑残了', '1', '2015-01-28 12:35:10');
INSERT INTO `pageurl` VALUES ('41553', 'http://www.lebazi.com/n/20130623/3593.html', '我咋感觉这女的有点想王心凌呢？', '1', '2015-01-28 12:35:10');
INSERT INTO `pageurl` VALUES ('41554', 'http://www.lebazi.com/n/20130525/366.html', '哇，是谁的，好香呀！', '1', '2015-01-28 12:35:10');
INSERT INTO `pageurl` VALUES ('41555', 'http://www.lebazi.com/n/20141225/8881.html', '圣诞节美女滑雪福利图：漂亮就是这么任性，有资本啊！', '1', '2015-01-28 12:35:10');
INSERT INTO `pageurl` VALUES ('41556', 'http://www.lebazi.com/n/20130713/4377.html', '好基友gif：好复杂好混乱的关系啊', '1', '2015-01-28 12:35:10');
INSERT INTO `pageurl` VALUES ('41557', 'http://www.lebazi.com/n/20130715/4521.html', '色系军团漫画：那个纹身的家伙是你的前男友是不是？', '1', '2015-01-28 12:35:10');
INSERT INTO `pageurl` VALUES ('41558', 'http://www.lebazi.com/n/20130818/5718.html', '搞笑gif动态图片：原来神兽草泥马也怕猪_gif快手', '1', '2015-01-28 12:35:10');
INSERT INTO `pageurl` VALUES ('41559', 'http://www.lebazi.com/n/20140208/7038.html', '色系军团邪恶漫画：破了个洞', '1', '2015-01-28 12:35:10');
INSERT INTO `pageurl` VALUES ('41560', 'http://www.lebazi.com/n/20130601/926.html', '邪恶漫画：可怜的屌丝，我是来帮助你的天使！', '1', '2015-01-28 12:35:10');
INSERT INTO `pageurl` VALUES ('41561', 'http://www.lebazi.com/n/20140812/8247.html', '梦龙y传系列_梦龙y传漫画全集第24话：交接篇', '1', '2015-01-28 12:35:10');
INSERT INTO `pageurl` VALUES ('41562', 'http://www.lebazi.com/n/20140302/7287.html', '全彩h邪恶漫画日本之邪恶漫画睡美人：哥你是我见过最傻逼的王子', '1', '2015-01-28 12:35:10');
INSERT INTO `pageurl` VALUES ('41563', 'http://www.lebazi.com/n/20140610/7772.html', '少女爱情在线漫画：想要的那味道', '1', '2015-01-28 12:35:10');
INSERT INTO `pageurl` VALUES ('41564', 'http://www.lebazi.com8280_2.html', '下一页', '1', '2015-01-28 12:35:10');
INSERT INTO `pageurl` VALUES ('41565', 'http://www.lebazi.com/n/20140815/8281.html', '色系军团二次元动漫h美少女爆乳图：蜂腰巨乳娇滴诱人', '1', '2015-01-28 12:35:10');
INSERT INTO `pageurl` VALUES ('41566', 'http://www.lebazi.com/n/20140815/8279.html', '色系军团动漫巨乳h美女漫画：床上姿势妖娆动人图集', '1', '2015-01-28 12:35:10');
INSERT INTO `pageurl` VALUES ('41567', 'http://www.lebazi.com/n/20131111/6458.html', '初音未来h邪恶漫画：催眠_变成大蘑菇变成大蘑菇！', '1', '2015-01-28 12:35:10');
INSERT INTO `pageurl` VALUES ('41568', 'http://www.lebazi.com/n/20131121/6572.html', '邪恶漫画色系军团图片：大师兄你今晚又撸管呀？真可怜_合体术', '1', '2015-01-28 12:35:10');
INSERT INTO `pageurl` VALUES ('41569', 'http://www.lebazi.com/n/20130712/4307.html', '美女gif：你丫打我脸啊，竟敢欺负我不敢打女人脸', '1', '2015-01-28 12:35:10');
INSERT INTO `pageurl` VALUES ('41570', 'http://www.lebazi.com/n/20140312/7485.html', '2B青年gif动图：闲着蛋疼没事做，烧JJ玩耍', '1', '2015-01-28 12:35:10');
INSERT INTO `pageurl` VALUES ('41571', 'http://www.lebazi.com/n/20130618/3477.html', '尼玛，我就不信我抓不到一条~搞笑gif喵星人', '1', '2015-01-28 12:35:10');
INSERT INTO `pageurl` VALUES ('41572', 'http://www.lebazi.com/n/20130524/292.html', '超级有弹性的胸器', '1', '2015-01-28 12:35:10');
INSERT INTO `pageurl` VALUES ('41573', 'http://www.lebazi.com/n/20140812/8245.html', '梦龙y传系列_梦龙y传漫画全集第22话：胜利', '1', '2015-01-28 12:35:10');
INSERT INTO `pageurl` VALUES ('41574', 'http://www.lebazi.com/n/20130726/4916.html', '邪恶漫画之换位击球手：请问晚上是哪边呢？', '1', '2015-01-28 12:35:10');
INSERT INTO `pageurl` VALUES ('41575', 'http://www.lebazi.com/n/20130713/4361.html', '哈哈，看着可乐坏我的小伙伴们了', '1', '2015-01-28 12:35:10');
INSERT INTO `pageurl` VALUES ('41576', 'http://www.lebazi.com/n/20130816/5695.html', '不知火舞邪恶漫画集之喜红_重口h邪恶漫画日本', '1', '2015-01-28 12:35:10');
INSERT INTO `pageurl` VALUES ('41577', 'http://www.lebazi.com/n/20140512/7679.html', '色系军团邪恶漫画_哪来的口福', '1', '2015-01-28 12:35:10');
INSERT INTO `pageurl` VALUES ('41578', 'http://www.lebazi.com/n/20140808/8210.html', '色系军团少女邪恶漫画：二次元邪恶动漫h美少女敞胸翘臀图片', '1', '2015-01-28 12:35:10');
INSERT INTO `pageurl` VALUES ('41579', 'http://www.lebazi.com/n/20130714/4445.html', '邪恶漫画：修炼二指禅的用处', '1', '2015-01-28 12:35:10');
INSERT INTO `pageurl` VALUES ('41580', 'http://www.lebazi.com/n/20130702/3963.html', '色系军团之“青春之泉”能让人恢复年轻的活力的泉水~', '1', '2015-01-28 12:35:10');
INSERT INTO `pageurl` VALUES ('41581', 'http://www.lebazi.com/n/20140812/8252.html', '梦龙y传系列_梦龙y传漫画全集第29话：李梦龙的决心', '1', '2015-01-28 12:35:10');
INSERT INTO `pageurl` VALUES ('41582', 'http://www.lebazi.com/n/20130622/3573.html', '下一页', '1', '2015-01-28 12:35:11');
INSERT INTO `pageurl` VALUES ('41583', 'http://www.lebazi.com/n/20130622/3575.html', '尼玛，你个死色狼，敢碰我老婆的PP，找死啊！', '1', '2015-01-28 12:35:11');
INSERT INTO `pageurl` VALUES ('41584', 'http://www.lebazi.com/n/20130525/414.html', '传说中的“推波助澜”？', '1', '2015-01-28 12:35:11');
INSERT INTO `pageurl` VALUES ('41585', 'http://www.lebazi.com/n/20130519/64.html', '邪恶漫画：鹅姑娘下蛋，大鼻孔来了', '1', '2015-01-28 12:35:11');
INSERT INTO `pageurl` VALUES ('41586', 'http://www.lebazi.com/n/20130630/3931.html', '小孩纸这下估计脑壳上面会长一个大脓包了~', '1', '2015-01-28 12:35:11');
INSERT INTO `pageurl` VALUES ('41587', 'http://www.lebazi.com/n/20140617/7822.html', '邪恶漫画御姐进行时_爱丽丝学院邪恶漫画：二元次方', '1', '2015-01-28 12:35:11');
INSERT INTO `pageurl` VALUES ('41588', 'http://www.lebazi.com/n/20140814/8276.html', '搞笑猫咪gif动态图片', '1', '2015-01-28 12:35:11');
INSERT INTO `pageurl` VALUES ('41589', 'http://www.lebazi.com/n/20141125/8775.html', '恋姐倾心少女漫画邪恶篇：幻想姐姐安慰，自己湿一地', '1', '2015-01-28 12:35:11');
INSERT INTO `pageurl` VALUES ('41590', 'http://www.lebazi.com/n/20140103/6934.html', '初音h邪恶漫画日本：哥们这有意思吗_想象力', '1', '2015-01-28 12:35:11');
INSERT INTO `pageurl` VALUES ('41591', 'http://www.lebazi.com/n/20130525/394.html', '内涵图:其实当摄影师真的不容易啊!', '1', '2015-01-28 12:35:11');
INSERT INTO `pageurl` VALUES ('41592', 'http://www.lebazi.com/n/20140818/8340.html', '色系军团蚂蚁与蜂蜜邪恶系列漫画全集：第十集 产生错觉1', '1', '2015-01-28 12:35:11');
INSERT INTO `pageurl` VALUES ('41593', 'http://www.lebazi.com/n/20130718/4655.html', '巨乳美女gif动图：嗨~我在这里我来了', '1', '2015-01-28 12:35:11');
INSERT INTO `pageurl` VALUES ('41594', 'http://www.lebazi.com/n/20140726/8138.html', '日本少女h邪恶漫画_2次元h邪恶漫画：高潮拳', '1', '2015-01-28 12:35:11');
INSERT INTO `pageurl` VALUES ('41595', 'http://www.lebazi.com/n/20140704/7989.html', '韩国邪恶漫画_少女h邪恶漫画：被放电的妻子', '1', '2015-01-28 12:35:11');
INSERT INTO `pageurl` VALUES ('41596', 'http://www.lebazi.com/n/20130625/3656.html', '内涵漫画：恋人的变化，1年厌倦期', '1', '2015-01-28 12:35:11');
INSERT INTO `pageurl` VALUES ('41597', 'http://www.lebazi.com/n/20130908/5960.html', '色小组漫画全集：粉红色小内裤诱惑_邪恶漫画色系图片', '1', '2015-01-28 12:35:11');
INSERT INTO `pageurl` VALUES ('41598', 'http://www.lebazi.com8898_2.html', '下一页', '1', '2015-01-28 12:35:12');
INSERT INTO `pageurl` VALUES ('41599', 'http://www.lebazi.com8897_2.html', '下一页', '1', '2015-01-28 12:35:12');
INSERT INTO `pageurl` VALUES ('41600', 'http://www.lebazi.com/n/20150106/8896.html', '邪恶内涵福利动态图：各种大胸美女gif诱惑成人动态图', '1', '2015-01-28 12:35:12');
INSERT INTO `pageurl` VALUES ('41601', 'http://www.lebazi.com7465_2.html', '下一页', '1', '2015-01-28 12:35:13');
INSERT INTO `pageurl` VALUES ('41602', 'http://www.lebazi.com/n/20140309/7466.html', '田中瞳色你妹成人gif动态图片精选', '1', '2015-01-28 12:35:13');
INSERT INTO `pageurl` VALUES ('41603', 'http://www.lebazi.com/n/20140307/7457.html', '超邪恶成人gif动态图：撸丝哥几个爽去吧！', '1', '2015-01-28 12:35:13');
INSERT INTO `pageurl` VALUES ('41604', 'http://www.lebazi.com/n/20130818/5733.html', '邪恶漫画色系图片：小红帽_邪恶漫画爱丽丝学园', '1', '2015-01-28 12:35:13');
INSERT INTO `pageurl` VALUES ('41605', 'http://www.lebazi.com/n/20140817/8310.html', '邪恶漫画色系军团寡妇三代漫画第25集：最后的抉择', '1', '2015-01-28 12:35:13');
INSERT INTO `pageurl` VALUES ('41606', 'http://www.lebazi.com/n/20130617/3448.html', '美女你快有4个胸器了~胸部gif动态图片', '1', '2015-01-28 12:35:13');
INSERT INTO `pageurl` VALUES ('41607', 'http://www.lebazi.com/n/20130724/4807.html', '自从给龟兄装了滑板车，从此就不在慢了', '1', '2015-01-28 12:35:13');
INSERT INTO `pageurl` VALUES ('41608', 'http://www.lebazi.com/n/20130805/5369.html', '爆笑gif动图：大爷倒了就算了咯', '1', '2015-01-28 12:35:13');
INSERT INTO `pageurl` VALUES ('41609', 'http://www.lebazi.com/n/20130530/733.html', '带上眼镜还看不清，还是取了吧', '1', '2015-01-28 12:35:13');
INSERT INTO `pageurl` VALUES ('41610', 'http://www.lebazi.com/n/20130714/4443.html', '邪恶漫画：导致夫妻不和的其实都是因为“小”事', '1', '2015-01-28 12:35:13');
INSERT INTO `pageurl` VALUES ('41611', 'http://www.lebazi.com/n/20140818/8368.html', '少妇在家搞卫生诱惑gif动图：怎么看起来怪怪的？', '1', '2015-01-28 12:35:13');
INSERT INTO `pageurl` VALUES ('41612', 'http://www.lebazi.com/n/20130713/4390.html', '刚出生的小马宝宝搞笑gif动图', '1', '2015-01-28 12:35:13');
INSERT INTO `pageurl` VALUES ('41613', 'http://www.lebazi.com/n/20140617/7835.html', '日本邪恶漫画大全_火影同人邪恶漫画大全：停止的心脏', '1', '2015-01-28 12:35:13');
INSERT INTO `pageurl` VALUES ('41614', 'http://www.lebazi.com/n/20130825/5822.html', '无翼鸟邪恶漫画全集：练功_重口h邪恶漫画日本', '1', '2015-01-28 12:35:13');
INSERT INTO `pageurl` VALUES ('41615', 'http://www.lebazi.com/n/20130805/5380.html', '色系军团漫画之基因很重要：将军你死前先留下后代吧', '1', '2015-01-28 12:35:13');
INSERT INTO `pageurl` VALUES ('41616', 'http://www.lebazi.com/n/20130714/4434.html', '色系军团漫画：强与弱的差距', '1', '2015-01-28 12:35:13');
INSERT INTO `pageurl` VALUES ('41617', 'http://www.lebazi.com/n/20140812/8240.html', '梦龙y传系列_梦龙y传漫画全集第17话：勇士的第一步', '1', '2015-01-28 12:35:13');
INSERT INTO `pageurl` VALUES ('41618', 'http://www.lebazi.com8380_2.html', '下一页', '1', '2015-01-28 12:35:13');
INSERT INTO `pageurl` VALUES ('41619', 'http://www.lebazi.com/n/20140323/7592.html', '美女gif动图：两个强悍的妹子打架gif动图', '1', '2015-01-28 12:35:13');
INSERT INTO `pageurl` VALUES ('41620', 'http://www.lebazi.com/n/20140811/8215.html', '菊花笑典漫画全集：欧尼酱你这么机智你家里人造嘛？', '1', '2015-01-28 12:35:13');
INSERT INTO `pageurl` VALUES ('41621', 'http://www.lebazi.com/n/20140618/7843.html', '周星驰电影逗你乐没商量搞笑gif动态图片', '1', '2015-01-28 12:35:13');
INSERT INTO `pageurl` VALUES ('41622', 'http://www.lebazi.com/n/20140616/7792.html', '各种高清性感大波妹大胸美女图片欣赏：屌丝们有没有种捏的冲动？', '1', '2015-01-28 12:35:13');
INSERT INTO `pageurl` VALUES ('41623', 'http://www.lebazi.com/n/20130920/6028.html', '爆笑gif动图：老天你要不要这么坑一对恩爱的小情侣', '1', '2015-01-28 12:35:13');
INSERT INTO `pageurl` VALUES ('41624', 'http://www.lebazi.com/n/20130802/5140.html', '超乖喵星人与人握手gif动图', '1', '2015-01-28 12:35:13');
INSERT INTO `pageurl` VALUES ('41625', 'http://www.lebazi.com/n/20130614/1113.html', '色小组：之“十块钱”这可是10块钱啊!!', '1', '2015-01-28 12:35:13');
INSERT INTO `pageurl` VALUES ('41626', 'http://www.lebazi.com/n/20140923/8554.html', '岛国av女优邪恶gif动态图片出处：美女邪恶gif动态图片出处', '1', '2015-01-28 12:35:13');
INSERT INTO `pageurl` VALUES ('41627', 'http://www.lebazi.com/n/20130625/3644.html', '美女咬嘴唇诱惑gif动态图片', '1', '2015-01-28 12:35:13');
INSERT INTO `pageurl` VALUES ('41628', 'http://www.lebazi.com/n/20140617/7826.html', '爱与欲望之学园邪恶漫画_内涵漫画色系图片：施咒法术', '1', '2015-01-28 12:35:13');
INSERT INTO `pageurl` VALUES ('41629', 'http://www.lebazi.com/n/20140814/8274.html', '超邪恶漫画色系图片：摩托车幻想', '1', '2015-01-28 12:35:13');
INSERT INTO `pageurl` VALUES ('41630', 'http://www.lebazi.com/n/20130518/37.html', '邪恶漫画：色系军团 抓犯人', '1', '2015-01-28 12:35:13');
INSERT INTO `pageurl` VALUES ('41631', 'http://www.lebazi.com/n/20131025/6134.html', '邪恶漫画不知火舞h：运气好的时候', '1', '2015-01-28 12:35:13');
INSERT INTO `pageurl` VALUES ('41632', 'http://www.lebazi.com/n/20140817/8307.html', '邪恶漫画色系军团寡妇三代漫画第22集：欲无止境', '1', '2015-01-28 12:35:13');
INSERT INTO `pageurl` VALUES ('41633', 'http://www.lebazi.com8160_2.html', '下一页', '1', '2015-01-28 12:35:14');
INSERT INTO `pageurl` VALUES ('41634', 'http://www.lebazi.com/n/20140730/8163.html', '邪恶美女gif可以撸的图片_又黄又色的男女xo邪恶gif动态图：精彩内涵一看就懂，单手打字中~', '1', '2015-01-28 12:35:14');
INSERT INTO `pageurl` VALUES ('41635', 'http://www.lebazi.com/n/20140720/8116.html', '日本知名AV女优小川亚沙美诱惑GIF动图图片(多图)', '1', '2015-01-28 12:35:14');
INSERT INTO `pageurl` VALUES ('41636', 'http://www.lebazi.com8209_2.html', '下一页', '1', '2015-01-28 12:35:14');
INSERT INTO `pageurl` VALUES ('41637', 'http://www.lebazi.com/n/20140811/8220.html', '养眼美女mm福利gif动态图：女人性感的一瞬间 让男人淡定不住诱惑', '1', '2015-01-28 12:35:14');
INSERT INTO `pageurl` VALUES ('41638', 'http://www.lebazi.com8370_2.html', '下一页', '1', '2015-01-28 12:35:15');
INSERT INTO `pageurl` VALUES ('41639', 'http://www.lebazi.com/n/20140819/8369.html', '韩国美女主播朴妮唛情趣内衣秀邪恶内涵gif动态图片', '1', '2015-01-28 12:35:15');
INSERT INTO `pageurl` VALUES ('41640', 'http://www.lebazi.com8660_2.html', '下一页', '1', '2015-01-28 12:35:15');
INSERT INTO `pageurl` VALUES ('41641', 'http://www.lebazi.com/n/20141020/8659.html', '邪恶内涵gif动态图之足控篇：真的是一分钟毁了小清新有木有', '1', '2015-01-28 12:35:15');
INSERT INTO `pageurl` VALUES ('41642', 'http://www.lebazi.com/n/20130614/1081.html', '美女，请你放尊重一点~我很保守的', '1', '2015-01-28 12:35:15');
INSERT INTO `pageurl` VALUES ('41643', 'http://www.lebazi.com/n/20140316/7524.html', '恶搞金三胖金正恩奥巴马系列GIF动态图大全', '1', '2015-01-28 12:35:15');
INSERT INTO `pageurl` VALUES ('41644', 'http://www.lebazi.com/n/20130825/5844.html', 'QQ版航母style动态gif图片', '1', '2015-01-28 12:35:15');
INSERT INTO `pageurl` VALUES ('41645', 'http://www.lebazi.com/n/20130528/630.html', '美女，给老夫玩玩。。。', '1', '2015-01-28 12:35:15');
INSERT INTO `pageurl` VALUES ('41646', 'http://www.lebazi.com/n/20131025/6132.html', '不知火舞邪恶h漫画集：越老越能发挥真正的价值啊_勤俭的媳妇', '1', '2015-01-28 12:35:15');
INSERT INTO `pageurl` VALUES ('41647', 'http://www.lebazi.com/n/20130623/3608.html', '恶搞天龙八部版乔帮主发怒抗日打飞机gif动图~', '1', '2015-01-28 12:35:15');
INSERT INTO `pageurl` VALUES ('41648', 'http://www.lebazi.com/n/20130927/6037.html', '色小组漫画全集：鼓掌_邪恶漫画色系图片', '1', '2015-01-28 12:35:15');
INSERT INTO `pageurl` VALUES ('41649', 'http://www.lebazi.com/n/20140728/8156.html', '色系军团邪恶漫画_邪恶漫画色图片全集：交换', '1', '2015-01-28 12:35:15');
INSERT INTO `pageurl` VALUES ('41650', 'http://www.lebazi.com/n/20141010/8588.html', '水咲萝拉原名泷泽萝拉因在YOUTUBE上传各种卖萌的蹲姿透视装自拍照而走红', '1', '2015-01-28 12:35:15');
INSERT INTO `pageurl` VALUES ('41651', 'http://www.lebazi.com/n/20130702/3968.html', '色系军团之“人鱼公主传”为了国家，为了你和我，请你成为王子（二）~', '1', '2015-01-28 12:35:15');
INSERT INTO `pageurl` VALUES ('41652', 'http://www.lebazi.com/n/20140715/8035.html', '邪恶漫画御姐进行时_色小组思春期少女漫画：主题店', '1', '2015-01-28 12:35:15');
INSERT INTO `pageurl` VALUES ('41653', 'http://www.lebazi.com/n/20141219/8868.html', '爱与欲望之学园邪恶漫画：桃色幻想', '1', '2015-01-28 12:35:15');
INSERT INTO `pageurl` VALUES ('41654', 'http://www.lebazi.com/n/20130829/5893.html', '邪恶漫画爱丽丝学园：诱惑帅哥_全彩h邪恶漫画日本', '1', '2015-01-28 12:35:15');
INSERT INTO `pageurl` VALUES ('41655', 'http://www.lebazi.com/n/20140623/7885.html', '乐张不入妖妖小精漫画全集_妖妖小精色系军团：老婆的新爱好', '1', '2015-01-28 12:35:15');
INSERT INTO `pageurl` VALUES ('41656', 'http://www.lebazi.com7338_2.html', '下一页', '1', '2015-01-28 12:35:15');
INSERT INTO `pageurl` VALUES ('41657', 'http://www.lebazi.com/n/20140305/7357.html', '《来自星星的你》李敏镐与千颂伊的xxoo姿势邪恶gif动图', '1', '2015-01-28 12:35:16');
INSERT INTO `pageurl` VALUES ('41658', 'http://www.lebazi.com/n/20140227/7270.html', '成人gif邪恶动态图精选：邪恶美女gif动态图片', '1', '2015-01-28 12:35:16');
INSERT INTO `pageurl` VALUES ('41659', 'http://www.lebazi.com/n/20130708/4153.html', '邪恶漫画：“根据场所不同”哥哥，你好坏，老是偷看人家', '1', '2015-01-28 12:35:16');
INSERT INTO `pageurl` VALUES ('41660', 'http://www.lebazi.com/n/20130726/4905.html', '喵星人gif动图：你丫的是不是不想活了', '1', '2015-01-28 12:35:16');
INSERT INTO `pageurl` VALUES ('41661', 'http://www.lebazi.com/n/20130716/4608.html', '色系军团漫画：族长给我取名叫一柱擎天', '1', '2015-01-28 12:35:16');
INSERT INTO `pageurl` VALUES ('41662', 'http://www.lebazi.com/n/20140623/7903.html', '妖妖小精色系军团2次元少女邪恶漫画（第二章）：过客的温柔乡', '1', '2015-01-28 12:35:16');
INSERT INTO `pageurl` VALUES ('41663', 'http://www.lebazi.com/n/20130611/1001.html', '哈哈，走秀变走光了', '1', '2015-01-28 12:35:16');
INSERT INTO `pageurl` VALUES ('41664', 'http://www.lebazi.com/n/20130529/709.html', '哈哈。我看到了小企鹅。', '1', '2015-01-28 12:35:16');
INSERT INTO `pageurl` VALUES ('41665', 'http://www.lebazi.com/n/20130613/1044.html', '尼玛，这么大一把年假了还卖萌~~', '1', '2015-01-28 12:35:16');
INSERT INTO `pageurl` VALUES ('41666', 'http://www.lebazi.com/n/20141111/8719.html', '微博无节操内涵段子集：插可以，要是用手就免了', '1', '2015-01-28 12:35:16');
INSERT INTO `pageurl` VALUES ('41667', 'http://www.lebazi.com/n/20140104/6984.html', '超内涵邪恶gif动图：骚年，这是女神给的礼物啊', '1', '2015-01-28 12:35:16');
INSERT INTO `pageurl` VALUES ('41668', 'http://www.lebazi.com/n/20130519/44.html', '邪恶漫画：那我就努力试一试', '1', '2015-01-28 12:35:16');
INSERT INTO `pageurl` VALUES ('41669', 'http://www.lebazi.com/n/20130921/6029.html', '不知火舞邪恶漫画集：有夫之妇_邪恶漫画色系图片', '1', '2015-01-28 12:35:16');
INSERT INTO `pageurl` VALUES ('41670', 'http://www.lebazi.com/n/20140306/7384.html', '初音未来h邪恶漫画：乡间的小路_18禁邪恶漫画', '1', '2015-01-28 12:35:16');
INSERT INTO `pageurl` VALUES ('41671', 'http://www.lebazi.com/n/20130818/5735.html', '妖妖小精漫画大全：邪恶的魔镜_重口h邪恶漫画日本', '1', '2015-01-28 12:35:16');
INSERT INTO `pageurl` VALUES ('41672', 'http://www.lebazi.com/n/20130908/5962.html', '邪恶漫画色系图片：教育到位_重口h邪恶漫画日本', '1', '2015-01-28 12:35:16');
INSERT INTO `pageurl` VALUES ('41673', 'http://www.lebazi.com8263_2.html', '下一页', '1', '2015-01-28 12:35:17');
INSERT INTO `pageurl` VALUES ('41674', 'http://www.lebazi.com/n/20140813/8264.html', '大胸美女mm福利gif动态图片锦集：那些让你欲摆不能的性感妹子巨乳gif动图', '1', '2015-01-28 12:35:17');
INSERT INTO `pageurl` VALUES ('41675', 'http://www.lebazi.com/n/20140813/8262.html', '日本女演员、AV女优波多野结衣内涵gif动态图集', '1', '2015-01-28 12:35:17');
INSERT INTO `pageurl` VALUES ('41676', 'http://www.lebazi.com8193_2.html', '下一页', '1', '2015-01-28 12:35:17');
INSERT INTO `pageurl` VALUES ('41677', 'http://www.lebazi.com8391_2.html', '下一页', '1', '2015-01-28 12:35:17');
INSERT INTO `pageurl` VALUES ('41678', 'http://www.lebazi.com/n/20140829/8422.html', '性感美臀福利邪恶动态图_xxoo成人没内涵邪恶gif动态：屌丝准备纸巾尽情释放荷尔蒙吧', '1', '2015-01-28 12:35:17');
INSERT INTO `pageurl` VALUES ('41679', 'http://www.lebazi.com8192_2.html', '下一页', '1', '2015-01-28 12:35:18');
INSERT INTO `pageurl` VALUES ('41680', 'http://www.lebazi.com/n/20140804/8191.html', '邪恶成人xxoo真人没内涵搞笑gif动态图精选：美女我知道你喜欢这样的（第十二期）', '1', '2015-01-28 12:35:18');
INSERT INTO `pageurl` VALUES ('41681', 'http://www.lebazi.com8666_2.html', '下一页', '1', '2015-01-28 12:35:18');
INSERT INTO `pageurl` VALUES ('41682', 'http://www.lebazi.com/n/20141022/8667.html', '邪恶动态图女优gif出处番号大全： 对老师说谎的孩子不是好学生', '1', '2015-01-28 12:35:18');
INSERT INTO `pageurl` VALUES ('41683', 'http://www.lebazi.com8562_2.html', '下一页', '1', '2015-01-28 12:35:19');
INSERT INTO `pageurl` VALUES ('41684', 'http://www.lebazi.com/n/20140926/8569.html', '又黄又色软妹子邪恶成人gif动图：据说现在的妹子都喜欢这样玩 好想被加入有木有', '1', '2015-01-28 12:35:19');
INSERT INTO `pageurl` VALUES ('41685', 'http://www.lebazi.com/n/20140924/8560.html', '美女大屁股翘臀gif邪恶动态图大全：要的就是这各种各样的动感', '1', '2015-01-28 12:35:19');
INSERT INTO `pageurl` VALUES ('41686', 'http://www.lebazi.com8015_2.html', '下一页', '1', '2015-01-28 12:35:19');
INSERT INTO `pageurl` VALUES ('41687', 'http://www.lebazi.com/n/20140713/8016.html', '又黄又色邪恶成人gif搞笑动态图片：宅男撸管必备福利图片（第2期）', '1', '2015-01-28 12:35:19');
INSERT INTO `pageurl` VALUES ('41688', 'http://www.lebazi.com/n/20140712/8013.html', '田中瞳色你妹gif动态邪恶图片_又黄又色的邪恶gif动态图：看懂了默默顶上', '1', '2015-01-28 12:35:19');
INSERT INTO `pageurl` VALUES ('41689', 'http://www.lebazi.com/n/20130706/4101.html', '邪恶漫画之：yoga翻转魔术师（二），公主也疯狂', '1', '2015-01-28 12:35:19');
INSERT INTO `pageurl` VALUES ('41690', 'http://www.lebazi.com/n/20140715/8070.html', '暴走漫画第二季脑残对话表情_暴走漫画吧：床上的东西', '1', '2015-01-28 12:35:19');
INSERT INTO `pageurl` VALUES ('41691', 'http://www.lebazi.com/n/20141124/8774.html', '恋姐倾心少女漫画邪恶篇：感受空姐', '1', '2015-01-28 12:35:19');
INSERT INTO `pageurl` VALUES ('41692', 'http://www.lebazi.com/n/20140818/8327.html', '土豆《神街访》街头采访爆笑视频：中了500万想对老板说什么？', '1', '2015-01-28 12:35:19');
INSERT INTO `pageurl` VALUES ('41693', 'http://www.lebazi.com/n/20130821/5782.html', '邪恶美女gif动图：美女屁屁上的肉肉好柔软的哈。', '1', '2015-01-28 12:35:19');
INSERT INTO `pageurl` VALUES ('41694', 'http://www.lebazi.com/n/20141210/8835.html', '无翼鸟一库邪恶漫画：洞穴里的壁画2', '1', '2015-01-28 12:35:19');
INSERT INTO `pageurl` VALUES ('41695', 'http://www.lebazi.com/n/20130525/423.html', '瞄星人很忙，懒得理你！', '1', '2015-01-28 12:35:19');
INSERT INTO `pageurl` VALUES ('41696', 'http://www.lebazi.com/n/20130724/4806.html', '美女gif动图：钓鱼岛是中国的，苍老师是世界的', '1', '2015-01-28 12:35:19');
INSERT INTO `pageurl` VALUES ('41697', 'http://www.lebazi.com/n/20140309/7474.html', '不知火舞沙滩全集之河神新篇：狗男女你们太浪费老衲的表情了，我要杀了你们', '1', '2015-01-28 12:35:19');
INSERT INTO `pageurl` VALUES ('41698', 'http://www.lebazi.com/n/20141012/8600.html', '披萨恋恋曲少女漫画邪恶篇272-278章节：Only you', '1', '2015-01-28 12:35:19');
INSERT INTO `pageurl` VALUES ('41699', 'http://www.lebazi.com/n/20131009/6063.html', '邪恶漫画色系图片：最后三分钟_无翼鸟邪恶漫画全集', '1', '2015-01-28 12:35:19');
INSERT INTO `pageurl` VALUES ('41700', 'http://www.lebazi.com/n/20130630/3874.html', '色系军团之“有了家用机器人舒服极了~”', '1', '2015-01-28 12:35:19');
INSERT INTO `pageurl` VALUES ('41701', 'http://www.lebazi.com8645_2.html', '下一页', '1', '2015-01-28 12:35:20');
INSERT INTO `pageurl` VALUES ('41702', 'http://www.lebazi.com/n/20141019/8658.html', '乐吧子邪恶动态图大全：日本av女优gif出处番号（第一期）', '1', '2015-01-28 12:35:20');
INSERT INTO `pageurl` VALUES ('41703', 'http://www.lebazi.com/n/20141016/8642.html', '那些让人看了碉堡的gif动态图：请不要告诉我番号，我不想看！！！', '1', '2015-01-28 12:35:20');
INSERT INTO `pageurl` VALUES ('41704', 'http://www.lebazi.com8692_2.html', '下一页', '1', '2015-01-28 12:35:20');
INSERT INTO `pageurl` VALUES ('41705', 'http://www.lebazi.com/n/20141102/8698.html', '乐吧子邪恶内涵gif动态图大全（第四期）：日本最红av女优gif番号出处大全', '1', '2015-01-28 12:35:20');
INSERT INTO `pageurl` VALUES ('41706', 'http://www.lebazi.com8259_2.html', '下一页', '1', '2015-01-28 12:35:20');
INSERT INTO `pageurl` VALUES ('41707', 'http://www.lebazi.com/n/20140813/8260.html', '日本AV女演员苍井空性感邪恶gif动态图：喜欢的同学可以拿去收藏', '1', '2015-01-28 12:35:20');
INSERT INTO `pageurl` VALUES ('41708', 'http://www.lebazi.com/n/20140811/8221.html', '养眼福利gif动态图片大放送：海边比基尼美胸美女来袭 男粉们感受一下吧', '1', '2015-01-28 12:35:20');
INSERT INTO `pageurl` VALUES ('41709', 'http://www.lebazi.com8859_2.html', '下一页', '1', '2015-01-28 12:35:21');
INSERT INTO `pageurl` VALUES ('41710', 'http://www.lebazi.com/n/20141219/8869.html', '美女h邪恶动态图出处番号：小黄哥亲情奉献 话说这样的软妹子谁不喜欢？', '1', '2015-01-28 12:35:21');
INSERT INTO `pageurl` VALUES ('41711', 'http://www.lebazi.com/n/20141208/8830.html', 'AV女优邪恶动态图出处：本田莉子至今单体作品封面以及番号', '1', '2015-01-28 12:35:21');
INSERT INTO `pageurl` VALUES ('41712', 'http://www.lebazi.com7746_2.html', '下一页', '1', '2015-01-28 12:35:21');
INSERT INTO `pageurl` VALUES ('41713', 'http://www.lebazi.com/n/20140610/7775.html', '搞笑动态图片笑死人_搞笑gif笑死人：哥你真的是太悲催了', '1', '2015-01-28 12:35:21');
INSERT INTO `pageurl` VALUES ('41714', 'http://www.lebazi.com/n/20140518/7741.html', '色你妹成人gif动态邪恶rosi美女图片集合：宅男屌丝必备第五期', '1', '2015-01-28 12:35:21');
INSERT INTO `pageurl` VALUES ('41715', 'http://www.lebazi.com/n/20131121/6568.html', '初音未来h邪恶漫画：大姨妈你安心去死吧_换届', '1', '2015-01-28 12:35:21');
INSERT INTO `pageurl` VALUES ('41716', 'http://www.lebazi.com/n/20130704/4049.html', '这是传说中的可乐导弹么~', '1', '2015-01-28 12:35:21');
INSERT INTO `pageurl` VALUES ('41717', 'http://www.lebazi.com/n/20130617/3461.html', '大哥，你的动作好娴熟，好邪恶啊~看懂的人顶起~', '1', '2015-01-28 12:35:21');
INSERT INTO `pageurl` VALUES ('41718', 'http://www.lebazi.com/n/20141012/8619.html', '韩国邪恶漫画“人鱼公主传”全集连载：第19集', '1', '2015-01-28 12:35:21');
INSERT INTO `pageurl` VALUES ('41719', 'http://www.lebazi.com/n/20130715/4535.html', '色小组漫画：可以操控让人死的舞蹈笔记', '1', '2015-01-28 12:35:21');
INSERT INTO `pageurl` VALUES ('41720', 'http://www.lebazi.com/n/20130617/3443.html', '哥，快看，那边有个好好看的美女~', '1', '2015-01-28 12:35:21');
INSERT INTO `pageurl` VALUES ('41721', 'http://www.lebazi.com/n/20130611/998.html', '哎呀，掉水坑了~~', '1', '2015-01-28 12:35:21');
INSERT INTO `pageurl` VALUES ('41722', 'http://www.lebazi.com/n/20140326/7613.html', '邪恶漫画不知火舞全集_邪恶漫画御姐进行时：郎君的手真暖啊！', '1', '2015-01-28 12:35:21');
INSERT INTO `pageurl` VALUES ('41723', 'http://www.lebazi.com/n/20140715/8073.html', '暴走漫画吧_暴走漫画第一季动漫表情：真相', '1', '2015-01-28 12:35:21');
INSERT INTO `pageurl` VALUES ('41724', 'http://www.lebazi.com/n/20130714/4477.html', '美女吃香蕉诱惑gif态图片', '1', '2015-01-28 12:35:21');
INSERT INTO `pageurl` VALUES ('41725', 'http://www.lebazi.com/n/20140617/7839.html', '大吴哥娱乐邪恶漫画_色系军团邪恶漫画大全：没有过不了的火焰山', '1', '2015-01-28 12:35:21');
INSERT INTO `pageurl` VALUES ('41726', 'http://www.lebazi.com/n/20130620/3517.html', '内涵漫画：向会长的儿子表白', '1', '2015-01-28 12:35:21');
INSERT INTO `pageurl` VALUES ('41727', 'http://www.lebazi.com/n/20130822/5790.html', '无翼鸟邪恶漫画全集：舒服极了_邪恶漫画全集', '1', '2015-01-28 12:35:21');
INSERT INTO `pageurl` VALUES ('41728', 'http://www.lebazi.com/n/20131108/6292.html', '不知火舞邪恶漫画集：他的愿望_终于想到办法制住你了魔灯妹纸', '1', '2015-01-28 12:35:21');
INSERT INTO `pageurl` VALUES ('41729', 'http://www.lebazi.com8413_2.html', '下一页', '1', '2015-01-28 12:35:22');
INSERT INTO `pageurl` VALUES ('41730', 'http://www.lebazi.com/n/20140828/8414.html', '让人激情澎湃的二次元动漫h性感美女：上演肉博战图集', '1', '2015-01-28 12:35:22');
INSERT INTO `pageurl` VALUES ('41731', 'http://www.lebazi.com/n/20140828/8412.html', '清纯动漫美女黄漫图片： 与男友调情的心形衣服图集', '1', '2015-01-28 12:35:22');
INSERT INTO `pageurl` VALUES ('41732', 'http://www.lebazi.com/n/20140801/8181.html', '下一页', '1', '2015-01-28 12:35:22');
INSERT INTO `pageurl` VALUES ('41733', 'http://www.lebazi.com/n/20140801/8183.html', '超邪恶漫画色系图片_邪恶漫画图片：关灯后的尴尬', '1', '2015-01-28 12:35:22');
INSERT INTO `pageurl` VALUES ('41734', 'http://www.lebazi.com/n/20130822/5788.html', '下一页', '1', '2015-01-28 12:35:22');
INSERT INTO `pageurl` VALUES ('41735', 'http://www.lebazi.com/n/20130629/3829.html', '看本兔大侠为大家表演飞檐走壁神功~', '1', '2015-01-28 12:35:22');
INSERT INTO `pageurl` VALUES ('41736', 'http://www.lebazi.com/n/20130520/141.html', '碉堡了！英雄救美！', '1', '2015-01-28 12:35:22');
INSERT INTO `pageurl` VALUES ('41737', 'http://www.lebazi.com/n/20141012/8603.html', '韩国邪恶漫画“人鱼公主传”全集连载：第03集', '1', '2015-01-28 12:35:22');
INSERT INTO `pageurl` VALUES ('41738', 'http://www.lebazi.com/n/20130626/3673.html', '内涵图：盘点明星们的“私生子“', '1', '2015-01-28 12:35:22');
INSERT INTO `pageurl` VALUES ('41739', 'http://www.lebazi.com/n/20140718/8103.html', '邪恶漫画色系军团_邪恶色系漫画：孔雀的危险', '1', '2015-01-28 12:35:22');
INSERT INTO `pageurl` VALUES ('41740', 'http://www.lebazi.com/n/20130617/3457.html', '摸一次胸部500，你愿不愿意？', '1', '2015-01-28 12:35:22');
INSERT INTO `pageurl` VALUES ('41741', 'http://www.lebazi.com/n/20140916/8503.html', '宅男福利来了：各种美女gif诱惑图片，喜欢你就使劲撸！', '1', '2015-01-28 12:35:22');
INSERT INTO `pageurl` VALUES ('41742', 'http://www.lebazi.com/n/20130811/5485.html', '邪恶漫画之胳膊的适用：加油撸', '1', '2015-01-28 12:35:22');
INSERT INTO `pageurl` VALUES ('41743', 'http://www.lebazi.com/n/20141014/8636.html', '微博语录精选：这个世界，打了马赛克后一切都变了', '1', '2015-01-28 12:35:22');
INSERT INTO `pageurl` VALUES ('41744', 'http://www.lebazi.com/n/20130630/3870.html', '色系军团之“你那令人讨厌的胡子”', '1', '2015-01-28 12:35:23');
INSERT INTO `pageurl` VALUES ('41745', 'http://www.lebazi.com/n/20130712/4326.html', '色系军团漫画：“关心邻居”要是所有人像我这样关系邻居就好了', '1', '2015-01-28 12:35:23');
INSERT INTO `pageurl` VALUES ('41746', 'http://www.lebazi.com/n/20130702/3966.html', '色系军团之“人鱼公主传”王子留下的爱的印记（二）~', '1', '2015-01-28 12:35:23');
INSERT INTO `pageurl` VALUES ('41747', 'http://www.lebazi.com/n/20131126/6734.html', '下一页', '1', '2015-01-28 12:35:24');
INSERT INTO `pageurl` VALUES ('41748', 'http://www.lebazi.com/n/20131126/6746.html', '邪恶漫画不知火舞全集：对不起长官，我的眼睛只能看到美女_射击', '1', '2015-01-28 12:35:24');
INSERT INTO `pageurl` VALUES ('41749', 'http://www.lebazi.com/n/20130712/4313.html', '邪恶gif：谁邪恶了顶一下~', '1', '2015-01-28 12:35:24');
INSERT INTO `pageurl` VALUES ('41750', 'http://www.lebazi.com/n/20130713/4375.html', '美女gif：美女手好灵活啊~', '1', '2015-01-28 12:35:24');
INSERT INTO `pageurl` VALUES ('41751', 'http://www.lebazi.com/n/20140716/8087.html', '美女恶搞搞笑视频_美女搞笑视频集锦：英雄联盟Cosplay狂野的豹女 妩媚的妖狐 搞怪的炸弹人', '1', '2015-01-28 12:35:24');
INSERT INTO `pageurl` VALUES ('41752', 'http://www.lebazi.com/n/20130629/3839.html', '一群2b士兵玩炸弹游戏~你们是在拿命玩么', '1', '2015-01-28 12:35:24');
INSERT INTO `pageurl` VALUES ('41753', 'http://www.lebazi.com/n/20130727/4942.html', '巨胸美女大桌球gif动图', '1', '2015-01-28 12:35:24');
INSERT INTO `pageurl` VALUES ('41754', 'http://www.lebazi.com/n/20130530/735.html', '不解释，貌似是雷大官人！', '1', '2015-01-28 12:35:24');
INSERT INTO `pageurl` VALUES ('41755', 'http://www.lebazi.com/n/20130722/4724.html', '18禁漫画：“来来回回，进进出出”：搞毛啊！进进出出的', '1', '2015-01-28 12:35:24');
INSERT INTO `pageurl` VALUES ('41756', 'http://www.lebazi.com/n/20130723/4796.html', '色系军团漫画：“男朋友的关心”：跟我在一起的时候要夜不归宿', '1', '2015-01-28 12:35:24');
INSERT INTO `pageurl` VALUES ('41757', 'http://www.lebazi.com/n/20130714/4446.html', '邪恶漫画：捉坐在红色垫子上的女鬼', '1', '2015-01-28 12:35:24');
INSERT INTO `pageurl` VALUES ('41758', 'http://www.lebazi.com/n/20130519/68.html', '邪恶漫画：怪物的弱点，作战成功', '1', '2015-01-28 12:35:24');
INSERT INTO `pageurl` VALUES ('41759', 'http://www.lebazi.com/n/20140829/8421.html', '日本二次元h动漫性感翘臀美少女：美臀福利图片', '1', '2015-01-28 12:35:24');
INSERT INTO `pageurl` VALUES ('41760', 'http://www.lebazi.com/n/20130519/57.html', '邪恶漫画：大鼻孔师兄系列漫画之大变活人', '1', '2015-01-28 12:35:24');
INSERT INTO `pageurl` VALUES ('41761', 'http://www.lebazi.com/n/20141216/8864.html', '爱与欲望之学园邪恶漫画：为什么要做', '1', '2015-01-28 12:35:24');
INSERT INTO `pageurl` VALUES ('41762', 'http://www.lebazi.com/n/20130726/4909.html', '下一页', '1', '2015-01-28 12:35:24');
INSERT INTO `pageurl` VALUES ('41763', 'http://www.lebazi.com/n/20130726/4911.html', '色系军团漫画之消暑：那个不是拿来吃的', '1', '2015-01-28 12:35:24');
INSERT INTO `pageurl` VALUES ('41764', 'http://www.lebazi.com/n/20131110/6434.html', '无翼鸟邪恶漫画全集：脚踝_阿童木的苦衷没人懂', '1', '2015-01-28 12:35:24');
INSERT INTO `pageurl` VALUES ('41765', 'http://www.lebazi.com/n/20140302/7281.html', '不知火舞邪恶漫画集之地狱挑战：跟魔鬼打赌是一定输的，请切记', '1', '2015-01-28 12:35:24');
INSERT INTO `pageurl` VALUES ('41766', 'http://www.lebazi.com/n/20140726/8135.html', '内涵漫画全集_内涵漫画色系图片：遇见女鬼时的反应方法', '1', '2015-01-28 12:35:24');
INSERT INTO `pageurl` VALUES ('41767', 'http://www.lebazi.com/n/20141023/8670.html', '思春期少女漫画_色小组二次元h邪恶漫画：那女孩丢的东西', '1', '2015-01-28 12:35:24');
INSERT INTO `pageurl` VALUES ('41768', 'http://www.lebazi.com/n/20130526/499.html', '禽兽走开，让我来...', '1', '2015-01-28 12:35:24');
INSERT INTO `pageurl` VALUES ('41769', 'http://www.lebazi.com/n/20141112/8728.html', '色_大胸美女（第2期）麦苹果waiting 值得期待的大胸美女郎！', '1', '2015-01-28 12:35:24');
INSERT INTO `pageurl` VALUES ('41770', 'http://www.lebazi.com/n/20130531/793.html', '女人“胸”之间的对决', '1', '2015-01-28 12:35:24');
INSERT INTO `pageurl` VALUES ('41771', 'http://www.lebazi.com/n/20130811/5441.html', '国外雷人恶搞美女送啤酒gif动图', '1', '2015-01-28 12:35:24');
INSERT INTO `pageurl` VALUES ('41772', 'http://www.lebazi.com/n/20140923/8559.html', '无翼鸟少女h漫画_天才麻将少女h漫画：COS禁H', '1', '2015-01-28 12:35:24');
INSERT INTO `pageurl` VALUES ('41773', 'http://www.lebazi.com/n/20140326/7612.html', '邪恶漫画不知火舞_邪恶漫画爱丽丝学园：生儿子的秘诀，女人很兴奋就是男孩！', '1', '2015-01-28 12:35:24');
INSERT INTO `pageurl` VALUES ('41774', 'http://www.lebazi.com/n/20141012/8597.html', '大吴哥娱乐邪恶漫画_日本邪恶漫画大全：两个渡江的儒生', '1', '2015-01-28 12:35:24');
INSERT INTO `pageurl` VALUES ('41775', 'http://www.lebazi.com/n/20140812/8251.html', '梦龙y传系列_梦龙y传漫画全集第28话：我要变成人', '1', '2015-01-28 12:35:24');
INSERT INTO `pageurl` VALUES ('41776', 'http://www.lebazi.com/n/20141210/8834.html', '韩国邪恶h漫画全集：爱的生鱼片组合', '1', '2015-01-28 12:35:24');
INSERT INTO `pageurl` VALUES ('41777', 'http://www.lebazi.com/n/20141210/8831.html', '下一页', '1', '2015-01-28 12:35:25');
INSERT INTO `pageurl` VALUES ('41778', 'http://www.lebazi.com/n/20141210/8833.html', '色小组二次元h邪恶漫画：风车转', '1', '2015-01-28 12:35:25');
INSERT INTO `pageurl` VALUES ('41779', 'http://www.lebazi.com/n/20130706/4102.html', '下一页', '1', '2015-01-28 12:35:26');
INSERT INTO `pageurl` VALUES ('41780', 'http://www.lebazi.com/n/20130707/4122.html', '色小组漫画之：“控制XXOO，没事穿那么多内裤干啥”', '1', '2015-01-28 12:35:26');
INSERT INTO `pageurl` VALUES ('41781', 'http://www.lebazi.com8461_2.html', '下一页', '1', '2015-01-28 12:35:26');
INSERT INTO `pageurl` VALUES ('41782', 'http://www.lebazi.com/n/20140909/8462.html', '恋姐倾心h漫画_思春期天才麻将少女h漫画：丝袜教师', '1', '2015-01-28 12:35:26');
INSERT INTO `pageurl` VALUES ('41783', 'http://www.lebazi.com/n/20140908/8460.html', '恋姐倾心少女h漫画_思春期少女h漫画在线阅读：中学体操服', '1', '2015-01-28 12:35:26');
INSERT INTO `pageurl` VALUES ('41784', 'http://www.lebazi.com/n/20140617/7840.html', '下一页', '1', '2015-01-28 12:35:28');
INSERT INTO `pageurl` VALUES ('41785', 'http://www.lebazi.com/n/20140618/7842.html', '二次元h邪恶漫画_无翼鸟一库邪恶漫画：香奈儿5号', '1', '2015-01-28 12:35:28');
INSERT INTO `pageurl` VALUES ('41786', 'http://www.lebazi.com8257_2.html', '下一页', '1', '2015-01-28 12:35:31');
INSERT INTO `pageurl` VALUES ('41787', 'http://www.lebazi.com/n/20140813/8258.html', '梦龙y传系列_梦龙y传漫画全集第35话：终结篇', '1', '2015-01-28 12:35:31');
INSERT INTO `pageurl` VALUES ('41788', 'http://www.lebazi.com/n/20140812/8256.html', '梦龙y传系列_梦龙y传漫画全集第33话：达成', '1', '2015-01-28 12:35:31');
INSERT INTO `pageurl` VALUES ('41789', 'http://www.lebazi.com/n/20130714/4479.html', '美女gif：哇~好大的风呀', '1', '2015-01-28 12:35:32');
INSERT INTO `pageurl` VALUES ('41790', 'http://www.lebazi.com/n/20140306/7394.html', '重口h邪恶漫画日本：正确的穿衣方式_初音未来h邪恶漫画', '1', '2015-01-28 12:35:32');
INSERT INTO `pageurl` VALUES ('41791', 'http://www.lebazi.com/n/20140617/7833.html', '色系军团邪恶漫画_大吴哥娱乐邪恶漫画：男友是军人', '1', '2015-01-28 12:35:32');
INSERT INTO `pageurl` VALUES ('41792', 'http://www.lebazi.com/n/20141117/8752.html', '我们都爱黄段子：我不是金针菇，不是金针菇！', '1', '2015-01-28 12:35:32');
INSERT INTO `pageurl` VALUES ('41793', 'http://www.lebazi.com/n/20140627/7960.html', '波多野结衣内涵图_百思不得姐内涵图：这堂写真课大家画的都很投入', '1', '2015-01-28 12:35:32');
INSERT INTO `pageurl` VALUES ('41794', 'http://www.lebazi.com/n/20130821/5776.html', '巨胸美女gif动图：美女，不能再晃了再晃真的要掉了', '1', '2015-01-28 12:35:32');
INSERT INTO `pageurl` VALUES ('41795', 'http://www.lebazi.com/n/20140816/8289.html', '邪恶漫画色系军团寡妇三代漫画第4集：过冬准备', '1', '2015-01-28 12:35:32');
INSERT INTO `pageurl` VALUES ('41796', 'http://www.lebazi.com/n/20131103/6229.html', '成人gif：情侣相互调戏进入电梯 接下来是什么情况？', '1', '2015-01-28 12:35:32');
INSERT INTO `pageurl` VALUES ('41797', 'http://www.lebazi.com/n/20131116/6534.html', '爆笑gif动图：提前庆祝的悲剧故事，哈哈SB了吧？', '1', '2015-01-28 12:35:32');
INSERT INTO `pageurl` VALUES ('41798', 'http://www.lebazi.com/n/20130714/4435.html', '色系军团漫画：杀手的法则', '1', '2015-01-28 12:35:32');
INSERT INTO `pageurl` VALUES ('41799', 'http://www.lebazi.com/n/20130623/3630.html', '[搞怪军团] 贞操锁', '1', '2015-01-28 12:35:32');
INSERT INTO `pageurl` VALUES ('41800', 'http://www.lebazi.com/n/20130722/4732.html', '色小组漫画之“求爱”：没钱的爱情可望而不可及', '1', '2015-01-28 12:35:32');
INSERT INTO `pageurl` VALUES ('41801', 'http://www.lebazi.com/n/20130722/4726.html', '色系军团漫画之“表白”：哥不要摸了好吗！', '1', '2015-01-28 12:35:32');
INSERT INTO `pageurl` VALUES ('41802', 'http://www.lebazi.com/n/20131121/6571.html', '色小组邪恶漫画全集：道长你别撸了，干正事吧_道士与女鬼', '1', '2015-01-28 12:35:32');
INSERT INTO `pageurl` VALUES ('41803', 'http://www.lebazi.com/n/20130707/4124.html', '邪恶漫画：报恩的小鹿，刚才那种感觉好棒，能不能再来一次？', '1', '2015-01-28 12:35:32');
INSERT INTO `pageurl` VALUES ('41804', 'http://www.lebazi.com/n/20130713/4364.html', '下一页', '1', '2015-01-28 12:35:32');
INSERT INTO `pageurl` VALUES ('41805', 'http://www.lebazi.com/n/20130713/4366.html', '美女gif：美女这下肯定很痛吧~', '1', '2015-01-28 12:35:32');
INSERT INTO `pageurl` VALUES ('41806', 'http://www.lebazi.com/n/20130615/1142.html', '下一页', '1', '2015-01-28 12:35:33');
INSERT INTO `pageurl` VALUES ('41807', 'http://www.lebazi.com/n/20130616/3408.html', '好有弹性的PP，20块给哥摸摸', '1', '2015-01-28 12:35:33');
INSERT INTO `pageurl` VALUES ('41808', 'http://www.lebazi.com/n/20131129/6799.html', 'QQ表情 来亲我一个嘛', '1', '2015-01-28 12:35:33');
INSERT INTO `pageurl` VALUES ('41809', 'http://www.lebazi.com/n/20141012/8622.html', '韩国邪恶漫画“人鱼公主传”全集连载：第22集', '1', '2015-01-28 12:35:33');
INSERT INTO `pageurl` VALUES ('41810', 'http://www.lebazi.com/n/20141019/8653.html', '色小组二次元h邪恶漫画_日本少女h邪恶漫画：搞上闺蜜的男人', '1', '2015-01-28 12:35:33');
INSERT INTO `pageurl` VALUES ('41811', 'http://www.lebazi.com/n/20130730/5075.html', '妩媚美女跳钢管舞gif动图', '1', '2015-01-28 12:35:33');
INSERT INTO `pageurl` VALUES ('41812', 'http://www.lebazi.com/n/20141116/8745.html', '日本二次元邪恶漫画：医生鱼', '1', '2015-01-28 12:35:33');
INSERT INTO `pageurl` VALUES ('41813', 'http://www.lebazi.com/n/20141201/8806.html', '微博搞笑段子合集：看我成绩排名就知道有多少人考试', '1', '2015-01-28 12:35:33');
INSERT INTO `pageurl` VALUES ('41814', 'http://www.lebazi.com/n/20141012/8604.html', '韩国邪恶漫画“人鱼公主传”全集连载：第04集', '1', '2015-01-28 12:35:33');
INSERT INTO `pageurl` VALUES ('41815', 'http://www.lebazi.com/n/20130523/265.html', '邪恶内涵 gif动态图精选第四弹 激情四射(一)', '1', '2015-01-28 12:35:33');
INSERT INTO `pageurl` VALUES ('41816', 'http://www.lebazi.com/n/20130814/5591.html', '搞笑视频集锦：最无节操的视频之暴走大件事', '1', '2015-01-28 12:35:33');
INSERT INTO `pageurl` VALUES ('41817', 'http://www.lebazi.com/n/20140617/7811.html', '日本邪恶漫画大全_少女h邪恶漫画：菊花的回忆', '1', '2015-01-28 12:35:33');
INSERT INTO `pageurl` VALUES ('41818', 'http://www.lebazi.com/n/20130905/5939.html', '重口h邪恶漫画日本：听话的孩子_邪恶漫画不知火舞', '1', '2015-01-28 12:35:33');
INSERT INTO `pageurl` VALUES ('41819', 'http://www.lebazi.com/n/20140623/7891.html', '乐张不入妖妖小精漫画全集_妖妖小精色系军团：提高业绩的方法', '1', '2015-01-28 12:35:33');
INSERT INTO `pageurl` VALUES ('41820', 'http://www.lebazi.com/n/20131115/6526.html', '初音未来h邪恶漫画：达成理想需要牺牲的东西太多了，妹纸你快起床骑我吧', '1', '2015-01-28 12:35:33');
INSERT INTO `pageurl` VALUES ('41821', 'http://www.lebazi.com/n/20141012/8595.html', '18禁邪恶漫画全集_色小组二次元h邪恶漫画：光速', '1', '2015-01-28 12:35:33');
INSERT INTO `pageurl` VALUES ('41822', 'http://www.lebazi.com/n/20140322/7571.html', '下一页', '1', '2015-01-28 12:35:34');
INSERT INTO `pageurl` VALUES ('41823', 'http://www.lebazi.com/n/20130724/4809.html', '下一页', '1', '2015-01-28 12:35:34');
INSERT INTO `pageurl` VALUES ('41824', 'http://www.lebazi.com/n/20130724/4811.html', '日本相扑gif动图：这个记者MM好无辜的就成了示范对象', '1', '2015-01-28 12:35:34');
INSERT INTO `pageurl` VALUES ('41825', 'http://www.lebazi.com/n/20140209/7047.html', '下一页', '1', '2015-01-28 12:35:34');
INSERT INTO `pageurl` VALUES ('41826', 'http://www.lebazi.com/n/20140209/7049.html', '胖子翻筋斗gif动图：胖子们的榜样', '1', '2015-01-28 12:35:34');
INSERT INTO `pageurl` VALUES ('41827', 'http://www.lebazi.com/n/20130613/1039.html', '哈哈。这青蛙也太搞了吧。', '1', '2015-01-28 12:35:35');
INSERT INTO `pageurl` VALUES ('41828', 'http://www.lebazi.com/n/20130819/5752.html', '搞笑视频笑死人：日本荒诞奇葩广告大集合一次看个够_国外搞笑视频', '1', '2015-01-28 12:35:35');
INSERT INTO `pageurl` VALUES ('41829', 'http://www.lebazi.com/n/20130630/3867.html', '色系军团之“好想成为她的座椅”', '1', '2015-01-28 12:35:35');
INSERT INTO `pageurl` VALUES ('41830', 'http://www.lebazi.com/n/20140626/7952.html', '九妖成人内涵图：正常男人不能忍受的刑法，这可是真要命啊，除非阳痿~', '1', '2015-01-28 12:35:35');
INSERT INTO `pageurl` VALUES ('41831', 'http://www.lebazi.com/n/20130525/345.html', '主人，去哪里，带上我吧。', '1', '2015-01-28 12:35:35');
INSERT INTO `pageurl` VALUES ('41832', 'http://www.lebazi.com/n/20140316/7518.html', '精选邪恶内涵诱惑美女Gif动态图片大全', '1', '2015-01-28 12:35:35');
INSERT INTO `pageurl` VALUES ('41833', 'http://www.lebazi.com/n/20140613/7780.html', '少女爱情在线邪恶漫画_恋姐倾心h漫画：摄影师先生，内涵漫画色系图片', '1', '2015-01-28 12:35:35');
INSERT INTO `pageurl` VALUES ('41834', 'http://www.lebazi.com/n/20130715/4536.html', '邪恶漫画：官老爷上位遇到处男冤魂', '1', '2015-01-28 12:35:35');
INSERT INTO `pageurl` VALUES ('41835', 'http://www.lebazi.com/n/20130714/4438.html', '色小组漫画：北斗七星点穴法', '1', '2015-01-28 12:35:35');
INSERT INTO `pageurl` VALUES ('41836', 'http://www.lebazi.com/n/20140817/8305.html', '邪恶漫画色系军团寡妇三代漫画第20集：前情回顾', '1', '2015-01-28 12:35:35');
INSERT INTO `pageurl` VALUES ('41837', 'http://www.lebazi.com/n/20140623/7901.html', '妖妖小精色系军团2次元少女邪恶漫画（第一章）：男女接吻', '1', '2015-01-28 12:35:35');
INSERT INTO `pageurl` VALUES ('41838', 'http://www.lebazi.com/n/20141116/8738.html', '邪恶漫画少女漫画：树神', '1', '2015-01-28 12:35:35');
INSERT INTO `pageurl` VALUES ('41839', 'http://www.lebazi.com/n/20130803/5186.html', '下一页', '1', '2015-01-28 12:35:35');
INSERT INTO `pageurl` VALUES ('41840', 'http://www.lebazi.com/n/20130803/5188.html', '两喵星人玩耍移动木墩找球gif动图', '1', '2015-01-28 12:35:35');
INSERT INTO `pageurl` VALUES ('41841', 'http://www.lebazi.com/n/20130724/4804.html', '下一页', '1', '2015-01-28 12:35:35');
INSERT INTO `pageurl` VALUES ('41842', 'http://www.lebazi.com/n/20130611/1010.html', '下一页', '1', '2015-01-28 12:35:37');
INSERT INTO `pageurl` VALUES ('41843', 'http://www.lebazi.com/n/20130611/1012.html', '尼玛，你这是吃多了巴豆吧', '1', '2015-01-28 12:35:37');
INSERT INTO `pageurl` VALUES ('41844', 'http://www.lebazi.com/n/20130617/3417.html', '真想像阿狸一样无忧无虑~~', '1', '2015-01-28 12:35:37');
INSERT INTO `pageurl` VALUES ('41845', 'http://www.lebazi.com/n/20130714/4427.html', '18禁漫画：另有目的', '1', '2015-01-28 12:35:37');
INSERT INTO `pageurl` VALUES ('41846', 'http://www.lebazi.com/n/20131028/6154.html', '不知火舞邪恶漫画集：这个减肥套餐绝对管用太强悍了_快速减肥', '1', '2015-01-28 12:35:37');
INSERT INTO `pageurl` VALUES ('41847', 'http://www.lebazi.com/n/20130812/5494.html', '不知火舞邪恶漫画集之摩天楼之爱', '1', '2015-01-28 12:35:37');
INSERT INTO `pageurl` VALUES ('41848', 'http://www.lebazi.com/n/20140806/8196.html', '少女邪恶漫画大全_性感动漫美女邪恶篇：姐弟情深第一期', '1', '2015-01-28 12:35:37');
INSERT INTO `pageurl` VALUES ('41849', 'http://www.lebazi.com/n/20130813/5553.html', '不知火舞邪恶漫画内涵图片之要想吃香蕉就得先刨皮', '1', '2015-01-28 12:35:37');
INSERT INTO `pageurl` VALUES ('41850', 'http://www.lebazi.com/n/20140319/7546.html', '大吴哥娱乐邪恶漫画_重口h邪恶漫画日本：气功之大哥你太损了', '1', '2015-01-28 12:35:37');
INSERT INTO `pageurl` VALUES ('41851', 'http://www.lebazi.com/n/20130702/3964.html', '色系军团之“人鱼公主传”结婚之前千万不要相信他（二）~', '1', '2015-01-28 12:35:37');
INSERT INTO `pageurl` VALUES ('41852', 'http://www.lebazi.com/n/20140903/8443.html', '很黄很暴力 啪啪啪打妹子屁屁GIF动态图精选：禽兽快让开让我来', '1', '2015-01-28 12:35:37');
INSERT INTO `pageurl` VALUES ('41853', 'http://www.lebazi.com/n/20140726/8141.html', '18进禁邪恶漫画全集_日本邪恶漫画色系：饭店fateve', '1', '2015-01-28 12:35:37');
INSERT INTO `pageurl` VALUES ('41854', 'http://www.lebazi.com/n/20131126/6727.html', '日本邪恶漫画爱丽丝学园：电鳗会变成什么呢？_魔法棍', '1', '2015-01-28 12:35:37');
INSERT INTO `pageurl` VALUES ('41855', 'http://www.lebazi.com/n/20140706/8012.html', '少女邪恶漫画全集禁_邪恶漫画爱丽丝学园：那个男人那个女人', '1', '2015-01-28 12:35:37');
INSERT INTO `pageurl` VALUES ('41856', 'http://www.lebazi.com/n/20140812/8238.html', '梦龙y传系列_梦龙y传漫画全集第15话：美杜莎的悲哀', '1', '2015-01-28 12:35:37');
INSERT INTO `pageurl` VALUES ('41857', 'http://www.lebazi.com/n/20130715/4516.html', '色系军团漫画：举手击掌习惯成自然', '1', '2015-01-28 12:35:37');
INSERT INTO `pageurl` VALUES ('41858', 'http://www.lebazi.com/n/20140706/8009.html', '下一页', '1', '2015-01-28 12:35:38');
INSERT INTO `pageurl` VALUES ('41859', 'http://www.lebazi.com/n/20140706/8011.html', '少女邪恶漫画大全_色系军团少女邪恶漫画：洗刷刷', '1', '2015-01-28 12:35:38');
INSERT INTO `pageurl` VALUES ('41860', 'http://www.lebazi.com/n/20130907/5958.html', '不知火舞邪恶漫画集：香蕉_重口h邪恶漫画日本', '1', '2015-01-28 12:35:39');
INSERT INTO `pageurl` VALUES ('41861', 'http://www.lebazi.com/n/20140812/8225.html', '梦龙y传系列_梦龙y传漫画全集第3话：使命的开始', '1', '2015-01-28 12:35:39');
INSERT INTO `pageurl` VALUES ('41862', 'http://www.lebazi.com/n/20140625/7928.html', '各种雷人牛人搞笑gif动态内涵图片：搞笑gif图片笑死人图片合集（第五期）', '1', '2015-01-28 12:35:39');
INSERT INTO `pageurl` VALUES ('41863', 'http://www.lebazi.com/n/20130711/4268.html', '好基友调情gif动图：真的是激情四色啊', '1', '2015-01-28 12:35:39');
INSERT INTO `pageurl` VALUES ('41864', 'http://www.lebazi.com/n/20130907/5959.html', '初音未来h邪恶漫画：过冬准备寡妇三代系列', '1', '2015-01-28 12:35:39');
INSERT INTO `pageurl` VALUES ('41865', 'http://www.lebazi.com/n/20131112/6501.html', '优酷搞笑视频：唐僧不过光棍节,光棍节每年都过!', '1', '2015-01-28 12:35:39');
INSERT INTO `pageurl` VALUES ('41866', 'http://www.lebazi.com/n/20140512/7680.html', '色系军团邪恶漫画_床上过桥', '1', '2015-01-28 12:35:39');
INSERT INTO `pageurl` VALUES ('41867', 'http://www.lebazi.com/n/20130715/4508.html', '美女胸gif动图：这是我觉得我身上最自豪的', '1', '2015-01-28 12:35:39');
INSERT INTO `pageurl` VALUES ('41868', 'http://www.lebazi.com/n/20130530/746.html', '色系军团：之礼貌的男生', '1', '2015-01-28 12:35:39');
INSERT INTO `pageurl` VALUES ('41869', 'http://www.lebazi.com/n/20140706/8003.html', '二次元h邪恶漫画_动漫h邪恶漫画：内衣打猎', '1', '2015-01-28 12:35:39');
INSERT INTO `pageurl` VALUES ('41870', 'http://www.lebazi.com/n/20140817/8295.html', '邪恶漫画色系军团寡妇三代漫画第10集：春香传', '1', '2015-01-28 12:35:39');
INSERT INTO `pageurl` VALUES ('41871', 'http://www.lebazi.com/n/20140103/6938.html', '日本邪恶漫画爱丽丝学园：哥们你记住梦想使人伟大呀_愿望', '1', '2015-01-28 12:35:39');
INSERT INTO `pageurl` VALUES ('41872', 'http://www.lebazi.com/n/20130519/51.html', '下一页', '1', '2015-01-28 12:35:39');
INSERT INTO `pageurl` VALUES ('41873', 'http://www.lebazi.com/n/20130519/53.html', '邪恶漫画：老千，男人的动力', '1', '2015-01-28 12:35:39');
INSERT INTO `pageurl` VALUES ('41874', 'http://www.lebazi.com/n/20130626/3703.html', '妹子，你这是意犹未尽吗？', '1', '2015-01-28 12:35:39');
INSERT INTO `pageurl` VALUES ('41875', 'http://www.lebazi.com/n/20131102/6192.html', '18进禁邪恶h漫画：等待的美学_这个随机应变代价太大了', '1', '2015-01-28 12:35:39');
INSERT INTO `pageurl` VALUES ('41876', 'http://www.lebazi.com/n/20130623/3613.html', '妹子，你到底吃了啥子东西，让你如此的潮喷！', '1', '2015-01-28 12:35:39');
INSERT INTO `pageurl` VALUES ('41877', 'http://www.lebazi.com/n/20130821/5773.html', '搞笑gif动态图片：喵星人草泥马敢打我', '1', '2015-01-28 12:35:39');
INSERT INTO `pageurl` VALUES ('41878', 'http://www.lebazi.com/n/20130920/6027.html', '不知火舞邪恶漫画集：紧急治疗_邪恶漫画色系图片', '1', '2015-01-28 12:35:39');
INSERT INTO `pageurl` VALUES ('41879', 'http://www.lebazi.com/n/20130711/4271.html', '运动gif动图：这下真的是菊花开了蛋蛋碎了~', '1', '2015-01-28 12:35:39');
INSERT INTO `pageurl` VALUES ('41880', 'http://www.lebazi.com/n/20140227/7268.html', '一组诱惑的韩国女艺人热舞卖萌gif动图', '1', '2015-01-28 12:35:39');
INSERT INTO `pageurl` VALUES ('41881', 'http://www.lebazi.com/n/20130601/877.html', '我实在忍不住笑了！', '1', '2015-01-28 12:35:39');
INSERT INTO `pageurl` VALUES ('41882', 'http://www.lebazi.com/n/20130528/618.html', 'QQ表情的战争！', '1', '2015-01-28 12:35:39');
INSERT INTO `pageurl` VALUES ('41883', 'http://www.lebazi.com/n/20140617/7825.html', '大吴哥娱乐网搞笑漫画：美女请问你的腹肌是怎么练出来的？', '1', '2015-01-28 12:35:39');
INSERT INTO `pageurl` VALUES ('41884', 'http://www.lebazi.com/n/20140512/7689.html', '色系军团邪恶漫画：老婆的关怀', '1', '2015-01-28 12:35:39');
INSERT INTO `pageurl` VALUES ('41885', 'http://www.lebazi.com/n/20140706/8001.html', '爱丽丝学院邪恶漫画_超邪恶漫画色系图片：西游的修行', '1', '2015-01-28 12:35:39');
INSERT INTO `pageurl` VALUES ('41886', 'http://www.lebazi.com/n/20140623/7878.html', '乐张不入妖妖小精漫画全集_妖妖小精色系军团：交往初期', '1', '2015-01-28 12:35:39');
INSERT INTO `pageurl` VALUES ('41887', 'http://www.lebazi.com8151_2.html', '下一页', '1', '2015-01-28 12:35:40');
INSERT INTO `pageurl` VALUES ('41888', 'http://www.lebazi.com/n/20140727/8152.html', '少女爱情在线漫画h邪恶篇_色小组二次元h邪恶漫画：少女性感动漫图', '1', '2015-01-28 12:35:40');
INSERT INTO `pageurl` VALUES ('41889', 'http://www.lebazi.com/n/20140726/8150.html', '少女漫画邪恶篇_日本少女h邪恶漫画：动车里的苟且之事', '1', '2015-01-28 12:35:40');
INSERT INTO `pageurl` VALUES ('41890', 'http://www.lebazi.com/n/20140623/7880.html', '乐张不入妖妖小精漫画全集_妖妖小精色系军团：白雪公主后传', '1', '2015-01-28 12:35:40');
INSERT INTO `pageurl` VALUES ('41891', 'http://www.lebazi.com8895_2.html', '下一页', '1', '2015-01-28 12:35:56');
INSERT INTO `pageurl` VALUES ('41892', 'http://www.lebazi.com/n/20150106/8894.html', '屌丝男福利：大胸美女各种姿势挑逗诱惑你 让你看了直流口水', '1', '2015-01-28 12:35:56');
INSERT INTO `pageurl` VALUES ('41893', 'http://www.lebazi.com/n/20150106/8905.html', '下一页', '1', '2015-01-28 12:35:58');
INSERT INTO `pageurl` VALUES ('41894', 'http://www.lebazi.com/n/20130815/5636.html', '下一页', '1', '2015-01-28 12:35:58');
INSERT INTO `pageurl` VALUES ('41895', 'http://www.lebazi.com/n/20130815/5640.html', '搞笑gif_美女gif动图：女人的心真的是很难琢磨有木有', '1', '2015-01-28 12:35:58');
INSERT INTO `pageurl` VALUES ('41896', 'http://www.lebazi.com/n/20140326/7632.html', '老湿视频作品系列全集_老湿爆笑解说：中国队与巴西队的基情大战', '1', '2015-01-28 12:35:58');
INSERT INTO `pageurl` VALUES ('41897', 'http://www.lebazi.com/n/20140326/7630.html', '老湿不吐不快_老湿吐槽微电影：换脸新娘，史上最奇葩的结局', '1', '2015-01-28 12:35:58');
INSERT INTO `pageurl` VALUES ('41898', 'http://www.lebazi.com/n/20130716/4591.html', '下一页', '1', '2015-01-28 12:35:58');
INSERT INTO `pageurl` VALUES ('41899', 'http://www.lebazi.com/n/20130716/4593.html', '体操MM露内裤gif动图第二弹', '1', '2015-01-28 12:35:58');
INSERT INTO `pageurl` VALUES ('41900', 'http://www.lebazi.com/n/20130718/4654.html', '美女跑步波涛汹涌gif动图', '1', '2015-01-28 12:35:58');
INSERT INTO `pageurl` VALUES ('41901', 'http://www.lebazi.com/n/20141102/8695.html', '极品美女内衣诱惑图片：爱阴湿毯提供的球衣美胸嫩模美女福利图片', '1', '2015-01-28 12:35:58');
INSERT INTO `pageurl` VALUES ('41902', 'http://www.lebazi.com/n/20130623/3605.html', '超邪恶的动态图片，女生看懂了的，那就证明你的青春时代也经离你远去了', '1', '2015-01-28 12:35:58');
INSERT INTO `pageurl` VALUES ('41903', 'http://www.lebazi.com/n/20140618/7846.html', '各种搞笑gif动态姿势摔跤图片大全', '1', '2015-01-28 12:35:58');
INSERT INTO `pageurl` VALUES ('41904', 'http://www.lebazi.com/n/20130618/3464.html', '大家一起来玩跳跳球呀，搞笑挑挑球gif动图', '1', '2015-01-28 12:35:58');
INSERT INTO `pageurl` VALUES ('41905', 'http://www.lebazi.com/n/20141012/8623.html', '韩国邪恶漫画“人鱼公主传”全集连载：第23集', '1', '2015-01-28 12:35:58');
INSERT INTO `pageurl` VALUES ('41906', 'http://www.lebazi.com/n/20130623/3607.html', '恶搞“蒙娜丽莎的微笑”，这尼玛完全看不到哪里微笑了啊', '1', '2015-01-28 12:35:58');
INSERT INTO `pageurl` VALUES ('41907', 'http://www.lebazi.com/n/20130630/3927.html', '尼玛，吓死我了，你干嘛啊', '1', '2015-01-28 12:35:58');
INSERT INTO `pageurl` VALUES ('41908', 'http://www.lebazi.com/n/20130804/5342.html', '邪恶漫画之豆子：节操都没了，童年的故事好像不是这么说的', '1', '2015-01-28 12:35:58');
INSERT INTO `pageurl` VALUES ('41909', 'http://www.lebazi.com/n/20150106/8900.html', '无翼鸟邪恶漫画全集：睡美人', '1', '2015-01-28 12:35:58');
INSERT INTO `pageurl` VALUES ('41910', 'http://www.lebazi.com/n/20140627/7963.html', '少女漫画h在线阅读_天才麻将少女漫画：好软的小维，恋姐倾心邪恶漫画', '1', '2015-01-28 12:35:58');
INSERT INTO `pageurl` VALUES ('41911', 'http://www.lebazi.com/n/20131103/6221.html', '下一页', '1', '2015-01-28 12:35:59');
INSERT INTO `pageurl` VALUES ('41912', 'http://www.lebazi.com/n/20131103/6223.html', '帮美女做胸部按摩GIF动图，美女我免费帮你', '1', '2015-01-28 12:35:59');
INSERT INTO `pageurl` VALUES ('41913', 'http://www.lebazi.com/n/20130612/1033.html', '尼玛，好大，有种就全脱了', '1', '2015-01-28 12:35:59');
INSERT INTO `pageurl` VALUES ('41914', 'http://www.lebazi.com/n/20140818/8366.html', '我是软妹子之高挑性感翘臀妹子邪恶内涵图集合：屌丝默默的撸一发吧！', '1', '2015-01-28 12:35:59');
INSERT INTO `pageurl` VALUES ('41915', 'http://www.lebazi.com/n/20141010/8586.html', '不看让你后悔不已的男女啪啪啪邪恶动态图：宅男撸管必备福利图片 未成年人勿进！', '1', '2015-01-28 12:35:59');
INSERT INTO `pageurl` VALUES ('41916', 'http://www.lebazi.com/n/20130627/3752.html', '主淫，偶好累。喵星人打盹gif动图', '1', '2015-01-28 12:35:59');
INSERT INTO `pageurl` VALUES ('41917', 'http://www.lebazi.com/n/20141207/8819.html', '爱与欲望之学园邪恶漫画：请和我交往', '1', '2015-01-28 12:35:59');
INSERT INTO `pageurl` VALUES ('41918', 'http://www.lebazi.com/n/20140623/7876.html', '乐张不入妖妖小精漫画全集_妖妖小精色系军团：有时间的时候', '1', '2015-01-28 12:35:59');
INSERT INTO `pageurl` VALUES ('41919', 'http://www.lebazi.com/n/20140917/8518.html', '少女漫画邪恶篇：思春期少女漫画在线阅读', '1', '2015-01-28 12:35:59');
INSERT INTO `pageurl` VALUES ('41920', 'http://www.lebazi.com/n/20130617/3434.html', '超高清PP对碰gif动态图片', '1', '2015-01-28 12:35:59');
INSERT INTO `pageurl` VALUES ('41921', 'http://www.lebazi.com/n/20141017/8646.html', '色小组二次元h邪恶漫画_大吴哥邪恶少女h漫画：一杯一次', '1', '2015-01-28 12:35:59');
INSERT INTO `pageurl` VALUES ('41922', 'http://www.lebazi.com/n/20141207/8815.html', '爱与欲望之学园邪恶漫画：献给自己喜欢的人', '1', '2015-01-28 12:35:59');
INSERT INTO `pageurl` VALUES ('41923', 'http://www.lebazi.com/n/20140612/7777.html', '少女爱情在线邪恶漫画：逃不掉的强奸', '1', '2015-01-28 12:35:59');
INSERT INTO `pageurl` VALUES ('41924', 'http://www.lebazi.com6004_2.html', '下一页', '1', '2015-01-28 12:35:59');
INSERT INTO `pageurl` VALUES ('41925', 'http://www.lebazi.com/n/20130916/6005.html', '如此性感美女图片我直接喷血了', '1', '2015-01-28 12:35:59');
INSERT INTO `pageurl` VALUES ('41926', 'http://www.lebazi.com/n/20130916/6003.html', '雷人囧图：美女们可千万别嫁给搞风水的人哇', '1', '2015-01-28 12:35:59');
INSERT INTO `pageurl` VALUES ('41927', 'http://www.lebazi.com8423_2.html', '下一页', '1', '2015-01-28 12:36:00');
INSERT INTO `pageurl` VALUES ('41928', 'http://www.lebazi.com/n/20140909/8463.html', '男子泄欲后竟想吃“霸王餐”，与失足女争执后将其杀害', '1', '2015-01-28 12:36:00');
INSERT INTO `pageurl` VALUES ('41929', 'http://www.lebazi.com/n/20140825/8390.html', '中国好胸器：樊玲因自拍胸夹手机照走红网络', '1', '2015-01-28 12:36:00');
INSERT INTO `pageurl` VALUES ('41930', 'http://www.lebazi.com/n/20140817/8311.html', '下一页', '1', '2015-01-28 12:36:00');
INSERT INTO `pageurl` VALUES ('41931', 'http://www.lebazi.com/n/20140818/8332.html', '色系军团蚂蚁与蜂蜜邪恶系列漫画全集：第二集 脱光检查', '1', '2015-01-28 12:36:00');
INSERT INTO `pageurl` VALUES ('41932', 'http://www.lebazi.com/n/20130610/957.html', '下一页', '1', '2015-01-28 12:36:00');
INSERT INTO `pageurl` VALUES ('41933', 'http://www.lebazi.com/n/20130610/959.html', '美女枪法真准啊', '1', '2015-01-28 12:36:00');
INSERT INTO `pageurl` VALUES ('41934', 'http://www.lebazi.com/n/20130803/5212.html', '下一页', '1', '2015-01-28 12:36:01');
INSERT INTO `pageurl` VALUES ('41935', 'http://www.lebazi.com/n/20130803/5214.html', '邪恶漫画之一样的感觉：亲爱的一直给我嘴能不能真诚一点啊', '1', '2015-01-28 12:36:01');
INSERT INTO `pageurl` VALUES ('41936', 'http://www.lebazi.com/n/20131009/6066.html', '下一页', '1', '2015-01-28 12:36:02');
INSERT INTO `pageurl` VALUES ('41937', 'http://www.lebazi.com/n/20131009/6068.html', '美女跳舞卖萌飞吻gif动图', '1', '2015-01-28 12:36:02');
INSERT INTO `pageurl` VALUES ('41938', 'http://www.lebazi.com/n/20130613/1059.html', '下一页', '1', '2015-01-28 12:36:03');
INSERT INTO `pageurl` VALUES ('41939', 'http://www.lebazi.com/n/20130613/1061.html', '哈哈，这人真的够衰的~', '1', '2015-01-28 12:36:03');
INSERT INTO `pageurl` VALUES ('41940', 'http://www.lebazi.com/n/20141012/8621.html', '韩国邪恶漫画“人鱼公主传”全集连载：第21集', '1', '2015-01-28 12:36:03');
INSERT INTO `pageurl` VALUES ('41941', 'http://www.lebazi.com/n/20130818/5727.html', '下一页', '1', '2015-01-28 12:36:04');
INSERT INTO `pageurl` VALUES ('41942', 'http://www.lebazi.com/n/20130818/5729.html', '邪恶漫画色系图片：检查视力_邪恶漫画全集', '1', '2015-01-28 12:36:04');
INSERT INTO `pageurl` VALUES ('41943', 'http://www.lebazi.com/n/20140812/8228.html', '下一页', '1', '2015-01-28 12:36:05');
INSERT INTO `pageurl` VALUES ('41944', 'http://www.lebazi.com/n/20140812/8230.html', '梦龙y传系列_梦龙y传漫画全集第8话：满足她', '1', '2015-01-28 12:36:05');
INSERT INTO `pageurl` VALUES ('41945', 'http://www.lebazi.com/n/20131115/6524.html', '下一页', '1', '2015-01-28 12:36:06');
INSERT INTO `pageurl` VALUES ('41946', 'http://www.lebazi.com/n/20140208/7032.html', '下一页', '1', '2015-01-28 12:36:06');
INSERT INTO `pageurl` VALUES ('41947', 'http://www.lebazi.com/n/20140208/7034.html', '色系军团邪恶漫画：金字塔密道出口', '1', '2015-01-28 12:36:06');
INSERT INTO `pageurl` VALUES ('41948', 'http://www.lebazi.com/n/20130526/483.html', '下一页', '1', '2015-01-28 12:36:07');
INSERT INTO `pageurl` VALUES ('41949', 'http://www.lebazi.com/n/20130526/487.html', '一招夺命脚，出奇制胜', '1', '2015-01-28 12:36:08');
INSERT INTO `pageurl` VALUES ('41950', 'http://www.lebazi.com/n/20130615/1121.html', '下一页', '1', '2015-01-28 12:36:09');
INSERT INTO `pageurl` VALUES ('41951', 'http://www.lebazi.com/n/20130615/1123.html', '男女搭配，干活不类，技术也不错~~', '1', '2015-01-28 12:36:09');
INSERT INTO `pageurl` VALUES ('41952', 'http://www.lebazi.com/n/20130610/964.html', '下一页', '1', '2015-01-28 12:36:17');
INSERT INTO `pageurl` VALUES ('41953', 'http://www.lebazi.com/n/20130610/966.html', '看你以后会嫁给~~~~', '1', '2015-01-28 12:36:17');
INSERT INTO `pageurl` VALUES ('41954', 'http://www.lebazi.com8162_2.html', '下一页', '1', '2015-01-28 12:36:18');
INSERT INTO `pageurl` VALUES ('41955', 'http://www.lebazi.com/n/20140730/8164.html', '少女漫画邪恶篇_日本少女h邪恶漫画：18禁少女纯情图', '1', '2015-01-28 12:36:18');
INSERT INTO `pageurl` VALUES ('41956', 'http://www.lebazi.com/n/20140730/8161.html', '少女动漫h漫画邪恶篇_少女邪恶漫画全集禁：秋空结合', '1', '2015-01-28 12:36:18');
INSERT INTO `pageurl` VALUES ('41957', 'http://www.lebazi.com/n/20130528/659.html', '超恶心版“两女一杯，两女一指”,吃饭之前请勿观看！', '1', '2015-01-28 12:36:18');
INSERT INTO `pageurl` VALUES ('41958', 'http://www.lebazi.com/n/20130527/606.html', '大学生被强制捐精的可怕内幕', '1', '2015-01-28 12:36:18');
INSERT INTO `pageurl` VALUES ('41959', 'http://www.lebazi.com/n/20140302/7291.html', '邪恶漫画不知火舞之生存：别撸了哥，留点力气吧', '1', '2015-01-28 12:36:18');
INSERT INTO `pageurl` VALUES ('41960', 'http://www.lebazi.com/n/20130804/5270.html', '齐B小拉链，一拉直到洞穴，快速方便', '1', '2015-01-28 12:36:18');
INSERT INTO `pageurl` VALUES ('41961', 'http://www.lebazi.com/n/20140917/8521.html', '日本二次元h邪恶漫画_少女h邪恶漫画：请再过来点啦', '1', '2015-01-28 12:36:18');
INSERT INTO `pageurl` VALUES ('41962', 'http://www.lebazi.com/n/20140210/7095.html', '牛人裸身顶冰圈gif动图：喂~索契奥组委吗？你们还差一个环在我这里！', '1', '2015-01-28 12:36:18');
INSERT INTO `pageurl` VALUES ('41963', 'http://www.lebazi.com/n/20130821/5780.html', '邪恶美女gif动图：美女，要不要我牺牲躺下这样会更真实一点', '1', '2015-01-28 12:36:18');
INSERT INTO `pageurl` VALUES ('41964', 'http://www.lebazi.com/n/20130610/990.html', '邪恶漫画：三次元美女', '1', '2015-01-28 12:36:18');
INSERT INTO `pageurl` VALUES ('41965', 'http://www.lebazi.com/n/20130709/4200.html', '色小组漫画：太平公主瞬间变身技巧', '1', '2015-01-28 12:36:18');
INSERT INTO `pageurl` VALUES ('41966', 'http://www.lebazi.com/n/20130610/979.html', '原来女生也搞基~~~', '1', '2015-01-28 12:36:18');
INSERT INTO `pageurl` VALUES ('41967', 'http://www.lebazi.com/n/20140812/8244.html', '梦龙y传系列_梦龙y传漫画全集第21话：诅咒被解除', '1', '2015-01-28 12:36:18');
INSERT INTO `pageurl` VALUES ('41968', 'http://www.lebazi.com/n/20130621/3566.html', '邪恶漫画：白雪公主，怎么贴上去的呢？', '1', '2015-01-28 12:36:18');
INSERT INTO `pageurl` VALUES ('41969', 'http://www.lebazi.com/n/20130831/5896.html', '不知火舞邪恶漫画集：误会_重口h邪恶漫画日本', '1', '2015-01-28 12:36:18');
INSERT INTO `pageurl` VALUES ('41970', 'http://www.lebazi.com/n/20140801/8179.html', '超邪恶漫画色系图片_邪恶漫画图片：化妆术', '1', '2015-01-28 12:36:18');
INSERT INTO `pageurl` VALUES ('41971', 'http://www.lebazi.com/n/20130802/5147.html', '下一页', '1', '2015-01-28 12:36:19');
INSERT INTO `pageurl` VALUES ('41972', 'http://www.lebazi.com/n/20130802/5149.html', '企鹅宝宝集体跳舞gif动态图片', '1', '2015-01-28 12:36:19');
INSERT INTO `pageurl` VALUES ('41973', 'http://www.lebazi.com/n/20140706/8005.html', '18进禁邪恶漫画_hhh女h邪恶漫画日本：手艺好的妻子', '1', '2015-01-28 12:36:19');
INSERT INTO `pageurl` VALUES ('41974', 'http://www.lebazi.com/n/20140715/8079.html', '下一页', '1', '2015-01-28 12:36:20');
INSERT INTO `pageurl` VALUES ('41975', 'http://www.lebazi.com/n/20140715/8081.html', '暴走漫画第二季脑残对话表情：跟你说过多少次了不要在网购了', '1', '2015-01-28 12:36:20');
INSERT INTO `pageurl` VALUES ('41976', 'http://www.lebazi.com/n/20130726/4902.html', '下一页', '1', '2015-01-28 12:36:20');
INSERT INTO `pageurl` VALUES ('41977', 'http://www.lebazi.com/n/20130726/4904.html', '美女脱衣服gif：妹子你好神速啊', '1', '2015-01-28 12:36:20');
INSERT INTO `pageurl` VALUES ('41978', 'http://www.lebazi.com8884_2.html', '下一页', '1', '2015-01-28 12:36:21');
INSERT INTO `pageurl` VALUES ('41979', 'http://www.lebazi.com/n/20141226/8885.html', '无翼鸟一库动漫少女h漫画：保龄球馆', '1', '2015-01-28 12:36:21');
INSERT INTO `pageurl` VALUES ('41980', 'http://www.lebazi.com/n/20141226/8883.html', '恋姐倾心邪恶少女漫画邪恶篇：性感女朋友', '1', '2015-01-28 12:36:21');
INSERT INTO `pageurl` VALUES ('41981', 'http://www.lebazi.com/n/20141017/8648.html', '下一页', '1', '2015-01-28 12:36:21');
INSERT INTO `pageurl` VALUES ('41982', 'http://www.lebazi.com/n/20141019/8650.html', '色小组二次元h邪恶漫画_大吴哥邪恶少女h漫画：随地小便', '1', '2015-01-28 12:36:21');
INSERT INTO `pageurl` VALUES ('41983', 'http://www.lebazi.com/n/20130718/4669.html', '下一页', '1', '2015-01-28 12:36:22');
INSERT INTO `pageurl` VALUES ('41984', 'http://www.lebazi.com/n/20130718/4671.html', '色小组漫画：人参之未婚男人和已婚男人的差别', '1', '2015-01-28 12:36:22');
INSERT INTO `pageurl` VALUES ('41985', 'http://www.lebazi.com/n/20150106/8901.html', '下一页', '1', '2015-01-28 12:36:22');
INSERT INTO `pageurl` VALUES ('41986', 'http://www.lebazi.com/n/20150106/8903.html', '邪恶内涵漫画全集：馋炒年糕', '1', '2015-01-28 12:36:22');
INSERT INTO `pageurl` VALUES ('41987', 'http://www.lebazi.com8456_2.html', '下一页', '1', '2015-01-28 12:36:23');
INSERT INTO `pageurl` VALUES ('41988', 'http://www.lebazi.com/n/20140906/8457.html', '少女h漫画邪恶篇大全_动漫美女邪恶漫画：哥哥真好', '1', '2015-01-28 12:36:23');
INSERT INTO `pageurl` VALUES ('41989', 'http://www.lebazi.com/n/20140906/8455.html', '披萨恋恋曲少女漫画邪恶篇143-152章节：小芝你在哪里？', '1', '2015-01-28 12:36:23');
INSERT INTO `pageurl` VALUES ('41990', 'http://www.lebazi.com/n/20140626/7941.html', '下一页', '1', '2015-01-28 12:36:23');
INSERT INTO `pageurl` VALUES ('41991', 'http://www.lebazi.com/n/20140626/7943.html', '色小组二次元h邪恶漫画_日本少女h邪恶漫画：体贴的娘子', '1', '2015-01-28 12:36:23');
INSERT INTO `pageurl` VALUES ('41992', 'http://www.lebazi.com/n/20130524/299.html', '下一页', '1', '2015-01-28 12:36:23');
INSERT INTO `pageurl` VALUES ('41993', 'http://www.lebazi.com/n/20130524/303.html', '这三个好嗨皮呀....', '1', '2015-01-28 12:36:24');
INSERT INTO `pageurl` VALUES ('41994', 'http://www.lebazi.com/n/20130528/626.html', '下一页', '1', '2015-01-28 12:36:24');
INSERT INTO `pageurl` VALUES ('41995', 'http://www.lebazi.com/n/20130528/628.html', '僵尸美女与美女你更喜欢哪个！', '1', '2015-01-28 12:36:24');
INSERT INTO `pageurl` VALUES ('41996', 'http://www.lebazi.com/n/20130525/470.html', '下一页', '1', '2015-01-28 12:36:25');
INSERT INTO `pageurl` VALUES ('41997', 'http://www.lebazi.com/n/20130525/472.html', '我只想对你说：“禽兽！”', '1', '2015-01-28 12:36:25');
INSERT INTO `pageurl` VALUES ('41998', 'http://www.lebazi.com/n/20140208/7036.html', '下一页', '1', '2015-01-28 12:36:25');
INSERT INTO `pageurl` VALUES ('41999', 'http://www.lebazi.com/n/20140817/8296.html', '下一页', '1', '2015-01-28 12:36:26');
INSERT INTO `pageurl` VALUES ('42000', 'http://www.lebazi.com/n/20140817/8298.html', '邪恶漫画色系军团寡妇三代漫画第13集：李梦龙传1', '1', '2015-01-28 12:36:26');
INSERT INTO `pageurl` VALUES ('42001', 'http://www.lebazi.com/n/20130528/662.html', '潘金莲龚玥菲全果与鸭子亲密接触，扬言要把苍老湿她赶回日本', '1', '2015-01-28 12:36:26');
INSERT INTO `pageurl` VALUES ('42002', 'http://www.lebazi.com/n/20130528/660.html', '悍马不算什么，在此神车的面前就是个渣，4.30秒被拖车了才搞笑', '1', '2015-01-28 12:36:26');
INSERT INTO `pageurl` VALUES ('42003', 'http://www.lebazi.com/n/20130618/3495.html', '下一页', '1', '2015-01-28 12:36:27');
INSERT INTO `pageurl` VALUES ('42004', 'http://www.lebazi.com/n/20130619/3497.html', '冰棒棍的终极玩法~原来冰棒棍也可以这样玩。喵星人都看呆了~', '1', '2015-01-28 12:36:27');
INSERT INTO `pageurl` VALUES ('42005', 'http://www.lebazi.com/n/20130524/310.html', '下一页', '1', '2015-01-28 12:36:27');
INSERT INTO `pageurl` VALUES ('42006', 'http://www.lebazi.com/n/20130525/335.html', 'come,大家跟我一起嗨皮起来！', '1', '2015-01-28 12:36:27');
INSERT INTO `pageurl` VALUES ('42007', 'http://www.lebazi.com/n/20131212/6875.html', '下一页', '1', '2015-01-28 12:36:27');
INSERT INTO `pageurl` VALUES ('42008', 'http://www.lebazi.com/n/20131212/6877.html', '烧烤群主gif动态图', '1', '2015-01-28 12:36:27');
INSERT INTO `pageurl` VALUES ('42009', 'http://www.lebazi.com/n/20131129/6795.html', 'QQ表情:甄嬛吐水', '1', '2015-01-28 12:36:27');
INSERT INTO `pageurl` VALUES ('42010', 'http://www.lebazi.com/n/20140715/8045.html', '下一页', '1', '2015-01-28 12:36:32');
INSERT INTO `pageurl` VALUES ('42011', 'http://www.lebazi.com/n/20140715/8047.html', '邪恶漫画不知火舞全集_无翼鸟邪恶漫画欲望：心烦的时候', '1', '2015-01-28 12:36:32');
INSERT INTO `pageurl` VALUES ('42012', 'http://www.lebazi.com/n/20140726/8140.html', '邪恶漫画不知火舞全集_18进禁邪恶漫画：飞机仓内', '1', '2015-01-28 12:36:33');
INSERT INTO `pageurl` VALUES ('42013', 'http://www.lebazi.com/n/20140715/8024.html', '下一页', '1', '2015-01-28 12:36:36');
INSERT INTO `pageurl` VALUES ('42014', 'http://www.lebazi.com/n/20140715/8026.html', '无翼鸟一库邪恶漫画_邪恶漫画爱丽丝学园：来来回回的海边', '1', '2015-01-28 12:36:36');
INSERT INTO `pageurl` VALUES ('42015', 'http://www.lebazi.com/n/20130815/5677.html', '下一页', '1', '2015-01-28 12:36:39');
INSERT INTO `pageurl` VALUES ('42016', 'http://www.lebazi.com/n/20130815/5679.html', '邪恶漫画爱丽丝学园_邪恶漫画色系图片之三流画家一流技术', '1', '2015-01-28 12:36:39');
INSERT INTO `pageurl` VALUES ('42017', 'http://www.lebazi.com/n/20131119/6540.html', '下一页', '1', '2015-01-28 12:36:39');
INSERT INTO `pageurl` VALUES ('42018', 'http://www.lebazi.com/n/20131119/6542.html', '色小组邪恶漫画全集：大鼻孔师兄的心思你们不懂的嘿_腾空术', '1', '2015-01-28 12:36:39');
INSERT INTO `pageurl` VALUES ('42019', 'http://www.lebazi.com/n/20130709/4195.html', '下一页', '1', '2015-01-28 12:36:43');
INSERT INTO `pageurl` VALUES ('42020', 'http://www.lebazi.com/n/20130709/4197.html', '邪恶漫画：“未来手机”多功能用途', '1', '2015-01-28 12:36:43');
INSERT INTO `pageurl` VALUES ('42021', 'http://www.lebazi.com/n/20140319/7560.html', '没内涵邪恶gif_色你妹gif动态图片：屌丝送女朋友的礼物好有创意', '1', '2015-01-28 12:36:43');
INSERT INTO `pageurl` VALUES ('42022', 'http://www.lebazi.com/n/20130610/975.html', '这个动作好像是在~~不解释', '1', '2015-01-28 12:36:43');
INSERT INTO `pageurl` VALUES ('42023', 'http://www.lebazi.com/n/20140916/8496.html', ' 邪恶美女诱惑内涵gif动态图精选：遮遮掩掩比全露更有趣', '1', '2015-01-28 12:36:43');
INSERT INTO `pageurl` VALUES ('42024', 'http://www.lebazi.com/n/20140104/6981.html', '2b青年gif动图：喝喝，要是在天朝，准备收尸吧', '1', '2015-01-28 12:36:43');
INSERT INTO `pageurl` VALUES ('42025', 'http://www.lebazi.com/n/20131103/6253.html', '吓一跳gif动图：头发从眼睛和嘴巴出来', '1', '2015-01-28 12:36:43');
INSERT INTO `pageurl` VALUES ('42026', 'http://www.lebazi.com/n/20130629/3840.html', '这个女主持人得有多杯具啊~', '1', '2015-01-28 12:36:43');
INSERT INTO `pageurl` VALUES ('42027', 'http://www.lebazi.com/n/20130626/3705.html', '尼玛，这是要逆天吗？老鼠也玩投篮，这主人真的太神了', '1', '2015-01-28 12:36:43');
INSERT INTO `pageurl` VALUES ('42028', 'http://www.lebazi.com/n/20131111/6460.html', '大吴哥娱乐邪恶漫画：绝对高手_办公室不许抽烟的朋友们，你们躺枪了没', '1', '2015-01-28 12:36:43');
INSERT INTO `pageurl` VALUES ('42029', 'http://www.lebazi.com/n/20140830/8428.html', '披萨恋恋曲少女漫画邪恶篇01-06章节：披萨来了', '1', '2015-01-28 12:36:43');
INSERT INTO `pageurl` VALUES ('42030', 'http://www.lebazi.com/n/20130702/3965.html', '色系军团之“人鱼公主传”结婚之前千万不要相信他（一）~', '1', '2015-01-28 12:36:43');
INSERT INTO `pageurl` VALUES ('42031', 'http://www.lebazi.com/n/20130712/4333.html', '色小组漫画：“震动超人”一系列的服务~最后亮了', '1', '2015-01-28 12:36:43');
INSERT INTO `pageurl` VALUES ('42032', 'http://www.lebazi.com/n/20130703/4017.html', '下一页', '1', '2015-01-28 12:36:46');
INSERT INTO `pageurl` VALUES ('42033', 'http://www.lebazi.com/n/20130706/4099.html', '邪恶漫画：朋友就是应该有福同享，有难就应该同当', '1', '2015-01-28 12:36:49');
INSERT INTO `pageurl` VALUES ('42034', 'http://www.lebazi.com8200_2.html', '下一页', '1', '2015-01-28 12:36:49');
INSERT INTO `pageurl` VALUES ('42035', 'http://www.lebazi.com/n/20140807/8201.html', '色小组二次元h动漫美女_狂野少女乳娘性感身材胸部纹身图集', '1', '2015-01-28 12:36:49');
INSERT INTO `pageurl` VALUES ('42036', 'http://www.lebazi.com/n/20140807/8199.html', '少女漫画h在线阅读_日本动漫h漫画：性感爆乳女老师', '1', '2015-01-28 12:36:49');
INSERT INTO `pageurl` VALUES ('42037', 'http://www.lebazi.com/n/20130524/296.html', '下一页', '1', '2015-01-28 12:36:49');
INSERT INTO `pageurl` VALUES ('42038', 'http://www.lebazi.com/n/20130524/298.html', '屌丝们的福利,好软!!!', '1', '2015-01-28 12:36:49');
INSERT INTO `pageurl` VALUES ('42039', 'http://www.lebazi.com5795_2.html', '下一页', '1', '2015-01-28 12:36:52');
INSERT INTO `pageurl` VALUES ('42040', 'http://www.lebazi.com/n/20130822/5807.html', '搞笑gif动图：小样，这就是不服我的下场', '1', '2015-01-28 12:36:52');
INSERT INTO `pageurl` VALUES ('42041', 'http://www.lebazi.com/n/20130821/5786.html', '成人gif动图：尼玛倒是把腿给张开啊，可急死老子我了', '1', '2015-01-28 12:36:52');
INSERT INTO `pageurl` VALUES ('42042', 'http://www.lebazi.com/n/20130815/5680.html', '下一页', '1', '2015-01-28 12:36:55');
INSERT INTO `pageurl` VALUES ('42043', 'http://www.lebazi.com/n/20130815/5682.html', '重口h邪恶漫画日本_色小组漫画全集之怀念初恋', '1', '2015-01-28 12:36:55');
INSERT INTO `pageurl` VALUES ('42044', 'http://www.lebazi.com/n/20140826/8403.html', '万万没想到优酷搞笑视频番外篇第1话：导演外出了', '1', '2015-01-28 12:36:56');
INSERT INTO `pageurl` VALUES ('42045', 'http://www.lebazi.com/n/20140826/8401.html', '万万没想到优酷搞笑视频第9集：大丈夫许仙', '1', '2015-01-28 12:36:56');
INSERT INTO `pageurl` VALUES ('42046', 'http://www.lebazi.com/n/20130525/379.html', '下一页', '1', '2015-01-28 12:36:58');
INSERT INTO `pageurl` VALUES ('42047', 'http://www.lebazi.com/n/20130525/381.html', '我鄙视你！我鄙视你！', '1', '2015-01-28 12:36:58');
INSERT INTO `pageurl` VALUES ('42048', 'http://www.lebazi.com/n/20130715/4510.html', '下一页', '1', '2015-01-28 12:36:58');
INSERT INTO `pageurl` VALUES ('42049', 'http://www.lebazi.com/n/20130715/4512.html', '内衣美女gif动态图片诱惑', '1', '2015-01-28 12:36:58');
INSERT INTO `pageurl` VALUES ('42050', 'http://www.lebazi.com/n/20130813/5569.html', '下一页', '1', '2015-01-28 12:37:01');
INSERT INTO `pageurl` VALUES ('42051', 'http://www.lebazi.com/n/20130813/5571.html', '撞车gif动图：哥，你这技术不错，但是还是撞了哦', '1', '2015-01-28 12:37:01');
INSERT INTO `pageurl` VALUES ('42052', 'http://www.lebazi.com/n/20130531/797.html', '下一页', '1', '2015-01-28 12:37:01');
INSERT INTO `pageurl` VALUES ('42053', 'http://www.lebazi.com/n/20130531/799.html', '好喝吗？嗯嗯嗯！', '1', '2015-01-28 12:37:01');
INSERT INTO `pageurl` VALUES ('42054', 'http://www.lebazi.com/n/20140302/7283.html', '不知火舞邪恶漫画集之解绳索：哥这不公平，你也要添人家下面才行', '1', '2015-01-28 12:37:01');
INSERT INTO `pageurl` VALUES ('42055', 'http://www.lebazi.com/n/20141012/8602.html', '韩国邪恶漫画“人鱼公主传”全集连载：第02集', '1', '2015-01-28 12:37:01');
INSERT INTO `pageurl` VALUES ('42056', 'http://www.lebazi.com/n/20130620/3516.html', '邪恶漫画：一日之计在于晨，把你的手放下来', '1', '2015-01-28 12:37:01');
INSERT INTO `pageurl` VALUES ('42057', 'http://www.lebazi.com/n/20130620/3525.html', '难道这就是所谓的胖子多米诺骨牌效应吗？', '1', '2015-01-28 12:37:01');
INSERT INTO `pageurl` VALUES ('42058', 'http://www.lebazi.com/n/20140719/8108.html', '又黄又色邪恶成人gif搞笑动态图片：最全日本街头千年杀爆菊gif动态图片', '1', '2015-01-28 12:37:01');
INSERT INTO `pageurl` VALUES ('42059', 'http://www.lebazi.com/n/20140316/7525.html', '电影《灵魂战车》人物变火gif动态图', '1', '2015-01-28 12:37:01');
INSERT INTO `pageurl` VALUES ('42060', 'http://www.lebazi.com/n/20130727/4921.html', '2B男搞笑gif：大哥你到底是想闹哪样嘛？', '1', '2015-01-28 12:37:01');
INSERT INTO `pageurl` VALUES ('42061', 'http://www.lebazi.com/n/20130617/3438.html', '大哥，你这下真的是杯具了。爆菊邪恶gif动图~', '1', '2015-01-28 12:37:01');
INSERT INTO `pageurl` VALUES ('42062', 'http://www.lebazi.com/n/20141210/8841.html', '无翼鸟一库邪恶漫画：酒后行窃', '1', '2015-01-28 12:37:01');
INSERT INTO `pageurl` VALUES ('42063', 'http://www.lebazi.com/n/20140305/7351.html', '不知火舞h邪恶漫画集：我的女友是歌手', '1', '2015-01-28 12:37:01');
INSERT INTO `pageurl` VALUES ('42064', 'http://www.lebazi.com/n/20130530/751.html', '色系军团：之“无人岛”', '1', '2015-01-28 12:37:01');
INSERT INTO `pageurl` VALUES ('42065', 'http://www.lebazi.com/n/20140617/7818.html', '18进禁邪恶漫画全集_邪恶漫画不知火舞全集：组长的变卦', '1', '2015-01-28 12:37:01');
INSERT INTO `pageurl` VALUES ('42066', 'http://www.lebazi.com/n/20131108/6296.html', '邪恶漫画色系军团图片：审美疲劳_A片爱好者们聚会上的谈话', '1', '2015-01-28 12:37:01');
INSERT INTO `pageurl` VALUES ('42067', 'http://www.lebazi.com/n/20130818/5723.html', '18进禁邪恶漫画：神秘的声音_邪恶漫画爱丽丝学园', '1', '2015-01-28 12:37:01');
INSERT INTO `pageurl` VALUES ('42068', 'http://www.lebazi.com/n/20140818/8329.html', '土豆《神街访》街头采访爆笑视频：你能接受男友是双性恋吗？', '1', '2015-01-28 12:37:03');
INSERT INTO `pageurl` VALUES ('42069', 'http://www.lebazi.com8476_2.html', '下一页', '1', '2015-01-28 12:37:03');
INSERT INTO `pageurl` VALUES ('42070', 'http://www.lebazi.com/n/20140913/8477.html', '吃果果大作战动漫邪恶少女漫画第10章：保姆', '1', '2015-01-28 12:37:03');
INSERT INTO `pageurl` VALUES ('42071', 'http://www.lebazi.com/n/20140913/8475.html', '吃果果大作战动漫邪恶少女漫画第8章：姐姐的内裤', '1', '2015-01-28 12:37:03');
INSERT INTO `pageurl` VALUES ('42072', 'http://www.lebazi.com/n/20130803/5215.html', '下一页', '1', '2015-01-28 12:37:05');
INSERT INTO `pageurl` VALUES ('42073', 'http://www.lebazi.com/n/20130804/5334.html', '18禁漫画之旋转风车：禽兽你要干什么', '1', '2015-01-28 12:37:05');
INSERT INTO `pageurl` VALUES ('42074', 'http://www.lebazi.com/n/20140812/8249.html', '梦龙y传系列_梦龙y传漫画全集第26话：秘密武器', '1', '2015-01-28 12:37:06');
INSERT INTO `pageurl` VALUES ('42075', 'http://www.lebazi.com8779_2.html', '下一页', '1', '2015-01-28 12:37:06');
INSERT INTO `pageurl` VALUES ('42076', 'http://www.lebazi.com/n/20141201/8799.html', '恋姐倾心邪恶少女漫画：猫咪的骚扰好困扰', '1', '2015-01-28 12:37:06');
INSERT INTO `pageurl` VALUES ('42077', 'http://www.lebazi.com/n/20141125/8778.html', '小黄哥爱看少女漫画：欲望学园邪恶篇', '1', '2015-01-28 12:37:06');
INSERT INTO `pageurl` VALUES ('42078', 'http://www.lebazi.com/n/20130528/675.html', '下一页', '1', '2015-01-28 12:37:06');
INSERT INTO `pageurl` VALUES ('42079', 'http://www.lebazi.com/n/20130530/743.html', '邪恶漫画：YOga翻转魔术师之“胸部的福利”', '1', '2015-01-28 12:37:06');
INSERT INTO `pageurl` VALUES ('42080', 'http://www.lebazi.com/n/20130804/5324.html', '下一页', '1', '2015-01-28 12:37:08');
INSERT INTO `pageurl` VALUES ('42081', 'http://www.lebazi.com/n/20130804/5328.html', '美女卖萌gif动图：你想我了吗？', '1', '2015-01-28 12:37:12');
INSERT INTO `pageurl` VALUES ('42082', 'http://www.lebazi.com/n/20140720/8114.html', '超邪恶让你受不了的诱惑视频：吴若羚 台湾的肚皮舞教师 女佣艳舞', '1', '2015-01-28 12:37:14');
INSERT INTO `pageurl` VALUES ('42083', 'http://www.lebazi.com/n/20140716/8088.html', '国外搞笑视频集锦_搞笑视频笑死人短片：越南星人拍真人版哆啦A梦毁童年 画面太美不敢看', '1', '2015-01-28 12:37:14');
INSERT INTO `pageurl` VALUES ('42084', 'http://www.lebazi.com/n/20131129/6792.html', '下一页', '1', '2015-01-28 12:37:17');
INSERT INTO `pageurl` VALUES ('42085', 'http://www.lebazi.com8803_2.html', '下一页', '1', '2015-01-28 12:37:21');
INSERT INTO `pageurl` VALUES ('42086', 'http://www.lebazi.com/n/20141201/8804.html', '无翼鸟邪恶漫画全集：H的宠物', '1', '2015-01-28 12:37:21');
INSERT INTO `pageurl` VALUES ('42087', 'http://www.lebazi.com/n/20141201/8802.html', '无翼鸟动漫少女h漫画：轻柔的少女', '1', '2015-01-28 12:37:21');
INSERT INTO `pageurl` VALUES ('42088', 'http://www.lebazi.com8817_2.html', '下一页', '1', '2015-01-28 12:37:21');
INSERT INTO `pageurl` VALUES ('42089', 'http://www.lebazi.com/n/20141207/8818.html', '恋姐倾心邪恶少女漫画：妹妹的宝物', '1', '2015-01-28 12:37:21');
INSERT INTO `pageurl` VALUES ('42090', 'http://www.lebazi.com/n/20141207/8816.html', '无翼鸟动漫少女h漫画：最喜欢哥哥', '1', '2015-01-28 12:37:21');
INSERT INTO `pageurl` VALUES ('42091', 'http://www.lebazi.com/n/20131103/6231.html', '春哥舞台霸气跳舞gif动图', '1', '2015-01-28 12:37:24');
INSERT INTO `pageurl` VALUES ('42092', 'http://www.lebazi.com/n/20140512/7686.html', '下一页', '1', '2015-01-28 12:37:26');
INSERT INTO `pageurl` VALUES ('42093', 'http://www.lebazi.com/n/20140512/7688.html', '色系军团邪恶漫画：愚人的礼物', '1', '2015-01-28 12:37:26');
INSERT INTO `pageurl` VALUES ('42094', 'http://www.lebazi.com7794_2.html', '下一页', '1', '2015-01-28 12:37:28');
INSERT INTO `pageurl` VALUES ('42095', 'http://www.lebazi.com/n/20140616/7795.html', '少女爱情在线邪恶漫画_大吴哥邪恶少女漫画：少女滑雪真的是好困扰啊', '1', '2015-01-28 12:37:28');
INSERT INTO `pageurl` VALUES ('42096', 'http://www.lebazi.com/n/20140613/7783.html', '少女h漫画大全_大吴哥邪恶少女漫画：少女被怪物纠缠，韩国内涵漫画', '1', '2015-01-28 12:37:28');
INSERT INTO `pageurl` VALUES ('42097', 'http://www.lebazi.com/n/20130626/3666.html', '下一页', '1', '2015-01-28 12:37:30');
INSERT INTO `pageurl` VALUES ('42098', 'http://www.lebazi.com/n/20130626/3668.html', '很好奇叫的究竟有多大声~', '1', '2015-01-28 12:37:30');
INSERT INTO `pageurl` VALUES ('42099', 'http://www.lebazi.com/n/20130818/5731.html', '下一页', '1', '2015-01-28 12:37:31');
INSERT INTO `pageurl` VALUES ('42100', 'http://www.lebazi.com/n/20140617/7807.html', '下一页', '1', '2015-01-28 12:37:31');
INSERT INTO `pageurl` VALUES ('42101', 'http://www.lebazi.com/n/20141023/8672.html', '那女XXOO后脑残对话之糗人糗事：人家是第一次 你可要负责呢', '1', '2015-01-28 12:37:31');
INSERT INTO `pageurl` VALUES ('42102', 'http://www.lebazi.com/n/20140302/7294.html', '下一页', '1', '2015-01-28 12:37:32');
INSERT INTO `pageurl` VALUES ('42103', 'http://www.lebazi.com/n/20140305/7350.html', '18禁邪恶漫画色系图片：另有目的', '1', '2015-01-28 12:37:32');
INSERT INTO `pageurl` VALUES ('42104', 'http://www.lebazi.com/n/20131126/6729.html', '色系军团邪恶漫画不知火舞H：二逼青年教你换灯泡，千万不要学_诱惑', '1', '2015-01-28 12:37:32');
INSERT INTO `pageurl` VALUES ('42105', 'http://www.lebazi.com/n/20130728/4988.html', '下一页', '1', '2015-01-28 12:37:34');
INSERT INTO `pageurl` VALUES ('42106', 'http://www.lebazi.com/n/20130728/4990.html', '色系军团漫画之小混混1：好吧，我们一起玩吧', '1', '2015-01-28 12:37:34');
INSERT INTO `pageurl` VALUES ('42107', 'http://www.lebazi.com/n/20130902/5933.html', '2b青年gif动图：你小伙子挺机智的嘛', '1', '2015-01-28 12:37:34');
INSERT INTO `pageurl` VALUES ('42108', 'http://www.lebazi.com/n/20130529/714.html', '亲一个嘛？不行，你有口臭！', '1', '2015-01-28 12:37:34');
INSERT INTO `pageurl` VALUES ('42109', 'http://www.lebazi.com/n/20130701/3959.html', '邪恶漫画之“终于上钩了，三思而行啊~”', '1', '2015-01-28 12:37:34');
INSERT INTO `pageurl` VALUES ('42110', 'http://www.lebazi.com/n/20140306/7392.html', '邪恶漫画不知火舞：雨后禅坐_重口h邪恶漫画日本', '1', '2015-01-28 12:37:34');
INSERT INTO `pageurl` VALUES ('42111', 'http://www.lebazi.com/n/20131103/6237.html', '坑爹啊gif动图：还以为是涨洪水了', '1', '2015-01-28 12:37:34');
INSERT INTO `pageurl` VALUES ('42112', 'http://www.lebazi.com/n/20140323/7602.html', '周星驰星爷《九品芝麻官》在日上映！其中那段吵架换成日语会怎么样？', '1', '2015-01-28 12:37:34');
INSERT INTO `pageurl` VALUES ('42113', 'http://www.lebazi.com/n/20130722/4727.html', '色系军团漫画之“三只小猪”：我其实不是存心搞破坏的', '1', '2015-01-28 12:37:34');
INSERT INTO `pageurl` VALUES ('42114', 'http://www.lebazi.com/n/20130713/4359.html', '搞笑gif：2B青年往可乐里面放薄荷gif动图', '1', '2015-01-28 12:37:34');
INSERT INTO `pageurl` VALUES ('42115', 'http://www.lebazi.com/n/20130828/5876.html', '邪恶漫画色系图片：万能小助手_18进禁邪恶漫画', '1', '2015-01-28 12:37:34');
INSERT INTO `pageurl` VALUES ('42116', 'http://www.lebazi.com/n/20130812/5495.html', '不知火舞邪恶漫画集之造物弄人', '1', '2015-01-28 12:37:34');
INSERT INTO `pageurl` VALUES ('42117', 'http://www.lebazi.com/n/20140319/7547.html', '全彩h邪恶漫画日本_日本邪恶漫画：菇凉你看哪只手上的老茧多就是哪只_左边还是右边', '1', '2015-01-28 12:37:34');
INSERT INTO `pageurl` VALUES ('42118', 'http://www.lebazi.com/n/20141017/8647.html', '无翼鸟邪恶漫画全集_无翼鸟一库邪恶漫画：能成的店', '1', '2015-01-28 12:37:34');
INSERT INTO `pageurl` VALUES ('42119', 'http://www.lebazi.com/n/20140812/8236.html', '梦龙y传系列_梦龙y传漫画全集第14话：练级', '1', '2015-01-28 12:37:34');
INSERT INTO `pageurl` VALUES ('42120', 'http://www.lebazi.com8211_2.html', '下一页', '1', '2015-01-28 12:37:34');
INSERT INTO `pageurl` VALUES ('42121', 'http://www.lebazi.com/n/20140812/8223.html', '梦龙y传系列_梦龙y传漫画全集第1话：插进去', '1', '2015-01-28 12:37:34');
INSERT INTO `pageurl` VALUES ('42122', 'http://www.lebazi.com/n/20140626/7945.html', '下一页', '1', '2015-01-28 12:37:35');
INSERT INTO `pageurl` VALUES ('42123', 'http://www.lebazi.com/n/20140626/7947.html', '色小组二次元h邪恶漫画_大吴哥邪恶少女h漫画：给男朋友的小套套', '1', '2015-01-28 12:37:35');
INSERT INTO `pageurl` VALUES ('42124', 'http://www.lebazi.com/n/20131112/6497.html', '超级搞笑视频：2012世界末日,你组队登船了么！', '1', '2015-01-28 12:37:37');
INSERT INTO `pageurl` VALUES ('42125', 'http://www.lebazi.com/n/20131112/6493.html', '搞笑视频集锦：比基尼美女海滩摆拍惊现的意外!', '1', '2015-01-28 12:37:38');
INSERT INTO `pageurl` VALUES ('42126', 'http://www.lebazi.com/n/20130811/5490.html', '下一页', '1', '2015-01-28 12:37:40');
INSERT INTO `pageurl` VALUES ('42127', 'http://www.lebazi.com/n/20130812/5492.html', '18进禁邪恶漫画全集之酒的危害', '1', '2015-01-28 12:37:40');
INSERT INTO `pageurl` VALUES ('42128', 'http://www.lebazi.com/n/20130803/5192.html', '牛人瞬间逃离火车gif动图：这肯定是开挂了', '1', '2015-01-28 12:37:40');
INSERT INTO `pageurl` VALUES ('42129', 'http://www.lebazi.com/n/20140620/7869.html', '少女爱情在线邪恶漫画_恋姐倾心h漫画：爱的主人', '1', '2015-01-28 12:37:40');
INSERT INTO `pageurl` VALUES ('42130', 'http://www.lebazi.com/n/20130727/4923.html', '比基尼美女坐气球gif动图', '1', '2015-01-28 12:37:40');
INSERT INTO `pageurl` VALUES ('42131', 'http://www.lebazi.com/n/20140623/7875.html', '乐张不入妖妖小精漫画全集_妖妖小精色系军团：独特的女子', '1', '2015-01-28 12:37:40');
INSERT INTO `pageurl` VALUES ('42132', 'http://www.lebazi.com/n/20140916/8492.html', '各种雷人牛人搞笑动态图精选：友谊就这样走到了尽头', '1', '2015-01-28 12:37:40');
INSERT INTO `pageurl` VALUES ('42133', 'http://www.lebazi.com/n/20130709/4210.html', '给鼠星人洗澡gif动图：好像在撸管一样有木有', '1', '2015-01-28 12:37:40');
INSERT INTO `pageurl` VALUES ('42134', 'http://www.lebazi.com/n/20130718/4664.html', '寡妇三代邪恶漫画：夜半磨刀之要懂得长幼有序', '1', '2015-01-28 12:37:40');
INSERT INTO `pageurl` VALUES ('42135', 'http://www.lebazi.com/n/20140921/8540.html', '豪乳美女许诺湿身透视挑逗诱惑：想跟她xxoo的赞一个', '1', '2015-01-28 12:37:40');
INSERT INTO `pageurl` VALUES ('42136', 'http://www.lebazi.com/n/20140801/8184.html', '邪恶mm漫画色系图片_日本美女邪恶漫画：恋人的变化', '1', '2015-01-28 12:37:40');
INSERT INTO `pageurl` VALUES ('42137', 'http://www.lebazi.com/n/20140825/8384.html', '少女漫画邪恶篇：二次元h动漫爆乳美女双乳火星撞地球图片', '1', '2015-01-28 12:37:40');
INSERT INTO `pageurl` VALUES ('42138', 'http://www.lebazi.com/n/20130701/3952.html', '色系军团之“MM的苦恼”这孩子TMD到底是谁的啊~', '1', '2015-01-28 12:37:40');
INSERT INTO `pageurl` VALUES ('42139', 'http://www.lebazi.com/n/20140305/7353.html', '邪恶漫画不知火舞漫画集：重要的考试', '1', '2015-01-28 12:37:40');
INSERT INTO `pageurl` VALUES ('42140', 'http://www.lebazi.com/n/20141124/8772.html', '恋姐倾心少女h漫画邪恶篇：和护士一起', '1', '2015-01-28 12:37:40');
INSERT INTO `pageurl` VALUES ('42141', 'http://www.lebazi.com/n/20130707/4111.html', '下一页', '1', '2015-01-28 12:37:41');
INSERT INTO `pageurl` VALUES ('42142', 'http://www.lebazi.com/n/20130707/4113.html', '这是一个意外，美女不是故意的。', '1', '2015-01-28 12:37:41');
INSERT INTO `pageurl` VALUES ('42143', 'http://www.lebazi.com/n/20130623/3592.html', '下一页', '1', '2015-01-28 12:37:42');
INSERT INTO `pageurl` VALUES ('42144', 'http://www.lebazi.com/n/20130623/3594.html', '想吃吗？先夸我漂亮就给你吃哦~', '1', '2015-01-28 12:37:42');
INSERT INTO `pageurl` VALUES ('42145', 'http://www.lebazi.com/n/20130525/365.html', '下一页', '1', '2015-01-28 12:37:43');
INSERT INTO `pageurl` VALUES ('42146', 'http://www.lebazi.com/n/20130525/367.html', '我好怕怕喔。。。', '1', '2015-01-28 12:37:43');
INSERT INTO `pageurl` VALUES ('42147', 'http://www.lebazi.com8881_2.html', '下一页', '1', '2015-01-28 12:37:43');
INSERT INTO `pageurl` VALUES ('42148', 'http://www.lebazi.com/n/20141227/8891.html', '宅男福利图：爆乳妹子浴室湿身诱惑自拍', '1', '2015-01-28 12:37:43');
INSERT INTO `pageurl` VALUES ('42149', 'http://www.lebazi.com/n/20141224/8879.html', '中国好胸器（第30期）微博@美模部美女着圣诞制服祝贺宅男屌丝圣诞快乐！', '1', '2015-01-28 12:37:43');
INSERT INTO `pageurl` VALUES ('42150', 'http://www.lebazi.com/n/20130713/4376.html', '下一页', '1', '2015-01-28 12:37:45');
INSERT INTO `pageurl` VALUES ('42151', 'http://www.lebazi.com/n/20130713/4378.html', '美女摔跤gif动图：真的好淡定啊', '1', '2015-01-28 12:37:45');
INSERT INTO `pageurl` VALUES ('42152', 'http://www.lebazi.com/n/20130715/4520.html', '下一页', '1', '2015-01-28 12:37:46');
INSERT INTO `pageurl` VALUES ('42153', 'http://www.lebazi.com/n/20130715/4522.html', '色系军团漫画：女人的创造能力之我可以摸一下吗？', '1', '2015-01-28 12:37:46');
INSERT INTO `pageurl` VALUES ('42154', 'http://www.lebazi.com/n/20130818/5710.html', '下一页', '1', '2015-01-28 12:37:47');
INSERT INTO `pageurl` VALUES ('42155', 'http://www.lebazi.com/n/20130818/5719.html', '搞笑整人gif动图：这哥们的蛋蛋这下杯具了', '1', '2015-01-28 12:37:47');
INSERT INTO `pageurl` VALUES ('42156', 'http://www.lebazi.com/n/20140208/7039.html', '色系军团邪恶漫画：隐形眼镜的需要', '1', '2015-01-28 12:37:49');
INSERT INTO `pageurl` VALUES ('42157', 'http://www.lebazi.com/n/20130601/924.html', '下一页', '1', '2015-01-28 12:37:51');
INSERT INTO `pageurl` VALUES ('42158', 'http://www.lebazi.com/n/20130609/948.html', '色小组：天使和恶魔....', '1', '2015-01-28 12:37:51');
INSERT INTO `pageurl` VALUES ('42159', 'http://www.lebazi.com/n/20140812/8246.html', '下一页', '1', '2015-01-28 12:37:52');
INSERT INTO `pageurl` VALUES ('42160', 'http://www.lebazi.com/n/20140302/7286.html', '下一页', '1', '2015-01-28 12:37:52');
INSERT INTO `pageurl` VALUES ('42161', 'http://www.lebazi.com/n/20140302/7288.html', '邪恶漫画爱丽丝学园之礼貌的男友：哥你到底有多少毛病', '1', '2015-01-28 12:37:53');
INSERT INTO `pageurl` VALUES ('42162', 'http://www.lebazi.com7772_2.html', '下一页', '1', '2015-01-28 12:37:53');
INSERT INTO `pageurl` VALUES ('42163', 'http://www.lebazi.com/n/20140610/7773.html', '少女爱情在线漫画邪恶篇：新婚的第一天', '1', '2015-01-28 12:37:53');
INSERT INTO `pageurl` VALUES ('42164', 'http://www.lebazi.com/n/20140610/7771.html', '少女漫画_狂野少女漫画邪恶篇：好软的小维', '1', '2015-01-28 12:37:53');
INSERT INTO `pageurl` VALUES ('42165', 'http://www.lebazi.com8281_2.html', '下一页', '1', '2015-01-28 12:38:01');
INSERT INTO `pageurl` VALUES ('42166', 'http://www.lebazi.com/n/20140816/8286.html', '邪恶漫画色系军团寡妇三代漫画第1集：漫漫长夜', '1', '2015-01-28 12:38:01');
INSERT INTO `pageurl` VALUES ('42167', 'http://www.lebazi.com8279_2.html', '下一页', '1', '2015-01-28 12:38:04');
INSERT INTO `pageurl` VALUES ('42168', 'http://www.lebazi.com/n/20140814/8275.html', '邪恶漫画色图片全集：不走寻常路', '1', '2015-01-28 12:38:04');
INSERT INTO `pageurl` VALUES ('42169', 'http://www.lebazi.com/n/20131111/6457.html', '下一页', '1', '2015-01-28 12:38:05');
INSERT INTO `pageurl` VALUES ('42170', 'http://www.lebazi.com/n/20131111/6459.html', '初音未来h邪恶漫画：死神_被爱情蒙蔽了双眼就看不到死神了', '1', '2015-01-28 12:38:05');
INSERT INTO `pageurl` VALUES ('42171', 'http://www.lebazi.com/n/20131122/6573.html', '邪恶漫画色系军团图片：大叔你该带D罩杯的才行吧_慢跑', '1', '2015-01-28 12:38:05');
INSERT INTO `pageurl` VALUES ('42172', 'http://www.lebazi.com/n/20130712/4299.html', '下一页', '1', '2015-01-28 12:38:07');
INSERT INTO `pageurl` VALUES ('42173', 'http://www.lebazi.com/n/20130712/4308.html', '美女扭屁股gif图：身体摆动的好好有木有', '1', '2015-01-28 12:38:07');
INSERT INTO `pageurl` VALUES ('42174', 'http://www.lebazi.com/n/20140312/7484.html', '下一页', '1', '2015-01-28 12:38:08');
INSERT INTO `pageurl` VALUES ('42175', 'http://www.lebazi.com/n/20140312/7486.html', '没内涵邪恶gif动态：经典三级片～爆笑！', '1', '2015-01-28 12:38:08');
INSERT INTO `pageurl` VALUES ('42176', 'http://www.lebazi.com/n/20130618/3476.html', '下一页', '1', '2015-01-28 12:38:09');
INSERT INTO `pageurl` VALUES ('42177', 'http://www.lebazi.com/n/20130618/3478.html', '你们猜我内衣是多少钱买的~', '1', '2015-01-28 12:38:09');
INSERT INTO `pageurl` VALUES ('42178', 'http://www.lebazi.com/n/20130524/293.html', '妹子,你这一下子玩笑开的太大了', '1', '2015-01-28 12:38:09');
INSERT INTO `pageurl` VALUES ('42179', 'http://www.lebazi.com/n/20130726/4915.html', '下一页', '1', '2015-01-28 12:38:12');
INSERT INTO `pageurl` VALUES ('42180', 'http://www.lebazi.com/n/20130726/4917.html', '邪恶漫画之酒后的报仇：怎么回事？一点也记不起来了', '1', '2015-01-28 12:38:12');
INSERT INTO `pageurl` VALUES ('42181', 'http://www.lebazi.com/n/20130713/4360.html', '下一页', '1', '2015-01-28 12:38:14');
INSERT INTO `pageurl` VALUES ('42182', 'http://www.lebazi.com/n/20130713/4362.html', '好基友gif动图：就是喜欢搞基，妹子绝望吧', '1', '2015-01-28 12:38:14');
INSERT INTO `pageurl` VALUES ('42183', 'http://www.lebazi.com/n/20130816/5696.html', '色小组漫画全集之今天很虚弱_邪恶漫画爱丽丝学园', '1', '2015-01-28 12:38:14');
INSERT INTO `pageurl` VALUES ('42184', 'http://www.lebazi.com/n/20140512/7678.html', '下一页', '1', '2015-01-28 12:38:16');
INSERT INTO `pageurl` VALUES ('42185', 'http://www.lebazi.com8210_2.html', '下一页', '1', '2015-01-28 12:38:16');
INSERT INTO `pageurl` VALUES ('42186', 'http://www.lebazi.com/n/20140807/8208.html', '思春期少女h漫画大全_邪恶漫画少女漫画h在线阅读：恋姐倾心（第三集）', '1', '2015-01-28 12:38:16');
INSERT INTO `pageurl` VALUES ('42187', 'http://www.lebazi.com/n/20130714/4444.html', '下一页', '1', '2015-01-28 12:38:19');
INSERT INTO `pageurl` VALUES ('42188', 'http://www.lebazi.com/n/20130702/3962.html', '下一页', '1', '2015-01-28 12:38:20');
INSERT INTO `pageurl` VALUES ('42189', 'http://www.lebazi.com/n/20140812/8253.html', '梦龙y传系列_梦龙y传漫画全集第30话：爱的奴隶', '1', '2015-01-28 12:38:22');
INSERT INTO `pageurl` VALUES ('42190', 'http://www.lebazi.com/n/20130622/3572.html', '下一页', '1', '2015-01-28 12:38:23');
INSERT INTO `pageurl` VALUES ('42191', 'http://www.lebazi.com/n/20130622/3576.html', '尼玛，现在的衣服质量越来越差了~', '1', '2015-01-28 12:38:23');
INSERT INTO `pageurl` VALUES ('42192', 'http://www.lebazi.com/n/20130525/413.html', '下一页', '1', '2015-01-28 12:38:24');
INSERT INTO `pageurl` VALUES ('42193', 'http://www.lebazi.com/n/20130525/415.html', '谁开车开的这么的凶猛？', '1', '2015-01-28 12:38:24');
INSERT INTO `pageurl` VALUES ('42194', 'http://www.lebazi.com/n/20130519/63.html', '下一页', '1', '2015-01-28 12:38:26');
INSERT INTO `pageurl` VALUES ('42195', 'http://www.lebazi.com/n/20130519/65.html', '邪恶漫画：泰山，你到底要做什么？', '1', '2015-01-28 12:38:26');
INSERT INTO `pageurl` VALUES ('42196', 'http://www.lebazi.com/n/20130630/3930.html', '下一页', '1', '2015-01-28 12:38:26');
INSERT INTO `pageurl` VALUES ('42197', 'http://www.lebazi.com/n/20130630/3932.html', '小汪星人，你们不要在马路上亲亲我我好不好~你让你们的主淫情何以堪啊~', '1', '2015-01-28 12:38:27');
INSERT INTO `pageurl` VALUES ('42198', 'http://www.lebazi.com/n/20140323/7583.html', '56网视频：解密李小龙功夫之王之谜！', '1', '2015-01-28 12:38:27');
INSERT INTO `pageurl` VALUES ('42199', 'http://www.lebazi.com/n/20130519/86.html', '明星跳水神马的跟长颈鹿比，弱爆棚了！', '1', '2015-01-28 12:38:27');
INSERT INTO `pageurl` VALUES ('42200', 'http://www.lebazi.com/n/20140917/8516.html', '男女激情啪啪啪邪恶内涵gif动态图精选：宅男撸管必备福利图片', '1', '2015-01-28 12:38:27');
INSERT INTO `pageurl` VALUES ('42201', 'http://www.lebazi.com/n/20130717/4624.html', '体操MM跨一字gif动图第九弹', '1', '2015-01-28 12:38:27');
INSERT INTO `pageurl` VALUES ('42202', 'http://www.lebazi.com/n/20130630/3923.html', '超萌汪星人爬走~其实我不肥，我还能动！', '1', '2015-01-28 12:38:27');
INSERT INTO `pageurl` VALUES ('42203', 'http://www.lebazi.com/n/20140302/7290.html', '邪恶漫画不知火舞之神秘的黄金钥匙：哥你的菊花不保啦！', '1', '2015-01-28 12:38:27');
INSERT INTO `pageurl` VALUES ('42204', 'http://www.lebazi.com/n/20130622/3579.html', '哇喔，美女身材好好，胸部是要下垂了么？', '1', '2015-01-28 12:38:27');
INSERT INTO `pageurl` VALUES ('42205', 'http://www.lebazi.com/n/20130714/4471.html', '扭肚子gif：真的是2b青年欢乐多啊', '1', '2015-01-28 12:38:27');
INSERT INTO `pageurl` VALUES ('42206', 'http://www.lebazi.com/n/20140521/7747.html', '乐吧子2014邪恶漫画色系军团爱丽丝学园系列大全（第一期）', '1', '2015-01-28 12:38:27');
INSERT INTO `pageurl` VALUES ('42207', 'http://www.lebazi.com/n/20130519/76.html', '邪恶漫画：师傅活该你悲剧', '1', '2015-01-28 12:38:27');
INSERT INTO `pageurl` VALUES ('42208', 'http://www.lebazi.com/n/20131025/6135.html', '邪恶漫画色系图片：有何用途_礼物的用途', '1', '2015-01-28 12:38:27');
INSERT INTO `pageurl` VALUES ('42209', 'http://www.lebazi.com/n/20140617/7821.html', '下一页', '1', '2015-01-28 12:38:29');
INSERT INTO `pageurl` VALUES ('42210', 'http://www.lebazi.com/n/20140617/7823.html', '妹妹美美网搞笑漫画：亲爱的 我们老了也要这么恩爱', '1', '2015-01-28 12:38:29');
INSERT INTO `pageurl` VALUES ('42211', 'http://www.lebazi.com8276_2.html', '下一页', '1', '2015-01-28 12:38:30');
INSERT INTO `pageurl` VALUES ('42212', 'http://www.lebazi.com/n/20140815/8277.html', '邪恶gif动态图片出处：看着男女邪恶激情的画面我顿时就认真起来了', '1', '2015-01-28 12:38:30');
INSERT INTO `pageurl` VALUES ('42213', 'http://www.lebazi.com8775_2.html', '下一页', '1', '2015-01-28 12:38:30');
INSERT INTO `pageurl` VALUES ('42214', 'http://www.lebazi.com/n/20141125/8776.html', '恋姐倾心少女漫画邪恶篇：学妹之间的激情四射', '1', '2015-01-28 12:38:30');
INSERT INTO `pageurl` VALUES ('42215', 'http://www.lebazi.com/n/20140103/6933.html', '下一页', '1', '2015-01-28 12:38:31');
INSERT INTO `pageurl` VALUES ('42216', 'http://www.lebazi.com/n/20140103/6935.html', '韩国18进禁邪恶漫画片：哥们你这么一搞马桶会坏掉的_大小', '1', '2015-01-28 12:38:31');
INSERT INTO `pageurl` VALUES ('42217', 'http://www.lebazi.com/n/20130525/393.html', '下一页', '1', '2015-01-28 12:38:32');
INSERT INTO `pageurl` VALUES ('42218', 'http://www.lebazi.com/n/20130525/395.html', '天下之大，无奇不有，各种雷图一览！', '1', '2015-01-28 12:38:32');
INSERT INTO `pageurl` VALUES ('42219', 'http://www.lebazi.com/n/20140818/8339.html', '下一页', '1', '2015-01-28 12:38:34');
INSERT INTO `pageurl` VALUES ('42220', 'http://www.lebazi.com/n/20140818/8341.html', '色系军团蚂蚁与蜂蜜邪恶系列漫画全集：第十一集 产生错觉2', '1', '2015-01-28 12:38:34');
INSERT INTO `pageurl` VALUES ('42221', 'http://www.lebazi.com/n/20130718/4656.html', '巨胸美女水底送吻gif动图', '1', '2015-01-28 12:38:35');
INSERT INTO `pageurl` VALUES ('42222', 'http://www.lebazi.com/n/20140726/8137.html', '下一页', '1', '2015-01-28 12:38:39');
INSERT INTO `pageurl` VALUES ('42223', 'http://www.lebazi.com/n/20140704/7986.html', '下一页', '1', '2015-01-28 12:38:40');
INSERT INTO `pageurl` VALUES ('42224', 'http://www.lebazi.com/n/20140704/7990.html', '日本邪恶漫画_火影同人邪恶漫画大全：求救信息', '1', '2015-01-28 12:38:40');
INSERT INTO `pageurl` VALUES ('42225', 'http://www.lebazi.com/n/20130625/3655.html', '下一页', '1', '2015-01-28 12:38:40');
INSERT INTO `pageurl` VALUES ('42226', 'http://www.lebazi.com/n/20130625/3657.html', '邪恶漫画：老公的爱，送给老婆的lv包', '1', '2015-01-28 12:38:40');
INSERT INTO `pageurl` VALUES ('42227', 'http://www.lebazi.com/n/20130908/5961.html', '邪恶漫画爱丽丝学园：民宿_邪恶漫画色系图片', '1', '2015-01-28 12:38:42');
INSERT INTO `pageurl` VALUES ('42228', 'http://www.lebazi.com8896_2.html', '下一页', '1', '2015-01-28 12:38:43');
INSERT INTO `pageurl` VALUES ('42229', 'http://www.lebazi.com/n/20141227/8889.html', '邪恶色妹妹美女动态图：妹纸说豪乳就是拿来秀的 胸大就是任性', '1', '2015-01-28 12:38:43');
INSERT INTO `pageurl` VALUES ('42230', 'http://www.lebazi.com7466_2.html', '下一页', '1', '2015-01-28 12:38:45');
INSERT INTO `pageurl` VALUES ('42231', 'http://www.lebazi.com/n/20140309/7467.html', '色你妹2B青年美女成人gif邪恶动态图精选', '1', '2015-01-28 12:38:45');
INSERT INTO `pageurl` VALUES ('42232', 'http://www.lebazi.com/n/20140307/7456.html', '下一页', '1', '2015-01-28 12:38:45');
INSERT INTO `pageurl` VALUES ('42233', 'http://www.lebazi.com/n/20130818/5734.html', '邪恶漫画色系图片：熊与恋人_大吴哥娱乐邪恶漫画', '1', '2015-01-28 12:38:47');
INSERT INTO `pageurl` VALUES ('42234', 'http://www.lebazi.com/n/20140817/8309.html', '下一页', '1', '2015-01-28 12:38:48');
INSERT INTO `pageurl` VALUES ('42235', 'http://www.lebazi.com/n/20130617/3447.html', '下一页', '1', '2015-01-28 12:38:49');
INSERT INTO `pageurl` VALUES ('42236', 'http://www.lebazi.com/n/20130617/3449.html', '美女你是在给胸部做运动吧？', '1', '2015-01-28 12:38:49');
INSERT INTO `pageurl` VALUES ('42237', 'http://www.lebazi.com/n/20130724/4808.html', '内衣MM揉胸gif动图', '1', '2015-01-28 12:38:50');
INSERT INTO `pageurl` VALUES ('42238', 'http://www.lebazi.com/n/20130805/5368.html', '下一页', '1', '2015-01-28 12:38:51');
INSERT INTO `pageurl` VALUES ('42239', 'http://www.lebazi.com/n/20130805/5370.html', '杯具gif动图：大哥，这下你麻烦了', '1', '2015-01-28 12:38:51');
INSERT INTO `pageurl` VALUES ('42240', 'http://www.lebazi.com/n/20130530/732.html', '下一页', '1', '2015-01-28 12:38:52');
INSERT INTO `pageurl` VALUES ('42241', 'http://www.lebazi.com/n/20130530/734.html', '杯子是阻止不了我们的爱情的', '1', '2015-01-28 12:38:52');
INSERT INTO `pageurl` VALUES ('42242', 'http://www.lebazi.com/n/20130714/4442.html', '下一页', '1', '2015-01-28 12:38:53');
INSERT INTO `pageurl` VALUES ('42243', 'http://www.lebazi.com8368_2.html', '下一页', '1', '2015-01-28 12:38:54');
INSERT INTO `pageurl` VALUES ('42244', 'http://www.lebazi.com/n/20140818/8367.html', '可以拿来撸的男女激情邪恶内涵诱惑妹子gif动图片合集：看了还想看的gif邪恶动态图', '1', '2015-01-28 12:38:54');
INSERT INTO `pageurl` VALUES ('42245', 'http://www.lebazi.com/n/20130713/4389.html', '下一页', '1', '2015-01-28 12:38:55');
INSERT INTO `pageurl` VALUES ('42246', 'http://www.lebazi.com/n/20130714/4469.html', '春哥被亲羞涩gif动态图片', '1', '2015-01-28 12:38:55');
INSERT INTO `pageurl` VALUES ('42247', 'http://www.lebazi.com/n/20140617/7834.html', '下一页', '1', '2015-01-28 12:39:01');
INSERT INTO `pageurl` VALUES ('42248', 'http://www.lebazi.com/n/20140617/7836.html', '无翼鸟邪恶漫画_大吴哥娱乐邪恶漫画：蚂蚁与蜜蜂', '1', '2015-01-28 12:39:01');
INSERT INTO `pageurl` VALUES ('42249', 'http://www.lebazi.com/n/20130825/5821.html', '下一页', '1', '2015-01-28 12:39:02');
INSERT INTO `pageurl` VALUES ('42250', 'http://www.lebazi.com/n/20130825/5823.html', '邪恶漫画色系图片：大鼻孔驾到2_邪恶漫画全集', '1', '2015-01-28 12:39:02');
INSERT INTO `pageurl` VALUES ('42251', 'http://www.lebazi.com/n/20130804/5344.html', '下一页', '1', '2015-01-28 12:39:03');
INSERT INTO `pageurl` VALUES ('42252', 'http://www.lebazi.com/n/20130805/5381.html', '色系军团漫画之向大自然学习对抗天敌的方法：教你躲过如狼似虎的黄脸婆', '1', '2015-01-28 12:39:03');
INSERT INTO `pageurl` VALUES ('42253', 'http://www.lebazi.com/n/20130714/4433.html', '下一页', '1', '2015-01-28 12:39:04');
INSERT INTO `pageurl` VALUES ('42254', 'http://www.lebazi.com/n/20140812/8239.html', '下一页', '1', '2015-01-28 12:39:05');
INSERT INTO `pageurl` VALUES ('42255', 'http://www.lebazi.com/n/20140812/8241.html', '梦龙y传系列_梦龙y传漫画全集第18话：计策', '1', '2015-01-28 12:39:05');
INSERT INTO `pageurl` VALUES ('42256', 'http://www.lebazi.com/n/20140323/7593.html', '美女没内涵邪恶gif：帮美女揉胸gif动图', '1', '2015-01-28 12:39:12');
INSERT INTO `pageurl` VALUES ('42257', 'http://www.lebazi.com/n/20140811/8214.html', '下一页', '1', '2015-01-28 12:39:12');
INSERT INTO `pageurl` VALUES ('42258', 'http://www.lebazi.com/n/20140811/8216.html', '菊花笑典漫画大全_菊花笑典漫画全集:：卜导 好像角色有点不对', '1', '2015-01-28 12:39:12');
INSERT INTO `pageurl` VALUES ('42259', 'http://www.lebazi.com7843_2.html', '下一页', '1', '2015-01-28 12:39:13');
INSERT INTO `pageurl` VALUES ('42260', 'http://www.lebazi.com/n/20140618/7844.html', '各种男女逗你乐没商量搞笑动态图片', '1', '2015-01-28 12:39:13');
INSERT INTO `pageurl` VALUES ('42261', 'http://www.lebazi.com/n/20140614/7787.html', '动物园各种动物卖萌gif动态搞笑图片：动物世界欢乐多~喵星人汪星人卖萌gif素材', '1', '2015-01-28 12:39:13');
INSERT INTO `pageurl` VALUES ('42262', 'http://www.lebazi.com7792_2.html', '下一页', '1', '2015-01-28 12:39:13');
INSERT INTO `pageurl` VALUES ('42263', 'http://www.lebazi.com/n/20140616/7793.html', '高挑性感大胸美女mm人体艺术照片欣赏：韩国大胸美女护士这里也有的哦~', '1', '2015-01-28 12:39:13');
INSERT INTO `pageurl` VALUES ('42264', 'http://www.lebazi.com/n/20140616/7788.html', '屌丝必备美女翘臀撸管图片：各种美女后入式翘臀诱惑等你来上', '1', '2015-01-28 12:39:13');
INSERT INTO `pageurl` VALUES ('42265', 'http://www.lebazi.com/n/20130905/5956.html', '下一页', '1', '2015-01-28 12:39:13');
INSERT INTO `pageurl` VALUES ('42266', 'http://www.lebazi.com/n/20130921/6032.html', '娃儿你的舞姿好妖娆  哪个高手教你的？', '1', '2015-01-28 12:39:13');
INSERT INTO `pageurl` VALUES ('42267', 'http://www.lebazi.com/n/20130801/5139.html', '下一页', '1', '2015-01-28 12:39:14');
INSERT INTO `pageurl` VALUES ('42268', 'http://www.lebazi.com/n/20130802/5141.html', '超萌小兔子抱球翻滚搞笑gif动图', '1', '2015-01-28 12:39:14');
INSERT INTO `pageurl` VALUES ('42269', 'http://www.lebazi.com/n/20130613/1064.html', '下一页', '1', '2015-01-28 12:39:14');
INSERT INTO `pageurl` VALUES ('42270', 'http://www.lebazi.com/n/20130614/1114.html', '邪恶漫画：之“灵活度”像野马一样有力量~', '1', '2015-01-28 12:39:14');
INSERT INTO `pageurl` VALUES ('42271', 'http://www.lebazi.com8554_2.html', '下一页', '1', '2015-01-28 12:39:16');
INSERT INTO `pageurl` VALUES ('42272', 'http://www.lebazi.com/n/20140923/8555.html', '又黄又色邪恶成人gif动态图片出处大全：浑蛋，不许你们这样虐待我女神', '1', '2015-01-28 12:39:16');
INSERT INTO `pageurl` VALUES ('42273', 'http://www.lebazi.com/n/20140923/8553.html', '田中瞳色你妹gif动态邪恶图片：那些看了还想看的香艳gif出处大全', '1', '2015-01-28 12:39:16');
INSERT INTO `pageurl` VALUES ('42274', 'http://www.lebazi.com/n/20130625/3643.html', '下一页', '1', '2015-01-28 12:39:16');
INSERT INTO `pageurl` VALUES ('42275', 'http://www.lebazi.com/n/20130625/3645.html', '女人们如果你想让你的男友变得很强壮，不妨试试这样~', '1', '2015-01-28 12:39:16');
INSERT INTO `pageurl` VALUES ('42276', 'http://www.lebazi.com/n/20140617/7827.html', '邪恶漫画恋姐倾心_内涵漫画色系图片：水的阻力', '1', '2015-01-28 12:39:16');
INSERT INTO `pageurl` VALUES ('42277', 'http://www.lebazi.com/n/20140814/8273.html', '下一页', '1', '2015-01-28 12:39:17');
INSERT INTO `pageurl` VALUES ('42278', 'http://www.lebazi.com/n/20130519/40.html', '邪恶漫画：新开发的撸撸专用耳麦', '1', '2015-01-28 12:39:17');
INSERT INTO `pageurl` VALUES ('42279', 'http://www.lebazi.com/n/20131025/6133.html', '下一页', '1', '2015-01-28 12:39:18');
INSERT INTO `pageurl` VALUES ('42280', 'http://www.lebazi.com/n/20140817/8306.html', '下一页', '1', '2015-01-28 12:39:18');
INSERT INTO `pageurl` VALUES ('42281', 'http://www.lebazi.com/n/20140817/8308.html', '邪恶漫画色系军团寡妇三代漫画第23集：审判1', '1', '2015-01-28 12:39:18');
INSERT INTO `pageurl` VALUES ('42282', 'http://www.lebazi.com8163_2.html', '下一页', '1', '2015-01-28 12:39:20');
INSERT INTO `pageurl` VALUES ('42283', 'http://www.lebazi.com/n/20140731/8165.html', '各种雷人牛人搞笑gif动态内涵图片：搞笑gif图片笑死人图片合集（第十期）', '1', '2015-01-28 12:39:20');
INSERT INTO `pageurl` VALUES ('42284', 'http://www.lebazi.com8116_2.html', '下一页', '1', '2015-01-28 12:39:20');
INSERT INTO `pageurl` VALUES ('42285', 'http://www.lebazi.com/n/20140719/8109.html', '可以拿来撸的精选超经典的邪恶内涵诱惑妹子Gif动态图片合集：巨乳 翘臀 挑逗应有尽有', '1', '2015-01-28 12:39:20');
INSERT INTO `pageurl` VALUES ('42286', 'http://www.lebazi.com8220_2.html', '下一页', '1', '2015-01-28 12:39:24');
INSERT INTO `pageurl` VALUES ('42287', 'http://www.lebazi.com8369_2.html', '下一页', '1', '2015-01-28 12:39:26');
INSERT INTO `pageurl` VALUES ('42288', 'http://www.lebazi.com8659_2.html', '下一页', '1', '2015-01-28 12:39:34');
INSERT INTO `pageurl` VALUES ('42289', 'http://www.lebazi.com/n/20130614/1080.html', '下一页', '1', '2015-01-28 12:39:35');
INSERT INTO `pageurl` VALUES ('42290', 'http://www.lebazi.com/n/20130614/1082.html', '原来灭火器还可以这样玩的_GIF动图', '1', '2015-01-28 12:39:35');
INSERT INTO `pageurl` VALUES ('42291', 'http://www.lebazi.com7524_2.html', '下一页', '1', '2015-01-28 12:39:35');
INSERT INTO `pageurl` VALUES ('42292', 'http://www.lebazi.com/n/20140316/7523.html', '福利美女骑车gif动态图：摩托车新视角', '1', '2015-01-28 12:39:35');
INSERT INTO `pageurl` VALUES ('42293', 'http://www.lebazi.com/n/20130825/5842.html', '下一页', '1', '2015-01-28 12:39:36');
INSERT INTO `pageurl` VALUES ('42294', 'http://www.lebazi.com/n/20130826/5850.html', '坏淫，有我在，别想欺负我主银！', '1', '2015-01-28 12:39:36');
INSERT INTO `pageurl` VALUES ('42295', 'http://www.lebazi.com/n/20130528/629.html', '下一页', '1', '2015-01-28 12:39:37');
INSERT INTO `pageurl` VALUES ('42296', 'http://www.lebazi.com/n/20130528/631.html', '啊，我的菊花。。痛。。', '1', '2015-01-28 12:39:37');
INSERT INTO `pageurl` VALUES ('42297', 'http://www.lebazi.com/n/20131021/6117.html', '下一页', '1', '2015-01-28 12:39:38');
INSERT INTO `pageurl` VALUES ('42298', 'http://www.lebazi.com/n/20130623/3609.html', '哥，你别怪牛哥不按规矩出牌，只是你拿的衣服也有问题。。', '1', '2015-01-28 12:39:38');
INSERT INTO `pageurl` VALUES ('42299', 'http://www.lebazi.com/n/20130927/6036.html', '下一页', '1', '2015-01-28 12:39:38');
INSERT INTO `pageurl` VALUES ('42300', 'http://www.lebazi.com/n/20130928/6040.html', '18进禁邪恶漫画：数字化问候_邪恶漫画色系图片', '1', '2015-01-28 12:39:38');
INSERT INTO `pageurl` VALUES ('42301', 'http://www.lebazi.com/n/20140728/8157.html', '18进禁邪恶漫画全集_韩国邪恶h漫画全集：活体素描', '1', '2015-01-28 12:39:39');
INSERT INTO `pageurl` VALUES ('42302', 'http://www.lebazi.com8588_2.html', '下一页', '1', '2015-01-28 12:39:39');
INSERT INTO `pageurl` VALUES ('42303', 'http://www.lebazi.com/n/20141010/8589.html', '极品美胸养眼福利：台湾第一巨乳美女熊熊巨乳照合集', '1', '2015-01-28 12:39:39');
INSERT INTO `pageurl` VALUES ('42304', 'http://www.lebazi.com/n/20141009/8582.html', '中国好胸器之巨乳美女顾欣怡透明情趣内衣诱惑写真', '1', '2015-01-28 12:39:39');
INSERT INTO `pageurl` VALUES ('42305', 'http://www.lebazi.com/n/20130702/3967.html', '下一页', '1', '2015-01-28 12:39:40');
INSERT INTO `pageurl` VALUES ('42306', 'http://www.lebazi.com/n/20130702/3969.html', '色系军团之“人鱼公主传”为了国家，为了你和我，请你成为王子（一）~', '1', '2015-01-28 12:39:40');
INSERT INTO `pageurl` VALUES ('42307', 'http://www.lebazi.com/n/20140715/8034.html', '下一页', '1', '2015-01-28 12:39:41');
INSERT INTO `pageurl` VALUES ('42308', 'http://www.lebazi.com/n/20140715/8036.html', '邪恶漫画少女漫画_色系军团邪恶漫画大全：昼夜温差', '1', '2015-01-28 12:39:41');
INSERT INTO `pageurl` VALUES ('42309', 'http://www.lebazi.com8868_2.html', '下一页', '1', '2015-01-28 12:39:41');
INSERT INTO `pageurl` VALUES ('42310', 'http://www.lebazi.com/n/20141219/8866.html', '恋姐倾心邪恶少女漫画：反方向做', '1', '2015-01-28 12:39:41');
INSERT INTO `pageurl` VALUES ('42311', 'http://www.lebazi.com/n/20130828/5877.html', '下一页', '1', '2015-01-28 12:39:41');
INSERT INTO `pageurl` VALUES ('42312', 'http://www.lebazi.com/n/20130829/5894.html', '色小组漫画全集：请按铃_不知火舞邪恶漫画集', '1', '2015-01-28 12:39:41');
INSERT INTO `pageurl` VALUES ('42313', 'http://www.lebazi.com/n/20140623/7884.html', '下一页', '1', '2015-01-28 12:39:41');
INSERT INTO `pageurl` VALUES ('42314', 'http://www.lebazi.com/n/20140623/7886.html', '乐张不入妖妖小精漫画全集_妖妖小精色系军团：天堂与地狱', '1', '2015-01-28 12:39:41');
INSERT INTO `pageurl` VALUES ('42315', 'http://www.lebazi.com/n/20140305/7364.html', '抓拍美女美女衣服内部gif动图：给屌丝福利一枚', '1', '2015-01-28 12:39:42');
INSERT INTO `pageurl` VALUES ('42316', 'http://www.lebazi.com7270_2.html', '下一页', '1', '2015-01-28 12:39:43');
INSERT INTO `pageurl` VALUES ('42317', 'http://www.lebazi.com/n/20140227/7269.html', '乐吧子2014邪恶gif动态图精选', '1', '2015-01-28 12:39:43');
INSERT INTO `pageurl` VALUES ('42318', 'http://www.lebazi.com/n/20130707/4130.html', '下一页', '1', '2015-01-28 12:39:43');
INSERT INTO `pageurl` VALUES ('42319', 'http://www.lebazi.com/n/20130708/4154.html', '邪恶漫画：“日和云打赌”谁能脱掉两个人的衣服', '1', '2015-01-28 12:39:43');
INSERT INTO `pageurl` VALUES ('42320', 'http://www.lebazi.com/n/20130726/4906.html', '牛人走单绳gif：看得我触目惊心', '1', '2015-01-28 12:39:44');
INSERT INTO `pageurl` VALUES ('42321', 'http://www.lebazi.com/n/20130716/4607.html', '下一页', '1', '2015-01-28 12:39:44');
INSERT INTO `pageurl` VALUES ('42322', 'http://www.lebazi.com/n/20130717/4632.html', '色系军团漫画：办公室的温度，要懂得为公司节省开支', '1', '2015-01-28 12:39:44');
INSERT INTO `pageurl` VALUES ('42323', 'http://www.lebazi.com/n/20140623/7904.html', '妖妖小精色系军团2次元少女邪恶漫画（第三章）：兵哥的礼物', '1', '2015-01-28 12:39:45');
INSERT INTO `pageurl` VALUES ('42324', 'http://www.lebazi.com/n/20130611/1000.html', '下一页', '1', '2015-01-28 12:39:46');
INSERT INTO `pageurl` VALUES ('42325', 'http://www.lebazi.com/n/20130611/1002.html', '这个世界到底是肿么啦~~', '1', '2015-01-28 12:39:46');
INSERT INTO `pageurl` VALUES ('42326', 'http://www.lebazi.com/n/20130525/444.html', '下一页', '1', '2015-01-28 12:39:46');
INSERT INTO `pageurl` VALUES ('42327', 'http://www.lebazi.com/n/20130613/1043.html', '下一页', '1', '2015-01-28 12:39:47');
INSERT INTO `pageurl` VALUES ('42328', 'http://www.lebazi.com/n/20130613/1045.html', '绝对的黑丝诱惑~~', '1', '2015-01-28 12:39:47');
INSERT INTO `pageurl` VALUES ('42329', 'http://www.lebazi.com/n/20141111/8718.html', '下一页', '1', '2015-01-28 12:39:48');
INSERT INTO `pageurl` VALUES ('42330', 'http://www.lebazi.com/n/20141117/8750.html', '搞笑内涵黄段子：喂、新来的丑b，给劳资倒杯水！', '1', '2015-01-28 12:39:48');
INSERT INTO `pageurl` VALUES ('42331', 'http://www.lebazi.com/n/20140104/6983.html', '下一页', '1', '2015-01-28 12:39:49');
INSERT INTO `pageurl` VALUES ('42332', 'http://www.lebazi.com/n/20140104/6985.html', '车祸惊魂gif动图：死神来了，快跑啊～', '1', '2015-01-28 12:39:49');
INSERT INTO `pageurl` VALUES ('42333', 'http://www.lebazi.com/n/20130519/43.html', '下一页', '1', '2015-01-28 12:39:50');
INSERT INTO `pageurl` VALUES ('42334', 'http://www.lebazi.com/n/20130519/45.html', '邪恶漫画：我好像真的爱上你了', '1', '2015-01-28 12:39:50');
INSERT INTO `pageurl` VALUES ('42335', 'http://www.lebazi.com/n/20130921/6030.html', '色系军团邪恶漫画：不听老人言_邪恶漫画色系图片', '1', '2015-01-28 12:39:51');
INSERT INTO `pageurl` VALUES ('42336', 'http://www.lebazi.com/n/20140306/7383.html', '下一页', '1', '2015-01-28 12:39:51');
INSERT INTO `pageurl` VALUES ('42337', 'http://www.lebazi.com/n/20140306/7385.html', '全彩h邪恶漫画日本：应对方法_重口h邪恶漫画日本', '1', '2015-01-28 12:39:51');
INSERT INTO `pageurl` VALUES ('42338', 'http://www.lebazi.com/n/20130818/5736.html', '重口h邪恶漫画日本：二手车_18进禁邪恶漫画', '1', '2015-01-28 12:39:52');
INSERT INTO `pageurl` VALUES ('42339', 'http://www.lebazi.com/n/20130908/5963.html', '邪恶漫画色系图片：天生一对_邪恶漫画全集', '1', '2015-01-28 12:39:53');
INSERT INTO `pageurl` VALUES ('42340', 'http://www.lebazi.com8264_2.html', '下一页', '1', '2015-01-28 12:39:55');
INSERT INTO `pageurl` VALUES ('42341', 'http://www.lebazi.com8262_2.html', '下一页', '1', '2015-01-28 12:39:55');
INSERT INTO `pageurl` VALUES ('42342', 'http://www.lebazi.com8422_2.html', '下一页', '1', '2015-01-28 12:39:58');
INSERT INTO `pageurl` VALUES ('42343', 'http://www.lebazi.com/n/20140903/8442.html', '田中瞳内涵gif动态图片_xxoo成人没内涵邪恶GIF动态图精选：未成年人勿进！', '1', '2015-01-28 12:39:58');
INSERT INTO `pageurl` VALUES ('42344', 'http://www.lebazi.com8191_2.html', '下一页', '1', '2015-01-28 12:39:59');
INSERT INTO `pageurl` VALUES ('42345', 'http://www.lebazi.com/n/20140804/8190.html', '又黄又色邪恶成人xxoo没内涵gif动图：不为之所心动 宅男撸管必备福利图片（第十期）', '1', '2015-01-28 12:39:59');
INSERT INTO `pageurl` VALUES ('42346', 'http://www.lebazi.com8667_2.html', '下一页', '1', '2015-01-28 12:40:08');
INSERT INTO `pageurl` VALUES ('42347', 'http://www.lebazi.com8569_2.html', '下一页', '1', '2015-01-28 12:40:10');
INSERT INTO `pageurl` VALUES ('42348', 'http://www.lebazi.com/n/20140927/8570.html', '男女激情啪啪啪邪恶动态图片精选：原来电梯里面也有女流氓 好想遇到这等好事', '1', '2015-01-28 12:40:10');
INSERT INTO `pageurl` VALUES ('42349', 'http://www.lebazi.com8560_2.html', '下一页', '1', '2015-01-28 12:40:11');
INSERT INTO `pageurl` VALUES ('42350', 'http://www.lebazi.com8016_2.html', '下一页', '1', '2015-01-28 12:40:17');
INSERT INTO `pageurl` VALUES ('42351', 'http://www.lebazi.com/n/20140713/8017.html', '各种雷人牛人搞笑gif动态内涵图片：搞笑gif图片笑死人图片合集（第二期）', '1', '2015-01-28 12:40:17');
INSERT INTO `pageurl` VALUES ('42352', 'http://www.lebazi.com8013_2.html', '下一页', '1', '2015-01-28 12:40:19');
INSERT INTO `pageurl` VALUES ('42353', 'http://www.lebazi.com/n/20140704/7996.html', '田中瞳色你妹gif动态邪恶图片_xxoo成人没内涵邪恶gif动态：不看你后悔', '1', '2015-01-28 12:40:19');
INSERT INTO `pageurl` VALUES ('42354', 'http://www.lebazi.com/n/20130706/4100.html', '下一页', '1', '2015-01-28 12:40:20');
INSERT INTO `pageurl` VALUES ('42355', 'http://www.lebazi.com/n/20140715/8069.html', '下一页', '1', '2015-01-28 12:40:20');
INSERT INTO `pageurl` VALUES ('42356', 'http://www.lebazi.com/n/20140715/8071.html', '暴走漫画吧_暴走漫画第二季脑残对话表情：我的爸爸', '1', '2015-01-28 12:40:20');
INSERT INTO `pageurl` VALUES ('42357', 'http://www.lebazi.com8774_2.html', '下一页', '1', '2015-01-28 12:40:20');
INSERT INTO `pageurl` VALUES ('42358', 'http://www.lebazi.com/n/20141124/8773.html', '恋姐倾心少女漫画邪恶篇：少女滑雪好困扰', '1', '2015-01-28 12:40:20');
INSERT INTO `pageurl` VALUES ('42359', 'http://www.lebazi.com/n/20140818/8326.html', '土豆《神街访》街头采访爆笑视频：你做过最不卫生的事情是什么？', '1', '2015-01-28 12:40:21');
INSERT INTO `pageurl` VALUES ('42360', 'http://www.lebazi.com/n/20130821/5781.html', '下一页', '1', '2015-01-28 12:40:22');
INSERT INTO `pageurl` VALUES ('42361', 'http://www.lebazi.com/n/20130821/5783.html', '邪恶美女gif动图：汪星人你果然是个禽兽不如的家伙', '1', '2015-01-28 12:40:22');
INSERT INTO `pageurl` VALUES ('42362', 'http://www.lebazi.com/n/20141210/8836.html', '韩国邪恶h漫画全集：善良的世界', '1', '2015-01-28 12:40:22');
INSERT INTO `pageurl` VALUES ('42363', 'http://www.lebazi.com/n/20130525/422.html', '下一页', '1', '2015-01-28 12:40:23');
INSERT INTO `pageurl` VALUES ('42364', 'http://www.lebazi.com/n/20130525/424.html', '美女，等我，我来了！', '1', '2015-01-28 12:40:23');
INSERT INTO `pageurl` VALUES ('42365', 'http://www.lebazi.com/n/20140309/7473.html', '下一页', '1', '2015-01-28 12:40:25');
INSERT INTO `pageurl` VALUES ('42366', 'http://www.lebazi.com/n/20140309/7475.html', '不知火舞在公园被虐之狂：姑娘！这个又不是吃的', '1', '2015-01-28 12:40:25');
INSERT INTO `pageurl` VALUES ('42367', 'http://www.lebazi.com8600_2.html', '下一页', '1', '2015-01-28 12:40:25');
INSERT INTO `pageurl` VALUES ('42368', 'http://www.lebazi.com/n/20141012/8601.html', '韩国邪恶漫画“人鱼公主传”全集连载：第01集', '1', '2015-01-28 12:40:25');
INSERT INTO `pageurl` VALUES ('42369', 'http://www.lebazi.com/n/20141012/8599.html', '披萨恋恋曲少女漫画邪恶篇265-271章节：看我怎么收拾你', '1', '2015-01-28 12:40:25');
INSERT INTO `pageurl` VALUES ('42370', 'http://www.lebazi.com/n/20131009/6062.html', '下一页', '1', '2015-01-28 12:40:25');
INSERT INTO `pageurl` VALUES ('42371', 'http://www.lebazi.com/n/20131016/6096.html', '不知火舞邪恶漫画集：不听老人言_妖妖小精漫画大全', '1', '2015-01-28 12:40:25');
INSERT INTO `pageurl` VALUES ('42372', 'http://www.lebazi.com/n/20130630/3873.html', '下一页', '1', '2015-01-28 12:40:26');
INSERT INTO `pageurl` VALUES ('42373', 'http://www.lebazi.com/n/20130630/3875.html', '色系军团之“正确的穿衣方式”', '1', '2015-01-28 12:40:26');
INSERT INTO `pageurl` VALUES ('42374', 'http://www.lebazi.com8658_2.html', '下一页', '1', '2015-01-28 12:40:28');
INSERT INTO `pageurl` VALUES ('42375', 'http://www.lebazi.com8642_2.html', '下一页', '1', '2015-01-28 12:40:29');
INSERT INTO `pageurl` VALUES ('42376', 'http://www.lebazi.com/n/20141016/8641.html', '让你看了各种受不了的邪恶gif动态图：成人美女嫩白诱惑有谁不爱啊！', '1', '2015-01-28 12:40:29');
INSERT INTO `pageurl` VALUES ('42377', 'http://www.lebazi.com8698_2.html', '下一页', '1', '2015-01-28 12:40:30');
INSERT INTO `pageurl` VALUES ('42378', 'http://www.lebazi.com/n/20141107/8702.html', '乐吧子邪恶动态图大全（第五期）：av女优啪啪啪GIF动态图精选', '1', '2015-01-28 12:40:30');
INSERT INTO `pageurl` VALUES ('42379', 'http://www.lebazi.com8260_2.html', '下一页', '1', '2015-01-28 12:40:40');
INSERT INTO `pageurl` VALUES ('42380', 'http://www.lebazi.com8221_2.html', '下一页', '1', '2015-01-28 12:40:40');
INSERT INTO `pageurl` VALUES ('42381', 'http://www.lebazi.com8869_2.html', '下一页', '1', '2015-01-28 12:40:48');
INSERT INTO `pageurl` VALUES ('42382', 'http://www.lebazi.com/n/20141219/8870.html', '超邪恶动态图大全：都是妹子诱惑哥 左手用完接右手！', '1', '2015-01-28 12:40:48');
INSERT INTO `pageurl` VALUES ('42383', 'http://www.lebazi.com8830_2.html', '下一页', '1', '2015-01-28 12:40:50');
INSERT INTO `pageurl` VALUES ('42384', 'http://www.lebazi.com/n/20141208/8829.html', '盘点那些搞笑又内涵成人gif动态图出处：看着我可耻的硬了', '1', '2015-01-28 12:40:50');
INSERT INTO `pageurl` VALUES ('42385', 'http://www.lebazi.com/n/20140613/7784.html', '田中瞳色你妹gif动态邪恶图片_xxoo成人没内涵邪恶gif动态：屌丝准备纸巾吧', '1', '2015-01-28 12:40:56');
INSERT INTO `pageurl` VALUES ('42386', 'http://www.lebazi.com7741_2.html', '下一页', '1', '2015-01-28 12:40:58');
INSERT INTO `pageurl` VALUES ('42387', 'http://www.lebazi.com/n/20140517/7740.html', '色你妹sexy rosi girls成人gif图片大全：宅男屌丝必备第四期', '1', '2015-01-28 12:40:58');
INSERT INTO `pageurl` VALUES ('42388', 'http://www.lebazi.com/n/20131121/6567.html', '下一页', '1', '2015-01-28 12:41:01');
INSERT INTO `pageurl` VALUES ('42389', 'http://www.lebazi.com/n/20131121/6569.html', '初音未来h邪恶漫画：当皇帝好惨啊，什么东西都得尝二手的_尝试', '1', '2015-01-28 12:41:01');
INSERT INTO `pageurl` VALUES ('42390', 'http://www.lebazi.com/n/20130704/4048.html', '下一页', '1', '2015-01-28 12:41:03');
INSERT INTO `pageurl` VALUES ('42391', 'http://www.lebazi.com/n/20130704/4050.html', '主淫，等我一下，我的开我的坐骑来了~', '1', '2015-01-28 12:41:03');
INSERT INTO `pageurl` VALUES ('42392', 'http://www.lebazi.com/n/20130617/3460.html', '下一页', '1', '2015-01-28 12:41:04');
INSERT INTO `pageurl` VALUES ('42393', 'http://www.lebazi.com/n/20130617/3462.html', '顶顶更健康~美女胸部波涛汹涌的顶起来gif动图~', '1', '2015-01-28 12:41:05');
INSERT INTO `pageurl` VALUES ('42394', 'http://www.lebazi.com/n/20141012/8618.html', '下一页', '1', '2015-01-28 12:41:06');
INSERT INTO `pageurl` VALUES ('42395', 'http://www.lebazi.com/n/20130715/4533.html', '下一页', '1', '2015-01-28 12:41:08');
INSERT INTO `pageurl` VALUES ('42396', 'http://www.lebazi.com/n/20130617/3442.html', '下一页', '1', '2015-01-28 12:41:10');
INSERT INTO `pageurl` VALUES ('42397', 'http://www.lebazi.com/n/20130617/3444.html', '骨骼哪里去了？这么软？', '1', '2015-01-28 12:41:10');
INSERT INTO `pageurl` VALUES ('42398', 'http://www.lebazi.com/n/20130611/997.html', '下一页', '1', '2015-01-28 12:41:11');
INSERT INTO `pageurl` VALUES ('42399', 'http://www.lebazi.com/n/20130611/999.html', '你的奶罩现在还给你', '1', '2015-01-28 12:41:11');
INSERT INTO `pageurl` VALUES ('42400', 'http://www.lebazi.com/n/20140326/7614.html', '二次元h邪恶漫画_大吴哥娱乐邪恶漫画：成功人生的定义', '1', '2015-01-28 12:41:13');
INSERT INTO `pageurl` VALUES ('42401', 'http://www.lebazi.com/n/20140715/8072.html', '下一页', '1', '2015-01-28 12:41:14');
INSERT INTO `pageurl` VALUES ('42402', 'http://www.lebazi.com/n/20140715/8074.html', '暴走漫画_暴走漫画全集：深度剖析暴走大事件', '1', '2015-01-28 12:41:14');
INSERT INTO `pageurl` VALUES ('42403', 'http://www.lebazi.com/n/20130714/4476.html', '下一页', '1', '2015-01-28 12:41:16');
INSERT INTO `pageurl` VALUES ('42404', 'http://www.lebazi.com/n/20140617/7838.html', '下一页', '1', '2015-01-28 12:41:16');
INSERT INTO `pageurl` VALUES ('42405', 'http://www.lebazi.com/n/20130620/3518.html', '色系军团：打扮，感觉还缺点什么', '1', '2015-01-28 12:41:17');
INSERT INTO `pageurl` VALUES ('42406', 'http://www.lebazi.com/n/20130822/5792.html', '邪恶漫画色系图片：男女朋友AA制_拳皇火舞邪恶漫画集', '1', '2015-01-28 12:41:19');
INSERT INTO `pageurl` VALUES ('42407', 'http://www.lebazi.com/n/20131108/6291.html', '下一页', '1', '2015-01-28 12:41:22');
INSERT INTO `pageurl` VALUES ('42408', 'http://www.lebazi.com/n/20131108/6293.html', '色小组18进禁邪恶漫画：尤里卡 阿基米德的大发现_阿基米德原来是这样发现真理的', '1', '2015-01-28 12:41:22');
INSERT INTO `pageurl` VALUES ('42409', 'http://www.lebazi.com8414_2.html', '下一页', '1', '2015-01-28 12:41:24');
INSERT INTO `pageurl` VALUES ('42410', 'http://www.lebazi.com/n/20140828/8415.html', '二次元动漫美女被虐吸奶图片：美女半裸接吻图集', '1', '2015-01-28 12:41:24');
INSERT INTO `pageurl` VALUES ('42411', 'http://www.lebazi.com8412_2.html', '下一页', '1', '2015-01-28 12:41:26');
INSERT INTO `pageurl` VALUES ('42412', 'http://www.lebazi.com/n/20140828/8411.html', '二次元动漫h漫画邪恶篇：美女地铁看书遭袭胸摸臀图', '1', '2015-01-28 12:41:26');
INSERT INTO `pageurl` VALUES ('42413', 'http://www.lebazi.com/n/20140801/8180.html', '下一页', '1', '2015-01-28 12:41:28');
INSERT INTO `pageurl` VALUES ('42414', 'http://www.lebazi.com/n/20130822/5787.html', '下一页', '1', '2015-01-28 12:41:31');
INSERT INTO `pageurl` VALUES ('42415', 'http://www.lebazi.com/n/20130629/3828.html', '下一页', '1', '2015-01-28 12:41:35');
INSERT INTO `pageurl` VALUES ('42416', 'http://www.lebazi.com/n/20130629/3830.html', '美女，你们在笑什么呢，说出来大家一起笑笑呗~', '1', '2015-01-28 12:41:35');
INSERT INTO `pageurl` VALUES ('42417', 'http://www.lebazi.com/n/20130523/255.html', '屌丝男演绎最丑陋10种接吻！', '1', '2015-01-28 12:41:36');
INSERT INTO `pageurl` VALUES ('42418', 'http://www.lebazi.com/n/20130520/140.html', '眼睛和BGM同步率100%！眼珠都快掉出来了!胆小勿入!', '1', '2015-01-28 12:41:36');
INSERT INTO `pageurl` VALUES ('42419', 'http://www.lebazi.com/n/20130626/3671.html', '下一页', '1', '2015-01-28 12:41:38');
INSERT INTO `pageurl` VALUES ('42420', 'http://www.lebazi.com/n/20130626/3713.html', '2B青年一般都是这样下楼梯的~', '1', '2015-01-28 12:41:38');
INSERT INTO `pageurl` VALUES ('42421', 'http://www.lebazi.com/n/20140718/8102.html', '下一页', '1', '2015-01-28 12:41:40');
INSERT INTO `pageurl` VALUES ('42422', 'http://www.lebazi.com/n/20140718/8104.html', '邪恶mm漫画色系图片_日本美女邪恶漫画：狼来啦', '1', '2015-01-28 12:41:40');
INSERT INTO `pageurl` VALUES ('42423', 'http://www.lebazi.com/n/20130617/3456.html', '下一页', '1', '2015-01-28 12:41:42');
INSERT INTO `pageurl` VALUES ('42424', 'http://www.lebazi.com/n/20130617/3458.html', '在水中揩油是最好的选择了吧~', '1', '2015-01-28 12:41:42');
INSERT INTO `pageurl` VALUES ('42425', 'http://www.lebazi.com8503_2.html', '下一页', '1', '2015-01-28 12:41:43');
INSERT INTO `pageurl` VALUES ('42426', 'http://www.lebazi.com/n/20140916/8504.html', '可以拿来撸的邪恶内涵gif动态图片大全：挑逗方法应有尽有 卫生纸准备起吧', '1', '2015-01-28 12:41:43');
INSERT INTO `pageurl` VALUES ('42427', 'http://www.lebazi.com/n/20140916/8502.html', '日本著名女AV名优小川阿佐美内涵gif动图大全', '1', '2015-01-28 12:41:43');
INSERT INTO `pageurl` VALUES ('42428', 'http://www.lebazi.com/n/20130811/5484.html', '下一页', '1', '2015-01-28 12:41:45');
INSERT INTO `pageurl` VALUES ('42429', 'http://www.lebazi.com/n/20130811/5486.html', '邪恶漫画之金属物体', '1', '2015-01-28 12:41:45');
INSERT INTO `pageurl` VALUES ('42430', 'http://www.lebazi.com/n/20141014/8635.html', '下一页', '1', '2015-01-28 12:41:47');
INSERT INTO `pageurl` VALUES ('42431', 'http://www.lebazi.com/n/20141022/8663.html', '微博经典内涵段子：一个充气的娃娃至于吗，劳资给钱好吧！', '1', '2015-01-28 12:41:47');
INSERT INTO `pageurl` VALUES ('42432', 'http://www.lebazi.com/n/20130630/3869.html', '下一页', '1', '2015-01-28 12:41:48');
INSERT INTO `pageurl` VALUES ('42433', 'http://www.lebazi.com/n/20130630/3871.html', '色系军团之“手上的魔法，摸过的都变大”', '1', '2015-01-28 12:41:48');
INSERT INTO `pageurl` VALUES ('42434', 'http://www.lebazi.com/n/20130711/4272.html', '下一页', '1', '2015-01-28 12:41:48');
INSERT INTO `pageurl` VALUES ('42435', 'http://www.lebazi.com/n/20130712/4327.html', '色系军团漫画：“哪只手”原来真的是用右手', '1', '2015-01-28 12:41:48');
INSERT INTO `pageurl` VALUES ('42436', 'http://www.lebazi.com/n/20131126/6733.html', '下一页', '1', '2015-01-28 12:41:50');
INSERT INTO `pageurl` VALUES ('42437', 'http://www.lebazi.com/n/20140103/6931.html', '不知火舞h漫画：高帅富和穷矮挫的差别对待_醒酒', '1', '2015-01-28 12:41:50');
INSERT INTO `pageurl` VALUES ('42438', 'http://www.lebazi.com/n/20130712/4312.html', '下一页', '1', '2015-01-28 12:41:52');
INSERT INTO `pageurl` VALUES ('42439', 'http://www.lebazi.com/n/20130712/4314.html', '运动gif动图：我接住球了接住球了', '1', '2015-01-28 12:41:52');
INSERT INTO `pageurl` VALUES ('42440', 'http://www.lebazi.com/n/20130713/4374.html', '下一页', '1', '2015-01-28 12:41:53');
INSERT INTO `pageurl` VALUES ('42441', 'http://www.lebazi.com/n/20140716/8086.html', '胥渡吧最新搞笑视频_胥渡吧搞笑视频全集：中国乳神为求球票公开卖吻 中国乳神太火辣遭老外强吻', '1', '2015-01-28 12:41:53');
INSERT INTO `pageurl` VALUES ('42442', 'http://www.lebazi.com/n/20130629/3838.html', '下一页', '1', '2015-01-28 12:41:54');
INSERT INTO `pageurl` VALUES ('42443', 'http://www.lebazi.com/n/20130727/4941.html', '下一页', '1', '2015-01-28 12:41:56');
INSERT INTO `pageurl` VALUES ('42444', 'http://www.lebazi.com/n/20130728/4961.html', '搞笑gif动图：2b青年总是少了不给自己找点乐子', '1', '2015-01-28 12:41:56');
INSERT INTO `pageurl` VALUES ('42445', 'http://www.lebazi.com/n/20130531/784.html', '易建联搞笑动态图', '1', '2015-01-28 12:41:57');
INSERT INTO `pageurl` VALUES ('42446', 'http://www.lebazi.com/n/20130721/4720.html', '下一页', '1', '2015-01-28 12:41:58');
INSERT INTO `pageurl` VALUES ('42447', 'http://www.lebazi.com/n/20130722/4725.html', '18禁漫画之“想象力”：用假发也能变出一个女人', '1', '2015-01-28 12:41:58');
INSERT INTO `pageurl` VALUES ('42448', 'http://www.lebazi.com/n/20130723/4795.html', '下一页', '1', '2015-01-28 12:41:59');
INSERT INTO `pageurl` VALUES ('42449', 'http://www.lebazi.com/n/20130723/4797.html', '色系军团漫画之“地狱挑战”：跟魔鬼打赌是一定输~', '1', '2015-01-28 12:41:59');
INSERT INTO `pageurl` VALUES ('42450', 'http://www.lebazi.com/n/20130715/4513.html', '色系军团漫画：AA制之我们的关系不是用金钱可以计算的', '1', '2015-01-28 12:42:00');
INSERT INTO `pageurl` VALUES ('42451', 'http://www.lebazi.com/n/20130519/67.html', '下一页', '1', '2015-01-28 12:42:01');
INSERT INTO `pageurl` VALUES ('42452', 'http://www.lebazi.com/n/20130519/69.html', '邪恶漫画：存在的理由，原来就有的啊', '1', '2015-01-28 12:42:01');
INSERT INTO `pageurl` VALUES ('42453', 'http://www.lebazi.com8421_2.html', '下一页', '1', '2015-01-28 12:42:03');
INSERT INTO `pageurl` VALUES ('42454', 'http://www.lebazi.com/n/20140829/8424.html', '日本二次元h动漫美女无节操男女全裸共浴图片', '1', '2015-01-28 12:42:03');
INSERT INTO `pageurl` VALUES ('42455', 'http://www.lebazi.com/n/20140829/8420.html', '世界树与恋爱魔法使：清纯俏皮动漫美少女图片', '1', '2015-01-28 12:42:03');
INSERT INTO `pageurl` VALUES ('42456', 'http://www.lebazi.com/n/20130519/56.html', '下一页', '1', '2015-01-28 12:42:03');
INSERT INTO `pageurl` VALUES ('42457', 'http://www.lebazi.com/n/20130519/58.html', '邪恶漫画：难道是小师弟？', '1', '2015-01-28 12:42:03');
INSERT INTO `pageurl` VALUES ('42458', 'http://www.lebazi.com8864_2.html', '下一页', '1', '2015-01-28 12:42:03');
INSERT INTO `pageurl` VALUES ('42459', 'http://www.lebazi.com/n/20141216/8865.html', '大吴哥动漫少女h漫画：潜入搜查官&凉子', '1', '2015-01-28 12:42:03');
INSERT INTO `pageurl` VALUES ('42460', 'http://www.lebazi.com/n/20141216/8863.html', '动漫美女黄漫图片：高清豪乳软妹子', '1', '2015-01-28 12:42:03');
INSERT INTO `pageurl` VALUES ('42461', 'http://www.lebazi.com/n/20130724/4861.html', '下一页', '1', '2015-01-28 12:42:04');
INSERT INTO `pageurl` VALUES ('42462', 'http://www.lebazi.com/n/20130726/4912.html', '色系军团漫画之正确的穿衣方式：遇到这样的女的果断就娶了吧', '1', '2015-01-28 12:42:04');
INSERT INTO `pageurl` VALUES ('42463', 'http://www.lebazi.com/n/20131110/6433.html', '下一页', '1', '2015-01-28 12:42:05');
INSERT INTO `pageurl` VALUES ('42464', 'http://www.lebazi.com/n/20131110/6435.html', '邪恶漫画不知火舞h漫画：美女茶_矮子！这样有意思吗？', '1', '2015-01-28 12:42:05');
INSERT INTO `pageurl` VALUES ('42465', 'http://www.lebazi.com/n/20140302/7280.html', '下一页', '1', '2015-01-28 12:42:07');
INSERT INTO `pageurl` VALUES ('42466', 'http://www.lebazi.com/n/20140302/7282.html', '不知火舞邪恶漫画集之解绳索：哥这不公平，你也要添人家下面才行', '1', '2015-01-28 12:42:07');
INSERT INTO `pageurl` VALUES ('42467', 'http://www.lebazi.com/n/20140726/8132.html', '下一页', '1', '2015-01-28 12:42:09');
INSERT INTO `pageurl` VALUES ('42468', 'http://www.lebazi.com/n/20140726/8136.html', '内涵漫画全集_内涵漫画色系图片：露体狂充满朝气的一天', '1', '2015-01-28 12:42:09');
INSERT INTO `pageurl` VALUES ('42469', 'http://www.lebazi.com/n/20141023/8669.html', '下一页', '1', '2015-01-28 12:42:11');
INSERT INTO `pageurl` VALUES ('42470', 'http://www.lebazi.com/n/20141023/8671.html', '色系漫画全集_邪恶漫画不知火舞全集：讲卫生', '1', '2015-01-28 12:42:11');
INSERT INTO `pageurl` VALUES ('42471', 'http://www.lebazi.com/n/20130526/498.html', '下一页', '1', '2015-01-28 12:42:12');
INSERT INTO `pageurl` VALUES ('42472', 'http://www.lebazi.com/n/20130526/500.html', '真的是波涛汹涌啊。。', '1', '2015-01-28 12:42:12');
INSERT INTO `pageurl` VALUES ('42473', 'http://www.lebazi.com8728_2.html', '下一页', '1', '2015-01-28 12:42:14');
INSERT INTO `pageurl` VALUES ('42474', 'http://www.lebazi.com/n/20141117/8755.html', '我们都爱看美女：不求娶回家，只求右手能XXX，你们懂得！', '1', '2015-01-28 12:42:14');
INSERT INTO `pageurl` VALUES ('42475', 'http://www.lebazi.com/n/20141112/8727.html', '色_大胸美女（第1期）Vicky小恶魔扮演兔女郎', '1', '2015-01-28 12:42:14');
INSERT INTO `pageurl` VALUES ('42476', 'http://www.lebazi.com/n/20130601/886.html', '呵呵呵，那个人是傻瓜', '1', '2015-01-28 12:42:14');
INSERT INTO `pageurl` VALUES ('42477', 'http://www.lebazi.com/n/20130811/5440.html', '下一页', '1', '2015-01-28 12:42:17');
INSERT INTO `pageurl` VALUES ('42478', 'http://www.lebazi.com/n/20130811/5442.html', '国外牛人不用工具直接用挖掘机上火车gif动图', '1', '2015-01-28 12:42:17');
INSERT INTO `pageurl` VALUES ('42479', 'http://www.lebazi.com8559_2.html', '下一页', '1', '2015-01-28 12:42:18');
INSERT INTO `pageurl` VALUES ('42480', 'http://www.lebazi.com/n/20141009/8583.html', '动漫美女h漫画大全图片_日本奇幻h动漫美少女全裸图集', '1', '2015-01-28 12:42:18');
INSERT INTO `pageurl` VALUES ('42481', 'http://www.lebazi.com/n/20140923/8558.html', '邪恶少女H漫画_无翼鸟邪恶少女h漫画：H的门后', '1', '2015-01-28 12:42:18');
INSERT INTO `pageurl` VALUES ('42482', 'http://www.lebazi.com/n/20140319/7549.html', '下一页', '1', '2015-01-28 12:42:19');
INSERT INTO `pageurl` VALUES ('42483', 'http://www.lebazi.com/n/20141012/8596.html', '下一页', '1', '2015-01-28 12:42:20');
INSERT INTO `pageurl` VALUES ('42484', 'http://www.lebazi.com/n/20141012/8598.html', '披萨恋恋曲少女漫画邪恶篇258-264章节：你在哪儿', '1', '2015-01-28 12:42:20');
INSERT INTO `pageurl` VALUES ('42485', 'http://www.lebazi.com/n/20140812/8250.html', '下一页', '1', '2015-01-28 12:42:21');
INSERT INTO `pageurl` VALUES ('42486', 'http://www.lebazi.com8831_2.html', '下一页', '1', '2015-01-28 12:42:22');
INSERT INTO `pageurl` VALUES ('42487', 'http://www.lebazi.com/n/20141207/8820.html', '恋姐倾心邪恶少女漫画：爱的平和条约', '1', '2015-01-28 12:42:22');
INSERT INTO `pageurl` VALUES ('42488', 'http://www.lebazi.com/n/20130707/4123.html', '色小组漫画之：“无人岛男女”男人的用意~', '1', '2015-01-28 12:42:24');
INSERT INTO `pageurl` VALUES ('42489', 'http://www.lebazi.com8462_2.html', '下一页', '1', '2015-01-28 12:42:25');
INSERT INTO `pageurl` VALUES ('42490', 'http://www.lebazi.com/n/20140910/8468.html', '吃果果大作战动漫邪恶少女漫画第1章：归来的学生', '1', '2015-01-28 12:42:25');
INSERT INTO `pageurl` VALUES ('42491', 'http://www.lebazi.com8460_2.html', '下一页', '1', '2015-01-28 12:42:26');
INSERT INTO `pageurl` VALUES ('42492', 'http://www.lebazi.com/n/20140908/8459.html', '少女h漫画邪恶篇大全_动漫美女邪恶漫画：内裤校服', '1', '2015-01-28 12:42:26');
INSERT INTO `pageurl` VALUES ('42493', 'http://www.lebazi.com/n/20140619/7856.html', '少女h漫画大全_大吴哥邪恶少女漫画：主动出击！', '1', '2015-01-28 12:42:27');
INSERT INTO `pageurl` VALUES ('42494', 'http://www.lebazi.com8258_2.html', '下一页', '1', '2015-01-28 12:42:28');
INSERT INTO `pageurl` VALUES ('42495', 'http://www.lebazi.com/n/20140814/8266.html', '邪恶漫画色图片全集：没有可穿的衣服时', '1', '2015-01-28 12:42:28');
INSERT INTO `pageurl` VALUES ('42496', 'http://www.lebazi.com8256_2.html', '下一页', '1', '2015-01-28 12:42:28');
INSERT INTO `pageurl` VALUES ('42497', 'http://www.lebazi.com/n/20140812/8255.html', '梦龙y传系列_梦龙y传漫画全集第32话：魔环的选择', '1', '2015-01-28 12:42:28');
INSERT INTO `pageurl` VALUES ('42498', 'http://www.lebazi.com/n/20130714/4480.html', '美女gif：禽兽，你敢偷拍我', '1', '2015-01-28 12:42:29');
INSERT INTO `pageurl` VALUES ('42499', 'http://www.lebazi.com/n/20140306/7393.html', '下一页', '1', '2015-01-28 12:42:31');
INSERT INTO `pageurl` VALUES ('42500', 'http://www.lebazi.com/n/20140307/7461.html', '不知火舞邪恶漫画集：任何情况下都不能牺牲男朋友_重口h邪恶漫画日本', '1', '2015-01-28 12:42:31');
INSERT INTO `pageurl` VALUES ('42501', 'http://www.lebazi.com/n/20140617/7832.html', '下一页', '1', '2015-01-28 12:42:32');
INSERT INTO `pageurl` VALUES ('42502', 'http://www.lebazi.com/n/20141117/8751.html', '下一页', '1', '2015-01-28 12:42:34');
INSERT INTO `pageurl` VALUES ('42503', 'http://www.lebazi.com/n/20141117/8754.html', '没内涵黄段子大全：你特么没老婆你自己不知道吗？', '1', '2015-01-28 12:42:34');
INSERT INTO `pageurl` VALUES ('42504', 'http://www.lebazi.com/n/20140627/7958.html', '下一页', '1', '2015-01-28 12:42:36');
INSERT INTO `pageurl` VALUES ('42505', 'http://www.lebazi.com/n/20140627/7962.html', '波多野结衣内涵图_百思不得姐内涵福利图片：美女福利口水篇 傲人豪乳！', '1', '2015-01-28 12:42:36');
INSERT INTO `pageurl` VALUES ('42506', 'http://www.lebazi.com/n/20130821/5775.html', '下一页', '1', '2015-01-28 12:42:53');
INSERT INTO `pageurl` VALUES ('42507', 'http://www.lebazi.com/n/20130821/5777.html', '坑爹啊gif动图：尼玛这样子也卖萌', '1', '2015-01-28 12:42:53');
INSERT INTO `pageurl` VALUES ('42508', 'http://www.lebazi.com/n/20140816/8288.html', '下一页', '1', '2015-01-28 12:42:55');
INSERT INTO `pageurl` VALUES ('42509', 'http://www.lebazi.com/n/20140816/8290.html', '邪恶漫画色系军团寡妇三代漫画第5集：瓮中捉鳖', '1', '2015-01-28 12:42:55');
INSERT INTO `pageurl` VALUES ('42510', 'http://www.lebazi.com/n/20131103/6228.html', '下一页', '1', '2015-01-28 12:43:15');
INSERT INTO `pageurl` VALUES ('42511', 'http://www.lebazi.com/n/20131116/6533.html', '下一页', '1', '2015-01-28 12:43:16');
INSERT INTO `pageurl` VALUES ('42512', 'http://www.lebazi.com/n/20131116/6535.html', '2b青年在水下开枪的慢动作gif动态图', '1', '2015-01-28 12:43:16');
INSERT INTO `pageurl` VALUES ('42513', 'http://www.lebazi.com/n/20130714/4436.html', '色系军团漫画：实验男人会不会偷瞄女人的屁股', '1', '2015-01-28 12:43:17');
INSERT INTO `pageurl` VALUES ('42514', 'http://www.lebazi.com/n/20130623/3629.html', '下一页', '1', '2015-01-28 12:43:18');
INSERT INTO `pageurl` VALUES ('42515', 'http://www.lebazi.com/n/20130623/3631.html', '[搞怪军团] 口袋里的手暖炉', '1', '2015-01-28 12:43:18');
INSERT INTO `pageurl` VALUES ('42516', 'http://www.lebazi.com/n/20130722/4731.html', '下一页', '1', '2015-01-28 12:43:20');
INSERT INTO `pageurl` VALUES ('42517', 'http://www.lebazi.com/n/20130722/4733.html', '邪恶漫画之“大小”：鸡鸡跟蛋蛋长度差不多', '1', '2015-01-28 12:43:20');
INSERT INTO `pageurl` VALUES ('42518', 'http://www.lebazi.com/n/20130707/4125.html', '邪恶漫画：海边选择男人最有效的办法就是摆个诱惑的姿势~', '1', '2015-01-28 12:44:33');
INSERT INTO `pageurl` VALUES ('42519', 'http://www.lebazi.com/n/20130713/4363.html', '下一页', '1', '2015-01-28 12:44:37');
INSERT INTO `pageurl` VALUES ('42520', 'http://www.lebazi.com/n/20130713/4367.html', '美女恶搞gif：哈哈，帅哥上当了~', '1', '2015-01-28 12:44:42');
INSERT INTO `pageurl` VALUES ('42521', 'http://www.lebazi.com/n/20130615/1140.html', '下一页', '1', '2015-01-28 12:44:42');
INSERT INTO `pageurl` VALUES ('42522', 'http://www.lebazi.com/n/20130616/3409.html', '嗨，我爱死你你们了~', '1', '2015-01-28 12:44:42');
INSERT INTO `pageurl` VALUES ('42523', 'http://www.lebazi.com/n/20131129/6798.html', '下一页', '1', '2015-01-28 12:44:42');
INSERT INTO `pageurl` VALUES ('42524', 'http://www.lebazi.com/n/20131207/6827.html', '让我来，好花都被猪拱了！', '1', '2015-01-28 12:44:42');
INSERT INTO `pageurl` VALUES ('42525', 'http://www.lebazi.com/n/20141019/8652.html', '下一页', '1', '2015-01-28 12:44:47');
INSERT INTO `pageurl` VALUES ('42526', 'http://www.lebazi.com/n/20141019/8654.html', '色小组二次元h邪恶漫画_色系漫画：成人礼物', '1', '2015-01-28 12:44:47');
INSERT INTO `pageurl` VALUES ('42527', 'http://www.lebazi.com/n/20130730/5074.html', '下一页', '1', '2015-01-28 12:44:48');
INSERT INTO `pageurl` VALUES ('42528', 'http://www.lebazi.com/n/20130730/5076.html', '向下俯视巨胸美女gif动图', '1', '2015-01-28 12:44:48');
INSERT INTO `pageurl` VALUES ('42529', 'http://www.lebazi.com/n/20141116/8744.html', '下一页', '1', '2015-01-28 12:44:48');
INSERT INTO `pageurl` VALUES ('42530', 'http://www.lebazi.com/n/20141116/8746.html', '韩国色情动漫：她的经验', '1', '2015-01-28 12:44:48');
INSERT INTO `pageurl` VALUES ('42531', 'http://www.lebazi.com/n/20141120/8767.html', '下一页', '1', '2015-01-28 12:44:54');
INSERT INTO `pageurl` VALUES ('42532', 'http://www.lebazi.com/n/20141201/8807.html', '微博经典牛段子：逼良为娼不可怕，可怕的是逼良为娼后还扫黄', '1', '2015-01-28 12:44:54');
INSERT INTO `pageurl` VALUES ('42533', 'http://www.lebazi.com/n/20141012/8605.html', '韩国邪恶漫画“人鱼公主传”全集连载：第05集', '1', '2015-01-28 12:44:58');
INSERT INTO `pageurl` VALUES ('42534', 'http://www.lebazi.com/n/20130523/261.html', '下一页', '1', '2015-01-28 12:45:03');
INSERT INTO `pageurl` VALUES ('42535', 'http://www.lebazi.com/n/20130814/5592.html', '国外搞笑视频_搞笑视频笑死人不偿命之当牛逼的视频加上背景音乐', '1', '2015-01-28 12:45:03');
INSERT INTO `pageurl` VALUES ('42536', 'http://www.lebazi.com/n/20130814/5590.html', '优酷搞笑视频：叫兽微电影之看不见的女朋友', '1', '2015-01-28 12:45:03');
INSERT INTO `pageurl` VALUES ('42537', 'http://www.lebazi.com/n/20130905/5938.html', '下一页', '1', '2015-01-28 12:46:09');
INSERT INTO `pageurl` VALUES ('42538', 'http://www.lebazi.com/n/20140623/7890.html', '下一页', '1', '2015-01-28 12:46:16');
INSERT INTO `pageurl` VALUES ('42539', 'http://www.lebazi.com/n/20140623/7892.html', '乐张不入妖妖小精漫画全集_妖妖小精色系军团：分辨真假丈夫的方法', '1', '2015-01-28 12:46:16');
INSERT INTO `pageurl` VALUES ('42540', 'http://www.lebazi.com/n/20131115/6527.html', '初音未来h邪恶漫画：品酒师_不愧为大师的舌头，什么都能舔出来', '1', '2015-01-28 12:46:22');
INSERT INTO `pageurl` VALUES ('42541', 'http://www.lebazi.com/n/20141009/8584.html', '下一页', '1', '2015-01-28 12:46:27');
INSERT INTO `pageurl` VALUES ('42542', 'http://www.lebazi.com/n/20140321/7570.html', '下一页', '1', '2015-01-28 12:46:27');
INSERT INTO `pageurl` VALUES ('42543', 'http://www.lebazi.com/n/20130724/4812.html', '小姑娘，让大哥我来好好调教你一下~', '1', '2015-01-28 12:47:14');
INSERT INTO `pageurl` VALUES ('42544', 'http://www.lebazi.com/n/20140209/7046.html', '下一页', '1', '2015-01-28 12:47:27');
INSERT INTO `pageurl` VALUES ('42545', 'http://www.lebazi.com/n/20140209/7050.html', '齐B迷你裙老师gif动图：如果老师都是这样上课我们成绩肯定会...', '1', '2015-01-28 12:47:41');
INSERT INTO `pageurl` VALUES ('42546', 'http://www.lebazi.com/n/20130613/1038.html', '下一页', '1', '2015-01-28 12:48:03');
INSERT INTO `pageurl` VALUES ('42547', 'http://www.lebazi.com/n/20130613/1040.html', '这绝对是一个美丽的意外~~', '1', '2015-01-28 12:48:03');
INSERT INTO `pageurl` VALUES ('42548', 'http://www.lebazi.com/n/20130819/5757.html', '搞笑视频笑死人：恶搞电影《九品芝麻官》日语版！_超级搞笑视频', '1', '2015-01-28 12:48:17');
INSERT INTO `pageurl` VALUES ('42549', 'http://www.lebazi.com/n/20130814/5607.html', '搞笑视频笑死人不偿命之狂暴凶残的超级玛丽', '1', '2015-01-28 12:48:17');
INSERT INTO `pageurl` VALUES ('42550', 'http://www.lebazi.com/n/20130630/3866.html', '下一页', '1', '2015-01-28 12:48:34');
INSERT INTO `pageurl` VALUES ('42551', 'http://www.lebazi.com/n/20130630/3868.html', '色系军团之“好想成为她的内内，哪怕只有一天”', '1', '2015-01-28 12:48:34');
INSERT INTO `pageurl` VALUES ('42552', 'http://www.lebazi.com/n/20140625/7932.html', '下一页', '1', '2015-01-28 12:48:45');
INSERT INTO `pageurl` VALUES ('42553', 'http://www.lebazi.com/n/20140626/7953.html', '波多野结衣内涵图_百思不得姐内涵图：自己动手不代表就是坏女孩', '1', '2015-01-28 12:48:45');
INSERT INTO `pageurl` VALUES ('42554', 'http://www.lebazi.com/n/20130525/344.html', '下一页', '1', '2015-01-28 12:48:52');
INSERT INTO `pageurl` VALUES ('42555', 'http://www.lebazi.com/n/20130525/346.html', '借过，借过，别挡路！', '1', '2015-01-28 12:48:52');
INSERT INTO `pageurl` VALUES ('42556', 'http://www.lebazi.com7518_2.html', '下一页', '1', '2015-01-28 12:48:52');
INSERT INTO `pageurl` VALUES ('42557', 'http://www.lebazi.com/n/20140316/7519.html', '精选各种2货贼抢劫失败的搞笑GIF图集合', '1', '2015-01-28 12:48:52');
INSERT INTO `pageurl` VALUES ('42558', 'http://www.lebazi.com/n/20140316/7517.html', '全球各种牛逼的漂移GIF动态图大全：看牛人是怎么玩漂移的', '1', '2015-01-28 12:48:52');
INSERT INTO `pageurl` VALUES ('42559', 'http://www.lebazi.com7780_2.html', '下一页', '1', '2015-01-28 12:48:53');
INSERT INTO `pageurl` VALUES ('42560', 'http://www.lebazi.com/n/20140613/7781.html', '少女漫画h在线阅读_天才麻将少女漫画：暖和身体，恋姐倾心邪恶漫画', '1', '2015-01-28 12:48:53');
INSERT INTO `pageurl` VALUES ('42561', 'http://www.lebazi.com/n/20140613/7779.html', '少女爱情在线邪恶漫画_恋姐倾心漫画：到达终点之前无法停下来，天才麻将少女漫画', '1', '2015-01-28 12:48:53');
INSERT INTO `pageurl` VALUES ('42562', 'http://www.lebazi.com/n/20130715/4538.html', '邪恶漫画：急救的秘密，就那样~', '1', '2015-01-28 12:49:13');
INSERT INTO `pageurl` VALUES ('42563', 'http://www.lebazi.com/n/20140817/8304.html', '下一页', '1', '2015-01-28 12:50:25');
INSERT INTO `pageurl` VALUES ('42564', 'http://www.lebazi.com/n/20140623/7895.html', '下一页', '1', '2015-01-28 12:50:34');
INSERT INTO `pageurl` VALUES ('42565', 'http://www.lebazi.com/n/20141116/8737.html', '下一页', '1', '2015-01-28 12:50:34');
INSERT INTO `pageurl` VALUES ('42566', 'http://www.lebazi.com/n/20141116/8739.html', '不知火舞邪恶漫画：分手交易', '1', '2015-01-28 12:50:34');
INSERT INTO `pageurl` VALUES ('42567', 'http://www.lebazi.com/n/20130803/5185.html', '下一页', '1', '2015-01-28 12:50:34');
INSERT INTO `pageurl` VALUES ('42568', 'http://www.lebazi.com/n/20130803/5189.html', '两女人拿孩子翻转gif动图：这孩子肯定不是亲生的', '1', '2015-01-28 12:50:35');
INSERT INTO `pageurl` VALUES ('42569', 'http://www.lebazi.com/n/20130723/4794.html', '下一页', '1', '2015-01-28 12:50:42');
INSERT INTO `pageurl` VALUES ('42570', 'http://www.lebazi.com/n/20130611/1009.html', '下一页', '1', '2015-01-28 12:50:46');
INSERT INTO `pageurl` VALUES ('42571', 'http://www.lebazi.com/n/20130612/1032.html', '这下玩笑开大了吧，差点炸飞了~', '1', '2015-01-28 12:50:50');
INSERT INTO `pageurl` VALUES ('42572', 'http://www.lebazi.com/n/20130617/3414.html', '下一页', '1', '2015-01-28 12:50:56');
INSERT INTO `pageurl` VALUES ('42573', 'http://www.lebazi.com/n/20130617/3418.html', ' 群主，啥时候带我们去K歌呀~~', '1', '2015-01-28 12:50:56');
INSERT INTO `pageurl` VALUES ('42574', 'http://www.lebazi.com/n/20130714/4426.html', '下一页', '1', '2015-01-28 12:50:59');
INSERT INTO `pageurl` VALUES ('42575', 'http://www.lebazi.com/n/20130714/4428.html', '爆笑漫画：“脚背”的真相', '1', '2015-01-28 12:50:59');
INSERT INTO `pageurl` VALUES ('42576', 'http://www.lebazi.com/n/20131028/6153.html', '下一页', '1', '2015-01-28 12:51:02');
INSERT INTO `pageurl` VALUES ('42577', 'http://www.lebazi.com/n/20131028/6155.html', '邪恶漫画色系图片：这次我一定要撬开女罪犯的嘴巴_审讯', '1', '2015-01-28 12:51:03');
INSERT INTO `pageurl` VALUES ('42578', 'http://www.lebazi.com8196_2.html', '下一页', '1', '2015-01-28 12:52:16');
INSERT INTO `pageurl` VALUES ('42579', 'http://www.lebazi.com/n/20140806/8197.html', '少女邪恶漫画大全_性感动漫美女邪恶篇：姐弟情深第二期', '1', '2015-01-28 12:52:16');
INSERT INTO `pageurl` VALUES ('42580', 'http://www.lebazi.com/n/20140805/8195.html', '少女漫画h在线阅读_天才麻将少女漫画：奏太君', '1', '2015-01-28 12:52:16');
INSERT INTO `pageurl` VALUES ('42581', 'http://www.lebazi.com/n/20130812/5509.html', '下一页', '1', '2015-01-28 12:52:22');
INSERT INTO `pageurl` VALUES ('42582', 'http://www.lebazi.com/n/20130813/5554.html', '初音未来h邪恶漫画_不知火舞邪恶漫画之绝佳时机', '1', '2015-01-28 12:52:22');
INSERT INTO `pageurl` VALUES ('42583', 'http://www.lebazi.com/n/20140319/7545.html', '下一页', '1', '2015-01-28 12:52:33');

-- ----------------------------
-- Table structure for parent_picture
-- ----------------------------
DROP TABLE IF EXISTS `parent_picture`;
CREATE TABLE `parent_picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_picture_name` varchar(1024) NOT NULL DEFAULT '',
  `picture_url` varchar(1024) DEFAULT NULL,
  `detail` varchar(1024) DEFAULT NULL,
  `skim_count` int(11) NOT NULL DEFAULT '1',
  `catalog_id` int(11) NOT NULL,
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_delete` char(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `catalog_id` (`catalog_id`),
  CONSTRAINT `parent_picture_ibfk_1` FOREIGN KEY (`catalog_id`) REFERENCES `catalog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of parent_picture
-- ----------------------------
INSERT INTO `parent_picture` VALUES ('1', '爆笑第一期', null, null, '1', '1', '2015-01-22 15:11:22', '1');

-- ----------------------------
-- Table structure for picture
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `picture_name` varchar(128) NOT NULL DEFAULT '',
  `inter_url_title` varchar(512) DEFAULT NULL,
  `inter_url` varchar(512) DEFAULT NULL,
  `local_url` varchar(512) NOT NULL DEFAULT '',
  `title` varchar(512) NOT NULL DEFAULT '',
  `type` varchar(12) DEFAULT '',
  `spark_url` varchar(1024) NOT NULL DEFAULT 'http://www.baidu.com',
  `common_id` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT '0',
  `width` int(11) DEFAULT '0',
  `detail` varchar(1024) DEFAULT '',
  `author` varchar(128) DEFAULT NULL,
  `parent_picture` int(11) DEFAULT NULL,
  `top_count` int(11) DEFAULT '1',
  `down_count` int(11) DEFAULT '0',
  `old_picture` int(11) DEFAULT '0',
  `key_word` varchar(1024) NOT NULL DEFAULT '',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_delete` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `author_id` (`author`),
  KEY `picture_name` (`picture_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=399 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of picture
-- ----------------------------
INSERT INTO `picture` VALUES ('1', 'logo.gif', null, 'http://www.lebazi.com/images/logo.gif', 'http://172.17.111.191:8080/images/logo.gif', '乐吧子', null, 'http://www.lebazi.com/n/20150109/8913.html', null, null, null, '乐吧子', null, '2', '1', '0', '0', '雷人网事', '2015-01-28 10:10:47', '1');
INSERT INTO `picture` VALUES ('2', 'e556fbd4jw1elslc7r39qj20qo140781.jpg', null, 'http://ww2.sinaimg.cn/large/e556fbd4jw1elslc7r39qj20qo140781.jpg', 'http://172.17.111.191:8080/images/e556fbd4jw1elslc7r39qj20qo140781.jpg', '沫晓伊baby丰乳翘臀性感透视内衣私房写真照', null, 'http://www.lebazi.com/n/20150109/8913.html', null, null, null, '沫晓伊baby丰乳翘臀性感透视内衣私房写真照', null, '2', '1', '0', '0', '雷人网事', '2015-01-28 10:10:48', '1');
INSERT INTO `picture` VALUES ('3', 'p201408130000472263.jpg', null, 'http://www.lebazi.com/uploadpic/201408/13/p201408130000472263.jpg', 'http://172.17.111.191:8080/images/p201408130000472263.jpg', '梦龙y传系列_梦龙y传漫画全集第34话：奖励篇', null, 'http://www.lebazi.com/n/20150109/8913.html', null, null, null, '梦龙y传系列_梦龙y传漫画全集第34话：奖励篇', null, '2', '1', '0', '0', '雷人网事', '2015-01-28 10:10:48', '1');
INSERT INTO `picture` VALUES ('4', 'p201307142058171385.gif', null, 'http://www.lebazi.com/uploadpic/201307/14/p201307142058171385.gif', 'http://172.17.111.191:8080/images/p201307142058171385.gif', '美女楼梯扭屁股gif动图', null, 'http://www.lebazi.com/n/20150109/8913.html', null, null, null, '美女楼梯扭屁股gif动图', null, '2', '1', '0', '0', '雷人网事', '2015-01-28 10:10:51', '1');
INSERT INTO `picture` VALUES ('5', 'p201307132318422197.gif', null, 'http://www.lebazi.com/uploadpic/201307/13/p201307132318422197.gif', 'http://172.17.111.191:8080/images/p201307132318422197.gif', '美女gif：PP好滑呀', null, 'http://www.lebazi.com/n/20150109/8913.html', null, null, null, '美女gif：PP好滑呀', null, '2', '1', '0', '0', '雷人网事', '2015-01-28 10:10:56', '1');
INSERT INTO `picture` VALUES ('6', 'p201306152243407455.gif', null, 'http://www.lebazi.com/uploadpic/201306/15/p201306152243407455.gif', 'http://172.17.111.191:8080/images/p201306152243407455.gif', '有其父必有其女，真是好有爱的两父女~', null, 'http://www.lebazi.com/n/20150109/8913.html', null, null, null, '有其父必有其女，真是好有爱的两父女~', null, '2', '1', '0', '0', '雷人网事', '2015-01-28 10:11:01', '1');
INSERT INTO `picture` VALUES ('7', 'p201403230112561593.gif', null, 'http://www.lebazi.com/uploadpic/201403/23/p201403230112561593.gif', 'http://172.17.111.191:8080/images/p201403230112561593.gif', '没内涵邪恶gif：小孩子看到大胸很惊讶gif动图', null, 'http://www.lebazi.com/n/20150109/8913.html', null, null, null, '没内涵邪恶gif：小孩子看到大胸很惊讶gif动图', null, '2', '1', '0', '0', '雷人网事', '2015-01-28 10:11:07', '1');
INSERT INTO `picture` VALUES ('8', 'p201307242202373268.gif', null, 'http://www.lebazi.com/uploadpic/201307/24/p201307242202373268.gif', 'http://172.17.111.191:8080/images/p201307242202373268.gif', '胖MM的烦恼gif：有些事情像身上的肉肉一样总是甩不掉', null, 'http://www.lebazi.com/n/20150109/8913.html', null, null, null, '胖MM的烦恼gif：有些事情像身上的肉肉一样总是甩不掉', null, '2', '1', '0', '0', '雷人网事', '2015-01-28 10:11:16', '1');
INSERT INTO `picture` VALUES ('9', 'p201402090300428011.gif', null, 'http://www.lebazi.com/uploadpic/201402/09/p201402090300428011.gif', 'http://172.17.111.191:8080/images/p201402090300428011.gif', '俩妹子恶搞xxoo姿势gif动图：你这个疯子，放开那个妹纸，让我来！', null, 'http://www.lebazi.com/n/20150109/8913.html', null, null, null, '俩妹子恶搞xxoo姿势gif动图：你这个疯子，放开那个妹纸，让我来！', null, '2', '1', '0', '0', '雷人网事', '2015-01-28 10:11:23', '1');
INSERT INTO `picture` VALUES ('10', 'p201308032145197521.gif', null, 'http://www.lebazi.com/uploadpic/201308/03/p201308032145197521.gif', 'http://172.17.111.191:8080/images/p201308032145197521.gif', '雷人gif动图：好大的勺子啊', null, 'http://www.lebazi.com/n/20150109/8913.html', null, null, null, '雷人gif动图：好大的勺子啊', null, '2', '1', '0', '0', '雷人网事', '2015-01-28 10:11:30', '1');
INSERT INTO `picture` VALUES ('11', 'p201307242159035884.gif', null, 'http://www.lebazi.com/uploadpic/201307/24/p201307242159035884.gif', 'http://172.17.111.191:8080/images/p201307242159035884.gif', '呼啦圈的创意玩法gif动图', null, 'http://www.lebazi.com/n/20150109/8913.html', null, null, null, '呼啦圈的创意玩法gif动图', null, '2', '1', '0', '0', '雷人网事', '2015-01-28 10:11:41', '1');
INSERT INTO `picture` VALUES ('12', 'p201306112051111226.gif', null, 'http://www.lebazi.com/uploadpic/201306/11/p201306112051111226.gif', 'http://172.17.111.191:8080/images/p201306112051111226.gif', '哇，这水好好玩的~~', null, 'http://www.lebazi.com/n/20150109/8913.html', null, null, null, '哇，这水好好玩的~~', null, '2', '1', '0', '0', '雷人网事', '2015-01-28 10:11:46', '1');
INSERT INTO `picture` VALUES ('13', 'p201501090132514145.jpg', null, 'http://www.lebazi.com/uploadpic/201501/09/p201501090132514145.jpg', 'http://172.17.111.191:8080/images/p201501090132514145.jpg', '唐馨baby福利自拍私房照诱惑写真套图全集', null, 'http://www.lebazi.com/n/20150109/8913.html', null, null, null, '唐馨baby福利自拍私房照诱惑写真套图全集', null, '2', '1', '0', '0', '雷人网事', '2015-01-28 10:11:46', '1');
INSERT INTO `picture` VALUES ('14', 'p201501090101246699.jpg', null, 'http://www.lebazi.com/uploadpic/201501/09/p201501090101246699.jpg', 'http://172.17.111.191:8080/images/p201501090101246699.jpg', '沫晓伊baby丰乳翘臀性感透视内衣私房写真照', null, 'http://www.lebazi.com/n/20150109/8913.html', null, null, null, '沫晓伊baby丰乳翘臀性感透视内衣私房写真照', null, '2', '1', '0', '0', '雷人网事', '2015-01-28 10:11:47', '1');
INSERT INTO `picture` VALUES ('15', 'p201501090055014958.jpg', null, 'http://www.lebazi.com/uploadpic/201501/09/p201501090055014958.jpg', 'http://172.17.111.191:8080/images/p201501090055014958.jpg', '超性感女模沈璐Lulu露巨乳拍足球宝贝写真照 附内衣照', null, 'http://www.lebazi.com/n/20150109/8913.html', null, null, null, '超性感女模沈璐Lulu露巨乳拍足球宝贝写真照 附内衣照', null, '2', '1', '0', '0', '雷人网事', '2015-01-28 10:11:47', '1');
INSERT INTO `picture` VALUES ('16', 'p201501090047178379.jpg', null, 'http://www.lebazi.com/uploadpic/201501/09/p201501090047178379.jpg', 'http://172.17.111.191:8080/images/p201501090047178379.jpg', '推女郎陈美琳-Mandy微博晒性感半裸自拍私房照', null, 'http://www.lebazi.com/n/20150109/8913.html', null, null, null, '推女郎陈美琳-Mandy微博晒性感半裸自拍私房照', null, '2', '1', '0', '0', '雷人网事', '2015-01-28 10:11:47', '1');
INSERT INTO `picture` VALUES ('17', 'p201501090041082523.jpg', null, 'http://www.lebazi.com/uploadpic/201501/09/p201501090041082523.jpg', 'http://172.17.111.191:8080/images/p201501090041082523.jpg', '推女郎曾水-Raeka粉色兔女郎性感写真照挑逗你', null, 'http://www.lebazi.com/n/20150109/8913.html', null, null, null, '推女郎曾水-Raeka粉色兔女郎性感写真照挑逗你', null, '2', '1', '0', '0', '雷人网事', '2015-01-28 10:11:47', '1');
INSERT INTO `picture` VALUES ('18', 'p201501090034034803.jpg', null, 'http://www.lebazi.com/uploadpic/201501/09/p201501090034034803.jpg', 'http://172.17.111.191:8080/images/p201501090034034803.jpg', '微博红人G奶波霸女皇赵潇潇黑色情趣内衣诱惑图片合集', null, 'http://www.lebazi.com/n/20150109/8913.html', null, null, null, '微博红人G奶波霸女皇赵潇潇黑色情趣内衣诱惑图片合集', null, '2', '1', '0', '0', '雷人网事', '2015-01-28 10:11:47', '1');
INSERT INTO `picture` VALUES ('19', 'p201407060934137147.jpg', null, 'http://www.lebazi.com/uploadpic/201407/06/p201407060934137147.jpg', 'http://172.17.111.191:8080/images/p201407060934137147.jpg', '色系军团邪恶漫画_大吴哥娱乐邪恶漫画：对自由的意志', null, 'http://www.lebazi.com/n/20150109/8913.html', null, null, null, '色系军团邪恶漫画_大吴哥娱乐邪恶漫画：对自由的意志', null, '2', '1', '0', '0', '雷人网事', '2015-01-28 10:11:47', '1');
INSERT INTO `picture` VALUES ('20', 'p201309072355337432.jpg', null, 'http://www.lebazi.com/uploadpic/201309/07/p201309072355337432.jpg', 'http://172.17.111.191:8080/images/p201309072355337432.jpg', '18进禁邪恶漫画：检查门_不知火舞邪恶漫画集', null, 'http://www.lebazi.com/n/20150109/8913.html', null, null, null, '18进禁邪恶漫画：检查门_不知火舞邪恶漫画集', null, '2', '1', '0', '0', '雷人网事', '2015-01-28 10:11:48', '1');
INSERT INTO `picture` VALUES ('21', 'p201305191722093141.jpg', null, 'http://www.lebazi.com/uploadpic/201305/19/p201305191722093141.jpg', 'http://172.17.111.191:8080/images/p201305191722093141.jpg', '邪恶漫画：师傅和鼻孔都悲剧了', null, 'http://www.lebazi.com/n/20150109/8913.html', null, null, null, '邪恶漫画：师傅和鼻孔都悲剧了', null, '2', '1', '0', '0', '雷人网事', '2015-01-28 10:11:48', '1');
INSERT INTO `picture` VALUES ('22', 'p201407270003146943.jpg', null, 'http://www.lebazi.com/uploadpic/201407/27/p201407270003146943.jpg', 'http://172.17.111.191:8080/images/p201407270003146943.jpg', '少女漫画邪恶篇_无翼鸟一库邪恶h漫画：电车里的双飞', null, 'http://www.lebazi.com/n/20150109/8913.html', null, null, null, '少女漫画邪恶篇_无翼鸟一库邪恶h漫画：电车里的双飞', null, '2', '1', '0', '0', '雷人网事', '2015-01-28 10:11:48', '1');
INSERT INTO `picture` VALUES ('23', 'p201406230123014654.jpg', null, 'http://www.lebazi.com/uploadpic/201406/23/p201406230123014654.jpg', 'http://172.17.111.191:8080/images/p201406230123014654.jpg', '乐张不入妖妖小精漫画全集_妖妖小精色系军团：稻草人施法', null, 'http://www.lebazi.com/n/20150109/8913.html', null, null, null, '乐张不入妖妖小精漫画全集_妖妖小精色系军团：稻草人施法', null, '2', '1', '0', '0', '雷人网事', '2015-01-28 10:11:49', '1');
INSERT INTO `picture` VALUES ('24', '72e85f24jw1ene7aeore6j216o1kwx6p.jpg', null, 'http://ww1.sinaimg.cn/large/72e85f24jw1ene7aeore6j216o1kwx6p.jpg', 'http://172.17.111.191:8080/images/72e85f24jw1ene7aeore6j216o1kwx6p.jpg', '超性感女模沈璐Lulu露巨乳拍足球宝贝写真照 附内衣照', null, 'http://www.lebazi.com/n/20150109/8912.html', null, null, null, '超性感女模沈璐Lulu露巨乳拍足球宝贝写真照 附内衣照', null, '2', '1', '0', '0', '雷人网事', '2015-01-28 10:11:50', '1');
INSERT INTO `picture` VALUES ('25', '7ff722dbjw1eno239995zj20tm18gwmw.jpg', null, 'http://ww3.sinaimg.cn/mw1024/7ff722dbjw1eno239995zj20tm18gwmw.jpg', 'http://172.17.111.191:8080/images/7ff722dbjw1eno239995zj20tm18gwmw.jpg', '推女郎陈美琳-Mandy微博晒性感半裸自拍私房照', null, 'http://www.lebazi.com/n/20150109/8911.html', null, null, null, '推女郎陈美琳-Mandy微博晒性感半裸自拍私房照', null, '2', '1', '0', '0', '雷人网事', '2015-01-28 10:11:50', '1');
INSERT INTO `picture` VALUES ('26', '005JFMZKjw1envcwnu2vrj30xc18gdnh.jpg', null, 'http://ww2.sinaimg.cn/large/005JFMZKjw1envcwnu2vrj30xc18gdnh.jpg', 'http://172.17.111.191:8080/images/005JFMZKjw1envcwnu2vrj30xc18gdnh.jpg', '推女郎曾水-Raeka粉色兔女郎性感写真照挑逗你', null, 'http://www.lebazi.com/n/20150109/8910.html', null, null, null, '推女郎曾水-Raeka粉色兔女郎性感写真照挑逗你', null, '2', '1', '0', '0', '雷人网事', '2015-01-28 10:11:51', '1');
INSERT INTO `picture` VALUES ('27', 'bcf091fdgw1env9bl47x5j20f10m8whf.jpg', null, 'http://ww3.sinaimg.cn/large/bcf091fdgw1env9bl47x5j20f10m8whf.jpg', 'http://172.17.111.191:8080/images/bcf091fdgw1env9bl47x5j20f10m8whf.jpg', '微博红人G奶波霸女皇赵潇潇黑色情趣内衣诱惑图片合集', null, 'http://www.lebazi.com/n/20150109/8909.html', null, null, null, '微博红人G奶波霸女皇赵潇潇黑色情趣内衣诱惑图片合集', null, '2', '1', '0', '0', '雷人网事', '2015-01-28 10:11:52', '1');
INSERT INTO `picture` VALUES ('28', 'ab57ce92jw1enuhqhxweej20c00hsdhd.jpg', null, 'http://ww4.sinaimg.cn/mw1024/ab57ce92jw1enuhqhxweej20c00hsdhd.jpg', 'http://172.17.111.191:8080/images/ab57ce92jw1enuhqhxweej20c00hsdhd.jpg', '推女郎乔雅冰Baby全裸丁字裤火辣性感诱惑照写真', null, 'http://www.lebazi.com/n/20150109/8908.html', null, null, null, '推女郎乔雅冰Baby全裸丁字裤火辣性感诱惑照写真', null, '2', '1', '0', '0', '雷人网事', '2015-01-28 10:11:52', '1');
INSERT INTO `picture` VALUES ('29', 'b5a3cd89gw1enz87lh9x9j20go0k0gpd.jpg', null, 'http://ww3.sinaimg.cn/mw690/b5a3cd89gw1enz87lh9x9j20go0k0gpd.jpg', 'http://172.17.111.191:8080/images/b5a3cd89gw1enz87lh9x9j20go0k0gpd.jpg', '爱与欲望之学园邪恶漫画邪恶篇：第一次看到', null, 'http://www.lebazi.com/n/20150106/8907.html', null, null, null, '爱与欲望之学园邪恶漫画邪恶篇：第一次看到', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:11:53', '1');
INSERT INTO `picture` VALUES ('30', '2013081500331473641376497994.gif', null, 'http://www.lebazi.com/uploadpic/201308/15/2013081500331473641376497994.gif', 'http://172.17.111.191:8080/images/2013081500331473641376497994.gif', '成人gif_美女脱光衣服gif：偶买噶的，我快受不住了', null, 'http://www.lebazi.com/n/20130815/5638.html', null, null, null, '成人gif_美女脱光衣服gif：偶买噶的，我快受不住了', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:12:20', '1');
INSERT INTO `picture` VALUES ('31', 'p201403260258115606.jpg', null, 'http://www.lebazi.com/uploadpic/201403/26/p201403260258115606.jpg', 'http://172.17.111.191:8080/images/p201403260258115606.jpg', '老湿视频作品系列全集_老湿视频不吐不快之完爆一代宗师', null, 'http://www.lebazi.com/n/20130815/5638.html', null, null, null, '老湿视频作品系列全集_老湿视频不吐不快之完爆一代宗师', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:12:20', '1');
INSERT INTO `picture` VALUES ('32', 'p201307162054075556.gif', null, 'http://www.lebazi.com/uploadpic/201307/16/p201307162054075556.gif', 'http://172.17.111.191:8080/images/p201307162054075556.gif', '体操MM露内裤gif动图', null, 'http://www.lebazi.com/n/20130815/5638.html', null, null, null, '体操MM露内裤gif动图', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:12:27', '1');
INSERT INTO `picture` VALUES ('33', 'p201311030217328196.gif', null, 'http://www.lebazi.com/uploadpic/201311/03/p201311030217328196.gif', 'http://172.17.111.191:8080/images/p201311030217328196.gif', '2B青年成人gif：捡肥皂是如何炼成的', null, 'http://www.lebazi.com/n/20130815/5638.html', null, null, null, '2B青年成人gif：捡肥皂是如何炼成的', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:12:35', '1');
INSERT INTO `picture` VALUES ('34', 'p201309160026211249.jpg', null, 'http://www.lebazi.com/uploadpic/201309/16/p201309160026211249.jpg', 'http://172.17.111.191:8080/images/p201309160026211249.jpg', '性感美女和丝袜美女你们更加喜欢哪种呢', null, 'http://www.lebazi.com/n/20130815/5638.html', null, null, null, '性感美女和丝袜美女你们更加喜欢哪种呢', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:12:35', '1');
INSERT INTO `picture` VALUES ('35', 'p201408290120466083.jpg', null, 'http://www.lebazi.com/uploadpic/201408/29/p201408290120466083.jpg', 'http://172.17.111.191:8080/images/p201408290120466083.jpg', '高挑清新软妹子性感翘臀美女撸管福利图：黑丝丝教师爆乳翘臀图集', null, 'http://www.lebazi.com/n/20130815/5638.html', null, null, null, '高挑清新软妹子性感翘臀美女撸管福利图：黑丝丝教师爆乳翘臀图集', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:12:35', '1');
INSERT INTO `picture` VALUES ('36', 'p201408180025426960.jpg', null, 'http://www.lebazi.com/uploadpic/201408/18/p201408180025426960.jpg', 'http://172.17.111.191:8080/images/p201408180025426960.jpg', '色系军团蚂蚁与蜂蜜邪恶系列漫画全集：第一集 证明清白', null, 'http://www.lebazi.com/n/20130815/5638.html', null, null, null, '色系军团蚂蚁与蜂蜜邪恶系列漫画全集：第一集 证明清白', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:12:36', '1');
INSERT INTO `picture` VALUES ('37', 'p201306101735453792.gif', null, 'http://www.lebazi.com/uploadpic/201306/10/p201306101735453792.gif', 'http://172.17.111.191:8080/images/p201306101735453792.gif', '杰伦好无辜!', null, 'http://www.lebazi.com/n/20130815/5638.html', null, null, null, '杰伦好无辜!', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:12:41', '1');
INSERT INTO `picture` VALUES ('38', 'p201308032253392487.jpg', null, 'http://www.lebazi.com/uploadpic/201308/03/p201308032253392487.jpg', 'http://172.17.111.191:8080/images/p201308032253392487.jpg', '邪恶漫画之新花样：挡住黑奶嘴继续撸', null, 'http://www.lebazi.com/n/20130815/5638.html', null, null, null, '邪恶漫画之新花样：挡住黑奶嘴继续撸', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:12:41', '1');
INSERT INTO `picture` VALUES ('39', 'p201310090037024074.gif', null, 'http://www.lebazi.com/uploadpic/201310/09/p201310090037024074.gif', 'http://172.17.111.191:8080/images/p201310090037024074.gif', '美女买东西遭2B青年千年杀爆菊gif动图', null, 'http://www.lebazi.com/n/20130815/5638.html', null, null, null, '美女买东西遭2B青年千年杀爆菊gif动图', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:12:45', '1');
INSERT INTO `picture` VALUES ('40', 'p201306132239427866.gif', null, 'http://www.lebazi.com/uploadpic/201306/13/p201306132239427866.gif', 'http://172.17.111.191:8080/images/p201306132239427866.gif', '真的是一个好注意~~', null, 'http://www.lebazi.com/n/20130815/5638.html', null, null, null, '真的是一个好注意~~', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:12:52', '1');
INSERT INTO `picture` VALUES ('41', 'p201410122327467039.jpg', null, 'http://www.lebazi.com/uploadpic/201410/12/p201410122327467039.jpg', 'http://172.17.111.191:8080/images/p201410122327467039.jpg', '韩国邪恶漫画“人鱼公主传”全集连载：第20集', null, 'http://www.lebazi.com/n/20130815/5638.html', null, null, null, '韩国邪恶漫画“人鱼公主传”全集连载：第20集', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:12:52', '1');
INSERT INTO `picture` VALUES ('42', 'p201308180142355139.jpg', null, 'http://www.lebazi.com/uploadpic/201308/18/p201308180142355139.jpg', 'http://172.17.111.191:8080/images/p201308180142355139.jpg', '邪恶漫画色系图片：夫妇的愿望_初音未来h邪恶漫画', null, 'http://www.lebazi.com/n/20130815/5638.html', null, null, null, '邪恶漫画色系图片：夫妇的愿望_初音未来h邪恶漫画', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:12:52', '1');
INSERT INTO `picture` VALUES ('43', 'p201408122218096338.jpg', null, 'http://www.lebazi.com/uploadpic/201408/12/p201408122218096338.jpg', 'http://172.17.111.191:8080/images/p201408122218096338.jpg', '梦龙y传系列_梦龙y传漫画全集第7话：没有钱', null, 'http://www.lebazi.com/n/20130815/5638.html', null, null, null, '梦龙y传系列_梦龙y传漫画全集第7话：没有钱', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:12:53', '1');
INSERT INTO `picture` VALUES ('44', 'p201311152150256840.jpg', null, 'http://www.lebazi.com/uploadpic/201311/15/p201311152150256840.jpg', 'http://172.17.111.191:8080/images/p201311152150256840.jpg', '不知火舞邪恶内涵漫画集：次品_错有错着啊，长得猥琐的肉棒很有市场的', null, 'http://www.lebazi.com/n/20130815/5638.html', null, null, null, '不知火舞邪恶内涵漫画集：次品_错有错着啊，长得猥琐的肉棒很有市场的', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:12:53', '1');
INSERT INTO `picture` VALUES ('45', 'p201402080231219692.jpg', null, 'http://www.lebazi.com/uploadpic/201402/08/p201402080231219692.jpg', 'http://172.17.111.191:8080/images/p201402080231219692.jpg', '色系军团邪恶漫画：金字塔不要低头', null, 'http://www.lebazi.com/n/20130815/5638.html', null, null, null, '色系军团邪恶漫画：金字塔不要低头', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:12:53', '1');
INSERT INTO `picture` VALUES ('46', '2013052621475072581369576070.gif', null, 'http://www.lebazi.com/uploadpic/201305/26/2013052621475072581369576070.gif', 'http://172.17.111.191:8080/images/2013052621475072581369576070.gif', '这下给杯具了！', null, 'http://www.lebazi.com/n/20130526/485.html', null, null, null, '这下给杯具了！', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:13:02', '1');
INSERT INTO `picture` VALUES ('47', 'p201306152221208741.gif', null, 'http://www.lebazi.com/uploadpic/201306/15/p201306152221208741.gif', 'http://172.17.111.191:8080/images/p201306152221208741.gif', '这一定是个女的，下手也太狠了~', null, 'http://www.lebazi.com/n/20130526/485.html', null, null, null, '这一定是个女的，下手也太狠了~', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:13:05', '1');
INSERT INTO `picture` VALUES ('48', 'p201306101747597314.gif', null, 'http://www.lebazi.com/uploadpic/201306/10/p201306101747597314.gif', 'http://172.17.111.191:8080/images/p201306101747597314.gif', '男人瞬间变女人，如果不看头的话', null, 'http://www.lebazi.com/n/20130526/485.html', null, null, null, '男人瞬间变女人，如果不看头的话', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:13:16', '1');
INSERT INTO `picture` VALUES ('49', 'p201407302336547250.jpg', null, 'http://www.lebazi.com/uploadpic/201407/30/p201407302336547250.jpg', 'http://172.17.111.191:8080/images/p201407302336547250.jpg', '少女漫画h邪恶篇_色小组二次元h邪恶漫画：双飞混浴', null, 'http://www.lebazi.com/n/20130526/485.html', null, null, null, '少女漫画h邪恶篇_色小组二次元h邪恶漫画：双飞混浴', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:13:16', '1');
INSERT INTO `picture` VALUES ('50', 'p201305281448549912.jpg', null, 'http://www.lebazi.com/uploadpic/201305/28/p201305281448549912.jpg', 'http://172.17.111.191:8080/images/p201305281448549912.jpg', '搞笑视频：各国人看“两女一杯，两女一指”大全！', null, 'http://www.lebazi.com/n/20130526/485.html', null, null, null, '搞笑视频：各国人看“两女一杯，两女一指”大全！', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:13:17', '1');
INSERT INTO `picture` VALUES ('51', 'p201409090000047152.jpg', null, 'http://www.lebazi.com/uploadpic/201409/09/p201409090000047152.jpg', 'http://172.17.111.191:8080/images/p201409090000047152.jpg', '大吴哥邪恶少女漫画_少女h漫画邪恶篇：囚禁系列', null, 'http://www.lebazi.com/n/20130526/485.html', null, null, null, '大吴哥邪恶少女漫画_少女h漫画邪恶篇：囚禁系列', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:13:17', '1');
INSERT INTO `picture` VALUES ('52', 'p201308022238079148.gif', null, 'http://www.lebazi.com/uploadpic/201308/02/p201308022238079148.gif', 'http://172.17.111.191:8080/images/p201308022238079148.gif', '喵星人调戏小白兔gif动图：小白兔好萌啊', null, 'http://www.lebazi.com/n/20130526/485.html', null, null, null, '喵星人调戏小白兔gif动图：小白兔好萌啊', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:13:29', '1');
INSERT INTO `picture` VALUES ('53', 'p201407060928066282.jpg', null, 'http://www.lebazi.com/uploadpic/201407/06/p201407060928066282.jpg', 'http://172.17.111.191:8080/images/p201407060928066282.jpg', '二次元邪恶漫画_日本美女邪恶漫画：特卖品', null, 'http://www.lebazi.com/n/20130526/485.html', null, null, null, '二次元邪恶漫画_日本美女邪恶漫画：特卖品', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:13:30', '1');
INSERT INTO `picture` VALUES ('54', 'p201407152329079725.jpg', null, 'http://www.lebazi.com/uploadpic/201407/15/p201407152329079725.jpg', 'http://172.17.111.191:8080/images/p201407152329079725.jpg', '暴走漫画全集_暴走漫画之糗事动漫：少年不知精珍贵，老来望X空流泪', null, 'http://www.lebazi.com/n/20130526/485.html', null, null, null, '暴走漫画全集_暴走漫画之糗事动漫：少年不知精珍贵，老来望X空流泪', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:13:31', '1');
INSERT INTO `picture` VALUES ('55', 'p201307262153588952.gif', null, 'http://www.lebazi.com/uploadpic/201307/26/p201307262153588952.gif', 'http://172.17.111.191:8080/images/p201307262153588952.gif', '美女搞笑翻筋斗gif动图', null, 'http://www.lebazi.com/n/20130526/485.html', null, null, null, '美女搞笑翻筋斗gif动图', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:13:38', '1');
INSERT INTO `picture` VALUES ('56', 'p201412262340077573.jpg', null, 'http://www.lebazi.com/uploadpic/201412/26/p201412262340077573.jpg', 'http://172.17.111.191:8080/images/p201412262340077573.jpg', '爱与欲望之学园邪恶h漫画：温泉池无套直入', null, 'http://www.lebazi.com/n/20130526/485.html', null, null, null, '爱与欲望之学园邪恶h漫画：温泉池无套直入', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:13:38', '1');
INSERT INTO `picture` VALUES ('57', 'p201410170022083870.jpg', null, 'http://www.lebazi.com/uploadpic/201410/17/p201410170022083870.jpg', 'http://172.17.111.191:8080/images/p201410170022083870.jpg', '色小组二次元h邪恶漫画_大吴哥邪恶少女h漫画：最后之手', null, 'http://www.lebazi.com/n/20130526/485.html', null, null, null, '色小组二次元h邪恶漫画_大吴哥邪恶少女h漫画：最后之手', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:13:39', '1');
INSERT INTO `picture` VALUES ('58', 'p201307182311362683.jpg', null, 'http://www.lebazi.com/uploadpic/201307/18/p201307182311362683.jpg', 'http://172.17.111.191:8080/images/p201307182311362683.jpg', '色系军团漫画：会说话的小熊的终极用途', null, 'http://www.lebazi.com/n/20130526/485.html', null, null, null, '色系军团漫画：会说话的小熊的终极用途', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:13:39', '1');
INSERT INTO `picture` VALUES ('59', 'p201501060242215029.jpg', null, 'http://www.lebazi.com/uploadpic/201501/06/p201501060242215029.jpg', 'http://172.17.111.191:8080/images/p201501060242215029.jpg', '色小组二次元h邪恶漫画：新婚之痛！', null, 'http://www.lebazi.com/n/20130526/485.html', null, null, null, '色小组二次元h邪恶漫画：新婚之痛！', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:13:40', '1');
INSERT INTO `picture` VALUES ('60', 'p201409061045024240.jpg', null, 'http://www.lebazi.com/uploadpic/201409/06/p201409061045024240.jpg', 'http://172.17.111.191:8080/images/p201409061045024240.jpg', '披萨恋恋曲少女漫画邪恶篇153-160章节：马上受死吧！', null, 'http://www.lebazi.com/n/20130526/485.html', null, null, null, '披萨恋恋曲少女漫画邪恶篇153-160章节：马上受死吧！', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:13:40', '1');
INSERT INTO `picture` VALUES ('61', 'p201406260140264945.jpg', null, 'http://www.lebazi.com/uploadpic/201406/26/p201406260140264945.jpg', 'http://172.17.111.191:8080/images/p201406260140264945.jpg', '色小组二次元h邪恶漫画_日本少女h邪恶漫画：性感的特洛伊木马', null, 'http://www.lebazi.com/n/20130526/485.html', null, null, null, '色小组二次元h邪恶漫画_日本少女h邪恶漫画：性感的特洛伊木马', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:13:41', '1');
INSERT INTO `picture` VALUES ('62', '2013052410163734601369361797.gif', null, 'http://www.lebazi.com/uploadpic/201305/24/2013052410163734601369361797.gif', 'http://172.17.111.191:8080/images/2013052410163734601369361797.gif', '美女的脚上功夫真棒啊！', null, 'http://www.lebazi.com/n/20130524/301.html', null, null, null, '美女的脚上功夫真棒啊！', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:13:48', '1');
INSERT INTO `picture` VALUES ('63', 'p201305281039371938.gif', null, 'http://www.lebazi.com/uploadpic/201305/28/p201305281039371938.gif', 'http://172.17.111.191:8080/images/p201305281039371938.gif', '小女生真可爱啊，不过是不是做那个什么。。的。', null, 'http://www.lebazi.com/n/20130524/301.html', null, null, null, '小女生真可爱啊，不过是不是做那个什么。。的。', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:13:52', '1');
INSERT INTO `picture` VALUES ('64', 'p201305252300362162.gif', null, 'http://www.lebazi.com/uploadpic/201305/25/p201305252300362162.gif', 'http://172.17.111.191:8080/images/p201305252300362162.gif', '奶奶，你是肿么了?', null, 'http://www.lebazi.com/n/20130524/301.html', null, null, null, '奶奶，你是肿么了?', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:13:54', '1');
INSERT INTO `picture` VALUES ('65', 'p201402080234289650.jpg', null, 'http://www.lebazi.com/uploadpic/201402/08/p201402080234289650.jpg', 'http://172.17.111.191:8080/images/p201402080234289650.jpg', '色系军团邪恶漫画：品尝师', null, 'http://www.lebazi.com/n/20130524/301.html', null, null, null, '色系军团邪恶漫画：品尝师', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:13:54', '1');
INSERT INTO `picture` VALUES ('66', 'p201408170002287015.jpg', null, 'http://www.lebazi.com/uploadpic/201408/17/p201408170002287015.jpg', 'http://172.17.111.191:8080/images/p201408170002287015.jpg', '邪恶漫画色系军团寡妇三代漫画第12集：获救？', null, 'http://www.lebazi.com/n/20130524/301.html', null, null, null, '邪恶漫画色系军团寡妇三代漫画第12集：获救？', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:13:54', '1');
INSERT INTO `picture` VALUES ('67', 'p201305281530367107.jpg', null, 'http://www.lebazi.com/uploadpic/201305/28/p201305281530367107.jpg', 'http://172.17.111.191:8080/images/p201305281530367107.jpg', '史上最没节操的农药广告！导演，您真的确定这单单只是农药广告？', null, 'http://www.lebazi.com/n/20130524/301.html', null, null, null, '史上最没节操的农药广告！导演，您真的确定这单单只是农药广告？', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:13:54', '1');
INSERT INTO `picture` VALUES ('68', 'p201305251134296489.gif', null, 'http://www.lebazi.com/uploadpic/201305/25/p201305251134296489.gif', 'http://172.17.111.191:8080/images/p201305251134296489.gif', '哈哈...看到这样的女的要小心', null, 'http://www.lebazi.com/n/20130524/301.html', null, null, null, '哈哈...看到这样的女的要小心', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:13:59', '1');
INSERT INTO `picture` VALUES ('69', 'p201312120024278967.gif', null, 'http://www.lebazi.com/uploadpic/201312/12/p201312120024278967.gif', 'http://172.17.111.191:8080/images/p201312120024278967.gif', '男人搞基当众亲吻gif动态图', null, 'http://www.lebazi.com/n/20130524/301.html', null, null, null, '男人搞基当众亲吻gif动态图', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:14:11', '1');
INSERT INTO `picture` VALUES ('70', 'p201311292317522065.gif', null, 'http://www.lebazi.com/uploadpic/201311/29/p201311292317522065.gif', 'http://172.17.111.191:8080/images/p201311292317522065.gif', 'QQ表情:调皮的胎儿', null, 'http://www.lebazi.com/n/20130524/301.html', null, null, null, 'QQ表情:调皮的胎儿', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:14:12', '1');
INSERT INTO `picture` VALUES ('71', 'p201407150144327941.jpg', null, 'http://www.lebazi.com/uploadpic/201407/15/p201407150144327941.jpg', 'http://172.17.111.191:8080/images/p201407150144327941.jpg', '无翼鸟一库邪恶漫画_日本邪恶h漫画：如同习惯', null, 'http://www.lebazi.com/n/20130524/301.html', null, null, null, '无翼鸟一库邪恶漫画_日本邪恶h漫画：如同习惯', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:14:12', '1');
INSERT INTO `picture` VALUES ('72', 'p201407260050163930.jpg', null, 'http://www.lebazi.com/uploadpic/201407/26/p201407260050163930.jpg', 'http://172.17.111.191:8080/images/p201407260050163930.jpg', '色小组二次元h邪恶漫画_韩国邪恶h漫画：丰满的臀部', null, 'http://www.lebazi.com/n/20130524/301.html', null, null, null, '色小组二次元h邪恶漫画_韩国邪恶h漫画：丰满的臀部', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:14:13', '1');
INSERT INTO `picture` VALUES ('73', 'p201407150029308623.jpg', null, 'http://www.lebazi.com/uploadpic/201407/15/p201407150029308623.jpg', 'http://172.17.111.191:8080/images/p201407150029308623.jpg', '日本少女h邪恶漫画_无翼鸟一库邪恶漫画：用途', null, 'http://www.lebazi.com/n/20130524/301.html', null, null, null, '日本少女h邪恶漫画_无翼鸟一库邪恶漫画：用途', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:14:13', '1');
INSERT INTO `picture` VALUES ('74', 'p201308152301316195.jpg', null, 'http://www.lebazi.com/uploadpic/201308/15/p201308152301316195.jpg', 'http://172.17.111.191:8080/images/p201308152301316195.jpg', '色小组漫画全集_大吴哥娱乐邪恶漫画之办法', null, 'http://www.lebazi.com/n/20130524/301.html', null, null, null, '色小组漫画全集_大吴哥娱乐邪恶漫画之办法', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:14:13', '1');
INSERT INTO `picture` VALUES ('75', 'p201311192322393737.jpg', null, 'http://www.lebazi.com/uploadpic/201311/19/p201311192322393737.jpg', 'http://172.17.111.191:8080/images/p201311192322393737.jpg', '色小组邪恶漫画全集：大鼻孔你要干什么，快把裤子穿上_战术', null, 'http://www.lebazi.com/n/20130524/301.html', null, null, null, '色小组邪恶漫画全集：大鼻孔你要干什么，快把裤子穿上_战术', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:14:14', '1');
INSERT INTO `picture` VALUES ('76', 'p201307091956483226.jpg', null, 'http://www.lebazi.com/uploadpic/201307/09/p201307091956483226.jpg', 'http://172.17.111.191:8080/images/p201307091956483226.jpg', '邪恶漫画：“应急患者”之女友有吃手指的习惯', null, 'http://www.lebazi.com/n/20130524/301.html', null, null, null, '邪恶漫画：“应急患者”之女友有吃手指的习惯', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:14:14', '1');
INSERT INTO `picture` VALUES ('77', '2013070623125770851373123577.jpg', null, 'http://www.lebazi.com/uploadpic/201307/06/2013070623125770851373123577.jpg', 'http://172.17.111.191:8080/images/2013070623125770851373123577.jpg', '邪恶漫画：好悲剧的小章鱼，其实这女的是熟客了~', null, 'http://www.lebazi.com/n/20130706/4097.html', null, null, null, '邪恶漫画：好悲剧的小章鱼，其实这女的是熟客了~', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:14:22', '1');
INSERT INTO `picture` VALUES ('78', 'p201408070037418342.jpg', null, 'http://www.lebazi.com/uploadpic/201408/07/p201408070037418342.jpg', 'http://172.17.111.191:8080/images/p201408070037418342.jpg', '日本少女h邪恶漫画：二次元动漫美女与男友激情拥吻翘臀图', null, 'http://www.lebazi.com/n/20130706/4097.html', null, null, null, '日本少女h邪恶漫画：二次元动漫美女与男友激情拥吻翘臀图', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:14:23', '1');
INSERT INTO `picture` VALUES ('79', 'p201305240958437280.gif', null, 'http://www.lebazi.com/uploadpic/201305/24/p201305240958437280.gif', 'http://172.17.111.191:8080/images/p201305240958437280.gif', '老板,来3个B孕套...老板都吓懵了！', null, 'http://www.lebazi.com/n/20130706/4097.html', null, null, null, '老板,来3个B孕套...老板都吓懵了！', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:14:32', '1');
INSERT INTO `picture` VALUES ('80', 'p201308222325524571.jpg', null, 'http://www.lebazi.com/uploadpic/201308/22/p201308222325524571.jpg', 'http://172.17.111.191:8080/images/p201308222325524571.jpg', '搞笑gif：Scream & Shout混音版美女GIF动图大全', null, 'http://www.lebazi.com/n/20130706/4097.html', null, null, null, '搞笑gif：Scream & Shout混音版美女GIF动图大全', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:14:33', '1');
INSERT INTO `picture` VALUES ('81', 'p201308152304375443.jpg', null, 'http://www.lebazi.com/uploadpic/201308/15/p201308152304375443.jpg', 'http://172.17.111.191:8080/images/p201308152304375443.jpg', '邪恶漫画色系图片_色小组漫画全集之画像', null, 'http://www.lebazi.com/n/20130706/4097.html', null, null, null, '邪恶漫画色系图片_色小组漫画全集之画像', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:14:33', '1');
INSERT INTO `picture` VALUES ('82', 'p201408260010509517.jpg', null, 'http://www.lebazi.com/uploadpic/201408/26/p201408260010509517.jpg', 'http://172.17.111.191:8080/images/p201408260010509517.jpg', '万万没想到优酷搞笑视频第10集：最强选秀王', null, 'http://www.lebazi.com/n/20130706/4097.html', null, null, null, '万万没想到优酷搞笑视频第10集：最强选秀王', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:14:34', '1');
INSERT INTO `picture` VALUES ('83', 'p201305251522163207.gif', null, 'http://www.lebazi.com/uploadpic/201305/25/p201305251522163207.gif', 'http://172.17.111.191:8080/images/p201305251522163207.gif', '我打，我打，我打打打', null, 'http://www.lebazi.com/n/20130706/4097.html', null, null, null, '我打，我打，我打打打', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:14:38', '1');
INSERT INTO `picture` VALUES ('84', 'p201307151948014731.gif', null, 'http://www.lebazi.com/uploadpic/201307/15/p201307151948014731.gif', 'http://172.17.111.191:8080/images/p201307151948014731.gif', '美女脱裤子诱惑gif动图：美女真是好身材', null, 'http://www.lebazi.com/n/20130706/4097.html', null, null, null, '美女脱裤子诱惑gif动图：美女真是好身材', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:15:11', '1');
INSERT INTO `picture` VALUES ('85', 'p201308132328531441.gif', null, 'http://www.lebazi.com/uploadpic/201308/13/p201308132328531441.gif', 'http://172.17.111.191:8080/images/p201308132328531441.gif', '熊猫gif动图：粑粑麻麻你们在干嘛，我晕', null, 'http://www.lebazi.com/n/20130706/4097.html', null, null, null, '熊猫gif动图：粑粑麻麻你们在干嘛，我晕', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:15:19', '1');
INSERT INTO `picture` VALUES ('86', 'p201305311159011159.gif', null, 'http://www.lebazi.com/uploadpic/201305/31/p201305311159011159.gif', 'http://172.17.111.191:8080/images/p201305311159011159.gif', '小盆友洗澡好happy！', null, 'http://www.lebazi.com/n/20130706/4097.html', null, null, null, '小盆友洗澡好happy！', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:15:25', '1');
INSERT INTO `picture` VALUES ('87', 'p201408180004136199.jpg', null, 'http://www.lebazi.com/uploadpic/201408/18/p201408180004136199.jpg', 'http://172.17.111.191:8080/images/p201408180004136199.jpg', '土豆《神街访》街头采访爆笑视频：你介意男友第一次不是给你吗？', null, 'http://www.lebazi.com/n/20130706/4097.html', null, null, null, '土豆《神街访》街头采访爆笑视频：你介意男友第一次不是给你吗？', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:15:25', '1');
INSERT INTO `picture` VALUES ('88', 'p201409130026122003.jpg', null, 'http://www.lebazi.com/uploadpic/201409/13/p201409130026122003.jpg', 'http://172.17.111.191:8080/images/p201409130026122003.jpg', '吃果果大作战动漫邪恶少女漫画第9章：降妖', null, 'http://www.lebazi.com/n/20130706/4097.html', null, null, null, '吃果果大作战动漫邪恶少女漫画第9章：降妖', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:15:25', '1');
INSERT INTO `picture` VALUES ('89', 'p201308042246556307.jpg', null, 'http://www.lebazi.com/uploadpic/201308/04/p201308042246556307.jpg', 'http://172.17.111.191:8080/images/p201308042246556307.jpg', '18禁漫画之关键时刻：天使你的节操哪儿去了', null, 'http://www.lebazi.com/n/20130706/4097.html', null, null, null, '18禁漫画之关键时刻：天使你的节操哪儿去了', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:15:26', '1');
INSERT INTO `picture` VALUES ('90', 'p201408122352574476.jpg', null, 'http://www.lebazi.com/uploadpic/201408/12/p201408122352574476.jpg', 'http://172.17.111.191:8080/images/p201408122352574476.jpg', '梦龙y传系列_梦龙y传漫画全集第25话：危机中的九尾狐', null, 'http://www.lebazi.com/n/20130706/4097.html', null, null, null, '梦龙y传系列_梦龙y传漫画全集第25话：危机中的九尾狐', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:15:26', '1');
INSERT INTO `picture` VALUES ('91', 'p201411250059058111.jpg', null, 'http://www.lebazi.com/uploadpic/201411/25/p201411250059058111.jpg', 'http://172.17.111.191:8080/images/p201411250059058111.jpg', '小黄哥爱看少女漫画：会长是女仆邪恶篇', null, 'http://www.lebazi.com/n/20130706/4097.html', null, null, null, '小黄哥爱看少女漫画：会长是女仆邪恶篇', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:15:26', '1');
INSERT INTO `picture` VALUES ('92', 'p201305301141559425.jpg', null, 'http://www.lebazi.com/uploadpic/201305/30/p201305301141559425.jpg', 'http://172.17.111.191:8080/images/p201305301141559425.jpg', '邪恶漫画：之“连续发射”', null, 'http://www.lebazi.com/n/20130706/4097.html', null, null, null, '邪恶漫画：之“连续发射”', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:15:27', '1');
INSERT INTO `picture` VALUES ('93', '2013080422114167181375625501.gif', null, 'http://www.lebazi.com/uploadpic/201308/04/2013080422114167181375625501.gif', 'http://172.17.111.191:8080/images/2013080422114167181375625501.gif', '美女翻转gif动图：动作一气呵成，妹子好功夫', null, 'http://www.lebazi.com/n/20130804/5326.html', null, null, null, '美女翻转gif动图：动作一气呵成，妹子好功夫', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:15:37', '1');
INSERT INTO `picture` VALUES ('94', 'p201407160103394449.jpg', null, 'http://www.lebazi.com/uploadpic/201407/16/p201407160103394449.jpg', 'http://172.17.111.191:8080/images/p201407160103394449.jpg', '微播江湖_配音搞笑视频：耍宝机器人 麻麻我根本停不下来', null, 'http://www.lebazi.com/n/20130804/5326.html', null, null, null, '微播江湖_配音搞笑视频：耍宝机器人 麻麻我根本停不下来', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:15:37', '1');
INSERT INTO `picture` VALUES ('95', 'p201311292318039913.gif', null, 'http://www.lebazi.com/uploadpic/201311/29/p201311292318039913.gif', 'http://172.17.111.191:8080/images/p201311292318039913.gif', 'QQ表情: 今晚找小姐去', null, 'http://www.lebazi.com/n/20130804/5326.html', null, null, null, 'QQ表情: 今晚找小姐去', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:15:37', '1');
INSERT INTO `picture` VALUES ('96', 'p201412010155592577.jpg', null, 'http://www.lebazi.com/uploadpic/201412/01/p201412010155592577.jpg', 'http://172.17.111.191:8080/images/p201412010155592577.jpg', '动漫美女黄漫图片：制服可人姐姐', null, 'http://www.lebazi.com/n/20130804/5326.html', null, null, null, '动漫美女黄漫图片：制服可人姐姐', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:15:37', '1');
INSERT INTO `picture` VALUES ('97', 'p201412072304075338.jpg', null, 'http://www.lebazi.com/uploadpic/201412/07/p201412072304075338.jpg', 'http://172.17.111.191:8080/images/p201412072304075338.jpg', '色系动漫超级美少女黄漫图片邪恶篇', null, 'http://www.lebazi.com/n/20130804/5326.html', null, null, null, '色系动漫超级美少女黄漫图片邪恶篇', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:15:38', '1');
INSERT INTO `picture` VALUES ('98', 'p201311030223086898.gif', null, 'http://www.lebazi.com/uploadpic/201311/03/p201311030223086898.gif', 'http://172.17.111.191:8080/images/p201311030223086898.gif', '成人gif内涵图片：人类牙疼的真相', null, 'http://www.lebazi.com/n/20130804/5326.html', null, null, null, '成人gif内涵图片：人类牙疼的真相', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:15:38', '1');
INSERT INTO `picture` VALUES ('99', 'p201406160223198662.jpg', null, 'http://www.lebazi.com/uploadpic/201406/16/p201406160223198662.jpg', 'http://172.17.111.191:8080/images/p201406160223198662.jpg', '思春期少女漫画_狂野少女漫画：少女好困扰系列', null, 'http://www.lebazi.com/n/20130804/5326.html', null, null, null, '思春期少女漫画_狂野少女漫画：少女好困扰系列', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:15:39', '1');
INSERT INTO `picture` VALUES ('100', 'p201306262210045423.jpg', null, 'http://www.lebazi.com/uploadpic/201306/26/p201306262210045423.jpg', 'http://172.17.111.191:8080/images/p201306262210045423.jpg', '内涵图：冠希哥找女友的标准~~', null, 'http://www.lebazi.com/n/20130804/5326.html', null, null, null, '内涵图：冠希哥找女友的标准~~', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:15:41', '1');
INSERT INTO `picture` VALUES ('101', 'p201308180146087704.jpg', null, 'http://www.lebazi.com/uploadpic/201308/18/p201308180146087704.jpg', 'http://172.17.111.191:8080/images/p201308180146087704.jpg', '邪恶漫画色系图片：特别的神灯_无翼鸟邪恶漫画全集', null, 'http://www.lebazi.com/n/20130804/5326.html', null, null, null, '邪恶漫画色系图片：特别的神灯_无翼鸟邪恶漫画全集', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:15:41', '1');
INSERT INTO `picture` VALUES ('102', 'p201406200118301706.jpg', null, 'http://www.lebazi.com/uploadpic/201406/20/p201406200118301706.jpg', 'http://172.17.111.191:8080/images/p201406200118301706.jpg', '脑残对话：我去炸了学校，Ma了个巴子！', null, 'http://www.lebazi.com/n/20130804/5326.html', null, null, null, '脑残对话：我去炸了学校，Ma了个巴子！', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:15:41', '1');
INSERT INTO `picture` VALUES ('103', 'p201403050303081623.jpg', null, 'http://www.lebazi.com/uploadpic/201403/05/p201403050303081623.jpg', 'http://172.17.111.191:8080/images/p201403050303081623.jpg', '18禁不知火舞邪恶漫画：湿姐的诱惑', null, 'http://www.lebazi.com/n/20130804/5326.html', null, null, null, '18禁不知火舞邪恶漫画：湿姐的诱惑', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:15:42', '1');
INSERT INTO `picture` VALUES ('104', 'p201311262240092703.jpg', null, 'http://www.lebazi.com/uploadpic/201311/26/p201311262240092703.jpg', 'http://172.17.111.191:8080/images/p201311262240092703.jpg', '色系军团不知火舞h吧福利：屌丝们别傻了，你们的女神都让导演用过了_发布会', null, 'http://www.lebazi.com/n/20130804/5326.html', null, null, null, '色系军团不知火舞h吧福利：屌丝们别傻了，你们的女神都让导演用过了_发布会', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:15:43', '1');
INSERT INTO `picture` VALUES ('105', 'p201307282048538871.jpg', null, 'http://www.lebazi.com/uploadpic/201307/28/p201307282048538871.jpg', 'http://172.17.111.191:8080/images/p201307282048538871.jpg', '色系军团漫画之怪叔叔你真是有远见呀', null, 'http://www.lebazi.com/n/20130804/5326.html', null, null, null, '色系军团漫画之怪叔叔你真是有远见呀', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:15:43', '1');
INSERT INTO `picture` VALUES ('106', 'p201408080438439701.jpg', null, 'http://www.lebazi.com/uploadpic/201408/08/p201408080438439701.jpg', 'http://172.17.111.191:8080/images/p201408080438439701.jpg', '恋姐倾心少女h漫画之双手捂胸挡不住诱惑：日本动漫h美少女秀情感身材', null, 'http://www.lebazi.com/n/20130804/5326.html', null, null, null, '恋姐倾心少女h漫画之双手捂胸挡不住诱惑：日本动漫h美少女秀情感身材', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:15:43', '1');
INSERT INTO `picture` VALUES ('107', 'p201406260143598840.jpg', null, 'http://www.lebazi.com/uploadpic/201406/26/p201406260143598840.jpg', 'http://172.17.111.191:8080/images/p201406260143598840.jpg', '色小组思春期少女漫画_大吴哥邪恶少女h漫画：移动的点', null, 'http://www.lebazi.com/n/20130804/5326.html', null, null, null, '色小组思春期少女漫画_大吴哥邪恶少女h漫画：移动的点', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:15:44', '1');
INSERT INTO `picture` VALUES ('108', 'p201308112330198275.jpg', null, 'http://www.lebazi.com/uploadpic/201308/11/p201308112330198275.jpg', 'http://172.17.111.191:8080/images/p201308112330198275.jpg', '邪恶漫画之纸的战争', null, 'http://www.lebazi.com/n/20131112/6495.html', null, null, null, '邪恶漫画之纸的战争', null, '2', '1', '0', '0', '搞笑视频', '2015-01-28 10:15:45', '1');
INSERT INTO `picture` VALUES ('109', 'p201307070010594282.gif', null, 'http://www.lebazi.com/uploadpic/201307/07/p201307070010594282.gif', 'http://172.17.111.191:8080/images/p201307070010594282.gif', '下手也太重了，估计这下那人得脑残了', null, 'http://www.lebazi.com/n/20131112/6495.html', null, null, null, '下手也太重了，估计这下那人得脑残了', null, '2', '1', '0', '0', '搞笑视频', '2015-01-28 10:16:03', '1');
INSERT INTO `picture` VALUES ('110', 'p201306231436323316.gif', null, 'http://www.lebazi.com/uploadpic/201306/23/p201306231436323316.gif', 'http://172.17.111.191:8080/images/p201306231436323316.gif', '我咋感觉这女的有点想王心凌呢？', null, 'http://www.lebazi.com/n/20131112/6495.html', null, null, null, '我咋感觉这女的有点想王心凌呢？', null, '2', '1', '0', '0', '搞笑视频', '2015-01-28 10:16:06', '1');
INSERT INTO `picture` VALUES ('111', 'p201305251503277959.gif', null, 'http://www.lebazi.com/uploadpic/201305/25/p201305251503277959.gif', 'http://172.17.111.191:8080/images/p201305251503277959.gif', '哇，是谁的，好香呀！', null, 'http://www.lebazi.com/n/20131112/6495.html', null, null, null, '哇，是谁的，好香呀！', null, '2', '1', '0', '0', '搞笑视频', '2015-01-28 10:16:12', '1');
INSERT INTO `picture` VALUES ('112', 'p201412260002036167.jpg', null, 'http://www.lebazi.com/uploadpic/201412/26/p201412260002036167.jpg', 'http://172.17.111.191:8080/images/p201412260002036167.jpg', '圣诞节美女滑雪福利图：漂亮就是这么任性，有资本啊！', null, 'http://www.lebazi.com/n/20131112/6495.html', null, null, null, '圣诞节美女滑雪福利图：漂亮就是这么任性，有资本啊！', null, '2', '1', '0', '0', '搞笑视频', '2015-01-28 10:16:13', '1');
INSERT INTO `picture` VALUES ('113', 'p201307132328217573.gif', null, 'http://www.lebazi.com/uploadpic/201307/13/p201307132328217573.gif', 'http://172.17.111.191:8080/images/p201307132328217573.gif', '好基友gif：好复杂好混乱的关系啊', null, 'http://www.lebazi.com/n/20131112/6495.html', null, null, null, '好基友gif：好复杂好混乱的关系啊', null, '2', '1', '0', '0', '搞笑视频', '2015-01-28 10:16:20', '1');
INSERT INTO `picture` VALUES ('114', 'p201307152254283054.jpg', null, 'http://www.lebazi.com/uploadpic/201307/15/p201307152254283054.jpg', 'http://172.17.111.191:8080/images/p201307152254283054.jpg', '色系军团漫画：那个纹身的家伙是你的前男友是不是？', null, 'http://www.lebazi.com/n/20131112/6495.html', null, null, null, '色系军团漫画：那个纹身的家伙是你的前男友是不是？', null, '2', '1', '0', '0', '搞笑视频', '2015-01-28 10:16:20', '1');
INSERT INTO `picture` VALUES ('115', 'p201308180030541555.gif', null, 'http://www.lebazi.com/uploadpic/201308/18/p201308180030541555.gif', 'http://172.17.111.191:8080/images/p201308180030541555.gif', '搞笑gif动态图片：原来神兽草泥马也怕猪_gif快手', null, 'http://www.lebazi.com/n/20131112/6495.html', null, null, null, '搞笑gif动态图片：原来神兽草泥马也怕猪_gif快手', null, '2', '1', '0', '0', '搞笑视频', '2015-01-28 10:16:31', '1');
INSERT INTO `picture` VALUES ('116', 'p201402080234574768.jpg', null, 'http://www.lebazi.com/uploadpic/201402/08/p201402080234574768.jpg', 'http://172.17.111.191:8080/images/p201402080234574768.jpg', '色系军团邪恶漫画：破了个洞', null, 'http://www.lebazi.com/n/20131112/6495.html', null, null, null, '色系军团邪恶漫画：破了个洞', null, '2', '1', '0', '0', '搞笑视频', '2015-01-28 10:16:32', '1');
INSERT INTO `picture` VALUES ('117', 'p201306012029524206.jpg', null, 'http://www.lebazi.com/uploadpic/201306/01/p201306012029524206.jpg', 'http://172.17.111.191:8080/images/p201306012029524206.jpg', '邪恶漫画：可怜的屌丝，我是来帮助你的天使！', null, 'http://www.lebazi.com/n/20131112/6495.html', null, null, null, '邪恶漫画：可怜的屌丝，我是来帮助你的天使！', null, '2', '1', '0', '0', '搞笑视频', '2015-01-28 10:16:32', '1');
INSERT INTO `picture` VALUES ('118', 'p201408122352245953.jpg', null, 'http://www.lebazi.com/uploadpic/201408/12/p201408122352245953.jpg', 'http://172.17.111.191:8080/images/p201408122352245953.jpg', '梦龙y传系列_梦龙y传漫画全集第24话：交接篇', null, 'http://www.lebazi.com/n/20131112/6495.html', null, null, null, '梦龙y传系列_梦龙y传漫画全集第24话：交接篇', null, '2', '1', '0', '0', '搞笑视频', '2015-01-28 10:16:32', '1');
INSERT INTO `picture` VALUES ('119', 'p201403021814376314.jpg', null, 'http://www.lebazi.com/uploadpic/201403/02/p201403021814376314.jpg', 'http://172.17.111.191:8080/images/p201403021814376314.jpg', '全彩h邪恶漫画日本之邪恶漫画睡美人：哥你是我见过最傻逼的王子', null, 'http://www.lebazi.com/n/20131112/6495.html', null, null, null, '全彩h邪恶漫画日本之邪恶漫画睡美人：哥你是我见过最傻逼的王子', null, '2', '1', '0', '0', '搞笑视频', '2015-01-28 10:16:33', '1');
INSERT INTO `picture` VALUES ('120', 'p201406100030419519.jpg', null, 'http://www.lebazi.com/uploadpic/201406/10/p201406100030419519.jpg', 'http://172.17.111.191:8080/images/p201406100030419519.jpg', '少女爱情在线漫画：想要的那味道', null, 'http://www.lebazi.com/n/20131112/6495.html', null, null, null, '少女爱情在线漫画：想要的那味道', null, '2', '1', '0', '0', '搞笑视频', '2015-01-28 10:16:33', '1');
INSERT INTO `picture` VALUES ('121', '7cccd99bgw1egh9flbha9j20go0m8wgk.jpg', null, 'http://ww4.sinaimg.cn/mw690/7cccd99bgw1egh9flbha9j20go0m8wgk.jpg', 'http://172.17.111.191:8080/images/7cccd99bgw1egh9flbha9j20go0m8wgk.jpg', '日本h动漫美女漫画全集：波涛胸涌异常销魂图', null, 'http://www.lebazi.com/n/20140815/8280.html', null, null, null, '日本h动漫美女漫画全集：波涛胸涌异常销魂图', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:16:35', '1');
INSERT INTO `picture` VALUES ('122', 'p201311120132538740.jpg', null, 'http://www.lebazi.com/uploadpic/201311/12/p201311120132538740.jpg', 'http://172.17.111.191:8080/images/p201311120132538740.jpg', '初音未来h邪恶漫画：催眠_变成大蘑菇变成大蘑菇！', null, 'http://www.lebazi.com/n/20140815/8280.html', null, null, null, '初音未来h邪恶漫画：催眠_变成大蘑菇变成大蘑菇！', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:16:35', '1');
INSERT INTO `picture` VALUES ('123', 'p201311212357284156.jpg', null, 'http://www.lebazi.com/uploadpic/201311/21/p201311212357284156.jpg', 'http://172.17.111.191:8080/images/p201311212357284156.jpg', '邪恶漫画色系军团图片：大师兄你今晚又撸管呀？真可怜_合体术', null, 'http://www.lebazi.com/n/20140815/8280.html', null, null, null, '邪恶漫画色系军团图片：大师兄你今晚又撸管呀？真可怜_合体术', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:16:35', '1');
INSERT INTO `picture` VALUES ('124', 'p201307122221267320.gif', null, 'http://www.lebazi.com/uploadpic/201307/12/p201307122221267320.gif', 'http://172.17.111.191:8080/images/p201307122221267320.gif', '美女gif：你丫打我脸啊，竟敢欺负我不敢打女人脸', null, 'http://www.lebazi.com/n/20140815/8280.html', null, null, null, '美女gif：你丫打我脸啊，竟敢欺负我不敢打女人脸', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:16:44', '1');
INSERT INTO `picture` VALUES ('125', 'p201403122312289479.gif', null, 'http://www.lebazi.com/uploadpic/201403/12/p201403122312289479.gif', 'http://172.17.111.191:8080/images/p201403122312289479.gif', '2B青年gif动图：闲着蛋疼没事做，烧JJ玩耍', null, 'http://www.lebazi.com/n/20140815/8280.html', null, null, null, '2B青年gif动图：闲着蛋疼没事做，烧JJ玩耍', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:16:52', '1');
INSERT INTO `picture` VALUES ('126', 'p201306182233451150.gif', null, 'http://www.lebazi.com/uploadpic/201306/18/p201306182233451150.gif', 'http://172.17.111.191:8080/images/p201306182233451150.gif', '尼玛，我就不信我抓不到一条~搞笑gif喵星人', null, 'http://www.lebazi.com/n/20140815/8280.html', null, null, null, '尼玛，我就不信我抓不到一条~搞笑gif喵星人', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:16:56', '1');
INSERT INTO `picture` VALUES ('127', 'p201305240910485227.gif', null, 'http://www.lebazi.com/uploadpic/201305/24/p201305240910485227.gif', 'http://172.17.111.191:8080/images/p201305240910485227.gif', '超级有弹性的胸器', null, 'http://www.lebazi.com/n/20140815/8280.html', null, null, null, '超级有弹性的胸器', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:17:06', '1');
INSERT INTO `picture` VALUES ('128', 'p201408122350531634.jpg', null, 'http://www.lebazi.com/uploadpic/201408/12/p201408122350531634.jpg', 'http://172.17.111.191:8080/images/p201408122350531634.jpg', '梦龙y传系列_梦龙y传漫画全集第22话：胜利', null, 'http://www.lebazi.com/n/20140815/8280.html', null, null, null, '梦龙y传系列_梦龙y传漫画全集第22话：胜利', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:17:06', '1');
INSERT INTO `picture` VALUES ('129', 'p201307262245037792.jpg', null, 'http://www.lebazi.com/uploadpic/201307/26/p201307262245037792.jpg', 'http://172.17.111.191:8080/images/p201307262245037792.jpg', '邪恶漫画之换位击球手：请问晚上是哪边呢？', null, 'http://www.lebazi.com/n/20140815/8280.html', null, null, null, '邪恶漫画之换位击球手：请问晚上是哪边呢？', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:17:06', '1');
INSERT INTO `picture` VALUES ('130', 'p201307132316305794.gif', null, 'http://www.lebazi.com/uploadpic/201307/13/p201307132316305794.gif', 'http://172.17.111.191:8080/images/p201307132316305794.gif', '哈哈，看着可乐坏我的小伙伴们了', null, 'http://www.lebazi.com/n/20140815/8280.html', null, null, null, '哈哈，看着可乐坏我的小伙伴们了', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:17:11', '1');
INSERT INTO `picture` VALUES ('131', 'p201308162346599650.jpg', null, 'http://www.lebazi.com/uploadpic/201308/16/p201308162346599650.jpg', 'http://172.17.111.191:8080/images/p201308162346599650.jpg', '不知火舞邪恶漫画集之喜红_重口h邪恶漫画日本', null, 'http://www.lebazi.com/n/20140815/8280.html', null, null, null, '不知火舞邪恶漫画集之喜红_重口h邪恶漫画日本', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:17:11', '1');
INSERT INTO `picture` VALUES ('132', 'p201408080433225170.jpg', null, 'http://www.lebazi.com/uploadpic/201408/08/p201408080433225170.jpg', 'http://172.17.111.191:8080/images/p201408080433225170.jpg', '色系军团少女邪恶漫画：二次元邪恶动漫h美少女敞胸翘臀图片', null, 'http://www.lebazi.com/n/20140815/8280.html', null, null, null, '色系军团少女邪恶漫画：二次元邪恶动漫h美少女敞胸翘臀图片', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:17:12', '1');
INSERT INTO `picture` VALUES ('133', 'p201307141856018262.jpg', null, 'http://www.lebazi.com/uploadpic/201307/14/p201307141856018262.jpg', 'http://172.17.111.191:8080/images/p201307141856018262.jpg', '邪恶漫画：修炼二指禅的用处', null, 'http://www.lebazi.com/n/20140815/8280.html', null, null, null, '邪恶漫画：修炼二指禅的用处', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:17:12', '1');
INSERT INTO `picture` VALUES ('134', 'p201307022150406498.jpg', null, 'http://www.lebazi.com/uploadpic/201307/02/p201307022150406498.jpg', 'http://172.17.111.191:8080/images/p201307022150406498.jpg', '色系军团之“青春之泉”能让人恢复年轻的活力的泉水~', null, 'http://www.lebazi.com/n/20140815/8280.html', null, null, null, '色系军团之“青春之泉”能让人恢复年轻的活力的泉水~', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:17:13', '1');
INSERT INTO `picture` VALUES ('135', 'p201408122355208677.jpg', null, 'http://www.lebazi.com/uploadpic/201408/12/p201408122355208677.jpg', 'http://172.17.111.191:8080/images/p201408122355208677.jpg', '梦龙y传系列_梦龙y传漫画全集第29话：李梦龙的决心', null, 'http://www.lebazi.com/n/20140815/8280.html', null, null, null, '梦龙y传系列_梦龙y传漫画全集第29话：李梦龙的决心', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:17:13', '1');
INSERT INTO `picture` VALUES ('136', '2013062221591510731371909555.gif', null, 'http://www.lebazi.com/uploadpic/201306/22/2013062221591510731371909555.gif', 'http://172.17.111.191:8080/images/2013062221591510731371909555.gif', '尼玛，警察大哥，你这是什么技能？', null, 'http://www.lebazi.com/n/20130622/3574.html', null, null, null, '尼玛，警察大哥，你这是什么技能？', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:17:43', '1');
INSERT INTO `picture` VALUES ('137', 'p201305251723099132.gif', null, 'http://www.lebazi.com/uploadpic/201305/25/p201305251723099132.gif', 'http://172.17.111.191:8080/images/p201305251723099132.gif', '传说中的“推波助澜”？', null, 'http://www.lebazi.com/n/20130622/3574.html', null, null, null, '传说中的“推波助澜”？', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:17:46', '1');
INSERT INTO `picture` VALUES ('138', 'p201305191751351681.jpg', null, 'http://www.lebazi.com/uploadpic/201305/19/p201305191751351681.jpg', 'http://172.17.111.191:8080/images/p201305191751351681.jpg', '邪恶漫画：鹅姑娘下蛋，大鼻孔来了', null, 'http://www.lebazi.com/n/20130622/3574.html', null, null, null, '邪恶漫画：鹅姑娘下蛋，大鼻孔来了', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:17:46', '1');
INSERT INTO `picture` VALUES ('139', 'p201306302320073845.gif', null, 'http://www.lebazi.com/uploadpic/201306/30/p201306302320073845.gif', 'http://172.17.111.191:8080/images/p201306302320073845.gif', '小孩纸这下估计脑壳上面会长一个大脓包了~', null, 'http://www.lebazi.com/n/20130622/3574.html', null, null, null, '小孩纸这下估计脑壳上面会长一个大脓包了~', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:17:52', '1');
INSERT INTO `picture` VALUES ('140', 'p201406172246576821.jpg', null, 'http://www.lebazi.com/uploadpic/201406/17/p201406172246576821.jpg', 'http://172.17.111.191:8080/images/p201406172246576821.jpg', '邪恶漫画御姐进行时_爱丽丝学院邪恶漫画：二元次方', null, 'http://www.lebazi.com/n/20130622/3574.html', null, null, null, '邪恶漫画御姐进行时_爱丽丝学院邪恶漫画：二元次方', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:17:53', '1');
INSERT INTO `picture` VALUES ('141', '7f232787gw1ejcex4w1k4g208c069qgb.gif', null, 'http://ww4.sinaimg.cn/mw690/7f232787gw1ejcex4w1k4g208c069qgb.gif', 'http://172.17.111.191:8080/images/7f232787gw1ejcex4w1k4g208c069qgb.gif', '搞笑猫咪gif动态图片', null, 'http://www.lebazi.com/n/20130622/3574.html', null, null, null, '搞笑猫咪gif动态图片', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:17:54', '1');
INSERT INTO `picture` VALUES ('142', 'p201411250027336214.jpg', null, 'http://www.lebazi.com/uploadpic/201411/25/p201411250027336214.jpg', 'http://172.17.111.191:8080/images/p201411250027336214.jpg', '恋姐倾心少女漫画邪恶篇：幻想姐姐安慰，自己湿一地', null, 'http://www.lebazi.com/n/20130622/3574.html', null, null, null, '恋姐倾心少女漫画邪恶篇：幻想姐姐安慰，自己湿一地', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:17:56', '1');
INSERT INTO `picture` VALUES ('143', 'p201401030146335776.jpg', null, 'http://www.lebazi.com/uploadpic/201401/03/p201401030146335776.jpg', 'http://172.17.111.191:8080/images/p201401030146335776.jpg', '初音h邪恶漫画日本：哥们这有意思吗_想象力', null, 'http://www.lebazi.com/n/20130622/3574.html', null, null, null, '初音h邪恶漫画日本：哥们这有意思吗_想象力', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:17:56', '1');
INSERT INTO `picture` VALUES ('144', 'p201305251608322167.jpg', null, 'http://www.lebazi.com/uploadpic/201305/25/p201305251608322167.jpg', 'http://172.17.111.191:8080/images/p201305251608322167.jpg', '内涵图:其实当摄影师真的不容易啊!', null, 'http://www.lebazi.com/n/20130622/3574.html', null, null, null, '内涵图:其实当摄影师真的不容易啊!', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:17:56', '1');
INSERT INTO `picture` VALUES ('145', 'p201408180054282290.jpg', null, 'http://www.lebazi.com/uploadpic/201408/18/p201408180054282290.jpg', 'http://172.17.111.191:8080/images/p201408180054282290.jpg', '色系军团蚂蚁与蜂蜜邪恶系列漫画全集：第十集 产生错觉1', null, 'http://www.lebazi.com/n/20130622/3574.html', null, null, null, '色系军团蚂蚁与蜂蜜邪恶系列漫画全集：第十集 产生错觉1', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:17:56', '1');
INSERT INTO `picture` VALUES ('146', 'p201307182218382917.gif', null, 'http://www.lebazi.com/uploadpic/201307/18/p201307182218382917.gif', 'http://172.17.111.191:8080/images/p201307182218382917.gif', '巨乳美女gif动图：嗨~我在这里我来了', null, 'http://www.lebazi.com/n/20130622/3574.html', null, null, null, '巨乳美女gif动图：嗨~我在这里我来了', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:18:06', '1');
INSERT INTO `picture` VALUES ('147', 'p201407260048586983.jpg', null, 'http://www.lebazi.com/uploadpic/201407/26/p201407260048586983.jpg', 'http://172.17.111.191:8080/images/p201407260048586983.jpg', '日本少女h邪恶漫画_2次元h邪恶漫画：高潮拳', null, 'http://www.lebazi.com/n/20130622/3574.html', null, null, null, '日本少女h邪恶漫画_2次元h邪恶漫画：高潮拳', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:18:06', '1');
INSERT INTO `picture` VALUES ('148', 'p201407040138092855.jpg', null, 'http://www.lebazi.com/uploadpic/201407/04/p201407040138092855.jpg', 'http://172.17.111.191:8080/images/p201407040138092855.jpg', '韩国邪恶漫画_少女h邪恶漫画：被放电的妻子', null, 'http://www.lebazi.com/n/20130622/3574.html', null, null, null, '韩国邪恶漫画_少女h邪恶漫画：被放电的妻子', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:18:06', '1');
INSERT INTO `picture` VALUES ('149', 'p201306252233422531.jpg', null, 'http://www.lebazi.com/uploadpic/201306/25/p201306252233422531.jpg', 'http://172.17.111.191:8080/images/p201306252233422531.jpg', '内涵漫画：恋人的变化，1年厌倦期', null, 'http://www.lebazi.com/n/20130622/3574.html', null, null, null, '内涵漫画：恋人的变化，1年厌倦期', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:18:07', '1');
INSERT INTO `picture` VALUES ('150', 'p201309080001226872.jpg', null, 'http://www.lebazi.com/uploadpic/201309/08/p201309080001226872.jpg', 'http://172.17.111.191:8080/images/p201309080001226872.jpg', '色小组漫画全集：粉红色小内裤诱惑_邪恶漫画色系图片', null, 'http://www.lebazi.com/n/20130622/3574.html', null, null, null, '色小组漫画全集：粉红色小内裤诱惑_邪恶漫画色系图片', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:18:07', '1');
INSERT INTO `picture` VALUES ('151', '8ad39996gw1enk4gjxtboj20c80gb0tu.jpg', null, 'http://ww1.sinaimg.cn/bmiddle/8ad39996gw1enk4gjxtboj20c80gb0tu.jpg', 'http://172.17.111.191:8080/images/8ad39996gw1enk4gjxtboj20c80gb0tu.jpg', '唐馨baby福利自拍私房照诱惑写真套图全集', null, 'http://www.lebazi.com/n/20150109/8916.html', null, null, null, '唐馨baby福利自拍私房照诱惑写真套图全集', null, '2', '1', '0', '0', '雷人网事', '2015-01-28 10:18:08', '1');
INSERT INTO `picture` VALUES ('152', 'e2b31e22jw1egir9aeu7tg20bu0677wj.gif', null, 'http://ww2.sinaimg.cn/bmiddle/e2b31e22jw1egir9aeu7tg20bu0677wj.gif', 'http://172.17.111.191:8080/images/e2b31e22jw1egir9aeu7tg20bu0677wj.gif', '各种爆笑内涵gif动态图大全：总有一张让你笑！', null, 'http://www.lebazi.com/n/20150106/8898.html', null, null, null, '各种爆笑内涵gif动态图大全：总有一张让你笑！', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:18:19', '1');
INSERT INTO `picture` VALUES ('153', '6628711bgw1enn8mln6f1g209t05wx6p.gif', null, 'http://ww2.sinaimg.cn/bmiddle/6628711bgw1enn8mln6f1g209t05wx6p.gif', 'http://172.17.111.191:8080/images/6628711bgw1enn8mln6f1g209t05wx6p.gif', '美女装蜡像整人gif动图：美女，你那么调皮家里人造吗？', null, 'http://www.lebazi.com/n/20150106/8897.html', null, null, null, '美女装蜡像整人gif动图：美女，你那么调皮家里人造吗？', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:18:21', '1');
INSERT INTO `picture` VALUES ('154', '2014030916144980881394352889.gif', null, 'http://www.lebazi.com/uploadpic/201403/09/2014030916144980881394352889.gif', 'http://172.17.111.191:8080/images/2014030916144980881394352889.gif', '色你妹成人gif邪恶动态图精选：男人xxoo女人的动态图', null, 'http://www.lebazi.com/n/20140309/7465.html', null, null, null, '色你妹成人gif邪恶动态图精选：男人xxoo女人的动态图', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:18:32', '1');
INSERT INTO `picture` VALUES ('155', 'p201308180146509828.jpg', null, 'http://www.lebazi.com/uploadpic/201308/18/p201308180146509828.jpg', 'http://172.17.111.191:8080/images/p201308180146509828.jpg', '邪恶漫画色系图片：小红帽_邪恶漫画爱丽丝学园', null, 'http://www.lebazi.com/n/20140309/7465.html', null, null, null, '邪恶漫画色系图片：小红帽_邪恶漫画爱丽丝学园', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:18:33', '1');
INSERT INTO `picture` VALUES ('156', 'p201408170015547258.jpg', null, 'http://www.lebazi.com/uploadpic/201408/17/p201408170015547258.jpg', 'http://172.17.111.191:8080/images/p201408170015547258.jpg', '邪恶漫画色系军团寡妇三代漫画第25集：最后的抉择', null, 'http://www.lebazi.com/n/20140309/7465.html', null, null, null, '邪恶漫画色系军团寡妇三代漫画第25集：最后的抉择', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:18:33', '1');
INSERT INTO `picture` VALUES ('157', 'p201306172153032446.gif', null, 'http://www.lebazi.com/uploadpic/201306/17/p201306172153032446.gif', 'http://172.17.111.191:8080/images/p201306172153032446.gif', '美女你快有4个胸器了~胸部gif动态图片', null, 'http://www.lebazi.com/n/20140309/7465.html', null, null, null, '美女你快有4个胸器了~胸部gif动态图片', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:18:42', '1');
INSERT INTO `picture` VALUES ('158', 'p201307242159537740.gif', null, 'http://www.lebazi.com/uploadpic/201307/24/p201307242159537740.gif', 'http://172.17.111.191:8080/images/p201307242159537740.gif', '自从给龟兄装了滑板车，从此就不在慢了', null, 'http://www.lebazi.com/n/20140309/7465.html', null, null, null, '自从给龟兄装了滑板车，从此就不在慢了', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:18:54', '1');
INSERT INTO `picture` VALUES ('159', 'p201308052241334100.gif', null, 'http://www.lebazi.com/uploadpic/201308/05/p201308052241334100.gif', 'http://172.17.111.191:8080/images/p201308052241334100.gif', '爆笑gif动图：大爷倒了就算了咯', null, 'http://www.lebazi.com/n/20140309/7465.html', null, null, null, '爆笑gif动图：大爷倒了就算了咯', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:19:11', '1');
INSERT INTO `picture` VALUES ('160', 'p201305300922193346.gif', null, 'http://www.lebazi.com/uploadpic/201305/30/p201305300922193346.gif', 'http://172.17.111.191:8080/images/p201305300922193346.gif', '带上眼镜还看不清，还是取了吧', null, 'http://www.lebazi.com/n/20140309/7465.html', null, null, null, '带上眼镜还看不清，还是取了吧', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:19:19', '1');
INSERT INTO `picture` VALUES ('161', 'p201307141854514991.jpg', null, 'http://www.lebazi.com/uploadpic/201307/14/p201307141854514991.jpg', 'http://172.17.111.191:8080/images/p201307141854514991.jpg', '邪恶漫画：导致夫妻不和的其实都是因为“小”事', null, 'http://www.lebazi.com/n/20140309/7465.html', null, null, null, '邪恶漫画：导致夫妻不和的其实都是因为“小”事', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:19:19', '1');
INSERT INTO `picture` VALUES ('162', '7f232787gw1ejehmfl6ydg20ak05xx6q.gif', null, 'http://ww4.sinaimg.cn/mw690/7f232787gw1ejehmfl6ydg20ak05xx6q.gif', 'http://172.17.111.191:8080/images/7f232787gw1ejehmfl6ydg20ak05xx6q.gif', '少妇在家搞卫生诱惑gif动图：怎么看起来怪怪的？', null, 'http://www.lebazi.com/n/20140309/7465.html', null, null, null, '少妇在家搞卫生诱惑gif动图：怎么看起来怪怪的？', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:19:24', '1');
INSERT INTO `picture` VALUES ('163', 'p201307132347418707.gif', null, 'http://www.lebazi.com/uploadpic/201307/13/p201307132347418707.gif', 'http://172.17.111.191:8080/images/p201307132347418707.gif', '刚出生的小马宝宝搞笑gif动图', null, 'http://www.lebazi.com/n/20140309/7465.html', null, null, null, '刚出生的小马宝宝搞笑gif动图', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:19:32', '1');
INSERT INTO `picture` VALUES ('164', 'p201406172335004211.jpg', null, 'http://www.lebazi.com/uploadpic/201406/17/p201406172335004211.jpg', 'http://172.17.111.191:8080/images/p201406172335004211.jpg', '日本邪恶漫画大全_火影同人邪恶漫画大全：停止的心脏', null, 'http://www.lebazi.com/n/20140309/7465.html', null, null, null, '日本邪恶漫画大全_火影同人邪恶漫画大全：停止的心脏', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:19:32', '1');
INSERT INTO `picture` VALUES ('165', 'p201308252147356895.jpg', null, 'http://www.lebazi.com/uploadpic/201308/25/p201308252147356895.jpg', 'http://172.17.111.191:8080/images/p201308252147356895.jpg', '无翼鸟邪恶漫画全集：练功_重口h邪恶漫画日本', null, 'http://www.lebazi.com/n/20140309/7465.html', null, null, null, '无翼鸟邪恶漫画全集：练功_重口h邪恶漫画日本', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:19:33', '1');
INSERT INTO `picture` VALUES ('166', 'p201308052300431521.jpg', null, 'http://www.lebazi.com/uploadpic/201308/05/p201308052300431521.jpg', 'http://172.17.111.191:8080/images/p201308052300431521.jpg', '色系军团漫画之基因很重要：将军你死前先留下后代吧', null, 'http://www.lebazi.com/n/20140309/7465.html', null, null, null, '色系军团漫画之基因很重要：将军你死前先留下后代吧', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:19:33', '1');
INSERT INTO `picture` VALUES ('167', 'p201307141847531901.jpg', null, 'http://www.lebazi.com/uploadpic/201307/14/p201307141847531901.jpg', 'http://172.17.111.191:8080/images/p201307141847531901.jpg', '色系军团漫画：强与弱的差距', null, 'http://www.lebazi.com/n/20140309/7465.html', null, null, null, '色系军团漫画：强与弱的差距', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:19:33', '1');
INSERT INTO `picture` VALUES ('168', 'p201408122347268400.jpg', null, 'http://www.lebazi.com/uploadpic/201408/12/p201408122347268400.jpg', 'http://172.17.111.191:8080/images/p201408122347268400.jpg', '梦龙y传系列_梦龙y传漫画全集第17话：勇士的第一步', null, 'http://www.lebazi.com/n/20140309/7465.html', null, null, null, '梦龙y传系列_梦龙y传漫画全集第17话：勇士的第一步', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:19:34', '1');
INSERT INTO `picture` VALUES ('169', '60d02b59tw1ei4e7n0w9bg208w06onpd.gif', null, 'http://ww3.sinaimg.cn/mw690/60d02b59tw1ei4e7n0w9bg208w06onpd.gif', 'http://172.17.111.191:8080/images/60d02b59tw1ei4e7n0w9bg208w06onpd.gif', '看了还想看的gif邪恶动态图：又黄又色的邪恶gif动态图片出处', null, 'http://www.lebazi.com/n/20140822/8380.html', null, null, null, '看了还想看的gif邪恶动态图：又黄又色的邪恶gif动态图片出处', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:19:37', '1');
INSERT INTO `picture` VALUES ('170', 'p201403230114157844.gif', null, 'http://www.lebazi.com/uploadpic/201403/23/p201403230114157844.gif', 'http://172.17.111.191:8080/images/p201403230114157844.gif', '美女gif动图：两个强悍的妹子打架gif动图', null, 'http://www.lebazi.com/n/20140822/8380.html', null, null, null, '美女gif动图：两个强悍的妹子打架gif动图', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:19:55', '1');
INSERT INTO `picture` VALUES ('171', 'p201408112233097988.jpg', null, 'http://www.lebazi.com/uploadpic/201408/11/p201408112233097988.jpg', 'http://172.17.111.191:8080/images/p201408112233097988.jpg', '菊花笑典漫画全集：欧尼酱你这么机智你家里人造嘛？', null, 'http://www.lebazi.com/n/20140822/8380.html', null, null, null, '菊花笑典漫画全集：欧尼酱你这么机智你家里人造嘛？', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:19:55', '1');
INSERT INTO `picture` VALUES ('172', 'b5a3cd89gw1ehhnojwcs0g205p03qtma.gif', null, 'http://ww4.sinaimg.cn/mw690/b5a3cd89gw1ehhnojwcs0g205p03qtma.gif', 'http://172.17.111.191:8080/images/b5a3cd89gw1ehhnojwcs0g205p03qtma.gif', '周星驰电影逗你乐没商量搞笑gif动态图片', null, 'http://www.lebazi.com/n/20140822/8380.html', null, null, null, '周星驰电影逗你乐没商量搞笑gif动态图片', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:19:56', '1');
INSERT INTO `picture` VALUES ('173', 'p201406160204541115.jpg', null, 'http://www.lebazi.com/uploadpic/201406/16/p201406160204541115.jpg', 'http://172.17.111.191:8080/images/p201406160204541115.jpg', '各种高清性感大波妹大胸美女图片欣赏：屌丝们有没有种捏的冲动？', null, 'http://www.lebazi.com/n/20140822/8380.html', null, null, null, '各种高清性感大波妹大胸美女图片欣赏：屌丝们有没有种捏的冲动？', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:19:56', '1');
INSERT INTO `picture` VALUES ('174', 'p201309202326213178.gif', null, 'http://www.lebazi.com/uploadpic/201309/20/p201309202326213178.gif', 'http://172.17.111.191:8080/images/p201309202326213178.gif', '爆笑gif动图：老天你要不要这么坑一对恩爱的小情侣', null, 'http://www.lebazi.com/n/20140822/8380.html', null, null, null, '爆笑gif动图：老天你要不要这么坑一对恩爱的小情侣', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:20:03', '1');
INSERT INTO `picture` VALUES ('175', 'p201308022232016175.gif', null, 'http://www.lebazi.com/uploadpic/201308/02/p201308022232016175.gif', 'http://172.17.111.191:8080/images/p201308022232016175.gif', '超乖喵星人与人握手gif动图', null, 'http://www.lebazi.com/n/20140822/8380.html', null, null, null, '超乖喵星人与人握手gif动图', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:20:09', '1');
INSERT INTO `picture` VALUES ('176', 'p201306142244061109.jpg', null, 'http://www.lebazi.com/uploadpic/201306/14/p201306142244061109.jpg', 'http://172.17.111.191:8080/images/p201306142244061109.jpg', '色小组：之“十块钱”这可是10块钱啊!!', null, 'http://www.lebazi.com/n/20140822/8380.html', null, null, null, '色小组：之“十块钱”这可是10块钱啊!!', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:20:10', '1');
INSERT INTO `picture` VALUES ('177', '60d02b59gw1edchbta2cvg208w04we82.gif', null, 'http://ww1.sinaimg.cn/large/60d02b59gw1edchbta2cvg208w04we82.gif', 'http://172.17.111.191:8080/images/60d02b59gw1edchbta2cvg208w04we82.gif', '岛国av女优邪恶gif动态图片出处：美女邪恶gif动态图片出处', null, 'http://www.lebazi.com/n/20140822/8380.html', null, null, null, '岛国av女优邪恶gif动态图片出处：美女邪恶gif动态图片出处', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:20:12', '1');
INSERT INTO `picture` VALUES ('178', 'p201306252202518493.gif', null, 'http://www.lebazi.com/uploadpic/201306/25/p201306252202518493.gif', 'http://172.17.111.191:8080/images/p201306252202518493.gif', '美女咬嘴唇诱惑gif动态图片', null, 'http://www.lebazi.com/n/20140822/8380.html', null, null, null, '美女咬嘴唇诱惑gif动态图片', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:20:16', '1');
INSERT INTO `picture` VALUES ('179', 'p201306222159387667.gif', null, 'http://www.lebazi.com/uploadpic/201306/22/p201306222159387667.gif', 'http://172.17.111.191:8080/images/p201306222159387667.gif', '尼玛，警察大哥，你这是什么技能？', null, 'http://www.lebazi.com/n/20140822/8380.html', null, null, null, '尼玛，警察大哥，你这是什么技能？', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:20:23', '1');
INSERT INTO `picture` VALUES ('180', 'p201406172325382485.jpg', null, 'http://www.lebazi.com/uploadpic/201406/17/p201406172325382485.jpg', 'http://172.17.111.191:8080/images/p201406172325382485.jpg', '爱与欲望之学园邪恶漫画_内涵漫画色系图片：施咒法术', null, 'http://www.lebazi.com/n/20140822/8380.html', null, null, null, '爱与欲望之学园邪恶漫画_内涵漫画色系图片：施咒法术', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:20:23', '1');
INSERT INTO `picture` VALUES ('181', 'p201408140017055773.jpg', null, 'http://www.lebazi.com/uploadpic/201408/14/p201408140017055773.jpg', 'http://172.17.111.191:8080/images/p201408140017055773.jpg', '超邪恶漫画色系图片：摩托车幻想', null, 'http://www.lebazi.com/n/20140822/8380.html', null, null, null, '超邪恶漫画色系图片：摩托车幻想', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:20:23', '1');
INSERT INTO `picture` VALUES ('182', 'p201305182137359279.jpg', null, 'http://www.lebazi.com/uploadpic/201305/18/p201305182137359279.jpg', 'http://172.17.111.191:8080/images/p201305182137359279.jpg', '邪恶漫画：色系军团 抓犯人', null, 'http://www.lebazi.com/n/20140822/8380.html', null, null, null, '邪恶漫画：色系军团 抓犯人', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:20:24', '1');
INSERT INTO `picture` VALUES ('183', 'p201310252324261057.jpg', null, 'http://www.lebazi.com/uploadpic/201310/25/p201310252324261057.jpg', 'http://172.17.111.191:8080/images/p201310252324261057.jpg', '邪恶漫画不知火舞h：运气好的时候', null, 'http://www.lebazi.com/n/20140822/8380.html', null, null, null, '邪恶漫画不知火舞h：运气好的时候', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:20:24', '1');
INSERT INTO `picture` VALUES ('184', 'p201408170012151606.jpg', null, 'http://www.lebazi.com/uploadpic/201408/17/p201408170012151606.jpg', 'http://172.17.111.191:8080/images/p201408170012151606.jpg', '邪恶漫画色系军团寡妇三代漫画第22集：欲无止境', null, 'http://www.lebazi.com/n/20140822/8380.html', null, null, null, '邪恶漫画色系军团寡妇三代漫画第22集：欲无止境', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:20:24', '1');
INSERT INTO `picture` VALUES ('185', 'b5a3cd89gw1eit1nli7alg207804i4qq.gif', null, 'http://ww2.sinaimg.cn/mw690/b5a3cd89gw1eit1nli7alg207804i4qq.gif', 'http://172.17.111.191:8080/images/b5a3cd89gw1eit1nli7alg207804i4qq.gif', '色你妹gif动态邪恶图片_xxoo成人没内涵邪恶gif动态：各种男女xo成人gif动态图片 屌丝准备纸巾吧', null, 'http://www.lebazi.com/n/20140729/8160.html', null, null, null, '色你妹gif动态邪恶图片_xxoo成人没内涵邪恶gif动态：各种男女xo成人gif动态图片 屌丝准备纸巾吧', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:20:25', '1');
INSERT INTO `picture` VALUES ('186', '62047472tw1ectsx9w081g2064046wrk.gif', null, 'http://ww2.sinaimg.cn/mw690/62047472tw1ectsx9w081g2064046wrk.gif', 'http://172.17.111.191:8080/images/62047472tw1ectsx9w081g2064046wrk.gif', '又黄又色波多野结衣xxoo成人邪恶没内涵gif动图：宅男撸管必备福利图片（第十三期）', null, 'http://www.lebazi.com/n/20140808/8209.html', null, null, null, '又黄又色波多野结衣xxoo成人邪恶没内涵gif动图：宅男撸管必备福利图片（第十三期）', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:20:26', '1');
INSERT INTO `picture` VALUES ('187', '60d02b59tw1ehspkw5ewfg20dm05wb1p.gif', null, 'http://ww3.sinaimg.cn/mw690/60d02b59tw1ehspkw5ewfg20dm05wb1p.gif', 'http://172.17.111.191:8080/images/60d02b59tw1ehspkw5ewfg20dm05wb1p.gif', '又黄又色邪恶成人gif动态图片：看了还想看的gif邪恶动态图', null, 'http://www.lebazi.com/n/20140819/8370.html', null, null, null, '又黄又色邪恶成人gif动态图片：看了还想看的gif邪恶动态图', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:20:27', '1');
INSERT INTO `picture` VALUES ('188', '62047472gw1ek8q2guji7g209505vnpd.gif', null, 'http://ww3.sinaimg.cn/mw690/62047472gw1ek8q2guji7g209505vnpd.gif', 'http://172.17.111.191:8080/images/62047472gw1ek8q2guji7g209505vnpd.gif', '乐吧子邪恶动态图大全：日本av女优gif出处番号（第二期）', null, 'http://www.lebazi.com/n/20141020/8660.html', null, null, null, '乐吧子邪恶动态图大全：日本av女优gif出处番号（第二期）', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:20:29', '1');
INSERT INTO `picture` VALUES ('189', 'p201306142150431109.gif', null, 'http://www.lebazi.com/uploadpic/201306/14/p201306142150431109.gif', 'http://172.17.111.191:8080/images/p201306142150431109.gif', '美女，请你放尊重一点~我很保守的', null, 'http://www.lebazi.com/n/20141020/8660.html', null, null, null, '美女，请你放尊重一点~我很保守的', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:20:34', '1');
INSERT INTO `picture` VALUES ('190', 'p201403160258054164.gif', null, 'http://www.lebazi.com/uploadpic/201403/16/p201403160258054164.gif', 'http://172.17.111.191:8080/images/p201403160258054164.gif', '恶搞金三胖金正恩奥巴马系列GIF动态图大全', null, 'http://www.lebazi.com/n/20141020/8660.html', null, null, null, '恶搞金三胖金正恩奥巴马系列GIF动态图大全', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:20:47', '1');
INSERT INTO `picture` VALUES ('191', 'p201308252341184985.jpg', null, 'http://www.lebazi.com/uploadpic/201308/25/p201308252341184985.jpg', 'http://172.17.111.191:8080/images/p201308252341184985.jpg', 'QQ版航母style动态gif图片', null, 'http://www.lebazi.com/n/20141020/8660.html', null, null, null, 'QQ版航母style动态gif图片', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:20:55', '1');
INSERT INTO `picture` VALUES ('192', 'p201305281046042669.gif', null, 'http://www.lebazi.com/uploadpic/201305/28/p201305281046042669.gif', 'http://172.17.111.191:8080/images/p201305281046042669.gif', '美女，给老夫玩玩。。。', null, 'http://www.lebazi.com/n/20141020/8660.html', null, null, null, '美女，给老夫玩玩。。。', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:20:59', '1');
INSERT INTO `picture` VALUES ('193', 'p201310252322118081.jpg', null, 'http://www.lebazi.com/uploadpic/201310/25/p201310252322118081.jpg', 'http://172.17.111.191:8080/images/p201310252322118081.jpg', '不知火舞邪恶h漫画集：越老越能发挥真正的价值啊_勤俭的媳妇', null, 'http://www.lebazi.com/n/20141020/8660.html', null, null, null, '不知火舞邪恶h漫画集：越老越能发挥真正的价值啊_勤俭的媳妇', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:20:59', '1');
INSERT INTO `picture` VALUES ('194', 'p201306232032158854.gif', null, 'http://www.lebazi.com/uploadpic/201306/23/p201306232032158854.gif', 'http://172.17.111.191:8080/images/p201306232032158854.gif', '恶搞天龙八部版乔帮主发怒抗日打飞机gif动图~', null, 'http://www.lebazi.com/n/20141020/8660.html', null, null, null, '恶搞天龙八部版乔帮主发怒抗日打飞机gif动图~', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:21:07', '1');
INSERT INTO `picture` VALUES ('195', 'p201309271816248265.jpg', null, 'http://www.lebazi.com/uploadpic/201309/27/p201309271816248265.jpg', 'http://172.17.111.191:8080/images/p201309271816248265.jpg', '色小组漫画全集：鼓掌_邪恶漫画色系图片', null, 'http://www.lebazi.com/n/20141020/8660.html', null, null, null, '色小组漫画全集：鼓掌_邪恶漫画色系图片', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:21:08', '1');
INSERT INTO `picture` VALUES ('196', 'p201407280156378548.jpg', null, 'http://www.lebazi.com/uploadpic/201407/28/p201407280156378548.jpg', 'http://172.17.111.191:8080/images/p201407280156378548.jpg', '色系军团邪恶漫画_邪恶漫画色图片全集：交换', null, 'http://www.lebazi.com/n/20141020/8660.html', null, null, null, '色系军团邪恶漫画_邪恶漫画色图片全集：交换', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:21:08', '1');
INSERT INTO `picture` VALUES ('197', 'p201410100058441251.jpg', null, 'http://www.lebazi.com/uploadpic/201410/10/p201410100058441251.jpg', 'http://172.17.111.191:8080/images/p201410100058441251.jpg', '水咲萝拉原名泷泽萝拉因在YOUTUBE上传各种卖萌的蹲姿透视装自拍照而走红', null, 'http://www.lebazi.com/n/20141020/8660.html', null, null, null, '水咲萝拉原名泷泽萝拉因在YOUTUBE上传各种卖萌的蹲姿透视装自拍照而走红', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:21:08', '1');
INSERT INTO `picture` VALUES ('198', 'p201307022154378786.jpg', null, 'http://www.lebazi.com/uploadpic/201307/02/p201307022154378786.jpg', 'http://172.17.111.191:8080/images/p201307022154378786.jpg', '色系军团之“人鱼公主传”为了国家，为了你和我，请你成为王子（二）~', null, 'http://www.lebazi.com/n/20141020/8660.html', null, null, null, '色系军团之“人鱼公主传”为了国家，为了你和我，请你成为王子（二）~', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:21:08', '1');
INSERT INTO `picture` VALUES ('199', 'p201407150130231491.jpg', null, 'http://www.lebazi.com/uploadpic/201407/15/p201407150130231491.jpg', 'http://172.17.111.191:8080/images/p201407150130231491.jpg', '邪恶漫画御姐进行时_色小组思春期少女漫画：主题店', null, 'http://www.lebazi.com/n/20141020/8660.html', null, null, null, '邪恶漫画御姐进行时_色小组思春期少女漫画：主题店', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:21:09', '1');
INSERT INTO `picture` VALUES ('200', 'p201412190114068413.jpg', null, 'http://www.lebazi.com/uploadpic/201412/19/p201412190114068413.jpg', 'http://172.17.111.191:8080/images/p201412190114068413.jpg', '爱与欲望之学园邪恶漫画：桃色幻想', null, 'http://www.lebazi.com/n/20141020/8660.html', null, null, null, '爱与欲望之学园邪恶漫画：桃色幻想', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:21:09', '1');
INSERT INTO `picture` VALUES ('201', 'p201308290117024894.jpg', null, 'http://www.lebazi.com/uploadpic/201308/29/p201308290117024894.jpg', 'http://172.17.111.191:8080/images/p201308290117024894.jpg', '邪恶漫画爱丽丝学园：诱惑帅哥_全彩h邪恶漫画日本', null, 'http://www.lebazi.com/n/20141020/8660.html', null, null, null, '邪恶漫画爱丽丝学园：诱惑帅哥_全彩h邪恶漫画日本', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:21:09', '1');
INSERT INTO `picture` VALUES ('202', 'p201406230133438661.jpg', null, 'http://www.lebazi.com/uploadpic/201406/23/p201406230133438661.jpg', 'http://172.17.111.191:8080/images/p201406230133438661.jpg', '乐张不入妖妖小精漫画全集_妖妖小精色系军团：老婆的新爱好', null, 'http://www.lebazi.com/n/20141020/8660.html', null, null, null, '乐张不入妖妖小精漫画全集_妖妖小精色系军团：老婆的新爱好', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:21:10', '1');
INSERT INTO `picture` VALUES ('203', '2014030219561544761393761375.gif', null, 'http://www.lebazi.com/uploadpic/201403/02/2014030219561544761393761375.gif', 'http://172.17.111.191:8080/images/2014030219561544761393761375.gif', '2014成人gif邪恶美女gif动图精选', null, 'http://www.lebazi.com/n/20140302/7338.html', null, null, null, '2014成人gif邪恶美女gif动图精选', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:21:13', '1');
INSERT INTO `picture` VALUES ('204', 'p201307082013442649.jpg', null, 'http://www.lebazi.com/uploadpic/201307/08/p201307082013442649.jpg', 'http://172.17.111.191:8080/images/p201307082013442649.jpg', '邪恶漫画：“根据场所不同”哥哥，你好坏，老是偷看人家', null, 'http://www.lebazi.com/n/20140302/7338.html', null, null, null, '邪恶漫画：“根据场所不同”哥哥，你好坏，老是偷看人家', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:21:13', '1');
INSERT INTO `picture` VALUES ('205', 'p201307262155075146.gif', null, 'http://www.lebazi.com/uploadpic/201307/26/p201307262155075146.gif', 'http://172.17.111.191:8080/images/p201307262155075146.gif', '喵星人gif动图：你丫的是不是不想活了', null, 'http://www.lebazi.com/n/20140302/7338.html', null, null, null, '喵星人gif动图：你丫的是不是不想活了', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:21:22', '1');
INSERT INTO `picture` VALUES ('206', 'p201307162123052016.jpg', null, 'http://www.lebazi.com/uploadpic/201307/16/p201307162123052016.jpg', 'http://172.17.111.191:8080/images/p201307162123052016.jpg', '色系军团漫画：族长给我取名叫一柱擎天', null, 'http://www.lebazi.com/n/20140302/7338.html', null, null, null, '色系军团漫画：族长给我取名叫一柱擎天', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:21:22', '1');
INSERT INTO `picture` VALUES ('207', 'p201501060202531556.jpg', null, 'http://www.lebazi.com/uploadpic/201501/06/p201501060202531556.jpg', 'http://172.17.111.191:8080/images/p201501060202531556.jpg', '超美嫩模@金小小猫儿圣诞私房照写真全集 附其它生活写真照', null, 'http://www.lebazi.com/n/20140302/7338.html', null, null, null, '超美嫩模@金小小猫儿圣诞私房照写真全集 附其它生活写真照', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:21:23', '1');
INSERT INTO `picture` VALUES ('208', 'p201406232353492014.jpg', null, 'http://www.lebazi.com/uploadpic/201406/23/p201406232353492014.jpg', 'http://172.17.111.191:8080/images/p201406232353492014.jpg', '妖妖小精色系军团2次元少女邪恶漫画（第二章）：过客的温柔乡', null, 'http://www.lebazi.com/n/20140302/7338.html', null, null, null, '妖妖小精色系军团2次元少女邪恶漫画（第二章）：过客的温柔乡', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:21:23', '1');
INSERT INTO `picture` VALUES ('209', 'p201306112040428615.gif', null, 'http://www.lebazi.com/uploadpic/201306/11/p201306112040428615.gif', 'http://172.17.111.191:8080/images/p201306112040428615.gif', '哈哈，走秀变走光了', null, 'http://www.lebazi.com/n/20140302/7338.html', null, null, null, '哈哈，走秀变走光了', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:21:27', '1');
INSERT INTO `picture` VALUES ('210', 'p201305291200549550.gif', null, 'http://www.lebazi.com/uploadpic/201305/29/p201305291200549550.gif', 'http://172.17.111.191:8080/images/p201305291200549550.gif', '哈哈。我看到了小企鹅。', null, 'http://www.lebazi.com/n/20140302/7338.html', null, null, null, '哈哈。我看到了小企鹅。', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:21:34', '1');
INSERT INTO `picture` VALUES ('211', 'p201306132220132603.gif', null, 'http://www.lebazi.com/uploadpic/201306/13/p201306132220132603.gif', 'http://172.17.111.191:8080/images/p201306132220132603.gif', '尼玛，这么大一把年假了还卖萌~~', null, 'http://www.lebazi.com/n/20140302/7338.html', null, null, null, '尼玛，这么大一把年假了还卖萌~~', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:21:39', '1');
INSERT INTO `picture` VALUES ('212', 'p201411112143362714.jpg', null, 'http://www.lebazi.com/uploadpic/201411/11/p201411112143362714.jpg', 'http://172.17.111.191:8080/images/p201411112143362714.jpg', '微博无节操内涵段子集：插可以，要是用手就免了', null, 'http://www.lebazi.com/n/20140302/7338.html', null, null, null, '微博无节操内涵段子集：插可以，要是用手就免了', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:21:39', '1');
INSERT INTO `picture` VALUES ('213', 'p201401040206301015.gif', null, 'http://www.lebazi.com/uploadpic/201401/04/p201401040206301015.gif', 'http://172.17.111.191:8080/images/p201401040206301015.gif', '超内涵邪恶gif动图：骚年，这是女神给的礼物啊', null, 'http://www.lebazi.com/n/20140302/7338.html', null, null, null, '超内涵邪恶gif动图：骚年，这是女神给的礼物啊', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:21:50', '1');
INSERT INTO `picture` VALUES ('214', 'p201305191635074217.gif', null, 'http://www.lebazi.com/uploadpic/201305/19/p201305191635074217.gif', 'http://172.17.111.191:8080/images/p201305191635074217.gif', '邪恶漫画：那我就努力试一试', null, 'http://www.lebazi.com/n/20140302/7338.html', null, null, null, '邪恶漫画：那我就努力试一试', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:21:50', '1');
INSERT INTO `picture` VALUES ('215', 'p201309210909495732.jpg', null, 'http://www.lebazi.com/uploadpic/201309/21/p201309210909495732.jpg', 'http://172.17.111.191:8080/images/p201309210909495732.jpg', '不知火舞邪恶漫画集：有夫之妇_邪恶漫画色系图片', null, 'http://www.lebazi.com/n/20140302/7338.html', null, null, null, '不知火舞邪恶漫画集：有夫之妇_邪恶漫画色系图片', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:21:50', '1');
INSERT INTO `picture` VALUES ('216', 'p201403060223223617.jpg', null, 'http://www.lebazi.com/uploadpic/201403/06/p201403060223223617.jpg', 'http://172.17.111.191:8080/images/p201403060223223617.jpg', '初音未来h邪恶漫画：乡间的小路_18禁邪恶漫画', null, 'http://www.lebazi.com/n/20140302/7338.html', null, null, null, '初音未来h邪恶漫画：乡间的小路_18禁邪恶漫画', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:21:51', '1');
INSERT INTO `picture` VALUES ('217', 'p201308180148433582.jpg', null, 'http://www.lebazi.com/uploadpic/201308/18/p201308180148433582.jpg', 'http://172.17.111.191:8080/images/p201308180148433582.jpg', '妖妖小精漫画大全：邪恶的魔镜_重口h邪恶漫画日本', null, 'http://www.lebazi.com/n/20140302/7338.html', null, null, null, '妖妖小精漫画大全：邪恶的魔镜_重口h邪恶漫画日本', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:21:51', '1');
INSERT INTO `picture` VALUES ('218', 'p201309080002339370.jpg', null, 'http://www.lebazi.com/uploadpic/201309/08/p201309080002339370.jpg', 'http://172.17.111.191:8080/images/p201309080002339370.jpg', '邪恶漫画色系图片：教育到位_重口h邪恶漫画日本', null, 'http://www.lebazi.com/n/20140302/7338.html', null, null, null, '邪恶漫画色系图片：教育到位_重口h邪恶漫画日本', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:21:52', '1');
INSERT INTO `picture` VALUES ('219', '883121d8gw1eiya5mk7t7g206o050hcv.gif', null, 'http://ww2.sinaimg.cn/mw690/883121d8gw1eiya5mk7t7g206o050hcv.gif', 'http://172.17.111.191:8080/images/883121d8gw1eiya5mk7t7g206o050hcv.gif', '男女激情叉叉邪恶内涵gif动态图精选_可以拿来撸的邪恶内涵gif动态图片：你个混蛋怎么那么慢', null, 'http://www.lebazi.com/n/20140813/8263.html', null, null, null, '男女激情叉叉邪恶内涵gif动态图精选_可以拿来撸的邪恶内涵gif动态图片：你个混蛋怎么那么慢', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:21:55', '1');
INSERT INTO `picture` VALUES ('220', '62047472tw1ecurjj7ekwg208c04o7wj.gif', null, 'http://ww3.sinaimg.cn/mw690/62047472tw1ecurjj7ekwg208c04o7wj.gif', 'http://172.17.111.191:8080/images/62047472tw1ecurjj7ekwg208c04o7wj.gif', '27报邪恶内涵诱惑h美女真人秀Gif动态图片合集：真人秀在上演多赞多种（第十三期）', null, 'http://www.lebazi.com/n/20140805/8193.html', null, null, null, '27报邪恶内涵诱惑h美女真人秀Gif动态图片合集：真人秀在上演多赞多种（第十三期）', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:21:58', '1');
INSERT INTO `picture` VALUES ('221', '60d02b59jw1eisgsealqag209q05dnpd.gif', null, 'http://ww4.sinaimg.cn/mw690/60d02b59jw1eisgsealqag209q05dnpd.gif', 'http://172.17.111.191:8080/images/60d02b59jw1eisgsealqag209q05dnpd.gif', '又黄又色邪恶成人邪恶gif动态图片出处：看了还想看的gif邪恶动态图', null, 'http://www.lebazi.com/n/20140825/8391.html', null, null, null, '又黄又色邪恶成人邪恶gif动态图片出处：看了还想看的gif邪恶动态图', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:21:59', '1');
INSERT INTO `picture` VALUES ('222', '62047472tw1ecuuafu4ixg204n086hdt.gif', null, 'http://ww4.sinaimg.cn/mw690/62047472tw1ecuuafu4ixg204n086hdt.gif', 'http://172.17.111.191:8080/images/62047472tw1ecuuafu4ixg204n086hdt.gif', '邪恶成人xxoo真人没内涵搞笑gif动态图精选：美女我知道你喜欢这样的（第十二期）', null, 'http://www.lebazi.com/n/20140804/8192.html', null, null, null, '邪恶成人xxoo真人没内涵搞笑gif动态图精选：美女我知道你喜欢这样的（第十二期）', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:22:01', '1');
INSERT INTO `picture` VALUES ('223', 'bcf091fdgw1elfmfgojrrg208g04iu0x.gif', null, 'http://ww3.sinaimg.cn/large/bcf091fdgw1elfmfgojrrg208g04iu0x.gif', 'http://172.17.111.191:8080/images/bcf091fdgw1elfmfgojrrg208g04iu0x.gif', '乐吧子邪恶动态图出处大全：屌丝福利之男女成人邪恶gif动态图 看的我真的是醉了', null, 'http://www.lebazi.com/n/20141022/8666.html', null, null, null, '乐吧子邪恶动态图出处大全：屌丝福利之男女成人邪恶gif动态图 看的我真的是醉了', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:22:03', '1');
INSERT INTO `picture` VALUES ('224', '005LR9mujw1ekizcpzbb7g30b60754qs.gif', null, 'http://ww2.sinaimg.cn/bmiddle/005LR9mujw1ekizcpzbb7g30b60754qs.gif', 'http://172.17.111.191:8080/images/005LR9mujw1ekizcpzbb7g30b60754qs.gif', '岛国av女优邪恶gif动态图片出处：美女邪恶gif动态图片出处（第二期）', null, 'http://www.lebazi.com/n/20140926/8562.html', null, null, null, '岛国av女优邪恶gif动态图片出处：美女邪恶gif动态图片出处（第二期）', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:22:05', '1');
INSERT INTO `picture` VALUES ('225', '883121d8gw1eg932g5voog209c0aokhc.gif', null, 'http://ww4.sinaimg.cn/mw690/883121d8gw1eg932g5voog209c0aokhc.gif', 'http://172.17.111.191:8080/images/883121d8gw1eg932g5voog209c0aokhc.gif', '又黄又色邪恶成人gif搞笑动态图片：宅男撸管必备福利图片（第1期）', null, 'http://www.lebazi.com/n/20140713/8015.html', null, null, null, '又黄又色邪恶成人gif搞笑动态图片：宅男撸管必备福利图片（第1期）', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:22:06', '1');
INSERT INTO `picture` VALUES ('226', 'p201307062316112082.jpg', null, 'http://www.lebazi.com/uploadpic/201307/06/p201307062316112082.jpg', 'http://172.17.111.191:8080/images/p201307062316112082.jpg', '邪恶漫画之：yoga翻转魔术师（二），公主也疯狂', null, 'http://www.lebazi.com/n/20140713/8015.html', null, null, null, '邪恶漫画之：yoga翻转魔术师（二），公主也疯狂', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:22:07', '1');
INSERT INTO `picture` VALUES ('227', 'p201407152309125199.jpg', null, 'http://www.lebazi.com/uploadpic/201407/15/p201407152309125199.jpg', 'http://172.17.111.191:8080/images/p201407152309125199.jpg', '暴走漫画第二季脑残对话表情_暴走漫画吧：床上的东西', null, 'http://www.lebazi.com/n/20140713/8015.html', null, null, null, '暴走漫画第二季脑残对话表情_暴走漫画吧：床上的东西', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:22:07', '1');
INSERT INTO `picture` VALUES ('228', 'p201411240154121989.jpg', null, 'http://www.lebazi.com/uploadpic/201411/24/p201411240154121989.jpg', 'http://172.17.111.191:8080/images/p201411240154121989.jpg', '恋姐倾心少女漫画邪恶篇：感受空姐', null, 'http://www.lebazi.com/n/20140713/8015.html', null, null, null, '恋姐倾心少女漫画邪恶篇：感受空姐', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:22:07', '1');
INSERT INTO `picture` VALUES ('229', 'p201408180003244468.jpg', null, 'http://www.lebazi.com/uploadpic/201408/18/p201408180003244468.jpg', 'http://172.17.111.191:8080/images/p201408180003244468.jpg', '土豆《神街访》街头采访爆笑视频：中了500万想对老板说什么？', null, 'http://www.lebazi.com/n/20140713/8015.html', null, null, null, '土豆《神街访》街头采访爆笑视频：中了500万想对老板说什么？', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:22:07', '1');
INSERT INTO `picture` VALUES ('230', 'p201308212203493324.gif', null, 'http://www.lebazi.com/uploadpic/201308/21/p201308212203493324.gif', 'http://172.17.111.191:8080/images/p201308212203493324.gif', '邪恶美女gif动图：美女屁屁上的肉肉好柔软的哈。', null, 'http://www.lebazi.com/n/20140713/8015.html', null, null, null, '邪恶美女gif动图：美女屁屁上的肉肉好柔软的哈。', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:22:12', '1');
INSERT INTO `picture` VALUES ('231', 'p201412102149045815.jpg', null, 'http://www.lebazi.com/uploadpic/201412/10/p201412102149045815.jpg', 'http://172.17.111.191:8080/images/p201412102149045815.jpg', '无翼鸟一库邪恶漫画：洞穴里的壁画2', null, 'http://www.lebazi.com/n/20140713/8015.html', null, null, null, '无翼鸟一库邪恶漫画：洞穴里的壁画2', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:22:12', '1');
INSERT INTO `picture` VALUES ('232', 'p201305251735508917.gif', null, 'http://www.lebazi.com/uploadpic/201305/25/p201305251735508917.gif', 'http://172.17.111.191:8080/images/p201305251735508917.gif', '瞄星人很忙，懒得理你！', null, 'http://www.lebazi.com/n/20140713/8015.html', null, null, null, '瞄星人很忙，懒得理你！', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:22:17', '1');
INSERT INTO `picture` VALUES ('233', 'p201307242159296741.gif', null, 'http://www.lebazi.com/uploadpic/201307/24/p201307242159296741.gif', 'http://172.17.111.191:8080/images/p201307242159296741.gif', '美女gif动图：钓鱼岛是中国的，苍老师是世界的', null, 'http://www.lebazi.com/n/20140713/8015.html', null, null, null, '美女gif动图：钓鱼岛是中国的，苍老师是世界的', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:22:26', '1');
INSERT INTO `picture` VALUES ('234', 'p201403092034299874.jpg', null, 'http://www.lebazi.com/uploadpic/201403/09/p201403092034299874.jpg', 'http://172.17.111.191:8080/images/p201403092034299874.jpg', '不知火舞沙滩全集之河神新篇：狗男女你们太浪费老衲的表情了，我要杀了你们', null, 'http://www.lebazi.com/n/20140713/8015.html', null, null, null, '不知火舞沙滩全集之河神新篇：狗男女你们太浪费老衲的表情了，我要杀了你们', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:22:27', '1');
INSERT INTO `picture` VALUES ('235', 'p201410122158352227.jpg', null, 'http://www.lebazi.com/uploadpic/201410/12/p201410122158352227.jpg', 'http://172.17.111.191:8080/images/p201410122158352227.jpg', '披萨恋恋曲少女漫画邪恶篇272-278章节：Only you', null, 'http://www.lebazi.com/n/20140713/8015.html', null, null, null, '披萨恋恋曲少女漫画邪恶篇272-278章节：Only you', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:22:27', '1');
INSERT INTO `picture` VALUES ('236', 'p201310090020443691.jpg', null, 'http://www.lebazi.com/uploadpic/201310/09/p201310090020443691.jpg', 'http://172.17.111.191:8080/images/p201310090020443691.jpg', '邪恶漫画色系图片：最后三分钟_无翼鸟邪恶漫画全集', null, 'http://www.lebazi.com/n/20140713/8015.html', null, null, null, '邪恶漫画色系图片：最后三分钟_无翼鸟邪恶漫画全集', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:22:28', '1');
INSERT INTO `picture` VALUES ('237', 'p201306301447108138.jpg', null, 'http://www.lebazi.com/uploadpic/201306/30/p201306301447108138.jpg', 'http://172.17.111.191:8080/images/p201306301447108138.jpg', '色系军团之“有了家用机器人舒服极了~”', null, 'http://www.lebazi.com/n/20140713/8015.html', null, null, null, '色系军团之“有了家用机器人舒服极了~”', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:22:28', '1');
INSERT INTO `picture` VALUES ('238', '005xtGGbgw1eld2cejc24g30dv0afkda.gif', null, 'http://ww2.sinaimg.cn/mw690/005xtGGbgw1eld2cejc24g30dv0afkda.gif', 'http://172.17.111.191:8080/images/005xtGGbgw1eld2cejc24g30dv0afkda.gif', '岛国东京热xxoo成人邪恶gif动态图出处番号大全：宅男撸管必备福利图片', null, 'http://www.lebazi.com/n/20141016/8645.html', null, null, null, '岛国东京热xxoo成人邪恶gif动态图出处番号大全：宅男撸管必备福利图片', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:22:29', '1');
INSERT INTO `picture` VALUES ('239', 'b5a3cd89gw1elw2aij9e8g208w06oqr3.gif', null, 'http://ww3.sinaimg.cn/mw690/b5a3cd89gw1elw2aij9e8g208w06oqr3.gif', 'http://172.17.111.191:8080/images/b5a3cd89gw1elw2aij9e8g208w06oqr3.gif', '乐吧子邪恶内涵gif动态图大全：日本最红av女优gif番号出处（第三期）', null, 'http://www.lebazi.com/n/20141102/8692.html', null, null, null, '乐吧子邪恶内涵gif动态图大全：日本最红av女优gif番号出处（第三期）', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:22:31', '1');
INSERT INTO `picture` VALUES ('240', 'c4345121gw1ef1i0h5r2ng207p04vnpf.gif', null, 'http://ww1.sinaimg.cn/mw1024/c4345121gw1ef1i0h5r2ng207p04vnpf.gif', 'http://172.17.111.191:8080/images/c4345121gw1ef1i0h5r2ng207p04vnpf.gif', '男女激情内涵邪恶gif动态图精选：各种成人诱惑gif动态图片 宅男撸管必备合集', null, 'http://www.lebazi.com/n/20140813/8259.html', null, null, null, '男女激情内涵邪恶gif动态图精选：各种成人诱惑gif动态图片 宅男撸管必备合集', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:22:33', '1');
INSERT INTO `picture` VALUES ('241', '9c41e226jw1emgi3hm2g6g207r0441ky.gif', null, 'http://ww2.sinaimg.cn/bmiddle/9c41e226jw1emgi3hm2g6g207r0441ky.gif', 'http://172.17.111.191:8080/images/9c41e226jw1emgi3hm2g6g207r0441ky.gif', '色色男与色妹妹gif出处：真上火3分钟也敢和老娘出来约炮！', null, 'http://www.lebazi.com/n/20141211/8859.html', null, null, null, '色色男与色妹妹gif出处：真上火3分钟也敢和老娘出来约炮！', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:22:35', '1');
INSERT INTO `picture` VALUES ('242', '7cccd99bgw1eh13wwhzpuj20go0bo0v5.jpg', null, 'http://ww3.sinaimg.cn/mw690/7cccd99bgw1eh13wwhzpuj20go0bo0v5.jpg', 'http://172.17.111.191:8080/images/7cccd99bgw1eh13wwhzpuj20go0bo0v5.jpg', '日本二次元h性感动漫美少女：爆乳动漫美女比基尼白嫩肌肤图集', null, 'http://www.lebazi.com/n/20140828/8413.html', null, null, null, '日本二次元h性感动漫美少女：爆乳动漫美女比基尼白嫩肌肤图集', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:22:43', '1');
INSERT INTO `picture` VALUES ('243', '9c0ce9e3tw1e5izobjemqj20f02rk7hc.jpg', null, 'http://ww1.sinaimg.cn/bmiddle/9c0ce9e3tw1e5izobjemqj20f02rk7hc.jpg', 'http://172.17.111.191:8080/images/9c0ce9e3tw1e5izobjemqj20f02rk7hc.jpg', '色小组思春期少女漫画_大吴哥邪恶少女h漫画：（剧场的男女）今天介绍那男的怎么样？', null, 'http://www.lebazi.com/n/20140801/8182.html', null, null, null, '色小组思春期少女漫画_大吴哥邪恶少女h漫画：（剧场的男女）今天介绍那男的怎么样？', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:22:46', '1');
INSERT INTO `picture` VALUES ('244', '2013082223160230401377184562.jpg', null, 'http://www.lebazi.com/uploadpic/201308/22/2013082223160230401377184562.jpg', 'http://172.17.111.191:8080/images/2013082223160230401377184562.jpg', '大吴哥娱乐邪恶漫画：神偷伤不起_邪恶漫画色系图片', null, 'http://www.lebazi.com/n/20130822/5789.html', null, null, null, '大吴哥娱乐邪恶漫画：神偷伤不起_邪恶漫画色系图片', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:23:00', '1');
INSERT INTO `picture` VALUES ('245', 'p201306292206269010.gif', null, 'http://www.lebazi.com/uploadpic/201306/29/p201306292206269010.gif', 'http://172.17.111.191:8080/images/p201306292206269010.gif', '看本兔大侠为大家表演飞檐走壁神功~', null, 'http://www.lebazi.com/n/20130822/5789.html', null, null, null, '看本兔大侠为大家表演飞檐走壁神功~', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:23:05', '1');
INSERT INTO `picture` VALUES ('246', 'p201305202317265493.jpg', null, 'http://www.lebazi.com/uploadpic/201305/20/p201305202317265493.jpg', 'http://172.17.111.191:8080/images/p201305202317265493.jpg', '碉堡了！英雄救美！', null, 'http://www.lebazi.com/n/20130822/5789.html', null, null, null, '碉堡了！英雄救美！', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:23:06', '1');
INSERT INTO `picture` VALUES ('247', 'p201410122246015864.jpg', null, 'http://www.lebazi.com/uploadpic/201410/12/p201410122246015864.jpg', 'http://172.17.111.191:8080/images/p201410122246015864.jpg', '韩国邪恶漫画“人鱼公主传”全集连载：第03集', null, 'http://www.lebazi.com/n/20130822/5789.html', null, null, null, '韩国邪恶漫画“人鱼公主传”全集连载：第03集', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:23:06', '1');
INSERT INTO `picture` VALUES ('248', 'p201306262215423552.jpg', null, 'http://www.lebazi.com/uploadpic/201306/26/p201306262215423552.jpg', 'http://172.17.111.191:8080/images/p201306262215423552.jpg', '内涵图：盘点明星们的“私生子“', null, 'http://www.lebazi.com/n/20130822/5789.html', null, null, null, '内涵图：盘点明星们的“私生子“', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:23:06', '1');
INSERT INTO `picture` VALUES ('249', 'p201407182251325511.jpg', null, 'http://www.lebazi.com/uploadpic/201407/18/p201407182251325511.jpg', 'http://172.17.111.191:8080/images/p201407182251325511.jpg', '邪恶漫画色系军团_邪恶色系漫画：孔雀的危险', null, 'http://www.lebazi.com/n/20130822/5789.html', null, null, null, '邪恶漫画色系军团_邪恶色系漫画：孔雀的危险', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:23:06', '1');
INSERT INTO `picture` VALUES ('250', '62047472gw1ek3wxqmln3g20a806qkjo.gif', null, 'http://ww4.sinaimg.cn/mw690/62047472gw1ek3wxqmln3g20a806qkjo.gif', 'http://172.17.111.191:8080/images/62047472gw1ek3wxqmln3g20a806qkjo.gif', '乐吧子邪恶动态图出处大全：屌丝福利之男女成人邪恶gif动态图 看的我真的是醉了', null, 'http://www.lebazi.com/n/20130822/5789.html', null, null, null, '乐吧子邪恶动态图出处大全：屌丝福利之男女成人邪恶gif动态图 看的我真的是醉了', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:23:08', '1');
INSERT INTO `picture` VALUES ('251', 'p201306172207109511.gif', null, 'http://www.lebazi.com/uploadpic/201306/17/p201306172207109511.gif', 'http://172.17.111.191:8080/images/p201306172207109511.gif', '摸一次胸部500，你愿不愿意？', null, 'http://www.lebazi.com/n/20130822/5789.html', null, null, null, '摸一次胸部500，你愿不愿意？', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:23:13', '1');
INSERT INTO `picture` VALUES ('252', '005xyUJsjw1ek9kxpjrtjg30a005mnpe.gif', null, 'http://ww1.sinaimg.cn/mw690/005xyUJsjw1ek9kxpjrtjg30a005mnpe.gif', 'http://172.17.111.191:8080/images/005xyUJsjw1ek9kxpjrtjg30a005mnpe.gif', '宅男福利来了：各种美女gif诱惑图片，喜欢你就使劲撸！', null, 'http://www.lebazi.com/n/20130822/5789.html', null, null, null, '宅男福利来了：各种美女gif诱惑图片，喜欢你就使劲撸！', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:23:14', '1');
INSERT INTO `picture` VALUES ('253', 'p201308112325257312.jpg', null, 'http://www.lebazi.com/uploadpic/201308/11/p201308112325257312.jpg', 'http://172.17.111.191:8080/images/p201308112325257312.jpg', '邪恶漫画之胳膊的适用：加油撸', null, 'http://www.lebazi.com/n/20130822/5789.html', null, null, null, '邪恶漫画之胳膊的适用：加油撸', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:23:14', '1');
INSERT INTO `picture` VALUES ('254', 'p201410142234473777.jpg', null, 'http://www.lebazi.com/uploadpic/201410/14/p201410142234473777.jpg', 'http://172.17.111.191:8080/images/p201410142234473777.jpg', '微博语录精选：这个世界，打了马赛克后一切都变了', null, 'http://www.lebazi.com/n/20130822/5789.html', null, null, null, '微博语录精选：这个世界，打了马赛克后一切都变了', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:23:15', '1');
INSERT INTO `picture` VALUES ('255', 'p201306301442448435.jpg', null, 'http://www.lebazi.com/uploadpic/201306/30/p201306301442448435.jpg', 'http://172.17.111.191:8080/images/p201306301442448435.jpg', '色系军团之“你那令人讨厌的胡子”', null, 'http://www.lebazi.com/n/20130822/5789.html', null, null, null, '色系军团之“你那令人讨厌的胡子”', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:23:15', '1');
INSERT INTO `picture` VALUES ('256', 'p201307122314358816.jpg', null, 'http://www.lebazi.com/uploadpic/201307/12/p201307122314358816.jpg', 'http://172.17.111.191:8080/images/p201307122314358816.jpg', '色系军团漫画：“关心邻居”要是所有人像我这样关系邻居就好了', null, 'http://www.lebazi.com/n/20130822/5789.html', null, null, null, '色系军团漫画：“关心邻居”要是所有人像我这样关系邻居就好了', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:23:15', '1');
INSERT INTO `picture` VALUES ('257', 'p201307022153132149.jpg', null, 'http://www.lebazi.com/uploadpic/201307/02/p201307022153132149.jpg', 'http://172.17.111.191:8080/images/p201307022153132149.jpg', '色系军团之“人鱼公主传”王子留下的爱的印记（二）~', null, 'http://www.lebazi.com/n/20130822/5789.html', null, null, null, '色系军团之“人鱼公主传”王子留下的爱的印记（二）~', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:23:15', '1');
INSERT INTO `picture` VALUES ('258', '2013112622551331711385477713.jpg', null, 'http://www.lebazi.com/uploadpic/201311/26/2013112622551331711385477713.jpg', 'http://172.17.111.191:8080/images/2013112622551331711385477713.jpg', '邪恶漫画不知火舞：屌丝注定要跟右手做一辈子好盆友_爱神之箭', null, 'http://www.lebazi.com/n/20131126/6745.html', null, null, null, '邪恶漫画不知火舞：屌丝注定要跟右手做一辈子好盆友_爱神之箭', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:23:22', '1');
INSERT INTO `picture` VALUES ('259', 'p201307122226101830.gif', null, 'http://www.lebazi.com/uploadpic/201307/12/p201307122226101830.gif', 'http://172.17.111.191:8080/images/p201307122226101830.gif', '邪恶gif：谁邪恶了顶一下~', null, 'http://www.lebazi.com/n/20131126/6745.html', null, null, null, '邪恶gif：谁邪恶了顶一下~', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:23:32', '1');
INSERT INTO `picture` VALUES ('260', 'p201307132326291513.gif', null, 'http://www.lebazi.com/uploadpic/201307/13/p201307132326291513.gif', 'http://172.17.111.191:8080/images/p201307132326291513.gif', '美女gif：美女手好灵活啊~', null, 'http://www.lebazi.com/n/20131126/6745.html', null, null, null, '美女gif：美女手好灵活啊~', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:23:37', '1');
INSERT INTO `picture` VALUES ('261', 'p201407160101003913.jpg', null, 'http://www.lebazi.com/uploadpic/201407/16/p201407160101003913.jpg', 'http://172.17.111.191:8080/images/p201407160101003913.jpg', '美女恶搞搞笑视频_美女搞笑视频集锦：英雄联盟Cosplay狂野的豹女 妩媚的妖狐 搞怪的炸弹人', null, 'http://www.lebazi.com/n/20131126/6745.html', null, null, null, '美女恶搞搞笑视频_美女搞笑视频集锦：英雄联盟Cosplay狂野的豹女 妩媚的妖狐 搞怪的炸弹人', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:23:37', '1');
INSERT INTO `picture` VALUES ('262', 'p201306292214254011.gif', null, 'http://www.lebazi.com/uploadpic/201306/29/p201306292214254011.gif', 'http://172.17.111.191:8080/images/p201306292214254011.gif', '一群2b士兵玩炸弹游戏~你们是在拿命玩么', null, 'http://www.lebazi.com/n/20131126/6745.html', null, null, null, '一群2b士兵玩炸弹游戏~你们是在拿命玩么', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:23:42', '1');
INSERT INTO `picture` VALUES ('263', 'p201307272244226145.gif', null, 'http://www.lebazi.com/uploadpic/201307/27/p201307272244226145.gif', 'http://172.17.111.191:8080/images/p201307272244226145.gif', '巨胸美女大桌球gif动图', null, 'http://www.lebazi.com/n/20131126/6745.html', null, null, null, '巨胸美女大桌球gif动图', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:23:44', '1');
INSERT INTO `picture` VALUES ('264', 'p201305300958248423.gif', null, 'http://www.lebazi.com/uploadpic/201305/30/p201305300958248423.gif', 'http://172.17.111.191:8080/images/p201305300958248423.gif', '不解释，貌似是雷大官人！', null, 'http://www.lebazi.com/n/20131126/6745.html', null, null, null, '不解释，貌似是雷大官人！', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:23:46', '1');
INSERT INTO `picture` VALUES ('265', 'p201307222137536624.jpg', null, 'http://www.lebazi.com/uploadpic/201307/22/p201307222137536624.jpg', 'http://172.17.111.191:8080/images/p201307222137536624.jpg', '18禁漫画：“来来回回，进进出出”：搞毛啊！进进出出的', null, 'http://www.lebazi.com/n/20131126/6745.html', null, null, null, '18禁漫画：“来来回回，进进出出”：搞毛啊！进进出出的', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:23:47', '1');
INSERT INTO `picture` VALUES ('266', 'p201307232236521755.jpg', null, 'http://www.lebazi.com/uploadpic/201307/23/p201307232236521755.jpg', 'http://172.17.111.191:8080/images/p201307232236521755.jpg', '色系军团漫画：“男朋友的关心”：跟我在一起的时候要夜不归宿', null, 'http://www.lebazi.com/n/20131126/6745.html', null, null, null, '色系军团漫画：“男朋友的关心”：跟我在一起的时候要夜不归宿', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:23:47', '1');
INSERT INTO `picture` VALUES ('267', 'p201307141856322675.jpg', null, 'http://www.lebazi.com/uploadpic/201307/14/p201307141856322675.jpg', 'http://172.17.111.191:8080/images/p201307141856322675.jpg', '邪恶漫画：捉坐在红色垫子上的女鬼', null, 'http://www.lebazi.com/n/20131126/6745.html', null, null, null, '邪恶漫画：捉坐在红色垫子上的女鬼', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:23:47', '1');
INSERT INTO `picture` VALUES ('268', 'p201305191759566984.jpg', null, 'http://www.lebazi.com/uploadpic/201305/19/p201305191759566984.jpg', 'http://172.17.111.191:8080/images/p201305191759566984.jpg', '邪恶漫画：怪物的弱点，作战成功', null, 'http://www.lebazi.com/n/20131126/6745.html', null, null, null, '邪恶漫画：怪物的弱点，作战成功', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:23:47', '1');
INSERT INTO `picture` VALUES ('269', 'p201408290006485063.jpg', null, 'http://www.lebazi.com/uploadpic/201408/29/p201408290006485063.jpg', 'http://172.17.111.191:8080/images/p201408290006485063.jpg', '日本二次元h动漫性感翘臀美少女：美臀福利图片', null, 'http://www.lebazi.com/n/20131126/6745.html', null, null, null, '日本二次元h动漫性感翘臀美少女：美臀福利图片', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:23:48', '1');
INSERT INTO `picture` VALUES ('270', 'p201305191730586757.jpg', null, 'http://www.lebazi.com/uploadpic/201305/19/p201305191730586757.jpg', 'http://172.17.111.191:8080/images/p201305191730586757.jpg', '邪恶漫画：大鼻孔师兄系列漫画之大变活人', null, 'http://www.lebazi.com/n/20131126/6745.html', null, null, null, '邪恶漫画：大鼻孔师兄系列漫画之大变活人', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:23:48', '1');
INSERT INTO `picture` VALUES ('271', 'p201412162317463356.jpg', null, 'http://www.lebazi.com/uploadpic/201412/16/p201412162317463356.jpg', 'http://172.17.111.191:8080/images/p201412162317463356.jpg', '爱与欲望之学园邪恶漫画：为什么要做', null, 'http://www.lebazi.com/n/20131126/6745.html', null, null, null, '爱与欲望之学园邪恶漫画：为什么要做', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:23:48', '1');
INSERT INTO `picture` VALUES ('272', '2013072622394051921374849580.jpg', null, 'http://www.lebazi.com/uploadpic/201307/26/2013072622394051921374849580.jpg', 'http://172.17.111.191:8080/images/2013072622394051921374849580.jpg', '色系军团漫画之好神仙：谢谢神仙爷爷帮我去除了黑点', null, 'http://www.lebazi.com/n/20130726/4910.html', null, null, null, '色系军团漫画之好神仙：谢谢神仙爷爷帮我去除了黑点', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:23:57', '1');
INSERT INTO `picture` VALUES ('273', 'p201311102034154330.jpg', null, 'http://www.lebazi.com/uploadpic/201311/10/p201311102034154330.jpg', 'http://172.17.111.191:8080/images/p201311102034154330.jpg', '无翼鸟邪恶漫画全集：脚踝_阿童木的苦衷没人懂', null, 'http://www.lebazi.com/n/20130726/4910.html', null, null, null, '无翼鸟邪恶漫画全集：脚踝_阿童木的苦衷没人懂', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:23:58', '1');
INSERT INTO `picture` VALUES ('274', 'p201403021809104707.jpg', null, 'http://www.lebazi.com/uploadpic/201403/02/p201403021809104707.jpg', 'http://172.17.111.191:8080/images/p201403021809104707.jpg', '不知火舞邪恶漫画集之地狱挑战：跟魔鬼打赌是一定输的，请切记', null, 'http://www.lebazi.com/n/20130726/4910.html', null, null, null, '不知火舞邪恶漫画集之地狱挑战：跟魔鬼打赌是一定输的，请切记', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:23:59', '1');
INSERT INTO `picture` VALUES ('275', 'p201407260040062685.jpg', null, 'http://www.lebazi.com/uploadpic/201407/26/p201407260040062685.jpg', 'http://172.17.111.191:8080/images/p201407260040062685.jpg', '内涵漫画全集_内涵漫画色系图片：遇见女鬼时的反应方法', null, 'http://www.lebazi.com/n/20130726/4910.html', null, null, null, '内涵漫画全集_内涵漫画色系图片：遇见女鬼时的反应方法', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:23:59', '1');
INSERT INTO `picture` VALUES ('276', 'p201410230024245965.jpg', null, 'http://www.lebazi.com/uploadpic/201410/23/p201410230024245965.jpg', 'http://172.17.111.191:8080/images/p201410230024245965.jpg', '思春期少女漫画_色小组二次元h邪恶漫画：那女孩丢的东西', null, 'http://www.lebazi.com/n/20130726/4910.html', null, null, null, '思春期少女漫画_色小组二次元h邪恶漫画：那女孩丢的东西', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:23:59', '1');
INSERT INTO `picture` VALUES ('277', 'p201403070210098206.gif', null, 'http://www.lebazi.com/uploadpic/201403/07/p201403070210098206.gif', 'http://172.17.111.191:8080/images/p201403070210098206.gif', '超邪恶成人gif动态图：撸丝哥几个爽去吧！', null, 'http://www.lebazi.com/n/20130726/4910.html', null, null, null, '超邪恶成人gif动态图：撸丝哥几个爽去吧！', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:24:06', '1');
INSERT INTO `picture` VALUES ('278', 'p201305262203319089.gif', null, 'http://www.lebazi.com/uploadpic/201305/26/p201305262203319089.gif', 'http://172.17.111.191:8080/images/p201305262203319089.gif', '禽兽走开，让我来...', null, 'http://www.lebazi.com/n/20130726/4910.html', null, null, null, '禽兽走开，让我来...', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:24:12', '1');
INSERT INTO `picture` VALUES ('279', 'p201411130029419083.jpg', null, 'http://www.lebazi.com/uploadpic/201411/13/p201411130029419083.jpg', 'http://172.17.111.191:8080/images/p201411130029419083.jpg', '色_大胸美女（第2期）麦苹果waiting 值得期待的大胸美女郎！', null, 'http://www.lebazi.com/n/20130726/4910.html', null, null, null, '色_大胸美女（第2期）麦苹果waiting 值得期待的大胸美女郎！', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:24:13', '1');
INSERT INTO `picture` VALUES ('280', 'p201305311152075844.gif', null, 'http://www.lebazi.com/uploadpic/201305/31/p201305311152075844.gif', 'http://172.17.111.191:8080/images/p201305311152075844.gif', '女人“胸”之间的对决', null, 'http://www.lebazi.com/n/20130726/4910.html', null, null, null, '女人“胸”之间的对决', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:24:19', '1');
INSERT INTO `picture` VALUES ('281', 'p201308112001221220.gif', null, 'http://www.lebazi.com/uploadpic/201308/11/p201308112001221220.gif', 'http://172.17.111.191:8080/images/p201308112001221220.gif', '国外雷人恶搞美女送啤酒gif动图', null, 'http://www.lebazi.com/n/20130726/4910.html', null, null, null, '国外雷人恶搞美女送啤酒gif动图', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:24:30', '1');
INSERT INTO `picture` VALUES ('282', 'p201409230232535843.jpg', null, 'http://www.lebazi.com/uploadpic/201409/23/p201409230232535843.jpg', 'http://172.17.111.191:8080/images/p201409230232535843.jpg', '无翼鸟少女h漫画_天才麻将少女h漫画：COS禁H', null, 'http://www.lebazi.com/n/20130726/4910.html', null, null, null, '无翼鸟少女h漫画_天才麻将少女h漫画：COS禁H', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:24:30', '1');
INSERT INTO `picture` VALUES ('283', 'p201403260201163892.jpg', null, 'http://www.lebazi.com/uploadpic/201403/26/p201403260201163892.jpg', 'http://172.17.111.191:8080/images/p201403260201163892.jpg', '邪恶漫画不知火舞_邪恶漫画爱丽丝学园：生儿子的秘诀，女人很兴奋就是男孩！', null, 'http://www.lebazi.com/n/20130726/4910.html', null, null, null, '邪恶漫画不知火舞_邪恶漫画爱丽丝学园：生儿子的秘诀，女人很兴奋就是男孩！', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:24:31', '1');
INSERT INTO `picture` VALUES ('284', 'p201410122141474341.jpg', null, 'http://www.lebazi.com/uploadpic/201410/12/p201410122141474341.jpg', 'http://172.17.111.191:8080/images/p201410122141474341.jpg', '大吴哥娱乐邪恶漫画_日本邪恶漫画大全：两个渡江的儒生', null, 'http://www.lebazi.com/n/20130726/4910.html', null, null, null, '大吴哥娱乐邪恶漫画_日本邪恶漫画大全：两个渡江的儒生', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:24:31', '1');
INSERT INTO `picture` VALUES ('285', 'p201408122354439717.jpg', null, 'http://www.lebazi.com/uploadpic/201408/12/p201408122354439717.jpg', 'http://172.17.111.191:8080/images/p201408122354439717.jpg', '梦龙y传系列_梦龙y传漫画全集第28话：我要变成人', null, 'http://www.lebazi.com/n/20130726/4910.html', null, null, null, '梦龙y传系列_梦龙y传漫画全集第28话：我要变成人', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:24:31', '1');
INSERT INTO `picture` VALUES ('286', 'p201412102147232829.jpg', null, 'http://www.lebazi.com/uploadpic/201412/10/p201412102147232829.jpg', 'http://172.17.111.191:8080/images/p201412102147232829.jpg', '韩国邪恶h漫画全集：爱的生鱼片组合', null, 'http://www.lebazi.com/n/20130726/4910.html', null, null, null, '韩国邪恶h漫画全集：爱的生鱼片组合', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:24:31', '1');
INSERT INTO `picture` VALUES ('287', '883121d8gw1en4dvuorjij20f02viqiy.jpg', null, 'http://ww2.sinaimg.cn/mw690/883121d8gw1en4dvuorjij20f02viqiy.jpg', 'http://172.17.111.191:8080/images/883121d8gw1en4dvuorjij20f02viqiy.jpg', '色小组二次元h邪恶漫画：旅馆的选择', null, 'http://www.lebazi.com/n/20141210/8832.html', null, null, null, '色小组二次元h邪恶漫画：旅馆的选择', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:24:35', '1');
INSERT INTO `picture` VALUES ('288', '201307072016051781373199365.jpg', null, 'http://www.lebazi.com/uploadpic/201307/07/201307072016051781373199365.jpg', 'http://172.17.111.191:8080/images/201307072016051781373199365.jpg', '色系军团漫画：相信欧巴，你个傻蛋，注定单身啊`', null, 'http://www.lebazi.com/n/20130707/4121.html', null, null, null, '色系军团漫画：相信欧巴，你个傻蛋，注定单身啊`', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:24:45', '1');
INSERT INTO `picture` VALUES ('289', '7cccd99bgw1ehurymudyfj20lw0xmdj8.jpg', null, 'http://ww2.sinaimg.cn/mw690/7cccd99bgw1ehurymudyfj20lw0xmdj8.jpg', 'http://172.17.111.191:8080/images/7cccd99bgw1ehurymudyfj20lw0xmdj8.jpg', '大吴哥邪恶少女漫画_少女h漫画邪恶篇：囚禁系列', null, 'http://www.lebazi.com/n/20140909/8461.html', null, null, null, '大吴哥邪恶少女漫画_少女h漫画邪恶篇：囚禁系列', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:24:45', '1');
INSERT INTO `picture` VALUES ('290', '883121d8gw1eh2h44xj6pj20f02boqd9.jpg', null, 'http://ww3.sinaimg.cn/mw690/883121d8gw1eh2h44xj6pj20f02boqd9.jpg', 'http://172.17.111.191:8080/images/883121d8gw1eh2h44xj6pj20f02boqd9.jpg', '邪恶漫画爱丽丝学园_无翼鸟邪恶漫画欲望：快速擦皮鞋', null, 'http://www.lebazi.com/n/20140618/7841.html', null, null, null, '邪恶漫画爱丽丝学园_无翼鸟邪恶漫画欲望：快速擦皮鞋', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:24:50', '1');
INSERT INTO `picture` VALUES ('291', 'p201311212353482157.jpg', null, 'http://www.lebazi.com/uploadpic/201311/21/p201311212353482157.jpg', 'http://172.17.111.191:8080/images/p201311212353482157.jpg', '初音未来h邪恶漫画：大姨妈你安心去死吧_换届', null, 'http://www.lebazi.com/n/20140618/7841.html', null, null, null, '初音未来h邪恶漫画：大姨妈你安心去死吧_换届', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:24:50', '1');
INSERT INTO `picture` VALUES ('292', 'p201307042033444252.gif', null, 'http://www.lebazi.com/uploadpic/201307/04/p201307042033444252.gif', 'http://172.17.111.191:8080/images/p201307042033444252.gif', '这是传说中的可乐导弹么~', null, 'http://www.lebazi.com/n/20140618/7841.html', null, null, null, '这是传说中的可乐导弹么~', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:25:00', '1');
INSERT INTO `picture` VALUES ('293', 'p201306172229168336.gif', null, 'http://www.lebazi.com/uploadpic/201306/17/p201306172229168336.gif', 'http://172.17.111.191:8080/images/p201306172229168336.gif', '大哥，你的动作好娴熟，好邪恶啊~看懂的人顶起~', null, 'http://www.lebazi.com/n/20140618/7841.html', null, null, null, '大哥，你的动作好娴熟，好邪恶啊~看懂的人顶起~', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:25:10', '1');
INSERT INTO `picture` VALUES ('294', 'p201410122326382230.jpg', null, 'http://www.lebazi.com/uploadpic/201410/12/p201410122326382230.jpg', 'http://172.17.111.191:8080/images/p201410122326382230.jpg', '韩国邪恶漫画“人鱼公主传”全集连载：第19集', null, 'http://www.lebazi.com/n/20140618/7841.html', null, null, null, '韩国邪恶漫画“人鱼公主传”全集连载：第19集', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:25:10', '1');
INSERT INTO `picture` VALUES ('295', 'p201307152301563995.jpg', null, 'http://www.lebazi.com/uploadpic/201307/15/p201307152301563995.jpg', 'http://172.17.111.191:8080/images/p201307152301563995.jpg', '色小组漫画：可以操控让人死的舞蹈笔记', null, 'http://www.lebazi.com/n/20140618/7841.html', null, null, null, '色小组漫画：可以操控让人死的舞蹈笔记', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:25:11', '1');
INSERT INTO `picture` VALUES ('296', 'p201306172150049326.gif', null, 'http://www.lebazi.com/uploadpic/201306/17/p201306172150049326.gif', 'http://172.17.111.191:8080/images/p201306172150049326.gif', '哥，快看，那边有个好好看的美女~', null, 'http://www.lebazi.com/n/20140618/7841.html', null, null, null, '哥，快看，那边有个好好看的美女~', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:25:13', '1');
INSERT INTO `picture` VALUES ('297', 'p201306112037348266.gif', null, 'http://www.lebazi.com/uploadpic/201306/11/p201306112037348266.gif', 'http://172.17.111.191:8080/images/p201306112037348266.gif', '哎呀，掉水坑了~~', null, 'http://www.lebazi.com/n/20140618/7841.html', null, null, null, '哎呀，掉水坑了~~', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:25:25', '1');
INSERT INTO `picture` VALUES ('298', 'p201403260202366365.jpg', null, 'http://www.lebazi.com/uploadpic/201403/26/p201403260202366365.jpg', 'http://172.17.111.191:8080/images/p201403260202366365.jpg', '邪恶漫画不知火舞全集_邪恶漫画御姐进行时：郎君的手真暖啊！', null, 'http://www.lebazi.com/n/20140618/7841.html', null, null, null, '邪恶漫画不知火舞全集_邪恶漫画御姐进行时：郎君的手真暖啊！', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:25:25', '1');
INSERT INTO `picture` VALUES ('299', 'p201407152312067283.jpg', null, 'http://www.lebazi.com/uploadpic/201407/15/p201407152312067283.jpg', 'http://172.17.111.191:8080/images/p201407152312067283.jpg', '暴走漫画吧_暴走漫画第一季动漫表情：真相', null, 'http://www.lebazi.com/n/20140618/7841.html', null, null, null, '暴走漫画吧_暴走漫画第一季动漫表情：真相', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:25:26', '1');
INSERT INTO `picture` VALUES ('300', 'p201307142057175852.gif', null, 'http://www.lebazi.com/uploadpic/201307/14/p201307142057175852.gif', 'http://172.17.111.191:8080/images/p201307142057175852.gif', '美女吃香蕉诱惑gif态图片', null, 'http://www.lebazi.com/n/20140618/7841.html', null, null, null, '美女吃香蕉诱惑gif态图片', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:25:31', '1');
INSERT INTO `picture` VALUES ('301', 'p201406172344389171.jpg', null, 'http://www.lebazi.com/uploadpic/201406/17/p201406172344389171.jpg', 'http://172.17.111.191:8080/images/p201406172344389171.jpg', '大吴哥娱乐邪恶漫画_色系军团邪恶漫画大全：没有过不了的火焰山', null, 'http://www.lebazi.com/n/20140618/7841.html', null, null, null, '大吴哥娱乐邪恶漫画_色系军团邪恶漫画大全：没有过不了的火焰山', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:25:32', '1');
INSERT INTO `picture` VALUES ('302', 'p201306202057548023.jpg', null, 'http://www.lebazi.com/uploadpic/201306/20/p201306202057548023.jpg', 'http://172.17.111.191:8080/images/p201306202057548023.jpg', '内涵漫画：向会长的儿子表白', null, 'http://www.lebazi.com/n/20140618/7841.html', null, null, null, '内涵漫画：向会长的儿子表白', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:25:32', '1');
INSERT INTO `picture` VALUES ('303', 'p201308222317145881.jpg', null, 'http://www.lebazi.com/uploadpic/201308/22/p201308222317145881.jpg', 'http://172.17.111.191:8080/images/p201308222317145881.jpg', '无翼鸟邪恶漫画全集：舒服极了_邪恶漫画全集', null, 'http://www.lebazi.com/n/20140618/7841.html', null, null, null, '无翼鸟邪恶漫画全集：舒服极了_邪恶漫画全集', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:25:32', '1');
INSERT INTO `picture` VALUES ('304', 'p201311080028243736.jpg', null, 'http://www.lebazi.com/uploadpic/201311/08/p201311080028243736.jpg', 'http://172.17.111.191:8080/images/p201311080028243736.jpg', '不知火舞邪恶漫画集：他的愿望_终于想到办法制住你了魔灯妹纸', null, 'http://www.lebazi.com/n/20140618/7841.html', null, null, null, '不知火舞邪恶漫画集：他的愿望_终于想到办法制住你了魔灯妹纸', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:25:33', '1');
INSERT INTO `picture` VALUES ('305', 'b5a3cd89gw1eja9zv4t70j20f10p5ae0.jpg', null, 'http://ww2.sinaimg.cn/mw690/b5a3cd89gw1eja9zv4t70j20f10p5ae0.jpg', 'http://172.17.111.191:8080/images/b5a3cd89gw1eja9zv4t70j20f10p5ae0.jpg', '梦龙y传系列_梦龙y传漫画全集第34话：奖励篇', null, 'http://www.lebazi.com/n/20140813/8257.html', null, null, null, '梦龙y传系列_梦龙y传漫画全集第34话：奖励篇', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:33:16', '1');
INSERT INTO `picture` VALUES ('306', '2013071420575583691373806675.gif', null, 'http://www.lebazi.com/uploadpic/201307/14/2013071420575583691373806675.gif', 'http://172.17.111.191:8080/images/2013071420575583691373806675.gif', '美女楼梯扭屁股gif动图', null, 'http://www.lebazi.com/n/20130714/4478.html', null, null, null, '美女楼梯扭屁股gif动图', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:34:13', '1');
INSERT INTO `picture` VALUES ('307', 'p201403060229493043.jpg', null, 'http://www.lebazi.com/uploadpic/201403/06/p201403060229493043.jpg', 'http://172.17.111.191:8080/images/p201403060229493043.jpg', '重口h邪恶漫画日本：正确的穿衣方式_初音未来h邪恶漫画', null, 'http://www.lebazi.com/n/20130714/4478.html', null, null, null, '重口h邪恶漫画日本：正确的穿衣方式_初音未来h邪恶漫画', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:34:14', '1');
INSERT INTO `picture` VALUES ('308', 'p201406172332528000.jpg', null, 'http://www.lebazi.com/uploadpic/201406/17/p201406172332528000.jpg', 'http://172.17.111.191:8080/images/p201406172332528000.jpg', '色系军团邪恶漫画_大吴哥娱乐邪恶漫画：男友是军人', null, 'http://www.lebazi.com/n/20130714/4478.html', null, null, null, '色系军团邪恶漫画_大吴哥娱乐邪恶漫画：男友是军人', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:34:14', '1');
INSERT INTO `picture` VALUES ('309', 'p201411172011445928.jpg', null, 'http://www.lebazi.com/uploadpic/201411/17/p201411172011445928.jpg', 'http://172.17.111.191:8080/images/p201411172011445928.jpg', '我们都爱黄段子：我不是金针菇，不是金针菇！', null, 'http://www.lebazi.com/n/20130714/4478.html', null, null, null, '我们都爱黄段子：我不是金针菇，不是金针菇！', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:34:14', '1');
INSERT INTO `picture` VALUES ('310', 'p201406270057069891.jpg', null, 'http://www.lebazi.com/uploadpic/201406/27/p201406270057069891.jpg', 'http://172.17.111.191:8080/images/p201406270057069891.jpg', '波多野结衣内涵图_百思不得姐内涵图：这堂写真课大家画的都很投入', null, 'http://www.lebazi.com/n/20130714/4478.html', null, null, null, '波多野结衣内涵图_百思不得姐内涵图：这堂写真课大家画的都很投入', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:34:14', '1');
INSERT INTO `picture` VALUES ('311', 'p201308212142096721.gif', null, 'http://www.lebazi.com/uploadpic/201308/21/p201308212142096721.gif', 'http://172.17.111.191:8080/images/p201308212142096721.gif', '巨胸美女gif动图：美女，不能再晃了再晃真的要掉了', null, 'http://www.lebazi.com/n/20130714/4478.html', null, null, null, '巨胸美女gif动图：美女，不能再晃了再晃真的要掉了', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:34:58', '1');
INSERT INTO `picture` VALUES ('312', 'p201408162351476937.jpg', null, 'http://www.lebazi.com/uploadpic/201408/16/p201408162351476937.jpg', 'http://172.17.111.191:8080/images/p201408162351476937.jpg', '邪恶漫画色系军团寡妇三代漫画第4集：过冬准备', null, 'http://www.lebazi.com/n/20130714/4478.html', null, null, null, '邪恶漫画色系军团寡妇三代漫画第4集：过冬准备', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:34:59', '1');
INSERT INTO `picture` VALUES ('313', 'p201406172345499904.jpg', null, 'http://www.lebazi.com/uploadpic/201406/17/p201406172345499904.jpg', 'http://172.17.111.191:8080/images/p201406172345499904.jpg', '二次元h邪恶漫画_少女邪恶漫画全集禁：无动于衷的脸', null, 'http://www.lebazi.com/n/20130714/4478.html', null, null, null, '二次元h邪恶漫画_少女邪恶漫画全集禁：无动于衷的脸', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:35:00', '1');
INSERT INTO `picture` VALUES ('314', 'p201311030222351287.gif', null, 'http://www.lebazi.com/uploadpic/201311/03/p201311030222351287.gif', 'http://172.17.111.191:8080/images/p201311030222351287.gif', '成人gif：情侣相互调戏进入电梯 接下来是什么情况？', null, 'http://www.lebazi.com/n/20130714/4478.html', null, null, null, '成人gif：情侣相互调戏进入电梯 接下来是什么情况？', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:37:37', '1');
INSERT INTO `picture` VALUES ('315', 'p201311161127514559.gif', null, 'http://www.lebazi.com/uploadpic/201311/16/p201311161127514559.gif', 'http://172.17.111.191:8080/images/p201311161127514559.gif', '爆笑gif动图：提前庆祝的悲剧故事，哈哈SB了吧？', null, 'http://www.lebazi.com/n/20130714/4478.html', null, null, null, '爆笑gif动图：提前庆祝的悲剧故事，哈哈SB了吧？', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:38:53', '1');
INSERT INTO `picture` VALUES ('316', 'p201307141848406085.jpg', null, 'http://www.lebazi.com/uploadpic/201307/14/p201307141848406085.jpg', 'http://172.17.111.191:8080/images/p201307141848406085.jpg', '色系军团漫画：杀手的法则', null, 'http://www.lebazi.com/n/20130714/4478.html', null, null, null, '色系军团漫画：杀手的法则', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:38:53', '1');
INSERT INTO `picture` VALUES ('317', 'p201306232149216246.jpg', null, 'http://www.lebazi.com/uploadpic/201306/23/p201306232149216246.jpg', 'http://172.17.111.191:8080/images/p201306232149216246.jpg', '[搞怪军团] 贞操锁', null, 'http://www.lebazi.com/n/20130714/4478.html', null, null, null, '[搞怪军团] 贞操锁', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:38:53', '1');
INSERT INTO `picture` VALUES ('318', 'p201307222145309525.jpg', null, 'http://www.lebazi.com/uploadpic/201307/22/p201307222145309525.jpg', 'http://172.17.111.191:8080/images/p201307222145309525.jpg', '色小组漫画之“求爱”：没钱的爱情可望而不可及', null, 'http://www.lebazi.com/n/20130714/4478.html', null, null, null, '色小组漫画之“求爱”：没钱的爱情可望而不可及', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:38:53', '1');
INSERT INTO `picture` VALUES ('319', 'p201307222140395701.jpg', null, 'http://www.lebazi.com/uploadpic/201307/22/p201307222140395701.jpg', 'http://172.17.111.191:8080/images/p201307222140395701.jpg', '色系军团漫画之“表白”：哥不要摸了好吗！', null, 'http://www.lebazi.com/n/20130714/4478.html', null, null, null, '色系军团漫画之“表白”：哥不要摸了好吗！', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:38:54', '1');
INSERT INTO `picture` VALUES ('320', 'p201311212356304869.jpg', null, 'http://www.lebazi.com/uploadpic/201311/21/p201311212356304869.jpg', 'http://172.17.111.191:8080/images/p201311212356304869.jpg', '色小组邪恶漫画全集：道长你别撸了，干正事吧_道士与女鬼', null, 'http://www.lebazi.com/n/20130714/4478.html', null, null, null, '色小组邪恶漫画全集：道长你别撸了，干正事吧_道士与女鬼', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:39:28', '1');
INSERT INTO `picture` VALUES ('321', 'p201307072041015220.jpg', null, 'http://www.lebazi.com/uploadpic/201307/07/p201307072041015220.jpg', 'http://172.17.111.191:8080/images/p201307072041015220.jpg', '邪恶漫画：报恩的小鹿，刚才那种感觉好棒，能不能再来一次？', null, 'http://www.lebazi.com/n/20130714/4478.html', null, null, null, '邪恶漫画：报恩的小鹿，刚才那种感觉好棒，能不能再来一次？', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:39:28', '1');
INSERT INTO `picture` VALUES ('322', '201307132318268811373728706.gif', null, 'http://www.lebazi.com/uploadpic/201307/13/201307132318268811373728706.gif', 'http://172.17.111.191:8080/images/201307132318268811373728706.gif', '美女gif：PP好滑呀', null, 'http://www.lebazi.com/n/20130713/4365.html', null, null, null, '美女gif：PP好滑呀', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:40:35', '1');
INSERT INTO `picture` VALUES ('323', '2013061522431346861371307393.gif', null, 'http://www.lebazi.com/uploadpic/201306/15/2013061522431346861371307393.gif', 'http://172.17.111.191:8080/images/2013061522431346861371307393.gif', '有其父必有其女，真是好有爱的两父女~', null, 'http://www.lebazi.com/n/20130615/1143.html', null, null, null, '有其父必有其女，真是好有爱的两父女~', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:41:27', '1');
INSERT INTO `picture` VALUES ('324', 'p201311292321175350.gif', null, 'http://www.lebazi.com/uploadpic/201311/29/p201311292321175350.gif', 'http://172.17.111.191:8080/images/p201311292321175350.gif', 'QQ表情 来亲我一个嘛', null, 'http://www.lebazi.com/n/20130615/1143.html', null, null, null, 'QQ表情 来亲我一个嘛', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:41:31', '1');
INSERT INTO `picture` VALUES ('325', 'p201410122329583784.jpg', null, 'http://www.lebazi.com/uploadpic/201410/12/p201410122329583784.jpg', 'http://172.17.111.191:8080/images/p201410122329583784.jpg', '韩国邪恶漫画“人鱼公主传”全集连载：第22集', null, 'http://www.lebazi.com/n/20130615/1143.html', null, null, null, '韩国邪恶漫画“人鱼公主传”全集连载：第22集', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:41:31', '1');
INSERT INTO `picture` VALUES ('326', 'p201410190504502253.jpg', null, 'http://www.lebazi.com/uploadpic/201410/19/p201410190504502253.jpg', 'http://172.17.111.191:8080/images/p201410190504502253.jpg', '色小组二次元h邪恶漫画_日本少女h邪恶漫画：搞上闺蜜的男人', null, 'http://www.lebazi.com/n/20130615/1143.html', null, null, null, '色小组二次元h邪恶漫画_日本少女h邪恶漫画：搞上闺蜜的男人', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:41:31', '1');
INSERT INTO `picture` VALUES ('327', 'p201307302213069479.gif', null, 'http://www.lebazi.com/uploadpic/201307/30/p201307302213069479.gif', 'http://172.17.111.191:8080/images/p201307302213069479.gif', '妩媚美女跳钢管舞gif动图', null, 'http://www.lebazi.com/n/20130615/1143.html', null, null, null, '妩媚美女跳钢管舞gif动图', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:42:05', '1');
INSERT INTO `picture` VALUES ('328', 'p201411162156124905.jpg', null, 'http://www.lebazi.com/uploadpic/201411/16/p201411162156124905.jpg', 'http://172.17.111.191:8080/images/p201411162156124905.jpg', '日本二次元邪恶漫画：医生鱼', null, 'http://www.lebazi.com/n/20130615/1143.html', null, null, null, '日本二次元邪恶漫画：医生鱼', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:42:05', '1');
INSERT INTO `picture` VALUES ('329', 'p201412012043407131.jpg', null, 'http://www.lebazi.com/uploadpic/201412/01/p201412012043407131.jpg', 'http://172.17.111.191:8080/images/p201412012043407131.jpg', '微博搞笑段子合集：看我成绩排名就知道有多少人考试', null, 'http://www.lebazi.com/n/20130615/1143.html', null, null, null, '微博搞笑段子合集：看我成绩排名就知道有多少人考试', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:42:05', '1');
INSERT INTO `picture` VALUES ('330', 'p201410122247509603.jpg', null, 'http://www.lebazi.com/uploadpic/201410/12/p201410122247509603.jpg', 'http://172.17.111.191:8080/images/p201410122247509603.jpg', '韩国邪恶漫画“人鱼公主传”全集连载：第04集', null, 'http://www.lebazi.com/n/20130615/1143.html', null, null, null, '韩国邪恶漫画“人鱼公主传”全集连载：第04集', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:42:05', '1');
INSERT INTO `picture` VALUES ('331', 'p201305231934254586.gif', null, 'http://www.lebazi.com/uploadpic/201305/23/p201305231934254586.gif', 'http://172.17.111.191:8080/images/p201305231934254586.gif', '邪恶内涵 gif动态图精选第四弹 激情四射(一)', null, 'http://www.lebazi.com/n/20130615/1143.html', null, null, null, '邪恶内涵 gif动态图精选第四弹 激情四射(一)', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:42:09', '1');
INSERT INTO `picture` VALUES ('332', 'p201308140055063254.jpg', null, 'http://www.lebazi.com/uploadpic/201308/14/p201308140055063254.jpg', 'http://172.17.111.191:8080/images/p201308140055063254.jpg', '搞笑视频集锦：最无节操的视频之暴走大件事', null, 'http://www.lebazi.com/n/20130615/1143.html', null, null, null, '搞笑视频集锦：最无节操的视频之暴走大件事', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:42:10', '1');
INSERT INTO `picture` VALUES ('333', 'p201406172234455091.jpg', null, 'http://www.lebazi.com/uploadpic/201406/17/p201406172234455091.jpg', 'http://172.17.111.191:8080/images/p201406172234455091.jpg', '日本邪恶漫画大全_少女h邪恶漫画：菊花的回忆', null, 'http://www.lebazi.com/n/20130615/1143.html', null, null, null, '日本邪恶漫画大全_少女h邪恶漫画：菊花的回忆', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:42:10', '1');
INSERT INTO `picture` VALUES ('334', 'p201309052203094810.jpg', null, 'http://www.lebazi.com/uploadpic/201309/05/p201309052203094810.jpg', 'http://172.17.111.191:8080/images/p201309052203094810.jpg', '重口h邪恶漫画日本：听话的孩子_邪恶漫画不知火舞', null, 'http://www.lebazi.com/n/20130615/1143.html', null, null, null, '重口h邪恶漫画日本：听话的孩子_邪恶漫画不知火舞', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:42:11', '1');
INSERT INTO `picture` VALUES ('335', 'p201406230142218444.jpg', null, 'http://www.lebazi.com/uploadpic/201406/23/p201406230142218444.jpg', 'http://172.17.111.191:8080/images/p201406230142218444.jpg', '乐张不入妖妖小精漫画全集_妖妖小精色系军团：提高业绩的方法', null, 'http://www.lebazi.com/n/20130615/1143.html', null, null, null, '乐张不入妖妖小精漫画全集_妖妖小精色系军团：提高业绩的方法', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:42:11', '1');
INSERT INTO `picture` VALUES ('336', 'p201311152151088534.jpg', null, 'http://www.lebazi.com/uploadpic/201311/15/p201311152151088534.jpg', 'http://172.17.111.191:8080/images/p201311152151088534.jpg', '初音未来h邪恶漫画：达成理想需要牺牲的东西太多了，妹纸你快起床骑我吧', null, 'http://www.lebazi.com/n/20130615/1143.html', null, null, null, '初音未来h邪恶漫画：达成理想需要牺牲的东西太多了，妹纸你快起床骑我吧', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:42:12', '1');
INSERT INTO `picture` VALUES ('337', 'p201410122139228345.jpg', null, 'http://www.lebazi.com/uploadpic/201410/12/p201410122139228345.jpg', 'http://172.17.111.191:8080/images/p201410122139228345.jpg', '18禁邪恶漫画全集_色小组二次元h邪恶漫画：光速', null, 'http://www.lebazi.com/n/20130615/1143.html', null, null, null, '18禁邪恶漫画全集_色小组二次元h邪恶漫画：光速', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:42:12', '1');
INSERT INTO `picture` VALUES ('338', '2014032301121875951395508338.gif', null, 'http://www.lebazi.com/uploadpic/201403/23/2014032301121875951395508338.gif', 'http://172.17.111.191:8080/images/2014032301121875951395508338.gif', '没内涵邪恶gif：小孩子看到大胸很惊讶gif动图', null, 'http://www.lebazi.com/n/20140323/7591.html', null, null, null, '没内涵邪恶gif：小孩子看到大胸很惊讶gif动图', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:42:28', '1');
INSERT INTO `picture` VALUES ('339', '2013072422021865261374674538.gif', null, 'http://www.lebazi.com/uploadpic/201307/24/2013072422021865261374674538.gif', 'http://172.17.111.191:8080/images/2013072422021865261374674538.gif', '胖MM的烦恼gif：有些事情像身上的肉肉一样总是甩不掉', null, 'http://www.lebazi.com/n/20130724/4810.html', null, null, null, '胖MM的烦恼gif：有些事情像身上的肉肉一样总是甩不掉', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:42:41', '1');
INSERT INTO `picture` VALUES ('340', '2014020902595775741391885997.gif', null, 'http://www.lebazi.com/uploadpic/201402/09/2014020902595775741391885997.gif', 'http://172.17.111.191:8080/images/2014020902595775741391885997.gif', '俩妹子恶搞xxoo姿势gif动图：你这个疯子，放开那个妹纸，让我来！', null, 'http://www.lebazi.com/n/20140209/7048.html', null, null, null, '俩妹子恶搞xxoo姿势gif动图：你这个疯子，放开那个妹纸，让我来！', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:42:52', '1');
INSERT INTO `picture` VALUES ('341', 'p201306132214401172.gif', null, 'http://www.lebazi.com/uploadpic/201306/13/p201306132214401172.gif', 'http://172.17.111.191:8080/images/p201306132214401172.gif', '哈哈。这青蛙也太搞了吧。', null, 'http://www.lebazi.com/n/20140209/7048.html', null, null, null, '哈哈。这青蛙也太搞了吧。', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:43:04', '1');
INSERT INTO `picture` VALUES ('342', 'p201308192334496591.jpg', null, 'http://www.lebazi.com/uploadpic/201308/19/p201308192334496591.jpg', 'http://172.17.111.191:8080/images/p201308192334496591.jpg', '搞笑视频笑死人：日本荒诞奇葩广告大集合一次看个够_国外搞笑视频', null, 'http://www.lebazi.com/n/20140209/7048.html', null, null, null, '搞笑视频笑死人：日本荒诞奇葩广告大集合一次看个够_国外搞笑视频', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:43:04', '1');
INSERT INTO `picture` VALUES ('343', 'p201306301440295768.jpg', null, 'http://www.lebazi.com/uploadpic/201306/30/p201306301440295768.jpg', 'http://172.17.111.191:8080/images/p201306301440295768.jpg', '色系军团之“好想成为她的座椅”', null, 'http://www.lebazi.com/n/20140209/7048.html', null, null, null, '色系军团之“好想成为她的座椅”', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:43:05', '1');
INSERT INTO `picture` VALUES ('344', 'p201406262227307449.jpg', null, 'http://www.lebazi.com/uploadpic/201406/26/p201406262227307449.jpg', 'http://172.17.111.191:8080/images/p201406262227307449.jpg', '九妖成人内涵图：正常男人不能忍受的刑法，这可是真要命啊，除非阳痿~', null, 'http://www.lebazi.com/n/20140209/7048.html', null, null, null, '九妖成人内涵图：正常男人不能忍受的刑法，这可是真要命啊，除非阳痿~', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:43:05', '1');
INSERT INTO `picture` VALUES ('345', 'p201305251208154158.gif', null, 'http://www.lebazi.com/uploadpic/201305/25/p201305251208154158.gif', 'http://172.17.111.191:8080/images/p201305251208154158.gif', '主人，去哪里，带上我吧。', null, 'http://www.lebazi.com/n/20140209/7048.html', null, null, null, '主人，去哪里，带上我吧。', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:43:15', '1');
INSERT INTO `picture` VALUES ('346', 'b5a3cd89gw1egawfaou2bg209z06n1kx.gif', null, 'http://ww1.sinaimg.cn/mw690/b5a3cd89gw1egawfaou2bg209z06n1kx.gif', 'http://172.17.111.191:8080/images/b5a3cd89gw1egawfaou2bg209z06n1kx.gif', '精选邪恶内涵诱惑美女Gif动态图片大全', null, 'http://www.lebazi.com/n/20140209/7048.html', null, null, null, '精选邪恶内涵诱惑美女Gif动态图片大全', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:43:17', '1');
INSERT INTO `picture` VALUES ('347', 'p201406130023469946.jpg', null, 'http://www.lebazi.com/uploadpic/201406/13/p201406130023469946.jpg', 'http://172.17.111.191:8080/images/p201406130023469946.jpg', '少女爱情在线邪恶漫画_恋姐倾心h漫画：摄影师先生，内涵漫画色系图片', null, 'http://www.lebazi.com/n/20140209/7048.html', null, null, null, '少女爱情在线邪恶漫画_恋姐倾心h漫画：摄影师先生，内涵漫画色系图片', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:43:17', '1');
INSERT INTO `picture` VALUES ('348', 'p201307152302327165.jpg', null, 'http://www.lebazi.com/uploadpic/201307/15/p201307152302327165.jpg', 'http://172.17.111.191:8080/images/p201307152302327165.jpg', '邪恶漫画：官老爷上位遇到处男冤魂', null, 'http://www.lebazi.com/n/20140209/7048.html', null, null, null, '邪恶漫画：官老爷上位遇到处男冤魂', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:43:17', '1');
INSERT INTO `picture` VALUES ('349', 'p201307141851013759.jpg', null, 'http://www.lebazi.com/uploadpic/201307/14/p201307141851013759.jpg', 'http://172.17.111.191:8080/images/p201307141851013759.jpg', '色小组漫画：北斗七星点穴法', null, 'http://www.lebazi.com/n/20140209/7048.html', null, null, null, '色小组漫画：北斗七星点穴法', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:43:17', '1');
INSERT INTO `picture` VALUES ('350', 'p201408170010185100.jpg', null, 'http://www.lebazi.com/uploadpic/201408/17/p201408170010185100.jpg', 'http://172.17.111.191:8080/images/p201408170010185100.jpg', '邪恶漫画色系军团寡妇三代漫画第20集：前情回顾', null, 'http://www.lebazi.com/n/20140209/7048.html', null, null, null, '邪恶漫画色系军团寡妇三代漫画第20集：前情回顾', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:43:18', '1');
INSERT INTO `picture` VALUES ('351', 'p201406232337449719.jpg', null, 'http://www.lebazi.com/uploadpic/201406/23/p201406232337449719.jpg', 'http://172.17.111.191:8080/images/p201406232337449719.jpg', '妖妖小精色系军团2次元少女邪恶漫画（第一章）：男女接吻', null, 'http://www.lebazi.com/n/20140209/7048.html', null, null, null, '妖妖小精色系军团2次元少女邪恶漫画（第一章）：男女接吻', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:43:18', '1');
INSERT INTO `picture` VALUES ('352', 'p201411162140376117.jpg', null, 'http://www.lebazi.com/uploadpic/201411/16/p201411162140376117.jpg', 'http://172.17.111.191:8080/images/p201411162140376117.jpg', '邪恶漫画少女漫画：树神', null, 'http://www.lebazi.com/n/20140209/7048.html', null, null, null, '邪恶漫画少女漫画：树神', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:43:18', '1');
INSERT INTO `picture` VALUES ('353', '2013080321450775411375537507.gif', null, 'http://www.lebazi.com/uploadpic/201308/03/2013080321450775411375537507.gif', 'http://172.17.111.191:8080/images/2013080321450775411375537507.gif', '雷人gif动图：好大的勺子啊', null, 'http://www.lebazi.com/n/20130803/5187.html', null, null, null, '雷人gif动图：好大的勺子啊', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:43:32', '1');
INSERT INTO `picture` VALUES ('354', '2013072421584584561374674325.gif', null, 'http://www.lebazi.com/uploadpic/201307/24/2013072421584584561374674325.gif', 'http://172.17.111.191:8080/images/2013072421584584561374674325.gif', '呼啦圈的创意玩法gif动图', null, 'http://www.lebazi.com/n/20130724/4805.html', null, null, null, '呼啦圈的创意玩法gif动图', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:43:44', '1');
INSERT INTO `picture` VALUES ('355', '2013061120504423081370955044.gif', null, 'http://www.lebazi.com/uploadpic/201306/11/2013061120504423081370955044.gif', 'http://172.17.111.191:8080/images/2013061120504423081370955044.gif', '哇，这水好好玩的~~', null, 'http://www.lebazi.com/n/20130611/1011.html', null, null, null, '哇，这水好好玩的~~', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:43:53', '1');
INSERT INTO `picture` VALUES ('356', 'p201306172217263120.gif', null, 'http://www.lebazi.com/uploadpic/201306/17/p201306172217263120.gif', 'http://172.17.111.191:8080/images/p201306172217263120.gif', '真想像阿狸一样无忧无虑~~', null, 'http://www.lebazi.com/n/20130611/1011.html', null, null, null, '真想像阿狸一样无忧无虑~~', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:43:53', '1');
INSERT INTO `picture` VALUES ('357', 'p201307141841597183.jpg', null, 'http://www.lebazi.com/uploadpic/201307/14/p201307141841597183.jpg', 'http://172.17.111.191:8080/images/p201307141841597183.jpg', '18禁漫画：另有目的', null, 'http://www.lebazi.com/n/20130611/1011.html', null, null, null, '18禁漫画：另有目的', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:43:53', '1');
INSERT INTO `picture` VALUES ('358', 'p201310281048087089.jpg', null, 'http://www.lebazi.com/uploadpic/201310/28/p201310281048087089.jpg', 'http://172.17.111.191:8080/images/p201310281048087089.jpg', '不知火舞邪恶漫画集：这个减肥套餐绝对管用太强悍了_快速减肥', null, 'http://www.lebazi.com/n/20130611/1011.html', null, null, null, '不知火舞邪恶漫画集：这个减肥套餐绝对管用太强悍了_快速减肥', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:43:54', '1');
INSERT INTO `picture` VALUES ('359', 'p201308122306098988.jpg', null, 'http://www.lebazi.com/uploadpic/201308/12/p201308122306098988.jpg', 'http://172.17.111.191:8080/images/p201308122306098988.jpg', '不知火舞邪恶漫画集之摩天楼之爱', null, 'http://www.lebazi.com/n/20130611/1011.html', null, null, null, '不知火舞邪恶漫画集之摩天楼之爱', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:43:54', '1');
INSERT INTO `picture` VALUES ('360', 'p201408060022483575.jpg', null, 'http://www.lebazi.com/uploadpic/201408/06/p201408060022483575.jpg', 'http://172.17.111.191:8080/images/p201408060022483575.jpg', '少女邪恶漫画大全_性感动漫美女邪恶篇：姐弟情深第一期', null, 'http://www.lebazi.com/n/20130611/1011.html', null, null, null, '少女邪恶漫画大全_性感动漫美女邪恶篇：姐弟情深第一期', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:43:54', '1');
INSERT INTO `picture` VALUES ('361', 'p201308132300125175.jpg', null, 'http://www.lebazi.com/uploadpic/201308/13/p201308132300125175.jpg', 'http://172.17.111.191:8080/images/p201308132300125175.jpg', '不知火舞邪恶漫画内涵图片之要想吃香蕉就得先刨皮', null, 'http://www.lebazi.com/n/20130611/1011.html', null, null, null, '不知火舞邪恶漫画内涵图片之要想吃香蕉就得先刨皮', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:43:55', '1');
INSERT INTO `picture` VALUES ('362', 'p201403190023073578.jpg', null, 'http://www.lebazi.com/uploadpic/201403/19/p201403190023073578.jpg', 'http://172.17.111.191:8080/images/p201403190023073578.jpg', '大吴哥娱乐邪恶漫画_重口h邪恶漫画日本：气功之大哥你太损了', null, 'http://www.lebazi.com/n/20130611/1011.html', null, null, null, '大吴哥娱乐邪恶漫画_重口h邪恶漫画日本：气功之大哥你太损了', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:43:56', '1');
INSERT INTO `picture` VALUES ('363', 'p201307022151434062.jpg', null, 'http://www.lebazi.com/uploadpic/201307/02/p201307022151434062.jpg', 'http://172.17.111.191:8080/images/p201307022151434062.jpg', '色系军团之“人鱼公主传”结婚之前千万不要相信他（二）~', null, 'http://www.lebazi.com/n/20130611/1011.html', null, null, null, '色系军团之“人鱼公主传”结婚之前千万不要相信他（二）~', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:43:56', '1');
INSERT INTO `picture` VALUES ('364', '005xyUJsjw1ejxykaic3fg307r05yqhw.gif', null, 'http://ww4.sinaimg.cn/mw690/005xyUJsjw1ejxykaic3fg307r05yqhw.gif', 'http://172.17.111.191:8080/images/005xyUJsjw1ejxykaic3fg307r05yqhw.gif', '很黄很暴力 啪啪啪打妹子屁屁GIF动态图精选：禽兽快让开让我来', null, 'http://www.lebazi.com/n/20130611/1011.html', null, null, null, '很黄很暴力 啪啪啪打妹子屁屁GIF动态图精选：禽兽快让开让我来', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:43:56', '1');
INSERT INTO `picture` VALUES ('365', 'p201407260053576907.jpg', null, 'http://www.lebazi.com/uploadpic/201407/26/p201407260053576907.jpg', 'http://172.17.111.191:8080/images/p201407260053576907.jpg', '18进禁邪恶漫画全集_日本邪恶漫画色系：饭店fateve', null, 'http://www.lebazi.com/n/20130611/1011.html', null, null, null, '18进禁邪恶漫画全集_日本邪恶漫画色系：饭店fateve', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:43:56', '1');
INSERT INTO `picture` VALUES ('366', 'p201311262239133765.jpg', null, 'http://www.lebazi.com/uploadpic/201311/26/p201311262239133765.jpg', 'http://172.17.111.191:8080/images/p201311262239133765.jpg', '日本邪恶漫画爱丽丝学园：电鳗会变成什么呢？_魔法棍', null, 'http://www.lebazi.com/n/20130611/1011.html', null, null, null, '日本邪恶漫画爱丽丝学园：电鳗会变成什么呢？_魔法棍', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:43:57', '1');
INSERT INTO `picture` VALUES ('367', 'p201407060936203510.jpg', null, 'http://www.lebazi.com/uploadpic/201407/06/p201407060936203510.jpg', 'http://172.17.111.191:8080/images/p201407060936203510.jpg', '少女邪恶漫画全集禁_邪恶漫画爱丽丝学园：那个男人那个女人', null, 'http://www.lebazi.com/n/20130611/1011.html', null, null, null, '少女邪恶漫画全集禁_邪恶漫画爱丽丝学园：那个男人那个女人', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:43:58', '1');
INSERT INTO `picture` VALUES ('368', 'p201408122315089120.jpg', null, 'http://www.lebazi.com/uploadpic/201408/12/p201408122315089120.jpg', 'http://172.17.111.191:8080/images/p201408122315089120.jpg', '梦龙y传系列_梦龙y传漫画全集第15话：美杜莎的悲哀', null, 'http://www.lebazi.com/n/20130611/1011.html', null, null, null, '梦龙y传系列_梦龙y传漫画全集第15话：美杜莎的悲哀', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:43:59', '1');
INSERT INTO `picture` VALUES ('369', 'p201307152250027907.jpg', null, 'http://www.lebazi.com/uploadpic/201307/15/p201307152250027907.jpg', 'http://172.17.111.191:8080/images/p201307152250027907.jpg', '色系军团漫画：举手击掌习惯成自然', null, 'http://www.lebazi.com/n/20130611/1011.html', null, null, null, '色系军团漫画：举手击掌习惯成自然', null, '2', '1', '0', '0', '搞笑GIF', '2015-01-28 10:43:59', '1');
INSERT INTO `picture` VALUES ('370', '883121d8gw1ei1pakowdgj20f02cgn8c.jpg', null, 'http://ww2.sinaimg.cn/mw690/883121d8gw1ei1pakowdgj20f02cgn8c.jpg', 'http://172.17.111.191:8080/images/883121d8gw1ei1pakowdgj20f02cgn8c.jpg', '色系军团邪恶漫画_大吴哥娱乐邪恶漫画：对自由的意志', null, 'http://www.lebazi.com/n/20140706/8010.html', null, null, null, '色系军团邪恶漫画_大吴哥娱乐邪恶漫画：对自由的意志', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:44:15', '1');
INSERT INTO `picture` VALUES ('371', '2013090723550062821378569300.jpg', null, 'http://www.lebazi.com/uploadpic/201309/07/2013090723550062821378569300.jpg', 'http://172.17.111.191:8080/images/2013090723550062821378569300.jpg', '18进禁邪恶漫画：检查门_不知火舞邪恶漫画集', null, 'http://www.lebazi.com/n/20130907/5957.html', null, null, null, '18进禁邪恶漫画：检查门_不知火舞邪恶漫画集', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:44:23', '1');
INSERT INTO `picture` VALUES ('372', 'p201408122213322124.jpg', null, 'http://www.lebazi.com/uploadpic/201408/12/p201408122213322124.jpg', 'http://172.17.111.191:8080/images/p201408122213322124.jpg', '梦龙y传系列_梦龙y传漫画全集第3话：使命的开始', null, 'http://www.lebazi.com/n/20130907/5957.html', null, null, null, '梦龙y传系列_梦龙y传漫画全集第3话：使命的开始', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:44:23', '1');
INSERT INTO `picture` VALUES ('373', '005xtGGbgw1ehi9q6sec3g308s064hdu.gif', null, 'http://ww1.sinaimg.cn/mw690/005xtGGbgw1ehi9q6sec3g308s064hdu.gif', 'http://172.17.111.191:8080/images/005xtGGbgw1ehi9q6sec3g308s064hdu.gif', '各种雷人牛人搞笑gif动态内涵图片：搞笑gif图片笑死人图片合集（第五期）', null, 'http://www.lebazi.com/n/20130907/5957.html', null, null, null, '各种雷人牛人搞笑gif动态内涵图片：搞笑gif图片笑死人图片合集（第五期）', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:44:25', '1');
INSERT INTO `picture` VALUES ('374', 'p201307112035179210.gif', null, 'http://www.lebazi.com/uploadpic/201307/11/p201307112035179210.gif', 'http://172.17.111.191:8080/images/p201307112035179210.gif', '好基友调情gif动图：真的是激情四色啊', null, 'http://www.lebazi.com/n/20130907/5957.html', null, null, null, '好基友调情gif动图：真的是激情四色啊', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:44:32', '1');
INSERT INTO `picture` VALUES ('375', 'p201309072356527202.jpg', null, 'http://www.lebazi.com/uploadpic/201309/07/p201309072356527202.jpg', 'http://172.17.111.191:8080/images/p201309072356527202.jpg', '初音未来h邪恶漫画：过冬准备寡妇三代系列', null, 'http://www.lebazi.com/n/20130907/5957.html', null, null, null, '初音未来h邪恶漫画：过冬准备寡妇三代系列', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:44:32', '1');
INSERT INTO `picture` VALUES ('376', 'p201311120047348010.jpg', null, 'http://www.lebazi.com/uploadpic/201311/12/p201311120047348010.jpg', 'http://172.17.111.191:8080/images/p201311120047348010.jpg', '优酷搞笑视频：唐僧不过光棍节,光棍节每年都过!', null, 'http://www.lebazi.com/n/20130907/5957.html', null, null, null, '优酷搞笑视频：唐僧不过光棍节,光棍节每年都过!', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:44:32', '1');
INSERT INTO `picture` VALUES ('377', 'p201307151944201259.gif', null, 'http://www.lebazi.com/uploadpic/201307/15/p201307151944201259.gif', 'http://172.17.111.191:8080/images/p201307151944201259.gif', '美女胸gif动图：这是我觉得我身上最自豪的', null, 'http://www.lebazi.com/n/20130907/5957.html', null, null, null, '美女胸gif动图：这是我觉得我身上最自豪的', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:44:41', '1');
INSERT INTO `picture` VALUES ('378', 'p201305301149285786.jpg', null, 'http://www.lebazi.com/uploadpic/201305/30/p201305301149285786.jpg', 'http://172.17.111.191:8080/images/p201305301149285786.jpg', '色系军团：之礼貌的男生', null, 'http://www.lebazi.com/n/20130907/5957.html', null, null, null, '色系军团：之礼貌的男生', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:44:41', '1');
INSERT INTO `picture` VALUES ('379', 'p201407060927093174.jpg', null, 'http://www.lebazi.com/uploadpic/201407/06/p201407060927093174.jpg', 'http://172.17.111.191:8080/images/p201407060927093174.jpg', '二次元h邪恶漫画_动漫h邪恶漫画：内衣打猎', null, 'http://www.lebazi.com/n/20130907/5957.html', null, null, null, '二次元h邪恶漫画_动漫h邪恶漫画：内衣打猎', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:44:42', '1');
INSERT INTO `picture` VALUES ('380', 'p201408170000412615.jpg', null, 'http://www.lebazi.com/uploadpic/201408/17/p201408170000412615.jpg', 'http://172.17.111.191:8080/images/p201408170000412615.jpg', '邪恶漫画色系军团寡妇三代漫画第10集：春香传', null, 'http://www.lebazi.com/n/20130907/5957.html', null, null, null, '邪恶漫画色系军团寡妇三代漫画第10集：春香传', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:44:42', '1');
INSERT INTO `picture` VALUES ('381', 'p201401030148511947.jpg', null, 'http://www.lebazi.com/uploadpic/201401/03/p201401030148511947.jpg', 'http://172.17.111.191:8080/images/p201401030148511947.jpg', '日本邪恶漫画爱丽丝学园：哥们你记住梦想使人伟大呀_愿望', null, 'http://www.lebazi.com/n/20130907/5957.html', null, null, null, '日本邪恶漫画爱丽丝学园：哥们你记住梦想使人伟大呀_愿望', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:44:42', '1');
INSERT INTO `picture` VALUES ('382', '2013051917214567991368955305.jpg', null, 'http://www.lebazi.com/uploadpic/201305/19/2013051917214567991368955305.jpg', 'http://172.17.111.191:8080/images/2013051917214567991368955305.jpg', '邪恶漫画：师傅和鼻孔都悲剧了', null, 'http://www.lebazi.com/n/20130519/52.html', null, null, null, '邪恶漫画：师傅和鼻孔都悲剧了', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:44:49', '1');
INSERT INTO `picture` VALUES ('383', 'p201306262242414714.gif', null, 'http://www.lebazi.com/uploadpic/201306/26/p201306262242414714.gif', 'http://172.17.111.191:8080/images/p201306262242414714.gif', '妹子，你这是意犹未尽吗？', null, 'http://www.lebazi.com/n/20130519/52.html', null, null, null, '妹子，你这是意犹未尽吗？', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:44:52', '1');
INSERT INTO `picture` VALUES ('384', 'p201311022345167406.jpg', null, 'http://www.lebazi.com/uploadpic/201311/02/p201311022345167406.jpg', 'http://172.17.111.191:8080/images/p201311022345167406.jpg', '18进禁邪恶h漫画：等待的美学_这个随机应变代价太大了', null, 'http://www.lebazi.com/n/20130519/52.html', null, null, null, '18进禁邪恶h漫画：等待的美学_这个随机应变代价太大了', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:44:53', '1');
INSERT INTO `picture` VALUES ('385', 'p201306232037031071.gif', null, 'http://www.lebazi.com/uploadpic/201306/23/p201306232037031071.gif', 'http://172.17.111.191:8080/images/p201306232037031071.gif', '妹子，你到底吃了啥子东西，让你如此的潮喷！', null, 'http://www.lebazi.com/n/20130519/52.html', null, null, null, '妹子，你到底吃了啥子东西，让你如此的潮喷！', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:44:59', '1');
INSERT INTO `picture` VALUES ('386', 'p201308212139376723.gif', null, 'http://www.lebazi.com/uploadpic/201308/21/p201308212139376723.gif', 'http://172.17.111.191:8080/images/p201308212139376723.gif', '搞笑gif动态图片：喵星人草泥马敢打我', null, 'http://www.lebazi.com/n/20130519/52.html', null, null, null, '搞笑gif动态图片：喵星人草泥马敢打我', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:45:12', '1');
INSERT INTO `picture` VALUES ('387', 'p201309202319348355.jpg', null, 'http://www.lebazi.com/uploadpic/201309/20/p201309202319348355.jpg', 'http://172.17.111.191:8080/images/p201309202319348355.jpg', '不知火舞邪恶漫画集：紧急治疗_邪恶漫画色系图片', null, 'http://www.lebazi.com/n/20130519/52.html', null, null, null, '不知火舞邪恶漫画集：紧急治疗_邪恶漫画色系图片', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:45:13', '1');
INSERT INTO `picture` VALUES ('388', 'p201307112038193259.gif', null, 'http://www.lebazi.com/uploadpic/201307/11/p201307112038193259.gif', 'http://172.17.111.191:8080/images/p201307112038193259.gif', '运动gif动图：这下真的是菊花开了蛋蛋碎了~', null, 'http://www.lebazi.com/n/20130519/52.html', null, null, null, '运动gif动图：这下真的是菊花开了蛋蛋碎了~', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:45:22', '1');
INSERT INTO `picture` VALUES ('389', 'p201402270022253513.gif', null, 'http://www.lebazi.com/uploadpic/201402/27/p201402270022253513.gif', 'http://172.17.111.191:8080/images/p201402270022253513.gif', '一组诱惑的韩国女艺人热舞卖萌gif动图', null, 'http://www.lebazi.com/n/20130519/52.html', null, null, null, '一组诱惑的韩国女艺人热舞卖萌gif动图', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:45:37', '1');
INSERT INTO `picture` VALUES ('390', 'p201306012000526378.gif', null, 'http://www.lebazi.com/uploadpic/201306/01/p201306012000526378.gif', 'http://172.17.111.191:8080/images/p201306012000526378.gif', '我实在忍不住笑了！', null, 'http://www.lebazi.com/n/20130519/52.html', null, null, null, '我实在忍不住笑了！', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:45:46', '1');
INSERT INTO `picture` VALUES ('391', 'p201305281032016263.gif', null, 'http://www.lebazi.com/uploadpic/201305/28/p201305281032016263.gif', 'http://172.17.111.191:8080/images/p201305281032016263.gif', 'QQ表情的战争！', null, 'http://www.lebazi.com/n/20130519/52.html', null, null, null, 'QQ表情的战争！', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:45:51', '1');
INSERT INTO `picture` VALUES ('392', 'p201406172324518399.jpg', null, 'http://www.lebazi.com/uploadpic/201406/17/p201406172324518399.jpg', 'http://172.17.111.191:8080/images/p201406172324518399.jpg', '大吴哥娱乐网搞笑漫画：美女请问你的腹肌是怎么练出来的？', null, 'http://www.lebazi.com/n/20130519/52.html', null, null, null, '大吴哥娱乐网搞笑漫画：美女请问你的腹肌是怎么练出来的？', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:45:51', '1');
INSERT INTO `picture` VALUES ('393', 'p201407060924343902.jpg', null, 'http://www.lebazi.com/uploadpic/201407/06/p201407060924343902.jpg', 'http://172.17.111.191:8080/images/p201407060924343902.jpg', '爱丽丝学院邪恶漫画_超邪恶漫画色系图片：西游的修行', null, 'http://www.lebazi.com/n/20130519/52.html', null, null, null, '爱丽丝学院邪恶漫画_超邪恶漫画色系图片：西游的修行', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:45:52', '1');
INSERT INTO `picture` VALUES ('394', 'p201406230121157117.jpg', null, 'http://www.lebazi.com/uploadpic/201406/23/p201406230121157117.jpg', 'http://172.17.111.191:8080/images/p201406230121157117.jpg', '乐张不入妖妖小精漫画全集_妖妖小精色系军团：交往初期', null, 'http://www.lebazi.com/n/20130519/52.html', null, null, null, '乐张不入妖妖小精漫画全集_妖妖小精色系军团：交往初期', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:45:52', '1');
INSERT INTO `picture` VALUES ('395', 'b5a3cd89gw1eiqn2w7p48j20ca0hs0ve.jpg', null, 'http://ww4.sinaimg.cn/mw690/b5a3cd89gw1eiqn2w7p48j20ca0hs0ve.jpg', 'http://172.17.111.191:8080/images/b5a3cd89gw1eiqn2w7p48j20ca0hs0ve.jpg', '少女漫画邪恶篇_无翼鸟一库邪恶h漫画：电车里的双飞', null, 'http://www.lebazi.com/n/20140727/8151.html', null, null, null, '少女漫画邪恶篇_无翼鸟一库邪恶h漫画：电车里的双飞', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:45:53', '1');
INSERT INTO `picture` VALUES ('396', '005E1W3ggw1ehkeqrizgrj30fa16gdr3.jpg', null, 'http://ww4.sinaimg.cn/mw690/005E1W3ggw1ehkeqrizgrj30fa16gdr3.jpg', 'http://172.17.111.191:8080/images/005E1W3ggw1ehkeqrizgrj30fa16gdr3.jpg', '乐张不入妖妖小精漫画全集_妖妖小精色系军团：稻草人施法', null, 'http://www.lebazi.com/n/20140623/7879.html', null, null, null, '乐张不入妖妖小精漫画全集_妖妖小精色系军团：稻草人施法', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:45:57', '1');
INSERT INTO `picture` VALUES ('397', 'e6b95decjw1enlxy93krkj20m80xftcz.jpg', null, 'http://ww1.sinaimg.cn/mw600/e6b95decjw1enlxy93krkj20m80xftcz.jpg', 'http://172.17.111.191:8080/images/e6b95decjw1enlxy93krkj20m80xftcz.jpg', '超美嫩模@金小小猫儿圣诞私房照写真全集 附其它生活写真照', null, 'http://www.lebazi.com/n/20150106/8895.html', null, null, null, '超美嫩模@金小小猫儿圣诞私房照写真全集 附其它生活写真照', null, '2', '1', '0', '0', '雷人网事', '2015-01-28 10:48:18', '1');
INSERT INTO `picture` VALUES ('398', '7f232787gw1ene3x05na3j20f02gpdq4.jpg', null, 'http://ww3.sinaimg.cn/mw690/7f232787gw1ene3x05na3j20f02gpdq4.jpg', 'http://172.17.111.191:8080/images/7f232787gw1ene3x05na3j20f02gpdq4.jpg', '二次元h邪恶漫画：可歪曲的手机', null, 'http://www.lebazi.com/n/20150106/8906.html', null, null, null, '二次元h邪恶漫画：可歪曲的手机', null, '2', '1', '0', '0', '邪恶漫画', '2015-01-28 10:48:52', '1');

-- ----------------------------
-- Table structure for picture_type
-- ----------------------------
DROP TABLE IF EXISTS `picture_type`;
CREATE TABLE `picture_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of picture_type
-- ----------------------------
INSERT INTO `picture_type` VALUES ('1', '美女gif');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(64) DEFAULT '',
  `email` varchar(512) NOT NULL,
  `user_password` varchar(64) NOT NULL DEFAULT 'e10adc3949ba59abbe56e057f20f883e',
  `regist_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `login_count` int(11) NOT NULL DEFAULT '1',
  `last_login_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_delete` char(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'royzhang', 'bolobeach@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '2015-01-02 16:13:43', '74', '2015-02-02 10:22:17', '2015-01-02 16:13:43', '1');
INSERT INTO `users` VALUES ('2', 'bolobeach', '390125214@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '2015-01-13 14:12:24', '1', '2015-01-13 14:12:24', '2015-01-13 14:12:24', '1');
