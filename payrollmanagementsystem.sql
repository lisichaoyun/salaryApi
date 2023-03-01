/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 80017
Source Host           : localhost:3306
Source Database       : payrollmanagementsystem

Target Server Type    : MYSQL
Target Server Version : 80017
File Encoding         : 65001

Date: 2023-03-01 18:32:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for assessmentsettings
-- ----------------------------
DROP TABLE IF EXISTS `assessmentsettings`;
CREATE TABLE `assessmentsettings` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `周考核量` int(10) unsigned NOT NULL,
  `月考核量` int(10) unsigned NOT NULL,
  `设置日期` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of assessmentsettings
-- ----------------------------
INSERT INTO `assessmentsettings` VALUES ('10', '200', '600', '2022-07-26');
INSERT INTO `assessmentsettings` VALUES ('11', '200', '600', '2022-07-26');
INSERT INTO `assessmentsettings` VALUES ('12', '200', '600', '2022-07-26');
INSERT INTO `assessmentsettings` VALUES ('13', '200', '600', '2022-07-26');
INSERT INTO `assessmentsettings` VALUES ('14', '200', '600', '2022-07-26');
INSERT INTO `assessmentsettings` VALUES ('16', '200', '600', '2022-07-26');
INSERT INTO `assessmentsettings` VALUES ('17', '200', '600', '2022-07-26');
INSERT INTO `assessmentsettings` VALUES ('18', '200', '600', '2022-07-26');
INSERT INTO `assessmentsettings` VALUES ('19', '200', '600', '2022-07-26');
INSERT INTO `assessmentsettings` VALUES ('20', '200', '600', '2022-07-26');
INSERT INTO `assessmentsettings` VALUES ('21', '200', '600', '2022-07-26');
INSERT INTO `assessmentsettings` VALUES ('22', '200', '600', '2022-07-26');
INSERT INTO `assessmentsettings` VALUES ('23', '200', '600', '2022-07-26');
INSERT INTO `assessmentsettings` VALUES ('24', '200', '600', '2022-07-26');
INSERT INTO `assessmentsettings` VALUES ('25', '200', '600', '2022-07-26');
INSERT INTO `assessmentsettings` VALUES ('26', '200', '600', '2022-07-26');
INSERT INTO `assessmentsettings` VALUES ('27', '200', '600', '2022-07-26');
INSERT INTO `assessmentsettings` VALUES ('28', '200', '600', '2022-07-26');
INSERT INTO `assessmentsettings` VALUES ('29', '200', '600', '2022-07-26');
INSERT INTO `assessmentsettings` VALUES ('30', '200', '600', '2022-07-26');
INSERT INTO `assessmentsettings` VALUES ('31', '200', '600', '2022-07-26');
INSERT INTO `assessmentsettings` VALUES ('32', '200', '600', '2022-07-26');
INSERT INTO `assessmentsettings` VALUES ('33', '200', '600', '2022-07-26');
INSERT INTO `assessmentsettings` VALUES ('34', '200', '600', '2022-07-26');
INSERT INTO `assessmentsettings` VALUES ('35', '200', '600', '2022-07-26');
INSERT INTO `assessmentsettings` VALUES ('36', '200', '600', '2022-07-26');
INSERT INTO `assessmentsettings` VALUES ('37', '200', '600', '2022-07-26');
INSERT INTO `assessmentsettings` VALUES ('38', '200', '600', '2022-07-26');
INSERT INTO `assessmentsettings` VALUES ('39', '200', '600', '2022-07-26');

-- ----------------------------
-- Table structure for attendance
-- ----------------------------
DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance` (
  `department` varchar(12) NOT NULL,
  `check-inTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of attendance
-- ----------------------------

-- ----------------------------
-- Table structure for attendancerecord
-- ----------------------------
DROP TABLE IF EXISTS `attendancerecord`;
CREATE TABLE `attendancerecord` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `员工姓名` varchar(255) NOT NULL,
  `工作日期` date NOT NULL,
  `上班时间` datetime NOT NULL,
  `状态` varchar(255) NOT NULL,
  `创建时间` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of attendancerecord
-- ----------------------------

-- ----------------------------
-- Table structure for beforesettlementkey
-- ----------------------------
DROP TABLE IF EXISTS `beforesettlementkey`;
CREATE TABLE `beforesettlementkey` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of beforesettlementkey
-- ----------------------------
INSERT INTO `beforesettlementkey` VALUES ('1', '基本工资', '+');
INSERT INTO `beforesettlementkey` VALUES ('2', '效绩奖金', '+');
INSERT INTO `beforesettlementkey` VALUES ('3', '全勤工资', '+');
INSERT INTO `beforesettlementkey` VALUES ('4', '迟到扣款', '-');
INSERT INTO `beforesettlementkey` VALUES ('5', '请假扣款', '-');

