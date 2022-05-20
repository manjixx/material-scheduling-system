/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : 127.0.0.1:3306
 Source Schema         : it666

 Target Server Type    : MySQL
 Target Server Version : 80020users
 File Encoding         : 65001

 Date: 08/04/2021 16:46:19
*/
use it666;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `goods_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物资名称',
  `goods_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '规格/型号',
  `goods_unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '单位',
  `goods_reverse` int(0) NOT NULL COMMENT '库存',
  `created_at` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_at` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1004 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '物资列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, '防疫一次性口罩', '医用口罩', '个', 99, '2021-03-23 20:11:42', '2021-03-23 20:11:42');
INSERT INTO `goods` VALUES (2, '高浓度84消毒液', '120ml', '瓶', 98, NULL, NULL);
INSERT INTO `goods` VALUES (3, '医用消毒酒精', '200ml', '瓶', 97, NULL, NULL);
INSERT INTO `goods` VALUES (4, '消毒洗手液', '300ml', '瓶', 96, NULL, NULL);
INSERT INTO `goods` VALUES (5, '电子体温枪', '小型', '把', 95, NULL, NULL);
INSERT INTO `goods` VALUES (6, '水银温度计', '小型', '支', 94, NULL, NULL);
INSERT INTO `goods` VALUES (7, '肩背式喷雾器', '大型', '个', 93, '2021-03-22 20:33:12', '2021-03-22 20:33:12');
INSERT INTO `goods` VALUES (8, '手持式喷雾器', '小型', '个', 92, '2021-03-22 20:33:15', '2021-03-22 20:33:15');
INSERT INTO `goods` VALUES (9, '一次性手套', '橡胶', '双', 91, '2021-03-22 20:44:10', '2021-03-22 20:44:10');
INSERT INTO `goods` VALUES (10, '一次性垃圾袋', '中型', '卷', 90, '2021-03-22 20:59:53', '2021-03-22 20:59:53');

