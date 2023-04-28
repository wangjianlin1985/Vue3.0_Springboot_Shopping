/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : db_mall

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2022-04-17 16:12:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_newbee_mall_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_admin_user`;
CREATE TABLE `tb_newbee_mall_admin_user` (
  `admin_user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `login_user_name` varchar(50) NOT NULL COMMENT '管理员登陆名称',
  `login_password` varchar(50) NOT NULL COMMENT '管理员登陆密码',
  `nick_name` varchar(50) NOT NULL COMMENT '管理员显示昵称',
  `locked` tinyint(4) DEFAULT '0' COMMENT '是否锁定 0未锁定 1已锁定无法登陆',
  PRIMARY KEY (`admin_user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_newbee_mall_admin_user
-- ----------------------------
INSERT INTO `tb_newbee_mall_admin_user` VALUES ('1', 'boss', 'e10adc3949ba59abbe56e057f20f883e', '我是伞兵', '0');
INSERT INTO `tb_newbee_mall_admin_user` VALUES ('2', 'bro001', 'e10adc3949ba59abbe56e057f20f883e', '店铺1号伙计', '0');
INSERT INTO `tb_newbee_mall_admin_user` VALUES ('3', 'bro002', 'e10adc3949ba59abbe56e057f20f883e', '店铺2号伙计', '0');

-- ----------------------------
-- Table structure for tb_newbee_mall_admin_user_token
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_admin_user_token`;
CREATE TABLE `tb_newbee_mall_admin_user_token` (
  `admin_user_id` bigint(20) NOT NULL COMMENT '用户主键id',
  `token` varchar(32) NOT NULL COMMENT 'token值(32位字符串)',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `expire_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'token过期时间',
  PRIMARY KEY (`admin_user_id`),
  UNIQUE KEY `uq_token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_newbee_mall_admin_user_token
-- ----------------------------
INSERT INTO `tb_newbee_mall_admin_user_token` VALUES ('1', 'd0a20901eecb57448381680487de1926', '2022-04-16 12:07:56', '2022-04-18 12:07:56');

-- ----------------------------
-- Table structure for tb_newbee_mall_carousel
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_carousel`;
CREATE TABLE `tb_newbee_mall_carousel` (
  `carousel_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '首页轮播图主键id',
  `carousel_url` varchar(100) NOT NULL DEFAULT '' COMMENT '轮播图',
  `redirect_url` varchar(100) NOT NULL DEFAULT '''##''' COMMENT '点击后的跳转地址(默认不跳转)',
  `carousel_rank` int(11) NOT NULL DEFAULT '0' COMMENT '排序值(字段越大越靠前)',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标识字段(0-未删除 1-已删除)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` int(11) NOT NULL DEFAULT '0' COMMENT '创建者id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` int(11) NOT NULL DEFAULT '0' COMMENT '修改者id',
  PRIMARY KEY (`carousel_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_newbee_mall_carousel
-- ----------------------------
INSERT INTO `tb_newbee_mall_carousel` VALUES ('9', 'http://localhost:8008/upload/20220416_11503410.png', 'https://m.vmall.com/product/10086436791172.html', '1', '0', '2022-04-16 11:50:27', '0', '2022-04-16 11:50:36', '0');
INSERT INTO `tb_newbee_mall_carousel` VALUES ('10', 'http://localhost:8008/upload/20220416_11513869.png', 'https://msale.vmall.com/erjiyinxiang.html', '12', '0', '2022-04-16 11:51:29', '0', '2022-04-16 11:51:40', '0');

-- ----------------------------
-- Table structure for tb_newbee_mall_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_goods_category`;
CREATE TABLE `tb_newbee_mall_goods_category` (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `category_level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '分类级别(1-一级分类 2-二级分类 3-三级分类)',
  `parent_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '父分类id',
  `category_name` varchar(50) NOT NULL DEFAULT '' COMMENT '分类名称',
  `category_rank` int(11) NOT NULL DEFAULT '0' COMMENT '排序值(字段越大越靠前)',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标识字段(0-未删除 1-已删除)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` int(11) NOT NULL DEFAULT '0' COMMENT '创建者id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` int(11) DEFAULT '0' COMMENT '修改者id',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_newbee_mall_goods_category
-- ----------------------------
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('15', '1', '0', '家电 数码 手机', '100', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('16', '1', '0', '女装 男装 穿搭', '99', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('17', '2', '15', '家电', '10', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('18', '2', '15', '数码', '9', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('19', '2', '15', '手机', '8', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('20', '3', '17', '生活电器', '0', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('21', '3', '17', '厨房电器', '0', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('22', '3', '17', '扫地机器人', '0', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('23', '3', '17', '吸尘器', '0', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('24', '3', '17', '取暖器', '0', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('25', '3', '17', '豆浆机', '0', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('26', '3', '17', '暖风机', '0', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('27', '3', '17', '加湿器', '0', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('28', '3', '17', '蓝牙音箱', '0', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('29', '3', '17', '烤箱', '0', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('30', '3', '17', '卷发器', '0', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('31', '3', '17', '空气净化器', '0', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('32', '3', '18', '游戏主机', '0', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('33', '3', '18', '数码精选', '0', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('34', '3', '18', '平板电脑', '0', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('35', '3', '18', '苹果 Apple', '0', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('36', '3', '18', '电脑主机', '0', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('37', '3', '18', '数码相机', '0', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('38', '3', '18', '电玩动漫', '0', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('39', '3', '18', '单反相机', '0', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('40', '3', '18', '键盘鼠标', '0', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('41', '3', '18', '无人机', '0', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('42', '3', '18', '二手电脑', '0', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('43', '3', '18', '二手手机', '0', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('44', '3', '19', 'iPhone 11', '89', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('45', '3', '19', '荣耀手机', '99', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('46', '3', '19', '华为手机', '98', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('47', '3', '19', '苹果 iPhone', '88', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('48', '3', '19', '华为 Mate 20', '79', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('49', '3', '19', '华为 P30', '97', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('50', '3', '19', '华为 P30 Pro', '0', '1', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('51', '3', '19', '小米手机', '0', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('52', '3', '19', '红米', '0', '1', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('53', '3', '19', 'OPPO', '0', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('54', '3', '19', '一加', '0', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('55', '3', '19', '小米 MIX', '0', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('56', '3', '19', 'Reno', '0', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('57', '3', '19', 'vivo', '0', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('58', '3', '19', '手机以旧换新', '0', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('59', '1', '0', '运动 户外 乐器', '97', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('60', '1', '0', '游戏 动漫 影视', '96', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('61', '1', '0', '家具 家饰 家纺', '98', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('62', '1', '0', '美妆 清洁 宠物', '94', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('63', '1', '0', '工具 装修 建材', '93', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('64', '1', '0', 'test12', '0', '1', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('65', '1', '0', '玩具 孕产 用品', '0', '1', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('66', '1', '0', '鞋靴 箱包 配件', '91', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('67', '2', '16', '女装', '10', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('68', '2', '16', '男装', '9', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('69', '2', '16', '穿搭', '8', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('70', '2', '61', '家具', '10', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('71', '2', '61', '家饰', '9', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('72', '2', '61', '家纺', '8', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('73', '2', '59', '运动', '10', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('74', '2', '59', '户外', '9', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('75', '2', '59', '乐器', '8', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('76', '3', '67', '外套', '10', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('77', '3', '70', '沙发', '10', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('78', '3', '73', '跑鞋', '10', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('79', '2', '60', '游戏', '10', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('80', '2', '60', '动漫', '9', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('81', '2', '60', '影视', '8', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('82', '3', '79', 'LOL', '10', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('83', '2', '62', '美妆', '10', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('84', '2', '62', '宠物', '9', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('85', '2', '62', '清洁', '8', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('86', '3', '83', '口红', '10', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('87', '2', '63', '工具', '10', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('88', '2', '63', '装修', '9', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('89', '2', '63', '建材', '8', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('90', '3', '87', '转换器', '10', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('91', '2', '64', '珠宝', '10', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('92', '2', '64', '金饰', '9', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('93', '2', '64', '眼镜', '8', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('94', '3', '91', '钻石', '10', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('95', '2', '66', '鞋靴', '10', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('96', '2', '66', '箱包', '9', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('97', '2', '66', '配件', '8', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('98', '3', '95', '休闲鞋', '10', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('99', '3', '83', '气垫', '0', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('100', '3', '83', '美白', '0', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('101', '3', '83', '隔离霜', '0', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('102', '3', '83', '粉底', '0', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('103', '3', '83', '腮红', '0', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('104', '3', '83', '睫毛膏', '0', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('105', '3', '83', '香水', '0', '1', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('106', '3', '83', '面膜', '0', '1', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('107', '1', '0', '2344', '1', '1', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('108', '1', '0', '测试分类', '50', '1', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('109', '2', '15', 'xxx', '0', '1', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('110', '3', '17', 'wer', '0', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('111', '1', '0', '测试分类2', '255', '1', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('112', '2', '111', '测试分类2-1', '0', '1', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('113', '1', '0', '商品类目1', '200', '1', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('114', '1', '0', '商品类目1', '200', '1', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('115', '2', '65', '玩具', '0', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('116', '3', '115', '机器人', '0', '0', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');
INSERT INTO `tb_newbee_mall_goods_category` VALUES ('117', '2', '15', 'yyy', '12', '1', '2022-04-16 10:55:57', '0', '2022-04-16 10:55:57', '0');

-- ----------------------------
-- Table structure for tb_newbee_mall_goods_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_goods_info`;
CREATE TABLE `tb_newbee_mall_goods_info` (
  `goods_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品表主键id',
  `goods_name` varchar(200) NOT NULL DEFAULT '' COMMENT '商品名',
  `goods_intro` varchar(200) NOT NULL DEFAULT '' COMMENT '商品简介',
  `goods_category_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '关联分类id',
  `goods_cover_img` varchar(200) NOT NULL DEFAULT '/admin/dist/img/no-img.png' COMMENT '商品主图',
  `goods_carousel` varchar(500) NOT NULL DEFAULT '/admin/dist/img/no-img.png' COMMENT '商品轮播图',
  `goods_detail_content` text NOT NULL COMMENT '商品详情',
  `original_price` int(11) NOT NULL DEFAULT '1' COMMENT '商品价格',
  `selling_price` int(11) NOT NULL DEFAULT '1' COMMENT '商品实际售价',
  `stock_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品库存数量',
  `tag` varchar(20) NOT NULL DEFAULT '' COMMENT '商品标签',
  `goods_sell_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '商品上架状态 1-下架 0-上架',
  `create_user` int(11) NOT NULL DEFAULT '0' COMMENT '添加者主键id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '商品添加时间',
  `update_user` int(11) NOT NULL DEFAULT '0' COMMENT '修改者主键id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '商品修改时间',
  PRIMARY KEY (`goods_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10908 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_newbee_mall_goods_info
-- ----------------------------
INSERT INTO `tb_newbee_mall_goods_info` VALUES ('10904', '华为P50', '原色双影像单元', '46', 'http://localhost:8008/upload/20220416_11201239.jpg', '/admin/dist/img/no-img.png', '<p><img src=\"http://localhost:8008/upload/20220416_11202082.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><br/></p>', '4488', '4488', '398', '手机', '0', '0', '2022-04-16 11:20:34', '0', '2022-04-16 11:26:56');
INSERT INTO `tb_newbee_mall_goods_info` VALUES ('10905', 'HUAWEI P40 Pro', 'HUAWEI P40 Pro 5G 全网通 8GB+128GB（亮黑色）', '46', 'http://localhost:8008/upload/20220416_11244253.png', '/admin/dist/img/no-img.png', '<p><img src=\"http://localhost:8008/upload/20220416_11245822.jpg\" style=\"max-width:100%;\" contenteditable=\"false\" width=\"100%\"/></p>', '5988', '5988', '200', '手机', '0', '0', '2022-04-16 11:25:15', '0', '2022-04-16 11:25:15');
INSERT INTO `tb_newbee_mall_goods_info` VALUES ('10906', 'FreeBuds耳机', '高订配色，优雅随行', '33', 'http://localhost:8008/upload/20220416_11291691.jpg', '/admin/dist/img/no-img.png', '<p><img src=\"http://localhost:8008/upload/20220416_1143039.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '1024', '1024', '1024', '耳机', '0', '0', '2022-04-16 11:43:25', '0', '2022-04-16 11:43:25');
INSERT INTO `tb_newbee_mall_goods_info` VALUES ('10907', 'HUAWEI FreeBuds Pro', '【无线充版】HUAWEI FreeBuds Pro 真无线耳机 无线充版（冰霜银）主动降噪 人声透传 快充长续航', '33', 'http://localhost:8008/upload/20220416_11470222.png', '/admin/dist/img/no-img.png', '<p><img src=\"http://localhost:8008/upload/20220416_11453963.png\" style=\"max-width:100%;\" contenteditable=\"false\" width=\"100%\"/><img src=\"http://localhost:8008/upload/20220416_11465243.jpg\" style=\"max-width:100%;\" contenteditable=\"false\" width=\"100%\"/></p>', '899', '899', '1000', '耳机', '0', '0', '2022-04-16 11:47:04', '0', '2022-04-16 12:09:08');

-- ----------------------------
-- Table structure for tb_newbee_mall_index_config
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_index_config`;
CREATE TABLE `tb_newbee_mall_index_config` (
  `config_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '首页配置项主键id',
  `config_name` varchar(50) NOT NULL DEFAULT '' COMMENT '显示字符(配置搜索时不可为空，其他可为空)',
  `config_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1-搜索框热搜 2-搜索下拉框热搜 3-(首页)热销商品 4-(首页)新品上线 5-(首页)为你推荐',
  `goods_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商品id 默认为0',
  `redirect_url` varchar(100) NOT NULL DEFAULT '##' COMMENT '点击后的跳转地址(默认不跳转)',
  `config_rank` int(11) NOT NULL DEFAULT '0' COMMENT '排序值(字段越大越靠前)',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标识字段(0-未删除 1-已删除)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` int(11) NOT NULL DEFAULT '0' COMMENT '创建者id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最新修改时间',
  `update_user` int(11) DEFAULT '0' COMMENT '修改者id',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_newbee_mall_index_config
-- ----------------------------
INSERT INTO `tb_newbee_mall_index_config` VALUES ('30', 'HUAWEI P40 Pro', '3', '10905', '##', '1', '0', '2022-04-16 11:25:42', '0', '2022-04-16 11:25:42', '0');
INSERT INTO `tb_newbee_mall_index_config` VALUES ('31', '华为P50', '3', '10904', '##', '2', '0', '2022-04-16 11:25:56', '0', '2022-04-16 11:25:56', '0');
INSERT INTO `tb_newbee_mall_index_config` VALUES ('32', 'FreeBuds耳机', '3', '10906', '##', '3', '0', '2022-04-16 11:43:49', '0', '2022-04-16 11:43:49', '0');
INSERT INTO `tb_newbee_mall_index_config` VALUES ('33', 'HUAWEI FreeBuds Pro', '3', '10907', '##', '1', '0', '2022-04-16 11:47:32', '0', '2022-04-16 11:47:32', '0');

-- ----------------------------
-- Table structure for tb_newbee_mall_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_order`;
CREATE TABLE `tb_newbee_mall_order` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单表主键id',
  `order_no` varchar(20) NOT NULL DEFAULT '' COMMENT '订单号',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户主键id',
  `total_price` int(11) NOT NULL DEFAULT '1' COMMENT '订单总价',
  `pay_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '支付状态:0.未支付,1.支付成功,-1:支付失败',
  `pay_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0.无 1.支付宝支付 2.微信支付',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `order_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单状态:0.待支付 1.已支付 2.配货完成 3:出库成功 4.交易成功 -1.手动关闭 -2.超时关闭 -3.商家关闭',
  `extra_info` varchar(100) NOT NULL DEFAULT '' COMMENT '订单body',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标识字段(0-未删除 1-已删除)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最新修改时间',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_newbee_mall_order
-- ----------------------------
INSERT INTO `tb_newbee_mall_order` VALUES ('4', '16500819783143266', '7', '8976', '1', '1', '2022-04-16 12:06:20', '3', '', '0', '2022-04-16 12:06:18', '2022-04-16 12:08:42');

-- ----------------------------
-- Table structure for tb_newbee_mall_order_address
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_order_address`;
CREATE TABLE `tb_newbee_mall_order_address` (
  `order_id` bigint(20) NOT NULL,
  `user_name` varchar(30) NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `user_phone` varchar(11) NOT NULL DEFAULT '' COMMENT '收货人手机号',
  `province_name` varchar(32) NOT NULL DEFAULT '' COMMENT '省',
  `city_name` varchar(32) NOT NULL DEFAULT '' COMMENT '城',
  `region_name` varchar(32) NOT NULL DEFAULT '' COMMENT '区',
  `detail_address` varchar(64) NOT NULL DEFAULT '' COMMENT '收件详细地址(街道/楼宇/单元)',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单收货地址关联表';

-- ----------------------------
-- Records of tb_newbee_mall_order_address
-- ----------------------------
INSERT INTO `tb_newbee_mall_order_address` VALUES ('1', '王大红', '18892993733', '北京', '北京市', '东城区', 'xx街道xx小区');
INSERT INTO `tb_newbee_mall_order_address` VALUES ('2', '王晓红', '18892993755', '河北省', '石家庄市', '长安区', '长安区xx街道xx号');
INSERT INTO `tb_newbee_mall_order_address` VALUES ('3', '王晓红', '18892993755', '河北省', '石家庄市', '长安区', '长安区xx街道xx号');
INSERT INTO `tb_newbee_mall_order_address` VALUES ('4', '王晓红', '18892993755', '山西省', '太原市', '小店区', '小店区xx街道xx号');

-- ----------------------------
-- Table structure for tb_newbee_mall_order_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_order_item`;
CREATE TABLE `tb_newbee_mall_order_item` (
  `order_item_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单关联购物项主键id',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单主键id',
  `goods_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '关联商品id',
  `goods_name` varchar(200) NOT NULL DEFAULT '' COMMENT '下单时商品的名称(订单快照)',
  `goods_cover_img` varchar(200) NOT NULL DEFAULT '' COMMENT '下单时商品的主图(订单快照)',
  `selling_price` int(11) NOT NULL DEFAULT '1' COMMENT '下单时商品的价格(订单快照)',
  `goods_count` int(11) NOT NULL DEFAULT '1' COMMENT '数量(订单快照)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`order_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_newbee_mall_order_item
-- ----------------------------
INSERT INTO `tb_newbee_mall_order_item` VALUES ('6', '4', '10904', '华为P50', 'http://localhost:8008/upload/20220416_11201239.jpg', '4488', '2', '2022-04-16 12:06:18');

-- ----------------------------
-- Table structure for tb_newbee_mall_shopping_cart_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_shopping_cart_item`;
CREATE TABLE `tb_newbee_mall_shopping_cart_item` (
  `cart_item_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '购物项主键id',
  `user_id` bigint(20) NOT NULL COMMENT '用户主键id',
  `goods_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '关联商品id',
  `goods_count` int(11) NOT NULL DEFAULT '1' COMMENT '数量(最大为5)',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标识字段(0-未删除 1-已删除)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最新修改时间',
  PRIMARY KEY (`cart_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_newbee_mall_shopping_cart_item
-- ----------------------------
INSERT INTO `tb_newbee_mall_shopping_cart_item` VALUES ('6', '7', '10904', '2', '1', '2022-04-16 12:05:39', '2022-04-16 12:05:43');
INSERT INTO `tb_newbee_mall_shopping_cart_item` VALUES ('7', '7', '10905', '1', '0', '2022-04-16 12:06:33', '2022-04-16 12:06:33');
INSERT INTO `tb_newbee_mall_shopping_cart_item` VALUES ('8', '7', '10907', '1', '0', '2022-04-16 12:06:37', '2022-04-16 12:06:37');

-- ----------------------------
-- Table structure for tb_newbee_mall_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_user`;
CREATE TABLE `tb_newbee_mall_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户主键id',
  `nick_name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `login_name` varchar(11) NOT NULL DEFAULT '' COMMENT '登陆名称(默认为手机号)',
  `password_md5` varchar(32) NOT NULL DEFAULT '' COMMENT 'MD5加密后的密码',
  `introduce_sign` varchar(100) NOT NULL DEFAULT '' COMMENT '个性签名',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '注销标识字段(0-正常 1-已注销)',
  `locked_flag` tinyint(4) NOT NULL DEFAULT '0' COMMENT '锁定标识字段(0-未锁定 1-已锁定)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_newbee_mall_user
-- ----------------------------
INSERT INTO `tb_newbee_mall_user` VALUES ('1', '旺达', '18892993733', 'e10adc3949ba59abbe56e057f20f883e', '二话不说就是买', '0', '0', '2022-04-16 11:48:40');
INSERT INTO `tb_newbee_mall_user` VALUES ('6', '李佳佳', '13711113333', 'e10adc3949ba59abbe56e057f20f883e', '测试用户李佳佳', '0', '0', '2022-04-16 11:57:26');
INSERT INTO `tb_newbee_mall_user` VALUES ('7', '18892993755', '18892993755', 'e10adc3949ba59abbe56e057f20f883e', '我是省钱小能手', '0', '0', '2022-04-16 11:55:32');

-- ----------------------------
-- Table structure for tb_newbee_mall_user_address
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_user_address`;
CREATE TABLE `tb_newbee_mall_user_address` (
  `address_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户主键id',
  `user_name` varchar(30) NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `user_phone` varchar(11) NOT NULL DEFAULT '' COMMENT '收货人手机号',
  `default_flag` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否为默认 0-非默认 1-是默认',
  `province_name` varchar(32) NOT NULL DEFAULT '' COMMENT '省',
  `city_name` varchar(32) NOT NULL DEFAULT '' COMMENT '城',
  `region_name` varchar(32) NOT NULL DEFAULT '' COMMENT '区',
  `detail_address` varchar(64) NOT NULL DEFAULT '' COMMENT '收件详细地址(街道/楼宇/单元)',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标识字段(0-未删除 1-已删除)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='收货地址表';

-- ----------------------------
-- Records of tb_newbee_mall_user_address
-- ----------------------------
INSERT INTO `tb_newbee_mall_user_address` VALUES ('1', '1', '王大红', '18892993733', '1', '北京', '北京市', '东城区', 'xx街道xx小区', '0', '2022-04-16 11:48:40', '2022-04-16 11:48:40');
INSERT INTO `tb_newbee_mall_user_address` VALUES ('2', '7', '王晓红', '18892993755', '1', '山西省', '太原市', '小店区', '小店区xx街道xx号', '0', '2022-04-16 11:57:26', '2022-04-16 12:06:11');
INSERT INTO `tb_newbee_mall_user_address` VALUES ('3', '7', '旺达哈', '18892995678', '0', '北京', '北京市', '西城区', '三生三世十里桃花', '0', '2022-04-16 12:07:15', '2022-04-16 12:07:15');

-- ----------------------------
-- Table structure for tb_newbee_mall_user_token
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_user_token`;
CREATE TABLE `tb_newbee_mall_user_token` (
  `user_id` bigint(20) NOT NULL COMMENT '用户主键id',
  `token` varchar(32) NOT NULL COMMENT 'token值(32位字符串)',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `expire_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'token过期时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `uq_token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_newbee_mall_user_token
-- ----------------------------
INSERT INTO `tb_newbee_mall_user_token` VALUES ('1', '1df209550b20457ea2887873d4db33eb', '2022-04-16 11:48:40', '2022-04-23 11:48:40');
INSERT INTO `tb_newbee_mall_user_token` VALUES ('7', '8fea1aa495e48c94da64e124060e911a', '2022-04-16 12:04:42', '2022-04-18 12:04:42');