-- ----------------------------
-- Table structure for contractfile
-- ----------------------------
DROP TABLE IF EXISTS `contractfile`;
CREATE TABLE `contractfile` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `合同采购合同` varchar(255) NOT NULL,
  `合同甲方` varchar(255) NOT NULL,
  `合同乙方` varchar(255) NOT NULL,
  `合同金额` int(11) NOT NULL,
  `签订时间` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of contractfile
-- ----------------------------

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `职责` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('18', '开发部', '开发主要产品');
INSERT INTO `department` VALUES ('20', '研发部', '研发产品');

-- ----------------------------
-- Table structure for employeefiles
-- ----------------------------
DROP TABLE IF EXISTS `employeefiles`;
CREATE TABLE `employeefiles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `员工工号` varchar(255) NOT NULL,
  `员工姓名` varchar(255) NOT NULL,
  `员工手机` varchar(255) NOT NULL,
  `所属部门` varchar(255) NOT NULL,
  `学历` varchar(255) NOT NULL,
  `年龄` int(11) NOT NULL,
  `入职日期` date NOT NULL,
  `员工类型` varchar(255) NOT NULL,
  `创建时间` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of employeefiles
-- ----------------------------

-- ----------------------------
-- Table structure for enterprisespayfound
-- ----------------------------
DROP TABLE IF EXISTS `enterprisespayfound`;
CREATE TABLE `enterprisespayfound` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `amount` int(10) unsigned DEFAULT NULL,
  `user_id` int(20) unsigned NOT NULL,
  `state` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of enterprisespayfound
-- ----------------------------

-- ----------------------------
-- Table structure for foundamout
-- ----------------------------
DROP TABLE IF EXISTS `foundamout`;
CREATE TABLE `foundamout` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `tax_public` int(11) unsigned NOT NULL,
  `tax_private` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of foundamout
-- ----------------------------
INSERT INTO `foundamout` VALUES ('1', '住房公积金调整', '5', '5');
INSERT INTO `foundamout` VALUES ('2', '养老金调整', '5', '5');
INSERT INTO `foundamout` VALUES ('3', '医疗保险调整', '5', '5');
INSERT INTO `foundamout` VALUES ('4', '失业保险调整', '5', '5');

-- ----------------------------
-- Table structure for individualincometax
-- ----------------------------
DROP TABLE IF EXISTS `individualincometax`;
CREATE TABLE `individualincometax` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `level` int(10) unsigned NOT NULL,
  `name` varchar(10) NOT NULL,
  `tax` int(10) unsigned NOT NULL,
  `threshold` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of individualincometax
-- ----------------------------
INSERT INTO `individualincometax` VALUES ('1', '1', '个人所得税1级', '3', '3000');
INSERT INTO `individualincometax` VALUES ('2', '2', '个人所得税2级', '10', '12000');
INSERT INTO `individualincometax` VALUES ('3', '3', '个人所得税3级', '20', '25000');
INSERT INTO `individualincometax` VALUES ('4', '4', '个人所得税4级', '25', '35000');
INSERT INTO `individualincometax` VALUES ('5', '5', '个人所得税5级', '30', '55000');
INSERT INTO `individualincometax` VALUES ('6', '6', '个人所得税6级', '35', '80000');
INSERT INTO `individualincometax` VALUES ('7', '7', '个人所得税7级', '45', '999999999');

-- ----------------------------
-- Table structure for interviewplan
-- ----------------------------
DROP TABLE IF EXISTS `interviewplan`;
CREATE TABLE `interviewplan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `候选人姓名` varchar(255) NOT NULL,
  `候选人电话` varchar(255) NOT NULL,
  `面试时间` datetime NOT NULL,
  `面试官` varchar(255) NOT NULL,
  `面试结果` varchar(255) NOT NULL,
  `创建时间` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of interviewplan
-- ----------------------------
INSERT INTO `interviewplan` VALUES ('1', '李斯超云', '18142641268', '2022-12-12 09:57:22', '刘协', '未通过', '2022-12-22 01:57:36');

-- ----------------------------
-- Table structure for personalplan
-- ----------------------------
DROP TABLE IF EXISTS `personalplan`;
CREATE TABLE `personalplan` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `员工姓名` varchar(255) NOT NULL,
  `计划主题` varchar(255) NOT NULL,
  `计划内容` text NOT NULL,
  `开始日期` date NOT NULL,
  `结束日期` date NOT NULL,
  `状态` varchar(255) NOT NULL,
  `创建时间` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of personalplan
