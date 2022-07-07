/*
 Navicat Premium Data Transfer

 Source Server         : ContestSystem
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : contest_system

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 13/05/2021 22:56:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `path` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name_zh` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon_cls` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `component` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES (1, '/admin', 'AdminIndex', '首页', 'el-icon-s-home', 'AdminIndex', 0);
INSERT INTO `admin_menu` VALUES (2, '/admin/dashboard', 'DashboardAdmin', '个人信息', NULL, 'dashboard/admin/index', 1);
INSERT INTO `admin_menu` VALUES (3, '/admin', 'User', '用户管理', 'el-icon-user', 'AdminIndex', 0);
INSERT INTO `admin_menu` VALUES (4, '/admin', 'Content', '竞赛信息管理', 'el-icon-tickets', 'AdminIndex', 0);
INSERT INTO `admin_menu` VALUES (5, '/admin', 'System', '竞赛管理', 'el-icon-tickets', 'AdminIndex', 0);
INSERT INTO `admin_menu` VALUES (6, '/admin', 'Analyse', '统计汇总分析', 'el-icon-tickets', 'AdminIndex', 0);
INSERT INTO `admin_menu` VALUES (7, '/admin/user/role', 'Role', '角色配置', NULL, 'user/Role', 3);
INSERT INTO `admin_menu` VALUES (8, '/admin/contestinfo/article', 'AriticleManagement', '文章信息', NULL, 'contestinfo/AriticleManagement', 4);
INSERT INTO `admin_menu` VALUES (9, '/admin/contestinfo/item', 'ItemManagement', '竞赛项目', NULL, 'contestinfo/ItemManagement', 4);
INSERT INTO `admin_menu` VALUES (10, '/admin/contestinfo/file', 'FileManagement', '文件管理', NULL, 'contestinfo/FileManagement', 4);
INSERT INTO `admin_menu` VALUES (18, '/admin/user/profile', 'Profile', '用户信息', NULL, 'user/UserProfile', 3);
INSERT INTO `admin_menu` VALUES (19, '/admin/contest/apply', 'ApplyManagement', '报名信息', NULL, 'contest/ApplyManagement', 5);
INSERT INTO `admin_menu` VALUES (20, '/admin/contest/award', 'Awardmanagement', '获奖信息', NULL, 'contest/Awardmanagement', 5);
INSERT INTO `admin_menu` VALUES (21, '/admin/analyse/apply', 'ApplyAnalyse', '参赛情况', NULL, 'analyse/ApplyAnalyse', 6);
INSERT INTO `admin_menu` VALUES (22, '/admin/analyse/award', 'AwardAnalyse', '获奖情况', NULL, 'analyse/AwardAnalyse', 6);
INSERT INTO `admin_menu` VALUES (23, '/admin/user/student', 'StudentInfo', '学生信息', NULL, 'user/StudentInfo', 3);
INSERT INTO `admin_menu` VALUES (24, '/admin/user/teacher', 'TeacherInfo', '老师信息', NULL, 'user/TeacherInfo', 3);

-- ----------------------------
-- Table structure for admin_permission
-- ----------------------------
DROP TABLE IF EXISTS `admin_permission`;
CREATE TABLE `admin_permission`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_permission
-- ----------------------------
INSERT INTO `admin_permission` VALUES (1, 'users_management', '用户管理', '/admin/user');
INSERT INTO `admin_permission` VALUES (2, 'roles_management', '角色管理', '/admin/role');
INSERT INTO `admin_permission` VALUES (3, 'content_management', '竞赛管理', '/admin/content');
INSERT INTO `admin_permission` VALUES (4, 'analyse_management', '统计汇总分析', '/admin/analyse');

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name_zh` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enabled` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role
-- ----------------------------
INSERT INTO `admin_role` VALUES (1, 'sysAdmin', '系统管理员', 1);
INSERT INTO `admin_role` VALUES (2, 'student', '学生', 1);
INSERT INTO `admin_role` VALUES (3, 'teacher', '老师', 1);
INSERT INTO `admin_role` VALUES (10, 'csmanager', '竞赛负责人', 1);

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `rid` int(0) NULL DEFAULT NULL,
  `mid` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 297 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------
INSERT INTO `admin_role_menu` VALUES (19, 4, 1);
INSERT INTO `admin_role_menu` VALUES (20, 4, 2);
INSERT INTO `admin_role_menu` VALUES (23, 9, 1);
INSERT INTO `admin_role_menu` VALUES (24, 9, 2);
INSERT INTO `admin_role_menu` VALUES (234, 2, 3);
INSERT INTO `admin_role_menu` VALUES (235, 2, 6);
INSERT INTO `admin_role_menu` VALUES (236, 2, 7);
INSERT INTO `admin_role_menu` VALUES (237, 2, 4);
INSERT INTO `admin_role_menu` VALUES (238, 2, 8);
INSERT INTO `admin_role_menu` VALUES (239, 2, 9);
INSERT INTO `admin_role_menu` VALUES (240, 2, 10);
INSERT INTO `admin_role_menu` VALUES (255, 14, 3);
INSERT INTO `admin_role_menu` VALUES (256, 14, 6);
INSERT INTO `admin_role_menu` VALUES (257, 14, 7);
INSERT INTO `admin_role_menu` VALUES (266, 1, 1);
INSERT INTO `admin_role_menu` VALUES (267, 1, 2);
INSERT INTO `admin_role_menu` VALUES (268, 1, 3);
INSERT INTO `admin_role_menu` VALUES (269, 1, 7);
INSERT INTO `admin_role_menu` VALUES (270, 1, 18);
INSERT INTO `admin_role_menu` VALUES (271, 1, 4);
INSERT INTO `admin_role_menu` VALUES (272, 1, 8);
INSERT INTO `admin_role_menu` VALUES (273, 1, 9);
INSERT INTO `admin_role_menu` VALUES (274, 1, 10);
INSERT INTO `admin_role_menu` VALUES (275, 1, 5);
INSERT INTO `admin_role_menu` VALUES (276, 1, 19);
INSERT INTO `admin_role_menu` VALUES (277, 1, 20);
INSERT INTO `admin_role_menu` VALUES (278, 1, 6);
INSERT INTO `admin_role_menu` VALUES (279, 1, 21);
INSERT INTO `admin_role_menu` VALUES (280, 1, 22);
INSERT INTO `admin_role_menu` VALUES (281, 10, 1);
INSERT INTO `admin_role_menu` VALUES (282, 10, 2);
INSERT INTO `admin_role_menu` VALUES (283, 10, 4);
INSERT INTO `admin_role_menu` VALUES (284, 10, 8);
INSERT INTO `admin_role_menu` VALUES (285, 10, 9);
INSERT INTO `admin_role_menu` VALUES (286, 10, 10);
INSERT INTO `admin_role_menu` VALUES (287, 10, 5);
INSERT INTO `admin_role_menu` VALUES (288, 10, 19);
INSERT INTO `admin_role_menu` VALUES (289, 10, 20);
INSERT INTO `admin_role_menu` VALUES (290, 10, 6);
INSERT INTO `admin_role_menu` VALUES (291, 10, 21);
INSERT INTO `admin_role_menu` VALUES (292, 10, 22);
INSERT INTO `admin_role_menu` VALUES (293, 3, 1);
INSERT INTO `admin_role_menu` VALUES (294, 3, 2);
INSERT INTO `admin_role_menu` VALUES (295, 3, 6);
INSERT INTO `admin_role_menu` VALUES (296, 3, 21);
INSERT INTO `admin_role_menu` VALUES (297, 3, 22);

-- ----------------------------
-- Table structure for admin_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permission`;
CREATE TABLE `admin_role_permission`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `rid` int(0) NULL DEFAULT NULL,
  `pid` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_role_permission_role_1`(`rid`) USING BTREE,
  INDEX `fk_role_permission_permission_1`(`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 182 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role_permission
-- ----------------------------
INSERT INTO `admin_role_permission` VALUES (168, 14, 2);
INSERT INTO `admin_role_permission` VALUES (176, 1, 1);
INSERT INTO `admin_role_permission` VALUES (177, 1, 2);
INSERT INTO `admin_role_permission` VALUES (178, 1, 3);
INSERT INTO `admin_role_permission` VALUES (179, 1, 4);
INSERT INTO `admin_role_permission` VALUES (180, 10, 3);
INSERT INTO `admin_role_permission` VALUES (181, 10, 4);
INSERT INTO `admin_role_permission` VALUES (182, 3, 4);

-- ----------------------------
-- Table structure for admin_user_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_role`;
CREATE TABLE `admin_user_role`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `uid` int(0) NULL DEFAULT NULL,
  `rid` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_operator_role_operator_1`(`uid`) USING BTREE,
  INDEX `fk_operator_role_role_1`(`rid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 118 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_user_role
-- ----------------------------
INSERT INTO `admin_user_role` VALUES (63, 3, 2);
INSERT INTO `admin_user_role` VALUES (103, 2, 10);
INSERT INTO `admin_user_role` VALUES (107, 17, 2);
INSERT INTO `admin_user_role` VALUES (108, 17, 3);
INSERT INTO `admin_user_role` VALUES (110, 4, 3);
INSERT INTO `admin_user_role` VALUES (111, 4, 10);
INSERT INTO `admin_user_role` VALUES (113, 18, 3);
INSERT INTO `admin_user_role` VALUES (114, 19, 2);
INSERT INTO `admin_user_role` VALUES (115, 1, 1);
INSERT INTO `admin_user_role` VALUES (116, 1, 2);
INSERT INTO `admin_user_role` VALUES (117, 1, 3);
INSERT INTO `admin_user_role` VALUES (118, 1, 10);

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `article_title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `article_file` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件',
  `article_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `article_date` datetime(0) NULL DEFAULT NULL COMMENT '发布日期',
  `article_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章类型 （notice news question result）存在check约束',
  `article_view_times` int(0) NULL DEFAULT 0 COMMENT '阅读量',
  `article_content_html` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '正文',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 154 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, '关于举办2021年全国大学生数学建模比赛的通知', '无', '管理员', '2021-04-16 21:07:42', '竞赛公告', 30, '<p><strong>粗体****关于举办2021年全国大学生数学建模比赛的通知</strong></p>\n<h1><a id=\"_1\"></a>比赛的通知</h1>\n<p><strong>粗体****关于举办2021年全国大学生数学建模比赛的通知</strong></p>\n<h1><a id=\"_3\"></a>比赛的通知</h1>\n<p>#<strong>粗体****关于举办2021年全国大学生数学建模比赛的通知</strong></p>\n<h1><a id=\"_5\"></a>比赛的通知</h1>\n<h2><a id=\"_6\"></a></h2>\n');
INSERT INTO `article` VALUES (2, '21年美国大学生数学建模竞赛的通知', '', '管理员', '2021-04-23 23:07:23', '竞赛公告', 47, '<h1 style=\"text-align:center;\"><a id=\"21_0\"></a>21年美国大学生数学建模竞赛的通知</h1>\n<p>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size=\"4\">21年美国大学生数学建模竞赛的通知21年美国大学生数学建模竞赛的通知21年美国大学生数学建模竞赛的通知21年美国大学生数学建模竞赛的通知21年美国大学生数学建模竞赛的通知21年美国大学生数学建模竞赛的通知21年美国大学生数学建模竞赛的通知21年美国大学生数学建模竞赛的通知21年美国大学生数学建模竞赛的通知21年美国大学生数学建模竞赛的通知21年美国大学生数学建模竞赛的通知21年美国大学生数学建模竞赛的通知21年美国大学生数学建模竞赛的通知21年美国大学生数学建模竞赛的通知21年美国大学生数学建模竞赛的通知21年美国大学生数学建模竞赛的通知21年美国大学生数学建模竞赛的通知21年美国大学生数学建模竞赛的通知21年美国大学生数学建模竞赛的通知21年美国大学生数学建模竞赛的通知21年美国大学生数学建模竞赛的通知。</font></p><p style=\"text-align:center;\"><img src=\"http://localhost:8088/file/article/img/1619190418690校徽 (1).jpg\" style=\"max-width:100%;\" width=\"334\" height=\"334\"/><font size=\"4\"><br/></font></p><p>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size=\"4\">21年美国大学生数学建模竞赛的通知21年美国大学生数学建模竞赛的通知21年美国大学生数学建模竞赛的通知21年美国大学生数学建模竞赛的通知21年美国大学生数学建模竞赛的通知21年美国大学生数学建模竞赛的通知。</font></p>');
INSERT INTO `article` VALUES (3, '学生能一人申报项目吗？', 'http://localhost:8088/file/article/doc/1620221427650捕获.JPG', '管理员', '2021-05-05 21:30:32', '常见问题', 23, '<p><strong>依据不同竞赛的参数人数要求判断</strong></p>\n<div class=\"hljs-center\">\n<p><strong>依据不同竞赛的参数人数要求判断</strong></p>\n<p><strong>依据不同竞赛的参数人数要求判断</strong></p>\n<div class=\"hljs-center\">\n<table>\n<thead>\n<tr>\n<th>12</th>\n<th>col123umn2</th>\n<th>colum312n3</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>content1</td>\n<td>content2</td>\n<td>content3</td>\n</tr>\n<tr>\n<td>content1</td>\n<td>content2</td>\n<td>content3</td>\n</tr>\n<tr>\n<td>content1</td>\n<td>content2</td>\n<td>content3</td>\n</tr>\n</tbody>\n</table>\n<p><strong>依据不同竞赛的参数人数要求判断</strong></p>\n</div>\n</div>');
INSERT INTO `article` VALUES (4, '学生如何报名参加比赛', '无', '管理员', '2021-03-10 00:00:00', '常见问题', 7, NULL);
INSERT INTO `article` VALUES (30, '关于选拔计算机科学与工程学院学生参加2021第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛的决定', '', '管理员', '2021-05-06 01:04:56', '竞赛公告', 13, '<p>惠州学院计算机科学与工程学院于2021年3月21日举行了2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”校内选拔赛，比赛使用“浙江农林大学第十九届程序设计竞赛暨天梯赛选拔赛（同步赛）”作为校内选拔平台。根据校内选拔赛的规则和排名结果，共选拔出30名学生，将分成三组（组内排名不分先后顺序），代表惠州学院计算机科学与工程学院参加2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛。名单如下：</p><p style=\"text-align:center;\"><img src=\"http://localhost:8088/file/article/img/1620234240589360截图20210506010344545.jpg\" style=\"max-width:100%;\"/><br/></p><p style=\"text-align:right;\">计算机科学与工程学院</p><p style=\"text-align:right;\">2021年3月23日<br/></p>');
INSERT INTO `article` VALUES (32, '关于选拔计算机科学与工程学院学生参加2021第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛的决定', NULL, '管理员', '2021-04-19 18:31:11', '竞赛公告', 9, '<p>惠州学院计算机科学与工程学院于2021年3月21日举行了2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”校内选拔赛，比赛使用“浙江农林大学第十九届程序设计竞赛暨天梯赛选拔赛（同步赛）”作为校内选拔平台。根据校内选拔赛的规则和排名结果，共选拔出30名学生，将分成三组（组内排名不分先后顺序），代表惠州学院计算机科学与工程学院参加2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛。名单如下：</p>\n');
INSERT INTO `article` VALUES (33, '关于选拔计算机科学与工程学院学生参加2021第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛的决定', NULL, '管理员', '2021-04-19 18:31:11', '竞赛公告', 8, '<p>惠州学院计算机科学与工程学院于2021年3月21日举行了2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”校内选拔赛，比赛使用“浙江农林大学第十九届程序设计竞赛暨天梯赛选拔赛（同步赛）”作为校内选拔平台。根据校内选拔赛的规则和排名结果，共选拔出30名学生，将分成三组（组内排名不分先后顺序），代表惠州学院计算机科学与工程学院参加2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛。名单如下：</p>\n');
INSERT INTO `article` VALUES (34, '关于选拔计算机科学与工程学院学生参加2021第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛的决定', NULL, '管理员', '2021-04-19 18:31:11', '竞赛公告', 9, '<p>惠州学院计算机科学与工程学院于2021年3月21日举行了2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”校内选拔赛，比赛使用“浙江农林大学第十九届程序设计竞赛暨天梯赛选拔赛（同步赛）”作为校内选拔平台。根据校内选拔赛的规则和排名结果，共选拔出30名学生，将分成三组（组内排名不分先后顺序），代表惠州学院计算机科学与工程学院参加2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛。名单如下：</p>\n');
INSERT INTO `article` VALUES (35, '关于选拔计算机科学与工程学院学生参加2021第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛的决定', NULL, '管理员', '2021-04-19 18:31:11', '竞赛公告', 7, '<p>惠州学院计算机科学与工程学院于2021年3月21日举行了2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”校内选拔赛，比赛使用“浙江农林大学第十九届程序设计竞赛暨天梯赛选拔赛（同步赛）”作为校内选拔平台。根据校内选拔赛的规则和排名结果，共选拔出30名学生，将分成三组（组内排名不分先后顺序），代表惠州学院计算机科学与工程学院参加2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛。名单如下：</p>\n');
INSERT INTO `article` VALUES (36, '关于选拔计算机科学与工程学院学生参加2021第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛的决定', NULL, '管理员', '2021-04-19 18:31:11', '竞赛公告', 7, '<p>惠州学院计算机科学与工程学院于2021年3月21日举行了2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”校内选拔赛，比赛使用“浙江农林大学第十九届程序设计竞赛暨天梯赛选拔赛（同步赛）”作为校内选拔平台。根据校内选拔赛的规则和排名结果，共选拔出30名学生，将分成三组（组内排名不分先后顺序），代表惠州学院计算机科学与工程学院参加2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛。名单如下：</p>\n');
INSERT INTO `article` VALUES (37, '关于选拔计算机科学与工程学院学生参加2021第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛的决定', NULL, '管理员', '2021-04-19 18:31:11', '竞赛公告', 7, '<p>惠州学院计算机科学与工程学院于2021年3月21日举行了2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”校内选拔赛，比赛使用“浙江农林大学第十九届程序设计竞赛暨天梯赛选拔赛（同步赛）”作为校内选拔平台。根据校内选拔赛的规则和排名结果，共选拔出30名学生，将分成三组（组内排名不分先后顺序），代表惠州学院计算机科学与工程学院参加2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛。名单如下：</p>\n');
INSERT INTO `article` VALUES (38, '关于选拔计算机科学与工程学院学生参加2021第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛的决定', NULL, '管理员', '2021-04-19 18:31:11', '竞赛公告', 8, '<p>惠州学院计算机科学与工程学院于2021年3月21日举行了2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”校内选拔赛，比赛使用“浙江农林大学第十九届程序设计竞赛暨天梯赛选拔赛（同步赛）”作为校内选拔平台。根据校内选拔赛的规则和排名结果，共选拔出30名学生，将分成三组（组内排名不分先后顺序），代表惠州学院计算机科学与工程学院参加2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛。名单如下：</p>\n');
INSERT INTO `article` VALUES (39, '关于选拔计算机科学与工程学院学生参加2021第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛的决定', NULL, '管理员', '2021-04-19 18:31:11', '竞赛公告', 7, '<p>惠州学院计算机科学与工程学院于2021年3月21日举行了2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”校内选拔赛，比赛使用“浙江农林大学第十九届程序设计竞赛暨天梯赛选拔赛（同步赛）”作为校内选拔平台。根据校内选拔赛的规则和排名结果，共选拔出30名学生，将分成三组（组内排名不分先后顺序），代表惠州学院计算机科学与工程学院参加2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛。名单如下：</p>\n');
INSERT INTO `article` VALUES (40, '关于选拔计算机科学与工程学院学生参加2021第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛的决定', NULL, '管理员', '2021-04-19 18:31:11', '竞赛公告', 7, '<p>惠州学院计算机科学与工程学院于2021年3月21日举行了2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”校内选拔赛，比赛使用“浙江农林大学第十九届程序设计竞赛暨天梯赛选拔赛（同步赛）”作为校内选拔平台。根据校内选拔赛的规则和排名结果，共选拔出30名学生，将分成三组（组内排名不分先后顺序），代表惠州学院计算机科学与工程学院参加2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛。名单如下：</p>\n');
INSERT INTO `article` VALUES (41, '关于选拔计算机科学与工程学院学生参加2021第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛的决定', NULL, '管理员', '2021-04-19 18:31:11', '竞赛公告', 8, '<p>惠州学院计算机科学与工程学院于2021年3月21日举行了2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”校内选拔赛，比赛使用“浙江农林大学第十九届程序设计竞赛暨天梯赛选拔赛（同步赛）”作为校内选拔平台。根据校内选拔赛的规则和排名结果，共选拔出30名学生，将分成三组（组内排名不分先后顺序），代表惠州学院计算机科学与工程学院参加2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛。名单如下：</p>\n');
INSERT INTO `article` VALUES (42, '关于选拔计算机科学与工程学院学生参加2021第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛的决定', NULL, '管理员', '2021-04-19 18:31:11', '竞赛公告', 7, '<p>惠州学院计算机科学与工程学院于2021年3月21日举行了2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”校内选拔赛，比赛使用“浙江农林大学第十九届程序设计竞赛暨天梯赛选拔赛（同步赛）”作为校内选拔平台。根据校内选拔赛的规则和排名结果，共选拔出30名学生，将分成三组（组内排名不分先后顺序），代表惠州学院计算机科学与工程学院参加2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛。名单如下：</p>\n');
INSERT INTO `article` VALUES (43, '关于选拔计算机科学与工程学院学生参加2021第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛的决定', NULL, '管理员', '2021-04-19 18:31:11', '竞赛公告', 7, '<p>惠州学院计算机科学与工程学院于2021年3月21日举行了2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”校内选拔赛，比赛使用“浙江农林大学第十九届程序设计竞赛暨天梯赛选拔赛（同步赛）”作为校内选拔平台。根据校内选拔赛的规则和排名结果，共选拔出30名学生，将分成三组（组内排名不分先后顺序），代表惠州学院计算机科学与工程学院参加2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛。名单如下：</p>\n');
INSERT INTO `article` VALUES (44, '关于选拔计算机科学与工程学院学生参加2021第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛的决定', NULL, '管理员', '2021-04-19 18:31:11', '竞赛公告', 7, '<p>惠州学院计算机科学与工程学院于2021年3月21日举行了2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”校内选拔赛，比赛使用“浙江农林大学第十九届程序设计竞赛暨天梯赛选拔赛（同步赛）”作为校内选拔平台。根据校内选拔赛的规则和排名结果，共选拔出30名学生，将分成三组（组内排名不分先后顺序），代表惠州学院计算机科学与工程学院参加2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛。名单如下：</p>\n');
INSERT INTO `article` VALUES (45, '关于选拔计算机科学与工程学院学生参加2021第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛的决定', NULL, '管理员', '2021-04-19 18:31:11', '竞赛公告', 7, '<p>惠州学院计算机科学与工程学院于2021年3月21日举行了2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”校内选拔赛，比赛使用“浙江农林大学第十九届程序设计竞赛暨天梯赛选拔赛（同步赛）”作为校内选拔平台。根据校内选拔赛的规则和排名结果，共选拔出30名学生，将分成三组（组内排名不分先后顺序），代表惠州学院计算机科学与工程学院参加2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛。名单如下：</p>\n');
INSERT INTO `article` VALUES (46, '关于选拔计算机科学与工程学院学生参加2021第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛的决定', NULL, '管理员', '2021-04-19 18:31:11', '竞赛公告', 7, '<p>惠州学院计算机科学与工程学院于2021年3月21日举行了2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”校内选拔赛，比赛使用“浙江农林大学第十九届程序设计竞赛暨天梯赛选拔赛（同步赛）”作为校内选拔平台。根据校内选拔赛的规则和排名结果，共选拔出30名学生，将分成三组（组内排名不分先后顺序），代表惠州学院计算机科学与工程学院参加2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛。名单如下：</p>\n');
INSERT INTO `article` VALUES (47, '关于选拔计算机科学与工程学院学生参加2021第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛的决定', NULL, '管理员', '2021-04-19 18:31:11', '竞赛公告', 7, '<p>惠州学院计算机科学与工程学院于2021年3月21日举行了2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”校内选拔赛，比赛使用“浙江农林大学第十九届程序设计竞赛暨天梯赛选拔赛（同步赛）”作为校内选拔平台。根据校内选拔赛的规则和排名结果，共选拔出30名学生，将分成三组（组内排名不分先后顺序），代表惠州学院计算机科学与工程学院参加2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛。名单如下：</p>\n');
INSERT INTO `article` VALUES (48, '关于选拔计算机科学与工程学院学生参加2021第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛的决定', NULL, '管理员', '2021-04-19 18:31:11', '竞赛公告', 7, '<p>惠州学院计算机科学与工程学院于2021年3月21日举行了2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”校内选拔赛，比赛使用“浙江农林大学第十九届程序设计竞赛暨天梯赛选拔赛（同步赛）”作为校内选拔平台。根据校内选拔赛的规则和排名结果，共选拔出30名学生，将分成三组（组内排名不分先后顺序），代表惠州学院计算机科学与工程学院参加2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛。名单如下：</p>\n');
INSERT INTO `article` VALUES (49, '关于选拔计算机科学与工程学院学生参加2021第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛的决定', NULL, '管理员', '2021-04-19 18:31:11', '竞赛公告', 7, '<p>惠州学院计算机科学与工程学院于2021年3月21日举行了2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”校内选拔赛，比赛使用“浙江农林大学第十九届程序设计竞赛暨天梯赛选拔赛（同步赛）”作为校内选拔平台。根据校内选拔赛的规则和排名结果，共选拔出30名学生，将分成三组（组内排名不分先后顺序），代表惠州学院计算机科学与工程学院参加2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛。名单如下：</p>\n');
INSERT INTO `article` VALUES (50, '关于选拔计算机科学与工程学院学生参加2021第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛的决定', NULL, '管理员', '2021-04-19 18:31:11', '竞赛公告', 7, '<p>惠州学院计算机科学与工程学院于2021年3月21日举行了2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”校内选拔赛，比赛使用“浙江农林大学第十九届程序设计竞赛暨天梯赛选拔赛（同步赛）”作为校内选拔平台。根据校内选拔赛的规则和排名结果，共选拔出30名学生，将分成三组（组内排名不分先后顺序），代表惠州学院计算机科学与工程学院参加2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛。名单如下：</p>\n');
INSERT INTO `article` VALUES (51, '关于选拔计算机科学与工程学院学生参加2021第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛的决定', NULL, '管理员', '2021-04-19 18:31:11', '竞赛公告', 7, '<p>惠州学院计算机科学与工程学院于2021年3月21日举行了2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”校内选拔赛，比赛使用“浙江农林大学第十九届程序设计竞赛暨天梯赛选拔赛（同步赛）”作为校内选拔平台。根据校内选拔赛的规则和排名结果，共选拔出30名学生，将分成三组（组内排名不分先后顺序），代表惠州学院计算机科学与工程学院参加2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛。名单如下：</p>\n');
INSERT INTO `article` VALUES (52, '关于选拔计算机科学与工程学院学生参加2021第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛的决定', NULL, '管理员', '2021-04-19 18:31:11', '竞赛公告', 7, '<p>惠州学院计算机科学与工程学院于2021年3月21日举行了2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”校内选拔赛，比赛使用“浙江农林大学第十九届程序设计竞赛暨天梯赛选拔赛（同步赛）”作为校内选拔平台。根据校内选拔赛的规则和排名结果，共选拔出30名学生，将分成三组（组内排名不分先后顺序），代表惠州学院计算机科学与工程学院参加2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛。名单如下：</p>\n');
INSERT INTO `article` VALUES (53, '关于选拔计算机科学与工程学院学生参加2021第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛的决定', NULL, '管理员', '2021-04-19 18:31:11', '竞赛公告', 7, '<p>惠州学院计算机科学与工程学院于2021年3月21日举行了2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”校内选拔赛，比赛使用“浙江农林大学第十九届程序设计竞赛暨天梯赛选拔赛（同步赛）”作为校内选拔平台。根据校内选拔赛的规则和排名结果，共选拔出30名学生，将分成三组（组内排名不分先后顺序），代表惠州学院计算机科学与工程学院参加2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛。名单如下：</p>\n');
INSERT INTO `article` VALUES (54, '关于选拔计算机科学与工程学院学生参加2021第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛的决定', NULL, '管理员', '2021-04-19 18:31:11', '竞赛公告', 7, '<p>惠州学院计算机科学与工程学院于2021年3月21日举行了2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”校内选拔赛，比赛使用“浙江农林大学第十九届程序设计竞赛暨天梯赛选拔赛（同步赛）”作为校内选拔平台。根据校内选拔赛的规则和排名结果，共选拔出30名学生，将分成三组（组内排名不分先后顺序），代表惠州学院计算机科学与工程学院参加2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛。名单如下：</p>\n');
INSERT INTO `article` VALUES (55, '关于选拔计算机科学与工程学院学生参加2021第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛的决定', NULL, '管理员', '2021-04-19 18:31:11', '竞赛公告', 7, '<p>惠州学院计算机科学与工程学院于2021年3月21日举行了2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”校内选拔赛，比赛使用“浙江农林大学第十九届程序设计竞赛暨天梯赛选拔赛（同步赛）”作为校内选拔平台。根据校内选拔赛的规则和排名结果，共选拔出30名学生，将分成三组（组内排名不分先后顺序），代表惠州学院计算机科学与工程学院参加2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛。名单如下：</p>\n');
INSERT INTO `article` VALUES (56, '关于选拔计算机科学与工程学院学生参加2021第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛的决定', NULL, '管理员', '2021-04-19 18:31:11', '竞赛公告', 7, '<p>惠州学院计算机科学与工程学院于2021年3月21日举行了2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”校内选拔赛，比赛使用“浙江农林大学第十九届程序设计竞赛暨天梯赛选拔赛（同步赛）”作为校内选拔平台。根据校内选拔赛的规则和排名结果，共选拔出30名学生，将分成三组（组内排名不分先后顺序），代表惠州学院计算机科学与工程学院参加2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛。名单如下：</p>\n');
INSERT INTO `article` VALUES (57, '关于选拔计算机科学与工程学院学生参加2021第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛的决定', NULL, '管理员', '2021-04-19 18:31:11', '竞赛公告', 8, '<p>惠州学院计算机科学与工程学院于2021年3月21日举行了2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”校内选拔赛，比赛使用“浙江农林大学第十九届程序设计竞赛暨天梯赛选拔赛（同步赛）”作为校内选拔平台。根据校内选拔赛的规则和排名结果，共选拔出30名学生，将分成三组（组内排名不分先后顺序），代表惠州学院计算机科学与工程学院参加2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛。名单如下：</p>\n');
INSERT INTO `article` VALUES (58, '关于选拔计算机科学与工程学院学生参加2021第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛的决定', NULL, '管理员', '2021-04-19 18:31:11', '竞赛公告', 7, '<p>惠州学院计算机科学与工程学院于2021年3月21日举行了2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”校内选拔赛，比赛使用“浙江农林大学第十九届程序设计竞赛暨天梯赛选拔赛（同步赛）”作为校内选拔平台。根据校内选拔赛的规则和排名结果，共选拔出30名学生，将分成三组（组内排名不分先后顺序），代表惠州学院计算机科学与工程学院参加2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛。名单如下：</p>\n');
INSERT INTO `article` VALUES (59, '关于选拔计算机科学与工程学院学生参加2021第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛的决定', NULL, '管理员', '2021-04-19 18:31:11', '竞赛公告', 15, '<p>惠州学院计算机科学与工程学院于2021年3月21日举行了2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”校内选拔赛，比赛使用“浙江农林大学第十九届程序设计竞赛暨天梯赛选拔赛（同步赛）”作为校内选拔平台。根据校内选拔赛的规则和排名结果，共选拔出30名学生，将分成三组（组内排名不分先后顺序），代表惠州学院计算机科学与工程学院参加2021年第六届“中国高校计算机大赛-团体程序设计天梯赛”国赛比赛。名单如下：</p>\n');
INSERT INTO `article` VALUES (60, '竞赛动态', '', '管理员', '2021-04-21 16:28:38', '竞赛动态', 1, '<p>竞赛动态</p>');
INSERT INTO `article` VALUES (61, '竞赛动态', '', '管理员', '2021-04-21 16:28:38', '竞赛动态', 2, '<p>竞赛动态</p>');
INSERT INTO `article` VALUES (62, '竞赛动态', '', '管理员', '2021-04-21 16:28:38', '竞赛动态', 0, '<p>竞赛动态</p>');
INSERT INTO `article` VALUES (63, '竞赛动态', '', '管理员', '2021-04-21 16:28:38', '竞赛动态', 0, '<p>竞赛动态</p>');
INSERT INTO `article` VALUES (64, '竞赛动态', '', '管理员', '2021-04-21 16:28:38', '竞赛动态', 1, '<p>竞赛动态</p>');
INSERT INTO `article` VALUES (65, '竞赛动态', '', '管理员', '2021-04-21 16:28:38', '竞赛动态', 1, '<p>竞赛动态</p>');
INSERT INTO `article` VALUES (66, '竞赛动态', '', '管理员', '2021-04-21 16:28:38', '竞赛动态', 0, '<p>竞赛动态</p>');
INSERT INTO `article` VALUES (67, '竞赛动态', '', '管理员', '2021-04-21 16:28:38', '竞赛动态', 1, '<p>竞赛动态</p>');
INSERT INTO `article` VALUES (68, '竞赛动态', '', '管理员', '2021-04-21 16:28:38', '竞赛动态', 1, '<p>竞赛动态</p>');
INSERT INTO `article` VALUES (69, '竞赛动态', '', '管理员', '2021-04-21 16:28:38', '竞赛动态', 0, '<p>竞赛动态</p>');
INSERT INTO `article` VALUES (70, '竞赛动态', '', '管理员', '2021-04-21 16:28:38', '竞赛动态', 0, '<p>竞赛动态</p>');
INSERT INTO `article` VALUES (71, '竞赛动态', '', '管理员', '2021-04-21 16:28:38', '竞赛动态', 0, '<p>竞赛动态</p>');
INSERT INTO `article` VALUES (72, '竞赛动态', '', '管理员', '2021-04-21 16:28:38', '竞赛动态', 0, '<p>竞赛动态</p>');
INSERT INTO `article` VALUES (73, '竞赛动态', '', '管理员', '2021-04-21 16:28:38', '竞赛动态', 0, '<p>竞赛动态</p>');
INSERT INTO `article` VALUES (74, '竞赛动态', '', '管理员', '2021-04-21 16:28:38', '竞赛动态', 0, '<p>竞赛动态</p>');
INSERT INTO `article` VALUES (75, '竞赛动态', '', '管理员', '2021-04-21 16:28:38', '竞赛动态', 0, '<p>竞赛动态</p>');
INSERT INTO `article` VALUES (76, '竞赛动态', '', '管理员', '2021-04-21 16:28:38', '竞赛动态', 0, '<p>竞赛动态</p>');
INSERT INTO `article` VALUES (77, '竞赛动态', '', '管理员', '2021-04-21 16:28:38', '竞赛动态', 0, '<p>竞赛动态</p>');
INSERT INTO `article` VALUES (78, '竞赛动态', '', '管理员', '2021-04-21 16:28:38', '竞赛动态', 0, '<p>竞赛动态</p>');
INSERT INTO `article` VALUES (79, '竞赛动态', '', '管理员', '2021-04-21 16:28:38', '竞赛动态', 0, '<p>竞赛动态</p>');
INSERT INTO `article` VALUES (80, '竞赛动态', '', '管理员', '2021-04-21 16:28:38', '竞赛动态', 0, '<p>竞赛动态</p>');
INSERT INTO `article` VALUES (81, '竞赛动态', '', '管理员', '2021-04-21 16:28:38', '竞赛动态', 0, '<p>竞赛动态</p>');
INSERT INTO `article` VALUES (82, '竞赛动态', '', '管理员', '2021-04-21 16:28:38', '竞赛动态', 0, '<p>竞赛动态</p>');
INSERT INTO `article` VALUES (83, '竞赛动态', '', '管理员', '2021-04-21 16:28:38', '竞赛动态', 0, '<p>竞赛动态</p>');
INSERT INTO `article` VALUES (84, '竞赛动态', '', '管理员', '2021-04-21 16:28:38', '竞赛动态', 0, '<p>竞赛动态</p>');
INSERT INTO `article` VALUES (85, '竞赛动态', '', '管理员', '2021-04-21 16:28:38', '竞赛动态', 0, '<p>竞赛动态</p>');
INSERT INTO `article` VALUES (86, '竞赛动态', '', '管理员', '2021-04-21 16:28:38', '竞赛动态', 0, '<p>竞赛动态</p>');
INSERT INTO `article` VALUES (87, '竞赛动态', '', '管理员', '2021-04-21 16:28:38', '竞赛动态', 0, '<p>竞赛动态</p>');
INSERT INTO `article` VALUES (88, '竞赛成果', '', '管理员', '2021-04-21 16:29:53', '竞赛成果', 1, '<p>竞赛成果</p>');
INSERT INTO `article` VALUES (89, '竞赛成果', '', '管理员', '2021-04-21 16:29:53', '竞赛成果', 3, '<p>竞赛成果</p>');
INSERT INTO `article` VALUES (90, '竞赛成果', '', '管理员', '2021-04-21 16:29:53', '竞赛成果', 0, '<p>竞赛成果</p>');
INSERT INTO `article` VALUES (91, '竞赛成果', '', '管理员', '2021-04-21 16:29:53', '竞赛成果', 0, '<p>竞赛成果</p>');
INSERT INTO `article` VALUES (92, '竞赛成果', '', '管理员', '2021-04-21 16:29:53', '竞赛成果', 0, '<p>竞赛成果</p>');
INSERT INTO `article` VALUES (93, '竞赛成果', '', '管理员', '2021-04-21 16:29:53', '竞赛成果', 0, '<p>竞赛成果</p>');
INSERT INTO `article` VALUES (94, '竞赛成果', '', '管理员', '2021-04-21 16:29:53', '竞赛成果', 0, '<p>竞赛成果</p>');
INSERT INTO `article` VALUES (95, '竞赛成果', '', '管理员', '2021-04-21 16:29:53', '竞赛成果', 0, '<p>竞赛成果</p>');
INSERT INTO `article` VALUES (96, '竞赛成果', '', '管理员', '2021-04-21 16:29:53', '竞赛成果', 0, '<p>竞赛成果</p>');
INSERT INTO `article` VALUES (97, '竞赛成果', '', '管理员', '2021-04-21 16:29:53', '竞赛成果', 0, '<p>竞赛成果</p>');
INSERT INTO `article` VALUES (98, '竞赛成果', '', '管理员', '2021-04-21 16:29:53', '竞赛成果', 0, '<p>竞赛成果</p>');
INSERT INTO `article` VALUES (99, '竞赛成果', '', '管理员', '2021-04-21 16:29:53', '竞赛成果', 0, '<p>竞赛成果</p>');
INSERT INTO `article` VALUES (100, '竞赛成果', '', '管理员', '2021-04-21 16:29:53', '竞赛成果', 0, '<p>竞赛成果</p>');
INSERT INTO `article` VALUES (101, '竞赛成果', '', '管理员', '2021-04-21 16:29:53', '竞赛成果', 0, '<p>竞赛成果</p>');
INSERT INTO `article` VALUES (102, '竞赛成果', '', '管理员', '2021-04-21 16:29:53', '竞赛成果', 0, '<p>竞赛成果</p>');
INSERT INTO `article` VALUES (103, '竞赛成果', '', '管理员', '2021-04-21 16:29:53', '竞赛成果', 1, '<p>竞赛成果</p>');
INSERT INTO `article` VALUES (104, '竞赛成果', '', '管理员', '2021-04-21 16:29:53', '竞赛成果', 0, '<p>竞赛成果</p>');
INSERT INTO `article` VALUES (105, '竞赛成果', '', '管理员', '2021-04-21 16:29:53', '竞赛成果', 2, '<p>竞赛成果</p>');
INSERT INTO `article` VALUES (106, '竞赛成果', '', '管理员', '2021-04-21 16:29:53', '竞赛成果', 0, '<p>竞赛成果</p>');
INSERT INTO `article` VALUES (107, '竞赛成果', '', '管理员', '2021-04-21 16:29:53', '竞赛成果', 0, '<p>竞赛成果</p>');
INSERT INTO `article` VALUES (108, '竞赛成果', '', '管理员', '2021-04-21 16:29:53', '竞赛成果', 0, '<p>竞赛成果</p>');
INSERT INTO `article` VALUES (109, '竞赛成果', '', '管理员', '2021-04-21 16:29:53', '竞赛成果', 0, '<p>竞赛成果</p>');
INSERT INTO `article` VALUES (110, '竞赛成果', '', '管理员', '2021-04-21 16:29:53', '竞赛成果', 0, '<p>竞赛成果</p>');
INSERT INTO `article` VALUES (111, '竞赛成果', '', '管理员', '2021-04-21 16:29:53', '竞赛成果', 0, '<p>竞赛成果</p>');
INSERT INTO `article` VALUES (112, '竞赛成果', '', '管理员', '2021-04-21 16:29:53', '竞赛成果', 0, '<p>竞赛成果</p>');
INSERT INTO `article` VALUES (113, '竞赛成果', '', '管理员', '2021-04-21 16:29:53', '竞赛成果', 0, '<p>竞赛成果</p>');
INSERT INTO `article` VALUES (114, '竞赛成果', '', '管理员', '2021-04-21 16:29:53', '竞赛成果', 0, '<p>竞赛成果</p>');
INSERT INTO `article` VALUES (115, '竞赛成果', '', '管理员', '2021-04-21 16:29:53', '竞赛成果', 0, '<p>竞赛成果</p>');
INSERT INTO `article` VALUES (116, '竞赛成果', '', '管理员', '2021-04-21 16:29:53', '竞赛成果', 0, '<p>竞赛成果</p>');
INSERT INTO `article` VALUES (117, '竞赛成果', '', '管理员', '2021-04-21 16:29:53', '竞赛成果', 0, '<p>竞赛成果</p>');
INSERT INTO `article` VALUES (118, '竞赛成果', '', '管理员', '2021-04-21 16:29:53', '竞赛成果', 0, '<p>竞赛成果</p>');
INSERT INTO `article` VALUES (119, '竞赛成果', '', '管理员', '2021-04-21 16:29:53', '竞赛成果', 0, '<p>竞赛成果</p>');
INSERT INTO `article` VALUES (120, '竞赛成果', '', '管理员', '2021-04-21 16:29:53', '竞赛成果', 0, '<p>竞赛成果</p>');
INSERT INTO `article` VALUES (121, '竞赛成果', '', '管理员', '2021-04-21 16:29:53', '竞赛成果', 0, '<p>竞赛成果</p>');
INSERT INTO `article` VALUES (122, '竞赛成果', '', '管理员', '2021-04-21 16:29:53', '竞赛成果', 0, '<p>竞赛成果</p>');
INSERT INTO `article` VALUES (123, '竞赛成果', '', '管理员', '2021-04-21 16:29:53', '竞赛成果', 0, '<p>竞赛成果</p>');
INSERT INTO `article` VALUES (124, '竞赛成果', '', '管理员', '2021-04-21 16:29:53', '竞赛成果', 0, '<p>竞赛成果</p>');
INSERT INTO `article` VALUES (125, '竞赛成果', '', '管理员', '2021-04-21 16:29:53', '竞赛成果', 0, '<p>竞赛成果</p>');
INSERT INTO `article` VALUES (126, '常见问题', '', '管理员', '2021-04-21 16:30:47', '常见问题', 0, '<p>常见问题</p>');
INSERT INTO `article` VALUES (127, '常见问题', '', '管理员', '2021-04-21 16:30:47', '常见问题', 2, '<p>常见问题</p>');
INSERT INTO `article` VALUES (128, '常见问题', '', '管理员', '2021-04-21 16:30:47', '常见问题', 0, '<p>常见问题</p>');
INSERT INTO `article` VALUES (129, '常见问题', '', '管理员', '2021-04-21 16:30:47', '常见问题', 0, '<p>常见问题</p>');
INSERT INTO `article` VALUES (130, '常见问题', '', '管理员', '2021-04-21 16:30:47', '常见问题', 1, '<p>常见问题</p>');
INSERT INTO `article` VALUES (131, '常见问题', '', '管理员', '2021-04-21 16:30:47', '常见问题', 0, '<p>常见问题</p>');
INSERT INTO `article` VALUES (132, '常见问题', '', '管理员', '2021-04-21 16:30:47', '常见问题', 0, '<p>常见问题</p>');
INSERT INTO `article` VALUES (133, '常见问题', '', '管理员', '2021-04-21 16:30:47', '常见问题', 0, '<p>常见问题</p>');
INSERT INTO `article` VALUES (134, '常见问题', '', '管理员', '2021-04-21 16:30:47', '常见问题', 0, '<p>常见问题</p>');
INSERT INTO `article` VALUES (135, '常见问题', '', '管理员', '2021-04-21 16:30:47', '常见问题', 0, '<p>常见问题</p>');
INSERT INTO `article` VALUES (136, '常见问题', '', '管理员', '2021-04-21 16:30:47', '常见问题', 0, '<p>常见问题</p>');
INSERT INTO `article` VALUES (137, '常见问题', '', '管理员', '2021-04-21 16:30:47', '常见问题', 0, '<p>常见问题</p>');
INSERT INTO `article` VALUES (138, '常见问题', '', '管理员', '2021-04-21 16:30:47', '常见问题', 0, '<p>常见问题</p>');
INSERT INTO `article` VALUES (139, '常见问题', '', '管理员', '2021-04-21 16:30:47', '常见问题', 0, '<p>常见问题</p>');
INSERT INTO `article` VALUES (140, '常见问题', '', '管理员', '2021-04-21 16:30:47', '常见问题', 0, '<p>常见问题</p>');
INSERT INTO `article` VALUES (141, '常见问题', '', '管理员', '2021-04-21 16:30:47', '常见问题', 0, '<p>常见问题</p>');
INSERT INTO `article` VALUES (142, '常见问题', '', '管理员', '2021-04-21 16:30:47', '常见问题', 0, '<p>常见问题</p>');
INSERT INTO `article` VALUES (143, '常见问题', '', '管理员', '2021-04-21 16:30:47', '常见问题', 0, '<p>常见问题</p>');
INSERT INTO `article` VALUES (144, '常见问题', '', '管理员', '2021-04-21 16:30:47', '常见问题', 0, '<p>常见问题</p>');
INSERT INTO `article` VALUES (145, '常见问题', '', '管理员', '2021-04-21 16:30:47', '常见问题', 0, '<p>常见问题</p>');
INSERT INTO `article` VALUES (146, '常见问题', '', '管理员', '2021-04-21 16:30:47', '常见问题', 0, '<p>常见问题</p>');
INSERT INTO `article` VALUES (147, '常见问题', '', '管理员', '2021-04-21 16:30:47', '常见问题', 0, '<p>常见问题</p>');
INSERT INTO `article` VALUES (148, '常见问题', '', '管理员', '2021-04-21 16:30:47', '常见问题', 0, '<p>常见问题</p>');
INSERT INTO `article` VALUES (149, '常见问题', '', '管理员', '2021-04-21 16:30:47', '常见问题', 0, '<p>常见问题</p>');
INSERT INTO `article` VALUES (150, '常见问题', '', '管理员', '2021-04-21 16:30:47', '常见问题', 0, '<p>常见问题</p>');
INSERT INTO `article` VALUES (151, '常见问题', '', '管理员', '2021-04-21 16:30:47', '常见问题', 0, '<p>常见问题</p>');
INSERT INTO `article` VALUES (152, '常见问题', '', '管理员', '2021-04-21 16:30:47', '常见问题', 0, '<p>常见问题</p>');
INSERT INTO `article` VALUES (153, '常见问题', '', '管理员', '2021-04-21 16:30:47', '常见问题', 0, '<p>常见问题</p>');
INSERT INTO `article` VALUES (154, '常见问题', '', '管理员', '2021-04-21 16:30:47', '常见问题', 3, '<p>常见问题</p>');

-- ----------------------------
-- Table structure for award
-- ----------------------------
DROP TABLE IF EXISTS `award`;
CREATE TABLE `award`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `award_student` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申报学生学号',
  `award_cid` int(0) NULL DEFAULT NULL COMMENT '获奖比赛编号id',
  `award_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '获得奖项（一等奖，二等奖）',
  `award_certificate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '奖状',
  `award_file` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关作品文件',
  `award_teacher` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '指导老师姓名',
  `award_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '获奖类型（个人，团队）',
  `award_state` smallint(0) NULL DEFAULT NULL COMMENT '申报情况（0失败，1审核中，2成功）',
  `award_time` datetime(0) NULL DEFAULT NULL COMMENT '申报时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of award
-- ----------------------------
INSERT INTO `award` VALUES (2, '1705120102111', 2, '二等奖', 'http://localhost:8088/award/certificate/16202132308022.jpg', '', '林群霞', '团体', 1, '2021-05-05 19:13:52');
INSERT INTO `award` VALUES (3, '1705120102124', 3, '三等奖', 'http://localhost:8088/award/certificate/16202232487912.jpg', 'http://localhost:8088/award/work/1620222934537content_1616057366874.docx', '张学锋', '团体', 1, '2021-05-05 22:00:50');
INSERT INTO `award` VALUES (5, '1705120102114', 3, '一等奖', 'http://localhost:8088/award/certificate/16184766678212.jpg', 'http://localhost:8088/award/work/16184944872033.docx', '周大镯', '个人', 1, '2021-04-20 21:25:16');
INSERT INTO `award` VALUES (9, '1705120102114', 1, '优秀奖', 'http://localhost:8088/award/certificate/1619011506440捕获.JPG', '', '周大镯', '团体', 2, '2021-02-05 21:25:16');
INSERT INTO `award` VALUES (10, '1705120102113', 4, '一等奖', 'http://localhost:8088/award/certificate/1619011289955捕获.JPG', 'http://localhost:8088/award/work/1619011296827cam.xlsx', '张学锋', '个人', 2, '2021-04-21 21:21:50');
INSERT INTO `award` VALUES (11, '1705120102110', 3, '一等奖', 'http://localhost:8088/award/certificate/1619011289955捕获.JPG', 'http://localhost:8088/award/work/1619011296827cam.xlsx', '张学锋', '个人', 2, '2021-04-21 21:21:50');
INSERT INTO `award` VALUES (12, '1705120102117', 14, '一等奖', 'http://localhost:8088/award/certificate/1619011289955捕获.JPG', 'http://localhost:8088/award/work/1619011296827cam.xlsx', '张学锋', '个人', 2, '2021-04-21 21:21:50');
INSERT INTO `award` VALUES (13, '1705120102119', 13, '一等奖', 'http://localhost:8088/award/certificate/1619011289955捕获.JPG', 'http://localhost:8088/award/work/1619011296827cam.xlsx', '张学锋', '团体', 2, '2021-04-21 21:21:50');
INSERT INTO `award` VALUES (14, '1705120102130', 12, '优秀奖', 'http://localhost:8088/award/certificate/1619011506440捕获.JPG', '', '周大镯', '团体', 2, '2021-02-05 21:25:16');
INSERT INTO `award` VALUES (15, '1705120102131', 11, '优秀奖', 'http://localhost:8088/award/certificate/1619011506440捕获.JPG', '', '周大镯', '团体', 2, '2021-02-05 21:25:16');
INSERT INTO `award` VALUES (16, '1705120102132', 1, '优秀奖', 'http://localhost:8088/award/certificate/1619011506440捕获.JPG', '', '周大镯', '团体', 2, '2021-02-05 21:25:16');
INSERT INTO `award` VALUES (17, '1405120102114', 1, '一等奖', NULL, NULL, '柯忠义', '个人', 2, '2021-04-01 18:59:09');
INSERT INTO `award` VALUES (18, '1405120102110', 2, '优秀奖', 'http://localhost:8088/award/certificate/16202229125751.jpg', 'http://localhost:8088/award/work/1620222917539cam.xlsx', '柯忠义', '个人', 2, '2021-05-05 21:55:21');
INSERT INTO `award` VALUES (19, '1705120102111', 2, '优秀奖', 'http://localhost:8088/award/certificate/16202230209912.jpg', 'http://localhost:8088/award/work/1620223041013111 (自动保存的).docx', '张学锋', '个人', 2, '2021-05-05 21:57:22');
INSERT INTO `award` VALUES (20, '1705120102114', 2, '优秀奖', 'http://localhost:8088/award/certificate/1620811753610捕获1.JPG', '', '庄容坤', '团体', 1, '2021-05-12 17:29:16');

-- ----------------------------
-- Table structure for cam
-- ----------------------------
DROP TABLE IF EXISTS `cam`;
CREATE TABLE `cam`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `college` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `major` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cam
-- ----------------------------
INSERT INTO `cam` VALUES (1, '电子信息与电气工程', '机械电子工程');
INSERT INTO `cam` VALUES (2, '电子信息与电气工程', '电气工程及其自动化');
INSERT INTO `cam` VALUES (3, '电子信息与电气工程', '电子信息工程');
INSERT INTO `cam` VALUES (4, '电子信息与电气工程', '功能材料');
INSERT INTO `cam` VALUES (5, '电子信息与电气工程', '物理学（师范）');
INSERT INTO `cam` VALUES (6, '地理与旅游', '地理信息科学');
INSERT INTO `cam` VALUES (7, '地理与旅游', '旅游管理');
INSERT INTO `cam` VALUES (8, '地理与旅游', '地理科学(师范)');
INSERT INTO `cam` VALUES (9, '化学与材料工程', '高分子材料与工程');
INSERT INTO `cam` VALUES (10, '化学与材料工程', '化学(师范)');
INSERT INTO `cam` VALUES (11, '化学与材料工程', '应用化学');
INSERT INTO `cam` VALUES (12, '化学与材料工程', '化学工程与工艺');
INSERT INTO `cam` VALUES (13, '经济管理', '财务管理');
INSERT INTO `cam` VALUES (14, '经济管理', '物流管理');
INSERT INTO `cam` VALUES (15, '经济管理', '国际经济与贸易');
INSERT INTO `cam` VALUES (16, '经济管理', '审计学');
INSERT INTO `cam` VALUES (17, '建筑与土木工程', '工程管理');
INSERT INTO `cam` VALUES (18, '建筑与土木工程', '风景园林');
INSERT INTO `cam` VALUES (19, '建筑与土木工程', '建筑学');
INSERT INTO `cam` VALUES (20, '建筑与土木工程', '土木工程');
INSERT INTO `cam` VALUES (21, '教育科学', '小学教育（师范）');
INSERT INTO `cam` VALUES (22, '教育科学', '学前教育(师范)');
INSERT INTO `cam` VALUES (23, '美术与设计', '视觉传达设计');
INSERT INTO `cam` VALUES (24, '美术与设计', '环境设计');
INSERT INTO `cam` VALUES (25, '美术与设计', '产品设计');
INSERT INTO `cam` VALUES (26, '美术与设计', '美术学(师范)');
INSERT INTO `cam` VALUES (27, '数学与大数据', '数学与应用数学(师范)');
INSERT INTO `cam` VALUES (28, '数学与大数据', '数据科学与大数据技术');
INSERT INTO `cam` VALUES (29, '数学与大数据', '应用统计学');
INSERT INTO `cam` VALUES (30, '数学与大数据', '信息管理与信息系统');
INSERT INTO `cam` VALUES (31, '生命科学', '生物科学(师范)');
INSERT INTO `cam` VALUES (32, '生命科学', '生物技术');
INSERT INTO `cam` VALUES (33, '生命科学', '园林');
INSERT INTO `cam` VALUES (34, '体育', '体育教育(师范)');
INSERT INTO `cam` VALUES (35, '外国语', '英语(师范)');
INSERT INTO `cam` VALUES (36, '外国语', '日语');
INSERT INTO `cam` VALUES (37, '文学与传媒', '汉语言文学(师范)');
INSERT INTO `cam` VALUES (38, '文学与传媒', '汉语国际教育');
INSERT INTO `cam` VALUES (39, '文学与传媒', '广播电视学');
INSERT INTO `cam` VALUES (40, '旭日广东服装', '服装设计与工程');
INSERT INTO `cam` VALUES (41, '旭日广东服装', '服装与服饰设计');
INSERT INTO `cam` VALUES (42, '旭日广东服装', '表演（服装表演方向）');
INSERT INTO `cam` VALUES (43, '计算机科学与工程', '网络空间安全');
INSERT INTO `cam` VALUES (44, '计算机科学与工程', '计算机科学与技术');
INSERT INTO `cam` VALUES (45, '计算机科学与工程', '软件工程');
INSERT INTO `cam` VALUES (46, '计算机科学与工程', '网络工程');
INSERT INTO `cam` VALUES (47, '音乐', '音乐学(师范)');
INSERT INTO `cam` VALUES (48, '政法', '历史学(师范)');
INSERT INTO `cam` VALUES (49, '政法', '法学');
INSERT INTO `cam` VALUES (50, '政法', '社会工作');
INSERT INTO `cam` VALUES (51, '马克思主义', '思想政治教育(师范)');

-- ----------------------------
-- Table structure for contestinfo
-- ----------------------------
DROP TABLE IF EXISTS `contestinfo`;
CREATE TABLE `contestinfo`  (
  `cid` int(0) NOT NULL AUTO_INCREMENT COMMENT '比赛编号',
  `cmanager` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '竞赛负责人姓名',
  `cname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '竞赛名称',
  `cplace` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '竞赛地点',
  `kind` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '竞赛类别',
  `level` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '竞赛级别',
  `ctimestart` datetime(0) NULL DEFAULT NULL COMMENT '竞赛开始时间',
  `ctimeend` datetime(0) NULL DEFAULT NULL COMMENT '竞赛结束时间',
  `cintroduce` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '竞赛介绍',
  `stimestart` datetime(0) NOT NULL COMMENT '竞赛报名开始时间',
  `stimend` datetime(0) NOT NULL COMMENT '竞赛报名结束时间',
  `srequest` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '竞赛要求',
  `organizer` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '竞赛主办单位',
  `cpeopleno` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参赛人数',
  `Doc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关通知文件',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '竞赛官网',
  `awards_examine` tinyint(1) NOT NULL COMMENT '获奖申报情况(0代表不能申报；1代表可以申报)',
  PRIMARY KEY (`cid`) USING BTREE,
  INDEX `cmanager`(`cmanager`) USING BTREE,
  CONSTRAINT `contestinfo_ibfk_1` FOREIGN KEY (`cmanager`) REFERENCES `teacher` (`teacher_name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of contestinfo
-- ----------------------------
INSERT INTO `contestinfo` VALUES (1, '周大镯', '美国大学生数学建模竞赛', '校内', '理科', '国A', '2021-02-05 00:00:00', '2021-02-09 00:00:00', '国大学生数学建模竞赛（MCM/ICM）由美国数学及其应用联合会主办，是唯一的国际性数学建模竞赛，也是世界范围内最具影响力的数学建模竞赛。', '2020-12-24 00:00:00', '2021-04-30 00:00:00', '全日制在校学生', '美国数学及其应用联合会', '1-3人', '无', '连接1', 0);
INSERT INTO `contestinfo` VALUES (2, '周大镯', '第十二届蓝桥杯大赛4', '校内', '工科', '国A', '2021-04-18 00:00:00', '2021-04-18 23:59:59', '蓝桥通过提供教育、就11业、职业服务，连接高校和企业，做大学生的经纪人，伴随大学生成长。', '2021-03-15 00:00:00', '2021-03-23 00:00:00', '全日制在校学生', '工业和信息化部人才交流中心', '1-3人', '无', '链接3', 1);
INSERT INTO `contestinfo` VALUES (3, '周大镯', '第十二届蓝桥杯大赛2', '校内', '工科', '国A', '2021-04-18 00:00:00', '2021-04-18 23:59:59', '蓝桥通过提供教育、就业、职业服务，连接高校和企业，做大学生的经纪人，伴随大学生成长。', '2021-04-27 00:00:00', '2021-06-30 00:00:00', '全日制在校学生', '工业和信息化部人才交流中心', '1-3人', '无', '链接3', 1);
INSERT INTO `contestinfo` VALUES (4, '周大镯', '第十二届蓝桥杯大赛3', '校内', '工科', '国A', '2021-04-18 00:00:00', '2021-04-18 23:59:59', '蓝桥通过提供教育、就11业、职业服务，连接高校和企业，做大学生的经纪人，伴随大学生成长。', '2021-03-15 00:00:00', '2021-03-23 00:00:00', '全日制在校学生', '工业和信息化部人才交流中心', '1-3人', '无', '链接3', 1);
INSERT INTO `contestinfo` VALUES (11, '周大镯', '工科比赛1', '校内', '工科', '国A', '2021-04-14 16:00:00', '2021-04-18 16:00:00', '中国优选法统筹法与经济数学研究会是在中国科学技术协会直接领导下的学术性社会团体，是国家一级学会。学会由华罗庚教授于1981年发起成立，至今成立了评价方法与应用、项目管理、计算机模拟、统筹、管理决策与信息系统、工业工程、高等教育管理、数学教育、经济数学与管理数学、应急管理、灰色系统研究，复杂系统研究等十余个专业分会。竞赛是由中国优选法统筹法与经济数学研究会主办，MathorCup高校数学建模挑战赛组委会具体负责竞赛的组织。', '2021-04-28 16:00:00', '2021-06-30 16:00:00', '每支队伍需缴纳200元的报名费用。', '中国优选法统筹法与经济数学研究会', '每队不超过3人，不允许跨校组队参赛。', '文件一', 'http://www.mathorcup.org', 1);
INSERT INTO `contestinfo` VALUES (12, '周大镯', '工科比赛2', '校内', '工科', '国A', '2021-04-14 16:00:00', '2021-04-18 16:00:00', '中国优选法统筹法与经济数学研究会是在中国科学技术协会直接领导下的学术性社会团体，是国家一级学会。学会由华罗庚教授于1981年发起成立，至今成立了评价方法与应用、项目管理、计算机模拟、统筹、管理决策与信息系统、工业工程、高等教育管理、数学教育、经济数学与管理数学、应急管理、灰色系统研究，复杂系统研究等十余个专业分会。竞赛是由中国优选法统筹法与经济数学研究会主办，MathorCup高校数学建模挑战赛组委会具体负责竞赛的组织。', '2020-12-31 16:00:00', '2021-04-13 16:00:00', '每支队伍需缴纳200元的报名费用。', '中国优选法统筹法与经济数学研究会', '每队不超过3人，不允许跨校组队参赛。', '文件一', 'http://www.mathorcup.org', 1);
INSERT INTO `contestinfo` VALUES (13, '周大镯', '工科比赛3', '校内', '工科', '国A', '2021-04-14 16:00:00', '2021-04-18 16:00:00', '中国优选法统筹法与经济数学研究会是在中国科学技术协会直接领导下的学术性社会团体，是国家一级学会。学会由华罗庚教授于1981年发起成立，至今成立了评价方法与应用、项目管理、计算机模拟、统筹、管理决策与信息系统、工业工程、高等教育管理、数学教育、经济数学与管理数学、应急管理、灰色系统研究，复杂系统研究等十余个专业分会。竞赛是由中国优选法统筹法与经济数学研究会主办，MathorCup高校数学建模挑战赛组委会具体负责竞赛的组织。', '2021-04-30 16:00:00', '2021-06-13 16:00:00', '每支队伍需缴纳200元的报名费用。', '中国优选法统筹法与经济数学研究会', '每队不超过3人，不允许跨校组队参赛。', '文件一', 'http://www.mathorcup.org', 1);
INSERT INTO `contestinfo` VALUES (14, '周大镯', '工科比赛4', '校内', '工科', '国A', '2021-04-14 16:00:00', '2021-04-18 16:00:00', '中国优选法统筹法与经济数学研究会是在中国科学技术协会直接领导下的学术性社会团体，是国家一级学会。学会由华罗庚教授于1981年发起成立，至今成立了评价方法与应用、项目管理、计算机模拟、统筹、管理决策与信息系统、工业工程、高等教育管理、数学教育、经济数学与管理数学、应急管理、灰色系统研究，复杂系统研究等十余个专业分会。竞赛是由中国优选法统筹法与经济数学研究会主办，MathorCup高校数学建模挑战赛组委会具体负责竞赛的组织。', '2020-12-31 16:00:00', '2021-04-13 16:00:00', '每支队伍需缴纳200元的报名费用。', '中国优选法统筹法与经济数学研究会', '每队不超过3人，不允许跨校组队参赛。', '文件一', 'http://www.mathorcup.org', 1);
INSERT INTO `contestinfo` VALUES (16, '周大镯', '理科比赛2', '校内', '理科', '国A', '2021-04-14 16:00:00', '2021-04-18 16:00:00', '中国优选法统筹法与经济数学研究会是在中国科学技术协会直接领导下的学术性社会团体，是国家一级学会。学会由华罗庚教授于1981年发起成立，至今成立了评价方法与应用、项目管理、计算机模拟、统筹、管理决策与信息系统、工业工程、高等教育管理、数学教育、经济数学与管理数学、应急管理、灰色系统研究，复杂系统研究等十余个专业分会。竞赛是由中国优选法统筹法与经济数学研究会主办，MathorCup高校数学建模挑战赛组委会具体负责竞赛的组织。', '2021-01-15 16:00:00', '2021-06-13 16:00:00', '每支队伍需缴纳200元的报名费用。', '中国优选法统筹法与经济数学研究会', '每队不超过3人，不允许跨校组队参赛。', '文件一', 'http://www.mathorcup.org', 1);
INSERT INTO `contestinfo` VALUES (17, '周大镯', '理科比赛3', '校内', '理科', '国A', '2021-04-14 16:00:00', '2021-04-18 16:00:00', '中国优选法统筹法与经济数学研究会是在中国科学技术协会直接领导下的学术性社会团体，是国家一级学会。学会由华罗庚教授于1981年发起成立，至今成立了评价方法与应用、项目管理、计算机模拟、统筹、管理决策与信息系统、工业工程、高等教育管理、数学教育、经济数学与管理数学、应急管理、灰色系统研究，复杂系统研究等十余个专业分会。竞赛是由中国优选法统筹法与经济数学研究会主办，MathorCup高校数学建模挑战赛组委会具体负责竞赛的组织。', '2021-04-16 16:00:00', '2021-04-13 16:00:00', '每支队伍需缴纳200元的报名费用。', '中国优选法统筹法与经济数学研究会', '每队不超过3人，不允许跨校组队参赛。', '文件一', 'http://www.mathorcup.org', 1);
INSERT INTO `contestinfo` VALUES (19, '周大镯', '理科比赛5', '校内', '理科', '国A', '2021-04-14 16:00:00', '2021-04-18 16:00:00', '中国优选法统筹法与经济数学研究会是在中国科学技术协会直接领导下的学术性社会团体，是国家一级学会。学会由华罗庚教授于1981年发起成立，至今成立了评价方法与应用、项目管理、计算机模拟、统筹、管理决策与信息系统、工业工程、高等教育管理、数学教育、经济数学与管理数学、应急管理、灰色系统研究，复杂系统研究等十余个专业分会。竞赛是由中国优选法统筹法与经济数学研究会主办，MathorCup高校数学建模挑战赛组委会具体负责竞赛的组织。', '2021-02-12 16:00:00', '2021-06-13 16:00:00', '每支队伍需缴纳200元的报名费用。', '中国优选法统筹法与经济数学研究会', '每队不超过3人，不允许跨校组队参赛。', '文件一', 'http://www.mathorcup.org', 1);
INSERT INTO `contestinfo` VALUES (20, '周大镯', '理科比赛6', '校内', '理科', '国A', '2021-04-14 16:00:00', '2021-04-18 16:00:00', '中国优选法统筹法与经济数学研究会是在中国科学技术协会直接领导下的学术性社会团体，是国家一级学会。学会由华罗庚教授于1981年发起成立，至今成立了评价方法与应用、项目管理、计算机模拟、统筹、管理决策与信息系统、工业工程、高等教育管理、数学教育、经济数学与管理数学、应急管理、灰色系统研究，复杂系统研究等十余个专业分会。竞赛是由中国优选法统筹法与经济数学研究会主办，MathorCup高校数学建模挑战赛组委会具体负责竞赛的组织。', '2021-01-16 16:00:00', '2021-06-13 16:00:00', '每支队伍需缴纳200元的报名费用。', '中国优选法统筹法与经济数学研究会', '每队不超过3人，不允许跨校组队参赛。', '文件一', 'http://www.mathorcup.org', 1);
INSERT INTO `contestinfo` VALUES (22, '周大镯', '文科比赛2', '校内', '文科', '国A', '2021-04-14 16:00:00', '2021-04-18 16:00:00', '中国优选法统筹法与经济数学研究会是在中国科学技术协会直接领导下的学术性社会团体，是国家一级学会。学会由华罗庚教授于1981年发起成立，至今成立了评价方法与应用、项目管理、计算机模拟、统筹、管理决策与信息系统、工业工程、高等教育管理、数学教育、经济数学与管理数学、应急管理、灰色系统研究，复杂系统研究等十余个专业分会。竞赛是由中国优选法统筹法与经济数学研究会主办，MathorCup高校数学建模挑战赛组委会具体负责竞赛的组织。', '2021-04-15 16:00:00', '2021-06-26 16:00:00', '每支队伍需缴纳200元的报名费用。', '中国优选法统筹法与经济数学研究会', '每队不超过3人，不允许跨校组队参赛。', '文件一', 'http://www.mathorcup.org', 1);
INSERT INTO `contestinfo` VALUES (23, '周大镯', '文科比赛3', '校内', '文科', '国A', '2021-04-14 16:00:00', '2021-04-18 16:00:00', '中国优选法统筹法与经济数学研究会是在中国科学技术协会直接领导下的学术性社会团体，是国家一级学会。学会由华罗庚教授于1981年发起成立，至今成立了评价方法与应用、项目管理、计算机模拟、统筹、管理决策与信息系统、工业工程、高等教育管理、数学教育、经济数学与管理数学、应急管理、灰色系统研究，复杂系统研究等十余个专业分会。竞赛是由中国优选法统筹法与经济数学研究会主办，MathorCup高校数学建模挑战赛组委会具体负责竞赛的组织。', '2020-12-31 16:00:00', '2021-06-13 16:00:00', '每支队伍需缴纳200元的报名费用。', '中国优选法统筹法与经济数学研究会', '每队不超过3人，不允许跨校组队参赛。', '文件一', 'http://www.mathorcup.org', 1);
INSERT INTO `contestinfo` VALUES (24, '周大镯', '文科比赛4', '校内', '文科', '国A', '2021-04-14 16:00:00', '2021-04-18 16:00:00', '中国优选法统筹法与经济数学研究会是在中国科学技术协会直接领导下的学术性社会团体，是国家一级学会。学会由华罗庚教授于1981年发起成立，至今成立了评价方法与应用、项目管理、计算机模拟、统筹、管理决策与信息系统、工业工程、高等教育管理、数学教育、经济数学与管理数学、应急管理、灰色系统研究，复杂系统研究等十余个专业分会。竞赛是由中国优选法统筹法与经济数学研究会主办，MathorCup高校数学建模挑战赛组委会具体负责竞赛的组织。', '2021-04-01 16:00:00', '2021-06-30 16:00:00', '每支队伍需缴纳200元的报名费用。', '中国优选法统筹法与经济数学研究会', '每队不超过3人，不允许跨校组队参赛。', '文件一', 'http://www.mathorcup.org', 1);
INSERT INTO `contestinfo` VALUES (25, '周大镯', '文科比赛5', '校内', '文科', '国A', '2021-04-14 16:00:00', '2021-04-18 16:00:00', '中国优选法统筹法与经济数学研究会是在中国科学技术协会直接领导下的学术性社会团体，是国家一级学会。学会由华罗庚教授于1981年发起成立，至今成立了评价方法与应用、项目管理、计算机模拟、统筹、管理决策与信息系统、工业工程、高等教育管理、数学教育、经济数学与管理数学、应急管理、灰色系统研究，复杂系统研究等十余个专业分会。竞赛是由中国优选法统筹法与经济数学研究会主办，MathorCup高校数学建模挑战赛组委会具体负责竞赛的组织。', '2020-12-31 16:00:00', '2021-06-13 16:00:00', '每支队伍需缴纳200元的报名费用。', '中国优选法统筹法与经济数学研究会', '每队不超过3人，不允许跨校组队参赛。', '文件一', 'http://www.mathorcup.org', 1);
INSERT INTO `contestinfo` VALUES (26, '周大镯', '文科比赛6', '校内', '文科', '国A', '2021-04-14 16:00:00', '2021-04-18 16:00:00', '中国优选法统筹法与经济数学研究会是在中国科学技术协会直接领导下的学术性社会团体，是国家一级学会。学会由华罗庚教授于1981年发起成立，至今成立了评价方法与应用、项目管理、计算机模拟、统筹、管理决策与信息系统、工业工程、高等教育管理、数学教育、经济数学与管理数学、应急管理、灰色系统研究，复杂系统研究等十余个专业分会。竞赛是由中国优选法统筹法与经济数学研究会主办，MathorCup高校数学建模挑战赛组委会具体负责竞赛的组织。', '2020-12-31 16:00:00', '2021-06-13 16:00:00', '每支队伍需缴纳200元的报名费用。', '中国优选法统筹法与经济数学研究会', '每队不超过3人，不允许跨校组队参赛。', '文件一', 'http://www.mathorcup.org', 1);
INSERT INTO `contestinfo` VALUES (27, '周大镯', '文科比赛7', '校内', '文科', '国A', '2021-04-14 16:00:00', '2021-04-18 16:00:00', '中国优选法统筹法与经济数学研究会是在中国科学技术协会直接领导下的学术性社会团体，是国家一级学会。学会由华罗庚教授于1981年发起成立，至今成立了评价方法与应用、项目管理、计算机模拟、统筹、管理决策与信息系统、工业工程、高等教育管理、数学教育、经济数学与管理数学、应急管理、灰色系统研究，复杂系统研究等十余个专业分会。竞赛是由中国优选法统筹法与经济数学研究会主办，MathorCup高校数学建模挑战赛组委会具体负责竞赛的组织。', '2020-12-31 16:00:00', '2021-06-13 16:00:00', '每支队伍需缴纳200元的报名费用。', '中国优选法统筹法与经济数学研究会', '每队不超过3人，不允许跨校组队参赛。', '文件一', 'http://www.mathorcup.org', 1);
INSERT INTO `contestinfo` VALUES (28, '周大镯', '综合比赛1', '校内', '综合', '国A', '2021-04-14 16:00:00', '2021-04-18 16:00:00', '中国优选法统筹法与经济数学研究会是在中国科学技术协会直接领导下的学术性社会团体，是国家一级学会。学会由华罗庚教授于1981年发起成立，至今成立了评价方法与应用、项目管理、计算机模拟、统筹、管理决策与信息系统、工业工程、高等教育管理、数学教育、经济数学与管理数学、应急管理、灰色系统研究，复杂系统研究等十余个专业分会。竞赛是由中国优选法统筹法与经济数学研究会主办，MathorCup高校数学建模挑战赛组委会具体负责竞赛的组织。', '2020-12-31 16:00:00', '2021-06-13 16:00:00', '每支队伍需缴纳200元的报名费用。', '中国优选法统筹法与经济数学研究会', '每队不超过3人，不允许跨校组队参赛。', '文件一', 'http://www.mathorcup.org', 1);
INSERT INTO `contestinfo` VALUES (29, '周大镯', '综合比赛2', '校内', '综合', '国A', '2021-04-14 16:00:00', '2021-04-18 16:00:00', '中国优选法统筹法与经济数学研究会是在中国科学技术协会直接领导下的学术性社会团体，是国家一级学会。学会由华罗庚教授于1981年发起成立，至今成立了评价方法与应用、项目管理、计算机模拟、统筹、管理决策与信息系统、工业工程、高等教育管理、数学教育、经济数学与管理数学、应急管理、灰色系统研究，复杂系统研究等十余个专业分会。竞赛是由中国优选法统筹法与经济数学研究会主办，MathorCup高校数学建模挑战赛组委会具体负责竞赛的组织。', '2021-11-30 16:00:00', '2021-12-01 16:00:00', '每支队伍需缴纳200元的报名费用。', '中国优选法统筹法与经济数学研究会', '每队不超过3人，不允许跨校组队参赛。', '文件一', 'http://www.mathorcup.org', 1);
INSERT INTO `contestinfo` VALUES (30, '周大镯', '综合比赛2', '校内', '综合', '国A', '2021-04-14 16:00:00', '2021-04-18 16:00:00', '中国优选法统筹法与经济数学研究会是在中国科学技术协会直接领导下的学术性社会团体，是国家一级学会。学会由华罗庚教授于1981年发起成立，至今成立了评价方法与应用、项目管理、计算机模拟、统筹、管理决策与信息系统、工业工程、高等教育管理、数学教育、经济数学与管理数学、应急管理、灰色系统研究，复杂系统研究等十余个专业分会。竞赛是由中国优选法统筹法与经济数学研究会主办，MathorCup高校数学建模挑战赛组委会具体负责竞赛的组织。', '2021-12-31 16:00:00', '2022-04-13 16:00:00', '每支队伍需缴纳200元的报名费用。', '中国优选法统筹法与经济数学研究会', '每队不超过3人，不允许跨校组队参赛。', 'http://localhost:8088/file/article/doc/1620224335883教职工基本信息数据（数学）.xls', 'http://www.mathorcup.org', 1);
INSERT INTO `contestinfo` VALUES (34, '林群霞', '第十二届蓝桥杯全国软件和信息技术专业人才大赛竞赛信息', '校内', '工科', '国B', '2021-04-25 00:00:00', '2021-04-30 00:00:00', '蓝桥杯全国软件和信息技术专业人才大赛是由工业和信息化部人才交流中心举办的全国性IT学科赛事。共有北京大学、清华大学、上海交通大学等全国1200余所高校参赛，累计参赛人数超过40万人。2020年，蓝桥杯大赛被列入中国高等教育学会发布的“全国普通高校学科竞赛排行榜”，是高校教育教学改革和创新人才培养的重要竞赛项目。', '2021-04-09 00:00:00', '2021-06-22 00:00:00', '1.本届大赛由国信蓝桥教育科技（北京）股份有限公司承办，并统一收取大赛相关费用。\n\n2.大赛章程、后续通知、获奖名单等相关信息将由大赛组委会进行发布，请各参赛单位及个人及时关注大赛官网。', '工业和信息化部人才交流中心', '1人', 'http://localhost:8088/file/article/doc/1620224124864黄炬书简历.pdf', '网站', 1);

-- ----------------------------
-- Table structure for resourcesfile
-- ----------------------------
DROP TABLE IF EXISTS `resourcesfile`;
CREATE TABLE `resourcesfile`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_time` datetime(0) NULL DEFAULT NULL,
  `file_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_view` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 84 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resourcesfile
-- ----------------------------
INSERT INTO `resourcesfile` VALUES (60, '16189893191411.jpg', 'http://localhost:8088/file/filedownload/16189893191411.jpg', '2021-04-21 15:15:19', '通知', NULL);
INSERT INTO `resourcesfile` VALUES (61, '16189893194252.jpg', 'http://localhost:8088/file/filedownload/16189893194252.jpg', '2021-04-21 15:15:19', '通知', NULL);
INSERT INTO `resourcesfile` VALUES (62, '1618989332618content_1616057366874.docx', 'http://localhost:8088/file/filedownload/1618989332618content_1616057366874.docx', '2021-04-21 15:15:33', '通知', NULL);
INSERT INTO `resourcesfile` VALUES (66, '1618989622819问题1.docx', 'http://localhost:8088/file/filedownload/1618989622819问题1.docx', '2021-04-21 15:20:23', '通知', NULL);
INSERT INTO `resourcesfile` VALUES (71, '1618989789639捕获.JPG', 'http://localhost:8088/file/filedownload/1618989789639捕获.JPG', '2021-04-21 15:23:10', '通知', NULL);
INSERT INTO `resourcesfile` VALUES (75, '16189905813751.jpg', 'http://localhost:8088/file/filedownload/16189905813751.jpg', '2021-04-21 15:36:21', '通知', NULL);
INSERT INTO `resourcesfile` VALUES (77, '1618993383119cam.xlsx', 'http://localhost:8088/file/filedownload/1618993383119cam.xlsx', '2021-04-21 16:23:03', '通知', NULL);
INSERT INTO `resourcesfile` VALUES (78, '1618993383225content_1616057366874.docx', 'http://localhost:8088/file/filedownload/1618993383225content_1616057366874.docx', '2021-04-21 16:23:03', '通知', NULL);
INSERT INTO `resourcesfile` VALUES (81, '1618993393740问题1.docx', 'http://localhost:8088/file/filedownload/1618993393740问题1.docx', '2021-04-21 16:23:14', '作品', NULL);
INSERT INTO `resourcesfile` VALUES (82, '1618993393838系统管理员用例图.vsdx', 'http://localhost:8088/file/filedownload/1618993393838系统管理员用例图.vsdx', '2021-04-21 16:23:14', '作品', NULL);
INSERT INTO `resourcesfile` VALUES (83, '1618993393949系统框架.vsdx', 'http://localhost:8088/file/filedownload/1618993393949系统框架.vsdx', '2021-04-21 16:23:14', '作品', NULL);

-- ----------------------------
-- Table structure for signs
-- ----------------------------
DROP TABLE IF EXISTS `signs`;
CREATE TABLE `signs`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '报名编号',
  `cid` int(0) NULL DEFAULT NULL COMMENT '竞赛id',
  `sign_time` datetime(0) NOT NULL COMMENT '报名日期',
  `sign_state` smallint(0) NOT NULL COMMENT '审核情况（0失败，1正在审核，2成功）',
  `guide_teacher` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '指导老师',
  `sign_teammumber1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报名人学号1，队长',
  `sign_teammumber2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报名人学号2',
  `sign_teammumber3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报名人学号3',
  `sign_teammumber4` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报名人学号4',
  `sign_teammumber5` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报名人学号5',
  `sign_teammumber6` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报名人学号6',
  `sign_teammumber7` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报名人学号7',
  `sign_teammumber8` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报名人学号8',
  `sign_teammumber9` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报名人学号9',
  `sign_teammumber10` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报名人学号10',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `sign_teammumber1`(`sign_teammumber1`) USING BTREE,
  INDEX `signs_ibfk_4`(`sign_teammumber2`) USING BTREE,
  INDEX `signs_ibfk_5`(`sign_teammumber3`) USING BTREE,
  INDEX `signs_ibfk_6`(`sign_teammumber4`) USING BTREE,
  INDEX `signs_ibfk_7`(`sign_teammumber5`) USING BTREE,
  INDEX `signs_ibfk_8`(`sign_teammumber6`) USING BTREE,
  INDEX `signs_ibfk_9`(`sign_teammumber7`) USING BTREE,
  INDEX `signs_ibfk_10`(`sign_teammumber8`) USING BTREE,
  INDEX `signs_ibfk_11`(`sign_teammumber9`) USING BTREE,
  INDEX `signs_ibfk_12`(`sign_teammumber10`) USING BTREE,
  INDEX `guide_teacher`(`guide_teacher`) USING BTREE,
  CONSTRAINT `signs_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `contestinfo` (`cid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `signs_ibfk_10` FOREIGN KEY (`sign_teammumber8`) REFERENCES `student` (`student_no`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `signs_ibfk_11` FOREIGN KEY (`sign_teammumber9`) REFERENCES `student` (`student_no`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `signs_ibfk_12` FOREIGN KEY (`sign_teammumber10`) REFERENCES `student` (`student_no`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `signs_ibfk_13` FOREIGN KEY (`guide_teacher`) REFERENCES `teacher` (`teacher_name`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `signs_ibfk_3` FOREIGN KEY (`sign_teammumber1`) REFERENCES `student` (`student_no`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `signs_ibfk_4` FOREIGN KEY (`sign_teammumber2`) REFERENCES `student` (`student_no`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `signs_ibfk_5` FOREIGN KEY (`sign_teammumber3`) REFERENCES `student` (`student_no`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `signs_ibfk_6` FOREIGN KEY (`sign_teammumber4`) REFERENCES `student` (`student_no`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `signs_ibfk_7` FOREIGN KEY (`sign_teammumber5`) REFERENCES `student` (`student_no`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `signs_ibfk_8` FOREIGN KEY (`sign_teammumber6`) REFERENCES `student` (`student_no`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `signs_ibfk_9` FOREIGN KEY (`sign_teammumber7`) REFERENCES `student` (`student_no`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of signs
-- ----------------------------
INSERT INTO `signs` VALUES (4, 1, '2021-04-15 14:49:17', 1, '周大镯', '1705120102114', '1705120102126', '1705120102111', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `signs` VALUES (15, 3, '2021-04-17 21:31:13', 2, '林群霞', '1705120102111', '1705120102123', '1705120102124', '1705120102125', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `signs` VALUES (27, 1, '2021-04-17 21:28:45', 2, '周大镯', '1705120102118', '1705120102111', '1705120102113', '1705120102116', '1705120102117', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `signs` VALUES (28, 2, '2021-04-21 20:04:55', 2, '林群霞', '1705120102119', '1705120102116', '1705120102117', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `signs` VALUES (29, 3, '2021-04-21 20:04:55', 2, '周大镯', '1705120102120', '1705120102101', '1705120102128', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `signs` VALUES (30, 1, '2021-04-21 20:04:55', 2, '周大镯', '1705120102121', '1705120102102', '1705120102129', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `signs` VALUES (31, 4, '2021-04-21 20:04:55', 2, '张学锋', '1705120102122', '1705120102103', '1705120102130', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `signs` VALUES (32, 1, '2021-04-21 20:04:55', 2, '林群霞', '1705120102123', '1705120102104', '1705120102131', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `signs` VALUES (33, 1, '2021-04-21 20:04:55', 2, '张学锋', '1705120102124', '1705120102105', '1705120102132', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `signs` VALUES (34, 3, '2021-04-21 20:04:55', 2, '周大镯', '1705120102125', '1705120102106', '1705120102133', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `signs` VALUES (35, 2, '2021-04-21 20:04:55', 2, '张学锋', '1705120102126', '1705120102107', '1705120102134', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `signs` VALUES (37, 19, '2021-05-05 21:36:16', 1, '唐建国', '1705120102114', '1705120102101', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `signs` VALUES (38, 3, '2021-05-11 22:54:47', 1, NULL, '1705120102114', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `signs` VALUES (39, 3, '2021-05-12 11:11:21', 1, '陈海容', '1705120102114', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `signs` VALUES (40, 11, '2021-05-12 17:27:50', 1, '陈海容', '1705120102114', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `student_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生学号，要唯一，不能重复',
  `student_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生姓名',
  `student_sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '男' COMMENT '学生性别，如：男/女/未知',
  `student_college` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学院',
  `student_major` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业',
  `student_classes` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班级',
  `student_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `student_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `student_no`(`student_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1427 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '学生表模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (52, '1605070101112', '院宇航', '男', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (53, '1605070101136', '刘劲华', '男', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (54, '1605070101202', '黄靖怡', '女', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (55, '1705070101101', '吴瑞敏', '女', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (56, '1705070101102', '于鹏飞', '男', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (57, '1705070101103', '杨婉君', '女', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (58, '1705070101104', '郭爱慧', '女', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (59, '1705070101105', '蔡泽俏', '女', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (60, '1705070101106', '翟敏莎', '女', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (61, '1705070101107', '张晓琳', '女', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (62, '1705070101108', '沈晓纯', '女', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (63, '1705070101109', '文家惠', '女', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (64, '1705070101110', '廖苑君', '女', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (65, '1705070101112', '崔江泓', '女', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (66, '1705070101113', '刘灵芝', '女', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (67, '1705070101114', '叶惠贤', '女', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (68, '1705070101115', '周宇洋', '男', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (69, '1705070101116', '李菁菁', '女', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (70, '1705070101117', '戴晓黎', '女', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (71, '1705070101118', '谢卓茹', '女', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (72, '1705070101119', '叶秀婷', '女', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (73, '1705070101120', '徐子茹', '女', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (74, '1705070101121', '陈汉琳', '男', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (75, '1705070101122', '温智兴', '男', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (76, '1705070101123', '冯静怡', '女', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (77, '1705070101124', '陈晓明', '女', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (78, '1705070101125', '韦汉臣', '男', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (79, '1705070101126', '吕秋燕', '女', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (80, '1705070101127', '吴嘉翘', '男', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (81, '1705070101128', '林利', '女', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (82, '1705070101129', '廖燕婷', '女', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (83, '1705070101130', '曾师华', '女', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (84, '1705070101131', '曾淑慧', '女', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (85, '1705070101132', '翁蔓琪', '女', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (86, '1705070101133', '王冠利', '男', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (87, '1705070101134', '骆智青', '女', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (88, '1705070101135', '潘丹婷', '女', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (89, '1705070101136', '黄永丽', '女', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (90, '1705070101137', '李茵茵', '女', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (91, '1705070101138', '刘杏平', '女', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (92, '1705070101139', '郑冰纯', '女', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (93, '1706070301109', '刘雪丽', '女', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (94, '1706070301240', '蔡诗颖', '女', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (95, '1706081301120', '麦敏航', '男', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (96, '1709081602306', '肖洁茹', '女', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (97, '1709081602704', '邱惠珠', '女', '数学与大数据', '数学与应用数学', '17数学一班', NULL, NULL);
INSERT INTO `student` VALUES (98, '1705070101201', '陈晓婷', '女', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (99, '1705070101202', '杨慕宁', '女', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (100, '1705070101203', '张有光', '男', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (101, '1705070101204', '李子煜', '男', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (102, '1705070101205', '陶家兴', '男', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (103, '1705070101206', '陈若滨', '女', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (104, '1705070101207', '陈燕玲', '女', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (105, '1705070101208', '邓智立', '男', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (106, '1705070101209', '张思佩', '女', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (107, '1705070101210', '余乾威', '男', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (108, '1705070101211', '方映佳', '男', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (109, '1705070101212', '卢嘉慧', '女', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (110, '1705070101213', '张炽怡', '女', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (111, '1705070101214', '黄惠权', '男', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (112, '1705070101215', '韦嘉仪', '女', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (113, '1705070101216', '姚海明', '男', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (114, '1705070101217', '叶颖清', '女', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (115, '1705070101218', '王越', '女', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (116, '1705070101219', '林晓静', '女', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (117, '1705070101220', '孙景权', '男', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (118, '1705070101221', '张洁', '女', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (119, '1705070101222', '林上富', '男', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (120, '1705070101223', '陈湘琪', '女', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (121, '1705070101224', '陈漫淇', '女', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (122, '1705070101225', '马勇玉', '女', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (123, '1705070101226', '何雪铜', '女', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (124, '1705070101227', '骆艳', '女', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (125, '1705070101228', '何慧敏', '女', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (126, '1705070101229', '骆忻懿', '女', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (127, '1705070101230', '伍莹', '女', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (128, '1705070101231', '杨雨帆', '女', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (129, '1705070101232', '陈家申', '男', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (130, '1705070101233', '邹奕敏', '女', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (131, '1705070101234', '林燕佳', '女', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (132, '1705070101235', '陈晓娜', '女', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (133, '1705070101236', '叶丽佩', '女', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (134, '1705070101237', '刘若婷', '女', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (135, '1705070101238', '黄丽曼', '女', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (136, '1705070101239', '吴燕燕', '女', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (137, '1705070101240', '陈佩桦', '女', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (138, '1709081602129', '马嘉娜', '女', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (139, '1709081602225', '陈菁', '女', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (140, '1713071001319', '李春敏', '女', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (141, '1713071001332', '吴艺萍', '女', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (142, '1713071002135', '彭薇', '女', '数学与大数据', '数学与应用数学', '17数学二班', NULL, NULL);
INSERT INTO `student` VALUES (143, '1605070101111', '潘来萍', '女', '数学与大数据', '数学与应用数学', '17数学三班', NULL, NULL);
INSERT INTO `student` VALUES (144, '1605070101309', '尤婷婷', '女', '数学与大数据', '数学与应用数学', '17数学三班', NULL, NULL);
INSERT INTO `student` VALUES (145, '1705070101301', '李曼华', '女', '数学与大数据', '数学与应用数学', '17数学三班', NULL, NULL);
INSERT INTO `student` VALUES (146, '1705070101302', '何雅婷', '女', '数学与大数据', '数学与应用数学', '17数学三班', NULL, NULL);
INSERT INTO `student` VALUES (147, '1705070101303', '翁泺铷', '女', '数学与大数据', '数学与应用数学', '17数学三班', NULL, NULL);
INSERT INTO `student` VALUES (148, '1705070101304', '李晓君', '女', '数学与大数据', '数学与应用数学', '17数学三班', NULL, NULL);
INSERT INTO `student` VALUES (149, '1705070101305', '郭倩欣', '女', '数学与大数据', '数学与应用数学', '17数学三班', NULL, NULL);
INSERT INTO `student` VALUES (150, '1705070101306', '苏美夷', '女', '数学与大数据', '数学与应用数学', '17数学三班', NULL, NULL);
INSERT INTO `student` VALUES (151, '1705070101307', '陈晓兰', '女', '数学与大数据', '数学与应用数学', '17数学三班', NULL, NULL);
INSERT INTO `student` VALUES (152, '1705070101308', '黄水华', '女', '数学与大数据', '数学与应用数学', '17数学三班', NULL, NULL);
INSERT INTO `student` VALUES (153, '1705070101309', '江岸阳', '男', '数学与大数据', '数学与应用数学', '17数学三班', NULL, NULL);
INSERT INTO `student` VALUES (154, '1705070101310', '林家仰', '女', '数学与大数据', '数学与应用数学', '17数学三班', NULL, NULL);
INSERT INTO `student` VALUES (155, '1705070101311', '陈佳欣', '女', '数学与大数据', '数学与应用数学', '17数学三班', NULL, NULL);
INSERT INTO `student` VALUES (156, '1705070101312', '陈滢莹', '女', '数学与大数据', '数学与应用数学', '17数学三班', NULL, NULL);
INSERT INTO `student` VALUES (157, '1705070101313', '彭咏琪', '女', '数学与大数据', '数学与应用数学', '17数学三班', NULL, NULL);
INSERT INTO `student` VALUES (158, '1705070101314', '郭婵英', '女', '数学与大数据', '数学与应用数学', '17数学三班', NULL, NULL);
INSERT INTO `student` VALUES (159, '1705070101315', '黄国强', '男', '数学与大数据', '数学与应用数学', '17数学三班', NULL, NULL);
INSERT INTO `student` VALUES (160, '1705070101316', '伍杰锋', '男', '数学与大数据', '数学与应用数学', '17数学三班', NULL, NULL);
INSERT INTO `student` VALUES (161, '1705070101317', '陈煜佳', '男', '数学与大数据', '数学与应用数学', '17数学三班', NULL, NULL);
INSERT INTO `student` VALUES (162, '1705070101318', '何竺桃', '女', '数学与大数据', '数学与应用数学', '17数学三班', NULL, NULL);
INSERT INTO `student` VALUES (163, '1705070101319', '徐淘', '女', '数学与大数据', '数学与应用数学', '17数学三班', NULL, NULL);
INSERT INTO `student` VALUES (164, '1705070101320', '刘烁', '女', '数学与大数据', '数学与应用数学', '17数学三班', NULL, NULL);
INSERT INTO `student` VALUES (165, '1705070101321', '蔡桂萍', '女', '数学与大数据', '数学与应用数学', '17数学三班', NULL, NULL);
INSERT INTO `student` VALUES (166, '1705070101322', '王鹏威', '男', '数学与大数据', '数学与应用数学', '17数学三班', NULL, NULL);
INSERT INTO `student` VALUES (167, '1705070101323', '胡裕雅', '女', '数学与大数据', '数学与应用数学', '17数学三班', NULL, NULL);
INSERT INTO `student` VALUES (168, '1705070101324', '李章键', '男', '数学与大数据', '数学与应用数学', '17数学三班', NULL, NULL);
INSERT INTO `student` VALUES (169, '1705070101325', '张妮欢', '女', '数学与大数据', '数学与应用数学', '17数学三班', NULL, NULL);
INSERT INTO `student` VALUES (170, '1705070101326', '徐雪盼', '女', '数学与大数据', '数学与应用数学', '17数学三班', NULL, NULL);
INSERT INTO `student` VALUES (171, '1705070101327', '吴冰君', '女', '数学与大数据', '数学与应用数学', '17数学三班', NULL, NULL);
INSERT INTO `student` VALUES (172, '1705070101328', '许永标', '男', '数学与大数据', '数学与应用数学', '17数学三班', NULL, NULL);
INSERT INTO `student` VALUES (173, '1705070101329', '黄伟群', '女', '数学与大数据', '数学与应用数学', '17数学三班', NULL, NULL);
INSERT INTO `student` VALUES (174, '1705070101330', '黄俊辉', '男', '数学与大数据', '数学与应用数学', '17数学三班', NULL, NULL);
INSERT INTO `student` VALUES (175, '1705070101331', '刘思宏', '男', '数学与大数据', '数学与应用数学', '17数学三班', NULL, NULL);
INSERT INTO `student` VALUES (176, '1705070101332', '黄淦添', '男', '数学与大数据', '数学与应用数学', '17数学三班', NULL, NULL);
INSERT INTO `student` VALUES (177, '1705070101333', '钟细萍', '女', '数学与大数据', '数学与应用数学', '17数学三班', NULL, NULL);
INSERT INTO `student` VALUES (178, '1705070101334', '黄利华', '女', '数学与大数据', '数学与应用数学', '17数学三班', NULL, NULL);
INSERT INTO `student` VALUES (179, '1705070101335', '李珍珍', '女', '数学与大数据', '数学与应用数学', '17数学三班', NULL, NULL);
INSERT INTO `student` VALUES (180, '1705070101336', '巫欣静', '女', '数学与大数据', '数学与应用数学', '17数学三班', NULL, NULL);
INSERT INTO `student` VALUES (181, '1705070101337', '蔡妙雪', '女', '数学与大数据', '数学与应用数学', '17数学三班', NULL, NULL);
INSERT INTO `student` VALUES (182, '1705070101338', '戴志峰', '男', '数学与大数据', '数学与应用数学', '17数学三班', NULL, NULL);
INSERT INTO `student` VALUES (183, '1705070101340', '洪佩璇', '女', '数学与大数据', '数学与应用数学', '17数学三班', NULL, NULL);
INSERT INTO `student` VALUES (184, '1712070504129', '何晓铃', '女', '数学与大数据', '数学与应用数学', '17数学三班', NULL, NULL);
INSERT INTO `student` VALUES (186, '1705070101401', '谢剑文', '男', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (187, '1705070101402', '黎昶妙', '女', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (188, '1705070101403', '陈静欣', '女', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (189, '1705070101404', '钟妙妮', '女', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (190, '1705070101405', '黄惠芳', '女', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (191, '1705070101406', '邱琪慧', '女', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (192, '1705070101407', '翟学殷', '女', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (193, '1705070101408', '邵先启', '男', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (194, '1705070101409', '毛子荣', '男', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (195, '1705070101410', '阮晓萱', '女', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (196, '1705070101411', '许俊鹏', '男', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (197, '1705070101412', '曾湛清', '男', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (198, '1705070101413', '罗媛丹', '女', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (199, '1705070101414', '刘柯邑', '女', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (200, '1705070101415', '李紫溦', '女', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (201, '1705070101416', '罗漪', '女', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (202, '1705070101417', '康贝贝', '女', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (203, '1705070101418', '黄洁', '女', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (204, '1705070101419', '吴尚锋', '男', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (205, '1705070101420', '刘石荣', '男', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (206, '1705070101421', '林钊琪', '女', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (207, '1705070101422', '李小燕', '女', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (208, '1705070101423', '王健', '男', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (209, '1705070101424', '王豪元', '男', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (210, '1705070101425', '郑海燕', '女', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (211, '1705070101426', '罗洁怡', '女', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (212, '1705070101427', '何佳瑜', '女', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (213, '1705070101428', '叶岳敏', '男', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (214, '1705070101429', '杨霄', '女', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (215, '1705070101430', '陈钰莹', '女', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (216, '1705070101431', '薛清怡', '女', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (217, '1705070101432', '周敏鑫', '女', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (218, '1705070101433', '陈泽娟', '女', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (219, '1705070101434', '梁桂源', '男', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (220, '1705070101435', '叶韶润', '男', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (221, '1705070101436', '李锦炫', '女', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (222, '1705070101437', '林美凤', '女', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (223, '1705070101438', '林洁鑫', '男', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (224, '1706070301102', '蔡思瑶', '女', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (225, '1713071001236', '俞诗', '女', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (226, '1713071001324', '曾亮', '女', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (227, '1713071001337', '陈晓停', '女', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (228, '1713071001340', '陈晓菁', '女', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (229, '1713071002101', '林思思', '女', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (230, '1713071002229', '李玟', '女', '数学与大数据', '数学与应用数学', '17数学四班', NULL, NULL);
INSERT INTO `student` VALUES (231, '1705120102101', '郑凯元', '男', '数学与大数据', '信息管理与信息系统', '17信管一班', NULL, NULL);
INSERT INTO `student` VALUES (232, '1705120102102', '陈伟泓', '男', '数学与大数据', '信息管理与信息系统', '17信管一班', NULL, NULL);
INSERT INTO `student` VALUES (233, '1705120102103', '陈婷婷', '女', '数学与大数据', '信息管理与信息系统', '17信管一班', NULL, NULL);
INSERT INTO `student` VALUES (234, '1705120102104', '官婉婷', '女', '数学与大数据', '信息管理与信息系统', '17信管一班', NULL, NULL);
INSERT INTO `student` VALUES (235, '1705120102105', '洪林鹏', '男', '数学与大数据', '信息管理与信息系统', '17信管一班', NULL, NULL);
INSERT INTO `student` VALUES (236, '1705120102106', '刘丽萍', '女', '数学与大数据', '信息管理与信息系统', '17信管一班', NULL, NULL);
INSERT INTO `student` VALUES (237, '1705120102107', '吴丹纯', '女', '数学与大数据', '信息管理与信息系统', '17信管一班', NULL, NULL);
INSERT INTO `student` VALUES (238, '1705120102108', '刘特滨', '男', '数学与大数据', '信息管理与信息系统', '17信管一班', NULL, NULL);
INSERT INTO `student` VALUES (239, '1705120102109', '曾泽楷', '男', '数学与大数据', '信息管理与信息系统', '17信管一班', NULL, NULL);
INSERT INTO `student` VALUES (240, '1705120102110', '张伊茹', '女', '数学与大数据', '信息管理与信息系统', '17信管一班', NULL, NULL);
INSERT INTO `student` VALUES (241, '1705120102111', '张海林', '男', '数学与大数据', '信息管理与信息系统', '17信管一班', NULL, NULL);
INSERT INTO `student` VALUES (242, '1705120102112', '陈家怡', '女', '数学与大数据', '信息管理与信息系统', '17信管一班', NULL, NULL);
INSERT INTO `student` VALUES (243, '1705120102113', '陈婧', '女', '数学与大数据', '信息管理与信息系统', '17信管一班', NULL, NULL);
INSERT INTO `student` VALUES (244, '1705120102114', '黄炬书', '男', '数学与大数据', '信息管理与信息系统', '17信管1班', '22194534@qq.com', '456123');
INSERT INTO `student` VALUES (245, '1705120102115', '江心郁', '女', '数学与大数据', '信息管理与信息系统', '17信管一班', NULL, NULL);
INSERT INTO `student` VALUES (246, '1705120102116', '谢灿凤', '女', '数学与大数据', '信息管理与信息系统', '17信管一班', NULL, NULL);
INSERT INTO `student` VALUES (247, '1705120102117', '陈浩仪', '男', '数学与大数据', '信息管理与信息系统', '17信管一班', NULL, NULL);
INSERT INTO `student` VALUES (248, '1705120102118', '陈梓斌', '男', '数学与大数据', '信息管理与信息系统', '17信管一班', NULL, NULL);
INSERT INTO `student` VALUES (249, '1705120102119', '吴嘉悦', '女', '数学与大数据', '信息管理与信息系统', '17信管一班', NULL, NULL);
INSERT INTO `student` VALUES (250, '1705120102120', '陈晓冰', '女', '数学与大数据', '信息管理与信息系统', '17信管一班', NULL, NULL);
INSERT INTO `student` VALUES (251, '1705120102121', '雷炽奇', '男', '数学与大数据', '信息管理与信息系统', '17信管一班', NULL, NULL);
INSERT INTO `student` VALUES (252, '1705120102122', '李安淇', '女', '数学与大数据', '信息管理与信息系统', '17信管一班', NULL, NULL);
INSERT INTO `student` VALUES (253, '1705120102123', '吴柏煜', '男', '数学与大数据', '信息管理与信息系统', '17信管一班', NULL, NULL);
INSERT INTO `student` VALUES (254, '1705120102124', '刘旭阳', '女', '数学与大数据', '信息管理与信息系统', '17信管一班', NULL, NULL);
INSERT INTO `student` VALUES (255, '1705120102125', '陈思炀', '女', '数学与大数据', '信息管理与信息系统', '17信管一班', NULL, NULL);
INSERT INTO `student` VALUES (256, '1705120102126', '刘正航', '男', '数学与统计学院', '信息管理与信息系统', '17信管1班', '22194534@qq.com', '4561231587');
INSERT INTO `student` VALUES (257, '1705120102127', '赖丽珍', '女', '数学与大数据', '信息管理与信息系统', '17信管一班', NULL, NULL);
INSERT INTO `student` VALUES (258, '1705120102128', '王远声', '男', '数学与大数据', '信息管理与信息系统', '17信管一班', NULL, NULL);
INSERT INTO `student` VALUES (259, '1705120102129', '潘琦虹', '女', '数学与大数据', '信息管理与信息系统', '17信管一班', NULL, NULL);
INSERT INTO `student` VALUES (260, '1705120102130', '吴晓敏', '女', '数学与大数据', '信息管理与信息系统', '17信管一班', NULL, NULL);
INSERT INTO `student` VALUES (261, '1705120102131', '黄东阳', '男', '数学与大数据', '信息管理与信息系统', '17信管一班', NULL, NULL);
INSERT INTO `student` VALUES (262, '1705120102132', '陈志峰', '男', '数学与大数据', '信息管理与信息系统', '17信管一班', NULL, NULL);
INSERT INTO `student` VALUES (263, '1705120102133', '赖雪云', '女', '数学与大数据', '信息管理与信息系统', '17信管一班', NULL, NULL);
INSERT INTO `student` VALUES (264, '1705120102134', '张晓婕', '女', '数学与大数据', '信息管理与信息系统', '17信管一班', NULL, NULL);
INSERT INTO `student` VALUES (265, '1705120102135', '黄君华', '男', '数学与大数据', '信息管理与信息系统', '17信管一班', NULL, NULL);
INSERT INTO `student` VALUES (266, '1705120102136', '彭怡欣', '女', '数学与大数据', '信息管理与信息系统', '17信管一班', NULL, NULL);
INSERT INTO `student` VALUES (267, '1705120102137', '邓锴鹏', '男', '数学与大数据', '信息管理与信息系统', '17信管一班', NULL, NULL);
INSERT INTO `student` VALUES (268, '1705120102138', '陈丽', '女', '数学与大数据', '信息管理与信息系统', '17信管一班', NULL, NULL);
INSERT INTO `student` VALUES (269, '1705120102139', '陈文敏', '女', '数学与大数据', '信息管理与信息系统', '17信管一班', NULL, NULL);
INSERT INTO `student` VALUES (270, '1708081001211', '黄志涛', '男', '数学与大数据', '信息管理与信息系统', '17信管一班', NULL, NULL);
INSERT INTO `student` VALUES (271, '1705071202101', '陈璟', '女', '数学与大数据', '应用统计学', '17应统一班', NULL, NULL);
INSERT INTO `student` VALUES (272, '1705071202102', '郑康钒', '男', '数学与大数据', '应用统计学', '17应统一班', NULL, NULL);
INSERT INTO `student` VALUES (273, '1705071202103', '黄婧', '女', '数学与大数据', '应用统计学', '17应统一班', NULL, NULL);
INSERT INTO `student` VALUES (274, '1705071202104', '周炜谦', '男', '数学与大数据', '应用统计学', '17应统一班', NULL, NULL);
INSERT INTO `student` VALUES (275, '1705071202105', '赖丽敏', '女', '数学与大数据', '应用统计学', '17应统一班', NULL, NULL);
INSERT INTO `student` VALUES (276, '1705071202106', '吴文锐', '男', '数学与大数据', '应用统计学', '17应统一班', NULL, NULL);
INSERT INTO `student` VALUES (277, '1705071202107', '陈嘉儿', '女', '数学与大数据', '应用统计学', '17应统一班', NULL, NULL);
INSERT INTO `student` VALUES (278, '1705071202108', '何嘉悦', '女', '数学与大数据', '应用统计学', '17应统一班', NULL, NULL);
INSERT INTO `student` VALUES (279, '1705071202109', '邬旭军', '男', '数学与大数据', '应用统计学', '17应统一班', NULL, NULL);
INSERT INTO `student` VALUES (280, '1705071202110', '余捷铧', '女', '数学与大数据', '应用统计学', '17应统一班', NULL, NULL);
INSERT INTO `student` VALUES (281, '1705071202111', '陆露', '女', '数学与大数据', '应用统计学', '17应统一班', NULL, NULL);
INSERT INTO `student` VALUES (282, '1705071202112', '袁芝瑞', '女', '数学与大数据', '应用统计学', '17应统一班', NULL, NULL);
INSERT INTO `student` VALUES (283, '1705071202113', '黄广银', '男', '数学与大数据', '应用统计学', '17应统一班', NULL, NULL);
INSERT INTO `student` VALUES (284, '1705071202114', '戴伟明', '男', '数学与大数据', '应用统计学', '17应统一班', NULL, NULL);
INSERT INTO `student` VALUES (285, '1705071202115', '陈悦霞', '女', '数学与大数据', '应用统计学', '17应统一班', NULL, NULL);
INSERT INTO `student` VALUES (286, '1705071202116', '黄浩洵', '女', '数学与大数据', '应用统计学', '17应统一班', NULL, NULL);
INSERT INTO `student` VALUES (287, '1705071202117', '李碧娜', '女', '数学与大数据', '应用统计学', '17应统一班', NULL, NULL);
INSERT INTO `student` VALUES (288, '1705071202118', '李溢琳', '女', '数学与大数据', '应用统计学', '17应统一班', NULL, NULL);
INSERT INTO `student` VALUES (289, '1705071202119', '郑佳玲', '女', '数学与大数据', '应用统计学', '17应统一班', NULL, NULL);
INSERT INTO `student` VALUES (290, '1705071202120', '苏秀玫', '女', '数学与大数据', '应用统计学', '17应统一班', NULL, NULL);
INSERT INTO `student` VALUES (291, '1705071202121', '肖翠梨', '女', '数学与大数据', '应用统计学', '17应统一班', NULL, NULL);
INSERT INTO `student` VALUES (292, '1705071202122', '王扬子', '女', '数学与大数据', '应用统计学', '17应统一班', NULL, NULL);
INSERT INTO `student` VALUES (293, '1705071202123', '黄一峰', '男', '数学与大数据', '应用统计学', '17应统一班', NULL, NULL);
INSERT INTO `student` VALUES (294, '1705071202124', '赖敏锐', '女', '数学与大数据', '应用统计学', '17应统一班', NULL, NULL);
INSERT INTO `student` VALUES (295, '1705071202125', '郑礼访', '男', '数学与大数据', '应用统计学', '17应统一班', NULL, NULL);
INSERT INTO `student` VALUES (296, '1705071202126', '莫清雯', '女', '数学与大数据', '应用统计学', '17应统一班', NULL, NULL);
INSERT INTO `student` VALUES (297, '1705071202127', '陈鸿', '男', '数学与大数据', '应用统计学', '17应统一班', NULL, NULL);
INSERT INTO `student` VALUES (298, '1705071202128', '李楚珍', '女', '数学与大数据', '应用统计学', '17应统一班', NULL, NULL);
INSERT INTO `student` VALUES (299, '1705071202129', '汤桔铭', '女', '数学与大数据', '应用统计学', '17应统一班', NULL, NULL);
INSERT INTO `student` VALUES (300, '1705071202130', '黄美龄', '女', '数学与大数据', '应用统计学', '17应统一班', NULL, NULL);
INSERT INTO `student` VALUES (301, '1705071202131', '高暖亭', '女', '数学与大数据', '应用统计学', '17应统一班', NULL, NULL);
INSERT INTO `student` VALUES (302, '1705071202132', '梁宗鼎', '男', '数学与大数据', '应用统计学', '17应统一班', NULL, NULL);
INSERT INTO `student` VALUES (303, '1705071202133', '庄馥茵', '女', '数学与大数据', '应用统计学', '17应统一班', NULL, NULL);
INSERT INTO `student` VALUES (304, '1705071202134', '徐舒婷', '女', '数学与大数据', '应用统计学', '17应统一班', NULL, NULL);
INSERT INTO `student` VALUES (305, '1705071202135', '佘冰娜', '女', '数学与大数据', '应用统计学', '17应统一班', NULL, NULL);
INSERT INTO `student` VALUES (306, '1705071202136', '胡若婷', '女', '数学与大数据', '应用统计学', '17应统一班', NULL, NULL);
INSERT INTO `student` VALUES (307, '1705071202137', '陈萍', '女', '数学与大数据', '应用统计学', '17应统一班', NULL, NULL);
INSERT INTO `student` VALUES (308, '1705071202138', '黎嘉宇', '男', '数学与大数据', '应用统计学', '17应统一班', NULL, NULL);
INSERT INTO `student` VALUES (309, '1705071202139', '叶雨晨', '女', '数学与大数据', '应用统计学', '17应统一班', NULL, NULL);
INSERT INTO `student` VALUES (310, '1705071202140', '叶伟局', '男', '数学与大数据', '应用统计学', '17应统一班', NULL, NULL);
INSERT INTO `student` VALUES (311, '1706081301327', '罗婉萍', '女', '数学与大数据', '应用统计学', '17应统一班', NULL, NULL);
INSERT INTO `student` VALUES (312, '1708120103137', '杨葆源', '男', '数学与大数据', '应用统计学', '17应统一班', NULL, NULL);
INSERT INTO `student` VALUES (313, '1705071202201', '谢沛桃', '女', '数学与大数据', '应用统计学', '17应统二班', NULL, NULL);
INSERT INTO `student` VALUES (314, '1705071202202', '吴炜桦', '男', '数学与大数据', '应用统计学', '17应统二班', NULL, NULL);
INSERT INTO `student` VALUES (315, '1705071202203', '林晓金', '女', '数学与大数据', '应用统计学', '17应统二班', NULL, NULL);
INSERT INTO `student` VALUES (316, '1705071202204', '李桂珊', '女', '数学与大数据', '应用统计学', '17应统二班', NULL, NULL);
INSERT INTO `student` VALUES (317, '1705071202205', '林依珩', '女', '数学与大数据', '应用统计学', '17应统二班', NULL, NULL);
INSERT INTO `student` VALUES (318, '1705071202206', '刘惠芬', '女', '数学与大数据', '应用统计学', '17应统二班', NULL, NULL);
INSERT INTO `student` VALUES (319, '1705071202207', '李佩瑜', '女', '数学与大数据', '应用统计学', '17应统二班', NULL, NULL);
INSERT INTO `student` VALUES (320, '1705071202208', '陈耀聪', '男', '数学与大数据', '应用统计学', '17应统二班', NULL, NULL);
INSERT INTO `student` VALUES (321, '1705071202209', '沈镘烁', '女', '数学与大数据', '应用统计学', '17应统二班', NULL, NULL);
INSERT INTO `student` VALUES (322, '1705071202210', '郭燕纯', '女', '数学与大数据', '应用统计学', '17应统二班', NULL, NULL);
INSERT INTO `student` VALUES (323, '1705071202211', '韩振升', '男', '数学与大数据', '应用统计学', '17应统二班', NULL, NULL);
INSERT INTO `student` VALUES (324, '1705071202212', '陈倩茹', '女', '数学与大数据', '应用统计学', '17应统二班', NULL, NULL);
INSERT INTO `student` VALUES (325, '1705071202213', '钟汉生', '男', '数学与大数据', '应用统计学', '17应统二班', NULL, NULL);
INSERT INTO `student` VALUES (326, '1705071202214', '李彤恩', '女', '数学与大数据', '应用统计学', '17应统二班', NULL, NULL);
INSERT INTO `student` VALUES (327, '1705071202215', '周旭欣', '男', '数学与大数据', '应用统计学', '17应统二班', NULL, NULL);
INSERT INTO `student` VALUES (328, '1705071202216', '陆康敏', '女', '数学与大数据', '应用统计学', '17应统二班', NULL, NULL);
INSERT INTO `student` VALUES (329, '1705071202217', '陈红铃', '女', '数学与大数据', '应用统计学', '17应统二班', NULL, NULL);
INSERT INTO `student` VALUES (330, '1705071202218', '郭晓敏', '女', '数学与大数据', '应用统计学', '17应统二班', NULL, NULL);
INSERT INTO `student` VALUES (331, '1705071202219', '张焕君', '男', '数学与大数据', '应用统计学', '17应统二班', NULL, NULL);
INSERT INTO `student` VALUES (332, '1705071202220', '张俊祥', '男', '数学与大数据', '应用统计学', '17应统二班', NULL, NULL);
INSERT INTO `student` VALUES (333, '1705071202221', '张汉超', '男', '数学与大数据', '应用统计学', '17应统二班', NULL, NULL);
INSERT INTO `student` VALUES (334, '1705071202222', '罗欣茹', '女', '数学与大数据', '应用统计学', '17应统二班', NULL, NULL);
INSERT INTO `student` VALUES (335, '1705071202223', '陈慧密', '女', '数学与大数据', '应用统计学', '17应统二班', NULL, NULL);
INSERT INTO `student` VALUES (336, '1705071202224', '陈欢', '女', '数学与大数据', '应用统计学', '17应统二班', NULL, NULL);
INSERT INTO `student` VALUES (337, '1705071202225', '黄树鹏', '男', '数学与大数据', '应用统计学', '17应统二班', NULL, NULL);
INSERT INTO `student` VALUES (338, '1705071202226', '谢黛佳', '女', '数学与大数据', '应用统计学', '17应统二班', NULL, NULL);
INSERT INTO `student` VALUES (339, '1705071202227', '陈慧', '女', '数学与大数据', '应用统计学', '17应统二班', NULL, NULL);
INSERT INTO `student` VALUES (340, '1705071202228', '许枫莉', '女', '数学与大数据', '应用统计学', '17应统二班', NULL, NULL);
INSERT INTO `student` VALUES (341, '1705071202229', '陈龙', '男', '数学与大数据', '应用统计学', '17应统二班', NULL, NULL);
INSERT INTO `student` VALUES (342, '1705071202230', '曾思维', '男', '数学与大数据', '应用统计学', '17应统二班', NULL, NULL);
INSERT INTO `student` VALUES (343, '1705071202231', '陶进柳', '女', '数学与大数据', '应用统计学', '17应统二班', NULL, NULL);
INSERT INTO `student` VALUES (344, '1705071202232', '陈碧仪', '女', '数学与大数据', '应用统计学', '17应统二班', NULL, NULL);
INSERT INTO `student` VALUES (345, '1705071202233', '周泽武', '男', '数学与大数据', '应用统计学', '17应统二班', NULL, NULL);
INSERT INTO `student` VALUES (346, '1705071202234', '黄丽', '女', '数学与大数据', '应用统计学', '17应统二班', NULL, NULL);
INSERT INTO `student` VALUES (347, '1705071202235', '李丹玲', '女', '数学与大数据', '应用统计学', '17应统二班', NULL, NULL);
INSERT INTO `student` VALUES (348, '1705071202236', '范映惠', '女', '数学与大数据', '应用统计学', '17应统二班', NULL, NULL);
INSERT INTO `student` VALUES (349, '1705071202237', '卓宛娴', '女', '数学与大数据', '应用统计学', '17应统二班', NULL, NULL);
INSERT INTO `student` VALUES (350, '1705071202238', '林丽茵', '女', '数学与大数据', '应用统计学', '17应统二班', NULL, NULL);
INSERT INTO `student` VALUES (351, '1705071202239', '陈燕双', '女', '数学与大数据', '应用统计学', '17应统二班', NULL, NULL);
INSERT INTO `student` VALUES (352, '1713071002222', '阮秀', '女', '数学与大数据', '应用统计学', '17应统二班', NULL, NULL);
INSERT INTO `student` VALUES (353, '1805070101101', '李永清', '女', '数学与大数据', '数学与应用数学', '18数学一班', NULL, NULL);
INSERT INTO `student` VALUES (354, '1805070101103', '黄焘', '男', '数学与大数据', '数学与应用数学', '18数学一班', NULL, NULL);
INSERT INTO `student` VALUES (355, '1805070101104', '黄睿奇', '男', '数学与大数据', '数学与应用数学', '18数学一班', NULL, NULL);
INSERT INTO `student` VALUES (356, '1805070101105', '梁炜杰', '男', '数学与大数据', '数学与应用数学', '18数学一班', NULL, NULL);
INSERT INTO `student` VALUES (357, '1805070101106', '黄少鸿', '男', '数学与大数据', '数学与应用数学', '18数学一班', NULL, NULL);
INSERT INTO `student` VALUES (358, '1805070101107', '苏浩杰', '男', '数学与大数据', '数学与应用数学', '18数学一班', NULL, NULL);
INSERT INTO `student` VALUES (359, '1805070101108', '张浩', '男', '数学与大数据', '数学与应用数学', '18数学一班', NULL, NULL);
INSERT INTO `student` VALUES (360, '1805070101109', '赖天龙', '男', '数学与大数据', '数学与应用数学', '18数学一班', NULL, NULL);
INSERT INTO `student` VALUES (361, '1805070101110', '李刚', '男', '数学与大数据', '数学与应用数学', '18数学一班', NULL, NULL);
INSERT INTO `student` VALUES (362, '1805070101111', '全飞武', '男', '数学与大数据', '数学与应用数学', '18数学一班', NULL, NULL);
INSERT INTO `student` VALUES (363, '1805070101112', '梁韵怡', '女', '数学与大数据', '数学与应用数学', '18数学一班', NULL, NULL);
INSERT INTO `student` VALUES (364, '1805070101113', '蒋淑玲', '女', '数学与大数据', '数学与应用数学', '18数学一班', NULL, NULL);
INSERT INTO `student` VALUES (365, '1805070101114', '黄银敏', '女', '数学与大数据', '数学与应用数学', '18数学一班', NULL, NULL);
INSERT INTO `student` VALUES (366, '1805070101115', '翁佳欣', '女', '数学与大数据', '数学与应用数学', '18数学一班', NULL, NULL);
INSERT INTO `student` VALUES (367, '1805070101116', '杨莹', '女', '数学与大数据', '数学与应用数学', '18数学一班', NULL, NULL);
INSERT INTO `student` VALUES (368, '1805070101117', '邓丽雅', '女', '数学与大数据', '数学与应用数学', '18数学一班', NULL, NULL);
INSERT INTO `student` VALUES (369, '1805070101118', '廖楚然', '女', '数学与大数据', '数学与应用数学', '18数学一班', NULL, NULL);
INSERT INTO `student` VALUES (370, '1805070101119', '何佳婷', '女', '数学与大数据', '数学与应用数学', '18数学一班', NULL, NULL);
INSERT INTO `student` VALUES (371, '1805070101120', '杨琼丹', '女', '数学与大数据', '数学与应用数学', '18数学一班', NULL, NULL);
INSERT INTO `student` VALUES (372, '1805070101121', '刘裕欢', '女', '数学与大数据', '数学与应用数学', '18数学一班', NULL, NULL);
INSERT INTO `student` VALUES (373, '1805070101122', '蔡婉菁', '女', '数学与大数据', '数学与应用数学', '18数学一班', NULL, NULL);
INSERT INTO `student` VALUES (374, '1805070101123', '张钰盈', '女', '数学与大数据', '数学与应用数学', '18数学一班', NULL, NULL);
INSERT INTO `student` VALUES (375, '1805070101124', '曾可婷', '女', '数学与大数据', '数学与应用数学', '18数学一班', NULL, NULL);
INSERT INTO `student` VALUES (376, '1805070101125', '蔡贤如', '女', '数学与大数据', '数学与应用数学', '18数学一班', NULL, NULL);
INSERT INTO `student` VALUES (377, '1805070101126', '陈子渝', '女', '数学与大数据', '数学与应用数学', '18数学一班', NULL, NULL);
INSERT INTO `student` VALUES (378, '1805070101127', '张洁', '女', '数学与大数据', '数学与应用数学', '18数学一班', NULL, NULL);
INSERT INTO `student` VALUES (379, '1805070101128', '毛曼珊', '女', '数学与大数据', '数学与应用数学', '18数学一班', NULL, NULL);
INSERT INTO `student` VALUES (380, '1805070101130', '陈嘉宜', '女', '数学与大数据', '数学与应用数学', '18数学一班', NULL, NULL);
INSERT INTO `student` VALUES (381, '1805070101131', '练小凤', '女', '数学与大数据', '数学与应用数学', '18数学一班', NULL, NULL);
INSERT INTO `student` VALUES (382, '1805070101132', '夏梦佳', '女', '数学与大数据', '数学与应用数学', '18数学一班', NULL, NULL);
INSERT INTO `student` VALUES (383, '1805070101133', '王海霞', '女', '数学与大数据', '数学与应用数学', '18数学一班', NULL, NULL);
INSERT INTO `student` VALUES (384, '1805070101134', '江喆纯', '女', '数学与大数据', '数学与应用数学', '18数学一班', NULL, NULL);
INSERT INTO `student` VALUES (385, '1805070101135', '温嘉瑜', '女', '数学与大数据', '数学与应用数学', '18数学一班', NULL, NULL);
INSERT INTO `student` VALUES (386, '1805070101136', '黄滟倩', '女', '数学与大数据', '数学与应用数学', '18数学一班', NULL, NULL);
INSERT INTO `student` VALUES (387, '1805070101137', '曾彩', '女', '数学与大数据', '数学与应用数学', '18数学一班', NULL, NULL);
INSERT INTO `student` VALUES (388, '1805070101138', '郭家苗', '女', '数学与大数据', '数学与应用数学', '18数学一班', NULL, NULL);
INSERT INTO `student` VALUES (389, '1805070101139', '陈晓琪', '女', '数学与大数据', '数学与应用数学', '18数学一班', NULL, NULL);
INSERT INTO `student` VALUES (390, '1807070201210', '吕叶家骏', '男', '数学与大数据', '数学与应用数学', '18数学一班', NULL, NULL);
INSERT INTO `student` VALUES (391, '1813071002230', '罗智慧', '女', '数学与大数据', '数学与应用数学', '18数学一班', NULL, NULL);
INSERT INTO `student` VALUES (392, '1813090502130', '苏华旋', '女', '数学与大数据', '数学与应用数学', '18数学一班', NULL, NULL);
INSERT INTO `student` VALUES (393, '1709081602502', '张莹莹', '女', '数学与大数据', '数学与应用数学', '18数学二班', NULL, NULL);
INSERT INTO `student` VALUES (394, '1712120901101', '何映清', '女', '数学与大数据', '数学与应用数学', '18数学二班', NULL, NULL);
INSERT INTO `student` VALUES (395, '1805070101201', '程颖', '女', '数学与大数据', '数学与应用数学', '18数学二班', NULL, NULL);
INSERT INTO `student` VALUES (396, '1805070101203', '吴金伟', '男', '数学与大数据', '数学与应用数学', '18数学二班', NULL, NULL);
INSERT INTO `student` VALUES (397, '1805070101204', '陈健龙', '男', '数学与大数据', '数学与应用数学', '18数学二班', NULL, NULL);
INSERT INTO `student` VALUES (398, '1805070101205', '卓跞', '男', '数学与大数据', '数学与应用数学', '18数学二班', NULL, NULL);
INSERT INTO `student` VALUES (399, '1805070101206', '谢锐锋', '男', '数学与大数据', '数学与应用数学', '18数学二班', NULL, NULL);
INSERT INTO `student` VALUES (400, '1805070101207', '丘朝柱', '男', '数学与大数据', '数学与应用数学', '18数学二班', NULL, NULL);
INSERT INTO `student` VALUES (401, '1805070101208', '邱志鸿', '男', '数学与大数据', '数学与应用数学', '18数学二班', NULL, NULL);
INSERT INTO `student` VALUES (402, '1805070101209', '赖学宾', '男', '数学与大数据', '数学与应用数学', '18数学二班', NULL, NULL);
INSERT INTO `student` VALUES (403, '1805070101210', '刘嘉浩', '男', '数学与大数据', '数学与应用数学', '18数学二班', NULL, NULL);
INSERT INTO `student` VALUES (404, '1805070101211', '梁峻铭', '男', '数学与大数据', '数学与应用数学', '18数学二班', NULL, NULL);
INSERT INTO `student` VALUES (405, '1805070101212', '陈泽鑫', '男', '数学与大数据', '数学与应用数学', '18数学二班', NULL, NULL);
INSERT INTO `student` VALUES (406, '1805070101213', '古佩瑶', '女', '数学与大数据', '数学与应用数学', '18数学二班', NULL, NULL);
INSERT INTO `student` VALUES (407, '1805070101214', '叶文婧', '女', '数学与大数据', '数学与应用数学', '18数学二班', NULL, NULL);
INSERT INTO `student` VALUES (408, '1805070101215', '陈佩凡', '女', '数学与大数据', '数学与应用数学', '18数学二班', NULL, NULL);
INSERT INTO `student` VALUES (409, '1805070101216', '刘海燕', '女', '数学与大数据', '数学与应用数学', '18数学二班', NULL, NULL);
INSERT INTO `student` VALUES (410, '1805070101217', '李家瑞', '女', '数学与大数据', '数学与应用数学', '18数学二班', NULL, NULL);
INSERT INTO `student` VALUES (411, '1805070101218', '杨丹瑶', '女', '数学与大数据', '数学与应用数学', '18数学二班', NULL, NULL);
INSERT INTO `student` VALUES (412, '1805070101219', '傅晓丹', '女', '数学与大数据', '数学与应用数学', '18数学二班', NULL, NULL);
INSERT INTO `student` VALUES (413, '1805070101220', '江玉冰', '女', '数学与大数据', '数学与应用数学', '18数学二班', NULL, NULL);
INSERT INTO `student` VALUES (414, '1805070101221', '徐少均', '女', '数学与大数据', '数学与应用数学', '18数学二班', NULL, NULL);
INSERT INTO `student` VALUES (415, '1805070101222', '曾小国', '女', '数学与大数据', '数学与应用数学', '18数学二班', NULL, NULL);
INSERT INTO `student` VALUES (416, '1805070101223', '刘思宇', '女', '数学与大数据', '数学与应用数学', '18数学二班', NULL, NULL);
INSERT INTO `student` VALUES (417, '1805070101224', '叶心怡', '女', '数学与大数据', '数学与应用数学', '18数学二班', NULL, NULL);
INSERT INTO `student` VALUES (418, '1805070101225', '高维', '女', '数学与大数据', '数学与应用数学', '18数学二班', NULL, NULL);
INSERT INTO `student` VALUES (419, '1805070101226', '贺子婷', '女', '数学与大数据', '数学与应用数学', '18数学二班', NULL, NULL);
INSERT INTO `student` VALUES (420, '1805070101227', '周丽玉', '女', '数学与大数据', '数学与应用数学', '18数学二班', NULL, NULL);
INSERT INTO `student` VALUES (421, '1805070101228', '陈慧伶', '女', '数学与大数据', '数学与应用数学', '18数学二班', NULL, NULL);
INSERT INTO `student` VALUES (422, '1805070101229', '朱晓玲', '女', '数学与大数据', '数学与应用数学', '18数学二班', NULL, NULL);
INSERT INTO `student` VALUES (423, '1805070101230', '林嘉利', '女', '数学与大数据', '数学与应用数学', '18数学二班', NULL, NULL);
INSERT INTO `student` VALUES (424, '1805070101231', '黄小淇', '女', '数学与大数据', '数学与应用数学', '18数学二班', NULL, NULL);
INSERT INTO `student` VALUES (425, '1805070101232', '吴淑莲', '女', '数学与大数据', '数学与应用数学', '18数学二班', NULL, NULL);
INSERT INTO `student` VALUES (426, '1805070101233', '钟诗丽', '女', '数学与大数据', '数学与应用数学', '18数学二班', NULL, NULL);
INSERT INTO `student` VALUES (427, '1805070101234', '郑丽琼', '女', '数学与大数据', '数学与应用数学', '18数学二班', NULL, NULL);
INSERT INTO `student` VALUES (428, '1805070101235', '吴永华', '女', '数学与大数据', '数学与应用数学', '18数学二班', NULL, NULL);
INSERT INTO `student` VALUES (429, '1805070101236', '张家淇', '女', '数学与大数据', '数学与应用数学', '18数学二班', NULL, NULL);
INSERT INTO `student` VALUES (430, '1805070101237', '魏秋裕', '女', '数学与大数据', '数学与应用数学', '18数学二班', NULL, NULL);
INSERT INTO `student` VALUES (431, '1805070101238', '刘媛媛', '女', '数学与大数据', '数学与应用数学', '18数学二班', NULL, NULL);
INSERT INTO `student` VALUES (432, '1805070101239', '温日霞', '女', '数学与大数据', '数学与应用数学', '18数学二班', NULL, NULL);
INSERT INTO `student` VALUES (433, '1805070101240', '刘颐青', '女', '数学与大数据', '数学与应用数学', '18数学二班', NULL, NULL);
INSERT INTO `student` VALUES (434, '1809081602527', '潘婧薇', '女', '数学与大数据', '数学与应用数学', '18数学二班', NULL, NULL);
INSERT INTO `student` VALUES (435, '1805070101301', '冉雅婷', '女', '数学与大数据', '数学与应用数学', '18数学三班', NULL, NULL);
INSERT INTO `student` VALUES (436, '1805070101302', '李泽军', '男', '数学与大数据', '数学与应用数学', '18数学三班', NULL, NULL);
INSERT INTO `student` VALUES (437, '1805070101303', '袁明炜', '男', '数学与大数据', '数学与应用数学', '18数学三班', NULL, NULL);
INSERT INTO `student` VALUES (438, '1805070101304', '曾海锋', '男', '数学与大数据', '数学与应用数学', '18数学三班', NULL, NULL);
INSERT INTO `student` VALUES (439, '1805070101305', '叶新杰', '男', '数学与大数据', '数学与应用数学', '18数学三班', NULL, NULL);
INSERT INTO `student` VALUES (440, '1805070101306', '张伦', '男', '数学与大数据', '数学与应用数学', '18数学三班', NULL, NULL);
INSERT INTO `student` VALUES (441, '1805070101307', '刘炫锋', '男', '数学与大数据', '数学与应用数学', '18数学三班', NULL, NULL);
INSERT INTO `student` VALUES (442, '1805070101308', '周焜波', '男', '数学与大数据', '数学与应用数学', '18数学三班', NULL, NULL);
INSERT INTO `student` VALUES (443, '1805070101309', '冯煜江', '男', '数学与大数据', '数学与应用数学', '18数学三班', NULL, NULL);
INSERT INTO `student` VALUES (444, '1805070101310', '徐奕健', '男', '数学与大数据', '数学与应用数学', '18数学三班', NULL, NULL);
INSERT INTO `student` VALUES (445, '1805070101311', '钟淩晟', '男', '数学与大数据', '数学与应用数学', '18数学三班', NULL, NULL);
INSERT INTO `student` VALUES (446, '1805070101312', '麦耀斯', '男', '数学与大数据', '数学与应用数学', '18数学三班', NULL, NULL);
INSERT INTO `student` VALUES (447, '1805070101313', '张冰洁', '女', '数学与大数据', '数学与应用数学', '18数学三班', NULL, NULL);
INSERT INTO `student` VALUES (448, '1805070101314', '黄诗颖', '女', '数学与大数据', '数学与应用数学', '18数学三班', NULL, NULL);
INSERT INTO `student` VALUES (449, '1805070101315', '肖莉', '女', '数学与大数据', '数学与应用数学', '18数学三班', NULL, NULL);
INSERT INTO `student` VALUES (450, '1805070101316', '杨家宝', '女', '数学与大数据', '数学与应用数学', '18数学三班', NULL, NULL);
INSERT INTO `student` VALUES (451, '1805070101317', '余嘉敏', '女', '数学与大数据', '数学与应用数学', '18数学三班', NULL, NULL);
INSERT INTO `student` VALUES (452, '1805070101318', '陈贝茜', '女', '数学与大数据', '数学与应用数学', '18数学三班', NULL, NULL);
INSERT INTO `student` VALUES (453, '1805070101319', '叶妮', '女', '数学与大数据', '数学与应用数学', '18数学三班', NULL, NULL);
INSERT INTO `student` VALUES (454, '1805070101320', '李晓静', '女', '数学与大数据', '数学与应用数学', '18数学三班', NULL, NULL);
INSERT INTO `student` VALUES (455, '1805070101321', '陈任娴', '女', '数学与大数据', '数学与应用数学', '18数学三班', NULL, NULL);
INSERT INTO `student` VALUES (456, '1805070101322', '陈吉纯', '女', '数学与大数据', '数学与应用数学', '18数学三班', NULL, NULL);
INSERT INTO `student` VALUES (457, '1805070101323', '卢彦欣', '女', '数学与大数据', '数学与应用数学', '18数学三班', NULL, NULL);
INSERT INTO `student` VALUES (458, '1805070101324', '谢梦婷', '女', '数学与大数据', '数学与应用数学', '18数学三班', NULL, NULL);
INSERT INTO `student` VALUES (459, '1805070101325', '廖娴', '女', '数学与大数据', '数学与应用数学', '18数学三班', NULL, NULL);
INSERT INTO `student` VALUES (460, '1805070101326', '蔡彦淇', '女', '数学与大数据', '数学与应用数学', '18数学三班', NULL, NULL);
INSERT INTO `student` VALUES (461, '1805070101327', '杨斯奇', '女', '数学与大数据', '数学与应用数学', '18数学三班', NULL, NULL);
INSERT INTO `student` VALUES (462, '1805070101328', '廖美如', '女', '数学与大数据', '数学与应用数学', '18数学三班', NULL, NULL);
INSERT INTO `student` VALUES (463, '1805070101329', '梁慧渊', '女', '数学与大数据', '数学与应用数学', '18数学三班', NULL, NULL);
INSERT INTO `student` VALUES (464, '1805070101330', '曾柔琴', '女', '数学与大数据', '数学与应用数学', '18数学三班', NULL, NULL);
INSERT INTO `student` VALUES (465, '1805070101331', '陈泽玲', '女', '数学与大数据', '数学与应用数学', '18数学三班', NULL, NULL);
INSERT INTO `student` VALUES (466, '1805070101332', '赖新新', '女', '数学与大数据', '数学与应用数学', '18数学三班', NULL, NULL);
INSERT INTO `student` VALUES (467, '1805070101333', '许晓霞', '女', '数学与大数据', '数学与应用数学', '18数学三班', NULL, NULL);
INSERT INTO `student` VALUES (468, '1805070101334', '刘苏娟', '女', '数学与大数据', '数学与应用数学', '18数学三班', NULL, NULL);
INSERT INTO `student` VALUES (469, '1805070101335', '傅丽虹', '女', '数学与大数据', '数学与应用数学', '18数学三班', NULL, NULL);
INSERT INTO `student` VALUES (470, '1805070101336', '吴海怡', '女', '数学与大数据', '数学与应用数学', '18数学三班', NULL, NULL);
INSERT INTO `student` VALUES (471, '1805070101337', '廖蕴酾', '女', '数学与大数据', '数学与应用数学', '18数学三班', NULL, NULL);
INSERT INTO `student` VALUES (472, '1805070101338', '洪少青', '女', '数学与大数据', '数学与应用数学', '18数学三班', NULL, NULL);
INSERT INTO `student` VALUES (473, '1805070101339', '郭凯云', '女', '数学与大数据', '数学与应用数学', '18数学三班', NULL, NULL);
INSERT INTO `student` VALUES (474, '1805070101340', '林泽杭', '女', '数学与大数据', '数学与应用数学', '18数学三班', NULL, NULL);
INSERT INTO `student` VALUES (475, '1807070201209', '叶搌宇', '男', '数学与大数据', '数学与应用数学', '18数学三班', NULL, NULL);
INSERT INTO `student` VALUES (476, '1812070501224', '郑嘉仪', '女', '数学与大数据', '数学与应用数学', '18数学三班', NULL, NULL);
INSERT INTO `student` VALUES (477, '1605070101326', '刘梓腾', '男', '数学与大数据', '数学与应用数学', '18数学四班', NULL, NULL);
INSERT INTO `student` VALUES (478, '1705070101339', '黄洁珠', '女', '数学与大数据', '数学与应用数学', '18数学四班', NULL, NULL);
INSERT INTO `student` VALUES (479, '1805070101401', '黄子芸', '女', '数学与大数据', '数学与应用数学', '18数学四班', NULL, NULL);
INSERT INTO `student` VALUES (480, '1805070101402', '戴子豪', '男', '数学与大数据', '数学与应用数学', '18数学四班', NULL, NULL);
INSERT INTO `student` VALUES (481, '1805070101403', '王珏淼', '男', '数学与大数据', '数学与应用数学', '18数学四班', NULL, NULL);
INSERT INTO `student` VALUES (482, '1805070101404', '吴立晓', '男', '数学与大数据', '数学与应用数学', '18数学四班', NULL, NULL);
INSERT INTO `student` VALUES (483, '1805070101405', '王帆', '男', '数学与大数据', '数学与应用数学', '18数学四班', NULL, NULL);
INSERT INTO `student` VALUES (484, '1805070101406', '袁鑫', '男', '数学与大数据', '数学与应用数学', '18数学四班', NULL, NULL);
INSERT INTO `student` VALUES (485, '1805070101407', '闻立初', '男', '数学与大数据', '数学与应用数学', '18数学四班', NULL, NULL);
INSERT INTO `student` VALUES (486, '1805070101408', '陈聪', '男', '数学与大数据', '数学与应用数学', '18数学四班', NULL, NULL);
INSERT INTO `student` VALUES (487, '1805070101409', '梁钰其', '男', '数学与大数据', '数学与应用数学', '18数学四班', NULL, NULL);
INSERT INTO `student` VALUES (488, '1805070101410', '曾蓥', '男', '数学与大数据', '数学与应用数学', '18数学四班', NULL, NULL);
INSERT INTO `student` VALUES (489, '1805070101411', '关业腾', '男', '数学与大数据', '数学与应用数学', '18数学四班', NULL, NULL);
INSERT INTO `student` VALUES (490, '1805070101412', '王志', '男', '数学与大数据', '数学与应用数学', '18数学四班', NULL, NULL);
INSERT INTO `student` VALUES (491, '1805070101413', '林熳丹', '女', '数学与大数据', '数学与应用数学', '18数学四班', NULL, NULL);
INSERT INTO `student` VALUES (492, '1805070101414', '谢淑婷', '女', '数学与大数据', '数学与应用数学', '18数学四班', NULL, NULL);
INSERT INTO `student` VALUES (493, '1805070101415', '黄温涵', '女', '数学与大数据', '数学与应用数学', '18数学四班', NULL, NULL);
INSERT INTO `student` VALUES (494, '1805070101416', '郑秋楠', '女', '数学与大数据', '数学与应用数学', '18数学四班', NULL, NULL);
INSERT INTO `student` VALUES (495, '1805070101417', '张秋莲', '女', '数学与大数据', '数学与应用数学', '18数学四班', NULL, NULL);
INSERT INTO `student` VALUES (496, '1805070101418', '巫文霞', '女', '数学与大数据', '数学与应用数学', '18数学四班', NULL, NULL);
INSERT INTO `student` VALUES (497, '1805070101419', '梁静仪', '女', '数学与大数据', '数学与应用数学', '18数学四班', NULL, NULL);
INSERT INTO `student` VALUES (498, '1805070101420', '吴雨欣', '女', '数学与大数据', '数学与应用数学', '18数学四班', NULL, NULL);
INSERT INTO `student` VALUES (499, '1805070101421', '张润娜', '女', '数学与大数据', '数学与应用数学', '18数学四班', NULL, NULL);
INSERT INTO `student` VALUES (500, '1805070101422', '刘文韵', '女', '数学与大数据', '数学与应用数学', '18数学四班', NULL, NULL);
INSERT INTO `student` VALUES (501, '1805070101423', '黄广梅', '女', '数学与大数据', '数学与应用数学', '18数学四班', NULL, NULL);
INSERT INTO `student` VALUES (502, '1805070101424', '邱锦旋', '女', '数学与大数据', '数学与应用数学', '18数学四班', NULL, NULL);
INSERT INTO `student` VALUES (503, '1805070101425', '徐玉婷', '女', '数学与大数据', '数学与应用数学', '18数学四班', NULL, NULL);
INSERT INTO `student` VALUES (504, '1805070101426', '廖燕芬', '女', '数学与大数据', '数学与应用数学', '18数学四班', NULL, NULL);
INSERT INTO `student` VALUES (505, '1805070101427', '詹博玲', '女', '数学与大数据', '数学与应用数学', '18数学四班', NULL, NULL);
INSERT INTO `student` VALUES (506, '1805070101428', '陈萝宜', '女', '数学与大数据', '数学与应用数学', '18数学四班', NULL, NULL);
INSERT INTO `student` VALUES (507, '1805070101429', '张谟嫔', '女', '数学与大数据', '数学与应用数学', '18数学四班', NULL, NULL);
INSERT INTO `student` VALUES (508, '1805070101430', '周嘉丽', '女', '数学与大数据', '数学与应用数学', '18数学四班', NULL, NULL);
INSERT INTO `student` VALUES (509, '1805070101431', '蓝心琪', '女', '数学与大数据', '数学与应用数学', '18数学四班', NULL, NULL);
INSERT INTO `student` VALUES (510, '1805070101432', '李炜佳', '女', '数学与大数据', '数学与应用数学', '18数学四班', NULL, NULL);
INSERT INTO `student` VALUES (511, '1805070101433', '李源健', '女', '数学与大数据', '数学与应用数学', '18数学四班', NULL, NULL);
INSERT INTO `student` VALUES (512, '1805070101435', '林泽琴', '女', '数学与大数据', '数学与应用数学', '18数学四班', NULL, NULL);
INSERT INTO `student` VALUES (513, '1805070101436', '刘瑾芳', '女', '数学与大数据', '数学与应用数学', '18数学四班', NULL, NULL);
INSERT INTO `student` VALUES (514, '1805070101437', '王洁莹', '女', '数学与大数据', '数学与应用数学', '18数学四班', NULL, NULL);
INSERT INTO `student` VALUES (515, '1805070101438', '陈晓云', '女', '数学与大数据', '数学与应用数学', '18数学四班', NULL, NULL);
INSERT INTO `student` VALUES (516, '1805070101439', '黄凯刁', '女', '数学与大数据', '数学与应用数学', '18数学四班', NULL, NULL);
INSERT INTO `student` VALUES (517, '1809081602414', '钟怡姿', '女', '数学与大数据', '数学与应用数学', '18数学四班', NULL, NULL);
INSERT INTO `student` VALUES (518, '1809081602430', '陈丽芳', '女', '数学与大数据', '数学与应用数学', '18数学四班', NULL, NULL);
INSERT INTO `student` VALUES (519, '1708082803118', '刘晓雪', '女', '数学与大数据', '数学与应用数学', '18数学五班', NULL, NULL);
INSERT INTO `student` VALUES (520, '1805070101501', '张瑞婷', '女', '数学与大数据', '数学与应用数学', '18数学五班', NULL, NULL);
INSERT INTO `student` VALUES (521, '1805070101502', '刘嘉', '男', '数学与大数据', '数学与应用数学', '18数学五班', NULL, NULL);
INSERT INTO `student` VALUES (522, '1805070101503', '严华彬', '男', '数学与大数据', '数学与应用数学', '18数学五班', NULL, NULL);
INSERT INTO `student` VALUES (523, '1805070101504', '高腾富', '男', '数学与大数据', '数学与应用数学', '18数学五班', NULL, NULL);
INSERT INTO `student` VALUES (524, '1805070101505', '陈政雄', '男', '数学与大数据', '数学与应用数学', '18数学五班', NULL, NULL);
INSERT INTO `student` VALUES (525, '1805070101506', '吴伟胜', '男', '数学与大数据', '数学与应用数学', '18数学五班', NULL, NULL);
INSERT INTO `student` VALUES (526, '1805070101507', '邓威', '男', '数学与大数据', '数学与应用数学', '18数学五班', NULL, NULL);
INSERT INTO `student` VALUES (527, '1805070101508', '杨文光', '男', '数学与大数据', '数学与应用数学', '18数学五班', NULL, NULL);
INSERT INTO `student` VALUES (528, '1805070101509', '王晓伟', '男', '数学与大数据', '数学与应用数学', '18数学五班', NULL, NULL);
INSERT INTO `student` VALUES (529, '1805070101510', '路文焱', '男', '数学与大数据', '数学与应用数学', '18数学五班', NULL, NULL);
INSERT INTO `student` VALUES (530, '1805070101511', '林佳颖', '男', '数学与大数据', '数学与应用数学', '18数学五班', NULL, NULL);
INSERT INTO `student` VALUES (531, '1805070101512', '林璇', '女', '数学与大数据', '数学与应用数学', '18数学五班', NULL, NULL);
INSERT INTO `student` VALUES (532, '1805070101513', '洪紫芬', '女', '数学与大数据', '数学与应用数学', '18数学五班', NULL, NULL);
INSERT INTO `student` VALUES (533, '1805070101514', '杨阳婧', '女', '数学与大数据', '数学与应用数学', '18数学五班', NULL, NULL);
INSERT INTO `student` VALUES (534, '1805070101515', '冯婉琳', '女', '数学与大数据', '数学与应用数学', '18数学五班', NULL, NULL);
INSERT INTO `student` VALUES (535, '1805070101516', '廖一霖', '女', '数学与大数据', '数学与应用数学', '18数学五班', NULL, NULL);
INSERT INTO `student` VALUES (536, '1805070101517', '罗芮', '女', '数学与大数据', '数学与应用数学', '18数学五班', NULL, NULL);
INSERT INTO `student` VALUES (537, '1805070101518', '潘宝妮', '女', '数学与大数据', '数学与应用数学', '18数学五班', NULL, NULL);
INSERT INTO `student` VALUES (538, '1805070101519', '张泽霞', '女', '数学与大数据', '数学与应用数学', '18数学五班', NULL, NULL);
INSERT INTO `student` VALUES (539, '1805070101520', '陈泽云', '女', '数学与大数据', '数学与应用数学', '18数学五班', NULL, NULL);
INSERT INTO `student` VALUES (540, '1805070101521', '郑炼娜', '女', '数学与大数据', '数学与应用数学', '18数学五班', NULL, NULL);
INSERT INTO `student` VALUES (541, '1805070101522', '郑悦仪', '女', '数学与大数据', '数学与应用数学', '18数学五班', NULL, NULL);
INSERT INTO `student` VALUES (542, '1805070101523', '黄满满', '女', '数学与大数据', '数学与应用数学', '18数学五班', NULL, NULL);
INSERT INTO `student` VALUES (543, '1805070101524', '程星云', '女', '数学与大数据', '数学与应用数学', '18数学五班', NULL, NULL);
INSERT INTO `student` VALUES (544, '1805070101525', '骆咏琪', '女', '数学与大数据', '数学与应用数学', '18数学五班', NULL, NULL);
INSERT INTO `student` VALUES (545, '1805070101526', '潘俊琦', '女', '数学与大数据', '数学与应用数学', '18数学五班', NULL, NULL);
INSERT INTO `student` VALUES (546, '1805070101527', '林漫', '女', '数学与大数据', '数学与应用数学', '18数学五班', NULL, NULL);
INSERT INTO `student` VALUES (547, '1805070101528', '罗斯洁', '女', '数学与大数据', '数学与应用数学', '18数学五班', NULL, NULL);
INSERT INTO `student` VALUES (548, '1805070101529', '江丽婷', '女', '数学与大数据', '数学与应用数学', '18数学五班', NULL, NULL);
INSERT INTO `student` VALUES (549, '1805070101530', '赖心如', '女', '数学与大数据', '数学与应用数学', '18数学五班', NULL, NULL);
INSERT INTO `student` VALUES (550, '1805070101531', '翁燕如', '女', '数学与大数据', '数学与应用数学', '18数学五班', NULL, NULL);
INSERT INTO `student` VALUES (551, '1805070101532', '詹丽娜', '女', '数学与大数据', '数学与应用数学', '18数学五班', NULL, NULL);
INSERT INTO `student` VALUES (552, '1805070101533', '郑少娜', '女', '数学与大数据', '数学与应用数学', '18数学五班', NULL, NULL);
INSERT INTO `student` VALUES (553, '1805070101534', '陈晓欢', '女', '数学与大数据', '数学与应用数学', '18数学五班', NULL, NULL);
INSERT INTO `student` VALUES (554, '1805070101535', '郑雅匀', '女', '数学与大数据', '数学与应用数学', '18数学五班', NULL, NULL);
INSERT INTO `student` VALUES (555, '1805070101536', '叶怀玉', '女', '数学与大数据', '数学与应用数学', '18数学五班', NULL, NULL);
INSERT INTO `student` VALUES (556, '1805070101537', '林凤冰', '女', '数学与大数据', '数学与应用数学', '18数学五班', NULL, NULL);
INSERT INTO `student` VALUES (557, '1805070101538', '吴佳萌', '女', '数学与大数据', '数学与应用数学', '18数学五班', NULL, NULL);
INSERT INTO `student` VALUES (558, '1805070101539', '邱琳凤', '女', '数学与大数据', '数学与应用数学', '18数学五班', NULL, NULL);
INSERT INTO `student` VALUES (559, '1807070201211', '陈炜皓', '男', '数学与大数据', '数学与应用数学', '18数学五班', NULL, NULL);
INSERT INTO `student` VALUES (560, '1812070504132', '樊雪芬', '女', '数学与大数据', '数学与应用数学', '18数学五班', NULL, NULL);
INSERT INTO `student` VALUES (561, '1805070101601', '蓝雪玉', '女', '数学与大数据', '数学与应用数学', '18数学六班', NULL, NULL);
INSERT INTO `student` VALUES (562, '1805070101602', '黄焕鑫', '男', '数学与大数据', '数学与应用数学', '18数学六班', NULL, NULL);
INSERT INTO `student` VALUES (563, '1805070101603', '郑梓煜', '男', '数学与大数据', '数学与应用数学', '18数学六班', NULL, NULL);
INSERT INTO `student` VALUES (564, '1805070101604', '李鑫淼', '男', '数学与大数据', '数学与应用数学', '18数学六班', NULL, NULL);
INSERT INTO `student` VALUES (565, '1805070101605', '陈小鹏', '男', '数学与大数据', '数学与应用数学', '18数学六班', NULL, NULL);
INSERT INTO `student` VALUES (566, '1805070101606', '方浩彬', '男', '数学与大数据', '数学与应用数学', '18数学六班', NULL, NULL);
INSERT INTO `student` VALUES (567, '1805070101607', '刘润淇', '男', '数学与大数据', '数学与应用数学', '18数学六班', NULL, NULL);
INSERT INTO `student` VALUES (568, '1805070101608', '陈荣华', '男', '数学与大数据', '数学与应用数学', '18数学六班', NULL, NULL);
INSERT INTO `student` VALUES (569, '1805070101609', '李祥裕', '男', '数学与大数据', '数学与应用数学', '18数学六班', NULL, NULL);
INSERT INTO `student` VALUES (570, '1805070101610', '黄煜', '男', '数学与大数据', '数学与应用数学', '18数学六班', NULL, NULL);
INSERT INTO `student` VALUES (571, '1805070101611', '罗希特', '男', '数学与大数据', '数学与应用数学', '18数学六班', NULL, NULL);
INSERT INTO `student` VALUES (572, '1805070101612', '黄淼娜', '女', '数学与大数据', '数学与应用数学', '18数学六班', NULL, NULL);
INSERT INTO `student` VALUES (573, '1805070101613', '陈佳烁', '女', '数学与大数据', '数学与应用数学', '18数学六班', NULL, NULL);
INSERT INTO `student` VALUES (574, '1805070101614', '吴怡静', '女', '数学与大数据', '数学与应用数学', '18数学六班', NULL, NULL);
INSERT INTO `student` VALUES (575, '1805070101615', '贺健媛', '女', '数学与大数据', '数学与应用数学', '18数学六班', NULL, NULL);
INSERT INTO `student` VALUES (576, '1805070101616', '余欢', '女', '数学与大数据', '数学与应用数学', '18数学六班', NULL, NULL);
INSERT INTO `student` VALUES (577, '1805070101617', '余宣佳', '女', '数学与大数据', '数学与应用数学', '18数学六班', NULL, NULL);
INSERT INTO `student` VALUES (578, '1805070101618', '黄燕', '女', '数学与大数据', '数学与应用数学', '18数学六班', NULL, NULL);
INSERT INTO `student` VALUES (579, '1805070101619', '吴碧慧', '女', '数学与大数据', '数学与应用数学', '18数学六班', NULL, NULL);
INSERT INTO `student` VALUES (580, '1805070101620', '张莹', '女', '数学与大数据', '数学与应用数学', '18数学六班', NULL, NULL);
INSERT INTO `student` VALUES (581, '1805070101621', '严智珊', '女', '数学与大数据', '数学与应用数学', '18数学六班', NULL, NULL);
INSERT INTO `student` VALUES (582, '1805070101622', '彭吉燕', '女', '数学与大数据', '数学与应用数学', '18数学六班', NULL, NULL);
INSERT INTO `student` VALUES (583, '1805070101623', '肖雅欣', '女', '数学与大数据', '数学与应用数学', '18数学六班', NULL, NULL);
INSERT INTO `student` VALUES (584, '1805070101624', '梁建凤', '女', '数学与大数据', '数学与应用数学', '18数学六班', NULL, NULL);
INSERT INTO `student` VALUES (585, '1805070101625', '洪雨维', '女', '数学与大数据', '数学与应用数学', '18数学六班', NULL, NULL);
INSERT INTO `student` VALUES (586, '1805070101626', '许家丽', '女', '数学与大数据', '数学与应用数学', '18数学六班', NULL, NULL);
INSERT INTO `student` VALUES (587, '1805070101627', '李彩霞', '女', '数学与大数据', '数学与应用数学', '18数学六班', NULL, NULL);
INSERT INTO `student` VALUES (588, '1805070101628', '李诗琪', '女', '数学与大数据', '数学与应用数学', '18数学六班', NULL, NULL);
INSERT INTO `student` VALUES (589, '1805070101629', '黄春燕', '女', '数学与大数据', '数学与应用数学', '18数学六班', NULL, NULL);
INSERT INTO `student` VALUES (590, '1805070101630', '杨梅宇', '女', '数学与大数据', '数学与应用数学', '18数学六班', NULL, NULL);
INSERT INTO `student` VALUES (591, '1805070101631', '庄滢', '女', '数学与大数据', '数学与应用数学', '18数学六班', NULL, NULL);
INSERT INTO `student` VALUES (592, '1805070101632', '曾雅惠', '女', '数学与大数据', '数学与应用数学', '18数学六班', NULL, NULL);
INSERT INTO `student` VALUES (593, '1805070101633', '朱敏', '女', '数学与大数据', '数学与应用数学', '18数学六班', NULL, NULL);
INSERT INTO `student` VALUES (594, '1805070101634', '黄家璇', '女', '数学与大数据', '数学与应用数学', '18数学六班', NULL, NULL);
INSERT INTO `student` VALUES (595, '1805070101635', '易紫莹', '女', '数学与大数据', '数学与应用数学', '18数学六班', NULL, NULL);
INSERT INTO `student` VALUES (596, '1805070101636', '黄宇佳', '女', '数学与大数据', '数学与应用数学', '18数学六班', NULL, NULL);
INSERT INTO `student` VALUES (597, '1805070101637', '廖漫琪', '女', '数学与大数据', '数学与应用数学', '18数学六班', NULL, NULL);
INSERT INTO `student` VALUES (598, '1805070101638', '陈海婷', '女', '数学与大数据', '数学与应用数学', '18数学六班', NULL, NULL);
INSERT INTO `student` VALUES (599, '1809081602218', '温舒婷', '女', '数学与大数据', '数学与应用数学', '18数学六班', NULL, NULL);
INSERT INTO `student` VALUES (600, '1809081602223', '蔡钰玲', '女', '数学与大数据', '数学与应用数学', '18数学六班', NULL, NULL);
INSERT INTO `student` VALUES (601, '1813071002206', '魏春庭', '女', '数学与大数据', '数学与应用数学', '18数学六班', NULL, NULL);
INSERT INTO `student` VALUES (602, '1805120102101', '陈畅', '男', '数学与大数据', '信息管理与信息系统', '18信管一班', NULL, NULL);
INSERT INTO `student` VALUES (603, '1805120102102', '黄志辉', '男', '数学与大数据', '信息管理与信息系统', '18信管一班', NULL, NULL);
INSERT INTO `student` VALUES (604, '1805120102103', '陈国景', '男', '数学与大数据', '信息管理与信息系统', '18信管一班', NULL, NULL);
INSERT INTO `student` VALUES (605, '1805120102104', '骆文福', '男', '数学与大数据', '信息管理与信息系统', '18信管一班', NULL, NULL);
INSERT INTO `student` VALUES (606, '1805120102105', '彭向明', '男', '数学与大数据', '信息管理与信息系统', '18信管一班', NULL, NULL);
INSERT INTO `student` VALUES (607, '1805120102106', '蔡校育', '男', '数学与大数据', '信息管理与信息系统', '18信管一班', NULL, NULL);
INSERT INTO `student` VALUES (608, '1805120102107', '李招彬', '男', '数学与大数据', '信息管理与信息系统', '18信管一班', NULL, NULL);
INSERT INTO `student` VALUES (609, '1805120102108', '温龙生', '男', '数学与大数据', '信息管理与信息系统', '18信管一班', NULL, NULL);
INSERT INTO `student` VALUES (610, '1805120102109', '赵其柏', '男', '数学与大数据', '信息管理与信息系统', '18信管一班', NULL, NULL);
INSERT INTO `student` VALUES (611, '1805120102110', '廖明铸', '男', '数学与大数据', '信息管理与信息系统', '18信管一班', NULL, NULL);
INSERT INTO `student` VALUES (612, '1805120102111', '连晓熙', '男', '数学与大数据', '信息管理与信息系统', '18信管一班', NULL, NULL);
INSERT INTO `student` VALUES (613, '1805120102112', '许沐鑫', '男', '数学与大数据', '信息管理与信息系统', '18信管一班', NULL, NULL);
INSERT INTO `student` VALUES (614, '1805120102113', '郭骁锐', '男', '数学与大数据', '信息管理与信息系统', '18信管一班', NULL, NULL);
INSERT INTO `student` VALUES (615, '1805120102114', '龚学甫', '男', '数学与大数据', '信息管理与信息系统', '18信管一班', NULL, NULL);
INSERT INTO `student` VALUES (616, '1805120102115', '陈斯林', '男', '数学与大数据', '信息管理与信息系统', '18信管一班', NULL, NULL);
INSERT INTO `student` VALUES (617, '1805120102116', '翁植洲', '男', '数学与大数据', '信息管理与信息系统', '18信管一班', NULL, NULL);
INSERT INTO `student` VALUES (618, '1805120102117', '丁晓欢', '女', '数学与大数据', '信息管理与信息系统', '18信管一班', NULL, NULL);
INSERT INTO `student` VALUES (619, '1805120102118', '胡铭诗', '女', '数学与大数据', '信息管理与信息系统', '18信管一班', NULL, NULL);
INSERT INTO `student` VALUES (620, '1805120102119', '徐媚', '女', '数学与大数据', '信息管理与信息系统', '18信管一班', NULL, NULL);
INSERT INTO `student` VALUES (621, '1805120102120', '乐翠', '女', '数学与大数据', '信息管理与信息系统', '18信管一班', NULL, NULL);
INSERT INTO `student` VALUES (622, '1805120102121', '林冰莹', '女', '数学与大数据', '信息管理与信息系统', '18信管一班', NULL, NULL);
INSERT INTO `student` VALUES (623, '1805120102122', '黄楚君', '女', '数学与大数据', '信息管理与信息系统', '18信管一班', NULL, NULL);
INSERT INTO `student` VALUES (624, '1805120102123', '程少芬', '女', '数学与大数据', '信息管理与信息系统', '18信管一班', NULL, NULL);
INSERT INTO `student` VALUES (625, '1805120102124', '郑颖欣', '女', '数学与大数据', '信息管理与信息系统', '18信管一班', NULL, NULL);
INSERT INTO `student` VALUES (626, '1805120102125', '余丽娟', '女', '数学与大数据', '信息管理与信息系统', '18信管一班', NULL, NULL);
INSERT INTO `student` VALUES (627, '1805120102127', '陈淑慧', '女', '数学与大数据', '信息管理与信息系统', '18信管一班', NULL, NULL);
INSERT INTO `student` VALUES (628, '1805120102128', '梁凤琳', '女', '数学与大数据', '信息管理与信息系统', '18信管一班', NULL, NULL);
INSERT INTO `student` VALUES (629, '1805120102129', '夏文秀', '女', '数学与大数据', '信息管理与信息系统', '18信管一班', NULL, NULL);
INSERT INTO `student` VALUES (630, '1805120102130', '黎慧棋', '女', '数学与大数据', '信息管理与信息系统', '18信管一班', NULL, NULL);
INSERT INTO `student` VALUES (631, '1805120102131', '翁淳', '女', '数学与大数据', '信息管理与信息系统', '18信管一班', NULL, NULL);
INSERT INTO `student` VALUES (632, '1805120102132', '杨丽', '女', '数学与大数据', '信息管理与信息系统', '18信管一班', NULL, NULL);
INSERT INTO `student` VALUES (633, '1805120102133', '申新敏', '女', '数学与大数据', '信息管理与信息系统', '18信管一班', NULL, NULL);
INSERT INTO `student` VALUES (634, '1805120102134', '吴秋菊', '女', '数学与大数据', '信息管理与信息系统', '18信管一班', NULL, NULL);
INSERT INTO `student` VALUES (635, '1805120102135', '刁明钰', '女', '数学与大数据', '信息管理与信息系统', '18信管一班', NULL, NULL);
INSERT INTO `student` VALUES (636, '1805120102136', '林楚云', '女', '数学与大数据', '信息管理与信息系统', '18信管一班', NULL, NULL);
INSERT INTO `student` VALUES (637, '1805120102137', '王雪鸿', '女', '数学与大数据', '信息管理与信息系统', '18信管一班', NULL, NULL);
INSERT INTO `student` VALUES (638, '1813071002213', '罗凯', '男', '数学与大数据', '信息管理与信息系统', '18信管一班', NULL, NULL);
INSERT INTO `student` VALUES (639, '1805071202101', '黄明耀', '男', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (640, '1805071202102', '张镕佳', '男', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (641, '1805071202103', '吴炜', '男', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (642, '1805071202104', '黄世雄', '男', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (643, '1805071202105', '钟裕权', '男', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (644, '1805071202106', '刘杨汗', '男', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (645, '1805071202107', '吴奕江', '男', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (646, '1805071202108', '陈镇豪', '男', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (647, '1805071202109', '黄伟东', '男', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (648, '1805071202110', '陈春麟', '男', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (649, '1805071202111', '曾英杰', '男', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (650, '1805071202112', '马浩锐', '男', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (651, '1805071202113', '杨志辉', '男', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (652, '1805071202114', '赖少明', '男', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (653, '1805071202115', '叶鑫', '男', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (654, '1805071202116', '钟惠杰', '男', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (655, '1805071202117', '朱键键', '男', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (656, '1805071202118', '黄泽佳', '男', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (657, '1805071202119', '廖婉琪', '女', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (658, '1805071202120', '肖曼娜', '女', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (659, '1805071202121', '马少婷', '女', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (660, '1805071202122', '李晓洁', '女', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (661, '1805071202123', '温晓洁', '女', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (662, '1805071202124', '廖逸铭', '女', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (663, '1805071202125', '陈燕玲', '女', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (664, '1805071202126', '吴佳琳', '女', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (665, '1805071202127', '王帅', '女', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (666, '1805071202128', '阮悦', '女', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (667, '1805071202129', '冯司婷', '女', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (668, '1805071202130', '林熙宁', '女', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (669, '1805071202131', '李婉婷', '女', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (670, '1805071202132', '黄泳仪', '女', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (671, '1805071202133', '林清燕', '女', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (672, '1805071202134', '吴欣', '女', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (673, '1805071202135', '刘心怡', '女', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (674, '1805071202136', '范佳佳', '女', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (675, '1805071202137', '陈林怡', '女', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (676, '1805071202138', '谢晓彤', '女', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (677, '1805071202139', '庄思宜', '女', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (678, '1805071202140', '郑佳敏', '女', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (679, '1805071202141', '许盈', '女', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (680, '1805071202142', '卢晓欣', '女', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (681, '1805071202143', '罗晶茹', '女', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (682, '1805071202144', '沙洁雨', '女', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (683, '1805071202145', '林锐虹', '女', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (684, '1805071202147', '彭彩红', '女', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (685, '1805071202148', '李丹丽', '女', '数学与大数据', '应用统计学', '18应统一班', NULL, NULL);
INSERT INTO `student` VALUES (686, '1805071202201', '郑林烽', '男', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (687, '1805071202202', '蔡艺霖', '男', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (688, '1805071202203', '郭耿彬', '男', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (689, '1805071202204', '邢炜壮', '男', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (690, '1805071202205', '许桂泳', '男', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (691, '1805071202206', '陈泽林', '男', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (692, '1805071202207', '余佳鹏', '男', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (693, '1805071202208', '林映江', '男', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (694, '1805071202209', '殷添朗', '男', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (695, '1805071202210', '叶嘉龙', '男', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (696, '1805071202211', '黄兵', '男', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (697, '1805071202212', '蓝宇康', '男', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (698, '1805071202213', '杨瑞涛', '男', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (699, '1805071202214', '吴志浩', '男', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (700, '1805071202215', '吴鹏飞', '男', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (701, '1805071202216', '郭子羿', '男', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (702, '1805071202217', '韦锐湃', '男', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (703, '1805071202218', '卢浩楠', '男', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (704, '1805071202219', '李宏森', '男', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (705, '1805071202220', '周洁', '男', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (706, '1805071202221', '方琳仪', '女', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (707, '1805071202222', '郑媛', '女', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (708, '1805071202223', '周可', '女', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (709, '1805071202224', '何婕', '女', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (710, '1805071202225', '曾鸿珊', '女', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (711, '1805071202226', '郑冬露', '女', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (712, '1805071202227', '梁菁云', '女', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (713, '1805071202228', '马依妮', '女', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (714, '1805071202229', '余佩妍', '女', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (715, '1805071202230', '吴佳婷', '女', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (716, '1805071202231', '陈颖莹', '女', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (717, '1805071202232', '林晓琳', '女', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (718, '1805071202233', '吕阳', '女', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (719, '1805071202234', '肖碧洋', '女', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (720, '1805071202235', '黄敏', '女', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (721, '1805071202236', '郑洁虹', '女', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (722, '1805071202237', '翁昂玲', '女', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (723, '1805071202238', '刘文琳', '女', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (724, '1805071202239', '王晓恋', '女', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (725, '1805071202240', '杨紫薇', '女', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (726, '1805071202241', '余格慧', '女', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (727, '1805071202242', '巫鑫凤', '女', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (728, '1805071202243', '汤凡智', '女', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (729, '1805071202244', '姚晓艺', '女', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (730, '1805071202245', '卓燕婵', '女', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (731, '1805071202246', '陈楚如', '女', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (732, '1805071202247', '许雨婷', '女', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (733, '1805071202248', '罗殷婷', '女', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (734, '1805071202249', '唐燕玲', '女', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (735, '1805071202250', '杨慧', '女', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (736, '1806081301105', '李谦', '男', '数学与大数据', '应用统计学', '18应统二班', NULL, NULL);
INSERT INTO `student` VALUES (737, '1905070101101', '陈伟军', '男', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (738, '1905070101102', '傅文龙', '男', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (739, '1905070101103', '贺伟煌', '男', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (740, '1905070101104', '黄豪', '男', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (741, '1905070101105', '黄嘉楠', '男', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (742, '1905070101106', '黄家杰', '男', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (743, '1905070101107', '李存真', '男', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (744, '1905070101108', '李志超', '男', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (745, '1905070101109', '林振兴', '男', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (746, '1905070101110', '卢珂', '男', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (747, '1905070101111', '石明炽', '男', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (748, '1905070101112', '吴嘉荣', '男', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (749, '1905070101113', '徐键朋', '男', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (750, '1905070101114', '张士威', '男', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (751, '1905070101115', '钟梓浩', '男', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (752, '1905070101116', '蔡丽环', '女', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (753, '1905070101117', '蔡心怡', '女', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (754, '1905070101118', '陈晨烨', '女', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (755, '1905070101119', '陈德容', '女', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (756, '1905070101120', '陈慧玲', '女', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (757, '1905070101121', '陈静妙', '女', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (758, '1905070101122', '古泽珍', '女', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (759, '1905070101123', '郭晓敏', '女', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (760, '1905070101124', '胡嘉忆', '女', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (761, '1905070101125', '黄慧雯', '女', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (762, '1905070101126', '赖敏含', '女', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (763, '1905070101127', '李静雯', '女', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (764, '1905070101128', '李庆彤', '女', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (765, '1905070101129', '李楹滢', '女', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (766, '1905070101130', '廖茹', '女', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (767, '1905070101131', '林彩云', '女', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (768, '1905070101132', '林丹盈', '女', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (769, '1905070101133', '林诗涵', '女', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (770, '1905070101135', '罗杨颖', '女', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (771, '1905070101136', '罗玉满', '女', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (772, '1905070101137', '马彩滴', '女', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (773, '1905070101139', '申慧', '女', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (774, '1905070101140', '谢雪红', '女', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (775, '1905070101141', '姚紫馨', '女', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (776, '1905070101142', '叶春红', '女', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (777, '1905070101143', '郑依琳', '女', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (778, '1905070101144', '钟晓渟', '女', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (779, '1912070501331', '吴静霞', '女', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (780, '1913071001125', '林琦瑶', '女', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (781, '1913071001137', '张家榕', '女', '数学与大数据', '数学与应用数学', '19数学一班', NULL, NULL);
INSERT INTO `student` VALUES (782, '1905070101201', '蔡泽锐', '男', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (783, '1905070101202', '陈柏圳', '男', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (784, '1905070101203', '胡永增', '男', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (785, '1905070101204', '胡勇灿', '男', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (786, '1905070101205', '黄基源', '男', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (787, '1905070101206', '黄健业', '男', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (788, '1905070101207', '黄泽聪', '男', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (789, '1905070101208', '江一峰', '男', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (790, '1905070101209', '廖崇远', '男', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (791, '1905070101210', '刘洪涛', '男', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (792, '1905070101211', '彭永辉', '男', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (793, '1905070101212', '谢晓涛', '男', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (794, '1905070101213', '许润楷', '男', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (795, '1905070101214', '张德顺', '男', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (796, '1905070101215', '张子毅', '男', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (797, '1905070101216', '蔡锐冰', '女', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (798, '1905070101217', '陈才金', '女', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (799, '1905070101218', '陈佳利', '女', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (800, '1905070101219', '陈漫', '女', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (801, '1905070101220', '陈侠婷', '女', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (802, '1905070101221', '戴雨涵', '女', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (803, '1905070101222', '李海玉', '女', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (804, '1905070101223', '李皓欣', '女', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (805, '1905070101224', '廖彩霞', '女', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (806, '1905070101225', '罗晓榆', '女', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (807, '1905070101226', '王纯', '女', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (808, '1905070101227', '巫红艳', '女', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (809, '1905070101228', '吴金燕', '女', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (810, '1905070101229', '邢慧婉', '女', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (811, '1905070101230', '杨敏', '女', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (812, '1905070101231', '杨倩', '女', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (813, '1905070101232', '叶伟美', '女', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (814, '1905070101233', '殷丽珠', '女', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (815, '1905070101234', '曾妃连', '女', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (816, '1905070101235', '张海燕', '女', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (817, '1905070101236', '张静', '女', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (818, '1905070101237', '张丽容', '女', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (819, '1905070101238', '张泽玲', '女', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (820, '1905070101239', '郑晓玲', '女', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (821, '1905070101241', '朱嘉琪', '女', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (822, '1905070101242', '朱玉友', '女', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (823, '1905070101243', '朱婧', '女', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (824, '1905070101244', '庄佳璇', '女', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (825, '1905070101245', '邹凯莹', '女', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (826, '1905071202126', '王志园', '女', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (827, '1905120102125', '冯佳欣', '女', '数学与大数据', '数学与应用数学', '19数学二班', NULL, NULL);
INSERT INTO `student` VALUES (828, '1904020401232', '杨凯旋', '女', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (829, '1905070101301', '蔡垚鸿', '男', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (830, '1905070101302', '戴云祺', '男', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (831, '1905070101303', '黄能', '男', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (832, '1905070101304', '江庆豪', '男', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (833, '1905070101305', '林晓宇', '男', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (834, '1905070101306', '罗富营', '男', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (835, '1905070101307', '潘文斌', '男', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (836, '1905070101308', '万仕龙', '男', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (837, '1905070101309', '王伟俊', '男', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (838, '1905070101310', '王炜嘉', '男', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (839, '1905070101311', '徐志平', '男', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (840, '1905070101312', '叶鹏宇', '男', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (841, '1905070101313', '曾凯明', '男', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (842, '1905070101314', '张伟淇', '男', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (843, '1905070101315', '钟伟平', '男', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (844, '1905070101316', '邹君祥', '男', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (845, '1905070101317', '蔡婉仪', '女', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (846, '1905070101318', '陈佳淳', '女', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (847, '1905070101319', '陈咏珊', '女', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (848, '1905070101320', '高熙', '女', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (849, '1905070101321', '郭悦纯', '女', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (850, '1905070101322', '何雪丹', '女', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (851, '1905070101323', '黄慧莉', '女', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (852, '1905070101324', '赖婉琪', '女', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (853, '1905070101325', '李彩媚', '女', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (854, '1905070101326', '李彦瑾', '女', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (855, '1905070101327', '林诗碧', '女', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (856, '1905070101328', '林晓静', '女', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (857, '1905070101329', '林于挺', '女', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (858, '1905070101330', '林淼婷', '女', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (859, '1905070101331', '罗巧嫣', '女', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (860, '1905070101332', '马意婷', '女', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (861, '1905070101333', '倪璇', '女', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (862, '1905070101334', '潘华丽', '女', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (863, '1905070101335', '彭伊岚', '女', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (864, '1905070101336', '王敏芳', '女', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (865, '1905070101337', '魏悦兰', '女', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (866, '1905070101338', '吴欣欣', '女', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (867, '1905070101339', '肖灵芝', '女', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (868, '1905070101340', '谢彤', '女', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (869, '1905070101341', '许勤琦', '女', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (870, '1905070101342', '曾娟', '女', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (871, '1905070101343', '张静璇', '女', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (872, '1905070101345', '周楷茵', '女', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (873, '1906070301230', '杨雅虹', '女', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (874, '1907080701233', '邓秀瑜', '女', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (875, '1909081602217', '廖曼玲', '女', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (876, '1913071001425', '林清怡', '女', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (877, '1913082803125', '彭玉连', '女', '数学与大数据', '数学与应用数学', '19数学三班', NULL, NULL);
INSERT INTO `student` VALUES (878, '1905070101401', '戴庆雄', '男', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (879, '1905070101402', '杜风', '男', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (880, '1905070101403', '黄河', '男', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (881, '1905070101404', '梁俊杰', '男', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (882, '1905070101405', '梁希程', '男', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (883, '1905070101406', '刘炜', '男', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (884, '1905070101407', '彭奇超', '男', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (885, '1905070101408', '温家锐', '男', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (886, '1905070101409', '张行健', '男', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (887, '1905070101410', '张自星', '男', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (888, '1905070101411', '钟广为', '男', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (889, '1905070101412', '钟文龙', '男', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (890, '1905070101413', '朱炎泉', '男', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (891, '1905070101414', '陈婉娜', '女', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (892, '1905070101415', '陈依彤', '女', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (893, '1905070101416', '邓靖瑜', '女', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (894, '1905070101417', '范映芳', '女', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (895, '1905070101418', '韩蔚璇', '女', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (896, '1905070101419', '黄秋谊', '女', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (897, '1905070101420', '黄绮淼', '女', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (898, '1905070101421', '李彩童', '女', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (899, '1905070101422', '李嘉', '女', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (900, '1905070101423', '李鑫颖', '女', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (901, '1905070101424', '梁晨', '女', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (902, '1905070101425', '林晓艺', '女', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (903, '1905070101426', '刘嘉怡', '女', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (904, '1905070101427', '卢衍瑾', '女', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (905, '1905070101428', '罗思婷', '女', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (906, '1905070101429', '马嘉璇', '女', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (907, '1905070101430', '彭莹莹', '女', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (908, '1905070101431', '时婧', '女', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (909, '1905070101432', '王凯纯', '女', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (910, '1905070101433', '王莎', '女', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (911, '1905070101434', '吴嘉昕', '女', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (912, '1905070101435', '吴淑怡', '女', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (913, '1905070101436', '谢晨芳', '女', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (914, '1905070101437', '叶欢旺', '女', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (915, '1905070101438', '余炀', '女', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (916, '1905070101439', '袁思涵', '女', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (917, '1905070101440', '张文玲', '女', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (918, '1905070101441', '张婷', '女', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (919, '1905070101442', '庄柳娟', '女', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (920, '1909081602433', '钟思婷', '女', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (921, '1909081602434', '钟嫦青', '女', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (922, '1913071002226', '卢婌梅', '女', '数学与大数据', '数学与应用数学', '19数学四班', NULL, NULL);
INSERT INTO `student` VALUES (923, '1905070101501', '陈沧浪', '男', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (924, '1905070101502', '陈泽宣', '男', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (925, '1905070101503', '邓苁杉', '男', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (926, '1905070101504', '龚峰', '男', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (927, '1905070101505', '黄超林', '男', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (928, '1905070101506', '黎锦总', '男', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (929, '1905070101507', '李世海', '男', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (930, '1905070101508', '廖启铭', '男', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (931, '1905070101509', '廖锐', '男', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (932, '1905070101510', '马扬清', '男', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (933, '1905070101511', '杨东祥', '男', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (934, '1905070101512', '曾国良', '男', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (935, '1905070101513', '张叶俊', '男', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (936, '1905070101514', '张振宇', '男', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (937, '1905070101515', '朱伟均', '男', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (938, '1905070101516', '陈丹霞', '女', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (939, '1905070101517', '陈泳丽', '女', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (940, '1905070101518', '何雪群', '女', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (941, '1905070101519', '胡文燕', '女', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (942, '1905070101520', '黄俊吟', '女', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (943, '1905070101521', '黄欣', '女', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (944, '1905070101523', '黄楠', '女', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (945, '1905070101524', '李少欣', '女', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (946, '1905070101525', '梁佳倩', '女', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (947, '1905070101526', '林静微', '女', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (948, '1905070101527', '林丽霞', '女', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (949, '1905070101528', '林奕绵', '女', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (950, '1905070101529', '刘丹宇', '女', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (951, '1905070101530', '刘心雨', '女', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (952, '1905070101531', '罗翠洁', '女', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (953, '1905070101532', '罗少敏', '女', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (954, '1905070101533', '邱芷婷', '女', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (955, '1905070101534', '温倚潼', '女', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (956, '1905070101535', '吴瑞媛', '女', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (957, '1905070101536', '叶俊婷', '女', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (958, '1905070101537', '叶子', '女', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (959, '1905070101538', '曾茜', '女', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (960, '1905070101539', '郑纯娟', '女', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (961, '1905070101540', '郑彤瑶', '女', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (962, '1905070101541', '植美玲', '女', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (963, '1905070101542', '钟林曼', '女', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (964, '1905070101543', '钟淼', '女', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (965, '1905070101544', '周艺', '女', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (966, '1913071001428', '邱莉伶', '女', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (967, '1913090502124', '江媚媚', '女', '数学与大数据', '数学与应用数学', '19数学五班', NULL, NULL);
INSERT INTO `student` VALUES (968, '1905070101601', '陈灿勇', '男', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (969, '1905070101602', '陈华杰', '男', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (970, '1905070101603', '陈梓浩', '男', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (971, '1905070101604', '高嘉俊', '男', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (972, '1905070101605', '林家希', '男', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (973, '1905070101606', '罗焕东', '男', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (974, '1905070101607', '莫浩明', '男', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (975, '1905070101608', '韦国森', '男', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (976, '1905070101609', '吴斌', '男', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (977, '1905070101610', '吴汪洋', '男', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (978, '1905070101612', '余均辉', '男', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (979, '1905070101613', '张宝锋', '男', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (980, '1905070101614', '张志通', '男', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (981, '1905070101615', '张鑫', '男', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (982, '1905070101616', '柏婷霞', '女', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (983, '1905070101617', '毕晞彤', '女', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (984, '1905070101618', '蔡心怡', '女', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (985, '1905070101619', '陈美茹', '女', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (986, '1905070101620', '陈智慧', '女', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (987, '1905070101621', '黄轶婧', '女', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (988, '1905070101622', '江伟英', '女', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (989, '1905070101623', '李华芳', '女', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (990, '1905070101624', '李嘉怡', '女', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (991, '1905070101625', '林婉霓', '女', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (992, '1905070101626', '刘碧琴', '女', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (993, '1905070101627', '刘惠怡', '女', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (994, '1905070101628', '刘燕缘', '女', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (995, '1905070101629', '陆君萍', '女', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (996, '1905070101630', '骆静雯', '女', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (997, '1905070101631', '沈运霞', '女', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (998, '1905070101632', '苏燕薇', '女', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (999, '1905070101633', '温婉霞', '女', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (1000, '1905070101634', '文方', '女', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (1001, '1905070101635', '翁彩琳', '女', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (1002, '1905070101636', '肖文慧', '女', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (1003, '1905070101637', '叶天惠', '女', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (1004, '1905070101638', '叶湘怡', '女', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (1005, '1905070101639', '叶艺', '女', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (1006, '1905070101640', '殷雪蕾', '女', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (1007, '1905070101641', '余琳慧', '女', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (1008, '1905070101642', '曾希婷', '女', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (1009, '1905070101643', '张淼娜', '女', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (1010, '1905070101644', '钟夏', '女', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (1011, '1905070101645', '祝金平', '女', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (1012, '1907070201212', '温德滨', '男', '数学与大数据', '数学与应用数学', '19数学六班', NULL, NULL);
INSERT INTO `student` VALUES (1013, '1813071002203', '周庭澳', '男', '数学与大数据', '信息管理与信息系统', '19信管一班', NULL, NULL);
INSERT INTO `student` VALUES (1014, '1905120102101', '陈焕镜', '男', '数学与大数据', '信息管理与信息系统', '19信管一班', NULL, NULL);
INSERT INTO `student` VALUES (1015, '1905120102102', '陈腾', '男', '数学与大数据', '信息管理与信息系统', '19信管一班', NULL, NULL);
INSERT INTO `student` VALUES (1016, '1905120102103', '丁振庭', '男', '数学与大数据', '信息管理与信息系统', '19信管一班', NULL, NULL);
INSERT INTO `student` VALUES (1017, '1905120102104', '黄腾洲', '男', '数学与大数据', '信息管理与信息系统', '19信管一班', NULL, NULL);
INSERT INTO `student` VALUES (1018, '1905120102105', '黄炜煜', '男', '数学与大数据', '信息管理与信息系统', '19信管一班', NULL, NULL);
INSERT INTO `student` VALUES (1019, '1905120102106', '纪泽煌', '男', '数学与大数据', '信息管理与信息系统', '19信管一班', NULL, NULL);
INSERT INTO `student` VALUES (1020, '1905120102107', '江佳俊', '男', '数学与大数据', '信息管理与信息系统', '19信管一班', NULL, NULL);
INSERT INTO `student` VALUES (1021, '1905120102108', '劳基广', '男', '数学与大数据', '信息管理与信息系统', '19信管一班', NULL, NULL);
INSERT INTO `student` VALUES (1022, '1905120102109', '林涣添', '男', '数学与大数据', '信息管理与信息系统', '19信管一班', NULL, NULL);
INSERT INTO `student` VALUES (1023, '1905120102110', '潘泽贤', '男', '数学与大数据', '信息管理与信息系统', '19信管一班', NULL, NULL);
INSERT INTO `student` VALUES (1024, '1905120102111', '宋汝鹏', '男', '数学与大数据', '信息管理与信息系统', '19信管一班', NULL, NULL);
INSERT INTO `student` VALUES (1025, '1905120102112', '孙位', '男', '数学与大数据', '信息管理与信息系统', '19信管一班', NULL, NULL);
INSERT INTO `student` VALUES (1026, '1905120102113', '王泽宇', '男', '数学与大数据', '信息管理与信息系统', '19信管一班', NULL, NULL);
INSERT INTO `student` VALUES (1027, '1905120102114', '魏嘉涛', '男', '数学与大数据', '信息管理与信息系统', '19信管一班', NULL, NULL);
INSERT INTO `student` VALUES (1028, '1905120102115', '吴炎杰', '男', '数学与大数据', '信息管理与信息系统', '19信管一班', NULL, NULL);
INSERT INTO `student` VALUES (1029, '1905120102116', '吴炜槟', '男', '数学与大数据', '信息管理与信息系统', '19信管一班', NULL, NULL);
INSERT INTO `student` VALUES (1030, '1905120102117', '许焕忠', '男', '数学与大数据', '信息管理与信息系统', '19信管一班', NULL, NULL);
INSERT INTO `student` VALUES (1031, '1905120102118', '周宇帆', '男', '数学与大数据', '信息管理与信息系统', '19信管一班', NULL, NULL);
INSERT INTO `student` VALUES (1032, '1905120102119', '朱翥', '男', '数学与大数据', '信息管理与信息系统', '19信管一班', NULL, NULL);
INSERT INTO `student` VALUES (1033, '1905120102120', '陈一冰', '女', '数学与大数据', '信息管理与信息系统', '19信管一班', NULL, NULL);
INSERT INTO `student` VALUES (1034, '1905120102121', '陈银凤', '女', '数学与大数据', '信息管理与信息系统', '19信管一班', NULL, NULL);
INSERT INTO `student` VALUES (1035, '1905120102122', '陈泽冰', '女', '数学与大数据', '信息管理与信息系统', '19信管一班', NULL, NULL);
INSERT INTO `student` VALUES (1036, '1905120102123', '陈哲妍', '女', '数学与大数据', '信息管理与信息系统', '19信管一班', NULL, NULL);
INSERT INTO `student` VALUES (1037, '1905120102124', '方南婷', '女', '数学与大数据', '信息管理与信息系统', '19信管一班', NULL, NULL);
INSERT INTO `student` VALUES (1038, '1905120102126', '傅斯琦', '女', '数学与大数据', '信息管理与信息系统', '19信管一班', NULL, NULL);
INSERT INTO `student` VALUES (1039, '1905120102127', '郭敏欣', '女', '数学与大数据', '信息管理与信息系统', '19信管一班', NULL, NULL);
INSERT INTO `student` VALUES (1040, '1905120102128', '郭炫', '女', '数学与大数据', '信息管理与信息系统', '19信管一班', NULL, NULL);
INSERT INTO `student` VALUES (1041, '1905120102129', '何叶', '女', '数学与大数据', '信息管理与信息系统', '19信管一班', NULL, NULL);
INSERT INTO `student` VALUES (1042, '1905120102130', '林婉佳', '女', '数学与大数据', '信息管理与信息系统', '19信管一班', NULL, NULL);
INSERT INTO `student` VALUES (1043, '1905120102131', '林文婷', '女', '数学与大数据', '信息管理与信息系统', '19信管一班', NULL, NULL);
INSERT INTO `student` VALUES (1044, '1905120102132', '马慧仪', '女', '数学与大数据', '信息管理与信息系统', '19信管一班', NULL, NULL);
INSERT INTO `student` VALUES (1045, '1905120102134', '吴敏敏', '女', '数学与大数据', '信息管理与信息系统', '19信管一班', NULL, NULL);
INSERT INTO `student` VALUES (1046, '1905120102135', '熊雯靖', '女', '数学与大数据', '信息管理与信息系统', '19信管一班', NULL, NULL);
INSERT INTO `student` VALUES (1047, '1905120102136', '徐漫', '女', '数学与大数据', '信息管理与信息系统', '19信管一班', NULL, NULL);
INSERT INTO `student` VALUES (1048, '1905120102137', '张晓敏', '女', '数学与大数据', '信息管理与信息系统', '19信管一班', NULL, NULL);
INSERT INTO `student` VALUES (1049, '1905120102138', '张芷茵', '女', '数学与大数据', '信息管理与信息系统', '19信管一班', NULL, NULL);
INSERT INTO `student` VALUES (1050, '1905120102139', '张琪', '女', '数学与大数据', '信息管理与信息系统', '19信管一班', NULL, NULL);
INSERT INTO `student` VALUES (1051, '1905120102140', '郑树洵', '女', '数学与大数据', '信息管理与信息系统', '19信管一班', NULL, NULL);
INSERT INTO `student` VALUES (1052, '1905071202101', '贺蔚', '男', '数学与大数据', '应用统计学', '19应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1053, '1905071202102', '侯先挺', '男', '数学与大数据', '应用统计学', '19应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1054, '1905071202103', '黄海航', '男', '数学与大数据', '应用统计学', '19应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1055, '1905071202104', '王嘉豪', '男', '数学与大数据', '应用统计学', '19应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1056, '1905071202106', '徐海鹏', '男', '数学与大数据', '应用统计学', '19应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1057, '1905071202107', '赵书毅', '男', '数学与大数据', '应用统计学', '19应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1058, '1905071202108', '邝嘉俊', '男', '数学与大数据', '应用统计学', '19应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1059, '1905071202109', '陈金易', '女', '数学与大数据', '应用统计学', '19应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1060, '1905071202110', '陈静儿', '女', '数学与大数据', '应用统计学', '19应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1061, '1905071202111', '范琳欣', '女', '数学与大数据', '应用统计学', '19应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1062, '1905071202112', '傅彩妮', '女', '数学与大数据', '应用统计学', '19应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1063, '1905071202113', '郭馥琳', '女', '数学与大数据', '应用统计学', '19应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1064, '1905071202114', '赖立宇', '女', '数学与大数据', '应用统计学', '19应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1065, '1905071202115', '李丹妍', '女', '数学与大数据', '应用统计学', '19应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1066, '1905071202116', '李芳华', '女', '数学与大数据', '应用统计学', '19应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1067, '1905071202117', '李海凤', '女', '数学与大数据', '应用统计学', '19应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1068, '1905071202118', '林涵霞', '女', '数学与大数据', '应用统计学', '19应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1069, '1905071202119', '林燕芬', '女', '数学与大数据', '应用统计学', '19应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1070, '1905071202120', '刘嘉倩', '女', '数学与大数据', '应用统计学', '19应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1071, '1905071202121', '莫思婕', '女', '数学与大数据', '应用统计学', '19应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1072, '1905071202122', '潘盈盈', '女', '数学与大数据', '应用统计学', '19应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1073, '1905071202123', '彭思维', '女', '数学与大数据', '应用统计学', '19应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1074, '1905071202124', '丘曼玉', '女', '数学与大数据', '应用统计学', '19应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1075, '1905071202125', '邱小扬', '女', '数学与大数据', '应用统计学', '19应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1076, '1905071202127', '翁纯华', '女', '数学与大数据', '应用统计学', '19应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1077, '1905071202128', '吴丽婷', '女', '数学与大数据', '应用统计学', '19应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1078, '1905071202129', '吴林媛', '女', '数学与大数据', '应用统计学', '19应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1079, '1905071202130', '谢榴佳', '女', '数学与大数据', '应用统计学', '19应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1080, '1905071202131', '谢绮婷', '女', '数学与大数据', '应用统计学', '19应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1081, '1905071202132', '徐伟玲', '女', '数学与大数据', '应用统计学', '19应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1082, '1905071202133', '曾心蕊', '女', '数学与大数据', '应用统计学', '19应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1083, '1905071202134', '曾逸淳', '女', '数学与大数据', '应用统计学', '19应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1084, '1905071202135', '张华纯', '女', '数学与大数据', '应用统计学', '19应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1085, '1905071202136', '张爽', '女', '数学与大数据', '应用统计学', '19应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1086, '1905071202137', '赵丹凤', '女', '数学与大数据', '应用统计学', '19应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1087, '1905071202138', '郑露纯', '女', '数学与大数据', '应用统计学', '19应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1088, '1905071202139', '周悦', '女', '数学与大数据', '应用统计学', '19应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1089, '1905071202140', '朱乔', '女', '数学与大数据', '应用统计学', '19应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1090, '1906070302218', '陈乐萍', '女', '数学与大数据', '应用统计学', '19应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1091, '1906070302220', '段晓静', '女', '数学与大数据', '应用统计学', '19应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1092, '1909081602403', '陈栩霖', '男', '数学与大数据', '应用统计学', '19应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1093, '1909081602423', '刘舒纤', '女', '数学与大数据', '应用统计学', '19应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1094, '1905070101138', '莫艺滢', '女', '数学与大数据', '应用统计学', '19应统二班', NULL, NULL);
INSERT INTO `student` VALUES (1095, '1905071202201', '蔡佑滔', '男', '数学与大数据', '应用统计学', '19应统二班', NULL, NULL);
INSERT INTO `student` VALUES (1096, '1905071202202', '胡润', '男', '数学与大数据', '应用统计学', '19应统二班', NULL, NULL);
INSERT INTO `student` VALUES (1097, '1905071202203', '李程祥', '男', '数学与大数据', '应用统计学', '19应统二班', NULL, NULL);
INSERT INTO `student` VALUES (1098, '1905071202204', '廖廷卫', '男', '数学与大数据', '应用统计学', '19应统二班', NULL, NULL);
INSERT INTO `student` VALUES (1099, '1905071202205', '林耿豪', '男', '数学与大数据', '应用统计学', '19应统二班', NULL, NULL);
INSERT INTO `student` VALUES (1100, '1905071202206', '马梓链', '男', '数学与大数据', '应用统计学', '19应统二班', NULL, NULL);
INSERT INTO `student` VALUES (1101, '1905071202207', '吴泽', '男', '数学与大数据', '应用统计学', '19应统二班', NULL, NULL);
INSERT INTO `student` VALUES (1102, '1905071202208', '陈嘉乐', '女', '数学与大数据', '应用统计学', '19应统二班', NULL, NULL);
INSERT INTO `student` VALUES (1103, '1905071202209', '陈佳琳', '女', '数学与大数据', '应用统计学', '19应统二班', NULL, NULL);
INSERT INTO `student` VALUES (1104, '1905071202210', '邓冬玲', '女', '数学与大数据', '应用统计学', '19应统二班', NULL, NULL);
INSERT INTO `student` VALUES (1105, '1905071202211', '韩雪柔', '女', '数学与大数据', '应用统计学', '19应统二班', NULL, NULL);
INSERT INTO `student` VALUES (1106, '1905071202212', '何曼昵', '女', '数学与大数据', '应用统计学', '19应统二班', NULL, NULL);
INSERT INTO `student` VALUES (1107, '1905071202213', '胡萃婷', '女', '数学与大数据', '应用统计学', '19应统二班', NULL, NULL);
INSERT INTO `student` VALUES (1108, '1905071202214', '黄家杏', '女', '数学与大数据', '应用统计学', '19应统二班', NULL, NULL);
INSERT INTO `student` VALUES (1109, '1905071202215', '黄晓敏', '女', '数学与大数据', '应用统计学', '19应统二班', NULL, NULL);
INSERT INTO `student` VALUES (1110, '1905071202216', '黄怡冰', '女', '数学与大数据', '应用统计学', '19应统二班', NULL, NULL);
INSERT INTO `student` VALUES (1111, '1905071202217', '孔涵', '女', '数学与大数据', '应用统计学', '19应统二班', NULL, NULL);
INSERT INTO `student` VALUES (1112, '1905071202218', '赖怡悦', '女', '数学与大数据', '应用统计学', '19应统二班', NULL, NULL);
INSERT INTO `student` VALUES (1113, '1905071202219', '李诗茵', '女', '数学与大数据', '应用统计学', '19应统二班', NULL, NULL);
INSERT INTO `student` VALUES (1114, '1905071202220', '李玉纯', '女', '数学与大数据', '应用统计学', '19应统二班', NULL, NULL);
INSERT INTO `student` VALUES (1115, '1905071202221', '连晓琦', '女', '数学与大数据', '应用统计学', '19应统二班', NULL, NULL);
INSERT INTO `student` VALUES (1116, '1905071202222', '林嘉琪', '女', '数学与大数据', '应用统计学', '19应统二班', NULL, NULL);
INSERT INTO `student` VALUES (1117, '1905071202223', '林启莹', '女', '数学与大数据', '应用统计学', '19应统二班', NULL, NULL);
INSERT INTO `student` VALUES (1118, '1905071202224', '林瑞坛', '女', '数学与大数据', '应用统计学', '19应统二班', NULL, NULL);
INSERT INTO `student` VALUES (1119, '1905071202225', '林雪霞', '女', '数学与大数据', '应用统计学', '19应统二班', NULL, NULL);
INSERT INTO `student` VALUES (1120, '1905071202226', '林瑶', '女', '数学与大数据', '应用统计学', '19应统二班', NULL, NULL);
INSERT INTO `student` VALUES (1121, '1905071202227', '林珠吟', '女', '数学与大数据', '应用统计学', '19应统二班', NULL, NULL);
INSERT INTO `student` VALUES (1122, '1905071202228', '卢燊禧', '女', '数学与大数据', '应用统计学', '19应统二班', NULL, NULL);
INSERT INTO `student` VALUES (1123, '1905071202229', '罗芳舒', '女', '数学与大数据', '应用统计学', '19应统二班', NULL, NULL);
INSERT INTO `student` VALUES (1124, '1905071202230', '谭心如', '女', '数学与大数据', '应用统计学', '19应统二班', NULL, NULL);
INSERT INTO `student` VALUES (1125, '1905071202231', '吴舒婕', '女', '数学与大数据', '应用统计学', '19应统二班', NULL, NULL);
INSERT INTO `student` VALUES (1126, '1905071202232', '吴妍霏', '女', '数学与大数据', '应用统计学', '19应统二班', NULL, NULL);
INSERT INTO `student` VALUES (1127, '1905071202233', '徐畅', '女', '数学与大数据', '应用统计学', '19应统二班', NULL, NULL);
INSERT INTO `student` VALUES (1128, '1905071202234', '杨小漩', '女', '数学与大数据', '应用统计学', '19应统二班', NULL, NULL);
INSERT INTO `student` VALUES (1129, '1905071202235', '袁霄', '女', '数学与大数据', '应用统计学', '19应统二班', NULL, NULL);
INSERT INTO `student` VALUES (1130, '1905071202236', '詹瑜芝', '女', '数学与大数据', '应用统计学', '19应统二班', NULL, NULL);
INSERT INTO `student` VALUES (1131, '1905071202237', '张良英', '女', '数学与大数据', '应用统计学', '19应统二班', NULL, NULL);
INSERT INTO `student` VALUES (1132, '1905071202238', '张少然', '女', '数学与大数据', '应用统计学', '19应统二班', NULL, NULL);
INSERT INTO `student` VALUES (1133, '1905071202239', '郑映璇', '女', '数学与大数据', '应用统计学', '19应统二班', NULL, NULL);
INSERT INTO `student` VALUES (1134, '1905071202240', '庄悦欣', '女', '数学与大数据', '应用统计学', '19应统二班', NULL, NULL);
INSERT INTO `student` VALUES (1135, '1907080412124', '周浩坚', '男', '数学与大数据', '应用统计学', '19应统二班', NULL, NULL);
INSERT INTO `student` VALUES (1136, '1907080701236', '林莉', '女', '数学与大数据', '应用统计学', '19应统二班', NULL, NULL);
INSERT INTO `student` VALUES (1137, '2005070101101', '黄永振', '男', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1138, '2005070101102', '孔德权', '男', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1139, '2005070101103', '李宇崇', '男', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1140, '2005070101104', '梁梓实', '男', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1141, '2005070101105', '刘锐锋', '男', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1142, '2005070101106', '卢子超', '男', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1143, '2005070101107', '邱毅', '男', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1144, '2005070101108', '谢达成', '男', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1145, '2005070101109', '谢如凡', '男', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1146, '2005070101110', '张炟源', '男', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1147, '2005070101111', '张昊宇', '男', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1148, '2005070101112', '陈丽玲', '女', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1149, '2005070101113', '陈璐', '女', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1150, '2005070101114', '陈秋杏', '女', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1151, '2005070101115', '陈燕玲', '女', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1152, '2005070101116', '邓瑜', '女', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1153, '2005070101117', '葛逸梅', '女', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1154, '2005070101118', '何春琳', '女', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1155, '2005070101119', '胡婉洁', '女', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1156, '2005070101120', '黄楚莹', '女', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1157, '2005070101121', '黄晴雯', '女', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1158, '2005070101122', '蒋美琳', '女', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1159, '2005070101123', '赖小静', '女', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1160, '2005070101124', '李方钰', '女', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1161, '2005070101125', '李嘉欣', '女', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1162, '2005070101126', '林涵', '女', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1163, '2005070101127', '林静雯', '女', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1164, '2005070101128', '林泽梅', '女', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1165, '2005070101129', '刘怡芳', '女', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1166, '2005070101130', '刘玉珍', '女', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1167, '2005070101131', '缪慧', '女', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1168, '2005070101132', '饶予欣', '女', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1169, '2005070101133', '王慧楠', '女', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1170, '2005070101134', '魏婉儿', '女', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1171, '2005070101135', '温灵鑫', '女', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1172, '2005070101136', '吴婉琦', '女', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1173, '2005070101137', '谢敏利', '女', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1174, '2005070101138', '许曼涵', '女', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1175, '2005070101139', '杨舒婷', '女', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1176, '2005070101140', '张晓漩', '女', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1177, '2005070101141', '张幸嘉', '女', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1178, '2005070101142', '周璇', '女', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1179, '2005070101143', '朱秋習', '女', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1180, '2005070101144', '曹鑫瑞', '男', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1181, '2005070101145', '高勤', '女', '数学与大数据', '数学与应用数学', '20数学一班', NULL, NULL);
INSERT INTO `student` VALUES (1182, '2005070101201', '蔡文良', '男', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1183, '2005070101202', '陈飞鸿', '男', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1184, '2005070101203', '陈泽新', '男', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1185, '2005070101204', '黄尚豪', '男', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1186, '2005070101205', '卢梓铭', '男', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1187, '2005070101206', '罗志睿', '男', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1188, '2005070101207', '王培丰', '男', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1189, '2005070101208', '王智耿', '男', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1190, '2005070101209', '杨汶睿', '男', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1191, '2005070101210', '袁梁浩', '男', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1192, '2005070101211', '蔡梓烨', '女', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1193, '2005070101212', '陈琳', '女', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1194, '2005070101213', '陈如萍', '女', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1195, '2005070101214', '陈小慧', '女', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1196, '2005070101215', '陈秀敏', '女', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1197, '2005070101216', '黄爱佳', '女', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1198, '2005070101217', '黄晓微', '女', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1199, '2005070101218', '黄之', '女', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1200, '2005070101219', '李嘉丽', '女', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1201, '2005070101220', '李锴婷', '女', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1202, '2005070101221', '李玉婷', '女', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1203, '2005070101222', '林楚婷', '女', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1204, '2005070101223', '林思敏', '女', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1205, '2005070101224', '刘慧', '女', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1206, '2005070101225', '马洁岚', '女', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1207, '2005070101226', '宋瑾瑜', '女', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1208, '2005070101227', '王乐乐', '女', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1209, '2005070101228', '王小鹤', '女', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1210, '2005070101229', '巫秋娟', '女', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1211, '2005070101230', '吴南楠', '女', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1212, '2005070101231', '谢玉玲', '女', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1213, '2005070101232', '许佳楠', '女', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1214, '2005070101233', '杨桂芝', '女', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1215, '2005070101234', '杨莹', '女', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1216, '2005070101235', '余佳佳', '女', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1217, '2005070101236', '袁芳婷', '女', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1218, '2005070101237', '曾珮妍', '女', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1219, '2005070101238', '曾祖儿', '女', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1220, '2005070101239', '张洁', '女', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1221, '2005070101240', '张静璇', '女', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1222, '2005070101241', '张雨玲', '女', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1223, '2005070101242', '郑裕怡', '女', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1224, '2005070101243', '马景花', '女', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1225, '2005070101244', '刘加康', '男', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1226, '2005070101245', '丁笑然', '女', '数学与大数据', '数学与应用数学', '20数学二班', NULL, NULL);
INSERT INTO `student` VALUES (1227, '2005070101301', '蔡耀谆', '男', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1228, '2005070101302', '陈铕煌', '男', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1229, '2005070101303', '郭世滨', '男', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1230, '2005070101304', '黄曦', '男', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1231, '2005070101305', '孔晓明', '男', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1232, '2005070101306', '蓝烨', '男', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1233, '2005070101307', '卢凯文', '男', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1234, '2005070101308', '罗嘉鹏', '男', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1235, '2005070101309', '王房锋', '男', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1236, '2005070101310', '叶坤屹', '男', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1237, '2005070101311', '张炯聪', '男', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1238, '2005070101312', '郑希翔', '男', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1239, '2005070101313', '郑晓东', '男', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1240, '2005070101314', '蔡欣彤', '女', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1241, '2005070101315', '陈桂花', '女', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1242, '2005070101316', '陈嘉仪', '女', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1243, '2005070101317', '邓紫怡', '女', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1244, '2005070101318', '郭梓晴', '女', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1245, '2005070101319', '赖莹莹', '女', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1246, '2005070101320', '李丽莹', '女', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1247, '2005070101321', '李晓玲', '女', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1248, '2005070101323', '廖毕芳', '女', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1249, '2005070101324', '林晶晶', '女', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1250, '2005070101325', '林思雨', '女', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1251, '2005070101326', '刘柳琪', '女', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1252, '2005070101327', '刘思源', '女', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1253, '2005070101328', '罗雯慧', '女', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1254, '2005070101329', '罗渲渲', '女', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1255, '2005070101330', '苏润婷', '女', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1256, '2005070101331', '王美诗', '女', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1257, '2005070101332', '谢洵', '女', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1258, '2005070101333', '徐心如', '女', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1259, '2005070101334', '颜秋瑕', '女', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1260, '2005070101335', '杨心悦', '女', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1261, '2005070101336', '叶原妹', '女', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1262, '2005070101337', '张洁荣', '女', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1263, '2005070101338', '张茄纯', '女', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1264, '2005070101339', '张如彬', '女', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1265, '2005070101340', '张秀', '女', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1266, '2005070101341', '钟舒韵', '女', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1267, '2005070101342', '周可欣', '女', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1268, '2005070101343', '彭霞', '女', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1269, '2005070101344', '何子安', '男', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1270, '2005070101345', '梅亚欣', '女', '数学与大数据', '数学与应用数学', '20数学三班', NULL, NULL);
INSERT INTO `student` VALUES (1271, '1905070101344', '郑雪璇', '女', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1272, '2005070101401', '陈焕章', '男', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1273, '2005070101402', '冯詹恩', '男', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1274, '2005070101403', '何思亮', '男', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1275, '2005070101404', '黄志彬', '男', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1276, '2005070101405', '林敦凱', '男', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1277, '2005070101406', '邱泽煜', '男', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1278, '2005070101407', '苏俊霖', '男', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1279, '2005070101408', '王浩菱', '男', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1280, '2005070101409', '吴轶', '男', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1281, '2005070101410', '叶文宁', '男', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1282, '2005070101411', '翟勇坤', '男', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1283, '2005070101412', '钟权谈', '男', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1284, '2005070101413', '钟衍聪', '男', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1285, '2005070101414', '陈畅', '女', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1286, '2005070101415', '陈少婷', '女', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1287, '2005070101416', '陈舒暖', '女', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1288, '2005070101417', '陈枳君', '女', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1289, '2005070101418', '赖怡', '女', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1290, '2005070101419', '李雯玉', '女', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1291, '2005070101420', '李莹琪', '女', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1292, '2005070101421', '梁晓琪', '女', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1293, '2005070101422', '林洛伊', '女', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1294, '2005070101423', '林楠楠', '女', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1295, '2005070101424', '刘桂茹', '女', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1296, '2005070101425', '刘沈', '女', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1297, '2005070101426', '刘婷芳', '女', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1298, '2005070101427', '龙嘉丽', '女', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1299, '2005070101428', '罗燕兰', '女', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1300, '2005070101429', '沈丽枝', '女', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1301, '2005070101430', '沈名姝', '女', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1302, '2005070101431', '温婉莹', '女', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1303, '2005070101432', '谢欣蓓', '女', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1304, '2005070101433', '谢祖琪', '女', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1305, '2005070101434', '徐思思', '女', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1306, '2005070101435', '许凯敏', '女', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1307, '2005070101436', '杨焕银', '女', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1308, '2005070101437', '叶佳欣', '女', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1309, '2005070101438', '游颖艺', '女', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1310, '2005070101439', '曾芳', '女', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1311, '2005070101440', '曾舒甜', '女', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1312, '2005070101441', '曾舒婷', '女', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1313, '2005070101442', '曾伊莉', '女', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1314, '2005070101443', '宗杰', '女', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1315, '2005070101444', '付舒妮', '女', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1316, '2005070101445', '杜艾琳', '女', '数学与大数据', '数学与应用数学', '20数学四班', NULL, NULL);
INSERT INTO `student` VALUES (1317, '2005071202101', '符峻玮', '男', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1318, '2005071202102', '梁豪宇', '男', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1319, '2005071202103', '罗勇洲', '男', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1320, '2005071202104', '彭灏', '男', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1321, '2005071202105', '吴志远', '男', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1322, '2005071202106', '肖钟瀚', '男', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1323, '2005071202107', '谢立源', '男', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1324, '2005071202108', '余梦逸', '男', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1325, '2005071202109', '张新鑫', '男', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1326, '2005071202110', '周厚成', '男', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1327, '2005071202111', '陈凯华', '女', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1328, '2005071202112', '陈柳朱', '女', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1329, '2005071202113', '陈心诺', '女', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1330, '2005071202114', '陈烨纯', '女', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1331, '2005071202115', '戴雅莹', '女', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1332, '2005071202116', '黄海韵', '女', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1333, '2005071202117', '黄锦卿', '女', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1334, '2005071202118', '蓝施玉', '女', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1335, '2005071202119', '李墁羽', '女', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1336, '2005071202120', '李秀雯', '女', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1337, '2005071202121', '李曾溶', '女', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1338, '2005071202122', '廖雪雁', '女', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1339, '2005071202123', '林柳君', '女', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1340, '2005071202124', '林颖芯', '女', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1341, '2005071202125', '林苑仪', '女', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1342, '2005071202126', '刘诗敏', '女', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1343, '2005071202127', '刘小丹', '女', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1344, '2005071202128', '卢丽纯', '女', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1345, '2005071202129', '唐纪璇', '女', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1346, '2005071202130', '王冰仪', '女', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1347, '2005071202131', '吴琳', '女', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1348, '2005071202132', '吴漫炫', '女', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1349, '2005071202133', '吴淇莹', '女', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1350, '2005071202134', '吴欣仪', '女', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1351, '2005071202135', '肖晓纯', '女', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1352, '2005071202136', '谢枫霞', '女', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1353, '2005071202137', '谢暖', '女', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1354, '2005071202138', '薛敏', '女', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1355, '2005071202139', '杨思思', '女', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1356, '2005071202140', '张芳颖', '女', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1357, '2005071202141', '张晓诗', '女', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1358, '2005071202142', '张雨璇', '女', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1359, '2005071202143', '郑丹萍', '女', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1360, '2005071202144', '郑佳钰', '女', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1361, '2005071202145', '钟佳玲', '女', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1362, '2005071202146', '钟思宇', '女', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1363, '2005071202147', '周婷婷', '女', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1364, '2005071202148', '周颖姿', '女', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1365, '2005071202149', '庄晓晶', '女', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1366, '2005071202150', '庄晓珊', '女', '数学与大数据', '应用统计学', '20应统一班', NULL, NULL);
INSERT INTO `student` VALUES (1367, '1805120102138', '李伟浩', '男', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1368, '2005080910101', '陈灿粤', '男', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1369, '2005080910102', '陈超', '男', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1370, '2005080910103', '陈胜源', '男', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1371, '2005080910104', '陈怡瑶', '男', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1372, '2005080910105', '陈玉麟', '男', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1373, '2005080910106', '陈原均', '男', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1374, '2005080910107', '邓杰', '男', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1375, '2005080910108', '何子健', '男', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1376, '2005080910109', '何梓涛', '男', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1377, '2005080910110', '黄鎏坚', '男', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1378, '2005080910111', '李清新', '男', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1379, '2005080910113', '刘启熙', '男', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1380, '2005080910114', '刘永杰', '男', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1381, '2005080910115', '刘源', '男', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1382, '2005080910116', '卢星宇', '男', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1383, '2005080910117', '谭天舜', '男', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1384, '2005080910118', '唐彦伟', '男', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1385, '2005080910119', '唐增铭', '男', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1386, '2005080910120', '吴伟鸿', '男', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1387, '2005080910121', '肖创鑫', '男', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1388, '2005080910122', '谢桂添', '男', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1389, '2005080910123', '许世超', '男', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1390, '2005080910124', '许泽聪', '男', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1391, '2005080910125', '叶俊杰', '男', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1392, '2005080910126', '叶荣业', '男', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1393, '2005080910127', '尹艳明', '男', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1394, '2005080910128', '袁晓茗', '男', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1395, '2005080910129', '曾思源', '男', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1396, '2005080910130', '张震', '男', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1397, '2005080910131', '赵芝泰', '男', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1398, '2005080910132', '郑家希', '男', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1399, '2005080910133', '邹耀慷', '男', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1400, '2005080910134', '陈彩珍', '女', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1401, '2005080910135', '陈嘉雯', '女', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1402, '2005080910136', '董澄', '女', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1403, '2005080910137', '黄群', '女', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1404, '2005080910138', '黄招娣', '女', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1405, '2005080910139', '林彦婷', '女', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1406, '2005080910140', '彭舒瑜', '女', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1407, '2005080910141', '宋艾霖', '女', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1408, '2005080910142', '温健妮', '女', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1409, '2005080910143', '吴绮薇', '女', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1410, '2005080910144', '吴秀芹', '女', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1411, '2005080910145', '杨朝静', '女', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1412, '2005080910146', '曾楚盈', '女', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1413, '2005080910147', '张满婷', '女', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1414, '2005080910148', '郑依桐', '女', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1415, '2005080910149', '钟静琪', '女', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1416, '2005080910150', '邹莹滢', '女', '数学与大数据', '数据科学与大数据技术', '20数科一班', NULL, NULL);
INSERT INTO `student` VALUES (1426, '1405120102114', '学生A', '男', '电子信息与电气工程', '机械电子工程', '14机电一班', '111111', '111111');
INSERT INTO `student` VALUES (1427, '1405120102110', '学生2', '男', '地理与旅游', '旅游管理', '14旅管一班', '54564', '45645');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `teacher_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师工号，要唯一，不能重复',
  `teacher_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师姓名',
  `teacher_sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '男' COMMENT '教师性别，如：男/女/未知',
  `teacher_college` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教师所属学院',
  `teacher_education` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教师学历',
  `teacher_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教师邮箱',
  `teacher_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教师电话',
  `teacher_skill` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教师研究方向',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `teacher_no`(`teacher_no`) USING BTREE,
  INDEX `teacher_no_2`(`teacher_no`, `teacher_name`) USING BTREE,
  INDEX `teacher_name`(`teacher_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '教师表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, '20120386', '陈海容', '女', '数学与统计', '大学本科', '123456@qq.com', '17727263837', '123456');
INSERT INTO `teacher` VALUES (2, '20120407', '张学锋', '女', '数学与统计', '大学本科', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES (4, '20120396', '庄容坤', '男', '数学与统计', '大学本科', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES (5, '20120413', '唐建国', '男', '数学与统计', '博士研究生', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES (6, '20120389', '李桂贞', '女', '数学与统计', '大学本科', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES (9, '20120402', '王宗毅', '男', '数学与统计', '博士研究生', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES (10, '20120401', '柯忠义', '男', '数学与统计', '博士研究生', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES (11, '20120392', '刘玉彬', '男', '数学与统计', '博士研究生', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES (12, '20120412', '陈国培', '男', '数学与统计', '博士研究生', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES (14, '20120415', '程晓胜', '男', '数学与统计', '博士研究生', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES (15, '20120417', '沈威', '男', '数学与统计', '博士研究生', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES (16, '20120422', '聂维琳', '女', '数学与统计', '博士研究生', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES (17, '20120419', '孙晓通', '男', '数学与统计', '博士研究生', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES (18, '20120421', '刘中柱', '男', '数学与统计', '博士研究生', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES (20, '20120420', '蒋晓艳', '女', '数学与统计', '博士研究生', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES (22, '20120910', '李鹏', '男', '数学与统计', '博士研究生', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES (23, '20120914', '莫秋慧', '女', '数学与统计', '博士研究生', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES (24, '20120916', '李羽', '男', '数学与统计', '博士研究生', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES (25, '20150022', '李德旺', '男', '数学与统计', '博士研究生', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES (27, '20150011', '赵显贵', '男', '数学与统计', '博士研究生', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES (28, '20120398', '杨水平', '男', '数学与统计', '博士研究生', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES (29, '20120403', '张未未', '女', '数学与统计', '硕士研究生', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES (30, '20120399', '吴红叶', '女', '数学与统计', '硕士研究生', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES (31, '20120394', '李思彦', '男', '数学与统计', '硕士研究生', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES (32, '20120395', '林群霞', '女', '数学与统计', '硕士研究生', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES (34, '20120400', '李莉', '女', '数学与统计', '硕士研究生', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES (36, '20120410', '王海青', '女', '数学与统计', '硕士研究生', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES (38, '20120408', '李文波', '男', '数学与统计', '硕士研究生', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES (39, '20160005', '钱建发', '男', '数学与统计', '博士研究生', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES (40, '20170026', '周大镯', '女', '数学与统计', '博士研究生', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES (45, '20190049', '方艳丽', '女', '数学与统计', '博士研究生', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES (50, '20120245', '许秋娟', '女', '数学与统计', '硕士研究生', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES (51, '20131089', '沈静妮', '女', '数学与统计', '硕士研究生', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES (52, '20190012', '孙赟赟', '女', '数学与统计', '硕士研究生', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES (53, '20190013', '蒲苡禾', '女', '数学与统计', '硕士研究生', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES (55, '20180034', '郑斯斯', '女', '数学与统计', '博士研究生', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES (56, '20182031', '刘志威', '男', '数学与统计', '硕士研究生', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '状态',
  `usertype` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户类型',
  `created` datetime(0) NULL DEFAULT NULL,
  `last_login` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `UK_USERNAME`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'http://localhost:8088/img/userAvatar/16202353381163.jpg', '123484@qq.com', '21232f297a57a5a743894a0e4a801fc3', 1, '管理员', '2020-04-20 10:44:01', NULL);
INSERT INTO `user` VALUES (2, 'Contestadmin', 'http://localhost:8088/img/userAvatar/16194469433761.jpg', '8464543@163.com', '1234', 1, '管理员', '2020-04-20 00:00:00', NULL);
INSERT INTO `user` VALUES (3, '1705120102114', 'http://localhost:8088/img/userAvatar/16205596079331.jpg', '56464@qq.com', '202cb962ac59075b964b07152d234b70', 1, '学生', '2020-04-20 00:00:00', NULL);
INSERT INTO `user` VALUES (4, '20120386', 'http://localhost:8088/img/userAvatar/16208021356833.jpg', '1564536@qq.com', '202cb962ac59075b964b07152d234b70', 1, '教师', '2021-03-20 21:25:18', NULL);
INSERT INTO `user` VALUES (5, '1705120102110', 'https://image-1300566513.cos.ap-guangzhou.myqcloud.com/upload/images/5a9f48118166308daba8b6da7e466aab.jpg', '8464543@163.com', '202cb962ac59075b964b07152d234b70', 1, '学生', '2020-04-20 00:00:00', NULL);
INSERT INTO `user` VALUES (18, '20120245', 'http://localhost:8088/img/userAvatar/16202187704492.jpg', NULL, '25f9e794323b453885f5181f1b624d0b', 1, '教师', '2021-05-05 20:45:34', NULL);
INSERT INTO `user` VALUES (19, '1705120102109', 'https://image-1300566513.cos.ap-guangzhou.myqcloud.com/upload/images/5a9f48118166308daba8b6da7e466aab.jpg', '8464543@163.com', '202cb962ac59075b964b07152d234b70', 1, '学生', '2020-04-20 00:00:00', NULL);
INSERT INTO `user` VALUES (20, '1705120102111', 'https://image-1300566513.cos.ap-guangzhou.myqcloud.com/upload/images/5a9f48118166308daba8b6da7e466aab.jpg', '8464543@163.com', '202cb962ac59075b964b07152d234b70', 1, '学生', '2020-04-20 00:00:00', NULL);

SET FOREIGN_KEY_CHECKS = 1;
