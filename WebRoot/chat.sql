/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : chat

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2018-04-07 19:53:53
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
INSERT INTO `big_group` VALUES ('1', '3fa7cfe2-de0f-4114-8ef8-f6fe114121d7.jpg', '群组', '1', '2018-04-05 22:32:12');

-- ----------------------------
-- Table structure for big_group_user
-- ----------------------------
DROP TABLE IF EXISTS `big_group_user`;
CREATE TABLE `big_group_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bigGroupId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of big_group_user
-- ----------------------------
INSERT INTO `big_group_user` VALUES ('1', '1', '1');
INSERT INTO `big_group_user` VALUES ('2', '1', '2');

-- ----------------------------
-- Table structure for group
-- ----------------------------
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(255) DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group
-- ----------------------------
INSERT INTO `group` VALUES ('1', '冬天', '2018-04-05 22:31:23', '1');
INSERT INTO `group` VALUES ('2', '我的好友', '2018-04-06 00:55:06', '2');
INSERT INTO `group` VALUES ('11', '冬天不太冷', '2018-04-07 19:38:11', '1');
INSERT INTO `group` VALUES ('10', '秋天', '2018-04-07 19:34:00', '1');
INSERT INTO `group` VALUES ('9', null, '2018-04-07 19:27:55', '0');
INSERT INTO `group` VALUES ('6', '小蜜蜂', '2018-04-07 18:58:35', '2');

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group_user
-- ----------------------------
INSERT INTO `group_user` VALUES ('1', '1', '2', '1');
INSERT INTO `group_user` VALUES ('2', '2', '1', '2');

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'susu', '13145211216@163.com', '21232f297a57a5a743894a0e4a801fc3', '500.00', '0cb90a4f-af42-424a-a5a0-6bf061ff7857.jpg', '你好吗', '1', '2', '3', '2018-04-02 22:50:39', '2');
INSERT INTO `user` VALUES ('2', '南京', '824522972@qq.com', '21232f297a57a5a743894a0e4a801fc3', '500.00', '3fa7cfe2-de0f-4114-8ef8-f6fe114121d7.jpg', '123', '1', '2', '3', '2018-04-05 22:11:52', '2');
INSERT INTO `user` VALUES ('4', '1', '123@qq.com', '-3b35bdc75f46dc7df233af65908a7b65', '500.00', '3fa7cfe2-de0f-4114-8ef8-f6fe114121d7.jpg', null, '1', '1', '1', '2018-04-06 00:45:49', '2');
INSERT INTO `user` VALUES ('5', '1', '12345678@qq.com', '-3b35bdc75f46dc7df233af65908a7b65', '500.00', 'a1d519b2-9de5-47bd-86ac-1021434cdef6.jpg', null, '1', '1', '1', '2018-04-06 00:47:54', '2');
INSERT INTO `user` VALUES ('6', '12', '1234@qq.com', '21232f297a57a5a743894a0e4a801fc3', '500.00', 'ab316a48-5cc6-4228-a1eb-f36299aad133.jpg', null, '1', '2', '3', '2018-04-06 00:55:06', '2');
