/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50544
Source Host           : localhost:3306
Source Database       : oa

Target Server Type    : MYSQL
Target Server Version : 50544
File Encoding         : 65001

Date: 2019-11-11 13:31:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for claim_voucher
-- ----------------------------
DROP TABLE IF EXISTS `claim_voucher`;
CREATE TABLE `claim_voucher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cause` varchar(100) DEFAULT NULL,
  `create_sn` char(5) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `next_deal_sn` char(5) DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_2` (`next_deal_sn`),
  KEY `FK_Reference_3` (`create_sn`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`next_deal_sn`) REFERENCES `employee` (`sn`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`create_sn`) REFERENCES `employee` (`sn`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of claim_voucher
-- ----------------------------
INSERT INTO `claim_voucher` VALUES ('35', '出差', '10006', '2019-05-10 12:20:28', null, '180', '已打款', '632e6878-7b55-4712-a294-c8308b3cdba4.jpg');
INSERT INTO `claim_voucher` VALUES ('36', '出差', '10006', '2019-06-02 12:44:49', null, '5100', '已打款', 'fcecc390-3411-42fa-8519-de15576ae848.jpg');
INSERT INTO `claim_voucher` VALUES ('37', '团建', '10006', '2019-05-20 12:53:18', null, '2000', '已打款', '4bceb7d5-324f-47c1-a90d-ddf636ca5749.jpg');
INSERT INTO `claim_voucher` VALUES ('38', '买办公用品', '10006', '2019-06-12 13:01:12', '10006', '500', '新创建', '83940615-ea77-421c-b304-ff8200ac87da.jpg');
INSERT INTO `claim_voucher` VALUES ('39', '出差', '10006', '2019-06-13 09:57:06', null, '500', '已打款', 'f9ad4a40-40ba-4d35-8e31-ee80b8c6ae77.jpg');
INSERT INTO `claim_voucher` VALUES ('40', '出差', '10006', '2019-06-13 15:53:13', null, '500', '已打款', 'bd4c5f59-c727-4df8-98eb-66063bcc063f.jpg');

-- ----------------------------
-- Table structure for claim_voucher_item
-- ----------------------------
DROP TABLE IF EXISTS `claim_voucher_item`;
CREATE TABLE `claim_voucher_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `claim_voucher_id` int(11) DEFAULT NULL,
  `item` varchar(20) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_4` (`claim_voucher_id`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`claim_voucher_id`) REFERENCES `claim_voucher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of claim_voucher_item
-- ----------------------------
INSERT INTO `claim_voucher_item` VALUES ('37', '35', '交通', '180', '高铁');
INSERT INTO `claim_voucher_item` VALUES ('38', '36', '餐饮', '5100', '');
INSERT INTO `claim_voucher_item` VALUES ('39', '37', '餐饮', '2000', '质量与效率部门聚餐');
INSERT INTO `claim_voucher_item` VALUES ('40', '38', '办公', '500', '');
INSERT INTO `claim_voucher_item` VALUES ('41', '39', '交通', '500', '机票');
INSERT INTO `claim_voucher_item` VALUES ('42', '40', '交通', '500', '');