-- ----------------------------
-- Table structure for goods_ins
-- ----------------------------
DROP TABLE IF EXISTS `goods_ins`;
CREATE TABLE `goods_ins`  (
  `goods_in_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `goods_in_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物资名称',
  `goods_in_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '规格/型号',
  `goods_in_total` int(0) NOT NULL COMMENT '数量',
  `goods_in_unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '单位',
  `goods_in_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '入库人',
  `goods_in_job` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '所属岗位',
  `goods_in_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '入库日期',
  `goods_in_comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  `created_at` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_at` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`goods_in_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '物资入库' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_ins
-- ----------------------------
INSERT INTO `goods_ins` VALUES (8, '高浓度84消毒液', '120ml', 1, '瓶', 'admin', '管理员', '2021-03-23', NULL, '2022-04-13 23:10:13', '2022-04-13 23:10:13');
INSERT INTO `goods_ins` VALUES (9, '水银温度计', '小型', 1, '支', 'admin', '管理员', '2021-03-24', NULL, '2022-04-13 23:10:58', '2022-04-13 23:10:58');
INSERT INTO `goods_ins` VALUES (10, '防疫一次性口罩', '医用口罩', 1, '个', 'admin', '管理员', '2022-04-13', NULL, '2022-04-13 18:58:08', '2022-04-13 18:58:08');
INSERT INTO `goods_ins` VALUES (11, '防疫一次性口罩', '医用口罩', 1, '个', 'admin', '管理员', '2022-04-13', NULL, '2022-04-13 19:03:56', '2022-04-13 19:03:56');
INSERT INTO `goods_ins` VALUES (12, '防疫一次性口罩', '医用口罩', 1, '个', 'admin', '管理员', '2022-04-13', NULL, '2022-04-13 19:05:34', '2022-04-13 19:05:34');
INSERT INTO `goods_ins` VALUES (13, '防疫一次性口罩', '医用口罩', 1, '卷', 'admin', '管理员', '2022-04-13', NULL, '2022-04-13 19:06:07', '2022-04-13 19:06:07');
INSERT INTO `goods_ins` VALUES (14, '防疫一次性口罩', '医用口罩', 1, '个', 'admin', '管理员', '2022-04-13', NULL, '2022-04-13 19:22:29', '2022-04-13 19:22:29');
INSERT INTO `goods_ins` VALUES (21, '防疫一次性口罩', '医用口罩', 1, '个', 'admin', '管理员', '2022-04-13', NULL, '2022-04-13 19:41:24', '2022-04-13 19:41:24');
INSERT INTO `goods_ins` VALUES (22, '防疫一次性口罩', '医用口罩', 50, '卷', 'admin', '管理员', '2022-04-13', NULL, '2022-04-13 19:43:37', '2022-04-13 19:43:37');
INSERT INTO `goods_ins` VALUES (23, '防疫一次性口罩', '医用口罩', 5, '卷', 'admin', '管理员', '2021-04-09', NULL, '2022-04-13 19:44:40', '2022-04-13 19:44:40');

-- ----------------------------
-- Table structure for goods_outs
-- ----------------------------
DROP TABLE IF EXISTS `goods_outs`;
CREATE TABLE `goods_outs`  (
  `goods_out_id` bigint unsigned NOT NULL,
  `goods_out_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物资名称',
  `goods_out_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '规格/型号',
  `goods_out_total` int(0) NOT NULL COMMENT '数量',
  `goods_out_unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '单位',
  `goods_out_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '领用人',
  `goods_out_job` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '所属岗位',
  `goods_out_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '领用日期',
  `goods_out_comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  `created_at` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_at` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`goods_out_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '物资领用' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_outs
-- ----------------------------
INSERT INTO `goods_outs` VALUES (1, '防疫一次性口罩', '医用口罩', 1, '个', 'admin', '管理员', '2021-03-23', NULL, '2021-03-23 18:53:49', '2021-03-23 18:53:49');
INSERT INTO `goods_outs` VALUES (2, '防疫一次性口罩', '医用口罩', 3, '个', 'admin', '管理员', '2021-03-23', NULL, '2021-03-23 19:51:00', '2021-03-23 19:51:00');
INSERT INTO `goods_outs` VALUES (3, '防疫一次性口罩', '医用口罩', 10, '卷', 'admin', '管理员', '2021-03-25', NULL, '2021-03-23 19:54:12', '2021-03-23 19:54:12');
INSERT INTO `goods_outs` VALUES (9, '防疫一次性口罩', '医用口罩', 1, '个', 'admin', '管理员', '2021-03-23', NULL, '2021-03-23 20:11:42', '2021-03-23 20:11:42');

-- ----------------------------
-- Table structure for healths
-- ----------------------------
DROP TABLE IF EXISTS `healths`;
CREATE TABLE `healths`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `healths_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `healths_sex` tinyint(1) NOT NULL DEFAULT 1,
  `healths_job` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `healths_heat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `healths_state` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of healths
-- ----------------------------
INSERT INTO `healths` VALUES (11, 'abc', 1, '配送', '36', 0, '2021-03-20 20:52:21', '2021-03-20 20:52:21');
INSERT INTO `healths` VALUES (13, '123', 0, '分拣', '38.5', 1, '2021-03-20 21:13:44', '2021-03-20 21:13:44');

-- ----------------------------
-- Table structure for oauths
-- ----------------------------
DROP TABLE IF EXISTS `oauths`;
CREATE TABLE `oauths`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `access_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `uid` int(0) NOT NULL,
  `user_id` int(0) NOT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uid`(`uid`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `oauths_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauths
-- ----------------------------
INSERT INTO `oauths` VALUES (1, '0bc65e5f8cf068741fb7c5bfd093eabb7512dc9b', 'github', 4397619, 4, '2020-08-11 15:04:19', '2020-08-11 15:04:19');

-- ----------------------------
-- Table structure for rights
-- ----------------------------
DROP TABLE IF EXISTS `rights`;
CREATE TABLE `rights`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `rights_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `rights_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `rights_state` tinyint(1) NULL DEFAULT 1,
  `rights_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `rights_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pid` int(0) NULL DEFAULT NULL,
  `level` int(0) NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `rights_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `rights_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `rights_name`(`rights_name`) USING BTREE,
  INDEX `rights_desc`(`rights_desc`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 87 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rights
-- ----------------------------
INSERT INTO `rights` VALUES (42, '菜单权限', '是否可以使用特定菜单', 1, 'menu', '1', 0, 0, NULL, '2021-03-25 20:32:50', '', NULL);
INSERT INTO `rights` VALUES (43, '用户管理', '用户管理菜单', 1, 'menu', '/usersManage', 42, 1, NULL, NULL, '', 'el-icon-user');
INSERT INTO `rights` VALUES (44, '用户列表', '用户列表菜单', 1, 'menu', '/users', 43, 2, NULL, NULL, '', 'el-icon-user-solid');
INSERT INTO `rights` VALUES (45, '权限管理', '是否可以使用权限管理菜单', 1, 'menu', '/rolesManage', 42, 1, NULL, NULL, '', 'el-icon-lock');
INSERT INTO `rights` VALUES (46, '角色列表', '角色列表菜单', 1, 'menu', '/roles', 45, 2, NULL, NULL, '', 'el-icon-key');
INSERT INTO `rights` VALUES (47, '权限列表', '权限列表菜单', 1, 'menu', '/rights', 45, 2, NULL, NULL, '', 'el-icon-unlock');
INSERT INTO `rights` VALUES (48, '路由权限', '是否可以使用特定路由', 1, 'router', '/main', 0, 0, NULL, NULL, '', NULL);
INSERT INTO `rights` VALUES (49, '用户管理', '用户管理路由', 1, 'router', '', 48, 1, NULL, NULL, '', NULL);
INSERT INTO `rights` VALUES (50, '用户列表', '用户列表路由', 1, 'router', '/users', 49, 2, NULL, NULL, '', NULL);
INSERT INTO `rights` VALUES (51, '权限管理', '权限管理路由', 1, 'router', '', 48, 1, NULL, NULL, '', NULL);
INSERT INTO `rights` VALUES (52, '角色列表', '角色列表路由', 1, 'router', '/roles', 51, 2, NULL, NULL, '', NULL);
INSERT INTO `rights` VALUES (53, '权限列表', '权限列表路由', 1, 'router', '/rights', 51, 2, NULL, NULL, '', NULL);
INSERT INTO `rights` VALUES (54, '请求权限', '是否可以发送特定请求', 1, 'action', '', 0, 0, NULL, NULL, 'all', NULL);
INSERT INTO `rights` VALUES (55, '用户列表', '用户列表相关请求', 1, 'action', '', 54, 1, NULL, NULL, 'all', NULL);
INSERT INTO `rights` VALUES (56, '获取用户', '用户用户请求', 1, 'action', '/api/v1/users', 55, 2, NULL, NULL, 'get', NULL);
INSERT INTO `rights` VALUES (57, '创建用户', '创建用户请求', 1, 'action', '/api/v1/users', 55, 2, NULL, NULL, 'post', NULL);
INSERT INTO `rights` VALUES (58, '更新用户', '更新用户请求', 1, 'action', '/api/v1/users', 55, 2, NULL, NULL, 'put', NULL);
INSERT INTO `rights` VALUES (59, '删除用户', '删除用户请求', 1, 'action', '/api/v1/users', 55, 2, NULL, NULL, 'delete', NULL);
INSERT INTO `rights` VALUES (60, '角色列表', '角色列表相关请求', 1, 'action', '', 54, 1, NULL, NULL, 'all', NULL);
INSERT INTO `rights` VALUES (61, '获取角色', '获取角色请求', 1, 'action', '/api/v1/roles', 60, 2, NULL, NULL, 'get', NULL);
INSERT INTO `rights` VALUES (62, '创建角色', '创建角色请求', 1, 'action', '/api/v1/roles', 60, 2, NULL, NULL, 'post', NULL);
INSERT INTO `rights` VALUES (63, '删除角色', '删除角色请求', 1, 'action', '/api/v1/roles', 60, 2, NULL, NULL, 'delete', NULL);
INSERT INTO `rights` VALUES (64, '更新角色', '更新角色请求', 1, 'action', '/api/v1/roles', 60, 2, NULL, NULL, 'put', NULL);
INSERT INTO `rights` VALUES (65, '权限列表', '权限列表相关请求', 1, 'action', '', 54, 1, NULL, NULL, 'all', NULL);
INSERT INTO `rights` VALUES (66, '获取权限', '获取权限请求', 1, 'action', '/api/v1/rights', 65, 2, NULL, NULL, 'get', NULL);
INSERT INTO `rights` VALUES (67, '删除权限', '删除权限请求', 1, 'action', '/api/v1/rights', 65, 2, NULL, NULL, 'delete', NULL);
INSERT INTO `rights` VALUES (68, '创建权限', '创建权限请求', 1, 'action', '/api/v1/rights', 65, 2, NULL, NULL, 'post', NULL);
INSERT INTO `rights` VALUES (69, '更新权限', '更新全新请求', 1, 'action', '/api/v1/rights', 65, 2, NULL, NULL, 'put', NULL);
INSERT INTO `rights` VALUES (70, '分配角色', '分配角色请求', 1, 'action', '/api/v1/userrole', 55, 2, NULL, NULL, 'post', NULL);
INSERT INTO `rights` VALUES (71, '移出角色', '移出角色请求', 1, 'action', '/api/v1/userrole', 55, 2, NULL, NULL, 'delete', NULL);
INSERT INTO `rights` VALUES (72, '分配角色', '给用户分配角色', 1, 'action', '/api/v1/userrole', 55, 2, NULL, NULL, 'post', NULL);
INSERT INTO `rights` VALUES (73, '移出角色', '移出用户拥有的角色', 1, 'action', '/api/v1/userrole', 55, 2, NULL, NULL, 'delete', NULL);
INSERT INTO `rights` VALUES (74, '分配权限', '给角色分配权限', 1, 'action', '/api/v1/roleRights', 60, 2, NULL, NULL, 'post', NULL);
INSERT INTO `rights` VALUES (75, '移出权限', '移出角色拥有的权限', 1, 'action', '/api/v1/roleRights', 60, 2, NULL, NULL, 'delete', NULL);
INSERT INTO `rights` VALUES (76, '健康列表', '健康列表相关请求', 1, 'action', '', 54, 1, NULL, NULL, 'all', NULL);
INSERT INTO `rights` VALUES (77, '获取健康', '获取健康请求', 1, 'action', '/api/v1/healths', 76, 2, NULL, NULL, 'get', NULL);
INSERT INTO `rights` VALUES (78, '创建健康', '创建健康请求', 1, 'action', '/api/v1/healths', 76, 2, NULL, NULL, 'post', NULL);
INSERT INTO `rights` VALUES (80, '物资管理', '物资管理菜单', 1, 'menu', '/goodsManage', 42, 1, '2021-03-21 13:43:29', '2021-03-21 13:43:29', '', 'el-icon-goods');
INSERT INTO `rights` VALUES (81, '物资列表', '物资列表管理', 1, 'menu', '/goods', 80, 2, '2021-03-21 13:52:25', '2021-03-21 13:52:25', '', 'el-icon-s-order');
INSERT INTO `rights` VALUES (82, '物资管理', '物资管理路由', 1, 'router', '', 90, 1, '2021-03-21 13:57:10', '2021-03-21 13:57:10', '', NULL);
INSERT INTO `rights` VALUES (83, '物资列表', '物资列表路由', 1, 'router', '/goods', 82, 2, '2021-03-21 13:57:47', '2021-03-21 13:57:47', '', NULL);
INSERT INTO `rights` VALUES (84, '物资入库', '物资入库菜单', 1, 'menu', '/goodsIn', 80, 2, '2021-03-21 14:29:36', '2021-03-21 14:29:36', '', 'el-icon-circle-plus-outline');
INSERT INTO `rights` VALUES (85, '物资入库', '物资入库路由', 1, 'router', '/goodsIn', 90, 2, '2021-03-21 14:31:16', '2021-03-21 14:31:16', '', '');
INSERT INTO `rights` VALUES (86, '工单管理', '工单管理路由', 1, 'router', '/order', 90, 1, '2021-03-21 14:31:52', '2021-03-21 14:31:52', '', '');
INSERT INTO `rights` VALUES (87, '工单管理', '物资领用菜单', 1, 'menu', '/order', 42, 1, '2021-03-21 14:30:17', '2021-03-21 14:30:17', '', 'el-icon-success');
INSERT INTO `rights` VALUES (88, '物资领用', '物资领用菜单', 1, 'menu', '/goodsOut', 80, 2, '2021-03-21 14:30:17', '2021-03-21 14:30:17', '', 'el-icon-success');
INSERT INTO `rights` VALUES (89, '物资领用', '物资领用路由', 1, 'router', '/goodsOut', 91, 2, '2021-03-21 14:31:52', '2021-03-21 14:31:52', '', '');
INSERT INTO `rights` VALUES (90, '路由权限', '是否可以使用特定路由', 1, 'router', '/mainck', 0, 0, NULL, NULL, '', NULL);
INSERT INTO `rights` VALUES (91, '路由权限', '是否可以使用特定路由', 1, 'router', '/mainus', 0, 0, NULL, NULL, '', NULL);
INSERT INTO `rights` VALUES (92, '仓库管理', '仓库管理路由', 1, 'router', '', 90, 1, '2021-03-21 13:57:10', '2021-03-21 13:57:10', '', NULL);
INSERT INTO `rights` VALUES (93, '查询管理', '查询管理路由', 1, 'router', '', 91, 1, '2021-03-21 13:57:10', '2021-03-21 13:57:10', '', NULL);
INSERT INTO `rights` VALUES (94, '获取工单', '获取工单', 1, 'action', '/api/v1/order', 54, 2, NULL, NULL, 'get', NULL);
INSERT INTO `rights` VALUES (95, '创建工单', '创建工单', 1, 'action', '/api/v1/order', 54, 2, NULL, NULL, 'post', NULL);
INSERT INTO `rights` VALUES (96, '删除工单', '删除工单', 1, 'action', '/api/v1/order', 54, 2, NULL, NULL, 'delete', NULL);
INSERT INTO `rights` VALUES (97, '获取仓库列表', '获取仓库列表', 1, 'action', '/api/v1/store', 54, 2, NULL, NULL, 'get', NULL);
INSERT INTO `rights` VALUES (98, '创建仓库列表', '创建仓库列表', 1, 'action', '/api/v1/store', 54, 2, NULL, NULL, 'post', NULL);
INSERT INTO `rights` VALUES (99, '物资管理', '物资管理路由', 1, 'router', '', 48, 1, '2021-03-21 13:57:10', '2021-03-21 13:57:10', '', NULL);
INSERT INTO `rights` VALUES (100, '物资列表', '物资列表路由', 1, 'router', '/goods', 99, 2, '2021-03-21 13:57:47', '2021-03-21 13:57:47', '', NULL);
INSERT INTO `rights` VALUES (101, '物资入库', '物资入库路由', 1, 'router', '/goodsIn', 99, 2, '2021-03-21 14:31:16', '2021-03-21 14:31:16', '', '');
INSERT INTO `rights` VALUES (102, '工单管理', '工单管理路由', 1, 'router', '/order', 48, 1, '2021-03-21 14:31:52', '2021-03-21 14:31:52', '', '');
INSERT INTO `rights` VALUES (103, '物资管理', '物资管理路由', 1, 'router', '', 91, 1, '2021-03-21 13:57:10', '2021-03-21 13:57:10', '', NULL);
INSERT INTO `rights` VALUES (104, '物资列表', '物资列表路由', 1, 'router', '/goods', 91, 2, '2021-03-21 13:57:47', '2021-03-21 13:57:47', '', NULL);
INSERT INTO `rights` VALUES (105, '工单管理', '工单管理路由', 1, 'router', '/order', 91, 1, '2021-03-21 14:31:52', '2021-03-21 14:31:52', '', '');

-- ----------------------------
-- Table structure for role_rights
-- ----------------------------
DROP TABLE IF EXISTS `role_rights`;
CREATE TABLE `role_rights`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `role_id` int(0) NOT NULL,
  `rights_id` int(0) NOT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `role_rights_ibfk_1`(`role_id`) USING BTREE,
  INDEX `role_rights_ibfk_2`(`rights_id`) USING BTREE,
  CONSTRAINT `role_rights_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `role_rights_ibfk_2` FOREIGN KEY (`rights_id`) REFERENCES `rights` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 248 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_rights
-- ----------------------------
INSERT INTO `role_rights` VALUES (1, 1, 43, '2020-08-27 16:58:18', '2020-08-27 16:58:18');
INSERT INTO `role_rights` VALUES (2, 1, 42, '2020-08-27 16:58:18', '2020-08-27 16:58:18');
INSERT INTO `role_rights` VALUES (3, 1, 44, '2020-08-27 17:22:11', '2020-08-27 17:22:11');
INSERT INTO `role_rights` VALUES (8, 1, 45, '2020-08-28 10:55:54', '2020-08-28 10:55:54');
INSERT INTO `role_rights` VALUES (9, 1, 46, '2020-08-28 10:55:54', '2020-08-28 10:55:54');
INSERT INTO `role_rights` VALUES (10, 1, 47, '2020-08-28 10:55:54', '2020-08-28 10:55:54');
INSERT INTO `role_rights` VALUES (11, 1, 48, '2020-08-28 10:55:54', '2020-08-28 10:55:54');
INSERT INTO `role_rights` VALUES (12, 1, 49, '2020-08-28 10:55:54', '2020-08-28 10:55:54');
INSERT INTO `role_rights` VALUES (13, 1, 50, '2020-08-28 10:55:54', '2020-08-28 10:55:54');
INSERT INTO `role_rights` VALUES (14, 1, 51, '2020-08-28 10:55:54', '2020-08-28 10:55:54');
INSERT INTO `role_rights` VALUES (15, 1, 52, '2020-08-28 10:55:54', '2020-08-28 10:55:54');
INSERT INTO `role_rights` VALUES (16, 1, 53, '2020-08-28 10:55:54', '2020-08-28 10:55:54');
INSERT INTO `role_rights` VALUES (17, 1, 54, '2020-08-28 10:55:54', '2020-08-28 10:55:54');
INSERT INTO `role_rights` VALUES (18, 1, 55, '2020-08-28 10:55:54', '2020-08-28 10:55:54');
INSERT INTO `role_rights` VALUES (19, 1, 56, '2020-08-28 10:55:54', '2020-08-28 10:55:54');
INSERT INTO `role_rights` VALUES (20, 1, 57, '2020-08-28 10:55:54', '2020-08-28 10:55:54');
INSERT INTO `role_rights` VALUES (21, 1, 58, '2020-08-28 10:55:54', '2020-08-28 10:55:54');
INSERT INTO `role_rights` VALUES (22, 1, 59, '2020-08-28 10:55:54', '2020-08-28 10:55:54');
INSERT INTO `role_rights` VALUES (23, 1, 70, '2020-08-28 10:55:54', '2020-08-28 10:55:54');
INSERT INTO `role_rights` VALUES (24, 1, 71, '2020-08-28 10:55:54', '2020-08-28 10:55:54');
INSERT INTO `role_rights` VALUES (25, 1, 60, '2020-08-28 10:55:54', '2020-08-28 10:55:54');
INSERT INTO `role_rights` VALUES (26, 1, 61, '2020-08-28 10:55:54', '2020-08-28 10:55:54');
INSERT INTO `role_rights` VALUES (27, 1, 62, '2020-08-28 10:55:54', '2020-08-28 10:55:54');
INSERT INTO `role_rights` VALUES (28, 1, 63, '2020-08-28 10:55:54', '2020-08-28 10:55:54');
INSERT INTO `role_rights` VALUES (29, 1, 64, '2020-08-28 10:55:54', '2020-08-28 10:55:54');
INSERT INTO `role_rights` VALUES (30, 1, 65, '2020-08-28 10:55:54', '2020-08-28 10:55:54');
INSERT INTO `role_rights` VALUES (31, 1, 66, '2020-08-28 10:55:54', '2020-08-28 10:55:54');
INSERT INTO `role_rights` VALUES (32, 1, 67, '2020-08-28 10:55:54', '2020-08-28 10:55:54');
INSERT INTO `role_rights` VALUES (33, 1, 68, '2020-08-28 10:55:54', '2020-08-28 10:55:54');
INSERT INTO `role_rights` VALUES (34, 1, 69, '2020-08-28 10:55:54', '2020-08-28 10:55:54');
INSERT INTO `role_rights` VALUES (35, 1, 80, '2021-03-21 13:53:03', '2021-03-21 13:53:03');
INSERT INTO `role_rights` VALUES (36, 1, 82, '2021-03-21 13:58:10', '2021-03-21 13:58:10');
INSERT INTO `role_rights` VALUES (37, 1, 83, '2021-03-21 14:39:00', '2021-03-21 14:39:00');
INSERT INTO `role_rights` VALUES (38, 1, 77, '2021-03-24 20:58:02', '2021-03-24 20:58:02');
INSERT INTO `role_rights` VALUES (39, 1, 78, '2021-03-24 20:58:03', '2021-03-24 20:58:03');
INSERT INTO `role_rights` VALUES (40, 1, 86, '2021-03-24 21:11:16', '2021-03-24 21:11:16');
INSERT INTO `role_rights` VALUES (41, 1, 87, '2021-03-24 21:11:16', '2021-03-24 21:11:16');
INSERT INTO `role_rights` VALUES (42, 1, 81, '2021-03-25 20:32:14', '2021-03-25 20:32:14');
INSERT INTO `role_rights` VALUES (43, 1, 84, '2021-03-25 20:32:14', '2021-03-25 20:32:14');
INSERT INTO `role_rights` VALUES (44, 1, 85, '2021-03-25 20:32:14', '2021-03-25 20:32:14');
INSERT INTO `role_rights` VALUES (45, 1, 90, '2021-03-25 20:32:14', '2021-03-25 20:32:14');
INSERT INTO `role_rights` VALUES (46, 1, 91, '2021-03-25 20:32:14', '2021-03-25 20:32:14');
INSERT INTO `role_rights` VALUES (47, 1, 99, '2021-03-25 20:32:14', '2021-03-25 20:32:14');
INSERT INTO `role_rights` VALUES (48, 1, 100, '2021-03-25 20:32:14', '2021-03-25 20:32:14');
INSERT INTO `role_rights` VALUES (49, 1, 101, '2021-03-25 20:32:14', '2021-03-25 20:32:14');
INSERT INTO `role_rights` VALUES (50, 1, 102, '2021-03-25 20:32:14', '2021-03-25 20:32:14');
INSERT INTO `role_rights` VALUES (110, 2, 42, '2020-08-27 16:58:18', '2020-08-27 16:58:18');
INSERT INTO `role_rights` VALUES (112, 2, 54, '2021-03-20 21:07:20', '2021-03-20 21:07:20');
INSERT INTO `role_rights` VALUES (113, 2, 55, '2021-03-20 21:07:20', '2021-03-20 21:07:20');
INSERT INTO `role_rights` VALUES (114, 2, 56, '2021-03-20 21:07:20', '2021-03-20 21:07:20');
INSERT INTO `role_rights` VALUES (115, 2, 57, '2021-03-20 21:07:20', '2021-03-20 21:07:20');
INSERT INTO `role_rights` VALUES (116, 2, 58, '2021-03-20 21:07:20', '2021-03-20 21:07:20');
INSERT INTO `role_rights` VALUES (117, 2, 59, '2021-03-20 21:07:20', '2021-03-20 21:07:20');
INSERT INTO `role_rights` VALUES (118, 2, 60, '2021-03-20 21:07:21', '2021-03-20 21:07:21');
INSERT INTO `role_rights` VALUES (119, 2, 65, '2021-03-20 21:07:21', '2021-03-20 21:07:21');
INSERT INTO `role_rights` VALUES (120, 2, 66, '2021-03-20 21:07:22', '2021-03-20 21:07:22');
INSERT INTO `role_rights` VALUES (121, 2, 67, '2021-03-20 21:07:22', '2021-03-20 21:07:22');
INSERT INTO `role_rights` VALUES (122, 2, 68, '2021-03-20 21:07:22', '2021-03-20 21:07:22');
INSERT INTO `role_rights` VALUES (123, 2, 69, '2021-03-20 21:07:22', '2021-03-20 21:07:22');
INSERT INTO `role_rights` VALUES (124, 2, 70, '2021-03-20 21:07:20', '2021-03-20 21:07:20');
INSERT INTO `role_rights` VALUES (125, 2, 71, '2021-03-20 21:07:20', '2021-03-20 21:07:20');
INSERT INTO `role_rights` VALUES (126, 2, 72, '2021-03-20 21:07:20', '2021-03-20 21:07:20');
INSERT INTO `role_rights` VALUES (127, 2, 73, '2021-03-20 21:07:21', '2021-03-20 21:07:21');
INSERT INTO `role_rights` VALUES (128, 2, 76, '2021-03-20 21:07:22', '2021-03-20 21:07:22');
INSERT INTO `role_rights` VALUES (129, 2, 80, '2021-03-20 21:07:22', '2021-03-20 21:07:22');
INSERT INTO `role_rights` VALUES (130, 2, 81, '2021-03-20 21:07:22', '2021-03-20 21:07:22');
INSERT INTO `role_rights` VALUES (131, 2, 82, '2021-03-20 21:07:22', '2021-03-20 21:07:22');
INSERT INTO `role_rights` VALUES (132, 2, 83, '2021-03-20 21:07:22', '2021-03-20 21:07:22');
INSERT INTO `role_rights` VALUES (133, 2, 84, '2021-03-20 21:07:22', '2021-03-20 21:07:22');
INSERT INTO `role_rights` VALUES (134, 2, 85, '2021-03-20 21:07:22', '2021-03-20 21:07:22');
INSERT INTO `role_rights` VALUES (135, 2, 86, '2021-03-20 21:07:22', '2021-03-20 21:07:22');
INSERT INTO `role_rights` VALUES (136, 2, 87, '2021-03-20 21:07:22', '2021-03-20 21:07:22');
INSERT INTO `role_rights` VALUES (137, 2, 90, '2020-08-28 10:55:54', '2020-08-28 10:55:54');
INSERT INTO `role_rights` VALUES (138, 2, 94, '2021-03-20 21:07:22', '2021-03-20 21:07:22');
INSERT INTO `role_rights` VALUES (139, 2, 95, '2020-08-28 10:55:54', '2020-08-28 10:55:54');
INSERT INTO `role_rights` VALUES (140, 2, 97, '2021-03-20 21:07:22', '2021-03-20 21:07:22');
INSERT INTO `role_rights` VALUES (141, 2, 98, '2020-08-28 10:55:54', '2020-08-28 10:55:54');
INSERT INTO `role_rights` VALUES (200, 3, 42, '2021-03-20 21:21:51', '2021-03-20 21:21:51');
INSERT INTO `role_rights` VALUES (201, 3, 54, '2021-03-20 21:07:20', '2021-03-20 21:07:20');
INSERT INTO `role_rights` VALUES (202, 3, 55, '2021-03-20 21:07:20', '2021-03-20 21:07:20');
INSERT INTO `role_rights` VALUES (203, 3, 56, '2021-03-20 21:07:20', '2021-03-20 21:07:20');
INSERT INTO `role_rights` VALUES (204, 3, 57, '2021-03-20 21:07:20', '2021-03-20 21:07:20');
INSERT INTO `role_rights` VALUES (205, 3, 58, '2021-03-20 21:07:20', '2021-03-20 21:07:20');
INSERT INTO `role_rights` VALUES (206, 3, 59, '2021-03-20 21:07:20', '2021-03-20 21:07:20');
INSERT INTO `role_rights` VALUES (207, 3, 60, '2021-03-20 21:07:21', '2021-03-20 21:07:21');
INSERT INTO `role_rights` VALUES (208, 3, 65, '2021-03-20 21:07:21', '2021-03-20 21:07:21');
INSERT INTO `role_rights` VALUES (209, 3, 66, '2021-03-20 21:07:22', '2021-03-20 21:07:22');
INSERT INTO `role_rights` VALUES (210, 3, 67, '2021-03-20 21:07:22', '2021-03-20 21:07:22');
INSERT INTO `role_rights` VALUES (211, 3, 68, '2021-03-20 21:07:22', '2021-03-20 21:07:22');
INSERT INTO `role_rights` VALUES (212, 3, 69, '2021-03-20 21:07:22', '2021-03-20 21:07:22');
INSERT INTO `role_rights` VALUES (213, 3, 70, '2021-03-20 21:07:20', '2021-03-20 21:07:20');
INSERT INTO `role_rights` VALUES (214, 3, 71, '2021-03-20 21:07:20', '2021-03-20 21:07:20');
INSERT INTO `role_rights` VALUES (215, 3, 72, '2021-03-20 21:07:20', '2021-03-20 21:07:20');
INSERT INTO `role_rights` VALUES (216, 3, 73, '2021-03-20 21:07:21', '2021-03-20 21:07:21');
INSERT INTO `role_rights` VALUES (217, 3, 76, '2021-03-20 21:07:22', '2021-03-20 21:07:22');
INSERT INTO `role_rights` VALUES (218, 3, 77, '2021-03-20 21:21:52', '2021-03-20 21:21:52');
INSERT INTO `role_rights` VALUES (219, 3, 78, '2021-03-20 21:21:52', '2021-03-20 21:21:52');
INSERT INTO `role_rights` VALUES (220, 3, 80, '2021-03-20 21:07:22', '2021-03-20 21:07:22');
INSERT INTO `role_rights` VALUES (221, 3, 81, '2021-03-20 21:21:52', '2021-03-20 21:21:52');
INSERT INTO `role_rights` VALUES (222, 3, 87, '2021-03-20 21:21:52', '2021-03-20 21:21:52');
INSERT INTO `role_rights` VALUES (223, 3, 89, '2021-03-20 21:21:52', '2021-03-20 21:21:52');
INSERT INTO `role_rights` VALUES (224, 3, 91, '2020-08-28 10:55:54', '2020-08-28 10:55:54');
INSERT INTO `role_rights` VALUES (225, 3, 93, '2021-03-20 21:07:22', '2021-03-20 21:07:22');
INSERT INTO `role_rights` VALUES (226, 3, 94, '2021-03-20 21:07:22', '2021-03-20 21:07:22');
INSERT INTO `role_rights` VALUES (227, 3, 95, '2020-08-28 10:55:54', '2020-08-28 10:55:54');
INSERT INTO `role_rights` VALUES (228, 3, 96, '2021-03-20 21:07:22', '2021-03-20 21:07:22');
INSERT INTO `role_rights` VALUES (229, 3, 97, '2020-08-28 10:55:54', '2020-08-28 10:55:54');
INSERT INTO `role_rights` VALUES (230, 3, 98, '2020-08-28 10:55:54', '2020-08-28 10:55:54');
INSERT INTO `role_rights` VALUES (231, 3, 103, '2021-03-20 21:07:22', '2021-03-20 21:07:22');
INSERT INTO `role_rights` VALUES (232, 3, 104, '2020-08-28 10:55:54', '2020-08-28 10:55:54');
INSERT INTO `role_rights` VALUES (233, 3, 105, '2020-08-28 10:55:54', '2020-08-28 10:55:54');
INSERT INTO `role_rights` VALUES (234, 3, 88, '2021-03-20 21:21:52', '2021-03-20 21:21:52');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role_state` tinyint(1) NULL DEFAULT 1,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `role_name`(`role_name`) USING BTREE,
  UNIQUE INDEX `role_desc`(`role_desc`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, '管理员', '啥都干的', 1, '2022-04-13 15:27:15', '2022-04-13 19:33:34');
INSERT INTO `roles` VALUES (2, '仓库管理', '分配物资', 1, '2022-04-13 15:27:15', '2022-04-13 15:27:15');
INSERT INTO `roles` VALUES (3, '申领单位', '请求物资', 1, '2022-04-13 15:27:15', '2022-04-13 15:27:15');

-- ----------------------------
-- Table structure for sequelizemeta
-- ----------------------------
DROP TABLE IF EXISTS `sequelizemeta`;
CREATE TABLE `sequelizemeta`  (
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sequelizemeta
-- ----------------------------
INSERT INTO `sequelizemeta` VALUES ('20200727060756-users.ts');
INSERT INTO `sequelizemeta` VALUES ('20200805090832-oauths.ts');
INSERT INTO `sequelizemeta` VALUES ('20200805092012-users.ts');
INSERT INTO `sequelizemeta` VALUES ('20200811064553-users.ts');
INSERT INTO `sequelizemeta` VALUES ('20200818013111-users.ts');
INSERT INTO `sequelizemeta` VALUES ('20200818051258-role.ts');
INSERT INTO `sequelizemeta` VALUES ('20200818051258-roles.ts');
INSERT INTO `sequelizemeta` VALUES ('20200818051309-userrole.ts');
INSERT INTO `sequelizemeta` VALUES ('20200820102707-rights.ts');
INSERT INTO `sequelizemeta` VALUES ('20200820102756-rolerights.ts');
INSERT INTO `sequelizemeta` VALUES ('20210316140826-users.ts');
INSERT INTO `sequelizemeta` VALUES ('20210320091421-healths.ts');
INSERT INTO `sequelizemeta` VALUES ('20210320092141-healths.ts');
INSERT INTO `sequelizemeta` VALUES ('20210320092439-healths.ts');
INSERT INTO `sequelizemeta` VALUES ('20210320093819-healths.ts');
INSERT INTO `sequelizemeta` VALUES ('20210320110001-healths.ts');
INSERT INTO `sequelizemeta` VALUES ('20210320110207-healths.ts');

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `role_id` int(0) NOT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_roles
-- ----------------------------
INSERT INTO `user_roles` VALUES (1, 1, 1, '2020-08-18 18:51:32', '2020-08-18 18:51:32');
INSERT INTO `user_roles` VALUES (2, 2, 2, '2020-08-18 20:01:52', '2020-08-18 20:01:52');
INSERT INTO `user_roles` VALUES (3, 3, 2, '2020-08-18 20:02:35', '2020-08-18 20:02:35');
INSERT INTO `user_roles` VALUES (4, 4, 3, '2020-08-27 15:27:36', '2020-08-27 15:27:36');
INSERT INTO `user_roles` VALUES (5, 5, 3, '2021-03-20 21:02:24', '2021-03-20 21:02:24');
INSERT INTO `user_roles` VALUES (6, 6, 3, '2021-03-20 21:04:59', '2021-03-20 21:04:59');
INSERT INTO `user_roles` VALUES (7, 7, 3, '2021-03-20 21:10:31', '2021-03-20 21:10:31');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `user_state` tinyint(1) NOT NULL DEFAULT 1,
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '/public/avatar.png',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE,
  UNIQUE INDEX `phone`(`phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', '123456@qq.com', '13999999999', 'fe0b0bdbe468aa6596c6af4ea4309ca7', '', '2020-08-10 12:49:10', '2021-03-25 20:29:37', 1, '/public/upload/d931640f840cf48d5edaed427bf5e646.png');
INSERT INTO `users` VALUES (2, 'cangku1', '97606814@qq.com', '13888888888', 'd769d2bae3d0f1fa45faf23c5374108f', '',  '2020-08-10 12:49:10', '2020-08-10 12:49:10', 1, '/public/avatar.png');
INSERT INTO `users` VALUES (3, 'cangku2', NULL, '13666666666', '6aaf761e02ef6d6af137e07cf8f572ef','', '2020-08-10 12:49:10', '2020-08-10 12:49:10', 1, '/public/avatar.png');
INSERT INTO `users` VALUES (4, 'user1', '123@163.com', '17111111111', '30ca5d99cf824e8d753e857f3a769118','时代华城', '2020-08-11 15:04:19', '2020-08-11 15:04:19', 1, '/public/avatar.png');
INSERT INTO `users` VALUES (5, 'user2', '124@163.com', '17222222222', '3d298c6d629182b2aac9a6a8ae15d6ba', '钟楼', '2020-08-11 15:04:19', '2020-08-11 15:04:19', 1, '/public/avatar.png');
INSERT INTO `users` VALUES (6, 'user3', '125@163.com', '17333333333', '8af814a7d7a6b9c3886dd1e1c350adab', '西安市第五医院', '2020-08-11 15:04:19', '2020-08-11 15:04:19', 1, '/public/avatar.png');
INSERT INTO `users` VALUES (7, 'user4', '126@163.com', '17444444444', 'a4140973bc717e3b057f2ad9a4214c0c', '五路口', '2020-08-11 15:04:19', '2020-08-11 15:04:19', 1, '/public/avatar.png');

SET FOREIGN_KEY_CHECKS = 0;





-- ----------------------------
-- Table structure for stores
-- ----------------------------
DROP TABLE IF EXISTS `stores`;
CREATE TABLE `stores`  (
  `store_id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `storename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '地址',
  `longitude` float(0) NOT NULL COMMENT '经度',
  `latitude` float(0) NOT NULL COMMENT '维度',
  `status` tinyint(1) NULL DEFAULT 1, 
  PRIMARY KEY (`store_id`) USING BTREE,
  INDEX `stores_ibfk_1`(`user_id`) USING BTREE,
  UNIQUE INDEX `storename`(`storename`) USING BTREE,
  UNIQUE INDEX `address`(`address`) USING BTREE,
  CONSTRAINT `stores_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stores
-- ----------------------------
INSERT INTO `stores` VALUES (1, 2, '长安区公安消防大队', '文化街108号附近', '108.943546', '34.157663', 1);
INSERT INTO `stores` VALUES (2, 2, '西安市消防救援支队雁塔西路消防救援站', '大雁塔街道雁塔西路223号', '108.942139', '34.218583', 1);
INSERT INTO `stores` VALUES (3, 3, '高新消防大队', '瞪羚路与丈八六路十字西南角金盾大厦6层', '108.855956', '34.201364', 1);
INSERT INTO `stores` VALUES (4, 3, '西安航天消防大队', '神州八路南200米', '108.996618', '34.150904', 1);





-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `order_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_req_id` int NOT NULL,
  `user_rev_id` int,
  `goods_id` bigint unsigned NOT NULL,
  `contact_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '联系人',
  `contact_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '联系电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '地址',
  `quantity` int(0) NOT NULL COMMENT '数量',
  `status` tinyint(0) DEFAULT 0  COMMENT '状态',  -- 0: not yet, 1: accepted, 2: completed 3: rejected
  `expected_at` datetime(0) NULL DEFAULT NULL COMMENT '到货日期',
  `created_at` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `orders_ibfk_1`(`user_rev_id`) USING BTREE,
  INDEX `orders_ibfk_2`(`user_req_id`) USING BTREE,
  INDEX `orders_ibfk_3`(`goods_id`) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_rev_id`) REFERENCES `stores` (`store_id`) ON DELETE RESTRICT ON UPDATE RESTRICT ,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`user_req_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1004 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '工单列表' ROW_FORMAT = Dynamic;

-- INSERT INTO `orders` VALUES (1,  '张三', '17111111111', '陕西省西安市三桥街道时代华城', 99, 0, '2022-04-13', '2021-04-15');

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `orders` VALUES (1,4, 2, 1, '张三', '17111111111', '陕西省西安市三桥街道时代华城', 20, 0, '2022-04-03', '2021-04-15');
INSERT INTO `orders` VALUES (2,4, 2, 2,'张三', '17111111111', '陕西省西安市三桥街道时代华城', 30,   1, '2022-04-13', '2021-04-15');
INSERT INTO `orders` VALUES (3,4, 2,3, '张三', '17111111111', '陕西省西安市三桥街道时代华城', 10,  2, '2022-04-15', '2021-04-15');
INSERT INTO `orders` VALUES (4,5, 2, 4,'李四', '17222222222', '汉城一号', 20, 0, '2022-04-13', '2021-04-15');
INSERT INTO `orders` VALUES (5,5, 3,5,  '韩梅梅', '17333333333', '车辆厂', 50,  0, '2022-04-13', '2021-04-15');
INSERT INTO `orders` VALUES (6, 6, 3,  6,'韩梅梅', '17333333333', '车辆厂', 10, 0, '2022-04-13', '2021-04-15');
INSERT INTO `orders` VALUES (7, 6, 3,  7,'李雷', '17444444444', '华润二十四城', 30, 0, '2022-04-13', '2021-04-15');
-- SET FOREIGN_KEY_CHECKS = 0;


-- ----------------------------
-- Table structure for stores
-- ----------------------------
DROP TABLE IF EXISTS `revs`;
CREATE TABLE `revs`  (
`order_id` bigint unsigned NOT NULL,
`store_id` int(0) NOT NULL, 
INDEX `revs_ibfk_1`(`order_id`) USING BTREE,
INDEX `revs_ibfk_2`(`store_id`) USING BTREE,
CONSTRAINT `revs_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders`(`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
CONSTRAINT `revs_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
PRIMARY KEY(`order_id`, `store_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 1004 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '工单列表' ROW_FORMAT = Dynamic;
