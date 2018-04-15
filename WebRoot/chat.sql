/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : chat

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2018-04-15 18:12:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for big_group
-- ----------------------------
DROP TABLE IF EXISTS `big_group`;
CREATE TABLE `big_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) DEFAULT NULL,
  `groupname` varchar(255) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of big_group
-- ----------------------------
INSERT INTO `big_group` VALUES ('1', 'a88b7efa-56ef-4e09-b77f-4973fcf17ddc.jpg', '聊天室', '1', '2018-04-05 22:32:12');

-- ----------------------------
-- Table structure for big_group_user
-- ----------------------------
DROP TABLE IF EXISTS `big_group_user`;
CREATE TABLE `big_group_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bigGroupId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of big_group_user
-- ----------------------------
INSERT INTO `big_group_user` VALUES ('6', '1', '17');
INSERT INTO `big_group_user` VALUES ('7', '1', '18');
INSERT INTO `big_group_user` VALUES ('8', '1', '19');

-- ----------------------------
-- Table structure for group
-- ----------------------------
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(255) DEFAULT NULL,
  `createdtime` datetime DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group
-- ----------------------------
INSERT INTO `group` VALUES ('1', '我的好友', '2018-04-15 17:45:20', '17');
INSERT INTO `group` VALUES ('2', '我的好友', '2018-04-15 17:46:13', '18');
INSERT INTO `group` VALUES ('3', '我的好友', '2018-04-15 17:46:51', '19');
INSERT INTO `group` VALUES ('4', '公司内部分组', '2018-04-15 17:53:52', '17');

-- ----------------------------
-- Table structure for group_user
-- ----------------------------
DROP TABLE IF EXISTS `group_user`;
CREATE TABLE `group_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `ownId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group_user
-- ----------------------------
INSERT INTO `group_user` VALUES ('11', '1', '18', '17');
INSERT INTO `group_user` VALUES ('12', '1', '19', '17');
INSERT INTO `group_user` VALUES ('13', '2', '17', '18');
INSERT INTO `group_user` VALUES ('14', '3', '17', '19');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fromeUserId` int(11) DEFAULT NULL,
  `fromAvatar` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `fromUserName` varchar(255) DEFAULT NULL,
  `toUserId` int(255) DEFAULT NULL,
  `toAvatar` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `toUserName` varchar(255) DEFAULT NULL,
  `sendTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('42', '18', '/cdn/f63555cb-738f-4465-bc73-aa7859f09d7c.jpg', '马老板最近还好吗？', '刘涛', '17', '/cdn/16482036-cb4a-4693-a255-0c67fb785018.jpg', 'friend', '马小云', '2018-04-15 17:54:42');