-- ----------------------------
-- Table structure for deal_record
-- ----------------------------
DROP TABLE IF EXISTS `deal_record`;
CREATE TABLE `deal_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `claim_voucher_id` int(11) DEFAULT NULL,
  `deal_sn` char(5) DEFAULT NULL,
  `deal_time` datetime DEFAULT NULL,
  `deal_way` varchar(20) DEFAULT NULL,
  `deal_result` varchar(20) DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_5` (`claim_voucher_id`),
  KEY `FK_Reference_6` (`deal_sn`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`claim_voucher_id`) REFERENCES `claim_voucher` (`id`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`deal_sn`) REFERENCES `employee` (`sn`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deal_record
-- ----------------------------
INSERT INTO `deal_record` VALUES ('5', '35', '10006', '2019-05-12 12:40:35', '提交', '已提交', '无');
INSERT INTO `deal_record` VALUES ('6', '35', '10011', '2019-05-12 12:41:23', '通过', '已审核', '');
INSERT INTO `deal_record` VALUES ('7', '35', '10008', '2019-05-12 12:42:47', '打款', '已打款', '');
INSERT INTO `deal_record` VALUES ('8', '36', '10006', '2019-06-02 12:45:01', '提交', '已提交', '无');
INSERT INTO `deal_record` VALUES ('9', '36', '10011', '2019-06-02 12:45:45', '通过', '待复审', '');
INSERT INTO `deal_record` VALUES ('10', '36', '10001', '2019-06-02 12:46:52', '通过', '已审核', '');
INSERT INTO `deal_record` VALUES ('11', '36', '10008', '2019-06-02 12:48:15', '打款', '已打款', '');
INSERT INTO `deal_record` VALUES ('12', '37', '10006', '2019-05-20 12:56:04', '提交', '已提交', '无');
INSERT INTO `deal_record` VALUES ('13', '37', '10011', '2019-06-21 12:56:31', '通过', '已审核', '');
INSERT INTO `deal_record` VALUES ('14', '37', '10008', '2019-06-21 12:56:52', '打款', '已打款', '');
INSERT INTO `deal_record` VALUES ('15', '39', '10006', '2019-06-13 09:57:18', '提交', '已提交', '无');
INSERT INTO `deal_record` VALUES ('16', '39', '10011', '2019-06-13 09:58:18', '通过', '已审核', '');
INSERT INTO `deal_record` VALUES ('17', '39', '10008', '2019-06-13 09:59:09', '打款', '已打款', '');
INSERT INTO `deal_record` VALUES ('18', '40', '10006', '2019-06-13 15:53:29', '提交', '已提交', '无');
INSERT INTO `deal_record` VALUES ('19', '40', '10011', '2019-06-13 15:54:35', '通过', '已审核', '');
INSERT INTO `deal_record` VALUES ('20', '40', '10008', '2019-06-13 15:55:27', '打款', '已打款', '');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `sn` char(5) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('10001', '总经理办公室', '量子银座11F');
INSERT INTO `department` VALUES ('10002', '财务部', '量子银座12F');
INSERT INTO `department` VALUES ('10003', '人事部', '量子银座12F');
INSERT INTO `department` VALUES ('10004', '技术部', '量子银座11F');
INSERT INTO `department` VALUES ('10005', '质量与效率部门', '量子银座11F');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `sn` char(5) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `department_sn` char(5) DEFAULT NULL,
  `post` varchar(20) DEFAULT NULL,
  `base_salary` decimal(10,2) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `school` varchar(20) DEFAULT NULL,
  `degree` varchar(20) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `registrant_sn` varchar(5) DEFAULT NULL,
  `IDCard` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sn`),
  KEY `FK_Reference_1` (`department_sn`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`department_sn`) REFERENCES `department` (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('10001', '111', '秦卓珈', '10001', '总经理', '17000.00', '1979-05-12 00:00:00', '清华大学', '硕士', '2005-03-04 08:46:00', '2020-03-04 08:46:00', '续约', '10005', '601481199510235817', '北京市望京东路', null);
INSERT INTO `employee` VALUES ('10002', '111', '张少华', '10002', '部门经理', '13000.00', '1978-05-12 00:00:00', '清华大学', '硕士', '2017-03-04 20:46:43', '2020-03-04 20:46:47', '续约', '10007', '601481199510235817', '北京市望京东路', null);
INSERT INTO `employee` VALUES ('10003', '111', '罗莎', '10003', '部门经理', '13000.00', '1985-05-12 00:00:00', '北京师范大学', '本科', '2017-05-12 10:17:00', '2029-05-12 10:17:00', '正常', '10005', '610481199510235817', '北京市朝阳区望京东路', '');
INSERT INTO `employee` VALUES ('10004', '111', '段颖', '10004', '部门经理', '13000.00', '1979-05-12 00:00:00', '北京师范大学', '本科', '2014-05-12 10:17:00', '2029-05-12 10:17:00', '正常', '10005', '610481199510235817', '北京市朝阳区望京东路', '');
INSERT INTO `employee` VALUES ('10005', '111', '李筱丹', '10001', '人事', '8000.00', '1992-05-12 00:00:00', '北京师范大学', '本科', '2013-05-12 10:17:00', '2029-05-12 10:17:00', '正常', '10005', '610481199510235817', '北京市朝阳区望京东路', '');
INSERT INTO `employee` VALUES ('10006', '111', '徐浩', '10005', '员工', '5000.00', '1988-05-12 00:00:00', '北京师范大学', '本科', '2014-05-12 10:17:00', '2029-05-12 10:17:00', '正常', '10005', '610481199510235817', '北京市朝阳区望京东路', null);
INSERT INTO `employee` VALUES ('10007', '111', '郝英明', '10002', '人事', '8000.00', '1988-05-12 00:00:00', '北京师范大学', '本科', '2012-05-12 10:17:00', '2029-05-12 10:17:00', '正常', '10005', '610481199510235817', '北京市朝阳区望京东路', null);
INSERT INTO `employee` VALUES ('10008', '111', '任雪娟', '10002', '财务', '7000.00', '1992-05-12 00:00:00', '北京师范大学', '本科', '2014-05-12 10:17:00', '2029-05-12 10:17:00', '正常', '10005', '610481199510235817', '北京市朝阳区望京东路', null);
INSERT INTO `employee` VALUES ('10009', '111', '张雪', '10003', '人事', '8000.00', '1988-05-12 00:00:00', '北京师范大学', '本科', '2017-05-12 10:17:00', '2029-05-12 10:17:00', '正常', '10005', '610481199510235817', '北京市朝阳区望京东路', null);
INSERT INTO `employee` VALUES ('10010', '111', '李小龙', '10003', '员工', '5000.00', '1992-05-12 00:00:00', '北京师范大学', '本科', '2018-05-12 10:17:00', '2029-05-12 10:17:00', '正常', '10005', '610481199510235817', '北京市朝阳区望京东路', null);
INSERT INTO `employee` VALUES ('10011', '111', '王东升', '10005', '部门经理', '13000.00', '1988-05-12 00:00:00', '北京师范大学', '本科', '2017-05-12 10:17:00', '2029-05-12 10:17:00', '正常', '10005', '610481199510235817', '北京市朝阳区望京东路', null);
INSERT INTO `employee` VALUES ('10012', '111', '刘琳琳', '10005', '人事', '8000.00', '1992-05-12 00:00:00', '北京师范大学', '本科', '2018-05-12 10:17:00', '2029-05-12 10:17:00', '正常', '10005', '610481199510235817', '北京市朝阳区望京东路', '');
INSERT INTO `employee` VALUES ('10013', '111', '王静', '10004', '员工', '5000.00', '1988-05-12 00:00:00', '东北大学', '本科', '2019-05-01 10:17:00', '2024-05-01 10:17:00', '正常', '10005', '610481199510235817', '北京市昌平区育知东路', null);
INSERT INTO `employee` VALUES ('10014', '111', '张萌', '10004', '员工', '8000.00', '1988-05-12 00:00:00', '西安电子科技大学', '硕士', '2019-05-10 10:17:00', '2024-05-10 10:17:00', '正常', '10005', '610481199510235817', '北京市昌平区育知东路', null);
INSERT INTO `employee` VALUES ('10015', '111', '李应琴', '10005', '员工', '8000.00', '1988-05-12 00:00:00', '山西大学', '硕士', '2018-11-05 10:10:00', '2023-11-05 10:10:00', '正常', '10005', '610481199510235817', '北京市昌平区育知东路', null);
INSERT INTO `employee` VALUES ('10016', '111', '白玉琼', '10005', '员工', '5000.00', '1988-05-12 00:00:00', '中北大学', '本科', '2019-06-01 11:00:36', '2024-06-01 10:10:00', '正常', '10005', '610481199510235817', '北京市昌平区育知东路', null);
INSERT INTO `employee` VALUES ('10017', '111', '李靖', '10005', '员工', '5000.00', '1988-05-12 00:00:00', '太原理工大学', '本科', '2019-06-01 11:00:36', '2024-06-01 11:00:36', '正常', '10005', '610481199510235817', '北京市昌平区育知东路', null);
INSERT INTO `employee` VALUES ('10018', '111', 'aaa', '10005', null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for labor_relation
-- ----------------------------
DROP TABLE IF EXISTS `labor_relation`;
CREATE TABLE `labor_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` varchar(20) DEFAULT NULL,
  `cause` varchar(100) DEFAULT NULL,
  `create_sn` char(5) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `next_deal_sn` char(5) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of labor_relation
-- ----------------------------

-- ----------------------------
-- Table structure for labor_relation_record
-- ----------------------------
DROP TABLE IF EXISTS `labor_relation_record`;
CREATE TABLE `labor_relation_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `labor_relation_id` int(11) DEFAULT NULL,
  `deal_sn` varchar(5) DEFAULT NULL,
  `deal_time` datetime DEFAULT NULL,
  `deal_way` varchar(20) DEFAULT NULL,
  `deal_result` varchar(20) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of labor_relation_record
-- ----------------------------

-- ----------------------------
-- Table structure for leaveinfo
-- ----------------------------
DROP TABLE IF EXISTS `leaveinfo`;
CREATE TABLE `leaveinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reason` varchar(255) DEFAULT NULL,
  `create_sn` varchar(5) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `next_deal_sn` varchar(5) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of leaveinfo
-- ----------------------------
INSERT INTO `leaveinfo` VALUES ('31', '生病，请假一天', '10006', '2019-06-01 17:39:09', '2019-06-01 00:00:00', '2019-06-02 00:00:00', null, '已审核');
INSERT INTO `leaveinfo` VALUES ('32', '家里有事，请假一天', '10006', '2019-05-09 12:06:55', '2019-05-10 00:00:00', '2019-05-10 00:00:00', null, '已审核');
INSERT INTO `leaveinfo` VALUES ('33', '病假', '10006', '2019-06-13 10:10:18', '2019-06-14 00:00:00', '2019-06-14 00:00:00', null, '已审核');

-- ----------------------------
-- Table structure for leave_record
-- ----------------------------
DROP TABLE IF EXISTS `leave_record`;
CREATE TABLE `leave_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `leave_id` int(11) DEFAULT NULL,
  `deal_sn` varchar(5) DEFAULT NULL,
  `deal_time` datetime DEFAULT NULL,
  `deal_way` varchar(20) DEFAULT NULL,
  `deal_result` varchar(20) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of leave_record
-- ----------------------------
INSERT INTO `leave_record` VALUES ('52', '31', '10006', '2019-06-01 17:39:16', '提交', '已提交', '无');
INSERT INTO `leave_record` VALUES ('53', '31', '10011', '2019-06-01 17:40:27', '通过', '待复审', '');
INSERT INTO `leave_record` VALUES ('54', '31', '10012', '2019-06-01 17:41:41', '通过', '已审核', '');
INSERT INTO `leave_record` VALUES ('55', '32', '10006', '2019-05-09 14:09:14', '提交', '已提交', '无');
INSERT INTO `leave_record` VALUES ('56', '32', '10011', '2019-05-09 14:09:32', '通过', '待复审', '');
INSERT INTO `leave_record` VALUES ('57', '32', '10012', '2019-05-09 14:10:29', '通过', '已审核', '');
INSERT INTO `leave_record` VALUES ('58', '33', '10006', '2019-06-13 10:10:25', '提交', '已提交', '无');
INSERT INTO `leave_record` VALUES ('59', '33', '10011', '2019-06-13 10:10:53', '通过', '待复审', '');
INSERT INTO `leave_record` VALUES ('60', '33', '10012', '2019-06-13 10:11:57', '通过', '已审核', '');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_sn` varchar(5) DEFAULT NULL,
  `department_sn` varchar(5) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('3', '10001', '10001', '2019-06-03 14:43:51', '安全检查公告', '接到物业通知，在下午六点到七点之间进行消防安全检查，禁止在室内吸烟。');
INSERT INTO `notice` VALUES ('4', '10001', '10001', '2019-05-10 14:43:51', '停水公告', '由于楼内自来水管检修，在下午六点到七点会停水，请大家做好储水。');
INSERT INTO `notice` VALUES ('6', '10003', '10003', '2019-06-08 09:53:07', '培训公告', '王东升同学将于2019年6月10日在11F大会议室进行python自动化测试培训，新入职同学必须参加，其余同学有兴趣也可以参加。');
INSERT INTO `notice` VALUES ('7', '10011', '10005', '2019-06-13 15:59:25', '停水公告', '本楼于6月13日下午1点到3点停水');

-- ----------------------------
-- Table structure for salary
-- ----------------------------
DROP TABLE IF EXISTS `salary`;
CREATE TABLE `salary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(5) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `times` varchar(10) DEFAULT NULL,
  `base_salary` varchar(10) DEFAULT NULL,
  `sign_in_number` int(11) DEFAULT NULL,
  `attendance_bonus` varchar(10) DEFAULT NULL,
  `total` varchar(10) DEFAULT NULL,
  `tax` varchar(10) DEFAULT NULL,
  `pay` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of salary
-- ----------------------------
INSERT INTO `salary` VALUES ('72', '10001', '秦卓珈', '2019年4月', '17000.00', '23', '300', '17300.0', '3806.0', '13494.0');
INSERT INTO `salary` VALUES ('73', '10002', '张少华', '2019年4月', '13000.00', '23', '300', '13300.0', '2926.0', '10374.0');
INSERT INTO `salary` VALUES ('74', '10003', '罗莎', '2019年4月', '13000.00', '23', '300', '13300.0', '2926.0', '10374.0');
INSERT INTO `salary` VALUES ('75', '10004', '段颖', '2019年4月', '13000.00', '23', '300', '13300.0', '2926.0', '10374.0');
INSERT INTO `salary` VALUES ('76', '10005', '李筱丹', '2019年4月', '8000.00', '23', '300', '8300.0', '1826.0', '6474.0');
INSERT INTO `salary` VALUES ('77', '10006', '徐浩', '2019年4月', '5000.00', '23', '300', '5300.0', '1166.0', '4134.0');
INSERT INTO `salary` VALUES ('78', '10007', '郝英明', '2019年4月', '8000.00', '23', '300', '8300.0', '1826.0', '6474.0');
INSERT INTO `salary` VALUES ('79', '10008', '任雪娟', '2019年4月', '7000.00', '23', '300', '7300.0', '1606.0', '5694.0');
INSERT INTO `salary` VALUES ('80', '10009', '张雪', '2019年4月', '8000.00', '18', '0', '8000.0', '1760.0', '6240.0');
INSERT INTO `salary` VALUES ('81', '10010', '李小龙', '2019年4月', '5000.00', '23', '300', '5300.0', '1166.0', '4134.0');
INSERT INTO `salary` VALUES ('82', '10011', '王东升', '2019年4月', '13000.00', '23', '300', '13300.0', '2926.0', '10374.0');
INSERT INTO `salary` VALUES ('83', '10012', '刘琳琳', '2019年4月', '8000.00', '23', '300', '8300.0', '1826.0', '6474.0');
INSERT INTO `salary` VALUES ('84', '10013', '王静', '2019年4月', '5000.00', '23', '300', '5300.0', '1166.0', '4134.0');
INSERT INTO `salary` VALUES ('85', '10014', '张萌', '2019年4月', '8000.00', '23', '300', '8300.0', '1826.0', '6474.0');
INSERT INTO `salary` VALUES ('86', '10015', '李应琴', '2019年4月', '8000.00', '23', '300', '8300.0', '1826.0', '6474.0');
INSERT INTO `salary` VALUES ('87', '10016', '白玉琼', '2019年4月', '5000.00', '23', '300', '5300.0', '1166.0', '4134.0');
INSERT INTO `salary` VALUES ('88', '10017', '李靖', '2019年4月', '5000.00', '23', '300', '5300.0', '1166.0', '4134.0');
INSERT INTO `salary` VALUES ('89', '10001', '秦卓珈', '2019年3月', '17000.00', '24', '300', '17300.0', '3806.0', '13494.0');
INSERT INTO `salary` VALUES ('90', '10002', '张少华', '2019年3月', '13000.00', '24', '300', '13300.0', '2926.0', '10374.0');
INSERT INTO `salary` VALUES ('91', '10003', '罗莎', '2019年3月', '13000.00', '24', '300', '13300.0', '2926.0', '10374.0');
INSERT INTO `salary` VALUES ('92', '10004', '段颖', '2019年3月', '13000.00', '24', '300', '13300.0', '2926.0', '10374.0');
INSERT INTO `salary` VALUES ('93', '10005', '李筱丹', '2019年3月', '8000.00', '24', '300', '8300.0', '1826.0', '6474.0');
INSERT INTO `salary` VALUES ('94', '10006', '徐浩', '2019年3月', '5000.00', '24', '300', '5300.0', '1166.0', '4134.0');
INSERT INTO `salary` VALUES ('95', '10007', '郝英明', '2019年3月', '8000.00', '24', '300', '8300.0', '1826.0', '6474.0');
INSERT INTO `salary` VALUES ('96', '10008', '任雪娟', '2019年3月', '7000.00', '24', '300', '7300.0', '1606.0', '5694.0');
INSERT INTO `salary` VALUES ('97', '10009', '张雪', '2019年3月', '8000.00', '19', '0', '8000.0', '1760.0', '6240.0');
INSERT INTO `salary` VALUES ('98', '10010', '李小龙', '2019年3月', '5000.00', '24', '300', '5300.0', '1166.0', '4134.0');
INSERT INTO `salary` VALUES ('99', '10011', '王东升', '2019年3月', '13000.00', '24', '300', '13300.0', '2926.0', '10374.0');
INSERT INTO `salary` VALUES ('100', '10012', '刘琳琳', '2019年3月', '8000.00', '24', '300', '8300.0', '1826.0', '6474.0');
INSERT INTO `salary` VALUES ('101', '10013', '王静', '2019年3月', '5000.00', '24', '300', '5300.0', '1166.0', '4134.0');
INSERT INTO `salary` VALUES ('102', '10014', '张萌', '2019年3月', '8000.00', '24', '300', '8300.0', '1826.0', '6474.0');
INSERT INTO `salary` VALUES ('103', '10015', '李应琴', '2019年3月', '8000.00', '24', '300', '8300.0', '1826.0', '6474.0');
INSERT INTO `salary` VALUES ('104', '10016', '白玉琼', '2019年3月', '5000.00', '24', '300', '5300.0', '1166.0', '4134.0');
INSERT INTO `salary` VALUES ('105', '10017', '李靖', '2019年3月', '5000.00', '24', '300', '5300.0', '1166.0', '4134.0');

-- ----------------------------
-- Table structure for sign_in
-- ----------------------------
DROP TABLE IF EXISTS `sign_in`;
CREATE TABLE `sign_in` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sign_in_sn` varchar(5) DEFAULT NULL,
  `sign_in_time` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=640 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sign_in
-- ----------------------------
INSERT INTO `sign_in` VALUES ('35', '10006', '2019-06-12 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('36', '10006', '2019-06-11 08:54:26', '正常');
INSERT INTO `sign_in` VALUES ('39', '10006', '2019-06-07 08:45:26', '正常');
INSERT INTO `sign_in` VALUES ('40', '10006', '2019-06-06 08:45:26', '正常');
INSERT INTO `sign_in` VALUES ('41', '10006', '2019-06-05 08:45:26', '正常');
INSERT INTO `sign_in` VALUES ('43', '10006', '2019-06-03 08:45:26', '正常');
INSERT INTO `sign_in` VALUES ('46', '10006', '2019-05-31 08:45:26', '正常');
INSERT INTO `sign_in` VALUES ('47', '10006', '2019-05-30 08:45:26', '正常');
INSERT INTO `sign_in` VALUES ('48', '10006', '2019-05-29 08:45:26', '正常');
INSERT INTO `sign_in` VALUES ('49', '10006', '2019-05-28 08:45:26', '正常');
INSERT INTO `sign_in` VALUES ('50', '10006', '2019-05-27 08:45:26', '正常');
INSERT INTO `sign_in` VALUES ('53', '10006', '2019-05-24 08:45:26', '正常');
INSERT INTO `sign_in` VALUES ('54', '10006', '2019-05-23 08:45:26', '正常');
INSERT INTO `sign_in` VALUES ('55', '10006', '2019-05-22 08:45:26', '正常');
INSERT INTO `sign_in` VALUES ('56', '10006', '2019-05-21 08:45:26', '正常');
INSERT INTO `sign_in` VALUES ('57', '10006', '2019-05-20 08:45:26', '正常');
INSERT INTO `sign_in` VALUES ('58', '10006', '2019-05-19 08:45:26', '正常');
INSERT INTO `sign_in` VALUES ('59', '10006', '2019-05-18 08:45:26', '正常');
INSERT INTO `sign_in` VALUES ('60', '10006', '2019-05-17 08:45:26', '正常');
INSERT INTO `sign_in` VALUES ('61', '10006', '2019-05-16 08:45:26', '正常');
INSERT INTO `sign_in` VALUES ('62', '10006', '2019-05-15 08:45:26', '正常');
INSERT INTO `sign_in` VALUES ('64', '10006', '2019-05-13 08:45:26', '正常');
INSERT INTO `sign_in` VALUES ('65', '10006', '2019-05-12 08:45:26', '正常');
INSERT INTO `sign_in` VALUES ('66', '10006', '2019-05-11 08:45:26', '正常');
INSERT INTO `sign_in` VALUES ('68', '10006', '2019-05-09 08:45:26', '正常');
INSERT INTO `sign_in` VALUES ('69', '10006', '2019-05-08 08:45:26', '正常');
INSERT INTO `sign_in` VALUES ('73', '10006', '2019-05-04 08:45:26', '正常');
INSERT INTO `sign_in` VALUES ('74', '10006', '2019-05-03 08:45:26', '正常');
INSERT INTO `sign_in` VALUES ('75', '10006', '2019-05-02 08:45:26', '正常');
INSERT INTO `sign_in` VALUES ('76', '10006', '2019-05-01 08:45:26', '正常');
INSERT INTO `sign_in` VALUES ('77', '10005', '2019-06-12 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('78', '10005', '2019-06-11 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('79', '10005', '2019-06-10 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('80', '10005', '2019-06-09 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('81', '10005', '2019-06-08 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('82', '10005', '2019-06-07 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('83', '10005', '2019-06-06 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('84', '10005', '2019-06-05 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('85', '10005', '2019-06-04 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('86', '10005', '2019-06-03 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('87', '10005', '2019-06-02 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('88', '10005', '2019-06-01 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('89', '10005', '2019-05-31 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('90', '10005', '2019-05-30 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('91', '10005', '2019-05-29 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('92', '10005', '2019-05-28 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('93', '10005', '2019-05-27 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('94', '10005', '2019-05-26 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('95', '10005', '2019-05-25 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('96', '10005', '2019-05-24 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('97', '10005', '2019-05-23 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('98', '10005', '2019-05-21 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('99', '10005', '2019-05-20 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('100', '10005', '2019-05-19 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('101', '10005', '2019-05-18 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('102', '10005', '2019-05-17 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('103', '10005', '2019-05-16 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('104', '10005', '2019-05-15 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('105', '10005', '2019-05-14 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('106', '10005', '2019-05-13 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('107', '10005', '2019-05-12 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('108', '10005', '2019-05-11 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('109', '10005', '2019-05-10 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('110', '10005', '2019-05-09 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('111', '10005', '2019-05-08 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('112', '10005', '2019-05-07 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('113', '10005', '2019-05-06 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('114', '10005', '2019-05-05 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('115', '10005', '2019-05-04 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('116', '10005', '2019-05-03 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('117', '10005', '2019-05-02 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('118', '10005', '2019-05-01 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('119', '10004', '2019-06-12 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('120', '10004', '2019-06-11 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('121', '10004', '2019-06-10 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('130', '10004', '2019-06-01 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('131', '10004', '2019-05-31 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('132', '10004', '2019-05-30 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('133', '10004', '2019-05-29 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('134', '10004', '2019-05-28 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('135', '10004', '2019-05-27 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('136', '10004', '2019-05-26 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('137', '10004', '2019-05-25 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('138', '10004', '2019-05-24 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('139', '10004', '2019-05-23 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('141', '10004', '2019-05-21 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('142', '10004', '2019-05-20 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('143', '10004', '2019-05-19 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('144', '10004', '2019-05-18 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('145', '10004', '2019-05-17 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('152', '10004', '2019-05-10 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('153', '10004', '2019-05-09 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('154', '10004', '2019-05-08 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('155', '10004', '2019-05-07 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('156', '10004', '2019-05-06 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('157', '10004', '2019-05-05 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('158', '10004', '2019-05-04 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('159', '10004', '2019-05-03 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('160', '10004', '2019-05-02 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('161', '10004', '2019-05-01 08:50:26', '正常');
INSERT INTO `sign_in` VALUES ('162', '10004', '2019-04-30 08:50:05', '正常');
INSERT INTO `sign_in` VALUES ('163', '10003', '2019-06-12 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('164', '10003', '2019-06-11 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('165', '10003', '2019-06-10 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('166', '10003', '2019-06-09 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('167', '10003', '2019-06-08 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('168', '10003', '2019-06-07 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('169', '10003', '2019-06-06 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('170', '10003', '2019-06-05 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('171', '10003', '2019-06-04 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('172', '10003', '2019-06-03 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('173', '10003', '2019-06-02 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('174', '10003', '2019-06-01 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('175', '10003', '2019-05-31 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('176', '10003', '2019-05-30 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('177', '10003', '2019-05-29 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('178', '10003', '2019-05-28 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('179', '10003', '2019-05-27 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('186', '10003', '2019-05-20 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('187', '10003', '2019-05-19 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('188', '10003', '2019-05-18 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('189', '10003', '2019-05-17 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('191', '10003', '2019-05-15 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('193', '10003', '2019-05-13 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('194', '10003', '2019-05-12 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('195', '10003', '2019-05-11 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('196', '10003', '2019-05-10 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('197', '10003', '2019-05-09 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('198', '10003', '2019-05-08 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('199', '10003', '2019-05-07 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('200', '10003', '2019-05-06 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('201', '10003', '2019-05-05 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('202', '10003', '2019-05-04 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('203', '10003', '2019-05-03 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('204', '10003', '2019-05-02 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('205', '10003', '2019-05-01 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('206', '10003', '2019-04-30 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('207', '10002', '2019-06-12 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('208', '10002', '2019-06-11 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('209', '10002', '2019-06-10 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('210', '10002', '2019-06-09 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('211', '10002', '2019-06-08 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('212', '10002', '2019-06-07 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('213', '10002', '2019-06-06 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('214', '10002', '2019-06-05 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('215', '10002', '2019-06-04 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('216', '10002', '2019-06-03 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('217', '10002', '2019-06-02 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('218', '10002', '2019-06-01 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('219', '10002', '2019-05-31 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('220', '10002', '2019-05-30 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('221', '10002', '2019-05-29 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('222', '10002', '2019-05-28 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('223', '10002', '2019-05-27 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('224', '10002', '2019-05-26 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('225', '10002', '2019-05-25 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('226', '10002', '2019-05-24 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('227', '10002', '2019-05-23 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('228', '10002', '2019-05-22 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('229', '10002', '2019-05-21 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('230', '10002', '2019-05-20 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('231', '10002', '2019-05-19 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('232', '10002', '2019-05-18 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('233', '10002', '2019-05-17 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('234', '10002', '2019-05-16 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('235', '10002', '2019-05-15 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('236', '10002', '2019-05-14 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('237', '10002', '2019-05-13 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('238', '10002', '2019-05-12 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('239', '10002', '2019-05-11 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('250', '10001', '2019-06-12 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('251', '10001', '2019-06-11 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('252', '10001', '2019-06-10 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('253', '10001', '2019-06-09 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('254', '10001', '2019-06-08 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('255', '10001', '2019-06-07 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('256', '10001', '2019-06-06 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('257', '10001', '2019-06-05 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('258', '10001', '2019-06-04 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('259', '10001', '2019-06-03 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('260', '10001', '2019-06-02 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('261', '10001', '2019-06-01 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('262', '10001', '2019-05-31 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('263', '10001', '2019-05-30 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('264', '10001', '2019-05-29 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('265', '10001', '2019-05-28 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('266', '10001', '2019-05-27 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('267', '10001', '2019-05-26 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('268', '10001', '2019-05-25 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('269', '10001', '2019-05-24 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('270', '10001', '2019-05-23 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('271', '10001', '2019-05-22 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('272', '10001', '2019-05-21 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('273', '10001', '2019-05-20 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('274', '10001', '2019-05-19 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('275', '10001', '2019-05-18 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('276', '10001', '2019-05-17 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('277', '10001', '2019-05-16 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('286', '10001', '2019-05-07 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('287', '10001', '2019-05-06 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('288', '10001', '2019-05-05 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('289', '10001', '2019-05-04 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('290', '10001', '2019-05-03 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('291', '10001', '2019-05-02 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('292', '10001', '2019-05-01 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('293', '10007', '2019-06-12 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('294', '10007', '2019-06-11 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('295', '10007', '2019-06-10 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('296', '10007', '2019-06-09 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('297', '10007', '2019-06-08 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('298', '10007', '2019-06-07 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('299', '10007', '2019-06-06 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('300', '10007', '2019-06-05 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('301', '10007', '2019-06-04 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('302', '10007', '2019-06-03 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('303', '10007', '2019-06-02 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('304', '10007', '2019-06-01 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('305', '10007', '2019-05-31 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('306', '10007', '2019-05-30 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('308', '10007', '2019-05-28 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('309', '10007', '2019-05-27 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('317', '10007', '2019-05-19 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('318', '10007', '2019-05-18 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('319', '10007', '2019-05-17 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('320', '10007', '2019-05-16 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('321', '10007', '2019-05-15 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('322', '10007', '2019-05-14 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('323', '10007', '2019-05-13 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('324', '10007', '2019-05-12 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('325', '10007', '2019-05-11 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('326', '10007', '2019-05-10 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('327', '10007', '2019-05-09 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('328', '10007', '2019-05-08 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('329', '10007', '2019-05-07 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('330', '10007', '2019-05-06 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('331', '10007', '2019-05-03 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('332', '10007', '2019-05-02 08:54:14', '正常');
INSERT INTO `sign_in` VALUES ('333', '10007', '2019-05-01 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('334', '10008', '2019-06-12 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('335', '10008', '2019-06-11 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('336', '10008', '2019-06-10 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('337', '10008', '2019-06-07 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('338', '10008', '2019-06-06 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('339', '10008', '2019-06-05 16:40:23', '正常');
INSERT INTO `sign_in` VALUES ('340', '10008', '2019-06-04 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('341', '10008', '2019-06-03 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('342', '10008', '2019-05-31 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('343', '10008', '2019-05-30 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('344', '10008', '2019-05-29 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('345', '10008', '2019-05-28 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('346', '10008', '2019-05-27 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('347', '10008', '2019-05-24 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('348', '10008', '2019-05-23 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('349', '10008', '2019-05-22 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('350', '10008', '2019-05-21 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('351', '10008', '2019-05-20 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('352', '10008', '2019-05-17 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('353', '10008', '2019-05-16 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('354', '10008', '2019-05-15 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('355', '10008', '2019-05-14 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('356', '10008', '2019-05-13 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('357', '10008', '2019-05-10 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('358', '10008', '2019-05-09 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('359', '10008', '2019-05-08 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('360', '10008', '2019-05-07 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('361', '10008', '2019-05-06 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('362', '10008', '2019-05-03 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('363', '10008', '2019-05-02 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('364', '10008', '2019-05-01 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('365', '10009', '2019-06-12 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('366', '10009', '2019-06-11 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('367', '10009', '2019-06-10 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('368', '10009', '2019-06-07 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('369', '10009', '2019-06-06 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('370', '10009', '2019-06-05 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('371', '10009', '2019-06-04 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('372', '10009', '2019-06-03 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('373', '10009', '2019-05-31 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('374', '10009', '2019-05-30 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('375', '10009', '2019-05-29 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('376', '10009', '2019-05-28 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('377', '10009', '2019-05-27 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('378', '10009', '2019-05-24 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('379', '10009', '2019-05-23 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('380', '10009', '2019-05-22 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('381', '10009', '2019-05-21 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('382', '10009', '2019-05-20 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('383', '10009', '2019-05-17 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('384', '10009', '2019-05-16 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('385', '10009', '2019-05-14 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('386', '10009', '2019-05-13 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('387', '10009', '2019-05-03 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('388', '10009', '2019-05-02 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('389', '10009', '2019-05-01 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('390', '10010', '2019-06-12 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('391', '10010', '2019-06-11 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('392', '10010', '2019-06-10 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('393', '10010', '2019-06-07 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('394', '10010', '2019-06-06 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('395', '10010', '2019-06-05 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('396', '10010', '2019-06-04 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('397', '10010', '2019-06-03 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('398', '10010', '2019-05-31 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('399', '10010', '2019-05-30 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('400', '10010', '2019-05-29 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('401', '10010', '2019-05-28 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('402', '10010', '2019-05-27 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('403', '10010', '2019-05-24 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('404', '10010', '2019-05-23 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('405', '10010', '2019-05-22 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('406', '10010', '2019-05-21 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('407', '10010', '2019-05-20 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('408', '10010', '2019-05-17 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('409', '10010', '2019-05-16 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('410', '10010', '2019-05-15 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('411', '10010', '2019-05-14 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('412', '10010', '2019-05-13 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('413', '10010', '2019-05-10 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('414', '10010', '2019-05-09 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('415', '10010', '2019-05-08 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('416', '10010', '2019-05-07 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('417', '10010', '2019-05-06 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('418', '10010', '2019-05-03 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('419', '10010', '2019-05-02 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('420', '10010', '2019-05-02 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('421', '10010', '2019-05-01 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('422', '10011', '2019-06-12 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('423', '10011', '2019-06-11 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('424', '10011', '2019-06-10 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('425', '10011', '2019-06-07 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('426', '10011', '2019-06-06 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('427', '10011', '2019-06-05 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('428', '10011', '2019-06-04 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('429', '10011', '2019-06-03 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('430', '10011', '2019-05-31 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('431', '10011', '2019-05-30 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('432', '10011', '2019-05-29 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('433', '10011', '2019-05-28 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('434', '10011', '2019-05-27 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('435', '10011', '2019-05-24 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('436', '10011', '2019-05-23 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('437', '10011', '2019-05-22 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('438', '10011', '2019-05-21 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('439', '10011', '2019-05-20 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('440', '10011', '2019-05-17 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('441', '10011', '2019-05-16 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('442', '10011', '2019-05-15 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('443', '10011', '2019-05-14 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('444', '10011', '2019-05-13 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('445', '10011', '2019-05-10 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('446', '10011', '2019-05-09 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('447', '10011', '2019-05-08 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('448', '10011', '2019-05-07 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('449', '10011', '2019-05-06 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('450', '10011', '2019-05-03 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('451', '10011', '2019-05-02 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('452', '10011', '2019-05-01 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('453', '10012', '2019-06-12 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('454', '10012', '2019-06-11 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('455', '10012', '2019-06-10 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('456', '10012', '2019-06-07 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('457', '10012', '2019-06-06 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('458', '10012', '2019-06-05 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('459', '10012', '2019-06-04 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('460', '10012', '2019-06-03 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('461', '10012', '2019-05-31 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('462', '10012', '2019-05-30 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('463', '10012', '2019-05-29 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('464', '10012', '2019-05-28 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('465', '10012', '2019-05-27 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('466', '10012', '2019-05-24 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('467', '10012', '2019-05-23 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('468', '10012', '2019-05-22 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('469', '10012', '2019-05-21 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('470', '10012', '2019-05-20 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('471', '10012', '2019-05-17 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('472', '10012', '2019-05-16 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('473', '10012', '2019-05-15 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('474', '10012', '2019-05-14 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('475', '10012', '2019-05-13 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('476', '10012', '2019-05-10 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('477', '10012', '2019-05-09 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('478', '10012', '2019-05-08 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('479', '10012', '2019-05-07 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('480', '10012', '2019-05-06 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('481', '10012', '2019-05-03 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('482', '10012', '2019-05-02 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('483', '10012', '2019-05-01 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('484', '10013', '2019-06-12 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('485', '10013', '2019-06-11 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('486', '10013', '2019-06-10 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('487', '10013', '2019-06-07 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('488', '10013', '2019-06-06 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('489', '10013', '2019-06-05 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('490', '10013', '2019-06-04 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('491', '10013', '2019-06-03 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('492', '10013', '2019-05-31 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('493', '10013', '2019-05-30 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('494', '10013', '2019-05-29 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('495', '10013', '2019-05-28 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('496', '10013', '2019-05-27 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('497', '10013', '2019-05-24 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('498', '10013', '2019-05-23 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('499', '10013', '2019-05-22 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('500', '10013', '2019-05-21 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('501', '10013', '2019-05-20 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('502', '10013', '2019-05-17 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('503', '10013', '2019-05-16 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('504', '10013', '2019-05-15 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('505', '10013', '2019-05-14 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('506', '10013', '2019-05-13 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('507', '10013', '2019-05-10 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('508', '10013', '2019-05-09 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('509', '10013', '2019-05-08 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('510', '10013', '2019-05-07 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('511', '10013', '2019-05-06 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('512', '10013', '2019-05-03 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('513', '10013', '2019-05-02 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('514', '10013', '2019-05-01 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('515', '10014', '2019-06-12 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('516', '10014', '2019-06-11 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('517', '10014', '2019-06-10 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('518', '10014', '2019-06-07 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('519', '10014', '2019-06-06 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('520', '10014', '2019-06-05 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('521', '10014', '2019-06-04 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('522', '10014', '2019-06-03 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('523', '10014', '2019-05-31 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('524', '10014', '2019-05-30 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('525', '10014', '2019-05-29 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('526', '10014', '2019-05-28 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('527', '10014', '2019-05-27 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('528', '10014', '2019-05-24 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('529', '10014', '2019-05-23 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('530', '10014', '2019-05-22 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('531', '10014', '2019-05-21 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('532', '10014', '2019-05-20 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('533', '10014', '2019-05-17 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('534', '10014', '2019-05-16 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('535', '10014', '2019-05-15 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('536', '10014', '2019-05-14 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('537', '10014', '2019-05-13 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('538', '10014', '2019-05-10 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('539', '10014', '2019-05-09 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('540', '10014', '2019-05-08 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('541', '10014', '2019-05-07 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('542', '10014', '2019-05-06 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('543', '10014', '2019-05-03 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('544', '10014', '2019-05-02 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('545', '10014', '2019-05-01 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('546', '10015', '2019-06-12 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('547', '10015', '2019-06-11 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('548', '10015', '2019-06-10 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('549', '10015', '2019-06-07 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('550', '10015', '2019-06-06 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('551', '10015', '2019-06-05 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('552', '10015', '2019-06-04 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('553', '10015', '2019-06-03 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('554', '10015', '2019-05-31 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('555', '10015', '2019-05-30 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('556', '10015', '2019-05-29 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('557', '10015', '2019-05-28 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('558', '10015', '2019-05-27 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('559', '10015', '2019-05-24 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('560', '10015', '2019-05-23 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('561', '10015', '2019-05-22 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('562', '10015', '2019-05-21 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('563', '10015', '2019-05-20 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('564', '10015', '2019-05-17 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('565', '10015', '2019-05-16 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('566', '10015', '2019-05-15 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('567', '10015', '2019-05-14 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('568', '10015', '2019-05-13 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('569', '10015', '2019-05-10 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('570', '10015', '2019-05-09 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('571', '10015', '2019-05-08 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('572', '10015', '2019-05-07 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('573', '10015', '2019-05-06 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('574', '10015', '2019-05-03 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('575', '10015', '2019-05-02 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('576', '10015', '2019-05-01 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('577', '10016', '2019-06-12 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('578', '10016', '2019-06-11 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('579', '10016', '2019-06-10 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('580', '10016', '2019-06-07 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('581', '10016', '2019-06-06 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('582', '10016', '2019-06-05 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('583', '10016', '2019-06-04 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('584', '10016', '2019-06-03 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('585', '10016', '2019-05-31 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('586', '10016', '2019-05-30 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('587', '10016', '2019-05-29 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('588', '10016', '2019-05-28 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('589', '10016', '2019-05-27 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('590', '10016', '2019-05-24 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('591', '10016', '2019-05-23 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('592', '10016', '2019-05-22 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('593', '10016', '2019-05-21 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('594', '10016', '2019-05-20 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('595', '10016', '2019-05-17 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('596', '10016', '2019-05-16 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('597', '10016', '2019-05-15 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('598', '10016', '2019-05-14 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('599', '10016', '2019-05-13 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('600', '10016', '2019-05-10 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('601', '10016', '2019-05-09 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('602', '10016', '2019-05-08 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('603', '10016', '2019-05-07 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('604', '10016', '2019-05-06 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('605', '10016', '2019-05-03 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('606', '10016', '2019-05-02 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('607', '10016', '2019-05-01 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('608', '10017', '2019-06-12 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('609', '10017', '2019-06-11 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('610', '10017', '2019-06-10 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('611', '10017', '2019-06-07 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('612', '10017', '2019-06-06 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('613', '10017', '2019-06-05 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('614', '10017', '2019-06-04 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('615', '10017', '2019-06-03 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('616', '10017', '2019-05-31 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('617', '10017', '2019-05-30 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('618', '10017', '2019-05-29 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('619', '10017', '2019-05-28 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('620', '10017', '2019-05-27 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('621', '10017', '2019-05-24 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('622', '10017', '2019-05-23 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('623', '10017', '2019-05-22 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('624', '10017', '2019-05-21 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('625', '10017', '2019-05-17 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('626', '10017', '2019-05-20 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('627', '10017', '2019-05-16 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('628', '10017', '2019-05-15 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('629', '10017', '2019-05-14 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('630', '10017', '2019-05-13 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('631', '10017', '2019-05-10 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('632', '10017', '2019-05-09 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('633', '10017', '2019-05-08 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('634', '10017', '2019-05-07 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('635', '10017', '2019-05-06 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('636', '10017', '2019-05-03 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('637', '10017', '2019-05-02 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('638', '10017', '2019-05-01 08:37:53', '正常');
INSERT INTO `sign_in` VALUES ('639', '10006', '2019-06-13 15:55:59', '迟到');
