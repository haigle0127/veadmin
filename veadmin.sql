/*
 Navicat Premium Data Transfer

 Source Server         : 本地连接
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost:3306
 Source Schema         : weadmin

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 27/02/2018 16:19:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blog_comment
-- ----------------------------
DROP TABLE IF EXISTS `blog_comment`;
CREATE TABLE `blog_comment`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '评论主键ID',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父ID',
  `posts_id` bigint(20) NULL DEFAULT NULL COMMENT '文章ID',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '评论者ID',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `updater` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '软删除',
  `ip_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者地址',
  `status` int(10) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for blog_option
-- ----------------------------
DROP TABLE IF EXISTS `blog_option`;
CREATE TABLE `blog_option`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'key值',
  `option_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'value值',
  `autoload` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes' COMMENT '自动加载 yes或者no',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `option_name`(`option_name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for blog_posts
-- ----------------------------
DROP TABLE IF EXISTS `blog_posts`;
CREATE TABLE `blog_posts`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '标题',
  `excerpt` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '摘录或者简介',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `clicks` int(10) NOT NULL COMMENT '点击量',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `updater` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '软删除',
  `ip_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者地址',
  `status` int(10) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for blog_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_tag`;
CREATE TABLE `blog_tag`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '标签主键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for blog_user
-- ----------------------------
DROP TABLE IF EXISTS `blog_user`;
CREATE TABLE `blog_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `email` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `password` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `introduction` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户简介',
  `sex` tinyint(4) NULL DEFAULT 0 COMMENT '用户性别',
  `birth_at` timestamp NULL DEFAULT NULL COMMENT '出生日期',
  `real_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实名',
  `id_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `location` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户位置',
  `remember_token` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户token',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` int(10) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_abilities
-- ----------------------------
DROP TABLE IF EXISTS `sys_abilities`;
CREATE TABLE `sys_abilities`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `parent_id` int(10) NOT NULL COMMENT '父级编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `sort` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '10' COMMENT '排序',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `href` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接',
  `permission` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `is_show` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否在菜单中显示',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_abilities
-- ----------------------------
INSERT INTO `sys_abilities` VALUES ('1', 0, '功能菜单', '0', 'fa-paper-plane', '/', NULL, '1', '2018-01-18 23:38:29', '2017-10-15 00:21:59');
INSERT INTO `sys_abilities` VALUES ('1589915135324581', 3, '添加编辑', '', 'fa-paper-plane', '/admin/user/save', NULL, 'on', '2018-01-18 23:38:28', '2018-01-18 15:50:02');
INSERT INTO `sys_abilities` VALUES ('1589915288722603', 3, '编辑信息', '', 'fa-paper-plane', '/admin/user/get_find', NULL, 'on', '2018-01-18 23:38:27', '2018-01-18 15:42:56');
INSERT INTO `sys_abilities` VALUES ('1589917014815888', 3, '删除', '', 'fa-paper-plane', '/admin/user/del', NULL, 'on', '2018-01-18 23:38:30', '2018-01-18 16:10:22');
INSERT INTO `sys_abilities` VALUES ('1589917803742122', 4, '添加编辑', '', 'fa-paper-plane', '/admin/role/save', NULL, 'on', '2018-01-18 23:38:27', '2018-01-18 16:22:54');
INSERT INTO `sys_abilities` VALUES ('1589917905316174', 4, '编辑信息', '', 'fa-paper-plane', '/admin/role/get_find', NULL, 'on', '2018-01-18 23:38:27', '2018-01-18 16:24:31');
INSERT INTO `sys_abilities` VALUES ('1589918168544183', 4, '删除', '', 'fa-paper-plane', '/admin/role/del', NULL, 'on', '2018-01-18 23:38:26', '2018-01-18 16:28:42');
INSERT INTO `sys_abilities` VALUES ('1589918202475924', 4, '权限', '', 'fa-paper-plane', '/admin/role/get_power', NULL, 'on', '2018-01-18 23:38:32', '2018-01-18 16:29:14');
INSERT INTO `sys_abilities` VALUES ('1589918245209256', 5, '添加编辑', '', 'fa-paper-plane', '/admin/menu/save', NULL, 'on', '2018-01-18 23:38:26', '2018-01-18 16:29:55');
INSERT INTO `sys_abilities` VALUES ('1589918286669976', 5, '编辑信息', '', 'fa-paper-plane', '/admin/menu/get_find', NULL, 'on', '2018-01-18 23:38:25', '2018-01-18 16:30:35');
INSERT INTO `sys_abilities` VALUES ('1589918835757815', 5, '删除', '', 'fa-paper-plane', '/admin/menu', NULL, 'on', '2018-01-18 23:38:25', '2018-01-18 16:39:18');
INSERT INTO `sys_abilities` VALUES ('2', 1, '系统设置', '1', 'fa-gears', '/admin/index/dashboard', NULL, 'on', '2018-01-18 23:38:08', '2017-10-15 00:30:52');
INSERT INTO `sys_abilities` VALUES ('3', 2, '用户管理', '10', 'fa-paper-plane', '/admin/user/index', NULL, 'on', '2018-01-18 23:38:22', '2017-10-15 00:29:43');
INSERT INTO `sys_abilities` VALUES ('4', 2, '角色管理', '20', 'fa-paper-plane', '/admin/role/index', NULL, 'on', '2018-01-18 23:38:23', '2017-10-15 00:28:36');
INSERT INTO `sys_abilities` VALUES ('5', 2, '菜单管理', '30', 'fa-paper-plane', '/admin/menu/index', NULL, '1', '2018-01-18 23:38:24', '2017-10-15 00:33:43');
INSERT INTO `sys_abilities` VALUES ('6', 1, '博客管理', '2', 'fa-anchor', '/admin/aa', NULL, 'on', '2018-01-18 23:39:09', '2017-10-15 00:35:49');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日志表ID',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `ip_address` char(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '1 成功 2 失败',
  `add_time` timestamp NULL DEFAULT NULL COMMENT '发生时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名',
  `ename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色英文名',
  `role_type` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色类型',
  `display_name` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色简介',
  `description` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色备注',
  `usable` int(64) NOT NULL DEFAULT 1 COMMENT '是否可用',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '系统管理员', 'object', 'object', '这是个上帝角色', '有任何权限的人', 1, '2017-10-15 00:43:28', '2017-10-15 00:43:30');
INSERT INTO `sys_role` VALUES ('2', 'test1', 'test1', 'object', 'test1', 'test1', 0, '2017-12-07 22:37:12', '2017-12-07 22:37:12');
INSERT INTO `sys_role` VALUES ('3', 'test2', 'test2', 'object', 'test2', 'test2', 0, '2017-12-07 22:37:31', '2017-12-07 22:37:31');

-- ----------------------------
-- Table structure for sys_role_abilities
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_abilities`;
CREATE TABLE `sys_role_abilities`  (
  `role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `abilities_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_abilities
-- ----------------------------
INSERT INTO `sys_role_abilities` VALUES ('1', '1', NULL);
INSERT INTO `sys_role_abilities` VALUES ('1', '2', NULL);
INSERT INTO `sys_role_abilities` VALUES ('1', '3', NULL);
INSERT INTO `sys_role_abilities` VALUES ('1', '4', NULL);
INSERT INTO `sys_role_abilities` VALUES ('1', '5', NULL);
INSERT INTO `sys_role_abilities` VALUES ('1', '6', NULL);
INSERT INTO `sys_role_abilities` VALUES ('2', '1', '2018-01-18 17:33:31');
INSERT INTO `sys_role_abilities` VALUES ('2', '2', '2018-01-18 17:33:31');
INSERT INTO `sys_role_abilities` VALUES ('2', '4', '2018-01-18 17:33:31');
INSERT INTO `sys_role_abilities` VALUES ('2', '1589917803742122', '2018-01-18 17:33:31');
INSERT INTO `sys_role_abilities` VALUES ('2', '1589917905316174', '2018-01-18 17:33:31');
INSERT INTO `sys_role_abilities` VALUES ('2', '1589918168544183', '2018-01-18 17:33:31');
INSERT INTO `sys_role_abilities` VALUES ('2', '1589918202475924', '2018-01-18 17:33:31');
INSERT INTO `sys_role_abilities` VALUES ('2', '6', '2018-01-18 17:33:31');
INSERT INTO `sys_role_abilities` VALUES ('3', '1', '2018-01-22 14:13:01');
INSERT INTO `sys_role_abilities` VALUES ('3', '2', '2018-01-22 14:13:01');
INSERT INTO `sys_role_abilities` VALUES ('3', '4', '2018-01-22 14:13:01');
INSERT INTO `sys_role_abilities` VALUES ('3', '1589917803742122', '2018-01-22 14:13:01');
INSERT INTO `sys_role_abilities` VALUES ('3', '1589917905316174', '2018-01-22 14:13:01');
INSERT INTO `sys_role_abilities` VALUES ('3', '1589918168544183', '2018-01-22 14:13:01');
INSERT INTO `sys_role_abilities` VALUES ('3', '1589918202475924', '2018-01-22 14:13:01');
INSERT INTO `sys_role_abilities` VALUES ('3', '5', '2018-01-22 14:13:01');
INSERT INTO `sys_role_abilities` VALUES ('3', '1589918245209256', '2018-01-22 14:13:01');
INSERT INTO `sys_role_abilities` VALUES ('3', '1589918286669976', '2018-01-22 14:13:01');
INSERT INTO `sys_role_abilities` VALUES ('3', '1589918835757815', '2018-01-22 14:13:01');
INSERT INTO `sys_role_abilities` VALUES ('3', '6', '2018-01-22 14:13:01');
INSERT INTO `sys_role_abilities` VALUES ('1590917030933028', '1', '2018-01-29 17:05:20');
INSERT INTO `sys_role_abilities` VALUES ('1590917030933028', '2', '2018-01-29 17:05:20');
INSERT INTO `sys_role_abilities` VALUES ('1590917030933028', '3', '2018-01-29 17:05:20');
INSERT INTO `sys_role_abilities` VALUES ('1590917030933028', '1589915135324581', '2018-01-29 17:05:20');
INSERT INTO `sys_role_abilities` VALUES ('1590917030933028', '1589915288722603', '2018-01-29 17:05:20');
INSERT INTO `sys_role_abilities` VALUES ('1590917030933028', '1589917014815888', '2018-01-29 17:05:20');
INSERT INTO `sys_role_abilities` VALUES ('1590917030933028', '4', '2018-01-29 17:05:20');
INSERT INTO `sys_role_abilities` VALUES ('1590917030933028', '1589917803742122', '2018-01-29 17:05:20');
INSERT INTO `sys_role_abilities` VALUES ('1590917030933028', '1589917905316174', '2018-01-29 17:05:20');
INSERT INTO `sys_role_abilities` VALUES ('1590917030933028', '1589918168544183', '2018-01-29 17:05:20');
INSERT INTO `sys_role_abilities` VALUES ('1590917030933028', '1589918202475924', '2018-01-29 17:05:20');
INSERT INTO `sys_role_abilities` VALUES ('1590917030933028', '5', '2018-01-29 17:05:20');
INSERT INTO `sys_role_abilities` VALUES ('1590917030933028', '1589918245209256', '2018-01-29 17:05:20');
INSERT INTO `sys_role_abilities` VALUES ('1590917030933028', '1589918286669976', '2018-01-29 17:05:20');
INSERT INTO `sys_role_abilities` VALUES ('1590917030933028', '1589918835757815', '2018-01-29 17:05:20');
INSERT INTO `sys_role_abilities` VALUES ('1590917030933028', '6', '2018-01-29 17:05:20');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `email` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `password` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `introduction` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户简介',
  `sex` tinyint(4) NULL DEFAULT 0 COMMENT '用户性别',
  `birth_at` timestamp NULL DEFAULT NULL COMMENT '出生日期',
  `real_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实名',
  `id_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `location` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户位置',
  `remember_token` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户token',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` int(10) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE,
  UNIQUE INDEX `users_phone_unique`(`phone`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '940121265@qq.com', '13843796666', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.ImFkbWluIg.5iLvvLohi9Lz6Xy_wlrB9uypZzOoHJ2cBr09u2IeicQ', '个人介绍，签名啥的', 0, '1993-02-18 22:57:22', '动画', 'haigle', NULL, NULL, '2017-09-27 21:32:44', '2017-09-27 21:32:41', NULL, 1);
INSERT INTO `sys_user` VALUES ('1589935614637746', 'te', 'a@qq.com', '12342456543', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.ImFkbWluIg.5iLvvLohi9Lz6Xy_wlrB9uypZzOoHJ2cBr09u2IeicQ', NULL, 0, '2018-01-18 00:00:00', NULL, NULL, NULL, NULL, '2018-01-18 21:06:00', '2018-01-18 21:06:00', NULL, 1);
INSERT INTO `sys_user` VALUES ('1589935737474995', 'wq', 'q@qq.com', '12343233333', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.ImFkbWluIg.5iLvvLohi9Lz6Xy_wlrB9uypZzOoHJ2cBr09u2IeicQ', NULL, 0, '2018-01-18 21:07:56', NULL, NULL, NULL, NULL, '2018-01-18 21:07:57', '2018-01-18 21:07:57', NULL, 1);
INSERT INTO `sys_user` VALUES ('1589936878501239', 'wefr', 'werf@aa.com', '12342334555', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.ImFkbWluIg.5iLvvLohi9Lz6Xy_wlrB9uypZzOoHJ2cBr09u2IeicQ', NULL, 0, '2018-01-18 21:25:09', NULL, NULL, NULL, NULL, '2018-01-18 21:26:05', '2018-01-29 17:48:13', NULL, 1);
INSERT INTO `sys_user` VALUES ('1593541396913056', 'sdf', 'dsf@qwe.com', '12321098675', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.ImFkbWluIg.5iLvvLohi9Lz6Xy_wlrB9uypZzOoHJ2cBr09u2IeicQ', NULL, 0, '2018-02-27 00:00:00', NULL, NULL, NULL, NULL, '2018-02-27 16:18:22', '2018-02-27 16:18:22', NULL, 1);
INSERT INTO `sys_user` VALUES ('2', 'qwer', 'qwe@g.com', '12345678911', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.ImFkbWluIg.5iLvvLohi9Lz6Xy_wlrB9uypZzOoHJ2cBr09u2IeicQ', NULL, 0, '2018-01-07 00:00:00', NULL, NULL, NULL, NULL, '2018-01-10 22:36:26', '2018-01-18 16:59:14', NULL, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1', '2018-01-07 17:30:48');
INSERT INTO `sys_user_role` VALUES ('0', '2', '2018-01-11 22:55:53');
INSERT INTO `sys_user_role` VALUES ('0', '3', '2018-01-11 22:55:53');
INSERT INTO `sys_user_role` VALUES ('0', '2', '2018-01-18 16:12:45');
INSERT INTO `sys_user_role` VALUES ('2', '2', '2018-01-18 16:59:14');
INSERT INTO `sys_user_role` VALUES ('0', '2', '2018-01-18 21:06:00');
INSERT INTO `sys_user_role` VALUES ('0', '2', '2018-01-18 21:26:05');
INSERT INTO `sys_user_role` VALUES ('0', '1', '2018-02-27 16:11:56');
INSERT INTO `sys_user_role` VALUES ('0', '1', '2018-02-27 16:18:22');

SET FOREIGN_KEY_CHECKS = 1;