INSERT INTO `message` VALUES ('43', '17', '/cdn/16482036-cb4a-4693-a255-0c67fb785018.jpg', '混的一般般把， 你最近有什么新的影视作品吗？', '马小云', '18', '/cdn/f63555cb-738f-4465-bc73-aa7859f09d7c.jpg', 'friend', '刘涛', '2018-04-15 17:55:21');
INSERT INTO `message` VALUES ('44', '18', '/cdn/f63555cb-738f-4465-bc73-aa7859f09d7c.jpg', '大家晚上好啊', '刘涛', '1', '/cdn/a88b7efa-56ef-4e09-b77f-4973fcf17ddc.jpg', 'group', '聊天室', '2018-04-15 17:55:56');
INSERT INTO `message` VALUES ('45', '18', '/cdn/f63555cb-738f-4465-bc73-aa7859f09d7c.jpg', 'face[思考] ', '刘涛', '1', '/cdn/a88b7efa-56ef-4e09-b77f-4973fcf17ddc.jpg', 'group', '聊天室', '2018-04-15 17:56:02');
INSERT INTO `message` VALUES ('46', '17', '/cdn/16482036-cb4a-4693-a255-0c67fb785018.jpg', '你好啊', '马小云', '1', '/cdn/a88b7efa-56ef-4e09-b77f-4973fcf17ddc.jpg', 'group', '聊天室', '2018-04-15 17:56:14');
INSERT INTO `message` VALUES ('47', '18', '/cdn/f63555cb-738f-4465-bc73-aa7859f09d7c.jpg', 'face[拜拜] ', '刘涛', '17', '/cdn/16482036-cb4a-4693-a255-0c67fb785018.jpg', 'friend', '马小云', '2018-04-15 18:00:40');
INSERT INTO `message` VALUES ('48', '17', '/cdn/16482036-cb4a-4693-a255-0c67fb785018.jpg', 'face[兔子] ', '马小云', '18', '/cdn/f63555cb-738f-4465-bc73-aa7859f09d7c.jpg', 'friend', '刘涛', '2018-04-15 18:00:46');
INSERT INTO `message` VALUES ('49', '18', '/cdn/f63555cb-738f-4465-bc73-aa7859f09d7c.jpg', '马大哥你的签名很帅气啊', '刘涛', '17', '/cdn/16482036-cb4a-4693-a255-0c67fb785018.jpg', 'friend', '马小云', '2018-04-15 18:02:15');
INSERT INTO `message` VALUES ('50', '17', '/cdn/16482036-cb4a-4693-a255-0c67fb785018.jpg', 'face[抱抱] ', '马小云', '18', '/cdn/f63555cb-738f-4465-bc73-aa7859f09d7c.jpg', 'friend', '刘涛', '2018-04-15 18:02:34');
INSERT INTO `message` VALUES ('51', '17', '/cdn/16482036-cb4a-4693-a255-0c67fb785018.jpg', '你最近再干些什么呢 ', '马小云', '1', '/cdn/a88b7efa-56ef-4e09-b77f-4973fcf17ddc.jpg', 'group', '聊天室', '2018-04-15 18:02:54');
INSERT INTO `message` VALUES ('52', '17', '/cdn/16482036-cb4a-4693-a255-0c67fb785018.jpg', '大家晚上有没有空啊？ 大家一起吃个饭', '马小云', '1', '/cdn/a88b7efa-56ef-4e09-b77f-4973fcf17ddc.jpg', 'group', '聊天室', '2018-04-15 18:03:07');
INSERT INTO `message` VALUES ('53', '18', '/cdn/f63555cb-738f-4465-bc73-aa7859f09d7c.jpg', '好啊好啊， 大家晚上不见不散', '刘涛', '1', '/cdn/a88b7efa-56ef-4e09-b77f-4973fcf17ddc.jpg', 'group', '聊天室', '2018-04-15 18:03:59');

-- ----------------------------
-- Table structure for messagebox
-- ----------------------------
DROP TABLE IF EXISTS `messagebox`;
CREATE TABLE `messagebox` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `friendId` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `groupId` int(11) DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of messagebox
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `money` double(10,2) DEFAULT '500.00',
  `avatar` varchar(255) DEFAULT NULL,
  `sign` varchar(255) DEFAULT NULL,
  `questionOne` varchar(255) DEFAULT NULL,
  `questionTwo` varchar(255) DEFAULT NULL,
  `questionThree` varchar(255) DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  `roleId` int(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('18', '刘涛', 'test2@163.com', '21232f297a57a5a743894a0e4a801fc3', '500.00', 'f63555cb-738f-4465-bc73-aa7859f09d7c.jpg', '谁是天底下最美的人', '刘涛', '马云', 'T1001', '2018-04-15 17:46:13', '2');
INSERT INTO `user` VALUES ('17', '马小云', 'test1@163.com', '21232f297a57a5a743894a0e4a801fc3', '500.00', '16482036-cb4a-4693-a255-0c67fb785018.jpg', '天下没有难写的代码', '马小云', '马化腾', 'Y1001', '2018-04-15 17:45:20', '2');
INSERT INTO `user` VALUES ('19', '佟丽娅', 'test3@163.com', '21232f297a57a5a743894a0e4a801fc3', '500.00', 'fd0aeb49-44ab-4646-b250-0591472eaa78.jpg', null, '佟丽娅', '刘涛', 'T001', '2018-04-15 17:46:51', '2');
INSERT INTO `user` VALUES ('1', 'admin', null, '21232f297a57a5a743894a0e4a801fc3', '500.00', null, null, null, null, null, '2018-04-15 17:46:51', '1');