-- ----------------------------

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `职称名唯一` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES ('19', 'BOSS');

-- ----------------------------
-- Table structure for recruitmentrequiment
-- ----------------------------
DROP TABLE IF EXISTS `recruitmentrequiment`;
CREATE TABLE `recruitmentrequiment` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `需求人数` int(10) unsigned NOT NULL,
  `岗位类型` varchar(255) NOT NULL,
  `学历要求` varchar(255) NOT NULL,
  `工作年限` int(10) unsigned NOT NULL,
  `招聘要求` varchar(255) NOT NULL,
  `招聘负责人` varchar(255) NOT NULL,
  `需求负责人` varchar(255) NOT NULL,
  `需求状态` varchar(255) NOT NULL,
  `发布时间` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of recruitmentrequiment
-- ----------------------------
INSERT INTO `recruitmentrequiment` VALUES ('2', '40', '工人', '无', '1', '无', '李四', '李四', '急需', '2022-12-15 00:00:00');

-- ----------------------------
-- Table structure for regularapplication
-- ----------------------------
DROP TABLE IF EXISTS `regularapplication`;
CREATE TABLE `regularapplication` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `申请日期` date NOT NULL,
  `申请人` varchar(255) NOT NULL,
  `申请内容` text NOT NULL,
  `审批日期` date NOT NULL,
  `审批人` varchar(255) NOT NULL,
  `审批结果` varchar(4) NOT NULL,
  `审批意见` varchar(255) NOT NULL,
  `状态` varchar(4) NOT NULL,
  `创建时间` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of regularapplication
-- ----------------------------

-- ----------------------------
-- Table structure for salaryinquiry
-- ----------------------------
DROP TABLE IF EXISTS `salaryinquiry`;
CREATE TABLE `salaryinquiry` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `员工姓名` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `基本工资` int(10) unsigned NOT NULL,
  `效绩奖金` int(10) unsigned NOT NULL,
  `所属部门` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `全勤工资` int(10) unsigned NOT NULL,
  `迟到扣款` int(10) unsigned NOT NULL,
  `请假扣款` int(10) unsigned NOT NULL,
  `个税扣款` int(10) unsigned NOT NULL,
  `五险一金` int(10) unsigned NOT NULL,
  `工资日期` date NOT NULL,
  `创建时间` datetime NOT NULL,
  `最终工资` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of salaryinquiry
-- ----------------------------
INSERT INTO `salaryinquiry` VALUES ('13', '李斯超云', '5000', '5000', '开发', '1000', '0', '0', '174', '2200', '2022-12-12', '2023-03-01 11:43:43', '6426');
INSERT INTO `salaryinquiry` VALUES ('14', '李斯超云', '5000', '5000', '开发', '1000', '0', '0', '174', '2200', '2022-12-12', '2023-03-01 11:46:52', '6426');
INSERT INTO `salaryinquiry` VALUES ('15', '李斯超云', '5000', '5000', '开发', '1000', '0', '0', '174', '2200', '2023-06-18', '2023-03-01 16:47:27', '6426');

-- ----------------------------
-- Table structure for trainingprogram
-- ----------------------------
DROP TABLE IF EXISTS `trainingprogram`;
CREATE TABLE `trainingprogram` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `培训主题` varchar(20) NOT NULL,
  `培训日期` date NOT NULL,
  `培训内容` text NOT NULL,
  `参加人员` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of trainingprogram
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(18) NOT NULL,
  `password` varchar(24) NOT NULL,
  `wxOpenID` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `RegisterTime` date NOT NULL,
  `birthday` date NOT NULL,
  `department` int(11) unsigned DEFAULT NULL,
  `position` int(11) unsigned DEFAULT NULL,
  `permissions` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `用户名唯一` (`username`) USING BTREE,
  UNIQUE KEY `wxOpenID` (`wxOpenID`) USING BTREE,
  KEY `department` (`department`),
  KEY `position` (`position`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`department`) REFERENCES `department` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`position`) REFERENCES `position` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('8', 'lisichaoyun', 'lisichaoyun0726', 'oEBFhwlhyCiHT-MPyaBaEAObLnM8', '李斯超云', '男', '2022-12-07', '1999-07-26', null, null, '3');

-- ----------------------------
-- Table structure for workingdaily
-- ----------------------------
DROP TABLE IF EXISTS `workingdaily`;
CREATE TABLE `workingdaily` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `员工姓名` varchar(255) NOT NULL,
  `工作日期` date NOT NULL,
  `工作内容` mediumtext NOT NULL,
  `完成进度` float unsigned NOT NULL,
  `创建时间` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of workingdaily
-- ----------------------------
