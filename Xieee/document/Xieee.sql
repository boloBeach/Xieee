/*
Navicat MySQL Data Transfer

Source Server         : localhost for mysql
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : xieee

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-01-02 17:05:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for about_as
-- ----------------------------
DROP TABLE IF EXISTS `about_as`;
CREATE TABLE `about_as` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`constact_name`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`email`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'bolobeach@gmail.com' ,
`tele_phone`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '110' ,
`address`  varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of about_as
-- ----------------------------
BEGIN;
INSERT INTO `about_as` VALUES ('1', '张兵，孙武斌，李华', 'bolobeach@gmail.com，lihuabest@gmail.com,barrysun@gmail.com', '110', '四川省成都市芳草街1号');
COMMIT;

-- ----------------------------
-- Table structure for blogroll
-- ----------------------------
DROP TABLE IF EXISTS `blogroll`;
CREATE TABLE `blogroll` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`url`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'http://www.baidu.com' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of blogroll
-- ----------------------------
BEGIN;
INSERT INTO `blogroll` VALUES ('1', '百度贴吧', 'http://tieba.baidu.com/');
COMMIT;

-- ----------------------------
-- Table structure for catalog
-- ----------------------------
DROP TABLE IF EXISTS `catalog`;
CREATE TABLE `catalog` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`parent_catalog_id`  int(11) NOT NULL DEFAULT 0 ,
`url`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`modify_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
`is_delete`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of catalog
-- ----------------------------
BEGIN;
INSERT INTO `catalog` VALUES ('1', '首页', '0', '', '2015-01-02 17:00:31', '1');
COMMIT;

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`user_id`  int(11) NULL DEFAULT NULL ,
`resource_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
INDEX `user_id` (`user_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of collect
-- ----------------------------
BEGIN;
INSERT INTO `collect` VALUES ('1', '1', '1');
COMMIT;

-- ----------------------------
-- Table structure for commont
-- ----------------------------
DROP TABLE IF EXISTS `commont`;
CREATE TABLE `commont` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`user_id`  int(11) NOT NULL ,
`resource_id`  int(11) NOT NULL ,
`ip`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' ,
`address`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' ,
`content`  varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' ,
`top_count`  int(11) NOT NULL DEFAULT 1 ,
`down_count`  int(11) NOT NULL DEFAULT 0 ,
`modify_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
`is_delete`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' ,
PRIMARY KEY (`id`),
FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
INDEX `user_id` (`user_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of commont
-- ----------------------------
BEGIN;
INSERT INTO `commont` VALUES ('1', '1', '1', '192.168.1.1', '成都市', '太搞笑了。真的。', '1', '0', '2015-01-02 17:02:51', '1');
COMMIT;

-- ----------------------------
-- Table structure for contanct
-- ----------------------------
DROP TABLE IF EXISTS `contanct`;
CREATE TABLE `contanct` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`constact_name`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`email`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'bolobeach@gmail.com' ,
`tele_phone`  varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`address`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of contanct
-- ----------------------------
BEGIN;
INSERT INTO `contanct` VALUES ('1', '张兵', 'bolobeach@gmail.com', '110', '四川省成都市');
COMMIT;

-- ----------------------------
-- Table structure for cooperation
-- ----------------------------
DROP TABLE IF EXISTS `cooperation`;
CREATE TABLE `cooperation` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`url`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'http://www.baidu.com' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of cooperation
-- ----------------------------
BEGIN;
INSERT INTO `cooperation` VALUES ('1', '百度', 'http://www.baidu.com');
COMMIT;

-- ----------------------------
-- Table structure for parent_picture
-- ----------------------------
DROP TABLE IF EXISTS `parent_picture`;
CREATE TABLE `parent_picture` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`parent_picture_name`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`skim_count`  int(11) NOT NULL DEFAULT 1 ,
`catalog_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`catalog_id`) REFERENCES `catalog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
INDEX `catalog_id` (`catalog_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of parent_picture
-- ----------------------------
BEGIN;
INSERT INTO `parent_picture` VALUES ('1', '爆笑第一期', '1', '1');
COMMIT;

-- ----------------------------
-- Table structure for picture
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`picture_name`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`url`  varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`title`  varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`type`  varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`spark_url`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'http://www.baidu.com' ,
`author_id`  int(11) NULL DEFAULT NULL ,
`parent_catalog_id`  int(11) NULL DEFAULT NULL ,
`top_count`  int(11) NULL DEFAULT 1 ,
`down_count`  int(11) NULL DEFAULT 0 ,
`old_picture`  int(11) NULL DEFAULT 0 ,
`key_word`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`modify_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
`is_delete`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' ,
PRIMARY KEY (`id`),
FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
INDEX `author_id` (`author_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of picture
-- ----------------------------
BEGIN;
INSERT INTO `picture` VALUES ('1', '爆笑gif', 'http://www.baidu.com', '爆笑gif', '美女gif', 'http://www.baidu.com', '1', '1', '1', '0', '0', '', '2015-01-02 17:01:48', '1');
COMMIT;

-- ----------------------------
-- Table structure for picture_type
-- ----------------------------
DROP TABLE IF EXISTS `picture_type`;
CREATE TABLE `picture_type` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of picture_type
-- ----------------------------
BEGIN;
INSERT INTO `picture_type` VALUES ('1', '美女gif');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`user_name`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' ,
`email`  varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`user_password`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'e10adc3949ba59abbe56e057f20f883e' ,
`regist_date`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
`login_count`  int(11) NOT NULL DEFAULT 1 ,
`last_login_date`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
`modify_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
`isDelete`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('1', 'royzhang', 'bolobeach@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '2015-01-02 16:13:43', '1', '2015-01-02 16:13:43', '2015-01-02 16:13:43', '1');
COMMIT;

-- ----------------------------
-- Auto increment value for about_as
-- ----------------------------
ALTER TABLE `about_as` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for blogroll
-- ----------------------------
ALTER TABLE `blogroll` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for catalog
-- ----------------------------
ALTER TABLE `catalog` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for collect
-- ----------------------------
ALTER TABLE `collect` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for commont
-- ----------------------------
ALTER TABLE `commont` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for contanct
-- ----------------------------
ALTER TABLE `contanct` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for cooperation
-- ----------------------------
ALTER TABLE `cooperation` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for parent_picture
-- ----------------------------
ALTER TABLE `parent_picture` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for picture
-- ----------------------------
ALTER TABLE `picture` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for picture_type
-- ----------------------------
ALTER TABLE `picture_type` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for users
-- ----------------------------
ALTER TABLE `users` AUTO_INCREMENT=2;
