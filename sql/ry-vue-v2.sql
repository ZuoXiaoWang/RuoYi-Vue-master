/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.1.12_3306
 Source Server Type    : MySQL
 Source Server Version : 50742
 Source Host           : 192.168.1.30:3306
 Source Schema         : ry-vue-v2

 Target Server Type    : MySQL
 Target Server Version : 50742
 File Encoding         : 65001

 Date: 29/06/2023 19:05:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日历信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(20) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(20) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(20) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(20) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(20) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(20) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(20) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(20) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(20) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(20) NOT NULL COMMENT '开始时间',
  `end_time` bigint(20) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(6) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'sys_region', '123', NULL, NULL, 'SysRegion', 'crud', 'com.ruoyi.system', 'system', 'region', '123', 'ruoyi', '0', '/', '{\"parentMenuId\":1}', 'admin', '2023-06-20 08:05:07', '', '2023-06-20 08:06:12', NULL);
INSERT INTO `gen_table` VALUES (2, 'inspection_item_title', '', NULL, NULL, 'InspectionItemTitle', 'crud', 'com.ruoyi.system', 'system', 'title', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2023-06-27 06:51:53', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (3, 'inspection_item_title_value', '', NULL, NULL, 'InspectionItemTitleValue', 'crud', 'com.ruoyi.system', 'system', 'value', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2023-06-27 06:51:54', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (5, 'inspection_item', '', NULL, NULL, 'InspectionItem', 'crud', 'com.ruoyi.system', 'system', 'item', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2023-06-27 07:18:24', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (6, 'inspection_route', '', NULL, NULL, 'InspectionRoute', 'crud', 'com.ruoyi.system', 'system', 'route', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2023-06-28 07:32:17', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (7, 'inspection_route_point_rel', '', NULL, NULL, 'InspectionRoutePointRel', 'crud', 'com.ruoyi.system', 'system', 'rel', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2023-06-28 07:41:21', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, '1', 'region_id', '区域划分id', 'bigint(20)', 'Long', 'regionId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-06-20 08:05:07', '', '2023-06-20 08:06:12');
INSERT INTO `gen_table_column` VALUES (2, '1', 'name', '区域名称', 'varchar(255)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-06-20 08:05:07', '', '2023-06-20 08:06:12');
INSERT INTO `gen_table_column` VALUES (3, '1', 'region_longitude', '区域经度', 'decimal(20,10)', 'BigDecimal', 'regionLongitude', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-06-20 08:05:07', '', '2023-06-20 08:06:12');
INSERT INTO `gen_table_column` VALUES (4, '1', 'region_latitude', '区域纬度', 'decimal(20,10)', 'BigDecimal', 'regionLatitude', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-06-20 08:05:07', '', '2023-06-20 08:06:12');
INSERT INTO `gen_table_column` VALUES (5, '1', 'description', '描述', 'varchar(255)', 'String', 'description', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-06-20 08:05:07', '', '2023-06-20 08:06:12');
INSERT INTO `gen_table_column` VALUES (6, '1', 'parent_id', '上级区域id', 'bigint(20)', 'Long', 'parentId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-06-20 08:05:07', '', '2023-06-20 08:06:12');
INSERT INTO `gen_table_column` VALUES (7, '1', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, '1', 'EQ', 'input', '', 7, 'admin', '2023-06-20 08:05:07', '', '2023-06-20 08:06:12');
INSERT INTO `gen_table_column` VALUES (8, '1', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, '1', 'EQ', 'datetime', '', 8, 'admin', '2023-06-20 08:05:07', '', '2023-06-20 08:06:12');
INSERT INTO `gen_table_column` VALUES (9, '1', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2023-06-20 08:05:07', '', '2023-06-20 08:06:12');
INSERT INTO `gen_table_column` VALUES (10, '1', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2023-06-20 08:05:07', '', '2023-06-20 08:06:12');
INSERT INTO `gen_table_column` VALUES (11, '2', 'title_id', '主键ID', 'varchar(30)', 'String', 'titleId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-06-27 06:51:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (12, '2', 'item_id', '项目编号', 'varchar(30)', 'String', 'itemId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-06-27 06:51:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (13, '2', 'item_title', '名称', 'varchar(256)', 'String', 'itemTitle', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-06-27 06:51:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (14, '2', 'title_type', '题目类型 1001 单选 2002 多选 3003 简答题', 'varchar(12)', 'String', 'titleType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 4, 'admin', '2023-06-27 06:51:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (15, '2', 'community_id', '小区ID', 'varchar(30)', 'String', 'communityId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-06-27 06:51:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (16, '2', 'seq', '显示顺序', 'int(11)', 'Long', 'seq', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-06-27 06:51:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (17, '2', 'create_time', '创建时间', 'timestamp', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2023-06-27 06:51:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (18, '2', 'status_cd', '数据状态，详细参考c_status表，S 保存，0, 在用 1失效', 'varchar(2)', 'String', 'statusCd', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2023-06-27 06:51:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (19, '3', 'value_id', '主键ID', 'varchar(30)', 'String', 'valueId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-06-27 06:51:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (20, '3', 'title_id', '题目ID', 'varchar(30)', 'String', 'titleId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-06-27 06:51:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (21, '3', 'item_value', '选项说明', 'varchar(256)', 'String', 'itemValue', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-06-27 06:51:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (22, '3', 'community_id', '小区ID', 'varchar(30)', 'String', 'communityId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-06-27 06:51:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (23, '3', 'seq', '显示顺序', 'int(11)', 'Long', 'seq', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-06-27 06:51:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (24, '3', 'create_time', '创建时间', 'timestamp', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2023-06-27 06:51:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (25, '3', 'status_cd', '数据状态，详细参考c_status表，S 保存，0, 在用 1失效', 'varchar(2)', 'String', 'statusCd', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-06-27 06:51:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (34, '5', 'item_id', '主键ID', 'varchar(30)', 'String', 'itemId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-06-27 07:18:24', '', NULL);
INSERT INTO `gen_table_column` VALUES (35, '5', 'item_name', '巡检项目', 'varchar(256)', 'String', 'itemName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-06-27 07:18:24', '', NULL);
INSERT INTO `gen_table_column` VALUES (36, '5', 'community_id', '小区ID', 'varchar(30)', 'String', 'communityId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-06-27 07:18:24', '', NULL);
INSERT INTO `gen_table_column` VALUES (37, '5', 'remark', '备注', 'varchar(512)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 4, 'admin', '2023-06-27 07:18:24', '', NULL);
INSERT INTO `gen_table_column` VALUES (38, '5', 'status_cd', '数据状态，详细参考c_status表，S 保存，0, 在用 1失效', 'varchar(2)', 'String', 'statusCd', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-06-27 07:18:24', '', NULL);
INSERT INTO `gen_table_column` VALUES (39, '5', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2023-06-27 07:18:24', '', NULL);
INSERT INTO `gen_table_column` VALUES (40, '5', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2023-06-27 07:18:24', '', NULL);
INSERT INTO `gen_table_column` VALUES (41, '5', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2023-06-27 07:18:24', '', NULL);
INSERT INTO `gen_table_column` VALUES (42, '5', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2023-06-27 07:18:24', '', NULL);
INSERT INTO `gen_table_column` VALUES (43, '6', 'inspection_route_id', 'Route_ID', 'varchar(30)', 'String', 'inspectionRouteId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-06-28 07:32:17', '', '2023-06-28 07:41:15');
INSERT INTO `gen_table_column` VALUES (45, '6', 'route_name', '路线名称', 'varchar(100)', 'String', 'routeName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-06-28 07:32:17', '', '2023-06-28 07:41:15');
INSERT INTO `gen_table_column` VALUES (46, '6', 'region_id', '小区ID', 'varchar(30)', 'Long', 'regionId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-06-28 07:32:17', '', '2023-06-28 07:41:15');
INSERT INTO `gen_table_column` VALUES (47, '6', 'seq', '路线顺序', 'varchar(100)', 'String', 'seq', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-06-28 07:32:17', '', '2023-06-28 07:41:15');
INSERT INTO `gen_table_column` VALUES (48, '6', 'remark', '备注说明', 'varchar(200)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 5, 'admin', '2023-06-28 07:32:17', '', '2023-06-28 07:41:15');
INSERT INTO `gen_table_column` VALUES (49, '6', 'create_time', '创建时间', 'timestamp', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2023-06-28 07:32:17', '', '2023-06-28 07:41:15');
INSERT INTO `gen_table_column` VALUES (50, '6', 'status_cd', '数据状态', 'varchar(30)', 'String', 'statusCd', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-06-28 07:32:17', '', '2023-06-28 07:41:15');
INSERT INTO `gen_table_column` VALUES (51, '6', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, '', '2023-06-28 07:41:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (52, '6', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 9, '', '2023-06-28 07:41:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (53, '6', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 10, '', '2023-06-28 07:41:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (54, '7', 'irp_rel_id', 'inspection_route and point relation ID', 'varchar(30)', 'String', 'irpRelId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-06-28 07:41:21', '', '2023-06-28 07:41:24');
INSERT INTO `gen_table_column` VALUES (55, '7', 'inspection_route_id', '路线ID', 'varchar(30)', 'String', 'inspectionRouteId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-06-28 07:41:21', '', '2023-06-28 07:41:24');
INSERT INTO `gen_table_column` VALUES (56, '7', 'inspection_id', '巡检点ID', 'varchar(30)', 'String', 'inspectionId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-06-28 07:41:21', '', '2023-06-28 07:41:24');
INSERT INTO `gen_table_column` VALUES (57, '7', 'region_id', '小区ID', 'bigint(20)', 'Long', 'regionId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-06-28 07:41:21', '', '2023-06-28 07:41:24');
INSERT INTO `gen_table_column` VALUES (58, '7', 'status_cd', '数据状态', 'varchar(30)', 'String', 'statusCd', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-06-28 07:41:21', '', '2023-06-28 07:41:24');
INSERT INTO `gen_table_column` VALUES (59, '7', 'point_start_time', '巡检点开始时间', 'varchar(20)', 'String', 'pointStartTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-06-28 07:41:21', '', '2023-06-28 07:41:24');
INSERT INTO `gen_table_column` VALUES (60, '7', 'point_end_time', '巡检点结束时间', 'varchar(20)', 'String', 'pointEndTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-06-28 07:41:21', '', '2023-06-28 07:41:24');
INSERT INTO `gen_table_column` VALUES (61, '7', 'sort_number', '排序', 'int(11)', 'Long', 'sortNumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2023-06-28 07:41:21', '', '2023-06-28 07:41:24');
INSERT INTO `gen_table_column` VALUES (62, '7', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2023-06-28 07:41:21', '', '2023-06-28 07:41:24');
INSERT INTO `gen_table_column` VALUES (63, '7', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2023-06-28 07:41:21', '', '2023-06-28 07:41:24');
INSERT INTO `gen_table_column` VALUES (64, '7', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2023-06-28 07:41:21', '', '2023-06-28 07:41:24');
INSERT INTO `gen_table_column` VALUES (65, '7', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2023-06-28 07:41:21', '', '2023-06-28 07:41:24');

-- ----------------------------
-- Table structure for inspection_item
-- ----------------------------
DROP TABLE IF EXISTS `inspection_item`;
CREATE TABLE `inspection_item`  (
  `item_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `item_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '巡检项目',
  `region_id` bigint(20) NOT NULL COMMENT '小区ID',
  `remark` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status_cd` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '数据状态，详细参考c_status表，S 保存，0, 在用 1失效',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`item_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of inspection_item
-- ----------------------------
INSERT INTO `inspection_item` VALUES ('99057be4-cbc2-4274-ba61-0845ce624175', '测试项目', 1, '测试备注123', '0', '', '2023-06-29 18:04:54', '', NULL);

-- ----------------------------
-- Table structure for inspection_item_title
-- ----------------------------
DROP TABLE IF EXISTS `inspection_item_title`;
CREATE TABLE `inspection_item_title`  (
  `title_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `item_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目编号',
  `item_title` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `title_type` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '题目类型 1001 单选 2002 多选 3003 简答题',
  `region_id` bigint(20) NOT NULL COMMENT '小区ID',
  `seq` int(11) NOT NULL DEFAULT 1 COMMENT '显示顺序',
  `status_cd` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '数据状态，详细参考c_status表，S 保存，0, 在用 1失效',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`title_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of inspection_item_title
-- ----------------------------

-- ----------------------------
-- Table structure for inspection_item_title_value
-- ----------------------------
DROP TABLE IF EXISTS `inspection_item_title_value`;
CREATE TABLE `inspection_item_title_value`  (
  `value_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `title_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '题目ID',
  `item_value` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '选项说明',
  `region_id` bigint(20) NOT NULL COMMENT '小区ID',
  `seq` int(11) NOT NULL DEFAULT 1 COMMENT '显示顺序',
  `status_cd` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '数据状态，详细参考c_status表，S 保存，0, 在用 1失效',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`value_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of inspection_item_title_value
-- ----------------------------

-- ----------------------------
-- Table structure for inspection_route
-- ----------------------------
DROP TABLE IF EXISTS `inspection_route`;
CREATE TABLE `inspection_route`  (
  `inspection_route_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Route_ID',
  `route_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '路线名称',
  `region_id` bigint(20) NOT NULL COMMENT '小区ID',
  `seq` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '路线顺序',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注说明',
  `status_cd` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '数据状态',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  UNIQUE INDEX `inspection_route_id`(`inspection_route_id`) USING BTREE,
  INDEX `idx_inspection_inspection_route_id`(`inspection_route_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of inspection_route
-- ----------------------------
INSERT INTO `inspection_route` VALUES ('202741f8-60ed-4a28-8b36-ed481268b91f', 'ceshi', 1, '1', '巡更路线', '0', '2023-06-29 10:17:25', '', '', NULL);
INSERT INTO `inspection_route` VALUES ('eae982f5-1a51-42a1-85f6-68795029f9ae', '测试路线', 1, '1', '测试巡更点位', '0', '2023-06-29 15:22:44', '', '', NULL);

-- ----------------------------
-- Table structure for inspection_route_point_rel
-- ----------------------------
DROP TABLE IF EXISTS `inspection_route_point_rel`;
CREATE TABLE `inspection_route_point_rel`  (
  `irp_rel_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'inspection_route and point relation ID',
  `inspection_route_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '路线ID',
  `patrol_point_id` bigint(20) NOT NULL COMMENT '巡更点ID',
  `region_id` bigint(20) NOT NULL COMMENT '小区ID',
  `status_cd` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '数据状态',
  `point_start_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '巡检点开始时间',
  `point_end_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '巡检点结束时间',
  `sort_number` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  UNIQUE INDEX `irp_rel_id`(`irp_rel_id`) USING BTREE,
  INDEX `idx_b_inspection_inspection_route_point_id`(`irp_rel_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of inspection_route_point_rel
-- ----------------------------
INSERT INTO `inspection_route_point_rel` VALUES ('16ee758e-f738-4378-bc56-97c2fdd1f836', 'eae982f5-1a51-42a1-85f6-68795029f9ae', 4, 1, '0', NULL, NULL, NULL, '2023-06-29 07:51:09', '', '', NULL);
INSERT INTO `inspection_route_point_rel` VALUES ('826172b3-191f-4cc3-92e0-900265d6806c', 'eae982f5-1a51-42a1-85f6-68795029f9ae', 5, 1, '0', NULL, NULL, NULL, '2023-06-29 07:51:09', '', '', NULL);
INSERT INTO `inspection_route_point_rel` VALUES ('919edeee-a8d0-45df-a2a7-e7f405169d38', 'eae982f5-1a51-42a1-85f6-68795029f9ae', 3, 1, '0', NULL, NULL, NULL, '2023-06-29 07:51:09', '', '', NULL);

-- ----------------------------
-- Table structure for new_area
-- ----------------------------
DROP TABLE IF EXISTS `new_area`;
CREATE TABLE `new_area`  (
  `area_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '区域id',
  `area_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '区域名称',
  `area_value` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '区域值',
  PRIMARY KEY (`area_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of new_area
-- ----------------------------
INSERT INTO `new_area` VALUES (8, '业户区域', '0');
INSERT INTO `new_area` VALUES (9, '公共区域', '1');

-- ----------------------------
-- Table structure for new_evaluate
-- ----------------------------
DROP TABLE IF EXISTS `new_evaluate`;
CREATE TABLE `new_evaluate`  (
  `evaluate_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评价id',
  `evaluate` double(2, 1) NULL DEFAULT NULL COMMENT '评价',
  `describe` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `region_id` bigint(20) NOT NULL COMMENT '区域id',
  PRIMARY KEY (`evaluate_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of new_evaluate
-- ----------------------------

-- ----------------------------
-- Table structure for new_evaluate_repair
-- ----------------------------
DROP TABLE IF EXISTS `new_evaluate_repair`;
CREATE TABLE `new_evaluate_repair`  (
  `evaluate_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评价编号',
  `new_repair_id` bigint(20) NOT NULL COMMENT '维修编号',
  PRIMARY KEY (`evaluate_id`, `new_repair_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of new_evaluate_repair
-- ----------------------------

-- ----------------------------
-- Table structure for new_repair
-- ----------------------------
DROP TABLE IF EXISTS `new_repair`;
CREATE TABLE `new_repair`  (
  `new_repair_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '维修单id',
  `location` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '维修位置',
  `describe` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '维修描述',
  `regional_classification` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域分类',
  `maintenance_classification` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '维修分类',
  `state` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `paid_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `region_id` bigint(20) NOT NULL COMMENT '区域id',
  PRIMARY KEY (`new_repair_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of new_repair
-- ----------------------------

-- ----------------------------
-- Table structure for new_repair_from
-- ----------------------------
DROP TABLE IF EXISTS `new_repair_from`;
CREATE TABLE `new_repair_from`  (
  `repair_from_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '报修单id',
  `location` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报修位置',
  `describe` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报修描述',
  `regional_classification` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域分类',
  `maintenance_classification` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '维修分类',
  `state` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `paid_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `region_id` bigint(20) NOT NULL COMMENT '区域id',
  PRIMARY KEY (`repair_from_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of new_repair_from
-- ----------------------------
INSERT INTO `new_repair_from` VALUES (69, '河北蝉智测试用', '河北蝉智测试用', '1', '1', '0', '0', NULL, '', '2023-06-14 11:03:25', '', NULL, 1);
INSERT INTO `new_repair_from` VALUES (70, '蝉智科技测试用', '蝉智科技测试用', '0', '0', '0', '0', NULL, '', '2023-06-14 11:07:14', '', NULL, 1);
INSERT INTO `new_repair_from` VALUES (71, '蝉智科技测试3', '蝉智科技测试3', '0', '0', '0', '0', NULL, '', '2023-06-14 11:16:20', '', NULL, 1);
INSERT INTO `new_repair_from` VALUES (72, '蝉智科技测试4', '蝉智科技测试4', '0', '0', '0', '0', NULL, '', '2023-06-14 11:19:12', '', NULL, 1);
INSERT INTO `new_repair_from` VALUES (73, '蝉智科技测试用5', '蝉智科技测试用5', '0', '0', '0', '0', NULL, '', '2023-06-24 11:23:38', '', NULL, 1);

-- ----------------------------
-- Table structure for new_repair_from_img
-- ----------------------------
DROP TABLE IF EXISTS `new_repair_from_img`;
CREATE TABLE `new_repair_from_img`  (
  `img_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '图片编号',
  `new_repair_from_id` bigint(20) NOT NULL COMMENT '报修编号',
  `img_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  PRIMARY KEY (`img_id`, `new_repair_from_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of new_repair_from_img
-- ----------------------------
INSERT INTO `new_repair_from_img` VALUES (67, 69, '/profile/upload/2023/06/14/tmp_cc7cd2d0c10390349588613e5f1c142d_20230614110322A001.jpg');
INSERT INTO `new_repair_from_img` VALUES (68, 70, '/profile/upload/2023/06/14/tmp_12c5f54ef60ddb836c1bc01be1c96a7a_20230614110713A002.jpg');
INSERT INTO `new_repair_from_img` VALUES (69, 71, '/profile/upload/2023/06/14/tmp_d6840b3d9424cec04eef2eac968401c1_20230614111618A003.jpg');
INSERT INTO `new_repair_from_img` VALUES (70, 72, '/profile/upload/2023/06/14/tmp_adb178d0b5366bc2591fbdbbd925333e_20230614111908A002.jpg');
INSERT INTO `new_repair_from_img` VALUES (71, 73, '/profile/upload/2023/06/14/tmp_fa6ee79748c790e2a3c6835141ad44bc_20230614112335A001.jpg');

-- ----------------------------
-- Table structure for new_repair_from_personnel
-- ----------------------------
DROP TABLE IF EXISTS `new_repair_from_personnel`;
CREATE TABLE `new_repair_from_personnel`  (
  `new_repair_from_id` bigint(20) NOT NULL COMMENT '维修编号',
  `personnel_id` bigint(20) NOT NULL COMMENT '员工编号',
  PRIMARY KEY (`new_repair_from_id`, `personnel_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of new_repair_from_personnel
-- ----------------------------
INSERT INTO `new_repair_from_personnel` VALUES (69, 28);
INSERT INTO `new_repair_from_personnel` VALUES (70, 28);
INSERT INTO `new_repair_from_personnel` VALUES (71, 28);
INSERT INTO `new_repair_from_personnel` VALUES (72, 28);
INSERT INTO `new_repair_from_personnel` VALUES (73, 28);

-- ----------------------------
-- Table structure for new_repair_img
-- ----------------------------
DROP TABLE IF EXISTS `new_repair_img`;
CREATE TABLE `new_repair_img`  (
  `img_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '图片编号',
  `new_repair_id` bigint(20) NOT NULL COMMENT '维修编号',
  `img_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  PRIMARY KEY (`img_id`, `new_repair_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of new_repair_img
-- ----------------------------

-- ----------------------------
-- Table structure for new_repair_personnel
-- ----------------------------
DROP TABLE IF EXISTS `new_repair_personnel`;
CREATE TABLE `new_repair_personnel`  (
  `new_repair_id` bigint(20) NOT NULL COMMENT '维修编号',
  `personnel_id` bigint(20) NOT NULL COMMENT '员工编号',
  PRIMARY KEY (`new_repair_id`, `personnel_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of new_repair_personnel
-- ----------------------------

-- ----------------------------
-- Table structure for new_repair_repair_from
-- ----------------------------
DROP TABLE IF EXISTS `new_repair_repair_from`;
CREATE TABLE `new_repair_repair_from`  (
  `new_repair_id` bigint(20) NOT NULL COMMENT '维修单id',
  `new_repair_from_id` bigint(20) NOT NULL COMMENT '报修单id',
  PRIMARY KEY (`new_repair_id`, `new_repair_from_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of new_repair_repair_from
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-03-24 14:39:21', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-03-24 14:39:21', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-03-24 14:39:21', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2023-03-24 14:39:22', 'admin', '2023-05-12 17:49:35', '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2023-03-24 14:39:22', 'admin', '2023-05-12 17:53:13', '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2023-03-24 14:39:22', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 207 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '物业', 0, '张', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-24 14:38:46', 'admin', '2023-04-12 09:40:20');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-03-24 14:38:46', 'admin', '2023-04-12 09:40:37');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-03-24 14:38:46', 'admin', '2023-04-12 09:40:43');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-03-24 14:38:46', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-03-24 14:38:46', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-03-24 14:38:46', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-03-24 14:38:47', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-03-24 14:38:47', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-03-24 14:38:47', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-03-24 14:38:47', '', NULL);
INSERT INTO `sys_dept` VALUES (200, 100, '0,100', '安保部', 2, '张三', '15303380776', NULL, '0', '0', 'wuyexungen', '2023-04-13 10:10:45', '', NULL);
INSERT INTO `sys_dept` VALUES (201, 100, '0,100', '客服部', 3, NULL, NULL, NULL, '0', '0', 'wuyexungen', '2023-04-13 15:37:58', '', NULL);
INSERT INTO `sys_dept` VALUES (202, 100, '0,100', '后台运维', 9, NULL, NULL, NULL, '0', '2', 'wuyexungen', '2023-04-13 15:42:13', 'admin', '2023-04-13 15:45:08');
INSERT INTO `sys_dept` VALUES (203, 100, '0,100', '工程部', 4, NULL, NULL, NULL, '0', '0', 'wuyexungen', '2023-04-13 15:43:41', '', NULL);
INSERT INTO `sys_dept` VALUES (204, 100, '0,100', '电梯维保部', 5, NULL, NULL, NULL, '0', '0', 'wuyexungen', '2023-04-13 15:43:54', '', NULL);
INSERT INTO `sys_dept` VALUES (205, 100, '0,100', '保洁部', 6, NULL, NULL, NULL, '0', '0', 'wuyexungen', '2023-04-13 15:44:59', 'admin', '2023-05-14 15:15:44');
INSERT INTO `sys_dept` VALUES (206, 100, '0,100', '维修部', 7, NULL, NULL, NULL, '0', '0', 'wuyexungen', '2023-05-14 15:15:31', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(11) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 125 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-03-24 14:39:17', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-03-24 14:39:17', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-03-24 14:39:17', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-03-24 14:39:17', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-03-24 14:39:17', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-03-24 14:39:17', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-03-24 14:39:18', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-03-24 14:39:18', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-03-24 14:39:18', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-03-24 14:39:18', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-03-24 14:39:18', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-03-24 14:39:18', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-03-24 14:39:18', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-03-24 14:39:19', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-03-24 14:39:19', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-03-24 14:39:19', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-03-24 14:39:19', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-03-24 14:39:19', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-03-24 14:39:19', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-03-24 14:39:19', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-03-24 14:39:19', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-03-24 14:39:20', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-03-24 14:39:20', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-03-24 14:39:20', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-03-24 14:39:20', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-03-24 14:39:20', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-03-24 14:39:20', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-03-24 14:39:20', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-03-24 14:39:20', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, '在职', '0', 'sys_staff_status', NULL, 'default', 'N', '0', 'admin', '2023-03-27 09:51:56', '', NULL, '员工在职');
INSERT INTO `sys_dict_data` VALUES (101, 2, '离职', '1', 'sys_staff_status', NULL, 'default', 'N', '0', 'admin', '2023-03-27 09:52:13', '', NULL, '员工离职');
INSERT INTO `sys_dict_data` VALUES (102, 1, '未开始', '0', 'sys_patrol_status', NULL, 'danger', 'N', '0', 'admin', '2023-03-30 16:57:39', 'admin', '2023-05-11 11:28:34', NULL);
INSERT INTO `sys_dict_data` VALUES (103, 2, '进行中', '1', 'sys_patrol_status', NULL, 'warning', 'N', '0', 'admin', '2023-03-30 16:57:53', 'admin', '2023-05-11 11:28:48', NULL);
INSERT INTO `sys_dict_data` VALUES (104, 3, '已完成', '2', 'sys_patrol_status', NULL, 'success', 'N', '0', 'admin', '2023-03-30 16:58:08', 'admin', '2023-05-11 11:28:53', NULL);
INSERT INTO `sys_dict_data` VALUES (105, 1, '正常', '0', 'sys_patrol_result', NULL, 'default', 'N', '0', 'admin', '2023-03-30 17:19:27', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (106, 2, '异常', '1', 'sys_patrol_result', NULL, 'default', 'N', '0', 'admin', '2023-03-30 17:19:38', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (107, 1, '已处理', '0', 'sys_repair_order_status', NULL, 'default', 'N', '0', 'admin', '2023-03-30 17:47:29', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (108, 2, '未处理', '1', 'sys_repair_order_status', NULL, 'default', 'N', '0', 'admin', '2023-03-30 17:47:36', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (109, 0, '园区', '0', 'regional_classification', NULL, 'default', 'N', '0', 'admin', '2023-05-13 10:41:30', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (110, 1, '非园区', '1', 'regional_classification', NULL, 'default', 'N', '0', 'admin', '2023-05-13 10:41:43', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (111, 0, '水电', '0', 'maintenance_classification', NULL, 'default', 'N', '0', 'admin', '2023-05-13 10:42:59', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (112, 1, '综合', '1', 'maintenance_classification', NULL, 'default', 'N', '0', 'admin', '2023-05-13 10:43:09', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (113, 0, '无偿维修', '0', 'paid_type', NULL, 'default', 'N', '0', 'admin', '2023-05-13 10:44:48', 'admin', '2023-05-13 10:45:18', NULL);
INSERT INTO `sys_dict_data` VALUES (114, 1, '有偿维修', '1', 'paid_type', NULL, 'default', 'N', '0', 'admin', '2023-05-13 10:45:51', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (115, 0, '开始维修', '0', 'repair_type', NULL, 'default', 'N', '0', 'admin', '2023-05-13 10:47:50', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (116, 1, '待料维修', '1', 'repair_type', NULL, 'default', 'N', '0', 'admin', '2023-05-13 10:48:03', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (117, 2, '上报无法处理', '2', 'repair_type', NULL, 'default', 'N', '0', 'admin', '2023-05-13 10:48:18', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (118, 3, '已开始', '3', 'repair_type', NULL, 'default', 'N', '0', 'admin', '2023-05-13 11:02:10', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (119, 4, '未开始', '4', 'repair_type', NULL, 'default', 'N', '0', 'admin', '2023-05-13 11:02:23', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (120, 5, '已结束', '5', 'repair_type', NULL, 'default', 'N', '0', 'admin', '2023-05-13 11:02:38', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (121, 0, '未开始', '0', 'repair_from_state', NULL, 'default', 'N', '0', 'admin', '2023-05-13 11:04:50', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (122, 1, '进行中', '1', 'repair_from_state', NULL, 'default', 'N', '0', 'admin', '2023-05-13 11:05:04', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (123, 2, '已结束', '2', 'repair_from_state', NULL, 'default', 'N', '0', 'admin', '2023-05-13 11:05:13', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (124, 4, '已过期', '3', 'sys_patrol_status', NULL, 'info', 'N', '0', 'admin', '2023-06-09 06:50:20', 'admin', '2023-06-09 06:50:30', NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-03-24 14:39:15', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-03-24 14:39:15', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-03-24 14:39:15', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-03-24 14:39:16', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-03-24 14:39:16', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-03-24 14:39:16', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-03-24 14:39:16', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-03-24 14:39:16', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-03-24 14:39:16', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-03-24 14:39:16', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '员工状态', 'sys_staff_status', '0', 'admin', '2023-03-27 09:49:38', 'admin', '2023-03-27 09:51:29', '员工状态列表\n');
INSERT INTO `sys_dict_type` VALUES (101, '巡更/维修任务状态', 'sys_patrol_status', '0', 'admin', '2023-03-30 16:57:10', 'admin', '2023-03-30 17:20:01', '巡更/维修任务状态');
INSERT INTO `sys_dict_type` VALUES (102, '巡更结果', 'sys_patrol_result', '0', 'admin', '2023-03-30 17:19:10', 'admin', '2023-03-30 17:19:51', '巡更结果');
INSERT INTO `sys_dict_type` VALUES (103, '报修工单状态', 'sys_repair_order_status', '0', 'admin', '2023-03-30 17:47:14', '', NULL, '报修工单状态');
INSERT INTO `sys_dict_type` VALUES (104, '报修/维修区域', 'regional_classification', '0', 'admin', '2023-05-13 10:40:39', 'admin', '2023-05-13 10:43:29', '');
INSERT INTO `sys_dict_type` VALUES (105, '维修/报修类型分类', 'maintenance_classification', '0', 'admin', '2023-05-13 10:42:42', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (106, '是否有偿维修', 'paid_type', '0', 'admin', '2023-05-13 10:44:19', 'admin', '2023-05-13 10:46:51', NULL);
INSERT INTO `sys_dict_type` VALUES (107, '维修任务的状态', 'repair_type', '0', 'admin', '2023-05-13 10:47:26', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (108, '报修单状态', 'repair_from_state', '0', 'admin', '2023-05-13 11:04:34', 'admin', '2023-05-13 11:05:28', NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注信息',
  `region_id` bigint(20) NULL DEFAULT NULL COMMENT '区域id',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (10, '测试1', 'DEFAULT', 'ryTask.creatPatrolTask(282L)', '0 36 9 * * ?', '3', '1', '1', 'admin', '2023-05-04 14:40:57', 'admin', '2023-06-13 16:19:30', '', 1);
INSERT INTO `sys_job` VALUES (14, '冀登芳(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(296L)', '0 0 1 ? * 2', '3', '1', '0', 'admin', '2023-05-05 15:49:30', '18032139488', '2023-06-14 11:29:39', '', 1);
INSERT INTO `sys_job` VALUES (15, '刘春娟(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(297L)', '0 0 1 ? * 2', '3', '1', '0', 'admin', '2023-05-05 15:52:45', '18032139488', '2023-06-14 11:29:49', '', 1);
INSERT INTO `sys_job` VALUES (16, '柳娜(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(298L)', '0 0 1 ? * 2', '3', '1', '0', 'admin', '2023-05-05 16:05:22', '18032139488', '2023-06-14 11:30:05', '', 1);
INSERT INTO `sys_job` VALUES (17, '徐苗苗(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(299L)', '0 0 1 ? * 2', '3', '1', '0', 'admin', '2023-05-05 16:06:33', '18032139488', '2023-06-14 11:30:14', '', 1);
INSERT INTO `sys_job` VALUES (18, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '0 0 1 * * ?', '3', '1', '0', 'admin', '2023-05-05 16:10:39', 'admin', '2023-06-13 16:57:32', '', 1);
INSERT INTO `sys_job` VALUES (19, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '0 0 1 * * ?', '3', '1', '0', 'admin', '2023-05-05 16:12:16', 'admin', '2023-06-13 16:57:21', '', 1);
INSERT INTO `sys_job` VALUES (20, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '0 0 1 * * ?', '3', '1', '0', 'admin', '2023-05-05 16:14:13', 'admin', '2023-06-14 09:39:23', '', 1);
INSERT INTO `sys_job` VALUES (21, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '0 0 1 * * ?', '3', '1', '0', 'admin', '2023-05-05 16:15:38', 'admin', '2023-06-14 09:40:03', '', 1);
INSERT INTO `sys_job` VALUES (22, '王建国(每半月)', 'DEFAULT', 'ryTask.creatPatrolTask(304L)', '0 0 1 1,16 * ?', '3', '1', '0', 'admin', '2023-05-05 16:16:52', '18032139488', '2023-06-14 11:30:35', '', 1);
INSERT INTO `sys_job` VALUES (23, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '0 0 1 * * ?', '3', '1', '0', 'admin', '2023-05-05 16:44:17', 'admin', '2023-06-13 17:01:16', '', 1);
INSERT INTO `sys_job` VALUES (24, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '0 0 1 * * ?', '3', '1', '0', 'admin', '2023-05-05 16:45:59', 'admin', '2023-06-13 17:01:35', '', 1);
INSERT INTO `sys_job` VALUES (25, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '0 0 1 * * ?', '3', '1', '0', 'admin', '2023-05-05 16:47:43', 'admin', '2023-06-13 17:00:36', '', 1);
INSERT INTO `sys_job` VALUES (26, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '0 0 1 * * ?', '3', '1', '0', 'admin', '2023-05-05 16:48:42', 'admin', '2023-06-14 09:08:04', '', 1);
INSERT INTO `sys_job` VALUES (27, '测试(夏)', 'DEFAULT', 'ryTask.creatPatrolTask(322L)', '0 0 0 1 * ?', '3', '1', '1', 'admin', '2023-05-07 09:55:20', '', NULL, '', 1);
INSERT INTO `sys_job` VALUES (32, '焦祁亮（每半月）', 'DEFAULT', 'ryTask.creatPatrolTask(329L)', '0 0 1 1,16 * ?', '3', '1', '0', 'wuyexungen', '2023-05-08 17:05:07', '18032139488', '2023-06-14 11:30:53', '', 1);
INSERT INTO `sys_job` VALUES (33, '高志标（每周一次）隔油池', 'DEFAULT', 'ryTask.creatPatrolTask(379L)', '0 0 1 ? * 2', '3', '1', '0', 'admin', '2023-05-09 08:51:21', '18032139488', '2023-06-14 11:31:04', '', 1);

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 667 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
INSERT INTO `sys_job_log` VALUES (1, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：239毫秒', '0', '', '2023-04-28 11:22:21');
INSERT INTO `sys_job_log` VALUES (2, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：103毫秒', '0', '', '2023-04-28 11:22:21');
INSERT INTO `sys_job_log` VALUES (3, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：108毫秒', '0', '', '2023-04-28 11:22:21');
INSERT INTO `sys_job_log` VALUES (4, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：132毫秒', '0', '', '2023-04-28 11:22:22');
INSERT INTO `sys_job_log` VALUES (5, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：266毫秒', '0', '', '2023-04-28 11:22:22');
INSERT INTO `sys_job_log` VALUES (6, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：368毫秒', '0', '', '2023-04-28 11:22:23');
INSERT INTO `sys_job_log` VALUES (7, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：216毫秒', '0', '', '2023-04-28 11:22:23');
INSERT INTO `sys_job_log` VALUES (8, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：171毫秒', '0', '', '2023-04-28 11:22:23');
INSERT INTO `sys_job_log` VALUES (9, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：177毫秒', '0', '', '2023-04-28 11:22:47');
INSERT INTO `sys_job_log` VALUES (10, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：526毫秒', '0', '', '2023-04-28 11:22:48');
INSERT INTO `sys_job_log` VALUES (11, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：154毫秒', '0', '', '2023-04-28 11:22:48');
INSERT INTO `sys_job_log` VALUES (12, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：139毫秒', '0', '', '2023-04-28 11:22:48');
INSERT INTO `sys_job_log` VALUES (13, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：116毫秒', '0', '', '2023-04-28 11:22:48');
INSERT INTO `sys_job_log` VALUES (14, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：117毫秒', '0', '', '2023-04-28 11:22:49');
INSERT INTO `sys_job_log` VALUES (15, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：149毫秒', '0', '', '2023-04-28 11:22:49');
INSERT INTO `sys_job_log` VALUES (16, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：154毫秒', '0', '', '2023-04-28 11:22:51');
INSERT INTO `sys_job_log` VALUES (17, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：158毫秒', '0', '', '2023-04-28 11:22:52');
INSERT INTO `sys_job_log` VALUES (18, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：120毫秒', '0', '', '2023-04-28 11:22:52');
INSERT INTO `sys_job_log` VALUES (19, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：459毫秒', '0', '', '2023-04-28 11:22:52');
INSERT INTO `sys_job_log` VALUES (20, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：249毫秒', '0', '', '2023-04-28 11:22:53');
INSERT INTO `sys_job_log` VALUES (21, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：242毫秒', '0', '', '2023-04-28 11:22:53');
INSERT INTO `sys_job_log` VALUES (22, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：222毫秒', '0', '', '2023-04-28 11:23:40');
INSERT INTO `sys_job_log` VALUES (23, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：299毫秒', '0', '', '2023-04-28 11:23:40');
INSERT INTO `sys_job_log` VALUES (24, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：215毫秒', '0', '', '2023-04-28 11:23:41');
INSERT INTO `sys_job_log` VALUES (25, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：191毫秒', '0', '', '2023-04-28 11:23:41');
INSERT INTO `sys_job_log` VALUES (26, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：123毫秒', '0', '', '2023-04-28 11:23:41');
INSERT INTO `sys_job_log` VALUES (27, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：173毫秒', '0', '', '2023-04-28 11:23:42');
INSERT INTO `sys_job_log` VALUES (28, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：156毫秒', '0', '', '2023-04-28 11:23:42');
INSERT INTO `sys_job_log` VALUES (29, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：116毫秒', '0', '', '2023-04-28 11:23:42');
INSERT INTO `sys_job_log` VALUES (30, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：134毫秒', '0', '', '2023-04-28 11:23:42');
INSERT INTO `sys_job_log` VALUES (31, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：109毫秒', '0', '', '2023-04-28 11:23:43');
INSERT INTO `sys_job_log` VALUES (32, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：125毫秒', '0', '', '2023-04-28 11:23:43');
INSERT INTO `sys_job_log` VALUES (33, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：116毫秒', '0', '', '2023-04-28 11:23:43');
INSERT INTO `sys_job_log` VALUES (34, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：149毫秒', '0', '', '2023-04-28 11:23:43');
INSERT INTO `sys_job_log` VALUES (35, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：108毫秒', '0', '', '2023-04-28 11:23:43');
INSERT INTO `sys_job_log` VALUES (36, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：167毫秒', '0', '', '2023-04-28 11:23:44');
INSERT INTO `sys_job_log` VALUES (37, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：131毫秒', '0', '', '2023-04-28 11:23:44');
INSERT INTO `sys_job_log` VALUES (38, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：134毫秒', '0', '', '2023-04-28 11:23:44');
INSERT INTO `sys_job_log` VALUES (39, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：195毫秒', '0', '', '2023-04-28 11:39:58');
INSERT INTO `sys_job_log` VALUES (40, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：234毫秒', '0', '', '2023-04-28 11:39:58');
INSERT INTO `sys_job_log` VALUES (41, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：162毫秒', '0', '', '2023-04-28 11:39:59');
INSERT INTO `sys_job_log` VALUES (42, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：208毫秒', '0', '', '2023-04-28 11:39:59');
INSERT INTO `sys_job_log` VALUES (43, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：107毫秒', '0', '', '2023-04-28 11:40:00');
INSERT INTO `sys_job_log` VALUES (44, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：113毫秒', '0', '', '2023-04-28 11:40:00');
INSERT INTO `sys_job_log` VALUES (45, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：123毫秒', '0', '', '2023-04-28 11:40:01');
INSERT INTO `sys_job_log` VALUES (46, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：175毫秒', '0', '', '2023-04-28 11:40:01');
INSERT INTO `sys_job_log` VALUES (47, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：166毫秒', '0', '', '2023-04-28 11:40:02');
INSERT INTO `sys_job_log` VALUES (48, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：233毫秒', '0', '', '2023-04-28 11:40:02');
INSERT INTO `sys_job_log` VALUES (49, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：101毫秒', '0', '', '2023-04-28 11:40:03');
INSERT INTO `sys_job_log` VALUES (50, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：142毫秒', '0', '', '2023-04-28 11:40:03');
INSERT INTO `sys_job_log` VALUES (51, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：93毫秒', '0', '', '2023-04-28 11:40:04');
INSERT INTO `sys_job_log` VALUES (52, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：105毫秒', '0', '', '2023-04-28 11:40:04');
INSERT INTO `sys_job_log` VALUES (53, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：136毫秒', '0', '', '2023-04-28 11:40:05');
INSERT INTO `sys_job_log` VALUES (54, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：167毫秒', '0', '', '2023-04-28 11:40:05');
INSERT INTO `sys_job_log` VALUES (55, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：98毫秒', '0', '', '2023-04-28 11:40:06');
INSERT INTO `sys_job_log` VALUES (56, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：110毫秒', '0', '', '2023-04-28 11:40:06');
INSERT INTO `sys_job_log` VALUES (57, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：95毫秒', '0', '', '2023-04-28 11:40:07');
INSERT INTO `sys_job_log` VALUES (58, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：104毫秒', '0', '', '2023-04-28 11:40:07');
INSERT INTO `sys_job_log` VALUES (59, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：144毫秒', '0', '', '2023-04-28 11:40:08');
INSERT INTO `sys_job_log` VALUES (60, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：191毫秒', '0', '', '2023-04-28 11:40:08');
INSERT INTO `sys_job_log` VALUES (61, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：122毫秒', '0', '', '2023-04-28 11:40:09');
INSERT INTO `sys_job_log` VALUES (62, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：165毫秒', '0', '', '2023-04-28 11:40:09');
INSERT INTO `sys_job_log` VALUES (63, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：130毫秒', '0', '', '2023-04-28 11:40:10');
INSERT INTO `sys_job_log` VALUES (64, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：139毫秒', '0', '', '2023-04-28 11:40:10');
INSERT INTO `sys_job_log` VALUES (65, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：148毫秒', '0', '', '2023-04-28 11:40:11');
INSERT INTO `sys_job_log` VALUES (66, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：192毫秒', '0', '', '2023-04-28 11:40:11');
INSERT INTO `sys_job_log` VALUES (67, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：107毫秒', '0', '', '2023-04-28 11:40:12');
INSERT INTO `sys_job_log` VALUES (68, '定时任务测试2', 'DEFAULT', 'ryTask.creatPatrolTask(130L)', '定时任务测试2 总共耗时：148毫秒', '0', '', '2023-04-28 11:40:13');
INSERT INTO `sys_job_log` VALUES (69, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：2毫秒', '0', '', '2023-04-28 14:10:07');
INSERT INTO `sys_job_log` VALUES (70, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：0毫秒', '0', '', '2023-04-28 14:10:08');
INSERT INTO `sys_job_log` VALUES (71, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：1毫秒', '0', '', '2023-04-28 14:10:09');
INSERT INTO `sys_job_log` VALUES (72, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：1毫秒', '0', '', '2023-04-28 14:10:10');
INSERT INTO `sys_job_log` VALUES (73, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：0毫秒', '0', '', '2023-04-28 14:10:11');
INSERT INTO `sys_job_log` VALUES (74, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：0毫秒', '0', '', '2023-04-28 14:10:12');
INSERT INTO `sys_job_log` VALUES (75, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：0毫秒', '0', '', '2023-04-28 14:10:13');
INSERT INTO `sys_job_log` VALUES (76, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：1毫秒', '0', '', '2023-04-28 14:10:14');
INSERT INTO `sys_job_log` VALUES (77, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：0毫秒', '0', '', '2023-04-28 14:10:15');
INSERT INTO `sys_job_log` VALUES (78, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：1毫秒', '0', '', '2023-04-28 14:10:16');
INSERT INTO `sys_job_log` VALUES (79, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：0毫秒', '0', '', '2023-04-28 14:10:17');
INSERT INTO `sys_job_log` VALUES (80, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：0毫秒', '0', '', '2023-04-28 14:10:18');
INSERT INTO `sys_job_log` VALUES (81, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：0毫秒', '0', '', '2023-04-28 14:10:19');
INSERT INTO `sys_job_log` VALUES (82, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：0毫秒', '0', '', '2023-04-28 14:10:20');
INSERT INTO `sys_job_log` VALUES (83, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：0毫秒', '0', '', '2023-04-28 14:10:21');
INSERT INTO `sys_job_log` VALUES (84, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：0毫秒', '0', '', '2023-04-28 14:10:22');
INSERT INTO `sys_job_log` VALUES (85, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：0毫秒', '0', '', '2023-04-28 14:10:23');
INSERT INTO `sys_job_log` VALUES (86, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：1毫秒', '0', '', '2023-04-28 14:10:24');
INSERT INTO `sys_job_log` VALUES (87, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：0毫秒', '0', '', '2023-04-28 14:10:42');
INSERT INTO `sys_job_log` VALUES (88, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：1毫秒', '0', '', '2023-04-28 14:10:42');
INSERT INTO `sys_job_log` VALUES (89, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：0毫秒', '0', '', '2023-04-28 14:10:42');
INSERT INTO `sys_job_log` VALUES (90, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：0毫秒', '0', '', '2023-04-28 14:10:42');
INSERT INTO `sys_job_log` VALUES (91, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：0毫秒', '0', '', '2023-04-28 14:10:43');
INSERT INTO `sys_job_log` VALUES (92, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：2毫秒', '0', '', '2023-04-28 14:10:44');
INSERT INTO `sys_job_log` VALUES (93, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：1毫秒', '0', '', '2023-04-28 14:10:45');
INSERT INTO `sys_job_log` VALUES (94, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：0毫秒', '0', '', '2023-04-28 14:10:46');
INSERT INTO `sys_job_log` VALUES (95, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：1毫秒', '0', '', '2023-04-28 14:10:47');
INSERT INTO `sys_job_log` VALUES (96, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：0毫秒', '0', '', '2023-04-28 14:10:48');
INSERT INTO `sys_job_log` VALUES (97, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：0毫秒', '0', '', '2023-04-28 14:10:49');
INSERT INTO `sys_job_log` VALUES (98, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：1毫秒', '0', '', '2023-04-28 14:10:50');
INSERT INTO `sys_job_log` VALUES (99, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：1毫秒', '0', '', '2023-04-28 14:10:51');
INSERT INTO `sys_job_log` VALUES (100, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：0毫秒', '0', '', '2023-04-28 14:10:52');
INSERT INTO `sys_job_log` VALUES (101, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：0毫秒', '0', '', '2023-04-28 14:10:53');
INSERT INTO `sys_job_log` VALUES (102, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：0毫秒', '0', '', '2023-04-28 14:10:54');
INSERT INTO `sys_job_log` VALUES (103, '测试定时任务1', 'DEFAULT', 'ryTask.creatPatrolTask(23L)', '测试定时任务1 总共耗时：1毫秒', '0', '', '2023-04-28 14:10:55');
INSERT INTO `sys_job_log` VALUES (104, '测试', 'DEFAULT', 'ryTask.creatPatrolTask(225L)', '测试 总共耗时：241毫秒', '0', '', '2023-05-04 14:08:58');
INSERT INTO `sys_job_log` VALUES (105, '测试', 'DEFAULT', 'ryTask.creatPatrolTask(225L)', '测试 总共耗时：219毫秒', '0', '', '2023-05-04 14:08:58');
INSERT INTO `sys_job_log` VALUES (106, '测试', 'DEFAULT', 'ryTask.creatPatrolTask(225L)', '测试 总共耗时：199毫秒', '0', '', '2023-05-04 14:08:59');
INSERT INTO `sys_job_log` VALUES (107, '测试', 'DEFAULT', 'ryTask.creatPatrolTask(225L)', '测试 总共耗时：213毫秒', '0', '', '2023-05-04 14:09:00');
INSERT INTO `sys_job_log` VALUES (108, '测试', 'DEFAULT', 'ryTask.creatPatrolTask(225L)', '测试 总共耗时：203毫秒', '0', '', '2023-05-04 14:09:01');
INSERT INTO `sys_job_log` VALUES (109, '测试', 'DEFAULT', 'ryTask.creatPatrolTask(225L)', '测试 总共耗时：210毫秒', '0', '', '2023-05-04 14:09:02');
INSERT INTO `sys_job_log` VALUES (110, '测试', 'DEFAULT', 'ryTask.creatPatrolTask(225L)', '测试 总共耗时：205毫秒', '0', '', '2023-05-04 14:09:03');
INSERT INTO `sys_job_log` VALUES (111, '测试', 'DEFAULT', 'ryTask.creatPatrolTask(225L)', '测试 总共耗时：205毫秒', '0', '', '2023-05-04 14:09:04');
INSERT INTO `sys_job_log` VALUES (112, '测试', 'DEFAULT', 'ryTask.creatPatrolTask(225L)', '测试 总共耗时：204毫秒', '0', '', '2023-05-04 14:09:05');
INSERT INTO `sys_job_log` VALUES (113, '测试', 'DEFAULT', 'ryTask.creatPatrolTask(225L)', '测试 总共耗时：192毫秒', '0', '', '2023-05-04 14:09:06');
INSERT INTO `sys_job_log` VALUES (114, '测试', 'DEFAULT', 'ryTask.creatPatrolTask(225L)', '测试 总共耗时：188毫秒', '0', '', '2023-05-04 14:09:07');
INSERT INTO `sys_job_log` VALUES (115, '测试', 'DEFAULT', 'ryTask.creatPatrolTask(225L)', '测试 总共耗时：176毫秒', '0', '', '2023-05-04 14:10:28');
INSERT INTO `sys_job_log` VALUES (116, '测试', 'DEFAULT', 'ryTask.creatPatrolTask(225L)', '测试 总共耗时：179毫秒', '0', '', '2023-05-04 14:10:29');
INSERT INTO `sys_job_log` VALUES (117, '测试', 'DEFAULT', 'ryTask.creatPatrolTask(225L)', '测试 总共耗时：175毫秒', '0', '', '2023-05-04 14:10:29');
INSERT INTO `sys_job_log` VALUES (118, '测试', 'DEFAULT', 'ryTask.creatPatrolTask(225L)', '测试 总共耗时：190毫秒', '0', '', '2023-05-04 14:10:29');
INSERT INTO `sys_job_log` VALUES (119, '测试', 'DEFAULT', 'ryTask.creatPatrolTask(225L)', '测试 总共耗时：179毫秒', '0', '', '2023-05-04 14:10:29');
INSERT INTO `sys_job_log` VALUES (120, '测试', 'DEFAULT', 'ryTask.creatPatrolTask(225L)', '测试 总共耗时：166毫秒', '0', '', '2023-05-04 14:10:30');
INSERT INTO `sys_job_log` VALUES (121, '测试', 'DEFAULT', 'ryTask.creatPatrolTask(225L)', '测试 总共耗时：168毫秒', '0', '', '2023-05-04 14:10:31');
INSERT INTO `sys_job_log` VALUES (122, '测试', 'DEFAULT', 'ryTask.creatPatrolTask(225L)', '测试 总共耗时：171毫秒', '0', '', '2023-05-04 14:10:32');
INSERT INTO `sys_job_log` VALUES (123, '测试', 'DEFAULT', 'ryTask.creatPatrolTask(225L)', '测试 总共耗时：167毫秒', '0', '', '2023-05-04 14:10:33');
INSERT INTO `sys_job_log` VALUES (124, '测试', 'DEFAULT', 'ryTask.creatPatrolTask(225L)', '测试 总共耗时：170毫秒', '0', '', '2023-05-04 14:10:34');
INSERT INTO `sys_job_log` VALUES (125, '测试', 'DEFAULT', 'ryTask.creatPatrolTask(225L)', '测试 总共耗时：170毫秒', '0', '', '2023-05-04 14:10:35');
INSERT INTO `sys_job_log` VALUES (126, '测试', 'DEFAULT', 'ryTask.creatPatrolTask(225L)', '测试 总共耗时：159毫秒', '0', '', '2023-05-04 14:10:36');
INSERT INTO `sys_job_log` VALUES (127, '测试', 'DEFAULT', 'ryTask.creatPatrolTask(225L)', '测试 总共耗时：160毫秒', '0', '', '2023-05-04 14:10:37');
INSERT INTO `sys_job_log` VALUES (128, '测试', 'DEFAULT', 'ryTask.creatPatrolTask(225L)', '测试 总共耗时：155毫秒', '0', '', '2023-05-04 14:10:38');
INSERT INTO `sys_job_log` VALUES (129, '测试', 'DEFAULT', 'ryTask.creatPatrolTask(225L)', '测试 总共耗时：167毫秒', '0', '', '2023-05-04 14:10:39');
INSERT INTO `sys_job_log` VALUES (130, '测试', 'DEFAULT', 'ryTask.creatPatrolTask(225L)', '测试 总共耗时：169毫秒', '0', '', '2023-05-04 14:10:40');
INSERT INTO `sys_job_log` VALUES (131, '测试', 'DEFAULT', 'ryTask.creatPatrolTask(225L)', '测试 总共耗时：213毫秒', '0', '', '2023-05-04 14:16:59');
INSERT INTO `sys_job_log` VALUES (132, '测试', 'DEFAULT', 'ryTask.creatPatrolTask(225L)', '测试 总共耗时：213毫秒', '0', '', '2023-05-04 14:29:59');
INSERT INTO `sys_job_log` VALUES (133, '测试1', 'DEFAULT', 'ryTask.creatPatrolTask(282L)', '测试1 总共耗时：189毫秒', '0', '', '2023-05-04 14:41:59');
INSERT INTO `sys_job_log` VALUES (134, '测试1', 'DEFAULT', 'ryTask.creatPatrolTask(282L)', '测试1 总共耗时：192毫秒', '0', '', '2023-05-04 14:42:00');
INSERT INTO `sys_job_log` VALUES (135, '测试1', 'DEFAULT', 'ryTask.creatPatrolTask(282L)', '测试1 总共耗时：193毫秒', '0', '', '2023-05-04 14:42:01');
INSERT INTO `sys_job_log` VALUES (136, '测试1', 'DEFAULT', 'ryTask.creatPatrolTask(282L)', '测试1 总共耗时：187毫秒', '0', '', '2023-05-04 14:42:02');
INSERT INTO `sys_job_log` VALUES (137, '测试1', 'DEFAULT', 'ryTask.creatPatrolTask(282L)', '测试1 总共耗时：193毫秒', '0', '', '2023-05-04 14:42:03');
INSERT INTO `sys_job_log` VALUES (138, '测试1', 'DEFAULT', 'ryTask.creatPatrolTask(282L)', '测试1 总共耗时：197毫秒', '0', '', '2023-05-04 14:42:04');
INSERT INTO `sys_job_log` VALUES (139, '测试1', 'DEFAULT', 'ryTask.creatPatrolTask(282L)', '测试1 总共耗时：191毫秒', '0', '', '2023-05-04 14:42:05');
INSERT INTO `sys_job_log` VALUES (140, '测试1', 'DEFAULT', 'ryTask.creatPatrolTask(282L)', '测试1 总共耗时：189毫秒', '0', '', '2023-05-04 14:42:06');
INSERT INTO `sys_job_log` VALUES (141, '测试1', 'DEFAULT', 'ryTask.creatPatrolTask(282L)', '测试1 总共耗时：193毫秒', '0', '', '2023-05-04 14:42:07');
INSERT INTO `sys_job_log` VALUES (142, '测试1', 'DEFAULT', 'ryTask.creatPatrolTask(282L)', '测试1 总共耗时：189毫秒', '0', '', '2023-05-04 14:42:08');
INSERT INTO `sys_job_log` VALUES (143, '测试1', 'DEFAULT', 'ryTask.creatPatrolTask(282L)', '测试1 总共耗时：196毫秒', '0', '', '2023-05-04 14:42:09');
INSERT INTO `sys_job_log` VALUES (144, '测试1', 'DEFAULT', 'ryTask.creatPatrolTask(282L)', '测试1 总共耗时：197毫秒', '0', '', '2023-05-04 14:44:59');
INSERT INTO `sys_job_log` VALUES (145, '祁守华(每天白天两次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天白天两次) 总共耗时：198毫秒', '0', '', '2023-05-06 11:59:59');
INSERT INTO `sys_job_log` VALUES (146, '袁树(每天白天两次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天白天两次) 总共耗时：216毫秒', '0', '', '2023-05-06 11:59:59');
INSERT INTO `sys_job_log` VALUES (147, '冀登芳(半月)', 'DEFAULT', 'ryTask.creatPatrolTask(296L)', '冀登芳(半月) 总共耗时：255毫秒', '0', '', '2023-05-06 12:56:05');
INSERT INTO `sys_job_log` VALUES (148, '刘春娟(半月)', 'DEFAULT', 'ryTask.creatPatrolTask(297L)', '刘春娟(半月) 总共耗时：202毫秒', '0', '', '2023-05-06 12:56:09');
INSERT INTO `sys_job_log` VALUES (149, '柳娜(半月)', 'DEFAULT', 'ryTask.creatPatrolTask(298L)', '柳娜(半月) 总共耗时：202毫秒', '0', '', '2023-05-06 12:56:15');
INSERT INTO `sys_job_log` VALUES (150, '徐苗苗(半月)', 'DEFAULT', 'ryTask.creatPatrolTask(299L)', '徐苗苗(半月) 总共耗时：199毫秒', '0', '', '2023-05-06 12:56:19');
INSERT INTO `sys_job_log` VALUES (151, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：202毫秒', '0', '', '2023-05-06 12:56:47');
INSERT INTO `sys_job_log` VALUES (152, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：196毫秒', '0', '', '2023-05-06 12:56:51');
INSERT INTO `sys_job_log` VALUES (153, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：191毫秒', '0', '', '2023-05-06 12:56:54');
INSERT INTO `sys_job_log` VALUES (154, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：198毫秒', '0', '', '2023-05-06 12:56:58');
INSERT INTO `sys_job_log` VALUES (155, '王建国(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(304L)', '王建国(每天) 总共耗时：199毫秒', '0', '', '2023-05-06 12:57:01');
INSERT INTO `sys_job_log` VALUES (156, '测试1', 'DEFAULT', 'ryTask.creatPatrolTask(282L)', '测试1 总共耗时：238毫秒', '0', '', '2023-05-06 17:32:59');
INSERT INTO `sys_job_log` VALUES (157, '测试1', 'DEFAULT', 'ryTask.creatPatrolTask(282L)', '测试1 总共耗时：176毫秒', '0', '', '2023-05-06 21:37:28');
INSERT INTO `sys_job_log` VALUES (158, '测试(夏)', 'DEFAULT', 'ryTask.creatPatrolTask(322L)', '测试(夏) 总共耗时：204毫秒', '0', '', '2023-05-07 09:55:32');
INSERT INTO `sys_job_log` VALUES (159, '测试', 'DEFAULT', 'ryTask.creatPatrolTask(327L)', '测试 总共耗时：23毫秒', '0', '', '2023-05-08 14:50:03');
INSERT INTO `sys_job_log` VALUES (160, '冀登芳(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(296L)', '冀登芳(每周) 总共耗时：14毫秒', '0', '', '2023-05-08 17:18:31');
INSERT INTO `sys_job_log` VALUES (161, '刘春娟(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(297L)', '刘春娟(每周) 总共耗时：11毫秒', '0', '', '2023-05-08 17:18:36');
INSERT INTO `sys_job_log` VALUES (162, '柳娜(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(298L)', '柳娜(每周) 总共耗时：13毫秒', '0', '', '2023-05-08 17:18:41');
INSERT INTO `sys_job_log` VALUES (163, '徐苗苗(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(299L)', '徐苗苗(每周) 总共耗时：9毫秒', '0', '', '2023-05-08 17:18:45');
INSERT INTO `sys_job_log` VALUES (164, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：12毫秒', '0', '', '2023-05-08 17:18:50');
INSERT INTO `sys_job_log` VALUES (165, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：10毫秒', '0', '', '2023-05-08 17:18:55');
INSERT INTO `sys_job_log` VALUES (166, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：11毫秒', '0', '', '2023-05-08 17:18:59');
INSERT INTO `sys_job_log` VALUES (167, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：12毫秒', '0', '', '2023-05-08 17:19:04');
INSERT INTO `sys_job_log` VALUES (168, '王建国(每半月)', 'DEFAULT', 'ryTask.creatPatrolTask(304L)', '王建国(每半月) 总共耗时：11毫秒', '0', '', '2023-05-08 17:19:11');
INSERT INTO `sys_job_log` VALUES (169, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：8毫秒', '0', '', '2023-05-08 17:19:18');
INSERT INTO `sys_job_log` VALUES (170, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：10毫秒', '0', '', '2023-05-08 17:19:22');
INSERT INTO `sys_job_log` VALUES (171, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：8毫秒', '0', '', '2023-05-08 17:19:28');
INSERT INTO `sys_job_log` VALUES (172, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：11毫秒', '0', '', '2023-05-08 17:19:33');
INSERT INTO `sys_job_log` VALUES (173, '焦祁亮（每半月）', 'DEFAULT', 'ryTask.creatPatrolTask(329L)', '焦祁亮（每半月） 总共耗时：11毫秒', '0', '', '2023-05-08 17:19:37');
INSERT INTO `sys_job_log` VALUES (174, '焦祁亮（每半月）', 'DEFAULT', 'ryTask.creatPatrolTask(329L)', '焦祁亮（每半月） 总共耗时：10毫秒', '0', '', '2023-05-08 17:28:35');
INSERT INTO `sys_job_log` VALUES (175, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：9毫秒', '0', '', '2023-05-08 17:28:39');
INSERT INTO `sys_job_log` VALUES (176, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：10毫秒', '0', '', '2023-05-08 17:28:41');
INSERT INTO `sys_job_log` VALUES (177, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：9毫秒', '0', '', '2023-05-08 17:28:43');
INSERT INTO `sys_job_log` VALUES (178, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：9毫秒', '0', '', '2023-05-08 17:28:45');
INSERT INTO `sys_job_log` VALUES (179, '冀登芳(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(296L)', '冀登芳(每周) 总共耗时：8毫秒', '0', '', '2023-05-08 17:28:50');
INSERT INTO `sys_job_log` VALUES (180, '刘春娟(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(297L)', '刘春娟(每周) 总共耗时：12毫秒', '0', '', '2023-05-08 17:28:52');
INSERT INTO `sys_job_log` VALUES (181, '柳娜(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(298L)', '柳娜(每周) 总共耗时：9毫秒', '0', '', '2023-05-08 17:28:54');
INSERT INTO `sys_job_log` VALUES (182, '徐苗苗(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(299L)', '徐苗苗(每周) 总共耗时：9毫秒', '0', '', '2023-05-08 17:28:56');
INSERT INTO `sys_job_log` VALUES (183, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：10毫秒', '0', '', '2023-05-08 17:28:58');
INSERT INTO `sys_job_log` VALUES (184, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：11毫秒', '0', '', '2023-05-08 17:28:59');
INSERT INTO `sys_job_log` VALUES (185, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：11毫秒', '0', '', '2023-05-08 17:29:01');
INSERT INTO `sys_job_log` VALUES (186, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：9毫秒', '0', '', '2023-05-08 17:29:03');
INSERT INTO `sys_job_log` VALUES (187, '王建国(每半月)', 'DEFAULT', 'ryTask.creatPatrolTask(304L)', '王建国(每半月) 总共耗时：10毫秒', '0', '', '2023-05-08 17:29:04');
INSERT INTO `sys_job_log` VALUES (188, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：12毫秒', '0', '', '2023-05-08 18:51:34');
INSERT INTO `sys_job_log` VALUES (189, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：11毫秒', '0', '', '2023-05-08 18:51:39');
INSERT INTO `sys_job_log` VALUES (190, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：12毫秒', '0', '', '2023-05-08 18:51:42');
INSERT INTO `sys_job_log` VALUES (191, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：11毫秒', '0', '', '2023-05-08 18:52:35');
INSERT INTO `sys_job_log` VALUES (192, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：45毫秒', '0', '', '2023-05-09 01:00:00');
INSERT INTO `sys_job_log` VALUES (193, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：65毫秒', '0', '', '2023-05-09 01:00:00');
INSERT INTO `sys_job_log` VALUES (194, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：72毫秒', '0', '', '2023-05-09 01:00:00');
INSERT INTO `sys_job_log` VALUES (195, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：71毫秒', '0', '', '2023-05-09 01:00:00');
INSERT INTO `sys_job_log` VALUES (196, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：72毫秒', '0', '', '2023-05-09 01:00:00');
INSERT INTO `sys_job_log` VALUES (197, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：85毫秒', '0', '', '2023-05-09 01:00:00');
INSERT INTO `sys_job_log` VALUES (198, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：85毫秒', '0', '', '2023-05-09 01:00:00');
INSERT INTO `sys_job_log` VALUES (199, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：86毫秒', '0', '', '2023-05-09 01:00:00');
INSERT INTO `sys_job_log` VALUES (200, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：411毫秒', '0', '', '2023-05-09 01:00:00');
INSERT INTO `sys_job_log` VALUES (201, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：415毫秒', '0', '', '2023-05-09 01:00:00');
INSERT INTO `sys_job_log` VALUES (202, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：449毫秒', '0', '', '2023-05-09 01:00:00');
INSERT INTO `sys_job_log` VALUES (203, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：548毫秒', '0', '', '2023-05-09 01:00:00');
INSERT INTO `sys_job_log` VALUES (204, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：552毫秒', '0', '', '2023-05-09 01:00:00');
INSERT INTO `sys_job_log` VALUES (205, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：577毫秒', '0', '', '2023-05-09 01:00:00');
INSERT INTO `sys_job_log` VALUES (206, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：610毫秒', '0', '', '2023-05-09 01:00:00');
INSERT INTO `sys_job_log` VALUES (207, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：689毫秒', '0', '', '2023-05-09 01:00:00');
INSERT INTO `sys_job_log` VALUES (208, '测试1', 'DEFAULT', 'ryTask.creatPatrolTask(282L)', '测试1 总共耗时：9毫秒', '0', '', '2023-05-09 08:44:13');
INSERT INTO `sys_job_log` VALUES (209, '冀登芳(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(296L)', '冀登芳(每周) 总共耗时：8毫秒', '0', '', '2023-05-09 09:44:56');
INSERT INTO `sys_job_log` VALUES (210, '刘春娟(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(297L)', '刘春娟(每周) 总共耗时：10毫秒', '0', '', '2023-05-09 09:45:00');
INSERT INTO `sys_job_log` VALUES (211, '柳娜(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(298L)', '柳娜(每周) 总共耗时：8毫秒', '0', '', '2023-05-09 09:45:03');
INSERT INTO `sys_job_log` VALUES (212, '徐苗苗(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(299L)', '徐苗苗(每周) 总共耗时：8毫秒', '0', '', '2023-05-09 09:45:08');
INSERT INTO `sys_job_log` VALUES (213, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：12毫秒', '0', '', '2023-05-09 09:45:12');
INSERT INTO `sys_job_log` VALUES (214, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：10毫秒', '0', '', '2023-05-09 09:45:14');
INSERT INTO `sys_job_log` VALUES (215, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：8毫秒', '0', '', '2023-05-09 09:45:16');
INSERT INTO `sys_job_log` VALUES (216, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：8毫秒', '0', '', '2023-05-09 09:45:18');
INSERT INTO `sys_job_log` VALUES (217, '王建国(每半月)', 'DEFAULT', 'ryTask.creatPatrolTask(304L)', '王建国(每半月) 总共耗时：9毫秒', '0', '', '2023-05-09 09:45:20');
INSERT INTO `sys_job_log` VALUES (218, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：9毫秒', '0', '', '2023-05-09 09:45:25');
INSERT INTO `sys_job_log` VALUES (219, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：13毫秒', '0', '', '2023-05-09 09:45:26');
INSERT INTO `sys_job_log` VALUES (220, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：9毫秒', '0', '', '2023-05-09 09:45:28');
INSERT INTO `sys_job_log` VALUES (221, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：8毫秒', '0', '', '2023-05-09 09:45:33');
INSERT INTO `sys_job_log` VALUES (222, '焦祁亮（每半月）', 'DEFAULT', 'ryTask.creatPatrolTask(329L)', '焦祁亮（每半月） 总共耗时：9毫秒', '0', '', '2023-05-09 09:45:38');
INSERT INTO `sys_job_log` VALUES (223, '高志标（每周一次）隔油池', 'DEFAULT', 'ryTask.creatPatrolTask(379L)', '高志标（每周一次）隔油池 总共耗时：7毫秒', '0', '', '2023-05-09 09:45:40');
INSERT INTO `sys_job_log` VALUES (224, '测试1', 'DEFAULT', 'ryTask.creatPatrolTask(282L)', '测试1 总共耗时：8毫秒', '0', '', '2023-05-09 09:50:43');
INSERT INTO `sys_job_log` VALUES (225, '测试1', 'DEFAULT', 'ryTask.creatPatrolTask(282L)', '测试1 总共耗时：7毫秒', '0', '', '2023-05-09 09:52:02');
INSERT INTO `sys_job_log` VALUES (226, '测试1', 'DEFAULT', 'ryTask.creatPatrolTask(282L)', '测试1 总共耗时：9毫秒', '0', '', '2023-05-09 09:58:26');
INSERT INTO `sys_job_log` VALUES (227, '测试', 'DEFAULT', 'ryTask.creatPatrolTask(398L)', '测试 总共耗时：10毫秒', '0', '', '2023-05-09 16:31:00');
INSERT INTO `sys_job_log` VALUES (228, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：44毫秒', '0', '', '2023-05-10 01:00:00');
INSERT INTO `sys_job_log` VALUES (229, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：48毫秒', '0', '', '2023-05-10 01:00:00');
INSERT INTO `sys_job_log` VALUES (230, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：54毫秒', '0', '', '2023-05-10 01:00:00');
INSERT INTO `sys_job_log` VALUES (231, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：59毫秒', '0', '', '2023-05-10 01:00:00');
INSERT INTO `sys_job_log` VALUES (232, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：60毫秒', '0', '', '2023-05-10 01:00:00');
INSERT INTO `sys_job_log` VALUES (233, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：63毫秒', '0', '', '2023-05-10 01:00:00');
INSERT INTO `sys_job_log` VALUES (234, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：65毫秒', '0', '', '2023-05-10 01:00:00');
INSERT INTO `sys_job_log` VALUES (235, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：69毫秒', '0', '', '2023-05-10 01:00:00');
INSERT INTO `sys_job_log` VALUES (236, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：320毫秒', '0', '', '2023-05-10 01:00:00');
INSERT INTO `sys_job_log` VALUES (237, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：321毫秒', '0', '', '2023-05-10 01:00:00');
INSERT INTO `sys_job_log` VALUES (238, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：326毫秒', '0', '', '2023-05-10 01:00:00');
INSERT INTO `sys_job_log` VALUES (239, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：449毫秒', '0', '', '2023-05-10 01:00:00');
INSERT INTO `sys_job_log` VALUES (240, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：453毫秒', '0', '', '2023-05-10 01:00:00');
INSERT INTO `sys_job_log` VALUES (241, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：458毫秒', '0', '', '2023-05-10 01:00:00');
INSERT INTO `sys_job_log` VALUES (242, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：464毫秒', '0', '', '2023-05-10 01:00:00');
INSERT INTO `sys_job_log` VALUES (243, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：583毫秒', '0', '', '2023-05-10 01:00:00');
INSERT INTO `sys_job_log` VALUES (244, '测试1', 'DEFAULT', 'ryTask.creatPatrolTask(282L)', '测试1 总共耗时：19359毫秒', '0', '', '2023-05-10 10:02:21');
INSERT INTO `sys_job_log` VALUES (245, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：420毫秒', '0', '', '2023-05-11 00:59:58');
INSERT INTO `sys_job_log` VALUES (246, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：419毫秒', '0', '', '2023-05-11 00:59:58');
INSERT INTO `sys_job_log` VALUES (247, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：412毫秒', '0', '', '2023-05-11 00:59:58');
INSERT INTO `sys_job_log` VALUES (248, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：510毫秒', '0', '', '2023-05-11 00:59:58');
INSERT INTO `sys_job_log` VALUES (249, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：551毫秒', '0', '', '2023-05-11 00:59:58');
INSERT INTO `sys_job_log` VALUES (250, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：570毫秒', '0', '', '2023-05-11 00:59:58');
INSERT INTO `sys_job_log` VALUES (251, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：572毫秒', '0', '', '2023-05-11 00:59:58');
INSERT INTO `sys_job_log` VALUES (252, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：667毫秒', '0', '', '2023-05-11 00:59:58');
INSERT INTO `sys_job_log` VALUES (253, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：50毫秒', '0', '', '2023-05-11 01:00:00');
INSERT INTO `sys_job_log` VALUES (254, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：55毫秒', '0', '', '2023-05-11 01:00:00');
INSERT INTO `sys_job_log` VALUES (255, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：69毫秒', '0', '', '2023-05-11 01:00:00');
INSERT INTO `sys_job_log` VALUES (256, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：94毫秒', '0', '', '2023-05-11 01:00:00');
INSERT INTO `sys_job_log` VALUES (257, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：81毫秒', '0', '', '2023-05-11 01:00:00');
INSERT INTO `sys_job_log` VALUES (258, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：95毫秒', '0', '', '2023-05-11 01:00:00');
INSERT INTO `sys_job_log` VALUES (259, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：102毫秒', '0', '', '2023-05-11 01:00:00');
INSERT INTO `sys_job_log` VALUES (260, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：102毫秒', '0', '', '2023-05-11 01:00:00');
INSERT INTO `sys_job_log` VALUES (261, '测试1', 'DEFAULT', 'ryTask.creatPatrolTask(282L)', '测试1 总共耗时：201毫秒', '0', '', '2023-05-11 09:38:08');
INSERT INTO `sys_job_log` VALUES (262, '测试1', 'DEFAULT', 'ryTask.creatPatrolTask(282L)', '测试1 总共耗时：199毫秒', '0', '', '2023-05-11 17:07:58');
INSERT INTO `sys_job_log` VALUES (263, '测试1', 'DEFAULT', 'ryTask.creatPatrolTask(282L)', '测试1 总共耗时：786毫秒', '0', '', '2023-05-11 17:21:57');
INSERT INTO `sys_job_log` VALUES (264, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：19371毫秒', '0', '', '2023-05-11 17:22:06');
INSERT INTO `sys_job_log` VALUES (265, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：139毫秒', '0', '', '2023-05-12 01:00:00');
INSERT INTO `sys_job_log` VALUES (266, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：157毫秒', '0', '', '2023-05-12 01:00:00');
INSERT INTO `sys_job_log` VALUES (267, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：160毫秒', '0', '', '2023-05-12 01:00:00');
INSERT INTO `sys_job_log` VALUES (268, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：165毫秒', '0', '', '2023-05-12 01:00:00');
INSERT INTO `sys_job_log` VALUES (269, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：185毫秒', '0', '', '2023-05-12 01:00:00');
INSERT INTO `sys_job_log` VALUES (270, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：187毫秒', '0', '', '2023-05-12 01:00:00');
INSERT INTO `sys_job_log` VALUES (271, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：184毫秒', '0', '', '2023-05-12 01:00:00');
INSERT INTO `sys_job_log` VALUES (272, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：207毫秒', '0', '', '2023-05-12 01:00:00');
INSERT INTO `sys_job_log` VALUES (273, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：384毫秒', '0', '', '2023-05-12 01:00:00');
INSERT INTO `sys_job_log` VALUES (274, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：370毫秒', '0', '', '2023-05-12 01:00:00');
INSERT INTO `sys_job_log` VALUES (275, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：440毫秒', '0', '', '2023-05-12 01:00:00');
INSERT INTO `sys_job_log` VALUES (276, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：511毫秒', '0', '', '2023-05-12 01:00:00');
INSERT INTO `sys_job_log` VALUES (277, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：516毫秒', '0', '', '2023-05-12 01:00:00');
INSERT INTO `sys_job_log` VALUES (278, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：568毫秒', '0', '', '2023-05-12 01:00:00');
INSERT INTO `sys_job_log` VALUES (279, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：623毫秒', '0', '', '2023-05-12 01:00:00');
INSERT INTO `sys_job_log` VALUES (280, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：631毫秒', '0', '', '2023-05-12 01:00:00');
INSERT INTO `sys_job_log` VALUES (281, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：64毫秒', '0', '', '2023-05-15 01:00:00');
INSERT INTO `sys_job_log` VALUES (282, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：76毫秒', '0', '', '2023-05-15 01:00:00');
INSERT INTO `sys_job_log` VALUES (283, '徐苗苗(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(299L)', '徐苗苗(每周) 总共耗时：84毫秒', '0', '', '2023-05-15 01:00:00');
INSERT INTO `sys_job_log` VALUES (284, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：78毫秒', '0', '', '2023-05-15 01:00:00');
INSERT INTO `sys_job_log` VALUES (285, '刘春娟(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(297L)', '刘春娟(每周) 总共耗时：94毫秒', '0', '', '2023-05-15 01:00:00');
INSERT INTO `sys_job_log` VALUES (286, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：98毫秒', '0', '', '2023-05-15 01:00:00');
INSERT INTO `sys_job_log` VALUES (287, '柳娜(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(298L)', '柳娜(每周) 总共耗时：98毫秒', '0', '', '2023-05-15 01:00:00');
INSERT INTO `sys_job_log` VALUES (288, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：100毫秒', '0', '', '2023-05-15 01:00:00');
INSERT INTO `sys_job_log` VALUES (289, '冀登芳(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(296L)', '冀登芳(每周) 总共耗时：109毫秒', '0', '', '2023-05-15 01:00:00');
INSERT INTO `sys_job_log` VALUES (290, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：124毫秒', '0', '', '2023-05-15 01:00:00');
INSERT INTO `sys_job_log` VALUES (291, '高志标（每周一次）隔油池', 'DEFAULT', 'ryTask.creatPatrolTask(379L)', '高志标（每周一次）隔油池 总共耗时：21毫秒', '0', '', '2023-05-15 01:00:00');
INSERT INTO `sys_job_log` VALUES (292, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：23毫秒', '0', '', '2023-05-15 01:00:00');
INSERT INTO `sys_job_log` VALUES (293, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：24毫秒', '0', '', '2023-05-15 01:00:00');
INSERT INTO `sys_job_log` VALUES (294, '测试1', 'DEFAULT', 'ryTask.creatPatrolTask(282L)', '测试1 总共耗时：52毫秒', '1', 'java.lang.reflect.InvocationTargetException\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:50)\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:31)\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:16)\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:40)\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\nCaused by: org.springframework.jdbc.BadSqlGrammarException: \n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n### The error may exist in URL [jar:file:/home/code/ruoyi-admin.jar!/BOOT-INF/lib/ruoyi-system-3.8.5.jar!/mapper/system/SysPatrolPersonnelMapper.xml]\n### The error may involve defaultParameterMap\n### The error occurred while setting parameters\n### SQL: insert into sys_patrol_personnel(patrol_id, personnel_id) values\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n	at org.springframework.jdbc.support.SQLErrorCodeSQLExceptionTranslator.doTranslate(SQLErrorCodeSQLExceptionTranslator.java:239)\n	at org.springframework.jdbc.support.Abstr', '2023-05-15 11:19:20');
INSERT INTO `sys_job_log` VALUES (295, '测试1', 'DEFAULT', 'ryTask.creatPatrolTask(282L)', '测试1 总共耗时：10毫秒', '0', '', '2023-05-15 11:22:45');
INSERT INTO `sys_job_log` VALUES (296, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：661毫秒', '0', '', '2023-05-16 00:59:58');
INSERT INTO `sys_job_log` VALUES (297, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：660毫秒', '0', '', '2023-05-16 00:59:59');
INSERT INTO `sys_job_log` VALUES (298, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：669毫秒', '0', '', '2023-05-16 00:59:59');
INSERT INTO `sys_job_log` VALUES (299, '王建国(每半月)', 'DEFAULT', 'ryTask.creatPatrolTask(304L)', '王建国(每半月) 总共耗时：803毫秒', '0', '', '2023-05-16 00:59:59');
INSERT INTO `sys_job_log` VALUES (300, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：820毫秒', '0', '', '2023-05-16 00:59:59');
INSERT INTO `sys_job_log` VALUES (301, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：818毫秒', '0', '', '2023-05-16 00:59:59');
INSERT INTO `sys_job_log` VALUES (302, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：830毫秒', '0', '', '2023-05-16 00:59:59');
INSERT INTO `sys_job_log` VALUES (303, '焦祁亮（每半月）', 'DEFAULT', 'ryTask.creatPatrolTask(329L)', '焦祁亮（每半月） 总共耗时：1299毫秒', '0', '', '2023-05-16 00:59:59');
INSERT INTO `sys_job_log` VALUES (304, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：1272毫秒', '0', '', '2023-05-16 00:59:59');
INSERT INTO `sys_job_log` VALUES (305, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：1291毫秒', '0', '', '2023-05-16 00:59:59');
INSERT INTO `sys_job_log` VALUES (306, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：54毫秒', '0', '', '2023-05-16 01:00:00');
INSERT INTO `sys_job_log` VALUES (307, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：55毫秒', '0', '', '2023-05-16 01:00:00');
INSERT INTO `sys_job_log` VALUES (308, '焦祁亮（每半月）', 'DEFAULT', 'ryTask.creatPatrolTask(329L)', '焦祁亮（每半月） 总共耗时：66毫秒', '0', '', '2023-05-16 01:00:00');
INSERT INTO `sys_job_log` VALUES (309, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：77毫秒', '0', '', '2023-05-16 01:00:00');
INSERT INTO `sys_job_log` VALUES (310, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：89毫秒', '0', '', '2023-05-16 01:00:00');
INSERT INTO `sys_job_log` VALUES (311, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：78毫秒', '0', '', '2023-05-16 01:00:00');
INSERT INTO `sys_job_log` VALUES (312, '王建国(每半月)', 'DEFAULT', 'ryTask.creatPatrolTask(304L)', '王建国(每半月) 总共耗时：89毫秒', '0', '', '2023-05-16 01:00:00');
INSERT INTO `sys_job_log` VALUES (313, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：95毫秒', '0', '', '2023-05-16 01:00:00');
INSERT INTO `sys_job_log` VALUES (314, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：81毫秒', '0', '', '2023-05-16 01:00:00');
INSERT INTO `sys_job_log` VALUES (315, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：70毫秒', '0', '', '2023-05-16 01:00:00');
INSERT INTO `sys_job_log` VALUES (316, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：95毫秒', '0', '', '2023-05-17 01:00:00');
INSERT INTO `sys_job_log` VALUES (317, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：108毫秒', '0', '', '2023-05-17 01:00:00');
INSERT INTO `sys_job_log` VALUES (318, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：90毫秒', '0', '', '2023-05-17 01:00:00');
INSERT INTO `sys_job_log` VALUES (319, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：106毫秒', '0', '', '2023-05-17 01:00:00');
INSERT INTO `sys_job_log` VALUES (320, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：124毫秒', '0', '', '2023-05-17 01:00:00');
INSERT INTO `sys_job_log` VALUES (321, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：151毫秒', '0', '', '2023-05-17 01:00:00');
INSERT INTO `sys_job_log` VALUES (322, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：149毫秒', '0', '', '2023-05-17 01:00:00');
INSERT INTO `sys_job_log` VALUES (323, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：115毫秒', '0', '', '2023-05-17 01:00:00');
INSERT INTO `sys_job_log` VALUES (324, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：51毫秒', '0', '', '2023-05-18 01:00:00');
INSERT INTO `sys_job_log` VALUES (325, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：65毫秒', '0', '', '2023-05-18 01:00:00');
INSERT INTO `sys_job_log` VALUES (326, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：56毫秒', '0', '', '2023-05-18 01:00:00');
INSERT INTO `sys_job_log` VALUES (327, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：64毫秒', '0', '', '2023-05-18 01:00:00');
INSERT INTO `sys_job_log` VALUES (328, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：73毫秒', '0', '', '2023-05-18 01:00:00');
INSERT INTO `sys_job_log` VALUES (329, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：77毫秒', '0', '', '2023-05-18 01:00:00');
INSERT INTO `sys_job_log` VALUES (330, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：83毫秒', '0', '', '2023-05-18 01:00:00');
INSERT INTO `sys_job_log` VALUES (331, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：97毫秒', '0', '', '2023-05-18 01:00:00');
INSERT INTO `sys_job_log` VALUES (332, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：58毫秒', '0', '', '2023-05-19 01:00:00');
INSERT INTO `sys_job_log` VALUES (333, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：57毫秒', '0', '', '2023-05-19 01:00:00');
INSERT INTO `sys_job_log` VALUES (334, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：78毫秒', '0', '', '2023-05-19 01:00:00');
INSERT INTO `sys_job_log` VALUES (335, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：83毫秒', '0', '', '2023-05-19 01:00:00');
INSERT INTO `sys_job_log` VALUES (336, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：101毫秒', '0', '', '2023-05-19 01:00:00');
INSERT INTO `sys_job_log` VALUES (337, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：107毫秒', '0', '', '2023-05-19 01:00:00');
INSERT INTO `sys_job_log` VALUES (338, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：109毫秒', '0', '', '2023-05-19 01:00:00');
INSERT INTO `sys_job_log` VALUES (339, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：130毫秒', '0', '', '2023-05-19 01:00:00');
INSERT INTO `sys_job_log` VALUES (340, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：55毫秒', '0', '', '2023-05-20 01:00:00');
INSERT INTO `sys_job_log` VALUES (341, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：82毫秒', '0', '', '2023-05-20 01:00:00');
INSERT INTO `sys_job_log` VALUES (342, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：88毫秒', '0', '', '2023-05-20 01:00:00');
INSERT INTO `sys_job_log` VALUES (343, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：83毫秒', '0', '', '2023-05-20 01:00:00');
INSERT INTO `sys_job_log` VALUES (344, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：81毫秒', '0', '', '2023-05-20 01:00:00');
INSERT INTO `sys_job_log` VALUES (345, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：81毫秒', '0', '', '2023-05-20 01:00:00');
INSERT INTO `sys_job_log` VALUES (346, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：107毫秒', '0', '', '2023-05-20 01:00:00');
INSERT INTO `sys_job_log` VALUES (347, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：109毫秒', '0', '', '2023-05-20 01:00:00');
INSERT INTO `sys_job_log` VALUES (348, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：41毫秒', '0', '', '2023-05-21 01:00:00');
INSERT INTO `sys_job_log` VALUES (349, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：45毫秒', '0', '', '2023-05-21 01:00:00');
INSERT INTO `sys_job_log` VALUES (350, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：46毫秒', '0', '', '2023-05-21 01:00:00');
INSERT INTO `sys_job_log` VALUES (351, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：69毫秒', '0', '', '2023-05-21 01:00:00');
INSERT INTO `sys_job_log` VALUES (352, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：82毫秒', '0', '', '2023-05-21 01:00:00');
INSERT INTO `sys_job_log` VALUES (353, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：60毫秒', '0', '', '2023-05-21 01:00:00');
INSERT INTO `sys_job_log` VALUES (354, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：70毫秒', '0', '', '2023-05-21 01:00:00');
INSERT INTO `sys_job_log` VALUES (355, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：87毫秒', '0', '', '2023-05-21 01:00:00');
INSERT INTO `sys_job_log` VALUES (356, '柳娜(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(298L)', '柳娜(每周) 总共耗时：31毫秒', '0', '', '2023-05-22 01:00:00');
INSERT INTO `sys_job_log` VALUES (357, '冀登芳(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(296L)', '冀登芳(每周) 总共耗时：34毫秒', '0', '', '2023-05-22 01:00:00');
INSERT INTO `sys_job_log` VALUES (358, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：45毫秒', '0', '', '2023-05-22 01:00:00');
INSERT INTO `sys_job_log` VALUES (359, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：66毫秒', '0', '', '2023-05-22 01:00:00');
INSERT INTO `sys_job_log` VALUES (360, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：64毫秒', '0', '', '2023-05-22 01:00:00');
INSERT INTO `sys_job_log` VALUES (361, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：48毫秒', '0', '', '2023-05-22 01:00:00');
INSERT INTO `sys_job_log` VALUES (362, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：63毫秒', '0', '', '2023-05-22 01:00:00');
INSERT INTO `sys_job_log` VALUES (363, '刘春娟(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(297L)', '刘春娟(每周) 总共耗时：66毫秒', '0', '', '2023-05-22 01:00:00');
INSERT INTO `sys_job_log` VALUES (364, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：66毫秒', '0', '', '2023-05-22 01:00:00');
INSERT INTO `sys_job_log` VALUES (365, '徐苗苗(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(299L)', '徐苗苗(每周) 总共耗时：79毫秒', '0', '', '2023-05-22 01:00:00');
INSERT INTO `sys_job_log` VALUES (366, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：15毫秒', '0', '', '2023-05-22 01:00:00');
INSERT INTO `sys_job_log` VALUES (367, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：24毫秒', '0', '', '2023-05-22 01:00:00');
INSERT INTO `sys_job_log` VALUES (368, '高志标（每周一次）隔油池', 'DEFAULT', 'ryTask.creatPatrolTask(379L)', '高志标（每周一次）隔油池 总共耗时：18毫秒', '0', '', '2023-05-22 01:00:00');
INSERT INTO `sys_job_log` VALUES (369, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：22毫秒', '0', '', '2023-05-23 01:00:00');
INSERT INTO `sys_job_log` VALUES (370, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：31毫秒', '0', '', '2023-05-23 01:00:00');
INSERT INTO `sys_job_log` VALUES (371, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：26毫秒', '0', '', '2023-05-23 01:00:00');
INSERT INTO `sys_job_log` VALUES (372, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：31毫秒', '0', '', '2023-05-23 01:00:00');
INSERT INTO `sys_job_log` VALUES (373, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：29毫秒', '0', '', '2023-05-23 01:00:00');
INSERT INTO `sys_job_log` VALUES (374, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：30毫秒', '0', '', '2023-05-23 01:00:00');
INSERT INTO `sys_job_log` VALUES (375, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：42毫秒', '0', '', '2023-05-23 01:00:00');
INSERT INTO `sys_job_log` VALUES (376, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：42毫秒', '0', '', '2023-05-23 01:00:00');
INSERT INTO `sys_job_log` VALUES (377, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：38毫秒', '0', '', '2023-05-24 01:00:00');
INSERT INTO `sys_job_log` VALUES (378, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：49毫秒', '0', '', '2023-05-24 01:00:00');
INSERT INTO `sys_job_log` VALUES (379, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：40毫秒', '0', '', '2023-05-24 01:00:00');
INSERT INTO `sys_job_log` VALUES (380, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：56毫秒', '0', '', '2023-05-24 01:00:00');
INSERT INTO `sys_job_log` VALUES (381, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：61毫秒', '0', '', '2023-05-24 01:00:00');
INSERT INTO `sys_job_log` VALUES (382, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：61毫秒', '0', '', '2023-05-24 01:00:00');
INSERT INTO `sys_job_log` VALUES (383, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：62毫秒', '0', '', '2023-05-24 01:00:00');
INSERT INTO `sys_job_log` VALUES (384, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：77毫秒', '0', '', '2023-05-24 01:00:00');
INSERT INTO `sys_job_log` VALUES (385, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：55毫秒', '0', '', '2023-05-25 01:00:00');
INSERT INTO `sys_job_log` VALUES (386, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：57毫秒', '0', '', '2023-05-25 01:00:00');
INSERT INTO `sys_job_log` VALUES (387, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：72毫秒', '0', '', '2023-05-25 01:00:00');
INSERT INTO `sys_job_log` VALUES (388, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：71毫秒', '0', '', '2023-05-25 01:00:00');
INSERT INTO `sys_job_log` VALUES (389, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：79毫秒', '0', '', '2023-05-25 01:00:00');
INSERT INTO `sys_job_log` VALUES (390, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：86毫秒', '0', '', '2023-05-25 01:00:00');
INSERT INTO `sys_job_log` VALUES (391, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：92毫秒', '0', '', '2023-05-25 01:00:00');
INSERT INTO `sys_job_log` VALUES (392, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：96毫秒', '0', '', '2023-05-25 01:00:00');
INSERT INTO `sys_job_log` VALUES (393, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：41毫秒', '0', '', '2023-05-26 01:00:00');
INSERT INTO `sys_job_log` VALUES (394, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：41毫秒', '0', '', '2023-05-26 01:00:00');
INSERT INTO `sys_job_log` VALUES (395, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：42毫秒', '0', '', '2023-05-26 01:00:00');
INSERT INTO `sys_job_log` VALUES (396, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：49毫秒', '0', '', '2023-05-26 01:00:00');
INSERT INTO `sys_job_log` VALUES (397, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：51毫秒', '0', '', '2023-05-26 01:00:00');
INSERT INTO `sys_job_log` VALUES (398, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：56毫秒', '0', '', '2023-05-26 01:00:00');
INSERT INTO `sys_job_log` VALUES (399, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：55毫秒', '0', '', '2023-05-26 01:00:00');
INSERT INTO `sys_job_log` VALUES (400, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：60毫秒', '0', '', '2023-05-26 01:00:00');
INSERT INTO `sys_job_log` VALUES (401, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：37毫秒', '0', '', '2023-05-27 01:00:00');
INSERT INTO `sys_job_log` VALUES (402, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：49毫秒', '0', '', '2023-05-27 01:00:00');
INSERT INTO `sys_job_log` VALUES (403, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：39毫秒', '0', '', '2023-05-27 01:00:00');
INSERT INTO `sys_job_log` VALUES (404, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：49毫秒', '0', '', '2023-05-27 01:00:00');
INSERT INTO `sys_job_log` VALUES (405, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：56毫秒', '0', '', '2023-05-27 01:00:00');
INSERT INTO `sys_job_log` VALUES (406, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：57毫秒', '0', '', '2023-05-27 01:00:00');
INSERT INTO `sys_job_log` VALUES (407, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：49毫秒', '0', '', '2023-05-27 01:00:00');
INSERT INTO `sys_job_log` VALUES (408, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：57毫秒', '0', '', '2023-05-27 01:00:00');
INSERT INTO `sys_job_log` VALUES (409, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：38毫秒', '0', '', '2023-05-28 01:00:00');
INSERT INTO `sys_job_log` VALUES (410, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：41毫秒', '0', '', '2023-05-28 01:00:00');
INSERT INTO `sys_job_log` VALUES (411, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：56毫秒', '0', '', '2023-05-28 01:00:00');
INSERT INTO `sys_job_log` VALUES (412, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：61毫秒', '0', '', '2023-05-28 01:00:00');
INSERT INTO `sys_job_log` VALUES (413, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：47毫秒', '0', '', '2023-05-28 01:00:00');
INSERT INTO `sys_job_log` VALUES (414, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：52毫秒', '0', '', '2023-05-28 01:00:00');
INSERT INTO `sys_job_log` VALUES (415, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：62毫秒', '0', '', '2023-05-28 01:00:00');
INSERT INTO `sys_job_log` VALUES (416, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：64毫秒', '0', '', '2023-05-28 01:00:00');
INSERT INTO `sys_job_log` VALUES (417, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：54毫秒', '0', '', '2023-05-29 01:00:00');
INSERT INTO `sys_job_log` VALUES (418, '冀登芳(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(296L)', '冀登芳(每周) 总共耗时：41毫秒', '0', '', '2023-05-29 01:00:00');
INSERT INTO `sys_job_log` VALUES (419, '刘春娟(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(297L)', '刘春娟(每周) 总共耗时：37毫秒', '0', '', '2023-05-29 01:00:00');
INSERT INTO `sys_job_log` VALUES (420, '徐苗苗(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(299L)', '徐苗苗(每周) 总共耗时：45毫秒', '0', '', '2023-05-29 01:00:00');
INSERT INTO `sys_job_log` VALUES (421, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：51毫秒', '0', '', '2023-05-29 01:00:00');
INSERT INTO `sys_job_log` VALUES (422, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：48毫秒', '0', '', '2023-05-29 01:00:00');
INSERT INTO `sys_job_log` VALUES (423, '柳娜(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(298L)', '柳娜(每周) 总共耗时：44毫秒', '0', '', '2023-05-29 01:00:00');
INSERT INTO `sys_job_log` VALUES (424, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：55毫秒', '0', '', '2023-05-29 01:00:00');
INSERT INTO `sys_job_log` VALUES (425, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：56毫秒', '0', '', '2023-05-29 01:00:00');
INSERT INTO `sys_job_log` VALUES (426, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：57毫秒', '0', '', '2023-05-29 01:00:00');
INSERT INTO `sys_job_log` VALUES (427, '高志标（每周一次）隔油池', 'DEFAULT', 'ryTask.creatPatrolTask(379L)', '高志标（每周一次）隔油池 总共耗时：11毫秒', '0', '', '2023-05-29 01:00:00');
INSERT INTO `sys_job_log` VALUES (428, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：16毫秒', '0', '', '2023-05-29 01:00:00');
INSERT INTO `sys_job_log` VALUES (429, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：12毫秒', '0', '', '2023-05-29 01:00:00');
INSERT INTO `sys_job_log` VALUES (430, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：25毫秒', '0', '', '2023-05-30 01:00:00');
INSERT INTO `sys_job_log` VALUES (431, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：27毫秒', '0', '', '2023-05-30 01:00:00');
INSERT INTO `sys_job_log` VALUES (432, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：32毫秒', '0', '', '2023-05-30 01:00:00');
INSERT INTO `sys_job_log` VALUES (433, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：34毫秒', '0', '', '2023-05-30 01:00:00');
INSERT INTO `sys_job_log` VALUES (434, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：37毫秒', '0', '', '2023-05-30 01:00:00');
INSERT INTO `sys_job_log` VALUES (435, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：44毫秒', '0', '', '2023-05-30 01:00:00');
INSERT INTO `sys_job_log` VALUES (436, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：47毫秒', '0', '', '2023-05-30 01:00:00');
INSERT INTO `sys_job_log` VALUES (437, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：44毫秒', '0', '', '2023-05-30 01:00:00');
INSERT INTO `sys_job_log` VALUES (438, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：39毫秒', '0', '', '2023-05-31 01:00:00');
INSERT INTO `sys_job_log` VALUES (439, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：38毫秒', '0', '', '2023-05-31 01:00:00');
INSERT INTO `sys_job_log` VALUES (440, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：39毫秒', '0', '', '2023-05-31 01:00:00');
INSERT INTO `sys_job_log` VALUES (441, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：46毫秒', '0', '', '2023-05-31 01:00:00');
INSERT INTO `sys_job_log` VALUES (442, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：53毫秒', '0', '', '2023-05-31 01:00:00');
INSERT INTO `sys_job_log` VALUES (443, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：47毫秒', '0', '', '2023-05-31 01:00:00');
INSERT INTO `sys_job_log` VALUES (444, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：55毫秒', '0', '', '2023-05-31 01:00:00');
INSERT INTO `sys_job_log` VALUES (445, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：55毫秒', '0', '', '2023-05-31 01:00:00');
INSERT INTO `sys_job_log` VALUES (446, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：56毫秒', '0', '', '2023-06-01 01:00:00');
INSERT INTO `sys_job_log` VALUES (447, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：59毫秒', '0', '', '2023-06-01 01:00:00');
INSERT INTO `sys_job_log` VALUES (448, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：57毫秒', '0', '', '2023-06-01 01:00:00');
INSERT INTO `sys_job_log` VALUES (449, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：64毫秒', '0', '', '2023-06-01 01:00:00');
INSERT INTO `sys_job_log` VALUES (450, '焦祁亮（每半月）', 'DEFAULT', 'ryTask.creatPatrolTask(329L)', '焦祁亮（每半月） 总共耗时：67毫秒', '0', '', '2023-06-01 01:00:00');
INSERT INTO `sys_job_log` VALUES (451, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：79毫秒', '0', '', '2023-06-01 01:00:00');
INSERT INTO `sys_job_log` VALUES (452, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：71毫秒', '0', '', '2023-06-01 01:00:00');
INSERT INTO `sys_job_log` VALUES (453, '王建国(每半月)', 'DEFAULT', 'ryTask.creatPatrolTask(304L)', '王建国(每半月) 总共耗时：70毫秒', '0', '', '2023-06-01 01:00:00');
INSERT INTO `sys_job_log` VALUES (454, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：70毫秒', '0', '', '2023-06-01 01:00:00');
INSERT INTO `sys_job_log` VALUES (455, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：92毫秒', '0', '', '2023-06-01 01:00:00');
INSERT INTO `sys_job_log` VALUES (456, '测试1', 'DEFAULT', 'ryTask.creatPatrolTask(282L)', '测试1 总共耗时：8毫秒', '0', '', '2023-06-01 09:36:00');
INSERT INTO `sys_job_log` VALUES (457, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：37毫秒', '0', '', '2023-06-02 01:00:00');
INSERT INTO `sys_job_log` VALUES (458, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：53毫秒', '0', '', '2023-06-02 01:00:00');
INSERT INTO `sys_job_log` VALUES (459, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：41毫秒', '0', '', '2023-06-02 01:00:00');
INSERT INTO `sys_job_log` VALUES (460, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：50毫秒', '0', '', '2023-06-02 01:00:00');
INSERT INTO `sys_job_log` VALUES (461, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：44毫秒', '0', '', '2023-06-02 01:00:00');
INSERT INTO `sys_job_log` VALUES (462, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：55毫秒', '0', '', '2023-06-02 01:00:00');
INSERT INTO `sys_job_log` VALUES (463, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：58毫秒', '0', '', '2023-06-02 01:00:00');
INSERT INTO `sys_job_log` VALUES (464, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：59毫秒', '0', '', '2023-06-02 01:00:00');
INSERT INTO `sys_job_log` VALUES (465, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：725毫秒', '0', '', '2023-06-02 01:00:00');
INSERT INTO `sys_job_log` VALUES (466, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：748毫秒', '0', '', '2023-06-02 01:00:00');
INSERT INTO `sys_job_log` VALUES (467, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：920毫秒', '0', '', '2023-06-02 01:00:00');
INSERT INTO `sys_job_log` VALUES (468, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：906毫秒', '0', '', '2023-06-02 01:00:00');
INSERT INTO `sys_job_log` VALUES (469, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：928毫秒', '0', '', '2023-06-02 01:00:00');
INSERT INTO `sys_job_log` VALUES (470, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：1019毫秒', '0', '', '2023-06-02 01:00:00');
INSERT INTO `sys_job_log` VALUES (471, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：1070毫秒', '0', '', '2023-06-02 01:00:00');
INSERT INTO `sys_job_log` VALUES (472, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：1156毫秒', '0', '', '2023-06-02 01:00:00');
INSERT INTO `sys_job_log` VALUES (473, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：38毫秒', '0', '', '2023-06-03 01:00:00');
INSERT INTO `sys_job_log` VALUES (474, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：43毫秒', '0', '', '2023-06-03 01:00:00');
INSERT INTO `sys_job_log` VALUES (475, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：45毫秒', '0', '', '2023-06-03 01:00:00');
INSERT INTO `sys_job_log` VALUES (476, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：51毫秒', '0', '', '2023-06-03 01:00:00');
INSERT INTO `sys_job_log` VALUES (477, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：71毫秒', '0', '', '2023-06-03 01:00:00');
INSERT INTO `sys_job_log` VALUES (478, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：74毫秒', '0', '', '2023-06-03 01:00:00');
INSERT INTO `sys_job_log` VALUES (479, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：76毫秒', '0', '', '2023-06-03 01:00:00');
INSERT INTO `sys_job_log` VALUES (480, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：75毫秒', '0', '', '2023-06-03 01:00:00');
INSERT INTO `sys_job_log` VALUES (481, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：37毫秒', '0', '', '2023-06-04 01:00:00');
INSERT INTO `sys_job_log` VALUES (482, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：44毫秒', '0', '', '2023-06-04 01:00:00');
INSERT INTO `sys_job_log` VALUES (483, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：50毫秒', '0', '', '2023-06-04 01:00:00');
INSERT INTO `sys_job_log` VALUES (484, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：52毫秒', '0', '', '2023-06-04 01:00:00');
INSERT INTO `sys_job_log` VALUES (485, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：52毫秒', '0', '', '2023-06-04 01:00:00');
INSERT INTO `sys_job_log` VALUES (486, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：57毫秒', '0', '', '2023-06-04 01:00:00');
INSERT INTO `sys_job_log` VALUES (487, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：59毫秒', '0', '', '2023-06-04 01:00:00');
INSERT INTO `sys_job_log` VALUES (488, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：65毫秒', '0', '', '2023-06-04 01:00:00');
INSERT INTO `sys_job_log` VALUES (489, '刘春娟(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(297L)', '刘春娟(每周) 总共耗时：40毫秒', '0', '', '2023-06-05 01:00:00');
INSERT INTO `sys_job_log` VALUES (490, '冀登芳(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(296L)', '冀登芳(每周) 总共耗时：39毫秒', '0', '', '2023-06-05 01:00:00');
INSERT INTO `sys_job_log` VALUES (491, '柳娜(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(298L)', '柳娜(每周) 总共耗时：40毫秒', '0', '', '2023-06-05 01:00:00');
INSERT INTO `sys_job_log` VALUES (492, '徐苗苗(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(299L)', '徐苗苗(每周) 总共耗时：46毫秒', '0', '', '2023-06-05 01:00:00');
INSERT INTO `sys_job_log` VALUES (493, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：47毫秒', '0', '', '2023-06-05 01:00:00');
INSERT INTO `sys_job_log` VALUES (494, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：48毫秒', '0', '', '2023-06-05 01:00:00');
INSERT INTO `sys_job_log` VALUES (495, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：49毫秒', '0', '', '2023-06-05 01:00:00');
INSERT INTO `sys_job_log` VALUES (496, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：52毫秒', '0', '', '2023-06-05 01:00:00');
INSERT INTO `sys_job_log` VALUES (497, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：56毫秒', '0', '', '2023-06-05 01:00:00');
INSERT INTO `sys_job_log` VALUES (498, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：60毫秒', '0', '', '2023-06-05 01:00:00');
INSERT INTO `sys_job_log` VALUES (499, '高志标（每周一次）隔油池', 'DEFAULT', 'ryTask.creatPatrolTask(379L)', '高志标（每周一次）隔油池 总共耗时：15毫秒', '0', '', '2023-06-05 01:00:00');
INSERT INTO `sys_job_log` VALUES (500, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：17毫秒', '0', '', '2023-06-05 01:00:00');
INSERT INTO `sys_job_log` VALUES (501, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：28毫秒', '0', '', '2023-06-05 01:00:00');
INSERT INTO `sys_job_log` VALUES (502, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：32毫秒', '0', '', '2023-06-06 01:00:00');
INSERT INTO `sys_job_log` VALUES (503, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：41毫秒', '0', '', '2023-06-06 01:00:00');
INSERT INTO `sys_job_log` VALUES (504, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：35毫秒', '0', '', '2023-06-06 01:00:00');
INSERT INTO `sys_job_log` VALUES (505, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：33毫秒', '0', '', '2023-06-06 01:00:00');
INSERT INTO `sys_job_log` VALUES (506, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：45毫秒', '0', '', '2023-06-06 01:00:00');
INSERT INTO `sys_job_log` VALUES (507, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：48毫秒', '0', '', '2023-06-06 01:00:00');
INSERT INTO `sys_job_log` VALUES (508, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：43毫秒', '0', '', '2023-06-06 01:00:00');
INSERT INTO `sys_job_log` VALUES (509, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：53毫秒', '0', '', '2023-06-06 01:00:00');
INSERT INTO `sys_job_log` VALUES (510, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：40毫秒', '0', '', '2023-06-07 01:00:00');
INSERT INTO `sys_job_log` VALUES (511, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：44毫秒', '0', '', '2023-06-07 01:00:00');
INSERT INTO `sys_job_log` VALUES (512, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：55毫秒', '0', '', '2023-06-07 01:00:00');
INSERT INTO `sys_job_log` VALUES (513, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：45毫秒', '0', '', '2023-06-07 01:00:00');
INSERT INTO `sys_job_log` VALUES (514, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：54毫秒', '0', '', '2023-06-07 01:00:00');
INSERT INTO `sys_job_log` VALUES (515, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：54毫秒', '0', '', '2023-06-07 01:00:00');
INSERT INTO `sys_job_log` VALUES (516, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：56毫秒', '0', '', '2023-06-07 01:00:00');
INSERT INTO `sys_job_log` VALUES (517, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：61毫秒', '0', '', '2023-06-07 01:00:00');
INSERT INTO `sys_job_log` VALUES (518, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：30毫秒', '0', '', '2023-06-08 01:00:00');
INSERT INTO `sys_job_log` VALUES (519, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：31毫秒', '0', '', '2023-06-08 01:00:00');
INSERT INTO `sys_job_log` VALUES (520, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：39毫秒', '0', '', '2023-06-08 01:00:00');
INSERT INTO `sys_job_log` VALUES (521, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：44毫秒', '0', '', '2023-06-08 01:00:00');
INSERT INTO `sys_job_log` VALUES (522, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：46毫秒', '0', '', '2023-06-08 01:00:00');
INSERT INTO `sys_job_log` VALUES (523, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：48毫秒', '0', '', '2023-06-08 01:00:00');
INSERT INTO `sys_job_log` VALUES (524, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：49毫秒', '0', '', '2023-06-08 01:00:00');
INSERT INTO `sys_job_log` VALUES (525, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：52毫秒', '0', '', '2023-06-08 01:00:00');
INSERT INTO `sys_job_log` VALUES (526, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：35毫秒', '0', '', '2023-06-09 01:00:00');
INSERT INTO `sys_job_log` VALUES (527, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：44毫秒', '0', '', '2023-06-09 01:00:00');
INSERT INTO `sys_job_log` VALUES (528, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：47毫秒', '0', '', '2023-06-09 01:00:00');
INSERT INTO `sys_job_log` VALUES (529, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：54毫秒', '0', '', '2023-06-09 01:00:00');
INSERT INTO `sys_job_log` VALUES (530, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：54毫秒', '0', '', '2023-06-09 01:00:00');
INSERT INTO `sys_job_log` VALUES (531, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：50毫秒', '0', '', '2023-06-09 01:00:00');
INSERT INTO `sys_job_log` VALUES (532, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：61毫秒', '0', '', '2023-06-09 01:00:00');
INSERT INTO `sys_job_log` VALUES (533, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：61毫秒', '0', '', '2023-06-09 01:00:00');
INSERT INTO `sys_job_log` VALUES (534, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：36毫秒', '0', '', '2023-06-10 01:00:00');
INSERT INTO `sys_job_log` VALUES (535, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：45毫秒', '0', '', '2023-06-10 01:00:00');
INSERT INTO `sys_job_log` VALUES (536, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：43毫秒', '0', '', '2023-06-10 01:00:00');
INSERT INTO `sys_job_log` VALUES (537, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：41毫秒', '0', '', '2023-06-10 01:00:00');
INSERT INTO `sys_job_log` VALUES (538, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：53毫秒', '0', '', '2023-06-10 01:00:00');
INSERT INTO `sys_job_log` VALUES (539, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：54毫秒', '0', '', '2023-06-10 01:00:00');
INSERT INTO `sys_job_log` VALUES (540, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：57毫秒', '0', '', '2023-06-10 01:00:00');
INSERT INTO `sys_job_log` VALUES (541, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：54毫秒', '0', '', '2023-06-10 01:00:00');
INSERT INTO `sys_job_log` VALUES (542, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：33毫秒', '0', '', '2023-06-11 01:00:00');
INSERT INTO `sys_job_log` VALUES (543, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：35毫秒', '0', '', '2023-06-11 01:00:00');
INSERT INTO `sys_job_log` VALUES (544, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：38毫秒', '0', '', '2023-06-11 01:00:00');
INSERT INTO `sys_job_log` VALUES (545, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：41毫秒', '0', '', '2023-06-11 01:00:00');
INSERT INTO `sys_job_log` VALUES (546, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：44毫秒', '0', '', '2023-06-11 01:00:00');
INSERT INTO `sys_job_log` VALUES (547, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：45毫秒', '0', '', '2023-06-11 01:00:00');
INSERT INTO `sys_job_log` VALUES (548, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：48毫秒', '0', '', '2023-06-11 01:00:00');
INSERT INTO `sys_job_log` VALUES (549, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：48毫秒', '0', '', '2023-06-11 01:00:00');
INSERT INTO `sys_job_log` VALUES (550, '冀登芳(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(296L)', '冀登芳(每周) 总共耗时：35毫秒', '0', '', '2023-06-12 01:00:00');
INSERT INTO `sys_job_log` VALUES (551, '刘春娟(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(297L)', '刘春娟(每周) 总共耗时：36毫秒', '0', '', '2023-06-12 01:00:00');
INSERT INTO `sys_job_log` VALUES (552, '柳娜(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(298L)', '柳娜(每周) 总共耗时：39毫秒', '0', '', '2023-06-12 01:00:00');
INSERT INTO `sys_job_log` VALUES (553, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：50毫秒', '0', '', '2023-06-12 01:00:00');
INSERT INTO `sys_job_log` VALUES (554, '徐苗苗(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(299L)', '徐苗苗(每周) 总共耗时：42毫秒', '0', '', '2023-06-12 01:00:00');
INSERT INTO `sys_job_log` VALUES (555, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：47毫秒', '0', '', '2023-06-12 01:00:00');
INSERT INTO `sys_job_log` VALUES (556, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：49毫秒', '0', '', '2023-06-12 01:00:00');
INSERT INTO `sys_job_log` VALUES (557, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：53毫秒', '0', '', '2023-06-12 01:00:00');
INSERT INTO `sys_job_log` VALUES (558, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：56毫秒', '0', '', '2023-06-12 01:00:00');
INSERT INTO `sys_job_log` VALUES (559, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：48毫秒', '0', '', '2023-06-12 01:00:00');
INSERT INTO `sys_job_log` VALUES (560, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：12毫秒', '0', '', '2023-06-12 01:00:00');
INSERT INTO `sys_job_log` VALUES (561, '高志标（每周一次）隔油池', 'DEFAULT', 'ryTask.creatPatrolTask(379L)', '高志标（每周一次）隔油池 总共耗时：10毫秒', '0', '', '2023-06-12 01:00:00');
INSERT INTO `sys_job_log` VALUES (562, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：15毫秒', '0', '', '2023-06-12 01:00:00');
INSERT INTO `sys_job_log` VALUES (563, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：43毫秒', '0', '', '2023-06-13 01:00:00');
INSERT INTO `sys_job_log` VALUES (564, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：54毫秒', '0', '', '2023-06-13 01:00:00');
INSERT INTO `sys_job_log` VALUES (565, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：45毫秒', '0', '', '2023-06-13 01:00:00');
INSERT INTO `sys_job_log` VALUES (566, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：45毫秒', '0', '', '2023-06-13 01:00:00');
INSERT INTO `sys_job_log` VALUES (567, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：52毫秒', '0', '', '2023-06-13 01:00:00');
INSERT INTO `sys_job_log` VALUES (568, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：54毫秒', '0', '', '2023-06-13 01:00:00');
INSERT INTO `sys_job_log` VALUES (569, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：53毫秒', '0', '', '2023-06-13 01:00:00');
INSERT INTO `sys_job_log` VALUES (570, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：61毫秒', '0', '', '2023-06-13 01:00:00');
INSERT INTO `sys_job_log` VALUES (571, '测试1', 'DEFAULT', 'ryTask.creatPatrolTask(282L)', '测试1 总共耗时：256毫秒', '1', 'java.lang.reflect.InvocationTargetException\r\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:50)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:31)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:16)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:40)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: org.springframework.data.redis.RedisSystemException: Error in execution; nested exception is io.lettuce.core.RedisCommandExecutionException: ERR invalid expire time in \'setex\' command\r\n	at org.springframework.data.redis.connection.lettuce.LettuceExceptionConverter.convert(LettuceExceptionConverter.java:54)\r\n	at org.springframework.data.redis.connection.lettuce.LettuceExceptionConverter.convert(LettuceExceptionConverter.java:52)\r\n	at org.springframework.data.redis.connection.lettuce.LettuceExceptionConverter.convert(LettuceExceptionConverter.java:41)\r\n	at org.springframework.data.redis.PassThroughExceptionTranslationStrategy.translate(PassThroughExceptionTranslationStrategy.java:44)\r\n	at org.springframework.data.redis.FallbackExceptionTranslationStrategy.translate(FallbackExceptionTranslationStrategy.java:42)\r\n	at org.springframework.data.redis.connection.lettuce.LettuceConnection.convertLettuceAccessException(LettuceConnection.java:271)\r\n	at org.springframework.data.redis.connection.lettuce.LettuceConnection.await(LettuceConnection.java:1062)\r\n	at org.springframework.data.redis', '2023-06-13 16:19:33');
INSERT INTO `sys_job_log` VALUES (572, '测试1', 'DEFAULT', 'ryTask.creatPatrolTask(282L)', '测试1 总共耗时：200毫秒', '0', '', '2023-06-13 16:22:54');
INSERT INTO `sys_job_log` VALUES (573, '测试1', 'DEFAULT', 'ryTask.creatPatrolTask(282L)', '测试1 总共耗时：213毫秒', '0', '', '2023-06-13 16:46:01');
INSERT INTO `sys_job_log` VALUES (574, '测试1', 'DEFAULT', 'ryTask.creatPatrolTask(282L)', '测试1 总共耗时：273毫秒', '0', '', '2023-06-13 16:51:31');
INSERT INTO `sys_job_log` VALUES (575, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：273毫秒', '0', '', '2023-06-14 01:00:00');
INSERT INTO `sys_job_log` VALUES (576, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：267毫秒', '0', '', '2023-06-14 01:00:00');
INSERT INTO `sys_job_log` VALUES (577, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：297毫秒', '0', '', '2023-06-14 01:00:00');
INSERT INTO `sys_job_log` VALUES (578, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：360毫秒', '0', '', '2023-06-14 01:00:00');
INSERT INTO `sys_job_log` VALUES (579, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：380毫秒', '0', '', '2023-06-14 01:00:00');
INSERT INTO `sys_job_log` VALUES (580, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：394毫秒', '0', '', '2023-06-14 01:00:00');
INSERT INTO `sys_job_log` VALUES (581, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：454毫秒', '0', '', '2023-06-14 01:00:00');
INSERT INTO `sys_job_log` VALUES (582, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：464毫秒', '0', '', '2023-06-14 01:00:00');
INSERT INTO `sys_job_log` VALUES (583, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：228毫秒', '0', '', '2023-06-14 09:06:27');
INSERT INTO `sys_job_log` VALUES (584, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：144毫秒', '0', '', '2023-06-14 09:08:17');
INSERT INTO `sys_job_log` VALUES (585, '冀登芳(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(296L)', '冀登芳(每周) 总共耗时：160毫秒', '0', '', '2023-06-14 11:31:09');
INSERT INTO `sys_job_log` VALUES (586, '冀登芳(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(296L)', '冀登芳(每周) 总共耗时：261毫秒', '0', '', '2023-06-14 11:42:56');
INSERT INTO `sys_job_log` VALUES (587, '冀登芳(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(296L)', '冀登芳(每周) 总共耗时：30056毫秒', '0', '', '2023-06-14 11:44:26');
INSERT INTO `sys_job_log` VALUES (588, '冀登芳(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(296L)', '冀登芳(每周) 总共耗时：239毫秒', '0', '', '2023-06-14 13:23:17');
INSERT INTO `sys_job_log` VALUES (589, '冀登芳(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(296L)', '冀登芳(每周) 总共耗时：13079毫秒', '0', '', '2023-06-14 13:24:46');
INSERT INTO `sys_job_log` VALUES (590, '冀登芳(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(296L)', '冀登芳(每周) 总共耗时：30911毫秒', '0', '', '2023-06-14 13:29:04');
INSERT INTO `sys_job_log` VALUES (591, '冀登芳(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(296L)', '冀登芳(每周) 总共耗时：198毫秒', '0', '', '2023-06-14 13:53:16');
INSERT INTO `sys_job_log` VALUES (592, '刘春娟(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(297L)', '刘春娟(每周) 总共耗时：132毫秒', '0', '', '2023-06-14 13:54:14');
INSERT INTO `sys_job_log` VALUES (593, '柳娜(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(298L)', '柳娜(每周) 总共耗时：225毫秒', '0', '', '2023-06-14 13:54:17');
INSERT INTO `sys_job_log` VALUES (594, '徐苗苗(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(299L)', '徐苗苗(每周) 总共耗时：132毫秒', '0', '', '2023-06-14 13:54:20');
INSERT INTO `sys_job_log` VALUES (595, '王建国(每半月)', 'DEFAULT', 'ryTask.creatPatrolTask(304L)', '王建国(每半月) 总共耗时：225毫秒', '0', '', '2023-06-14 13:54:44');
INSERT INTO `sys_job_log` VALUES (596, '焦祁亮（每半月）', 'DEFAULT', 'ryTask.creatPatrolTask(329L)', '焦祁亮（每半月） 总共耗时：129毫秒', '0', '', '2023-06-14 13:54:51');
INSERT INTO `sys_job_log` VALUES (597, '高志标（每周一次）隔油池', 'DEFAULT', 'ryTask.creatPatrolTask(379L)', '高志标（每周一次）隔油池 总共耗时：211毫秒', '0', '', '2023-06-14 13:54:54');
INSERT INTO `sys_job_log` VALUES (598, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：771毫秒', '0', '', '2023-06-19 17:00:00');
INSERT INTO `sys_job_log` VALUES (599, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：747毫秒', '0', '', '2023-06-19 17:00:00');
INSERT INTO `sys_job_log` VALUES (600, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：747毫秒', '0', '', '2023-06-19 17:00:00');
INSERT INTO `sys_job_log` VALUES (601, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：753毫秒', '0', '', '2023-06-19 17:00:00');
INSERT INTO `sys_job_log` VALUES (602, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：770毫秒', '0', '', '2023-06-19 17:00:00');
INSERT INTO `sys_job_log` VALUES (603, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：777毫秒', '0', '', '2023-06-19 17:00:00');
INSERT INTO `sys_job_log` VALUES (604, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：855毫秒', '0', '', '2023-06-19 17:00:00');
INSERT INTO `sys_job_log` VALUES (605, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：855毫秒', '0', '', '2023-06-19 17:00:00');
INSERT INTO `sys_job_log` VALUES (606, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：376毫秒', '0', '', '2023-06-20 17:00:01');
INSERT INTO `sys_job_log` VALUES (607, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：419毫秒', '0', '', '2023-06-20 17:00:01');
INSERT INTO `sys_job_log` VALUES (608, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：421毫秒', '0', '', '2023-06-20 17:00:01');
INSERT INTO `sys_job_log` VALUES (609, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：416毫秒', '0', '', '2023-06-20 17:00:01');
INSERT INTO `sys_job_log` VALUES (610, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：444毫秒', '0', '', '2023-06-20 17:00:01');
INSERT INTO `sys_job_log` VALUES (611, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：507毫秒', '0', '', '2023-06-20 17:00:01');
INSERT INTO `sys_job_log` VALUES (612, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：533毫秒', '0', '', '2023-06-20 17:00:01');
INSERT INTO `sys_job_log` VALUES (613, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：538毫秒', '0', '', '2023-06-20 17:00:01');
INSERT INTO `sys_job_log` VALUES (614, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：321毫秒', '0', '', '2023-06-21 17:00:01');
INSERT INTO `sys_job_log` VALUES (615, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：320毫秒', '0', '', '2023-06-21 17:00:01');
INSERT INTO `sys_job_log` VALUES (616, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：327毫秒', '0', '', '2023-06-21 17:00:01');
INSERT INTO `sys_job_log` VALUES (617, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：452毫秒', '0', '', '2023-06-21 17:00:01');
INSERT INTO `sys_job_log` VALUES (618, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：501毫秒', '0', '', '2023-06-21 17:00:01');
INSERT INTO `sys_job_log` VALUES (619, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：502毫秒', '0', '', '2023-06-21 17:00:01');
INSERT INTO `sys_job_log` VALUES (620, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：550毫秒', '0', '', '2023-06-21 17:00:01');
INSERT INTO `sys_job_log` VALUES (621, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：580毫秒', '0', '', '2023-06-21 17:00:01');
INSERT INTO `sys_job_log` VALUES (622, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：250毫秒', '0', '', '2023-06-22 17:00:01');
INSERT INTO `sys_job_log` VALUES (623, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：414毫秒', '0', '', '2023-06-22 17:00:01');
INSERT INTO `sys_job_log` VALUES (624, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：417毫秒', '0', '', '2023-06-22 17:00:01');
INSERT INTO `sys_job_log` VALUES (625, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：418毫秒', '0', '', '2023-06-22 17:00:01');
INSERT INTO `sys_job_log` VALUES (626, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：259毫秒', '0', '', '2023-06-22 17:00:01');
INSERT INTO `sys_job_log` VALUES (627, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：272毫秒', '0', '', '2023-06-22 17:00:01');
INSERT INTO `sys_job_log` VALUES (628, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：408毫秒', '0', '', '2023-06-22 17:00:01');
INSERT INTO `sys_job_log` VALUES (629, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：413毫秒', '0', '', '2023-06-22 17:00:01');
INSERT INTO `sys_job_log` VALUES (630, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：264毫秒', '0', '', '2023-06-25 17:00:00');
INSERT INTO `sys_job_log` VALUES (631, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：256毫秒', '0', '', '2023-06-25 17:00:00');
INSERT INTO `sys_job_log` VALUES (632, '徐苗苗(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(299L)', '徐苗苗(每周) 总共耗时：320毫秒', '0', '', '2023-06-25 17:00:00');
INSERT INTO `sys_job_log` VALUES (633, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：285毫秒', '0', '', '2023-06-25 17:00:00');
INSERT INTO `sys_job_log` VALUES (634, '刘春娟(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(297L)', '刘春娟(每周) 总共耗时：288毫秒', '0', '', '2023-06-25 17:00:00');
INSERT INTO `sys_job_log` VALUES (635, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：310毫秒', '0', '', '2023-06-25 17:00:00');
INSERT INTO `sys_job_log` VALUES (636, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：401毫秒', '0', '', '2023-06-25 17:00:00');
INSERT INTO `sys_job_log` VALUES (637, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：396毫秒', '0', '', '2023-06-25 17:00:00');
INSERT INTO `sys_job_log` VALUES (638, '柳娜(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(298L)', '柳娜(每周) 总共耗时：393毫秒', '0', '', '2023-06-25 17:00:00');
INSERT INTO `sys_job_log` VALUES (639, '冀登芳(每周)', 'DEFAULT', 'ryTask.creatPatrolTask(296L)', '冀登芳(每周) 总共耗时：427毫秒', '0', '', '2023-06-25 17:00:00');
INSERT INTO `sys_job_log` VALUES (640, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：153毫秒', '0', '', '2023-06-25 17:00:00');
INSERT INTO `sys_job_log` VALUES (641, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：153毫秒', '0', '', '2023-06-25 17:00:00');
INSERT INTO `sys_job_log` VALUES (642, '高志标（每周一次）隔油池', 'DEFAULT', 'ryTask.creatPatrolTask(379L)', '高志标（每周一次）隔油池 总共耗时：155毫秒', '0', '', '2023-06-25 17:00:00');
INSERT INTO `sys_job_log` VALUES (643, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：282毫秒', '0', '', '2023-06-26 17:00:00');
INSERT INTO `sys_job_log` VALUES (644, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：316毫秒', '0', '', '2023-06-26 17:00:00');
INSERT INTO `sys_job_log` VALUES (645, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：250毫秒', '0', '', '2023-06-26 17:00:00');
INSERT INTO `sys_job_log` VALUES (646, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：274毫秒', '0', '', '2023-06-26 17:00:00');
INSERT INTO `sys_job_log` VALUES (647, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：180毫秒', '0', '', '2023-06-26 17:00:00');
INSERT INTO `sys_job_log` VALUES (648, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：241毫秒', '0', '', '2023-06-26 17:00:00');
INSERT INTO `sys_job_log` VALUES (649, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：316毫秒', '0', '', '2023-06-26 17:00:00');
INSERT INTO `sys_job_log` VALUES (650, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：342毫秒', '0', '', '2023-06-26 17:00:00');
INSERT INTO `sys_job_log` VALUES (651, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：256毫秒', '0', '', '2023-06-27 17:00:00');
INSERT INTO `sys_job_log` VALUES (652, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：188毫秒', '0', '', '2023-06-27 17:00:00');
INSERT INTO `sys_job_log` VALUES (653, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：256毫秒', '0', '', '2023-06-27 17:00:00');
INSERT INTO `sys_job_log` VALUES (654, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：304毫秒', '0', '', '2023-06-27 17:00:00');
INSERT INTO `sys_job_log` VALUES (655, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：306毫秒', '0', '', '2023-06-27 17:00:00');
INSERT INTO `sys_job_log` VALUES (656, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：364毫秒', '0', '', '2023-06-27 17:00:00');
INSERT INTO `sys_job_log` VALUES (657, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：364毫秒', '0', '', '2023-06-27 17:00:00');
INSERT INTO `sys_job_log` VALUES (658, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：389毫秒', '0', '', '2023-06-27 17:00:00');
INSERT INTO `sys_job_log` VALUES (659, '高志标(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(302L)', '高志标(每天) 总共耗时：218毫秒', '0', '', '2023-06-28 17:00:00');
INSERT INTO `sys_job_log` VALUES (660, '陈德胜(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(301L)', '陈德胜(每天) 总共耗时：218毫秒', '0', '', '2023-06-28 17:00:00');
INSERT INTO `sys_job_log` VALUES (661, '刘宝军(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(300L)', '刘宝军(每天) 总共耗时：243毫秒', '0', '', '2023-06-28 17:00:00');
INSERT INTO `sys_job_log` VALUES (662, '祁守华(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(306L)', '祁守华(每天一次) 总共耗时：348毫秒', '0', '', '2023-06-28 17:00:00');
INSERT INTO `sys_job_log` VALUES (663, '王启洪(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(307L)', '王启洪(每天一次) 总共耗时：348毫秒', '0', '', '2023-06-28 17:00:00');
INSERT INTO `sys_job_log` VALUES (664, '陈小龙(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(308L)', '陈小龙(每天一次) 总共耗时：351毫秒', '0', '', '2023-06-28 17:00:00');
INSERT INTO `sys_job_log` VALUES (665, '袁树(每天一次)', 'DEFAULT', 'ryTask.creatPatrolTask(305L)', '袁树(每天一次) 总共耗时：349毫秒', '0', '', '2023-06-28 17:00:00');
INSERT INTO `sys_job_log` VALUES (666, '程建林(每天)', 'DEFAULT', 'ryTask.creatPatrolTask(303L)', '程建林(每天) 总共耗时：351毫秒', '0', '', '2023-06-28 17:00:00');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3120 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (2838, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-13 15:38:36');
INSERT INTO `sys_logininfor` VALUES (2839, '912996617', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-13 15:44:46');
INSERT INTO `sys_logininfor` VALUES (2840, '912996617', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-13 15:45:00');
INSERT INTO `sys_logininfor` VALUES (2841, '912996617', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-13 15:45:01');
INSERT INTO `sys_logininfor` VALUES (2842, '912996617', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-13 15:45:06');
INSERT INTO `sys_logininfor` VALUES (2843, '17732704567', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-13 15:56:31');
INSERT INTO `sys_logininfor` VALUES (2844, '17732704567', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-13 15:56:32');
INSERT INTO `sys_logininfor` VALUES (2845, '17732704567', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-13 15:56:39');
INSERT INTO `sys_logininfor` VALUES (2846, '17732704567', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-13 15:56:39');
INSERT INTO `sys_logininfor` VALUES (2847, '17732704567', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-13 15:56:39');
INSERT INTO `sys_logininfor` VALUES (2848, '17732704567', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-13 15:56:39');
INSERT INTO `sys_logininfor` VALUES (2849, '17330138136', '192.168.1.5', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2023-06-13 15:58:07');
INSERT INTO `sys_logininfor` VALUES (2850, '912996617', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-13 16:04:03');
INSERT INTO `sys_logininfor` VALUES (2851, '912996617', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-13 16:06:19');
INSERT INTO `sys_logininfor` VALUES (2852, '912996617', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '退出成功', '2023-06-13 16:06:30');
INSERT INTO `sys_logininfor` VALUES (2853, '17732704567', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-13 16:06:46');
INSERT INTO `sys_logininfor` VALUES (2854, '912996617', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-13 16:08:44');
INSERT INTO `sys_logininfor` VALUES (2855, '912996617', '192.168.1.5', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2023-06-13 16:09:50');
INSERT INTO `sys_logininfor` VALUES (2856, '912996617', '192.168.1.5', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2023-06-13 16:10:34');
INSERT INTO `sys_logininfor` VALUES (2857, '912996617', '192.168.1.5', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2023-06-13 16:11:05');
INSERT INTO `sys_logininfor` VALUES (2858, '', '192.168.1.5', '内网IP', 'Chrome 9', 'Windows 10', '1', '* 必须填写', '2023-06-13 16:14:37');
INSERT INTO `sys_logininfor` VALUES (2859, '', '192.168.1.5', '内网IP', 'Chrome 9', 'Windows 10', '1', '* 必须填写', '2023-06-13 16:14:38');
INSERT INTO `sys_logininfor` VALUES (2860, '', '192.168.1.5', '内网IP', 'Chrome 9', 'Windows 10', '1', '* 必须填写', '2023-06-13 16:14:40');
INSERT INTO `sys_logininfor` VALUES (2861, '', '192.168.1.5', '内网IP', 'Chrome 9', 'Windows 10', '1', '* 必须填写', '2023-06-13 16:14:41');
INSERT INTO `sys_logininfor` VALUES (2862, '', '192.168.1.5', '内网IP', 'Chrome 9', 'Windows 10', '1', '* 必须填写', '2023-06-13 16:17:58');
INSERT INTO `sys_logininfor` VALUES (2863, '', '192.168.1.5', '内网IP', 'Chrome 9', 'Windows 10', '1', '* 必须填写', '2023-06-13 16:17:59');
INSERT INTO `sys_logininfor` VALUES (2864, '', '192.168.1.5', '内网IP', 'Chrome 9', 'Windows 10', '1', '* 必须填写', '2023-06-13 16:18:01');
INSERT INTO `sys_logininfor` VALUES (2865, '', '192.168.1.5', '内网IP', 'Chrome 9', 'Windows 10', '1', '* 必须填写', '2023-06-13 16:18:02');
INSERT INTO `sys_logininfor` VALUES (2866, '', '192.168.1.5', '内网IP', 'Chrome 9', 'Windows 10', '1', '* 必须填写', '2023-06-13 16:23:45');
INSERT INTO `sys_logininfor` VALUES (2867, '', '192.168.1.5', '内网IP', 'Chrome 9', 'Windows 10', '1', '* 必须填写', '2023-06-13 16:23:46');
INSERT INTO `sys_logininfor` VALUES (2868, '', '192.168.1.5', '内网IP', 'Chrome 9', 'Windows 10', '1', '* 必须填写', '2023-06-13 16:23:48');
INSERT INTO `sys_logininfor` VALUES (2869, '', '192.168.1.5', '内网IP', 'Chrome 9', 'Windows 10', '1', '* 必须填写', '2023-06-13 16:23:49');
INSERT INTO `sys_logininfor` VALUES (2870, '', '192.168.1.5', '内网IP', 'Chrome 9', 'Windows 10', '1', '* 必须填写', '2023-06-13 16:29:21');
INSERT INTO `sys_logininfor` VALUES (2871, '', '192.168.1.5', '内网IP', 'Chrome 9', 'Windows 10', '1', '* 必须填写', '2023-06-13 16:29:22');
INSERT INTO `sys_logininfor` VALUES (2872, '', '192.168.1.5', '内网IP', 'Chrome 9', 'Windows 10', '1', '* 必须填写', '2023-06-13 16:29:24');
INSERT INTO `sys_logininfor` VALUES (2873, '', '192.168.1.5', '内网IP', 'Chrome 9', 'Windows 10', '1', '* 必须填写', '2023-06-13 16:29:25');
INSERT INTO `sys_logininfor` VALUES (2874, '912996617', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-13 16:38:07');
INSERT INTO `sys_logininfor` VALUES (2875, '912996617', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-13 16:38:07');
INSERT INTO `sys_logininfor` VALUES (2876, '912996617', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-13 16:38:07');
INSERT INTO `sys_logininfor` VALUES (2877, '912996617', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-13 16:38:07');
INSERT INTO `sys_logininfor` VALUES (2878, '912996617', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-13 16:38:08');
INSERT INTO `sys_logininfor` VALUES (2879, '912996617', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-13 16:38:08');
INSERT INTO `sys_logininfor` VALUES (2880, '912996617', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-13 16:38:15');
INSERT INTO `sys_logininfor` VALUES (2881, '912996617', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-13 16:38:19');
INSERT INTO `sys_logininfor` VALUES (2882, '912996617', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-13 16:38:25');
INSERT INTO `sys_logininfor` VALUES (2883, '912996617', '192.168.1.5', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2023-06-13 16:38:54');
INSERT INTO `sys_logininfor` VALUES (2884, '17732704567', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-13 17:40:08');
INSERT INTO `sys_logininfor` VALUES (2885, '17732704567', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-13 17:40:08');
INSERT INTO `sys_logininfor` VALUES (2886, '17732704567', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-13 17:40:12');
INSERT INTO `sys_logininfor` VALUES (2887, '18331353727', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-13 19:21:53');
INSERT INTO `sys_logininfor` VALUES (2888, '19898998690', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-13 19:27:02');
INSERT INTO `sys_logininfor` VALUES (2889, '18034036517', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-13 19:30:31');
INSERT INTO `sys_logininfor` VALUES (2890, '18034036517', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-13 19:30:34');
INSERT INTO `sys_logininfor` VALUES (2891, '18034036517', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-13 19:30:35');
INSERT INTO `sys_logininfor` VALUES (2892, '13784563079', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-13 20:03:43');
INSERT INTO `sys_logininfor` VALUES (2893, '13784563079', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-13 20:03:44');
INSERT INTO `sys_logininfor` VALUES (2894, '13784563079', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-13 20:03:47');
INSERT INTO `sys_logininfor` VALUES (2895, '13784563079', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-13 20:03:57');
INSERT INTO `sys_logininfor` VALUES (2896, '13784563079', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-13 20:04:00');
INSERT INTO `sys_logininfor` VALUES (2897, '18331353727', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-13 23:08:24');
INSERT INTO `sys_logininfor` VALUES (2898, '18331353727', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-13 23:08:27');
INSERT INTO `sys_logininfor` VALUES (2899, '19898998690', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-14 01:05:23');
INSERT INTO `sys_logininfor` VALUES (2900, '19898998690', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-14 01:05:23');
INSERT INTO `sys_logininfor` VALUES (2901, '19898998690', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-14 01:05:24');
INSERT INTO `sys_logininfor` VALUES (2902, '19898998690', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-14 01:05:24');
INSERT INTO `sys_logininfor` VALUES (2903, '19898998690', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-14 01:05:24');
INSERT INTO `sys_logininfor` VALUES (2904, '19898998690', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-14 01:05:25');
INSERT INTO `sys_logininfor` VALUES (2905, '19898998690', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-14 01:05:26');
INSERT INTO `sys_logininfor` VALUES (2906, '19898998690', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-14 01:05:28');
INSERT INTO `sys_logininfor` VALUES (2907, '19898998690', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-14 01:05:29');
INSERT INTO `sys_logininfor` VALUES (2908, '19898998690', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-14 01:05:29');
INSERT INTO `sys_logininfor` VALUES (2909, '19898998690', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-14 01:05:30');
INSERT INTO `sys_logininfor` VALUES (2910, '19898998690', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-14 01:05:31');
INSERT INTO `sys_logininfor` VALUES (2911, '19898998690', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-14 01:05:31');
INSERT INTO `sys_logininfor` VALUES (2912, '19898998690', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-14 01:05:31');
INSERT INTO `sys_logininfor` VALUES (2913, '19898998690', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-14 01:05:32');
INSERT INTO `sys_logininfor` VALUES (2914, '19898998690', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-14 01:05:32');
INSERT INTO `sys_logininfor` VALUES (2915, '19898998690', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-14 01:05:35');
INSERT INTO `sys_logininfor` VALUES (2916, '19898998690', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-14 01:05:38');
INSERT INTO `sys_logininfor` VALUES (2917, '19898998690', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-14 01:05:40');
INSERT INTO `sys_logininfor` VALUES (2918, '19898998690', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-14 01:05:41');
INSERT INTO `sys_logininfor` VALUES (2919, '19898998690', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-14 01:05:41');
INSERT INTO `sys_logininfor` VALUES (2920, '19898998690', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-14 01:16:24');
INSERT INTO `sys_logininfor` VALUES (2921, '19898998690', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-14 01:16:40');
INSERT INTO `sys_logininfor` VALUES (2922, '19898998690', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android Mobile', '0', '登录成功', '2023-06-14 02:14:20');
INSERT INTO `sys_logininfor` VALUES (2923, '18034036517', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-14 05:31:40');
INSERT INTO `sys_logininfor` VALUES (2924, '19898998690', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-14 06:03:50');
INSERT INTO `sys_logininfor` VALUES (2925, '19898998690', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-14 06:04:14');
INSERT INTO `sys_logininfor` VALUES (2926, '13784563079', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-14 07:20:55');
INSERT INTO `sys_logininfor` VALUES (2927, '18032376958', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android Mobile', '0', '登录成功', '2023-06-14 09:03:05');
INSERT INTO `sys_logininfor` VALUES (2928, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-14 09:06:16');
INSERT INTO `sys_logininfor` VALUES (2929, '17732704567', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-14 09:21:21');
INSERT INTO `sys_logininfor` VALUES (2930, '17330138136', '192.168.1.5', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2023-06-14 10:11:39');
INSERT INTO `sys_logininfor` VALUES (2931, '17330138136', '192.168.1.5', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2023-06-14 10:11:40');
INSERT INTO `sys_logininfor` VALUES (2932, '17330138136', '192.168.1.5', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2023-06-14 10:11:41');
INSERT INTO `sys_logininfor` VALUES (2933, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-14 10:34:26');
INSERT INTO `sys_logininfor` VALUES (2934, '18032376958', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android Mobile', '0', '登录成功', '2023-06-14 10:37:14');
INSERT INTO `sys_logininfor` VALUES (2935, '18032376958', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android Mobile', '0', '登录成功', '2023-06-14 10:37:14');
INSERT INTO `sys_logininfor` VALUES (2936, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-06-14 10:38:34');
INSERT INTO `sys_logininfor` VALUES (2937, '18032139488', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-14 10:38:44');
INSERT INTO `sys_logininfor` VALUES (2938, '912996617', '192.168.1.5', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2023-06-14 11:01:46');
INSERT INTO `sys_logininfor` VALUES (2939, 'hebeichanzhi', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-14 11:01:59');
INSERT INTO `sys_logininfor` VALUES (2940, 'hebeichanzhi', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-14 11:02:03');
INSERT INTO `sys_logininfor` VALUES (2941, 'hebeichanzhi', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-14 11:05:25');
INSERT INTO `sys_logininfor` VALUES (2942, 'hebeichanzhi', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '退出成功', '2023-06-14 11:11:43');
INSERT INTO `sys_logininfor` VALUES (2943, 'hebeichanzhi', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-14 11:12:01');
INSERT INTO `sys_logininfor` VALUES (2944, 'weixiubumen', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-14 11:15:10');
INSERT INTO `sys_logininfor` VALUES (2945, 'weixiubumen', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '退出成功', '2023-06-14 11:15:20');
INSERT INTO `sys_logininfor` VALUES (2946, 'weixiubumen', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-14 11:15:34');
INSERT INTO `sys_logininfor` VALUES (2947, 'weixiubumen', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '退出成功', '2023-06-14 11:15:48');
INSERT INTO `sys_logininfor` VALUES (2948, '912996617', '192.168.1.5', '内网IP', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2023-06-14 11:15:51');
INSERT INTO `sys_logininfor` VALUES (2949, 'weixiubumen', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-14 11:16:13');
INSERT INTO `sys_logininfor` VALUES (2950, 'weixiubumen', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '退出成功', '2023-06-14 11:23:21');
INSERT INTO `sys_logininfor` VALUES (2951, 'weixiubumen', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-14 11:23:34');
INSERT INTO `sys_logininfor` VALUES (2952, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-14 13:23:11');
INSERT INTO `sys_logininfor` VALUES (2953, '13784563079', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-14 15:40:28');
INSERT INTO `sys_logininfor` VALUES (2954, '18331353727', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-14 17:45:48');
INSERT INTO `sys_logininfor` VALUES (2955, '18131337431', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android Mobile', '0', '登录成功', '2023-06-14 18:16:18');
INSERT INTO `sys_logininfor` VALUES (2956, '18131337431', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android Mobile', '0', '登录成功', '2023-06-14 18:16:18');
INSERT INTO `sys_logininfor` VALUES (2957, '18131337431', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android Mobile', '0', '登录成功', '2023-06-14 18:16:19');
INSERT INTO `sys_logininfor` VALUES (2958, '18131337431', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android Mobile', '0', '登录成功', '2023-06-14 18:16:21');
INSERT INTO `sys_logininfor` VALUES (2959, '18131337431', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android Mobile', '0', '登录成功', '2023-06-14 18:16:22');
INSERT INTO `sys_logininfor` VALUES (2960, '18131337431', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android Mobile', '0', '登录成功', '2023-06-14 18:16:22');
INSERT INTO `sys_logininfor` VALUES (2961, '18131337431', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android Mobile', '0', '登录成功', '2023-06-14 18:16:23');
INSERT INTO `sys_logininfor` VALUES (2962, '13784563079', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-14 19:48:52');
INSERT INTO `sys_logininfor` VALUES (2963, '13784563079', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-14 19:48:56');
INSERT INTO `sys_logininfor` VALUES (2964, '13784563079', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-14 19:49:00');
INSERT INTO `sys_logininfor` VALUES (2965, '13784563079', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-06-14 19:49:06');
INSERT INTO `sys_logininfor` VALUES (2966, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-06-15 09:03:57');
INSERT INTO `sys_logininfor` VALUES (2967, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-06-15 09:03:57');
INSERT INTO `sys_logininfor` VALUES (2968, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误2次', '2023-06-15 09:04:05');
INSERT INTO `sys_logininfor` VALUES (2969, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-06-15 09:04:05');
INSERT INTO `sys_logininfor` VALUES (2970, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-15 09:04:21');
INSERT INTO `sys_logininfor` VALUES (2971, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-15 01:53:19');
INSERT INTO `sys_logininfor` VALUES (2972, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-06-15 04:50:17');
INSERT INTO `sys_logininfor` VALUES (2973, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-06-15 04:50:17');
INSERT INTO `sys_logininfor` VALUES (2974, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误2次', '2023-06-15 04:50:25');
INSERT INTO `sys_logininfor` VALUES (2975, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-06-15 04:50:25');
INSERT INTO `sys_logininfor` VALUES (2976, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误3次', '2023-06-15 04:52:37');
INSERT INTO `sys_logininfor` VALUES (2977, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-06-15 04:52:37');
INSERT INTO `sys_logininfor` VALUES (2978, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-06-15 04:55:48');
INSERT INTO `sys_logininfor` VALUES (2979, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误4次', '2023-06-15 04:55:54');
INSERT INTO `sys_logininfor` VALUES (2980, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-06-15 04:55:54');
INSERT INTO `sys_logininfor` VALUES (2981, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误5次', '2023-06-15 04:57:50');
INSERT INTO `sys_logininfor` VALUES (2982, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-06-15 04:57:50');
INSERT INTO `sys_logininfor` VALUES (2983, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-06-15 04:59:53');
INSERT INTO `sys_logininfor` VALUES (2984, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-06-15 04:59:53');
INSERT INTO `sys_logininfor` VALUES (2985, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-06-15 05:00:36');
INSERT INTO `sys_logininfor` VALUES (2986, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-06-15 05:00:36');
INSERT INTO `sys_logininfor` VALUES (2987, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-06-15 05:03:04');
INSERT INTO `sys_logininfor` VALUES (2988, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-06-15 05:03:15');
INSERT INTO `sys_logininfor` VALUES (2989, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-06-15 05:03:28');
INSERT INTO `sys_logininfor` VALUES (2990, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-06-15 05:03:28');
INSERT INTO `sys_logininfor` VALUES (2991, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-06-15 05:04:57');
INSERT INTO `sys_logininfor` VALUES (2992, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-06-15 05:04:57');
INSERT INTO `sys_logininfor` VALUES (2993, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-06-15 05:06:21');
INSERT INTO `sys_logininfor` VALUES (2994, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-06-15 05:06:28');
INSERT INTO `sys_logininfor` VALUES (2995, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-06-15 05:06:28');
INSERT INTO `sys_logininfor` VALUES (2996, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-06-15 05:07:12');
INSERT INTO `sys_logininfor` VALUES (2997, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-06-15 05:07:12');
INSERT INTO `sys_logininfor` VALUES (2998, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-06-15 05:07:25');
INSERT INTO `sys_logininfor` VALUES (2999, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-06-15 05:07:25');
INSERT INTO `sys_logininfor` VALUES (3000, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-06-15 05:07:31');
INSERT INTO `sys_logininfor` VALUES (3001, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-06-15 05:07:31');
INSERT INTO `sys_logininfor` VALUES (3002, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-15 05:08:40');
INSERT INTO `sys_logininfor` VALUES (3003, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-06-15 05:10:25');
INSERT INTO `sys_logininfor` VALUES (3004, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-15 05:11:04');
INSERT INTO `sys_logininfor` VALUES (3005, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-06-15 05:11:23');
INSERT INTO `sys_logininfor` VALUES (3006, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-15 05:11:34');
INSERT INTO `sys_logininfor` VALUES (3007, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-06-15 05:14:15');
INSERT INTO `sys_logininfor` VALUES (3008, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-15 05:15:08');
INSERT INTO `sys_logininfor` VALUES (3009, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-06-19 01:15:01');
INSERT INTO `sys_logininfor` VALUES (3010, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-06-19 01:15:01');
INSERT INTO `sys_logininfor` VALUES (3011, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误2次', '2023-06-19 01:15:18');
INSERT INTO `sys_logininfor` VALUES (3012, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-06-19 01:15:18');
INSERT INTO `sys_logininfor` VALUES (3013, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误3次', '2023-06-19 01:16:13');
INSERT INTO `sys_logininfor` VALUES (3014, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-06-19 01:16:13');
INSERT INTO `sys_logininfor` VALUES (3015, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误4次', '2023-06-19 01:16:43');
INSERT INTO `sys_logininfor` VALUES (3016, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-06-19 01:16:43');
INSERT INTO `sys_logininfor` VALUES (3017, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误5次', '2023-06-19 01:17:37');
INSERT INTO `sys_logininfor` VALUES (3018, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-06-19 01:17:37');
INSERT INTO `sys_logininfor` VALUES (3019, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-06-19 01:17:59');
INSERT INTO `sys_logininfor` VALUES (3020, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-06-19 01:18:10');
INSERT INTO `sys_logininfor` VALUES (3021, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-06-19 01:18:23');
INSERT INTO `sys_logininfor` VALUES (3022, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-06-19 01:18:36');
INSERT INTO `sys_logininfor` VALUES (3023, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-06-19 01:18:36');
INSERT INTO `sys_logininfor` VALUES (3024, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-06-19 01:52:42');
INSERT INTO `sys_logininfor` VALUES (3025, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-06-19 01:52:42');
INSERT INTO `sys_logininfor` VALUES (3026, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误2次', '2023-06-19 01:52:52');
INSERT INTO `sys_logininfor` VALUES (3027, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-06-19 01:52:52');
INSERT INTO `sys_logininfor` VALUES (3028, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-19 01:54:21');
INSERT INTO `sys_logininfor` VALUES (3029, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-06-19 01:55:55');
INSERT INTO `sys_logininfor` VALUES (3030, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-19 01:57:05');
INSERT INTO `sys_logininfor` VALUES (3031, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-06-19 01:57:24');
INSERT INTO `sys_logininfor` VALUES (3032, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-19 01:57:31');
INSERT INTO `sys_logininfor` VALUES (3033, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-19 02:03:11');
INSERT INTO `sys_logininfor` VALUES (3034, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-19 03:07:58');
INSERT INTO `sys_logininfor` VALUES (3035, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-19 06:07:02');
INSERT INTO `sys_logininfor` VALUES (3036, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-06-19 06:27:45');
INSERT INTO `sys_logininfor` VALUES (3037, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-19 06:27:51');
INSERT INTO `sys_logininfor` VALUES (3038, 'admin', '192.168.1.224', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-20 01:47:49');
INSERT INTO `sys_logininfor` VALUES (3039, 'admin', '192.168.1.5', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-20 01:57:25');
INSERT INTO `sys_logininfor` VALUES (3040, 'admin', '192.168.1.224', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-20 06:31:01');
INSERT INTO `sys_logininfor` VALUES (3041, 'admin', '192.168.1.5', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-20 06:51:06');
INSERT INTO `sys_logininfor` VALUES (3042, 'admin', '192.168.1.5', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-06-20 06:52:46');
INSERT INTO `sys_logininfor` VALUES (3043, 'admin', '192.168.1.5', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-20 06:52:58');
INSERT INTO `sys_logininfor` VALUES (3044, 'admin', '192.168.1.224', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-21 01:32:06');
INSERT INTO `sys_logininfor` VALUES (3045, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-21 01:32:44');
INSERT INTO `sys_logininfor` VALUES (3046, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-21 02:39:40');
INSERT INTO `sys_logininfor` VALUES (3047, 'admin', '192.168.1.224', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-21 02:39:56');
INSERT INTO `sys_logininfor` VALUES (3048, 'admin', '192.168.1.224', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-21 06:08:01');
INSERT INTO `sys_logininfor` VALUES (3049, 'admin', '192.168.1.224', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-06-21 06:08:32');
INSERT INTO `sys_logininfor` VALUES (3050, 'admin', '192.168.1.224', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-21 06:08:36');
INSERT INTO `sys_logininfor` VALUES (3051, 'admin', '192.168.1.224', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-06-21 06:22:17');
INSERT INTO `sys_logininfor` VALUES (3052, 'admin', '192.168.1.224', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-21 06:22:29');
INSERT INTO `sys_logininfor` VALUES (3053, 'admin', '192.168.1.224', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-06-21 06:24:04');
INSERT INTO `sys_logininfor` VALUES (3054, 'admin', '192.168.1.224', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-21 06:24:07');
INSERT INTO `sys_logininfor` VALUES (3055, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-21 06:24:47');
INSERT INTO `sys_logininfor` VALUES (3056, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-06-21 06:25:04');
INSERT INTO `sys_logininfor` VALUES (3057, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-21 06:25:07');
INSERT INTO `sys_logininfor` VALUES (3058, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-06-21 06:26:49');
INSERT INTO `sys_logininfor` VALUES (3059, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-21 06:26:54');
INSERT INTO `sys_logininfor` VALUES (3060, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-06-21 06:28:34');
INSERT INTO `sys_logininfor` VALUES (3061, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-21 06:28:38');
INSERT INTO `sys_logininfor` VALUES (3062, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-06-21 06:35:57');
INSERT INTO `sys_logininfor` VALUES (3063, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-21 07:35:29');
INSERT INTO `sys_logininfor` VALUES (3064, 'admin', '192.168.1.5', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-06-21 07:43:30');
INSERT INTO `sys_logininfor` VALUES (3065, 'admin', '192.168.1.5', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-06-21 07:43:30');
INSERT INTO `sys_logininfor` VALUES (3066, 'admin', '192.168.1.5', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-21 07:43:38');
INSERT INTO `sys_logininfor` VALUES (3067, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-21 07:44:48');
INSERT INTO `sys_logininfor` VALUES (3068, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-21 08:47:53');
INSERT INTO `sys_logininfor` VALUES (3069, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-25 02:01:49');
INSERT INTO `sys_logininfor` VALUES (3070, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-06-25 02:20:15');
INSERT INTO `sys_logininfor` VALUES (3071, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-25 02:21:15');
INSERT INTO `sys_logininfor` VALUES (3072, 'admin', '192.168.1.223', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-25 03:22:53');
INSERT INTO `sys_logininfor` VALUES (3073, '17732704567', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-06-25 03:45:51');
INSERT INTO `sys_logininfor` VALUES (3074, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-25 06:11:49');
INSERT INTO `sys_logininfor` VALUES (3075, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-06-25 06:24:16');
INSERT INTO `sys_logininfor` VALUES (3076, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-25 06:24:20');
INSERT INTO `sys_logininfor` VALUES (3077, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-25 09:02:27');
INSERT INTO `sys_logininfor` VALUES (3078, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-25 10:10:00');
INSERT INTO `sys_logininfor` VALUES (3079, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-25 10:28:42');
INSERT INTO `sys_logininfor` VALUES (3080, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-06-26 01:01:15');
INSERT INTO `sys_logininfor` VALUES (3081, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-26 01:01:21');
INSERT INTO `sys_logininfor` VALUES (3082, 'admin', '192.168.1.19', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2023-06-26 01:03:12');
INSERT INTO `sys_logininfor` VALUES (3083, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-06-26 01:03:21');
INSERT INTO `sys_logininfor` VALUES (3084, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-06-26 01:03:41');
INSERT INTO `sys_logininfor` VALUES (3085, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-06-26 01:03:41');
INSERT INTO `sys_logininfor` VALUES (3086, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误2次', '2023-06-26 01:04:02');
INSERT INTO `sys_logininfor` VALUES (3087, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-06-26 01:04:02');
INSERT INTO `sys_logininfor` VALUES (3088, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-26 01:04:15');
INSERT INTO `sys_logininfor` VALUES (3089, 'admin', '192.168.1.11', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-06-26 01:37:04');
INSERT INTO `sys_logininfor` VALUES (3090, 'admin', '192.168.1.11', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-26 01:37:07');
INSERT INTO `sys_logininfor` VALUES (3091, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-26 01:48:11');
INSERT INTO `sys_logininfor` VALUES (3092, 'admin', '192.168.1.22', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2023-06-26 03:10:09');
INSERT INTO `sys_logininfor` VALUES (3093, 'admin', '192.168.1.22', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2023-06-26 06:11:45');
INSERT INTO `sys_logininfor` VALUES (3094, 'admin', '192.168.1.11', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-26 06:40:47');
INSERT INTO `sys_logininfor` VALUES (3095, 'admin', '192.168.1.22', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2023-06-26 09:47:25');
INSERT INTO `sys_logininfor` VALUES (3096, 'admin', '192.168.1.11', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-27 01:19:12');
INSERT INTO `sys_logininfor` VALUES (3097, 'admin', '192.168.1.9', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-06-27 01:34:11');
INSERT INTO `sys_logininfor` VALUES (3098, 'admin', '192.168.1.9', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-27 01:34:16');
INSERT INTO `sys_logininfor` VALUES (3099, 'admin', '192.168.1.12', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-27 06:51:41');
INSERT INTO `sys_logininfor` VALUES (3100, 'admin', '192.168.1.22', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2023-06-27 09:27:08');
INSERT INTO `sys_logininfor` VALUES (3101, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-06-28 06:50:38');
INSERT INTO `sys_logininfor` VALUES (3102, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-06-28 06:50:38');
INSERT INTO `sys_logininfor` VALUES (3103, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-06-28 06:50:52');
INSERT INTO `sys_logininfor` VALUES (3104, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误2次', '2023-06-28 06:50:52');
INSERT INTO `sys_logininfor` VALUES (3105, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-06-28 06:51:22');
INSERT INTO `sys_logininfor` VALUES (3106, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误3次', '2023-06-28 06:51:22');
INSERT INTO `sys_logininfor` VALUES (3107, 'admin', '192.168.1.12', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-28 07:31:29');
INSERT INTO `sys_logininfor` VALUES (3108, 'admin', '192.168.1.11', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-28 07:44:40');
INSERT INTO `sys_logininfor` VALUES (3109, 'admin', '192.168.1.22', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2023-06-28 08:38:03');
INSERT INTO `sys_logininfor` VALUES (3110, 'admin', '192.168.1.11', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-29 01:09:06');
INSERT INTO `sys_logininfor` VALUES (3111, 'admin', '192.168.1.22', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2023-06-29 01:55:49');
INSERT INTO `sys_logininfor` VALUES (3112, 'admin', '192.168.1.12', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-29 01:59:53');
INSERT INTO `sys_logininfor` VALUES (3113, '17732704567', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-06-29 02:01:25');
INSERT INTO `sys_logininfor` VALUES (3114, 'admin', '192.168.1.11', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-29 03:19:26');
INSERT INTO `sys_logininfor` VALUES (3115, 'admin', '192.168.1.11', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-29 06:26:31');
INSERT INTO `sys_logininfor` VALUES (3116, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-29 08:07:58');
INSERT INTO `sys_logininfor` VALUES (3117, 'admin', '192.168.1.5', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2023-06-29 08:10:48');
INSERT INTO `sys_logininfor` VALUES (3118, 'admin', '192.168.1.5', '内网IP', 'Chrome 10', 'Windows 7', '0', '登录成功', '2023-06-29 09:19:52');
INSERT INTO `sys_logininfor` VALUES (3119, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-29 09:28:29');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(11) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(11) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2081 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-03-24 14:38:51', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 6, 'monitor', NULL, '', 1, 0, 'M', '1', '0', '', 'monitor', 'admin', '2023-03-24 14:38:51', 'admin', '2023-04-27 14:36:33', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 7, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2023-03-24 14:38:51', 'admin', '2023-05-13 10:33:57', '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 8, 'http://ruoyi.vip', NULL, '', 0, 0, 'M', '1', '0', '', 'guide', 'admin', '2023-03-24 14:38:51', 'admin', '2023-03-30 16:28:15', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 4, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-03-24 14:38:51', 'admin', '2023-06-10 03:15:43', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 4, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-03-24 14:38:52', 'admin', '2023-05-15 12:04:22', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 6, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-03-24 14:38:52', 'admin', '2023-05-15 10:19:22', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 7, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-03-24 14:38:52', 'admin', '2023-05-15 10:19:26', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 8, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2023-03-24 14:38:52', 'admin', '2023-05-15 10:19:31', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 9, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-03-24 14:38:52', 'admin', '2023-05-15 10:19:35', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 10, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2023-03-24 14:38:52', 'admin', '2023-05-15 10:19:38', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 11, 'notice', 'system/notice/index', '', 1, 0, 'C', '1', '0', 'system:notice:list', 'message', 'admin', '2023-03-24 14:38:52', 'admin', '2023-05-15 10:19:42', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 12, 'log', '', '', 1, 0, 'M', '1', '0', '', 'log', 'admin', '2023-03-24 14:38:52', 'admin', '2023-05-15 10:19:46', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2023-03-24 14:38:53', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 0, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2023-03-24 14:38:53', 'admin', '2023-04-27 14:04:09', '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2023-03-24 14:38:53', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2023-03-24 14:38:53', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2023-03-24 14:38:53', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2023-03-24 14:38:53', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2023-03-24 14:38:53', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2023-03-24 14:38:53', 'admin', '2023-05-13 10:33:50', '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2023-03-24 14:38:53', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2023-03-24 14:38:53', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2023-03-24 14:38:54', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-03-24 14:38:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-03-24 14:38:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-03-24 14:38:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-03-24 14:38:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-03-24 14:38:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-03-24 14:38:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-03-24 14:38:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-03-24 14:38:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-03-24 14:38:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-03-24 14:38:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-03-24 14:38:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-03-24 14:38:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-03-24 14:38:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-03-24 14:38:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-03-24 14:38:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-03-24 14:38:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-03-24 14:38:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-03-24 14:38:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-03-24 14:38:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-03-24 14:38:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-03-24 14:38:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-03-24 14:38:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-03-24 14:38:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-03-24 14:38:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-03-24 14:38:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-03-24 14:38:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-03-24 14:38:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-03-24 14:38:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-03-24 14:38:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-03-24 14:38:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-03-24 14:38:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-03-24 14:38:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-03-24 14:38:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-03-24 14:38:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-03-24 14:38:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-03-24 14:38:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-03-24 14:38:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-03-24 14:38:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-03-24 14:38:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2023-03-24 14:38:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2023-03-24 14:38:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2023-03-24 14:38:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2023-03-24 14:38:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2023-03-24 14:38:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2023-03-24 14:38:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2023-03-24 14:38:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-03-24 14:38:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-03-24 14:38:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-03-24 14:38:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2023-03-24 14:38:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2023-03-24 14:38:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2023-03-24 14:38:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2023-03-24 14:38:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2023-03-24 14:38:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2023-03-24 14:39:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2023-03-24 14:39:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2023-03-24 14:39:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2023-03-24 14:39:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2023-03-24 14:39:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2023-03-24 14:39:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2023-03-24 14:39:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '员工管理', 1, 2, 'personnel', 'system/personnel/index', NULL, 1, 0, 'C', '0', '0', 'system:personnel:list', 'people', 'admin', '2023-03-27 15:58:09', 'admin', '2023-04-20 17:19:32', '员工管理菜单');
INSERT INTO `sys_menu` VALUES (2009, '员工管理查询', 2008, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:personnel:query', '#', 'admin', '2023-03-27 15:58:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '员工管理新增', 2008, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:personnel:add', '#', 'admin', '2023-03-27 15:58:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '员工管理修改', 2008, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:personnel:edit', '#', 'admin', '2023-03-27 15:58:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '员工管理删除', 2008, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:personnel:remove', '#', 'admin', '2023-03-27 15:58:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '员工管理导出', 2008, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:personnel:export', '#', 'admin', '2023-03-27 15:58:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '巡更点管理', 1, 1, 'point', 'system/point/index', NULL, 1, 0, 'C', '0', '0', 'system:point:list', 'radio', 'admin', '2023-03-29 10:20:04', 'admin', '2023-03-30 16:11:15', '巡更点管理菜单');
INSERT INTO `sys_menu` VALUES (2033, '巡更点管理查询', 2032, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:point:query', '#', 'admin', '2023-03-29 10:20:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '巡更点管理新增', 2032, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:point:add', '#', 'admin', '2023-03-29 10:20:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '巡更点管理修改', 2032, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:point:edit', '#', 'admin', '2023-03-29 10:20:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '巡更点管理删除', 2032, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:point:remove', '#', 'admin', '2023-03-29 10:20:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '巡更点管理导出', 2032, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:point:export', '#', 'admin', '2023-03-29 10:20:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '巡更任务', 0, 9, 'patrol', 'system/patrol/index', NULL, 1, 0, 'C', '0', '0', 'system:patrol:list', 'time-range', 'admin', '2023-03-31 09:41:25', 'admin', '2023-05-15 10:16:28', '巡更任务管理菜单');
INSERT INTO `sys_menu` VALUES (2041, '巡更任务管理查询', 2040, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:patrol:query', '#', 'admin', '2023-03-31 09:41:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2042, '巡更任务管理新增', 2040, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:patrol:add', '#', 'admin', '2023-03-31 09:41:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2043, '巡更任务管理修改', 2040, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:patrol:edit', '#', 'admin', '2023-03-31 09:41:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2044, '巡更任务管理删除', 2040, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:patrol:remove', '#', 'admin', '2023-03-31 09:41:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, '巡更任务管理导出', 2040, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:patrol:export', '#', 'admin', '2023-03-31 09:41:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2046, '维修任务管理', 0, 3, 'repair', 'system/repair/index', NULL, 1, 0, 'C', '1', '0', 'system:repair:list', 'list', 'admin', '2023-03-31 15:14:49', 'admin', '2023-05-15 10:16:38', '维修任务菜单');
INSERT INTO `sys_menu` VALUES (2047, '维修任务查询', 2046, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:repair:query', '#', 'admin', '2023-03-31 15:14:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2048, '维修任务新增', 2046, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:repair:add', '#', 'admin', '2023-03-31 15:14:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2049, '维修任务修改', 2046, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:repair:edit', '#', 'admin', '2023-03-31 15:14:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2050, '维修任务删除', 2046, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:repair:remove', '#', 'admin', '2023-03-31 15:14:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2051, '维修任务导出', 2046, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:repair:export', '#', 'admin', '2023-03-31 15:14:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2052, '巡更工单管理', 0, 4, 'order', 'system/patrolOrder/index', NULL, 1, 0, 'C', '0', '0', 'system:order:list', 'documentation', 'admin', '2023-03-31 16:26:14', 'admin', '2023-05-16 10:19:25', '巡更工单管理菜单');
INSERT INTO `sys_menu` VALUES (2053, '巡更工单管理查询', 2052, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:order:query', '#', 'admin', '2023-03-31 16:26:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2054, '巡更工单管理新增', 2052, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:order:add', '#', 'admin', '2023-03-31 16:26:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2055, '巡更工单管理修改', 2052, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:order:edit', '#', 'admin', '2023-03-31 16:26:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2056, '巡更工单管理删除', 2052, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:order:remove', '#', 'admin', '2023-03-31 16:26:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2057, '巡更工单管理导出', 2052, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:order:export', '#', 'admin', '2023-03-31 16:26:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2058, '维修工单管理', 0, 5, 'repairOrder', 'system/repairOrder/index', NULL, 1, 0, 'C', '1', '0', 'system:repairOrder:list', 'dict', 'admin', '2023-04-03 11:15:17', 'admin', '2023-05-14 15:28:04', '维修工单菜单');
INSERT INTO `sys_menu` VALUES (2059, '维修工单查询', 2058, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:repairOrder:query', '#', 'admin', '2023-04-03 11:15:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2060, '维修工单新增', 2058, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:repairOrder:add', '#', 'admin', '2023-04-03 11:15:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2061, '维修工单修改', 2058, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:repairOrder:edit', '#', 'admin', '2023-04-03 11:15:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2062, '维修工单删除', 2058, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:repairOrder:remove', '#', 'admin', '2023-04-03 11:15:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2063, '维修工单导出', 2058, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:repairOrder:export', '#', 'admin', '2023-04-03 11:15:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2065, '报修申请', 0, 10, 'newRrepairFrom', 'system/newRrepairFrom/index', NULL, 1, 0, 'C', '0', '0', 'system:newRrepairFrom:list', 'documentation', 'admin', '2023-05-14 14:58:48', 'admin', '2023-05-14 15:18:06', '');
INSERT INTO `sys_menu` VALUES (2066, '维修任务', 0, 11, 'newRepair', 'system/newRepair/index', NULL, 1, 0, 'C', '0', '0', 'system:newRepair:list', 'excel', 'admin', '2023-05-14 15:00:20', 'admin', '2023-05-14 15:18:12', '');
INSERT INTO `sys_menu` VALUES (2067, '维修评价', 0, 12, 'evaluate', 'system/evaluate/index', NULL, 1, 0, 'C', '0', '0', 'system:evaluate:list', 'edit', 'admin', '2023-05-14 15:01:20', 'admin', '2023-05-14 15:18:20', '');
INSERT INTO `sys_menu` VALUES (2068, '公共区域', 0, 13, 'area', 'system/area/index', NULL, 1, 0, 'C', '1', '0', 'system:area:list', 'tree', 'admin', '2023-05-14 15:02:50', 'admin', '2023-06-02 08:27:50', '');
INSERT INTO `sys_menu` VALUES (2069, '注册用户', 1, 3, 'personnel2', 'system/personnel2/index', NULL, 1, 0, 'C', '0', '0', 'system:personnel2:list', 'log', 'admin', '2023-05-14 15:04:52', 'admin', '2023-05-15 10:19:12', '');
INSERT INTO `sys_menu` VALUES (2070, '区域管理', 1, 1, 'region', 'system/region/index', NULL, 1, 0, 'C', '0', '0', 'system:region:list', 'international', 'admin', '2023-06-10 06:18:40', 'admin', '2023-06-10 06:23:50', '区域管理菜单');
INSERT INTO `sys_menu` VALUES (2071, '区域管理查询', 2070, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:region:query', '#', 'admin', '2023-06-10 06:18:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2072, '区域管理新增', 2070, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:region:add', '#', 'admin', '2023-06-10 06:18:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2073, '区域管理修改', 2070, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:region:edit', '#', 'admin', '2023-06-10 06:18:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2074, '区域管理删除', 2070, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:region:remove', '#', 'admin', '2023-06-10 06:18:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2075, '区域管理导出', 2070, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:region:export', '#', 'admin', '2023-06-10 06:18:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2076, '巡更线路管理', 1, 1, 'route', 'system/route/index', NULL, 1, 0, 'C', '0', '0', 'system:route:list', 'online', 'admin', '2023-06-29 01:18:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2077, '巡更项目', 1, 1, 'item', 'system/item/index', NULL, 1, 0, 'C', '0', '0', 'system:item:list', 'monitor', 'admin', '2023-06-29 01:23:12', 'admin', '2023-06-29 09:38:52', '');
INSERT INTO `sys_menu` VALUES (2079, '巡更点', 1, 1, 'rel', 'system/rel/index', NULL, 1, 0, 'C', '1', '0', 'system:rel:list', 'button', 'admin', '2023-06-29 03:31:14', 'admin', '2023-06-29 03:38:15', '');
INSERT INTO `sys_menu` VALUES (2080, '题目', 1, 1, 'title', 'system/title/index', NULL, 1, 0, 'C', '1', '0', 'system:title:list', 'education', 'admin', '2023-06-29 10:15:08', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(11) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(11) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(11) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6299 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (6117, '巡更任务管理', 2, 'com.ruoyi.web.controller.system.SysPatrolController.edit()', 'PUT', 1, 'admin', NULL, '/system/patrol', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-05 15:48:08\",\"params\":{},\"patrolDescribe\":\"环境部门巡更\",\"patrolEndTime\":\"2023-06-13 23:39:25\",\"patrolId\":296,\"patrolName\":\"冀登芳(每周)\",\"patrolPointIds\":[2,3,4,5,16,17],\"patrolPoints\":[{\"params\":{},\"patrolPointName\":\"2——11号楼西侧2层客电梯厅\"},{\"params\":{},\"patrolPointName\":\"3——19号楼1层电梯厅环境部\"},{\"params\":{},\"patrolPointName\":\"4——11号楼中厅2层东电梯厅\"},{\"params\":{},\"patrolPointName\":\"5——1号楼4层电梯厅\"},{\"params\":{},\"patrolPointName\":\"16——20号楼1层客电梯厅\"},{\"params\":{},\"patrolPointName\":\"17——13号楼南大门\"}],\"patrolStartTime\":\"2023-06-13 00:00:00\",\"patrolStatus\":\"0\",\"personnelIds\":[11],\"regionId\":1,\"type\":\"1\",\"updateTime\":\"2023-06-13 15:39:36\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-13 15:39:35', 175);
INSERT INTO `sys_oper_log` VALUES (6118, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.edit()', 'PUT', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2023-05-05 15:49:30\",\"cronExpression\":\"0 0 1 ? * 2\",\"invokeTarget\":\"ryTask.creatPatrolTask(296L)\",\"jobGroup\":\"DEFAULT\",\"jobId\":14,\"jobName\":\"冀登芳(每周)\",\"misfirePolicy\":\"3\",\"nextValidTime\":\"2023-06-19 01:00:00\",\"params\":{},\"regionId\":1,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-13 15:39:41', 56);
INSERT INTO `sys_oper_log` VALUES (6119, '巡更任务管理', 2, 'com.ruoyi.web.controller.system.SysPatrolController.edit()', 'PUT', 1, 'admin', NULL, '/system/patrol', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-04 14:40:28\",\"params\":{},\"patrolEndTime\":\"2023-06-14 01:00:00\",\"patrolId\":282,\"patrolName\":\"测试1\",\"patrolPointIds\":[106,107],\"patrolPoints\":[{\"params\":{},\"patrolPointName\":\"106——20号楼物业门口\"},{\"params\":{},\"patrolPointName\":\"中集测试用\"}],\"patrolStartTime\":\"2023-06-13 16:19:16\",\"patrolStatus\":\"0\",\"personnelIds\":[28],\"regionId\":1,\"type\":\"1\",\"updateTime\":\"2023-06-13 16:19:29\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-13 16:19:28', 398);
INSERT INTO `sys_oper_log` VALUES (6120, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.edit()', 'PUT', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2023-05-04 14:40:57\",\"cronExpression\":\"0 36 9 * * ?\",\"invokeTarget\":\"ryTask.creatPatrolTask(282L)\",\"jobGroup\":\"DEFAULT\",\"jobId\":10,\"jobName\":\"测试1\",\"misfirePolicy\":\"3\",\"nextValidTime\":\"2023-06-14 09:36:00\",\"params\":{},\"regionId\":1,\"remark\":\"\",\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-13 16:19:30', 104);
INSERT INTO `sys_oper_log` VALUES (6121, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":10,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-13 16:19:33', 70);
INSERT INTO `sys_oper_log` VALUES (6122, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":10,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-13 16:22:53', 54);
INSERT INTO `sys_oper_log` VALUES (6123, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":10,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-13 16:46:01', 76);
INSERT INTO `sys_oper_log` VALUES (6124, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":10,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-13 16:51:31', 81);
INSERT INTO `sys_oper_log` VALUES (6125, '巡更任务管理', 3, 'com.ruoyi.web.controller.system.SysPatrolController.remove()', 'DELETE', 1, 'admin', NULL, '/system/patrol/745', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-13 16:51:54', 169);
INSERT INTO `sys_oper_log` VALUES (6126, '巡更任务管理', 3, 'com.ruoyi.web.controller.system.SysPatrolController.remove()', 'DELETE', 1, 'admin', NULL, '/system/patrol/744', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-13 16:51:58', 168);
INSERT INTO `sys_oper_log` VALUES (6127, '巡更任务管理', 2, 'com.ruoyi.web.controller.system.SysPatrolController.edit()', 'PUT', 1, 'admin', NULL, '/system/patrol', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-05 16:10:02\",\"params\":{},\"patrolDescribe\":\"工程部门巡更\",\"patrolEndTime\":\"2023-06-14 08:30:00\",\"patrolId\":300,\"patrolName\":\"刘宝军(每天)\",\"patrolPointIds\":[51,53,54,56,57,59,60,61,62,63,64,65,66,67,68,69,70],\"patrolPoints\":[{\"params\":{},\"patrolPointName\":\"51——19号楼货梯机房太阳能\"},{\"params\":{},\"patrolPointName\":\"53——2号小配电室\"},{\"params\":{},\"patrolPointName\":\"54——消防高位水箱和3号楼电梯机房\"},{\"params\":{},\"patrolPointName\":\"56——5号配电室\"},{\"params\":{},\"patrolPointName\":\"57——中区小配电室\"},{\"params\":{},\"patrolPointName\":\"59——东区小配电室\"},{\"params\":{},\"patrolPointName\":\"60——4号配电室\"},{\"params\":{},\"patrolPointName\":\"61——4号小配电室\"},{\"params\":{},\"patrolPointName\":\"62——3号配电室\"},{\"params\":{},\"patrolPointName\":\"63——3号小配电室\"},{\"params\":{},\"patrolPointName\":\"64——西区小配电室\"},{\"params\":{},\"patrolPointName\":\"65——生活水泵房\"},{\"params\":{},\"patrolPointName\":\"66——1号小配电室\"},{\"params\":{},\"patrolPointName\":\"67——1号配电室\"},{\"params\":{},\"patrolPointName\":\"68——太阳能热水泵房\"},{\"params\":{},\"patrolPointName\":\"69——2号配电室\"},{\"params\":{},\"patrolPointName\":\"70——20号楼货梯\"}],\"patrolStartTime\":\"2023-06-13 05:30:00\",\"patrolStatus\":\"0\",\"personnelIds\":[8],\"regionId\":1,\"type\":\"1\",\"updateTime\":\"2023-06-13 16:56:21\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-13 16:56:19', 264);
INSERT INTO `sys_oper_log` VALUES (6128, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.edit()', 'PUT', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2023-05-05 16:10:39\",\"cronExpression\":\"0 0 1 * * ?\",\"invokeTarget\":\"ryTask.creatPatrolTask(300L)\",\"jobGroup\":\"DEFAULT\",\"jobId\":18,\"jobName\":\"刘宝军(每天)\",\"misfirePolicy\":\"3\",\"nextValidTime\":\"2023-06-14 01:00:00\",\"params\":{},\"regionId\":1,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-13 16:56:22', 57);
INSERT INTO `sys_oper_log` VALUES (6129, '巡更任务管理', 2, 'com.ruoyi.web.controller.system.SysPatrolController.edit()', 'PUT', 1, 'admin', NULL, '/system/patrol', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-05 16:11:50\",\"params\":{},\"patrolDescribe\":\"工程部门巡更\",\"patrolEndTime\":\"2023-06-14 08:30:00\",\"patrolId\":301,\"patrolName\":\"陈德胜(每天)\",\"patrolPointIds\":[51,53,54,56,57,59,60,61,62,63,64,65,66,67,68,69,70],\"patrolPoints\":[{\"params\":{},\"patrolPointName\":\"51——19号楼货梯机房太阳能\"},{\"params\":{},\"patrolPointName\":\"53——2号小配电室\"},{\"params\":{},\"patrolPointName\":\"54——消防高位水箱和3号楼电梯机房\"},{\"params\":{},\"patrolPointName\":\"56——5号配电室\"},{\"params\":{},\"patrolPointName\":\"57——中区小配电室\"},{\"params\":{},\"patrolPointName\":\"59——东区小配电室\"},{\"params\":{},\"patrolPointName\":\"60——4号配电室\"},{\"params\":{},\"patrolPointName\":\"61——4号小配电室\"},{\"params\":{},\"patrolPointName\":\"62——3号配电室\"},{\"params\":{},\"patrolPointName\":\"63——3号小配电室\"},{\"params\":{},\"patrolPointName\":\"64——西区小配电室\"},{\"params\":{},\"patrolPointName\":\"65——生活水泵房\"},{\"params\":{},\"patrolPointName\":\"66——1号小配电室\"},{\"params\":{},\"patrolPointName\":\"67——1号配电室\"},{\"params\":{},\"patrolPointName\":\"68——太阳能热水泵房\"},{\"params\":{},\"patrolPointName\":\"69——2号配电室\"},{\"params\":{},\"patrolPointName\":\"70——20号楼货梯\"}],\"patrolStartTime\":\"2023-06-13 17:30:00\",\"patrolStatus\":\"0\",\"personnelIds\":[13],\"regionId\":1,\"type\":\"1\",\"updateTime\":\"2023-06-13 16:57:21\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-13 16:57:19', 151);
INSERT INTO `sys_oper_log` VALUES (6130, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.edit()', 'PUT', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2023-05-05 16:12:16\",\"cronExpression\":\"0 0 1 * * ?\",\"invokeTarget\":\"ryTask.creatPatrolTask(301L)\",\"jobGroup\":\"DEFAULT\",\"jobId\":19,\"jobName\":\"陈德胜(每天)\",\"misfirePolicy\":\"3\",\"nextValidTime\":\"2023-06-14 01:00:00\",\"params\":{},\"regionId\":1,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-13 16:57:21', 54);
INSERT INTO `sys_oper_log` VALUES (6131, '巡更任务管理', 2, 'com.ruoyi.web.controller.system.SysPatrolController.edit()', 'PUT', 1, 'admin', NULL, '/system/patrol', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-05 16:10:02\",\"params\":{},\"patrolDescribe\":\"工程部门巡更\",\"patrolEndTime\":\"2023-06-14 08:30:00\",\"patrolId\":300,\"patrolName\":\"刘宝军(每天)\",\"patrolPointIds\":[51,53,54,56,57,59,60,61,62,63,64,65,66,67,68,69,70],\"patrolPoints\":[{\"params\":{},\"patrolPointName\":\"51——19号楼货梯机房太阳能\"},{\"params\":{},\"patrolPointName\":\"53——2号小配电室\"},{\"params\":{},\"patrolPointName\":\"54——消防高位水箱和3号楼电梯机房\"},{\"params\":{},\"patrolPointName\":\"56——5号配电室\"},{\"params\":{},\"patrolPointName\":\"57——中区小配电室\"},{\"params\":{},\"patrolPointName\":\"59——东区小配电室\"},{\"params\":{},\"patrolPointName\":\"60——4号配电室\"},{\"params\":{},\"patrolPointName\":\"61——4号小配电室\"},{\"params\":{},\"patrolPointName\":\"62——3号配电室\"},{\"params\":{},\"patrolPointName\":\"63——3号小配电室\"},{\"params\":{},\"patrolPointName\":\"64——西区小配电室\"},{\"params\":{},\"patrolPointName\":\"65——生活水泵房\"},{\"params\":{},\"patrolPointName\":\"66——1号小配电室\"},{\"params\":{},\"patrolPointName\":\"67——1号配电室\"},{\"params\":{},\"patrolPointName\":\"68——太阳能热水泵房\"},{\"params\":{},\"patrolPointName\":\"69——2号配电室\"},{\"params\":{},\"patrolPointName\":\"70——20号楼货梯\"}],\"patrolStartTime\":\"2023-06-13 17:30:00\",\"patrolStatus\":\"0\",\"personnelIds\":[8],\"regionId\":1,\"type\":\"1\",\"updateTime\":\"2023-06-13 16:57:33\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-13 16:57:31', 142);
INSERT INTO `sys_oper_log` VALUES (6132, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.edit()', 'PUT', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2023-05-05 16:10:39\",\"cronExpression\":\"0 0 1 * * ?\",\"invokeTarget\":\"ryTask.creatPatrolTask(300L)\",\"jobGroup\":\"DEFAULT\",\"jobId\":18,\"jobName\":\"刘宝军(每天)\",\"misfirePolicy\":\"3\",\"nextValidTime\":\"2023-06-14 01:00:00\",\"params\":{},\"regionId\":1,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-13 16:57:32', 52);
INSERT INTO `sys_oper_log` VALUES (6133, '巡更任务管理', 2, 'com.ruoyi.web.controller.system.SysPatrolController.edit()', 'PUT', 1, 'admin', NULL, '/system/patrol', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-05 16:14:00\",\"params\":{},\"patrolDescribe\":\"工程部门巡更\",\"patrolEndTime\":\"2023-06-14 08:30:00\",\"patrolId\":302,\"patrolName\":\"高志标(每天)\",\"patrolPointIds\":[51,53,54,56,57,59,60,61,62,63,64,65,66,67,68,69,70],\"patrolPoints\":[{\"params\":{},\"patrolPointName\":\"51——19号楼货梯机房太阳能\"},{\"params\":{},\"patrolPointName\":\"53——2号小配电室\"},{\"params\":{},\"patrolPointName\":\"54——消防高位水箱和3号楼电梯机房\"},{\"params\":{},\"patrolPointName\":\"56——5号配电室\"},{\"params\":{},\"patrolPointName\":\"57——中区小配电室\"},{\"params\":{},\"patrolPointName\":\"59——东区小配电室\"},{\"params\":{},\"patrolPointName\":\"60——4号配电室\"},{\"params\":{},\"patrolPointName\":\"61——4号小配电室\"},{\"params\":{},\"patrolPointName\":\"62——3号配电室\"},{\"params\":{},\"patrolPointName\":\"63——3号小配电室\"},{\"params\":{},\"patrolPointName\":\"64——西区小配电室\"},{\"params\":{},\"patrolPointName\":\"65——生活水泵房\"},{\"params\":{},\"patrolPointName\":\"66——1号小配电室\"},{\"params\":{},\"patrolPointName\":\"67——1号配电室\"},{\"params\":{},\"patrolPointName\":\"68——太阳能热水泵房\"},{\"params\":{},\"patrolPointName\":\"69——2号配电室\"},{\"params\":{},\"patrolPointName\":\"70——20号楼货梯\"}],\"patrolStartTime\":\"2023-06-13 17:30:00\",\"patrolStatus\":\"0\",\"personnelIds\":[14],\"regionId\":1,\"type\":\"1\",\"updateTime\":\"2023-06-13 16:57:57\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-13 16:57:55', 140);
INSERT INTO `sys_oper_log` VALUES (6134, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.edit()', 'PUT', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2023-05-05 16:14:13\",\"cronExpression\":\"0 0 1 * * ?\",\"invokeTarget\":\"ryTask.creatPatrolTask(302L)\",\"jobGroup\":\"DEFAULT\",\"jobId\":20,\"jobName\":\"高志标(每天)\",\"misfirePolicy\":\"3\",\"nextValidTime\":\"2023-06-14 01:00:00\",\"params\":{},\"regionId\":1,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-13 16:57:57', 52);
INSERT INTO `sys_oper_log` VALUES (6135, '巡更任务管理', 2, 'com.ruoyi.web.controller.system.SysPatrolController.edit()', 'PUT', 1, 'admin', NULL, '/system/patrol', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-05 16:15:28\",\"params\":{},\"patrolDescribe\":\"工程部门巡更\",\"patrolEndTime\":\"2023-06-13 18:00:00\",\"patrolId\":303,\"patrolName\":\"程建林(每天)\",\"patrolPointIds\":[51,53,54,56,57,59,60,61,62,63,64,65,66,67,68,69,70],\"patrolPoints\":[{\"params\":{},\"patrolPointName\":\"51——19号楼货梯机房太阳能\"},{\"params\":{},\"patrolPointName\":\"53——2号小配电室\"},{\"params\":{},\"patrolPointName\":\"54——消防高位水箱和3号楼电梯机房\"},{\"params\":{},\"patrolPointName\":\"56——5号配电室\"},{\"params\":{},\"patrolPointName\":\"57——中区小配电室\"},{\"params\":{},\"patrolPointName\":\"59——东区小配电室\"},{\"params\":{},\"patrolPointName\":\"60——4号配电室\"},{\"params\":{},\"patrolPointName\":\"61——4号小配电室\"},{\"params\":{},\"patrolPointName\":\"62——3号配电室\"},{\"params\":{},\"patrolPointName\":\"63——3号小配电室\"},{\"params\":{},\"patrolPointName\":\"64——西区小配电室\"},{\"params\":{},\"patrolPointName\":\"65——生活水泵房\"},{\"params\":{},\"patrolPointName\":\"66——1号小配电室\"},{\"params\":{},\"patrolPointName\":\"67——1号配电室\"},{\"params\":{},\"patrolPointName\":\"68——太阳能热水泵房\"},{\"params\":{},\"patrolPointName\":\"69——2号配电室\"},{\"params\":{},\"patrolPointName\":\"70——20号楼货梯\"}],\"patrolStartTime\":\"2023-06-13 08:30:00\",\"patrolStatus\":\"0\",\"personnelIds\":[15],\"regionId\":1,\"type\":\"1\",\"updateTime\":\"2023-06-13 16:58:25\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-13 16:58:24', 144);
INSERT INTO `sys_oper_log` VALUES (6136, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.edit()', 'PUT', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2023-05-05 16:15:38\",\"cronExpression\":\"0 0 1 * * ?\",\"invokeTarget\":\"ryTask.creatPatrolTask(303L)\",\"jobGroup\":\"DEFAULT\",\"jobId\":21,\"jobName\":\"程建林(每天)\",\"misfirePolicy\":\"3\",\"nextValidTime\":\"2023-06-14 01:00:00\",\"params\":{},\"regionId\":1,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-13 16:58:25', 50);
INSERT INTO `sys_oper_log` VALUES (6137, '巡更任务管理', 2, 'com.ruoyi.web.controller.system.SysPatrolController.edit()', 'PUT', 1, 'admin', NULL, '/system/patrol', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-05 16:48:33\",\"params\":{},\"patrolDescribe\":\"中控室人员巡更\",\"patrolEndTime\":\"2023-06-13 06:30:00\",\"patrolId\":308,\"patrolName\":\"陈小龙(每天一次)\",\"patrolPointIds\":[84,85,86,91,93,100,105],\"patrolPoints\":[{\"params\":{},\"patrolPointName\":\"84——11号楼中厅二层东电梯厅\"},{\"params\":{},\"patrolPointName\":\"85——20号楼一层客梯\"},{\"params\":{},\"patrolPointName\":\"86——20号楼6层客梯旁弱电间\"},{\"params\":{},\"patrolPointName\":\"91——10号楼一层电梯口\"},{\"params\":{},\"patrolPointName\":\"93——6号楼一层电梯厅\"},{\"params\":{},\"patrolPointName\":\"100——19号楼6层弱电间\"},{\"params\":{},\"patrolPointName\":\"105——19号楼一层电梯口\"}],\"patrolStartTime\":\"2023-06-13 08:30:00\",\"patrolStatus\":\"0\",\"personnelIds\":[16],\"regionId\":1,\"type\":\"1\",\"updateTime\":\"2023-06-13 16:59:08\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-13 16:59:07', 134);
INSERT INTO `sys_oper_log` VALUES (6138, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.edit()', 'PUT', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2023-05-05 16:48:42\",\"cronExpression\":\"0 0 1 * * ?\",\"invokeTarget\":\"ryTask.creatPatrolTask(308L)\",\"jobGroup\":\"DEFAULT\",\"jobId\":26,\"jobName\":\"陈小龙(每天一次)\",\"misfirePolicy\":\"3\",\"nextValidTime\":\"2023-06-14 01:00:00\",\"params\":{},\"regionId\":1,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-13 16:59:10', 52);
INSERT INTO `sys_oper_log` VALUES (6139, '巡更任务管理', 2, 'com.ruoyi.web.controller.system.SysPatrolController.edit()', 'PUT', 1, 'admin', NULL, '/system/patrol', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-05 16:47:31\",\"params\":{},\"patrolDescribe\":\"保安部门巡更\",\"patrolEndTime\":\"2023-06-13 18:00:00\",\"patrolId\":307,\"patrolName\":\"王启洪(每天一次)\",\"patrolPointIds\":[78,79,81,82,83,87,88,89,90,92,95,96,97,98,99,101,102,103,104,106],\"patrolPoints\":[{\"params\":{},\"patrolPointName\":\"78——1号车库口5北侧\"},{\"params\":{},\"patrolPointName\":\"79——3号车库报警阀室\"},{\"params\":{},\"patrolPointName\":\"81——4号车库报警阀室\"},{\"params\":{},\"patrolPointName\":\"82——2号车库报警阀室\"},{\"params\":{},\"patrolPointName\":\"83——1号车库报警阀\"},{\"params\":{},\"patrolPointName\":\"87——20楼小食堂北门口\"},{\"params\":{},\"patrolPointName\":\"88——2号车库口\"},{\"params\":{},\"patrolPointName\":\"89——东门岗\"},{\"params\":{},\"patrolPointName\":\"90——11号楼东侧创坝\"},{\"params\":{},\"patrolPointName\":\"92——南门岗\"},{\"params\":{},\"patrolPointName\":\"95——3号车库口\"},{\"params\":{},\"patrolPointName\":\"96——11号楼西区西创坝门口\"},{\"params\":{},\"patrolPointName\":\"97——11号楼西过道管委会门口\"},{\"params\":{},\"patrolPointName\":\"98——1号车库门口2号楼西侧\"},{\"params\":{},\"patrolPointName\":\"99——2号楼北侧出口2号楼北侧氢气储存间门口\"},{\"params\":{},\"patrolPointName\":\"101——19号楼西侧门口\"},{\"params\":{},\"patrolPointName\":\"102——4号车库出入口\"},{\"params\":{},\"patrolPointName\":\"103——11号楼西区1层中控室门口\"},{\"params\":{},\"patrolPointName\":\"104——11号楼中区北侧咖啡厅门口\"},{\"params\":{},\"patrolPointName\":\"106——20号楼物业门口\"}],\"patrolStartTime\":\"2023-06-13 08:00:00\",\"patrolStatus\":\"0\",\"personnelIds\":[18],\"regionId\":1,\"type\":\"1\",\"updateTime\":\"2023-06-13 16:59:45\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-13 16:59:43', 144);
INSERT INTO `sys_oper_log` VALUES (6140, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.edit()', 'PUT', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2023-05-05 16:47:43\",\"cronExpression\":\"0 0 1 * * ?\",\"invokeTarget\":\"ryTask.creatPatrolTask(307L)\",\"jobGroup\":\"DEFAULT\",\"jobId\":25,\"jobName\":\"王启洪(每天一次)\",\"misfirePolicy\":\"3\",\"nextValidTime\":\"2023-06-14 01:00:00\",\"params\":{},\"regionId\":1,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-13 16:59:44', 54);
INSERT INTO `sys_oper_log` VALUES (6141, '巡更任务管理', 2, 'com.ruoyi.web.controller.system.SysPatrolController.edit()', 'PUT', 1, 'admin', NULL, '/system/patrol', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-05 16:47:31\",\"params\":{},\"patrolDescribe\":\"保安部门巡更\",\"patrolEndTime\":\"2023-06-14 00:00:00\",\"patrolId\":307,\"patrolName\":\"王启洪(每天一次)\",\"patrolPointIds\":[78,79,81,82,83,87,88,89,90,92,95,96,97,98,99,101,102,103,104,106],\"patrolPoints\":[{\"params\":{},\"patrolPointName\":\"78——1号车库口5北侧\"},{\"params\":{},\"patrolPointName\":\"79——3号车库报警阀室\"},{\"params\":{},\"patrolPointName\":\"81——4号车库报警阀室\"},{\"params\":{},\"patrolPointName\":\"82——2号车库报警阀室\"},{\"params\":{},\"patrolPointName\":\"83——1号车库报警阀\"},{\"params\":{},\"patrolPointName\":\"87——20楼小食堂北门口\"},{\"params\":{},\"patrolPointName\":\"88——2号车库口\"},{\"params\":{},\"patrolPointName\":\"89——东门岗\"},{\"params\":{},\"patrolPointName\":\"90——11号楼东侧创坝\"},{\"params\":{},\"patrolPointName\":\"92——南门岗\"},{\"params\":{},\"patrolPointName\":\"95——3号车库口\"},{\"params\":{},\"patrolPointName\":\"96——11号楼西区西创坝门口\"},{\"params\":{},\"patrolPointName\":\"97——11号楼西过道管委会门口\"},{\"params\":{},\"patrolPointName\":\"98——1号车库门口2号楼西侧\"},{\"params\":{},\"patrolPointName\":\"99——2号楼北侧出口2号楼北侧氢气储存间门口\"},{\"params\":{},\"patrolPointName\":\"101——19号楼西侧门口\"},{\"params\":{},\"patrolPointName\":\"102——4号车库出入口\"},{\"params\":{},\"patrolPointName\":\"103——11号楼西区1层中控室门口\"},{\"params\":{},\"patrolPointName\":\"104——11号楼中区北侧咖啡厅门口\"},{\"params\":{},\"patrolPointName\":\"106——20号楼物业门口\"}],\"patrolStartTime\":\"2023-06-13 08:00:00\",\"patrolStatus\":\"0\",\"personnelIds\":[18],\"regionId\":1,\"type\":\"1\",\"updateTime\":\"2023-06-13 17:00:36\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-13 17:00:35', 138);
INSERT INTO `sys_oper_log` VALUES (6142, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.edit()', 'PUT', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2023-05-05 16:47:43\",\"cronExpression\":\"0 0 1 * * ?\",\"invokeTarget\":\"ryTask.creatPatrolTask(307L)\",\"jobGroup\":\"DEFAULT\",\"jobId\":25,\"jobName\":\"王启洪(每天一次)\",\"misfirePolicy\":\"3\",\"nextValidTime\":\"2023-06-14 01:00:00\",\"params\":{},\"regionId\":1,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-13 17:00:36', 52);
INSERT INTO `sys_oper_log` VALUES (6143, '巡更任务管理', 2, 'com.ruoyi.web.controller.system.SysPatrolController.edit()', 'PUT', 1, 'admin', NULL, '/system/patrol', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-05 16:43:49\",\"params\":{},\"patrolDescribe\":\"保安部门巡更\",\"patrolEndTime\":\"2023-06-13 08:30:00\",\"patrolId\":305,\"patrolName\":\"袁树(每天一次)\",\"patrolPointIds\":[78,79,81,82,83,87,88,89,90,92,95,96,97,98,99,101,102,103,104,106],\"patrolPoints\":[{\"params\":{},\"patrolPointName\":\"78——1号车库口5北侧\"},{\"params\":{},\"patrolPointName\":\"79——3号车库报警阀室\"},{\"params\":{},\"patrolPointName\":\"81——4号车库报警阀室\"},{\"params\":{},\"patrolPointName\":\"82——2号车库报警阀室\"},{\"params\":{},\"patrolPointName\":\"83——1号车库报警阀\"},{\"params\":{},\"patrolPointName\":\"87——20楼小食堂北门口\"},{\"params\":{},\"patrolPointName\":\"88——2号车库口\"},{\"params\":{},\"patrolPointName\":\"89——东门岗\"},{\"params\":{},\"patrolPointName\":\"90——11号楼东侧创坝\"},{\"params\":{},\"patrolPointName\":\"92——南门岗\"},{\"params\":{},\"patrolPointName\":\"95——3号车库口\"},{\"params\":{},\"patrolPointName\":\"96——11号楼西区西创坝门口\"},{\"params\":{},\"patrolPointName\":\"97——11号楼西过道管委会门口\"},{\"params\":{},\"patrolPointName\":\"98——1号车库门口2号楼西侧\"},{\"params\":{},\"patrolPointName\":\"99——2号楼北侧出口2号楼北侧氢气储存间门口\"},{\"params\":{},\"patrolPointName\":\"101——19号楼西侧门口\"},{\"params\":{},\"patrolPointName\":\"102——4号车库出入口\"},{\"params\":{},\"patrolPointName\":\"103——11号楼西区1层中控室门口\"},{\"params\":{},\"patrolPointName\":\"104——11号楼中区北侧咖啡厅门口\"},{\"params\":{},\"patrolPointName\":\"106——20号楼物业门口\"}],\"patrolStartTime\":\"2023-06-13 00:00:00\",\"patrolStatus\":\"0\",\"personnelIds\":[19],\"regionId\":1,\"type\":\"1\",\"updateTime\":\"2023-06-13 17:01:16\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-13 17:01:15', 137);
INSERT INTO `sys_oper_log` VALUES (6144, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.edit()', 'PUT', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2023-05-05 16:44:17\",\"cronExpression\":\"0 0 1 * * ?\",\"invokeTarget\":\"ryTask.creatPatrolTask(305L)\",\"jobGroup\":\"DEFAULT\",\"jobId\":23,\"jobName\":\"袁树(每天一次)\",\"misfirePolicy\":\"3\",\"nextValidTime\":\"2023-06-14 01:00:00\",\"params\":{},\"regionId\":1,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-13 17:01:16', 52);
INSERT INTO `sys_oper_log` VALUES (6145, '巡更任务管理', 2, 'com.ruoyi.web.controller.system.SysPatrolController.edit()', 'PUT', 1, 'admin', NULL, '/system/patrol', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-05 16:45:46\",\"params\":{},\"patrolDescribe\":\"保安部门巡更\",\"patrolEndTime\":\"2023-06-13 18:30:00\",\"patrolId\":306,\"patrolName\":\"祁守华(每天一次)\",\"patrolPointIds\":[78,79,81,82,83,87,88,89,90,92,95,96,97,98,99,101,102,103,104,106],\"patrolPoints\":[{\"params\":{},\"patrolPointName\":\"78——1号车库口5北侧\"},{\"params\":{},\"patrolPointName\":\"79——3号车库报警阀室\"},{\"params\":{},\"patrolPointName\":\"81——4号车库报警阀室\"},{\"params\":{},\"patrolPointName\":\"82——2号车库报警阀室\"},{\"params\":{},\"patrolPointName\":\"83——1号车库报警阀\"},{\"params\":{},\"patrolPointName\":\"87——20楼小食堂北门口\"},{\"params\":{},\"patrolPointName\":\"88——2号车库口\"},{\"params\":{},\"patrolPointName\":\"89——东门岗\"},{\"params\":{},\"patrolPointName\":\"90——11号楼东侧创坝\"},{\"params\":{},\"patrolPointName\":\"92——南门岗\"},{\"params\":{},\"patrolPointName\":\"95——3号车库口\"},{\"params\":{},\"patrolPointName\":\"96——11号楼西区西创坝门口\"},{\"params\":{},\"patrolPointName\":\"97——11号楼西过道管委会门口\"},{\"params\":{},\"patrolPointName\":\"98——1号车库门口2号楼西侧\"},{\"params\":{},\"patrolPointName\":\"99——2号楼北侧出口2号楼北侧氢气储存间门口\"},{\"params\":{},\"patrolPointName\":\"101——19号楼西侧门口\"},{\"params\":{},\"patrolPointName\":\"102——4号车库出入口\"},{\"params\":{},\"patrolPointName\":\"103——11号楼西区1层中控室门口\"},{\"params\":{},\"patrolPointName\":\"104——11号楼中区北侧咖啡厅门口\"},{\"params\":{},\"patrolPointName\":\"106——20号楼物业门口\"}],\"patrolStartTime\":\"2023-06-13 08:30:00\",\"patrolStatus\":\"0\",\"personnelIds\":[17],\"regionId\":1,\"type\":\"1\",\"updateTime\":\"2023-06-13 17:01:35\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-13 17:01:34', 146);
INSERT INTO `sys_oper_log` VALUES (6146, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.edit()', 'PUT', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2023-05-05 16:45:59\",\"cronExpression\":\"0 0 1 * * ?\",\"invokeTarget\":\"ryTask.creatPatrolTask(306L)\",\"jobGroup\":\"DEFAULT\",\"jobId\":24,\"jobName\":\"祁守华(每天一次)\",\"misfirePolicy\":\"3\",\"nextValidTime\":\"2023-06-14 01:00:00\",\"params\":{},\"regionId\":1,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-13 17:01:35', 54);
INSERT INTO `sys_oper_log` VALUES (6147, '巡更任务管理', 2, 'com.ruoyi.web.controller.system.SysPatrolController.edit()', 'PUT', 1, 'admin', NULL, '/system/patrol', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-05 15:52:08\",\"params\":{},\"patrolDescribe\":\"环境部门巡更\",\"patrolEndTime\":\"2023-06-13 18:30:00\",\"patrolId\":297,\"patrolName\":\"刘春娟(每周)\",\"patrolPointIds\":[6,7,8,12,13,14,15],\"patrolPoints\":[{\"params\":{},\"patrolPointName\":\"6——16号楼外围\"},{\"params\":{},\"patrolPointName\":\"7或23——8号楼1层电梯厅\"},{\"params\":{},\"patrolPointName\":\"8或24——6号楼3层电梯厅\"},{\"params\":{},\"patrolPointName\":\"12——6号楼5层电梯厅环境部\"},{\"params\":{},\"patrolPointName\":\"13——6号楼4层电梯厅\"},{\"params\":{},\"patrolPointName\":\"14——6号楼1层电梯厅\"},{\"params\":{},\"patrolPointName\":\"15——1园区外围3号车库口\"}],\"patrolStartTime\":\"2023-06-13 00:00:00\",\"patrolStatus\":\"0\",\"personnelIds\":[12],\"regionId\":1,\"type\":\"1\",\"updateTime\":\"2023-06-13 17:01:52\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-13 17:01:50', 133);
INSERT INTO `sys_oper_log` VALUES (6148, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.edit()', 'PUT', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2023-05-05 15:52:45\",\"cronExpression\":\"0 0 1 ? * 2\",\"invokeTarget\":\"ryTask.creatPatrolTask(297L)\",\"jobGroup\":\"DEFAULT\",\"jobId\":15,\"jobName\":\"刘春娟(每周)\",\"misfirePolicy\":\"3\",\"nextValidTime\":\"2023-06-19 01:00:00\",\"params\":{},\"regionId\":1,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-13 17:01:51', 48);
INSERT INTO `sys_oper_log` VALUES (6149, '巡更任务管理', 2, 'com.ruoyi.web.controller.system.SysPatrolController.edit()', 'PUT', 1, 'admin', NULL, '/system/patrol', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-05 16:04:56\",\"params\":{},\"patrolDescribe\":\"客服部门巡更\",\"patrolEndTime\":\"2023-06-13 18:30:00\",\"patrolId\":298,\"patrolName\":\"柳娜(每周)\",\"patrolPointIds\":[2,3,4,5,16,17],\"patrolPoints\":[{\"params\":{},\"patrolPointName\":\"2——11号楼西侧2层客电梯厅\"},{\"params\":{},\"patrolPointName\":\"3——19号楼1层电梯厅环境部\"},{\"params\":{},\"patrolPointName\":\"4——11号楼中厅2层东电梯厅\"},{\"params\":{},\"patrolPointName\":\"5——1号楼4层电梯厅\"},{\"params\":{},\"patrolPointName\":\"16——20号楼1层客电梯厅\"},{\"params\":{},\"patrolPointName\":\"17——13号楼南大门\"}],\"patrolStartTime\":\"2023-06-13 00:00:00\",\"patrolStatus\":\"0\",\"personnelIds\":[6],\"regionId\":1,\"type\":\"1\",\"updateTime\":\"2023-06-13 17:02:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-13 17:01:59', 134);
INSERT INTO `sys_oper_log` VALUES (6150, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.edit()', 'PUT', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2023-05-05 16:05:22\",\"cronExpression\":\"0 0 1 ? * 2\",\"invokeTarget\":\"ryTask.creatPatrolTask(298L)\",\"jobGroup\":\"DEFAULT\",\"jobId\":16,\"jobName\":\"柳娜(每周)\",\"misfirePolicy\":\"3\",\"nextValidTime\":\"2023-06-19 01:00:00\",\"params\":{},\"regionId\":1,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-13 17:02:00', 48);
INSERT INTO `sys_oper_log` VALUES (6151, '巡更任务管理', 2, 'com.ruoyi.web.controller.system.SysPatrolController.edit()', 'PUT', 1, 'admin', NULL, '/system/patrol', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-05 16:06:21\",\"params\":{},\"patrolDescribe\":\"客服部门巡更\",\"patrolEndTime\":\"2023-06-13 18:30:00\",\"patrolId\":299,\"patrolName\":\"徐苗苗(每周)\",\"patrolPointIds\":[6,7,8,12,13,14],\"patrolPoints\":[{\"params\":{},\"patrolPointName\":\"6——16号楼外围\"},{\"params\":{},\"patrolPointName\":\"7或23——8号楼1层电梯厅\"},{\"params\":{},\"patrolPointName\":\"8或24——6号楼3层电梯厅\"},{\"params\":{},\"patrolPointName\":\"12——6号楼5层电梯厅环境部\"},{\"params\":{},\"patrolPointName\":\"13——6号楼4层电梯厅\"},{\"params\":{},\"patrolPointName\":\"14——6号楼1层电梯厅\"}],\"patrolStartTime\":\"2023-06-13 00:00:00\",\"patrolStatus\":\"0\",\"personnelIds\":[7],\"regionId\":1,\"type\":\"1\",\"updateTime\":\"2023-06-13 17:02:13\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-13 17:02:12', 136);
INSERT INTO `sys_oper_log` VALUES (6152, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.edit()', 'PUT', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2023-05-05 16:06:33\",\"cronExpression\":\"0 0 1 ? * 2\",\"invokeTarget\":\"ryTask.creatPatrolTask(299L)\",\"jobGroup\":\"DEFAULT\",\"jobId\":17,\"jobName\":\"徐苗苗(每周)\",\"misfirePolicy\":\"3\",\"nextValidTime\":\"2023-06-19 01:00:00\",\"params\":{},\"regionId\":1,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-13 17:02:13', 51);
INSERT INTO `sys_oper_log` VALUES (6153, '巡更任务管理', 2, 'com.ruoyi.web.controller.system.SysPatrolController.edit()', 'PUT', 1, 'admin', NULL, '/system/patrol', '127.0.0.1', '内网IP', '{\"createBy\":\"wuyexungen\",\"createTime\":\"2023-05-08 17:04:32\",\"params\":{},\"patrolDescribe\":\"电梯部门巡更\",\"patrolEndTime\":\"2023-06-13 18:30:00\",\"patrolId\":329,\"patrolName\":\"焦祁亮（每半月）\",\"patrolPointIds\":[46,47,48,49,50,52,55,71,73,75,76,112],\"patrolPoints\":[{\"params\":{},\"patrolPointName\":\"46——2号楼货梯机房\"},{\"params\":{},\"patrolPointName\":\"47——14号楼电梯\"},{\"params\":{},\"patrolPointName\":\"48——13号楼电梯机房\"},{\"params\":{},\"patrolPointName\":\"49——1号楼货梯机房\"},{\"params\":{},\"patrolPointName\":\"50——12号楼电梯机房\"},{\"params\":{},\"patrolPointName\":\"52——19号客梯机房加太阳能即热管两个功能\"},{\"params\":{},\"patrolPointName\":\"55——15电梯机房\"},{\"params\":{},\"patrolPointName\":\"71——8号楼货梯客梯机房\"},{\"params\":{},\"patrolPointName\":\"73——6号楼客梯货梯机房\"},{\"params\":{},\"patrolPointName\":\"75——16号楼无机房\"},{\"params\":{},\"patrolPointName\":\"76——5号楼货梯客梯机房\"},{\"params\":{},\"patrolPointName\":\"112——7号楼电梯机房\"}],\"patrolStartTime\":\"2023-06-13 00:00:00\",\"patrolStatus\":\"0\",\"personnelIds\":[10],\"regionId\":1,\"type\":\"1\",\"updateTime\":\"2023-06-13 17:02:50\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-13 17:02:48', 150);
INSERT INTO `sys_oper_log` VALUES (6154, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.edit()', 'PUT', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"wuyexungen\",\"createTime\":\"2023-05-08 17:05:07\",\"cronExpression\":\"0 0 1 1,16 * ?\",\"invokeTarget\":\"ryTask.creatPatrolTask(329L)\",\"jobGroup\":\"DEFAULT\",\"jobId\":32,\"jobName\":\"焦祁亮（每半月）\",\"misfirePolicy\":\"3\",\"nextValidTime\":\"2023-06-16 01:00:00\",\"params\":{},\"regionId\":1,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-13 17:02:50', 55);
INSERT INTO `sys_oper_log` VALUES (6155, '巡更任务管理', 2, 'com.ruoyi.web.controller.system.SysPatrolController.edit()', 'PUT', 1, 'admin', NULL, '/system/patrol', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-09 08:50:32\",\"params\":{},\"patrolDescribe\":\"工程部\",\"patrolEndTime\":\"2023-06-13 18:30:00\",\"patrolId\":379,\"patrolName\":\"高志标（每周一次）隔油池\",\"patrolPointIds\":[58],\"patrolPoints\":[{\"params\":{},\"patrolPointName\":\"58——11号楼地下隔油池\"}],\"patrolStartTime\":\"2023-06-13 00:00:00\",\"patrolStatus\":\"0\",\"personnelIds\":[14],\"regionId\":1,\"type\":\"1\",\"updateTime\":\"2023-06-13 17:03:04\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-13 17:03:03', 143);
INSERT INTO `sys_oper_log` VALUES (6156, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.edit()', 'PUT', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2023-05-09 08:51:21\",\"cronExpression\":\"0 0 1 ? * 2\",\"invokeTarget\":\"ryTask.creatPatrolTask(379L)\",\"jobGroup\":\"DEFAULT\",\"jobId\":33,\"jobName\":\"高志标（每周一次）隔油池\",\"misfirePolicy\":\"3\",\"nextValidTime\":\"2023-06-19 01:00:00\",\"params\":{},\"regionId\":1,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-13 17:03:04', 47);
INSERT INTO `sys_oper_log` VALUES (6157, '巡更任务管理', 2, 'com.ruoyi.web.controller.system.SysPatrolController.edit()', 'PUT', 1, 'admin', NULL, '/system/patrol', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-05 16:16:32\",\"params\":{},\"patrolDescribe\":\"电梯部门巡更\",\"patrolEndTime\":\"2023-06-13 18:30:00\",\"patrolId\":304,\"patrolName\":\"王建国(每半月)\",\"patrolPointIds\":[33,34,35,37,38,39,40,41,42,43,44,45],\"patrolPoints\":[{\"params\":{},\"patrolPointName\":\"33——10号楼电梯\"},{\"params\":{},\"patrolPointName\":\"34——18号楼电梯\"},{\"params\":{},\"patrolPointName\":\"35——9号楼电梯\"},{\"params\":{},\"patrolPointName\":\"37——17号电梯\"},{\"params\":{},\"patrolPointName\":\"38——4号楼客梯货梯\"},{\"params\":{},\"patrolPointName\":\"39——20号楼客梯\"},{\"params\":{},\"patrolPointName\":\"40——11号楼中厅东多功能厅电梯\"},{\"params\":{},\"patrolPointName\":\"41——11号楼中厅东侧电梯\"},{\"params\":{},\"patrolPointName\":\"42——11号楼中厅扶梯\"},{\"params\":{},\"patrolPointName\":\"43——11号楼中厅西侧货梯\"},{\"params\":{},\"patrolPointName\":\"44——11号楼中厅西侧电梯\"},{\"params\":{},\"patrolPointName\":\"45——管委会电梯\"}],\"patrolStartTime\":\"2023-06-13 00:00:00\",\"patrolStatus\":\"0\",\"personnelIds\":[9],\"regionId\":1,\"type\":\"1\",\"updateTime\":\"2023-06-13 17:04:05\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-13 17:04:03', 160);
INSERT INTO `sys_oper_log` VALUES (6158, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.edit()', 'PUT', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2023-05-05 16:16:52\",\"cronExpression\":\"0 0 1 1,16 * ?\",\"invokeTarget\":\"ryTask.creatPatrolTask(304L)\",\"jobGroup\":\"DEFAULT\",\"jobId\":22,\"jobName\":\"王建国(每半月)\",\"misfirePolicy\":\"3\",\"nextValidTime\":\"2023-06-16 01:00:00\",\"params\":{},\"regionId\":1,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-13 17:04:04', 61);
INSERT INTO `sys_oper_log` VALUES (6159, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '19898998690', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 01:17:12\",\"params\":{},\"patrolId\":747,\"patrolOrderId\":9,\"patrolPointId\":92,\"personnelId\":19,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 01:17:11', 203);
INSERT INTO `sys_oper_log` VALUES (6160, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '19898998690', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 01:17:56\",\"params\":{},\"patrolId\":747,\"patrolOrderId\":10,\"patrolPointId\":83,\"personnelId\":19,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 01:17:56', 152);
INSERT INTO `sys_oper_log` VALUES (6161, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '19898998690', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 01:18:03\",\"params\":{},\"patrolId\":747,\"patrolOrderId\":11,\"patrolPointId\":79,\"personnelId\":19,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 01:18:02', 150);
INSERT INTO `sys_oper_log` VALUES (6162, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '19898998690', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 01:18:09\",\"params\":{},\"patrolId\":747,\"patrolOrderId\":12,\"patrolPointId\":81,\"personnelId\":19,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 01:18:09', 152);
INSERT INTO `sys_oper_log` VALUES (6163, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '19898998690', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 01:18:14\",\"params\":{},\"patrolId\":747,\"patrolOrderId\":13,\"patrolPointId\":82,\"personnelId\":19,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 01:18:14', 152);
INSERT INTO `sys_oper_log` VALUES (6164, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '19898998690', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 01:18:22\",\"params\":{},\"patrolId\":747,\"patrolOrderId\":14,\"patrolPointId\":87,\"personnelId\":19,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 01:18:21', 150);
INSERT INTO `sys_oper_log` VALUES (6165, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '19898998690', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 01:18:29\",\"params\":{},\"patrolId\":747,\"patrolOrderId\":15,\"patrolPointId\":104,\"personnelId\":19,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 01:18:28', 151);
INSERT INTO `sys_oper_log` VALUES (6166, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '19898998690', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 01:18:40\",\"params\":{},\"patrolId\":747,\"patrolOrderId\":16,\"patrolPointId\":97,\"personnelId\":19,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 01:18:40', 151);
INSERT INTO `sys_oper_log` VALUES (6167, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '19898998690', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 01:18:48\",\"params\":{},\"patrolId\":747,\"patrolOrderId\":17,\"patrolPointId\":103,\"personnelId\":19,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 01:18:48', 149);
INSERT INTO `sys_oper_log` VALUES (6168, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '19898998690', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 01:18:55\",\"params\":{},\"patrolId\":747,\"patrolOrderId\":18,\"patrolPointId\":106,\"personnelId\":19,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 01:18:54', 149);
INSERT INTO `sys_oper_log` VALUES (6169, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '19898998690', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 01:19:01\",\"params\":{},\"patrolId\":747,\"patrolOrderId\":19,\"patrolPointId\":101,\"personnelId\":19,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 01:19:01', 150);
INSERT INTO `sys_oper_log` VALUES (6170, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '19898998690', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 01:19:09\",\"params\":{},\"patrolId\":747,\"patrolOrderId\":20,\"patrolPointId\":78,\"personnelId\":19,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 01:19:08', 149);
INSERT INTO `sys_oper_log` VALUES (6171, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '19898998690', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 01:19:20\",\"params\":{},\"patrolId\":747,\"patrolOrderId\":21,\"patrolPointId\":99,\"personnelId\":19,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 01:19:20', 151);
INSERT INTO `sys_oper_log` VALUES (6172, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '19898998690', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 01:19:27\",\"params\":{},\"patrolId\":747,\"patrolOrderId\":22,\"patrolPointId\":98,\"personnelId\":19,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 01:19:26', 148);
INSERT INTO `sys_oper_log` VALUES (6173, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '19898998690', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 01:19:34\",\"params\":{},\"patrolId\":747,\"patrolOrderId\":23,\"patrolPointId\":96,\"personnelId\":19,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 01:19:34', 155);
INSERT INTO `sys_oper_log` VALUES (6174, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '19898998690', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 01:19:42\",\"params\":{},\"patrolId\":747,\"patrolOrderId\":24,\"patrolPointId\":95,\"personnelId\":19,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 01:19:42', 394);
INSERT INTO `sys_oper_log` VALUES (6175, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '19898998690', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 01:19:52\",\"params\":{},\"patrolId\":747,\"patrolOrderId\":25,\"patrolPointId\":88,\"personnelId\":19,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 01:19:51', 149);
INSERT INTO `sys_oper_log` VALUES (6176, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '19898998690', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 01:20:02\",\"params\":{},\"patrolId\":747,\"patrolOrderId\":26,\"patrolPointId\":102,\"personnelId\":19,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 01:20:02', 149);
INSERT INTO `sys_oper_log` VALUES (6177, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '19898998690', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 02:15:21\",\"params\":{},\"patrolId\":747,\"patrolOrderId\":27,\"patrolPointId\":89,\"personnelId\":19,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 02:15:20', 150);
INSERT INTO `sys_oper_log` VALUES (6178, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '19898998690', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 02:16:48\",\"params\":{},\"patrolId\":747,\"patrolOrderId\":28,\"patrolPointId\":90,\"personnelId\":19,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 02:16:48', 169);
INSERT INTO `sys_oper_log` VALUES (6179, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '18032376958', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 09:03:48\",\"params\":{},\"patrolId\":752,\"patrolOrderId\":29,\"patrolPointId\":79,\"personnelId\":17,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 09:03:48', 126);
INSERT INTO `sys_oper_log` VALUES (6180, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '18032376958', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 09:03:56\",\"params\":{},\"patrolId\":752,\"patrolOrderId\":30,\"patrolPointId\":81,\"personnelId\":17,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 09:03:55', 94);
INSERT INTO `sys_oper_log` VALUES (6181, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '18032376958', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 09:04:05\",\"params\":{},\"patrolId\":752,\"patrolOrderId\":31,\"patrolPointId\":82,\"personnelId\":17,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 09:04:04', 94);
INSERT INTO `sys_oper_log` VALUES (6182, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '18032376958', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 09:04:11\",\"params\":{},\"patrolId\":752,\"patrolOrderId\":32,\"patrolPointId\":83,\"personnelId\":17,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 09:04:11', 80);
INSERT INTO `sys_oper_log` VALUES (6183, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '18032376958', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 09:04:24\",\"params\":{},\"patrolId\":752,\"patrolOrderId\":33,\"patrolPointId\":95,\"personnelId\":17,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 09:04:23', 86);
INSERT INTO `sys_oper_log` VALUES (6184, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '18032376958', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 09:04:33\",\"params\":{},\"patrolId\":752,\"patrolOrderId\":34,\"patrolPointId\":96,\"personnelId\":17,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 09:04:32', 88);
INSERT INTO `sys_oper_log` VALUES (6185, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '18032376958', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 09:04:43\",\"params\":{},\"patrolId\":752,\"patrolOrderId\":35,\"patrolPointId\":97,\"personnelId\":17,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 09:04:43', 86);
INSERT INTO `sys_oper_log` VALUES (6186, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '18032376958', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 09:04:55\",\"params\":{},\"patrolId\":752,\"patrolOrderId\":36,\"patrolPointId\":103,\"personnelId\":17,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 09:04:54', 85);
INSERT INTO `sys_oper_log` VALUES (6187, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '18032376958', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 09:05:18\",\"params\":{},\"patrolId\":752,\"patrolOrderId\":37,\"patrolPointId\":78,\"personnelId\":17,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 09:05:17', 93);
INSERT INTO `sys_oper_log` VALUES (6188, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '18032376958', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 09:05:38\",\"params\":{},\"patrolId\":752,\"patrolOrderId\":38,\"patrolPointId\":92,\"personnelId\":17,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 09:05:37', 97);
INSERT INTO `sys_oper_log` VALUES (6189, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":18,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 09:06:27', 44);
INSERT INTO `sys_oper_log` VALUES (6190, '巡更任务管理', 3, 'com.ruoyi.web.controller.system.SysPatrolController.remove()', 'DELETE', 1, 'admin', NULL, '/system/patrol/754', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 09:07:39', 164);
INSERT INTO `sys_oper_log` VALUES (6191, '巡更任务管理', 3, 'com.ruoyi.web.controller.system.SysPatrolController.remove()', 'DELETE', 1, 'admin', NULL, '/system/patrol/755', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 09:07:42', 160);
INSERT INTO `sys_oper_log` VALUES (6192, '巡更任务管理', 2, 'com.ruoyi.web.controller.system.SysPatrolController.edit()', 'PUT', 1, 'admin', NULL, '/system/patrol', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-05 16:48:33\",\"params\":{},\"patrolDescribe\":\"中控室人员巡更\",\"patrolEndTime\":\"2023-06-13 18:30:00\",\"patrolId\":308,\"patrolName\":\"陈小龙(每天一次)\",\"patrolPointIds\":[84,85,86,91,93,100,105],\"patrolPoints\":[{\"params\":{},\"patrolPointName\":\"84——11号楼中厅二层东电梯厅\"},{\"params\":{},\"patrolPointName\":\"85——20号楼一层客梯\"},{\"params\":{},\"patrolPointName\":\"86——20号楼6层客梯旁弱电间\"},{\"params\":{},\"patrolPointName\":\"91——10号楼一层电梯口\"},{\"params\":{},\"patrolPointName\":\"93——6号楼一层电梯厅\"},{\"params\":{},\"patrolPointName\":\"100——19号楼6层弱电间\"},{\"params\":{},\"patrolPointName\":\"105——19号楼一层电梯口\"}],\"patrolStartTime\":\"2023-06-13 08:30:00\",\"patrolStatus\":\"0\",\"personnelIds\":[16],\"regionId\":1,\"type\":\"1\",\"updateTime\":\"2023-06-14 09:08:03\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 09:08:02', 251);
INSERT INTO `sys_oper_log` VALUES (6193, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.edit()', 'PUT', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2023-05-05 16:48:42\",\"cronExpression\":\"0 0 1 * * ?\",\"invokeTarget\":\"ryTask.creatPatrolTask(308L)\",\"jobGroup\":\"DEFAULT\",\"jobId\":26,\"jobName\":\"陈小龙(每天一次)\",\"misfirePolicy\":\"3\",\"nextValidTime\":\"2023-06-15 01:00:00\",\"params\":{},\"regionId\":1,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 09:08:04', 90);
INSERT INTO `sys_oper_log` VALUES (6194, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":26,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 09:08:17', 59);
INSERT INTO `sys_oper_log` VALUES (6195, '巡更任务管理', 3, 'com.ruoyi.web.controller.system.SysPatrolController.remove()', 'DELETE', 1, 'admin', NULL, '/system/patrol/746', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 09:10:27', 106);
INSERT INTO `sys_oper_log` VALUES (6196, '巡更任务管理', 3, 'com.ruoyi.web.controller.system.SysPatrolController.remove()', 'DELETE', 1, 'admin', NULL, '/system/patrol/628', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 09:37:10', 157);
INSERT INTO `sys_oper_log` VALUES (6197, '巡更任务管理', 2, 'com.ruoyi.web.controller.system.SysPatrolController.edit()', 'PUT', 1, 'admin', NULL, '/system/patrol', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-05 16:14:00\",\"params\":{},\"patrolDescribe\":\"工程部门巡更\",\"patrolEndTime\":\"2023-06-13 18:00:00\",\"patrolId\":302,\"patrolName\":\"高志标(每天)\",\"patrolPointIds\":[51,53,54,56,57,59,60,61,62,63,64,65,66,67,68,69,70],\"patrolPoints\":[{\"params\":{},\"patrolPointName\":\"51——19号楼货梯机房太阳能\"},{\"params\":{},\"patrolPointName\":\"53——2号小配电室\"},{\"params\":{},\"patrolPointName\":\"54——消防高位水箱和3号楼电梯机房\"},{\"params\":{},\"patrolPointName\":\"56——5号配电室\"},{\"params\":{},\"patrolPointName\":\"57——中区小配电室\"},{\"params\":{},\"patrolPointName\":\"59——东区小配电室\"},{\"params\":{},\"patrolPointName\":\"60——4号配电室\"},{\"params\":{},\"patrolPointName\":\"61——4号小配电室\"},{\"params\":{},\"patrolPointName\":\"62——3号配电室\"},{\"params\":{},\"patrolPointName\":\"63——3号小配电室\"},{\"params\":{},\"patrolPointName\":\"64——西区小配电室\"},{\"params\":{},\"patrolPointName\":\"65——生活水泵房\"},{\"params\":{},\"patrolPointName\":\"66——1号小配电室\"},{\"params\":{},\"patrolPointName\":\"67——1号配电室\"},{\"params\":{},\"patrolPointName\":\"68——太阳能热水泵房\"},{\"params\":{},\"patrolPointName\":\"69——2号配电室\"},{\"params\":{},\"patrolPointName\":\"70——20号楼货梯\"}],\"patrolStartTime\":\"2023-06-13 08:30:00\",\"patrolStatus\":\"0\",\"personnelIds\":[14],\"regionId\":1,\"type\":\"1\",\"updateTime\":\"2023-06-14 09:39:23\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 09:39:22', 250);
INSERT INTO `sys_oper_log` VALUES (6198, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.edit()', 'PUT', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2023-05-05 16:14:13\",\"cronExpression\":\"0 0 1 * * ?\",\"invokeTarget\":\"ryTask.creatPatrolTask(302L)\",\"jobGroup\":\"DEFAULT\",\"jobId\":20,\"jobName\":\"高志标(每天)\",\"misfirePolicy\":\"3\",\"nextValidTime\":\"2023-06-15 01:00:00\",\"params\":{},\"regionId\":1,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 09:39:24', 87);
INSERT INTO `sys_oper_log` VALUES (6199, '巡更任务管理', 2, 'com.ruoyi.web.controller.system.SysPatrolController.edit()', 'PUT', 1, 'admin', NULL, '/system/patrol', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-05 16:15:28\",\"params\":{},\"patrolDescribe\":\"工程部门巡更\",\"patrolEndTime\":\"2023-06-14 08:30:00\",\"patrolId\":303,\"patrolName\":\"程建林(每天)\",\"patrolPointIds\":[51,53,54,56,57,59,60,61,62,63,64,65,66,67,68,69,70],\"patrolPoints\":[{\"params\":{},\"patrolPointName\":\"51——19号楼货梯机房太阳能\"},{\"params\":{},\"patrolPointName\":\"53——2号小配电室\"},{\"params\":{},\"patrolPointName\":\"54——消防高位水箱和3号楼电梯机房\"},{\"params\":{},\"patrolPointName\":\"56——5号配电室\"},{\"params\":{},\"patrolPointName\":\"57——中区小配电室\"},{\"params\":{},\"patrolPointName\":\"59——东区小配电室\"},{\"params\":{},\"patrolPointName\":\"60——4号配电室\"},{\"params\":{},\"patrolPointName\":\"61——4号小配电室\"},{\"params\":{},\"patrolPointName\":\"62——3号配电室\"},{\"params\":{},\"patrolPointName\":\"63——3号小配电室\"},{\"params\":{},\"patrolPointName\":\"64——西区小配电室\"},{\"params\":{},\"patrolPointName\":\"65——生活水泵房\"},{\"params\":{},\"patrolPointName\":\"66——1号小配电室\"},{\"params\":{},\"patrolPointName\":\"67——1号配电室\"},{\"params\":{},\"patrolPointName\":\"68——太阳能热水泵房\"},{\"params\":{},\"patrolPointName\":\"69——2号配电室\"},{\"params\":{},\"patrolPointName\":\"70——20号楼货梯\"}],\"patrolStartTime\":\"2023-06-13 17:30:00\",\"patrolStatus\":\"0\",\"personnelIds\":[15],\"regionId\":1,\"type\":\"1\",\"updateTime\":\"2023-06-14 09:40:02\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 09:40:01', 254);
INSERT INTO `sys_oper_log` VALUES (6200, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.edit()', 'PUT', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2023-05-05 16:15:38\",\"cronExpression\":\"0 0 1 * * ?\",\"invokeTarget\":\"ryTask.creatPatrolTask(303L)\",\"jobGroup\":\"DEFAULT\",\"jobId\":21,\"jobName\":\"程建林(每天)\",\"misfirePolicy\":\"3\",\"nextValidTime\":\"2023-06-15 01:00:00\",\"params\":{},\"regionId\":1,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 09:40:03', 88);
INSERT INTO `sys_oper_log` VALUES (6201, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '18032376958', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 10:37:40\",\"params\":{},\"patrolId\":752,\"patrolOrderId\":39,\"patrolPointId\":104,\"personnelId\":17,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 10:37:39', 161);
INSERT INTO `sys_oper_log` VALUES (6202, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '18032376958', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 10:39:14\",\"params\":{},\"patrolId\":752,\"patrolOrderId\":40,\"patrolPointId\":106,\"personnelId\":17,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 10:39:13', 150);
INSERT INTO `sys_oper_log` VALUES (6203, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '18032376958', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 10:40:31\",\"params\":{},\"patrolId\":752,\"patrolOrderId\":41,\"patrolPointId\":99,\"personnelId\":17,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 10:40:30', 149);
INSERT INTO `sys_oper_log` VALUES (6204, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '18032376958', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 10:41:15\",\"params\":{},\"patrolId\":752,\"patrolOrderId\":42,\"patrolPointId\":98,\"personnelId\":17,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 10:41:14', 147);
INSERT INTO `sys_oper_log` VALUES (6205, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '18032376958', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 10:42:53\",\"params\":{},\"patrolId\":752,\"patrolOrderId\":43,\"patrolPointId\":101,\"personnelId\":17,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 10:42:52', 163);
INSERT INTO `sys_oper_log` VALUES (6206, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '18032376958', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 10:44:38\",\"params\":{},\"patrolId\":752,\"patrolOrderId\":44,\"patrolPointId\":87,\"personnelId\":17,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 10:44:37', 173);
INSERT INTO `sys_oper_log` VALUES (6207, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '18032376958', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 10:46:24\",\"params\":{},\"patrolId\":752,\"patrolOrderId\":45,\"patrolPointId\":88,\"personnelId\":17,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 10:46:23', 166);
INSERT INTO `sys_oper_log` VALUES (6208, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '18032376958', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 10:47:41\",\"params\":{},\"patrolId\":752,\"patrolOrderId\":46,\"patrolPointId\":90,\"personnelId\":17,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 10:47:40', 169);
INSERT INTO `sys_oper_log` VALUES (6209, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '18032376958', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 10:48:58\",\"params\":{},\"patrolId\":752,\"patrolOrderId\":47,\"patrolPointId\":102,\"personnelId\":17,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 10:48:57', 157);
INSERT INTO `sys_oper_log` VALUES (6210, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '18032376958', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 10:53:24\",\"params\":{},\"patrolId\":752,\"patrolOrderId\":48,\"patrolPointId\":89,\"personnelId\":17,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 10:53:23', 19342);
INSERT INTO `sys_oper_log` VALUES (6211, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '18032376958', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"params\":{},\"patrolId\":752,\"patrolPointId\":89,\"personnelId\":17,\"regionId\":1}', NULL, 1, 'Cannot invoke \"com.ruoyi.system.domain.SysPatrolPatrolPointStatus.setPatrolPatrolPointStatus(String)\" because \"sysPatrolPatrolPointStatus\" is null', '2023-06-14 10:53:27', 49);
INSERT INTO `sys_oper_log` VALUES (6212, '报修单', 1, 'com.ruoyi.web.controller.system.NewRepairFromController.appAdd()', 'POST', 1, '912996617', NULL, '/system/newRepairFrom/add', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 11:03:25\",\"describe\":\"河北蝉智测试用\",\"imgUrls\":[\"/profile/upload/2023/06/14/tmp_cc7cd2d0c10390349588613e5f1c142d_20230614110322A001.jpg\"],\"location\":\"河北蝉智测试用\",\"maintenanceClassification\":\"1\",\"paidType\":\"0\",\"params\":{},\"personnelId\":28,\"regionId\":1,\"regionalClassification\":\"1\",\"repairFromId\":69,\"state\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 11:03:24', 192);
INSERT INTO `sys_oper_log` VALUES (6213, '报修单', 1, 'com.ruoyi.web.controller.system.NewRepairFromController.appAdd()', 'POST', 1, '912996617', NULL, '/system/newRepairFrom/add', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 11:07:14\",\"describe\":\"蝉智科技测试用\",\"imgUrls\":[\"/profile/upload/2023/06/14/tmp_12c5f54ef60ddb836c1bc01be1c96a7a_20230614110713A002.jpg\"],\"location\":\"蝉智科技测试用\",\"maintenanceClassification\":\"0\",\"paidType\":\"0\",\"params\":{},\"personnelId\":28,\"regionId\":1,\"regionalClassification\":\"0\",\"repairFromId\":70,\"state\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 11:07:13', 151);
INSERT INTO `sys_oper_log` VALUES (6214, '员工管理', 1, 'com.ruoyi.web.controller.system.SysPersonnelController.add()', 'POST', 1, '18032139488', NULL, '/system/personnel', '127.0.0.1', '内网IP', '{\"createBy\":\"18032139488\",\"createTime\":\"2023-06-14 11:12:50\",\"deptId\":206,\"params\":{},\"personnelId\":33,\"personnelLoginName\":\"weixiubumen\",\"personnelName\":\"维修员1\",\"personnelPassword\":\"$2a$10$edrEnbwz0Avbd5IoiBuncO1Z1Jn8lHLQD/8091PS0UnNDkFwLevEy\",\"personnelPhone\":\"18232005950\",\"personnelSex\":\"0\",\"personnelStatus\":\"0\",\"postIds\":[4],\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 11:12:49', 153);
INSERT INTO `sys_oper_log` VALUES (6215, '报修单', 1, 'com.ruoyi.web.controller.system.NewRepairFromController.appAdd()', 'POST', 1, '912996617', NULL, '/system/newRepairFrom/add', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 11:16:19\",\"describe\":\"蝉智科技测试3\",\"imgUrls\":[\"/profile/upload/2023/06/14/tmp_d6840b3d9424cec04eef2eac968401c1_20230614111618A003.jpg\"],\"location\":\"蝉智科技测试3\",\"maintenanceClassification\":\"0\",\"paidType\":\"0\",\"params\":{},\"personnelId\":28,\"regionId\":1,\"regionalClassification\":\"0\",\"repairFromId\":71,\"state\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 11:16:18', 157);
INSERT INTO `sys_oper_log` VALUES (6216, '报修单', 1, 'com.ruoyi.web.controller.system.NewRepairFromController.appAdd()', 'POST', 1, '912996617', NULL, '/system/newRepairFrom/add', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 11:19:12\",\"describe\":\"蝉智科技测试4\",\"imgUrls\":[\"/profile/upload/2023/06/14/tmp_adb178d0b5366bc2591fbdbbd925333e_20230614111908A002.jpg\"],\"location\":\"蝉智科技测试4\",\"maintenanceClassification\":\"0\",\"paidType\":\"0\",\"params\":{},\"personnelId\":28,\"regionId\":1,\"regionalClassification\":\"0\",\"repairFromId\":72,\"state\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 11:19:11', 200);
INSERT INTO `sys_oper_log` VALUES (6217, '报修单', 1, 'com.ruoyi.web.controller.system.NewRepairFromController.appAdd()', 'POST', 1, '912996617', NULL, '/system/newRepairFrom/add', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 11:23:37\",\"describe\":\"蝉智科技测试用5\",\"imgUrls\":[\"/profile/upload/2023/06/14/tmp_fa6ee79748c790e2a3c6835141ad44bc_20230614112335A001.jpg\"],\"location\":\"蝉智科技测试用5\",\"maintenanceClassification\":\"0\",\"paidType\":\"0\",\"params\":{},\"personnelId\":28,\"regionId\":1,\"regionalClassification\":\"0\",\"repairFromId\":73,\"state\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 11:23:36', 196);
INSERT INTO `sys_oper_log` VALUES (6218, '巡更任务管理', 2, 'com.ruoyi.web.controller.system.SysPatrolController.edit()', 'PUT', 1, '18032139488', NULL, '/system/patrol', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-05 15:48:08\",\"params\":{},\"patrolDescribe\":\"环境部门巡更\",\"patrolEndTime\":\"2023-06-20 23:39:25\",\"patrolId\":296,\"patrolName\":\"冀登芳(每周)\",\"patrolPointIds\":[2,3,4,5,16,17],\"patrolPoints\":[{\"params\":{},\"patrolPointName\":\"2——11号楼西侧2层客电梯厅\"},{\"params\":{},\"patrolPointName\":\"3——19号楼1层电梯厅环境部\"},{\"params\":{},\"patrolPointName\":\"4——11号楼中厅2层东电梯厅\"},{\"params\":{},\"patrolPointName\":\"5——1号楼4层电梯厅\"},{\"params\":{},\"patrolPointName\":\"16——20号楼1层客电梯厅\"},{\"params\":{},\"patrolPointName\":\"17——13号楼南大门\"}],\"patrolStartTime\":\"2023-06-13 00:00:00\",\"patrolStatus\":\"0\",\"personnelIds\":[11],\"regionId\":1,\"type\":\"1\",\"updateTime\":\"2023-06-14 11:29:39\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 11:29:38', 371);
INSERT INTO `sys_oper_log` VALUES (6219, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.edit()', 'PUT', 1, '18032139488', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2023-05-05 15:49:30\",\"cronExpression\":\"0 0 1 ? * 2\",\"invokeTarget\":\"ryTask.creatPatrolTask(296L)\",\"jobGroup\":\"DEFAULT\",\"jobId\":14,\"jobName\":\"冀登芳(每周)\",\"misfirePolicy\":\"3\",\"nextValidTime\":\"2023-06-19 01:00:00\",\"params\":{},\"regionId\":1,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"18032139488\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 11:29:39', 98);
INSERT INTO `sys_oper_log` VALUES (6220, '巡更任务管理', 2, 'com.ruoyi.web.controller.system.SysPatrolController.edit()', 'PUT', 1, '18032139488', NULL, '/system/patrol', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-05 15:52:08\",\"params\":{},\"patrolDescribe\":\"环境部门巡更\",\"patrolEndTime\":\"2023-06-20 18:30:00\",\"patrolId\":297,\"patrolName\":\"刘春娟(每周)\",\"patrolPointIds\":[6,7,8,12,13,14,15],\"patrolPoints\":[{\"params\":{},\"patrolPointName\":\"6——16号楼外围\"},{\"params\":{},\"patrolPointName\":\"7或23——8号楼1层电梯厅\"},{\"params\":{},\"patrolPointName\":\"8或24——6号楼3层电梯厅\"},{\"params\":{},\"patrolPointName\":\"12——6号楼5层电梯厅环境部\"},{\"params\":{},\"patrolPointName\":\"13——6号楼4层电梯厅\"},{\"params\":{},\"patrolPointName\":\"14——6号楼1层电梯厅\"},{\"params\":{},\"patrolPointName\":\"15——1园区外围3号车库口\"}],\"patrolStartTime\":\"2023-06-13 00:00:00\",\"patrolStatus\":\"0\",\"personnelIds\":[12],\"regionId\":1,\"type\":\"1\",\"updateTime\":\"2023-06-14 11:29:49\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 11:29:48', 264);
INSERT INTO `sys_oper_log` VALUES (6221, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.edit()', 'PUT', 1, '18032139488', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2023-05-05 15:52:45\",\"cronExpression\":\"0 0 1 ? * 2\",\"invokeTarget\":\"ryTask.creatPatrolTask(297L)\",\"jobGroup\":\"DEFAULT\",\"jobId\":15,\"jobName\":\"刘春娟(每周)\",\"misfirePolicy\":\"3\",\"nextValidTime\":\"2023-06-19 01:00:00\",\"params\":{},\"regionId\":1,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"18032139488\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 11:29:49', 91);
INSERT INTO `sys_oper_log` VALUES (6222, '巡更任务管理', 2, 'com.ruoyi.web.controller.system.SysPatrolController.edit()', 'PUT', 1, '18032139488', NULL, '/system/patrol', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-05 16:04:56\",\"params\":{},\"patrolDescribe\":\"客服部门巡更\",\"patrolEndTime\":\"2023-06-20 18:30:00\",\"patrolId\":298,\"patrolName\":\"柳娜(每周)\",\"patrolPointIds\":[2,3,4,5,16,17],\"patrolPoints\":[{\"params\":{},\"patrolPointName\":\"2——11号楼西侧2层客电梯厅\"},{\"params\":{},\"patrolPointName\":\"3——19号楼1层电梯厅环境部\"},{\"params\":{},\"patrolPointName\":\"4——11号楼中厅2层东电梯厅\"},{\"params\":{},\"patrolPointName\":\"5——1号楼4层电梯厅\"},{\"params\":{},\"patrolPointName\":\"16——20号楼1层客电梯厅\"},{\"params\":{},\"patrolPointName\":\"17——13号楼南大门\"}],\"patrolStartTime\":\"2023-06-13 00:00:00\",\"patrolStatus\":\"0\",\"personnelIds\":[6],\"regionId\":1,\"type\":\"1\",\"updateTime\":\"2023-06-14 11:30:05\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 11:30:04', 262);
INSERT INTO `sys_oper_log` VALUES (6223, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.edit()', 'PUT', 1, '18032139488', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2023-05-05 16:05:22\",\"cronExpression\":\"0 0 1 ? * 2\",\"invokeTarget\":\"ryTask.creatPatrolTask(298L)\",\"jobGroup\":\"DEFAULT\",\"jobId\":16,\"jobName\":\"柳娜(每周)\",\"misfirePolicy\":\"3\",\"nextValidTime\":\"2023-06-19 01:00:00\",\"params\":{},\"regionId\":1,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"18032139488\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 11:30:05', 93);
INSERT INTO `sys_oper_log` VALUES (6224, '巡更任务管理', 2, 'com.ruoyi.web.controller.system.SysPatrolController.edit()', 'PUT', 1, '18032139488', NULL, '/system/patrol', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-05 16:06:21\",\"params\":{},\"patrolDescribe\":\"客服部门巡更\",\"patrolEndTime\":\"2023-06-20 18:30:00\",\"patrolId\":299,\"patrolName\":\"徐苗苗(每周)\",\"patrolPointIds\":[6,7,8,12,13,14],\"patrolPoints\":[{\"params\":{},\"patrolPointName\":\"6——16号楼外围\"},{\"params\":{},\"patrolPointName\":\"7或23——8号楼1层电梯厅\"},{\"params\":{},\"patrolPointName\":\"8或24——6号楼3层电梯厅\"},{\"params\":{},\"patrolPointName\":\"12——6号楼5层电梯厅环境部\"},{\"params\":{},\"patrolPointName\":\"13——6号楼4层电梯厅\"},{\"params\":{},\"patrolPointName\":\"14——6号楼1层电梯厅\"}],\"patrolStartTime\":\"2023-06-13 00:00:00\",\"patrolStatus\":\"0\",\"personnelIds\":[7],\"regionId\":1,\"type\":\"1\",\"updateTime\":\"2023-06-14 11:30:14\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 11:30:13', 265);
INSERT INTO `sys_oper_log` VALUES (6225, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.edit()', 'PUT', 1, '18032139488', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2023-05-05 16:06:33\",\"cronExpression\":\"0 0 1 ? * 2\",\"invokeTarget\":\"ryTask.creatPatrolTask(299L)\",\"jobGroup\":\"DEFAULT\",\"jobId\":17,\"jobName\":\"徐苗苗(每周)\",\"misfirePolicy\":\"3\",\"nextValidTime\":\"2023-06-19 01:00:00\",\"params\":{},\"regionId\":1,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"18032139488\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 11:30:14', 96);
INSERT INTO `sys_oper_log` VALUES (6226, '巡更任务管理', 2, 'com.ruoyi.web.controller.system.SysPatrolController.edit()', 'PUT', 1, '18032139488', NULL, '/system/patrol', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-05 16:16:32\",\"params\":{},\"patrolDescribe\":\"电梯部门巡更\",\"patrolEndTime\":\"2023-06-28 18:30:00\",\"patrolId\":304,\"patrolName\":\"王建国(每半月)\",\"patrolPointIds\":[33,34,35,37,38,39,40,41,42,43,44,45],\"patrolPoints\":[{\"params\":{},\"patrolPointName\":\"33——10号楼电梯\"},{\"params\":{},\"patrolPointName\":\"34——18号楼电梯\"},{\"params\":{},\"patrolPointName\":\"35——9号楼电梯\"},{\"params\":{},\"patrolPointName\":\"37——17号电梯\"},{\"params\":{},\"patrolPointName\":\"38——4号楼客梯货梯\"},{\"params\":{},\"patrolPointName\":\"39——20号楼客梯\"},{\"params\":{},\"patrolPointName\":\"40——11号楼中厅东多功能厅电梯\"},{\"params\":{},\"patrolPointName\":\"41——11号楼中厅东侧电梯\"},{\"params\":{},\"patrolPointName\":\"42——11号楼中厅扶梯\"},{\"params\":{},\"patrolPointName\":\"43——11号楼中厅西侧货梯\"},{\"params\":{},\"patrolPointName\":\"44——11号楼中厅西侧电梯\"},{\"params\":{},\"patrolPointName\":\"45——管委会电梯\"}],\"patrolStartTime\":\"2023-06-13 00:00:00\",\"patrolStatus\":\"0\",\"personnelIds\":[9],\"regionId\":1,\"type\":\"1\",\"updateTime\":\"2023-06-14 11:30:35\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 11:30:34', 253);
INSERT INTO `sys_oper_log` VALUES (6227, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.edit()', 'PUT', 1, '18032139488', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2023-05-05 16:16:52\",\"cronExpression\":\"0 0 1 1,16 * ?\",\"invokeTarget\":\"ryTask.creatPatrolTask(304L)\",\"jobGroup\":\"DEFAULT\",\"jobId\":22,\"jobName\":\"王建国(每半月)\",\"misfirePolicy\":\"3\",\"nextValidTime\":\"2023-06-16 01:00:00\",\"params\":{},\"regionId\":1,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"18032139488\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 11:30:35', 93);
INSERT INTO `sys_oper_log` VALUES (6228, '巡更任务管理', 2, 'com.ruoyi.web.controller.system.SysPatrolController.edit()', 'PUT', 1, '18032139488', NULL, '/system/patrol', '127.0.0.1', '内网IP', '{\"createBy\":\"wuyexungen\",\"createTime\":\"2023-05-08 17:04:32\",\"params\":{},\"patrolDescribe\":\"电梯部门巡更\",\"patrolEndTime\":\"2023-06-28 18:30:00\",\"patrolId\":329,\"patrolName\":\"焦祁亮（每半月）\",\"patrolPointIds\":[46,47,48,49,50,52,55,71,73,75,76,112],\"patrolPoints\":[{\"params\":{},\"patrolPointName\":\"46——2号楼货梯机房\"},{\"params\":{},\"patrolPointName\":\"47——14号楼电梯\"},{\"params\":{},\"patrolPointName\":\"48——13号楼电梯机房\"},{\"params\":{},\"patrolPointName\":\"49——1号楼货梯机房\"},{\"params\":{},\"patrolPointName\":\"50——12号楼电梯机房\"},{\"params\":{},\"patrolPointName\":\"52——19号客梯机房加太阳能即热管两个功能\"},{\"params\":{},\"patrolPointName\":\"55——15电梯机房\"},{\"params\":{},\"patrolPointName\":\"71——8号楼货梯客梯机房\"},{\"params\":{},\"patrolPointName\":\"73——6号楼客梯货梯机房\"},{\"params\":{},\"patrolPointName\":\"75——16号楼无机房\"},{\"params\":{},\"patrolPointName\":\"76——5号楼货梯客梯机房\"},{\"params\":{},\"patrolPointName\":\"112——7号楼电梯机房\"}],\"patrolStartTime\":\"2023-06-13 00:00:00\",\"patrolStatus\":\"0\",\"personnelIds\":[10],\"regionId\":1,\"type\":\"1\",\"updateTime\":\"2023-06-14 11:30:52\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 11:30:51', 248);
INSERT INTO `sys_oper_log` VALUES (6229, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.edit()', 'PUT', 1, '18032139488', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"wuyexungen\",\"createTime\":\"2023-05-08 17:05:07\",\"cronExpression\":\"0 0 1 1,16 * ?\",\"invokeTarget\":\"ryTask.creatPatrolTask(329L)\",\"jobGroup\":\"DEFAULT\",\"jobId\":32,\"jobName\":\"焦祁亮（每半月）\",\"misfirePolicy\":\"3\",\"nextValidTime\":\"2023-06-16 01:00:00\",\"params\":{},\"regionId\":1,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"18032139488\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 11:30:53', 91);
INSERT INTO `sys_oper_log` VALUES (6230, '巡更任务管理', 2, 'com.ruoyi.web.controller.system.SysPatrolController.edit()', 'PUT', 1, '18032139488', NULL, '/system/patrol', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-09 08:50:32\",\"params\":{},\"patrolDescribe\":\"工程部\",\"patrolEndTime\":\"2023-06-20 18:30:00\",\"patrolId\":379,\"patrolName\":\"高志标（每周一次）隔油池\",\"patrolPointIds\":[58],\"patrolPoints\":[{\"params\":{},\"patrolPointName\":\"58——11号楼地下隔油池\"}],\"patrolStartTime\":\"2023-06-13 00:00:00\",\"patrolStatus\":\"0\",\"personnelIds\":[14],\"regionId\":1,\"type\":\"1\",\"updateTime\":\"2023-06-14 11:31:03\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 11:31:02', 253);
INSERT INTO `sys_oper_log` VALUES (6231, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.edit()', 'PUT', 1, '18032139488', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2023-05-09 08:51:21\",\"cronExpression\":\"0 0 1 ? * 2\",\"invokeTarget\":\"ryTask.creatPatrolTask(379L)\",\"jobGroup\":\"DEFAULT\",\"jobId\":33,\"jobName\":\"高志标（每周一次）隔油池\",\"misfirePolicy\":\"3\",\"nextValidTime\":\"2023-06-19 01:00:00\",\"params\":{},\"regionId\":1,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"18032139488\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 11:31:04', 88);
INSERT INTO `sys_oper_log` VALUES (6232, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, '18032139488', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":14,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 11:31:09', 61);
INSERT INTO `sys_oper_log` VALUES (6233, '巡更任务管理', 3, 'com.ruoyi.web.controller.system.SysPatrolController.remove()', 'DELETE', 1, '18032139488', NULL, '/system/patrol/757', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 11:34:21', 183);
INSERT INTO `sys_oper_log` VALUES (6234, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, '18032139488', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":14,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 11:42:56', 84);
INSERT INTO `sys_oper_log` VALUES (6235, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, '18032139488', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":14,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 11:43:56', 34);
INSERT INTO `sys_oper_log` VALUES (6236, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":14,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 13:23:17', 76);
INSERT INTO `sys_oper_log` VALUES (6237, '巡更任务管理', 3, 'com.ruoyi.web.controller.system.SysPatrolController.remove()', 'DELETE', 1, 'admin', NULL, '/system/patrol/758', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 13:23:39', 163);
INSERT INTO `sys_oper_log` VALUES (6238, '巡更任务管理', 3, 'com.ruoyi.web.controller.system.SysPatrolController.remove()', 'DELETE', 1, 'admin', NULL, '/system/patrol/759', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 13:23:42', 168);
INSERT INTO `sys_oper_log` VALUES (6239, '巡更任务管理', 3, 'com.ruoyi.web.controller.system.SysPatrolController.remove()', 'DELETE', 1, 'admin', NULL, '/system/patrol/760', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 13:23:46', 159);
INSERT INTO `sys_oper_log` VALUES (6240, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":14,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 13:24:33', 58);
INSERT INTO `sys_oper_log` VALUES (6241, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":14,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 13:28:33', 74);
INSERT INTO `sys_oper_log` VALUES (6242, '巡更任务管理', 3, 'com.ruoyi.web.controller.system.SysPatrolController.remove()', 'DELETE', 1, 'admin', NULL, '/system/patrol/762', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 13:33:55', 118);
INSERT INTO `sys_oper_log` VALUES (6243, '巡更任务管理', 3, 'com.ruoyi.web.controller.system.SysPatrolController.remove()', 'DELETE', 1, 'admin', NULL, '/system/patrol/761', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 13:33:57', 97);
INSERT INTO `sys_oper_log` VALUES (6244, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":14,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 13:34:19', 65);
INSERT INTO `sys_oper_log` VALUES (6245, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":14,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 13:53:15', 81);
INSERT INTO `sys_oper_log` VALUES (6246, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":15,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 13:54:14', 61);
INSERT INTO `sys_oper_log` VALUES (6247, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":16,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 13:54:17', 34);
INSERT INTO `sys_oper_log` VALUES (6248, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":17,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 13:54:20', 58);
INSERT INTO `sys_oper_log` VALUES (6249, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":22,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 13:54:43', 33);
INSERT INTO `sys_oper_log` VALUES (6250, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":32,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 13:54:51', 58);
INSERT INTO `sys_oper_log` VALUES (6251, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":33,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 13:54:54', 33);
INSERT INTO `sys_oper_log` VALUES (6252, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '18331353727', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 17:47:31\",\"params\":{},\"patrolId\":748,\"patrolOrderId\":49,\"patrolPointId\":89,\"personnelId\":18,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 17:47:29', 226);
INSERT INTO `sys_oper_log` VALUES (6253, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '18331353727', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 17:49:32\",\"params\":{},\"patrolId\":748,\"patrolOrderId\":50,\"patrolPointId\":90,\"personnelId\":18,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 17:49:31', 182);
INSERT INTO `sys_oper_log` VALUES (6254, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '18331353727', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 17:51:33\",\"params\":{},\"patrolId\":748,\"patrolOrderId\":51,\"patrolPointId\":88,\"personnelId\":18,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 17:51:32', 171);
INSERT INTO `sys_oper_log` VALUES (6255, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '18131337431', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 18:20:32\",\"params\":{},\"patrolId\":749,\"patrolOrderId\":52,\"patrolPointId\":70,\"personnelId\":8,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 18:20:30', 129);
INSERT INTO `sys_oper_log` VALUES (6256, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '18131337431', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 18:23:58\",\"params\":{},\"patrolId\":749,\"patrolOrderId\":53,\"patrolPointId\":53,\"personnelId\":8,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 18:23:56', 118);
INSERT INTO `sys_oper_log` VALUES (6257, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '18131337431', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 18:29:08\",\"params\":{},\"patrolId\":749,\"patrolOrderId\":54,\"patrolPointId\":51,\"personnelId\":8,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 18:29:06', 114);
INSERT INTO `sys_oper_log` VALUES (6258, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '18131337431', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 18:42:19\",\"params\":{},\"patrolId\":749,\"patrolOrderId\":55,\"patrolPointId\":57,\"personnelId\":8,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 18:42:18', 174);
INSERT INTO `sys_oper_log` VALUES (6259, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '18131337431', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 18:43:03\",\"params\":{},\"patrolId\":749,\"patrolOrderId\":56,\"patrolPointId\":56,\"personnelId\":8,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 18:43:01', 180);
INSERT INTO `sys_oper_log` VALUES (6260, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '18131337431', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 18:52:43\",\"params\":{},\"patrolId\":749,\"patrolOrderId\":57,\"patrolPointId\":69,\"personnelId\":8,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 18:52:42', 167);
INSERT INTO `sys_oper_log` VALUES (6261, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '18131337431', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"params\":{},\"patrolId\":749,\"patrolPointId\":69,\"personnelId\":8,\"regionId\":1}', NULL, 1, 'Cannot invoke \"com.ruoyi.system.domain.SysPatrolPatrolPointStatus.setPatrolPatrolPointStatus(String)\" because \"sysPatrolPatrolPointStatus\" is null', '2023-06-14 18:52:50', 44);
INSERT INTO `sys_oper_log` VALUES (6262, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '18131337431', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 19:02:58\",\"params\":{},\"patrolId\":749,\"patrolOrderId\":58,\"patrolPointId\":65,\"personnelId\":8,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 19:02:57', 158);
INSERT INTO `sys_oper_log` VALUES (6263, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '18131337431', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 19:03:08\",\"params\":{},\"patrolId\":749,\"patrolOrderId\":59,\"patrolPointId\":54,\"personnelId\":8,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 19:03:06', 160);
INSERT INTO `sys_oper_log` VALUES (6264, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '18131337431', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 19:04:00\",\"params\":{},\"patrolId\":749,\"patrolOrderId\":60,\"patrolPointId\":67,\"personnelId\":8,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 19:03:59', 157);
INSERT INTO `sys_oper_log` VALUES (6265, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '18131337431', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 19:11:43\",\"params\":{},\"patrolId\":749,\"patrolOrderId\":61,\"patrolPointId\":66,\"personnelId\":8,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 19:11:43', 101);
INSERT INTO `sys_oper_log` VALUES (6266, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '18131337431', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 19:13:01\",\"params\":{},\"patrolId\":749,\"patrolOrderId\":62,\"patrolPointId\":64,\"personnelId\":8,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 19:13:01', 108);
INSERT INTO `sys_oper_log` VALUES (6267, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '18131337431', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 19:13:26\",\"params\":{},\"patrolId\":749,\"patrolOrderId\":63,\"patrolPointId\":68,\"personnelId\":8,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 19:13:26', 111);
INSERT INTO `sys_oper_log` VALUES (6268, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '18131337431', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 19:18:08\",\"params\":{},\"patrolId\":749,\"patrolOrderId\":64,\"patrolPointId\":63,\"personnelId\":8,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 19:18:08', 165);
INSERT INTO `sys_oper_log` VALUES (6269, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '18131337431', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 19:18:59\",\"params\":{},\"patrolId\":749,\"patrolOrderId\":65,\"patrolPointId\":62,\"personnelId\":8,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 19:18:59', 101);
INSERT INTO `sys_oper_log` VALUES (6270, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '18131337431', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 19:31:20\",\"params\":{},\"patrolId\":749,\"patrolOrderId\":66,\"patrolPointId\":61,\"personnelId\":8,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 19:31:20', 159);
INSERT INTO `sys_oper_log` VALUES (6271, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '18131337431', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 19:31:58\",\"params\":{},\"patrolId\":749,\"patrolOrderId\":67,\"patrolPointId\":60,\"personnelId\":8,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 19:31:58', 159);
INSERT INTO `sys_oper_log` VALUES (6272, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, '18131337431', NULL, '/system/patrolOrder', '192.168.1.5', '内网IP', '{\"createTime\":\"2023-06-14 19:42:06\",\"params\":{},\"patrolId\":749,\"patrolOrderId\":68,\"patrolPointId\":59,\"personnelId\":8,\"regionId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-14 19:42:06', 101);
INSERT INTO `sys_oper_log` VALUES (6273, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '192.168.1.5', '内网IP', '{\"tables\":\"sys_region\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-20 08:05:07', 338);
INSERT INTO `sys_oper_log` VALUES (6274, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '192.168.1.5', '内网IP', '{\"businessName\":\"region\",\"className\":\"SysRegion\",\"columns\":[{\"capJavaField\":\"RegionId\",\"columnComment\":\"区域划分id\",\"columnId\":1,\"columnName\":\"region_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-06-20 08:05:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"regionId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"区域名称\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-06-20 08:05:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RegionLongitude\",\"columnComment\":\"区域经度\",\"columnId\":3,\"columnName\":\"region_longitude\",\"columnType\":\"decimal(20,10)\",\"createBy\":\"admin\",\"createTime\":\"2023-06-20 08:05:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"regionLongitude\",\"javaType\":\"BigDecimal\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RegionLatitude\",\"columnComment\":\"区域纬度\",\"columnId\":4,\"columnName\":\"region_latitude\",\"columnType\":\"decimal(20,10)\",\"createBy\":\"admin\",\"createTime\":\"2023-06-20 08:05:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"java', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-20 08:06:13', 154);
INSERT INTO `sys_oper_log` VALUES (6275, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '192.168.1.12', '内网IP', '{\"tables\":\"inspection_item_title_value,inspection_item_title,inspection_items\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-27 06:51:54', 196);
INSERT INTO `sys_oper_log` VALUES (6276, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/inspection_items', '192.168.1.12', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-27 07:11:09', 76);
INSERT INTO `sys_oper_log` VALUES (6277, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/inspection_items', '192.168.1.12', '内网IP', '{}', NULL, 1, '同步数据失败，原表结构不存在', '2023-06-27 07:18:14', 11);
INSERT INTO `sys_oper_log` VALUES (6278, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/4', '192.168.1.12', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-27 07:18:19', 55);
INSERT INTO `sys_oper_log` VALUES (6279, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '192.168.1.12', '内网IP', '{\"tables\":\"inspection_item\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-27 07:18:24', 60);
INSERT INTO `sys_oper_log` VALUES (6280, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '192.168.1.12', '内网IP', '{\"tables\":\"inspection_route\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-28 07:32:17', 97);
INSERT INTO `sys_oper_log` VALUES (6281, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/inspection_route', '192.168.1.12', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-28 07:41:15', 127);
INSERT INTO `sys_oper_log` VALUES (6282, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '192.168.1.12', '内网IP', '{\"tables\":\"inspection_route_point_rel\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-28 07:41:21', 224);
INSERT INTO `sys_oper_log` VALUES (6283, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/inspection_route_point_rel', '192.168.1.12', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-28 07:41:24', 77);
INSERT INTO `sys_oper_log` VALUES (6284, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '192.168.1.11', '内网IP', '{\"tables\":\"inspection_item_title,inspection_item_title_value,inspection_item,inspection_route,inspection_route_point_rel\"}', NULL, 0, NULL, '2023-06-29 01:09:26', 834);
INSERT INTO `sys_oper_log` VALUES (6285, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '192.168.1.11', '内网IP', '{\"children\":[],\"component\":\"system/route/index\",\"createBy\":\"admin\",\"icon\":\"online\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"巡更线路管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"route\",\"perms\":\"system:route:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-29 01:18:55', 91);
INSERT INTO `sys_oper_log` VALUES (6286, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '192.168.1.11', '内网IP', '{\"children\":[],\"component\":\"system/value/index\",\"createBy\":\"admin\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"巡更计划\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"value\",\"perms\":\"system:value:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-29 01:23:12', 54);
INSERT INTO `sys_oper_log` VALUES (6287, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '192.168.1.11', '内网IP', '{\"children\":[],\"component\":\"system/item/index\",\"createTime\":\"2023-06-29 01:23:12\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2077,\"menuName\":\"巡更计划\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"item\",\"perms\":\"system:item:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-29 01:26:01', 41);
INSERT INTO `sys_oper_log` VALUES (6288, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '192.168.1.11', '内网IP', '{\"children\":[],\"component\":\"system/rel/index\",\"createBy\":\"admin\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"巡更点\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2076,\"path\":\"rel\",\"perms\":\"system:rel:list\",\"status\":\"0\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-29 03:21:22', 91);
INSERT INTO `sys_oper_log` VALUES (6289, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '192.168.1.11', '内网IP', '{\"children\":[],\"component\":\"system/rel/index\",\"createTime\":\"2023-06-29 03:21:21\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2078,\"menuName\":\"巡更点\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2076,\"path\":\"rel\",\"perms\":\"system:rel:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-29 03:29:26', 42);
INSERT INTO `sys_oper_log` VALUES (6290, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2078', '192.168.1.11', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-29 03:30:11', 49);
INSERT INTO `sys_oper_log` VALUES (6291, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '192.168.1.11', '内网IP', '{\"children\":[],\"component\":\"system/rel/index\",\"createBy\":\"admin\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"巡更点\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"rel\",\"perms\":\"system:rel:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-29 03:31:14', 44);
INSERT INTO `sys_oper_log` VALUES (6292, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '192.168.1.11', '内网IP', '{\"children\":[],\"component\":\"system/rel/index\",\"createTime\":\"2023-06-29 03:31:14\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2079,\"menuName\":\"巡更点\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"rel\",\"perms\":\"system:rel:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-29 03:31:40', 53);
INSERT INTO `sys_oper_log` VALUES (6293, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '192.168.1.11', '内网IP', '{\"children\":[],\"component\":\"system/rel/index\",\"createTime\":\"2023-06-29 03:31:14\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2079,\"menuName\":\"巡更点\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"rel\",\"perms\":\"system:rel:list\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-29 03:36:21', 50);
INSERT INTO `sys_oper_log` VALUES (6294, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '192.168.1.11', '内网IP', '{\"children\":[],\"component\":\"system/rel/index\",\"createBy\":\"admin\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"巡更点\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2076,\"path\":\"rel\",\"perms\":\"system:rel:list\",\"status\":\"0\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-29 03:37:20', 49);
INSERT INTO `sys_oper_log` VALUES (6295, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2080', '192.168.1.11', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-29 03:38:10', 47);
INSERT INTO `sys_oper_log` VALUES (6296, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '192.168.1.11', '内网IP', '{\"children\":[],\"component\":\"system/rel/index\",\"createTime\":\"2023-06-29 03:31:14\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2079,\"menuName\":\"巡更点\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"rel\",\"perms\":\"system:rel:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-29 03:38:15', 57);
INSERT INTO `sys_oper_log` VALUES (6297, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/item/index\",\"createTime\":\"2023-06-29 01:23:12\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2077,\"menuName\":\"巡更项目\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"item\",\"perms\":\"system:item:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-29 09:38:52', 52);
INSERT INTO `sys_oper_log` VALUES (6298, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/title/index\",\"createBy\":\"admin\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"题目\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"title\",\"perms\":\"system:title:list\",\"status\":\"0\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-29 10:15:08', 56);

-- ----------------------------
-- Table structure for sys_patrol
-- ----------------------------
DROP TABLE IF EXISTS `sys_patrol`;
CREATE TABLE `sys_patrol`  (
  `patrol_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '巡更任务编号',
  `patrol_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '巡更任务名称',
  `patrol_describe` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '巡更任务描述',
  `patrol_principal` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '巡更任务负责人',
  `patrol_phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人联系方式',
  `patrol_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '巡更任务状态',
  `patrol_start_time` datetime NULL DEFAULT NULL COMMENT '计划开始时间',
  `patrol_end_time` datetime NULL DEFAULT NULL COMMENT '计划结束时间',
  `patrol_create_time` datetime NULL DEFAULT NULL COMMENT '任务创建时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否为定时任务模板',
  `patrol_actual_end_time` datetime NULL DEFAULT NULL COMMENT '实际结束实际',
  `patrol_actual_start_time` datetime NULL DEFAULT NULL COMMENT '实际开始时间',
  `region_id` bigint(20) NULL DEFAULT NULL COMMENT '区域id',
  PRIMARY KEY (`patrol_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 840 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_patrol
-- ----------------------------
INSERT INTO `sys_patrol` VALUES (282, '测试1', NULL, NULL, NULL, '0', '2023-06-13 16:19:16', '2023-06-14 01:00:00', NULL, NULL, 'admin', '2023-05-04 14:40:28', '', '2023-06-13 16:19:29', '1', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (296, '冀登芳(每周)', '环境部门巡更', NULL, NULL, '0', '2023-06-13 00:00:00', '2023-06-20 23:39:25', NULL, NULL, 'admin', '2023-05-05 15:48:08', '', '2023-06-14 11:29:40', '1', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (297, '刘春娟(每周)', '环境部门巡更', NULL, NULL, '0', '2023-06-13 00:00:00', '2023-06-20 18:30:00', NULL, NULL, 'admin', '2023-05-05 15:52:08', '', '2023-06-14 11:29:50', '1', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (298, '柳娜(每周)', '客服部门巡更', NULL, NULL, '0', '2023-06-13 00:00:00', '2023-06-20 18:30:00', NULL, NULL, 'admin', '2023-05-05 16:04:56', '', '2023-06-14 11:30:05', '1', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (299, '徐苗苗(每周)', '客服部门巡更', NULL, NULL, '0', '2023-06-13 00:00:00', '2023-06-20 18:30:00', NULL, NULL, 'admin', '2023-05-05 16:06:21', '', '2023-06-14 11:30:15', '1', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (300, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '0', '2023-06-13 17:30:00', '2023-06-14 08:30:00', NULL, NULL, 'admin', '2023-05-05 16:10:02', '', '2023-06-13 16:57:33', '1', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (301, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '0', '2023-06-13 17:30:00', '2023-06-14 08:30:00', NULL, NULL, 'admin', '2023-05-05 16:11:50', '', '2023-06-13 16:57:21', '1', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (302, '高志标(每天)', '工程部门巡更', NULL, NULL, '0', '2023-06-13 08:30:00', '2023-06-13 18:00:00', NULL, NULL, 'admin', '2023-05-05 16:14:00', '', '2023-06-14 09:39:24', '1', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (303, '程建林(每天)', '工程部门巡更', NULL, NULL, '0', '2023-06-13 17:30:00', '2023-06-14 08:30:00', NULL, NULL, 'admin', '2023-05-05 16:15:28', '', '2023-06-14 09:40:03', '1', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (304, '王建国(每半月)', '电梯部门巡更', NULL, NULL, '0', '2023-06-13 00:00:00', '2023-06-28 18:30:00', NULL, NULL, 'admin', '2023-05-05 16:16:32', '', '2023-06-14 11:30:35', '1', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (305, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '0', '2023-06-13 00:00:00', '2023-06-13 08:30:00', NULL, NULL, 'admin', '2023-05-05 16:43:49', '', '2023-06-13 17:01:17', '1', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (306, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '0', '2023-06-13 08:30:00', '2023-06-13 18:30:00', NULL, NULL, 'admin', '2023-05-05 16:45:46', '', '2023-06-13 17:01:35', '1', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (307, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '0', '2023-06-13 08:00:00', '2023-06-14 00:00:00', NULL, NULL, 'admin', '2023-05-05 16:47:31', '', '2023-06-13 17:00:36', '1', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (308, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '0', '2023-06-13 08:30:00', '2023-06-13 18:30:00', NULL, NULL, 'admin', '2023-05-05 16:48:33', '', '2023-06-14 09:08:04', '1', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (322, '测试(夏)', '巡更测试', NULL, NULL, '0', NULL, NULL, NULL, '测试用', 'admin', '2023-05-07 09:54:56', '', NULL, '1', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (329, '焦祁亮（每半月）', '电梯部门巡更', NULL, NULL, '0', '2023-06-13 00:00:00', '2023-06-28 18:30:00', NULL, NULL, 'wuyexungen', '2023-05-08 17:04:32', '', '2023-06-14 11:30:53', '1', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (379, '高志标（每周一次）隔油池', '工程部', NULL, NULL, '0', '2023-06-13 00:00:00', '2023-06-20 18:30:00', NULL, NULL, 'admin', '2023-05-09 08:50:32', '', '2023-06-14 11:31:04', '1', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (380, '冀登芳(每周)', '环境部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-09 09:44:56', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (381, '刘春娟(每周)', '环境部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-09 09:45:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (382, '柳娜(每周)', '客服部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-09 09:45:03', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (383, '徐苗苗(每周)', '客服部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-09 09:45:09', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (384, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-09 09:45:12', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (385, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-09 09:45:14', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (386, '高志标(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-09 09:45:17', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (387, '程建林(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-09 09:45:19', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (388, '王建国(每半月)', '电梯部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-09 09:45:21', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (389, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-09 09:45:25', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (390, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-09 09:45:27', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (391, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-09 09:45:29', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (392, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-09 09:45:33', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (393, '焦祁亮（每半月）', '电梯部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'wuyexungen', '2023-05-09 09:45:38', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (394, '高志标（每周一次）隔油池', '工程部', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-09 09:45:41', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (400, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-10 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (401, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-10 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (402, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-10 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (403, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-10 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (405, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-10 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (406, '程建林(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-10 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (407, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-10 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (414, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-10 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (415, '高志标(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-10 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (419, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-11 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (424, '高志标(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-11 01:00:01', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (425, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-11 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (426, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-11 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (428, '程建林(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-11 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (429, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-11 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (431, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-11 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (432, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-11 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (439, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-12 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (442, '高志标(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-12 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (447, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-12 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (448, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-12 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (449, '程建林(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-12 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (450, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-12 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (451, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-12 01:00:01', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (452, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-12 01:00:01', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (453, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-15 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (454, '徐苗苗(每周)', '客服部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-15 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (455, '高志标(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-15 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (456, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-15 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (457, '程建林(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-15 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (458, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-15 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (459, '刘春娟(每周)', '环境部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-15 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (460, '柳娜(每周)', '客服部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-15 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (461, '冀登芳(每周)', '环境部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-15 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (462, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-15 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (463, '高志标（每周一次）隔油池', '工程部', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-15 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (464, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-15 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (465, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-15 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (476, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-16 01:00:01', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (478, '高志标(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-16 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (479, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-16 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (480, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-16 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (481, '程建林(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-16 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (482, '焦祁亮（每半月）', '电梯部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'wuyexungen', '2023-05-16 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (483, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-16 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (484, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-16 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (485, '王建国(每半月)', '电梯部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-16 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (487, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-16 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (488, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-17 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (489, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-17 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (490, '程建林(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-17 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (491, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-17 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (492, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-17 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (493, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-17 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (494, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-17 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (495, '高志标(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-17 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (496, '程建林(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-18 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (497, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-18 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (498, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-18 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (499, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-18 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (500, '高志标(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-18 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (501, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-18 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (502, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-18 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (503, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-18 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (504, '高志标(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-19 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (505, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-19 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (506, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-19 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (507, '程建林(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-19 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (508, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-19 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (509, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-19 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (510, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-19 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (511, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-19 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (512, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-20 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (513, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-20 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (514, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-20 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (515, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-20 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (516, '程建林(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-20 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (517, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-20 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (518, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-20 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (519, '高志标(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-20 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (520, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-21 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (521, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-21 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (522, '高志标(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-21 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (523, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-21 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (524, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-21 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (525, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-21 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (526, '程建林(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-21 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (527, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-21 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (528, '柳娜(每周)', '客服部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-22 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (529, '冀登芳(每周)', '环境部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-22 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (530, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-22 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (531, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-22 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (532, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-22 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (533, '高志标(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-22 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (534, '程建林(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-22 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (535, '刘春娟(每周)', '环境部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-22 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (536, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-22 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (537, '徐苗苗(每周)', '客服部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-22 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (538, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-22 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (539, '高志标（每周一次）隔油池', '工程部', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-22 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (540, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-22 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (541, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-23 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (542, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-23 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (543, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-23 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (544, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-23 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (545, '高志标(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-23 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (546, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-23 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (547, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-23 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (548, '程建林(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-23 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (549, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-24 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (550, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-24 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (551, '高志标(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-24 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (552, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-24 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (553, '程建林(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-24 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (554, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-24 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (555, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-24 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (556, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-24 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (557, '高志标(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-25 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (558, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-25 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (559, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-25 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (560, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-25 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (561, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-25 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (562, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-25 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (563, '程建林(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-25 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (564, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-25 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (565, '程建林(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-26 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (566, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-26 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (567, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-26 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (568, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-26 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (569, '高志标(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-26 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (570, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-26 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (571, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-26 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (572, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-26 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (573, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-27 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (574, '高志标(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-27 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (575, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-27 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (576, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-27 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (577, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-27 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (578, '程建林(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-27 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (579, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-27 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (580, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-27 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (581, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-28 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (582, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-28 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (583, '高志标(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-28 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (584, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-28 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (585, '程建林(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-28 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (586, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-28 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (587, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-28 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (588, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-28 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (589, '冀登芳(每周)', '环境部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-29 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (590, '刘春娟(每周)', '环境部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-29 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (591, '柳娜(每周)', '客服部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-29 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (592, '徐苗苗(每周)', '客服部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-29 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (593, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-29 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (594, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-29 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (595, '高志标(每天)', '工程部门巡更', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'admin', '2023-05-29 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (596, '程建林(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-29 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (597, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-29 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (598, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-29 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (599, '高志标（每周一次）隔油池', '工程部', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'admin', '2023-05-29 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (600, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-29 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (601, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-29 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (602, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-30 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (603, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-30 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (604, '高志标(每天)', '工程部门巡更', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'admin', '2023-05-30 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (605, '程建林(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-30 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (606, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-30 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (607, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-30 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (608, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'admin', '2023-05-30 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (609, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-30 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (610, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-31 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (611, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-31 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (612, '高志标(每天)', '工程部门巡更', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'admin', '2023-05-31 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (613, '程建林(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-31 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (614, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-31 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (615, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-31 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (616, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-31 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (617, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-05-31 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (618, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-01 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (619, '高志标(每天)', '工程部门巡更', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'admin', '2023-06-01 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (620, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-01 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (621, '王建国(每半月)', '电梯部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-01 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (622, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-01 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (623, '焦祁亮（每半月）', '电梯部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'wuyexungen', '2023-06-01 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (624, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-01 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (625, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-01 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (626, '程建林(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-01 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (627, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-01 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (634, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-02 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (636, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-02 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (637, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-02 01:00:01', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (638, '高志标(每天)', '工程部门巡更', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'admin', '2023-06-02 01:00:01', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (639, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-02 01:00:01', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (640, '程建林(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-02 01:00:01', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (641, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-02 01:00:01', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (644, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-02 01:00:01', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (645, '程建林(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-03 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (646, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-03 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (647, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-03 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (648, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-03 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (649, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-03 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (650, '高志标(每天)', '工程部门巡更', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'admin', '2023-06-03 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (651, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-03 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (652, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-03 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (653, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-04 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (654, '高志标(每天)', '工程部门巡更', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'admin', '2023-06-04 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (655, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-04 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (656, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-04 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (657, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-04 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (658, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-04 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (659, '程建林(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-04 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (660, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-04 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (661, '冀登芳(每周)', '环境部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-05 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (662, '刘春娟(每周)', '环境部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-05 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (663, '柳娜(每周)', '客服部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-05 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (664, '徐苗苗(每周)', '客服部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-05 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (665, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-05 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (666, '高志标(每天)', '工程部门巡更', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'admin', '2023-06-05 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (667, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-05 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (668, '程建林(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-05 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (669, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-05 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (670, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-05 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (671, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-05 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (672, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-05 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (673, '高志标（每周一次）隔油池', '工程部', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'admin', '2023-06-05 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (674, '高志标(每天)', '工程部门巡更', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'admin', '2023-06-06 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (675, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-06 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (676, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-06 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (677, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-06 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (678, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-06 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (679, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-06 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (680, '程建林(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-06 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (681, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-06 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (682, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-07 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (683, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-07 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (684, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-07 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (685, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-07 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (686, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-07 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (687, '高志标(每天)', '工程部门巡更', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'admin', '2023-06-07 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (688, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-07 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (689, '程建林(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-07 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (690, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-08 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (691, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-08 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (692, '高志标(每天)', '工程部门巡更', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'admin', '2023-06-08 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (693, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-08 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (694, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-08 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (695, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-08 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (696, '程建林(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-08 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (697, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-08 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (698, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-09 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (699, '程建林(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-09 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (700, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-09 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (701, '高志标(每天)', '工程部门巡更', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'admin', '2023-06-09 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (702, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'admin', '2023-06-09 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (703, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-09 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (704, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-09 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (705, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-09 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (706, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-10 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (707, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-10 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (708, '高志标(每天)', '工程部门巡更', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'admin', '2023-06-10 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (709, '程建林(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-10 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (710, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-10 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (711, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-10 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (712, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-10 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (713, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-10 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (714, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-11 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (715, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-11 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (716, '程建林(每天)', '工程部门巡更', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'admin', '2023-06-11 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (717, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-11 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (718, '高志标(每天)', '工程部门巡更', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'admin', '2023-06-11 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (719, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-11 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (720, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-11 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (721, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-11 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (722, '冀登芳(每周)', '环境部门巡更', NULL, NULL, '1', NULL, NULL, NULL, NULL, 'admin', '2023-06-12 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (723, '刘春娟(每周)', '环境部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-12 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (724, '柳娜(每周)', '客服部门巡更', NULL, NULL, '1', NULL, NULL, NULL, NULL, 'admin', '2023-06-12 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (725, '徐苗苗(每周)', '客服部门巡更', NULL, NULL, '1', NULL, NULL, NULL, NULL, 'admin', '2023-06-12 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (726, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-12 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (727, '程建林(每天)', '工程部门巡更', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'admin', '2023-06-12 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (728, '高志标(每天)', '工程部门巡更', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'admin', '2023-06-12 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (729, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-12 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (730, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-12 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (731, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'admin', '2023-06-12 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (732, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-12 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (733, '高志标（每周一次）隔油池', '工程部', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'admin', '2023-06-12 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (734, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-12 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (735, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-13 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (736, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'admin', '2023-06-13 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (737, '高志标(每天)', '工程部门巡更', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'admin', '2023-06-13 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (738, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-13 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (739, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'admin', '2023-06-13 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (740, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'admin', '2023-06-13 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (741, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '2', NULL, NULL, NULL, NULL, 'admin', '2023-06-13 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (742, '程建林(每天)', '工程部门巡更', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'admin', '2023-06-13 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (747, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '2', '2023-06-14 00:00:00', '2023-06-14 08:30:00', NULL, NULL, 'admin', '2023-06-14 01:00:00', '', NULL, '0', '2023-06-14 02:16:49', '2023-06-14 01:17:12', 1);
INSERT INTO `sys_patrol` VALUES (748, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '1', '2023-06-14 08:00:00', '2023-06-15 00:00:00', NULL, NULL, 'admin', '2023-06-14 01:00:00', '', NULL, '0', NULL, '2023-06-14 17:47:31', 1);
INSERT INTO `sys_patrol` VALUES (749, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '2', '2023-06-14 17:30:00', '2023-06-15 08:30:00', NULL, NULL, 'admin', '2023-06-14 01:00:00', '', NULL, '0', '2023-06-14 19:42:06', '2023-06-14 18:20:32', 1);
INSERT INTO `sys_patrol` VALUES (750, '程建林(每天)', '工程部门巡更', NULL, NULL, '3', '2023-06-14 08:30:00', '2023-06-14 18:00:00', NULL, NULL, 'admin', '2023-06-14 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (751, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '0', '2023-06-14 17:30:00', '2023-06-15 08:30:00', NULL, NULL, 'admin', '2023-06-14 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (752, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '2', '2023-06-14 08:30:00', '2023-06-14 18:30:00', NULL, NULL, 'admin', '2023-06-14 01:00:00', '', NULL, '0', '2023-06-14 10:53:25', '2023-06-14 09:03:49', 1);
INSERT INTO `sys_patrol` VALUES (753, '高志标(每天)', '工程部门巡更', NULL, NULL, '0', '2023-06-14 17:30:00', '2023-06-15 08:30:00', NULL, NULL, 'admin', '2023-06-14 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (756, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '3', '2023-06-14 08:30:00', '2023-06-14 18:30:00', NULL, NULL, 'admin', '2023-06-14 09:08:18', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (764, '冀登芳(每周)', '环境部门巡更', NULL, NULL, '3', '2023-06-14 00:00:00', '2023-06-21 23:39:25', NULL, NULL, 'admin', '2023-06-14 13:53:17', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (765, '刘春娟(每周)', '环境部门巡更', NULL, NULL, '3', '2023-06-14 00:00:00', '2023-06-21 18:30:00', NULL, NULL, 'admin', '2023-06-14 13:54:16', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (766, '柳娜(每周)', '客服部门巡更', NULL, NULL, '3', '2023-06-14 00:00:00', '2023-06-21 18:30:00', NULL, NULL, 'admin', '2023-06-14 13:54:19', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (767, '徐苗苗(每周)', '客服部门巡更', NULL, NULL, '3', '2023-06-14 00:00:00', '2023-06-21 18:30:00', NULL, NULL, 'admin', '2023-06-14 13:54:22', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (768, '王建国(每半月)', '电梯部门巡更', NULL, NULL, '3', '2023-06-14 00:00:00', '2023-06-29 18:30:00', NULL, NULL, 'admin', '2023-06-14 13:54:45', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (769, '焦祁亮（每半月）', '电梯部门巡更', NULL, NULL, '3', '2023-06-14 00:00:00', '2023-06-29 18:30:00', NULL, NULL, 'wuyexungen', '2023-06-14 13:54:53', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (770, '高志标（每周一次）隔油池', '工程部', NULL, NULL, '3', '2023-06-14 00:00:00', '2023-06-21 18:30:00', NULL, NULL, 'admin', '2023-06-14 13:54:56', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (771, '高志标(每天)', '工程部门巡更', NULL, NULL, '3', '2023-06-20 08:30:00', '2023-06-20 18:00:00', NULL, NULL, 'admin', '2023-06-20 01:00:01', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (772, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '3', '2023-06-20 08:00:00', '2023-06-21 00:00:00', NULL, NULL, 'admin', '2023-06-20 01:00:01', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (773, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '0', '2023-06-20 00:00:00', '2023-06-20 08:30:00', NULL, NULL, 'admin', '2023-06-20 01:00:01', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (774, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '3', '2023-06-20 08:30:00', '2023-06-20 18:30:00', NULL, NULL, 'admin', '2023-06-20 01:00:01', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (775, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '3', '2023-06-20 08:30:00', '2023-06-20 18:30:00', NULL, NULL, 'admin', '2023-06-20 01:00:01', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (776, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '3', '2023-06-20 17:30:00', '2023-06-21 08:30:00', NULL, NULL, 'admin', '2023-06-20 01:00:01', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (777, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '3', '2023-06-20 17:30:00', '2023-06-21 08:30:00', NULL, NULL, 'admin', '2023-06-20 01:00:01', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (778, '程建林(每天)', '工程部门巡更', NULL, NULL, '3', '2023-06-20 17:30:00', '2023-06-21 08:30:00', NULL, NULL, 'admin', '2023-06-20 01:00:01', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (779, '程建林(每天)', '工程部门巡更', NULL, NULL, '3', '2023-06-21 17:30:00', '2023-06-22 08:30:00', NULL, NULL, 'admin', '2023-06-21 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (780, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '3', '2023-06-21 08:30:00', '2023-06-21 18:30:00', NULL, NULL, 'admin', '2023-06-21 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (781, '高志标(每天)', '工程部门巡更', NULL, NULL, '3', '2023-06-21 08:30:00', '2023-06-21 18:00:00', NULL, NULL, 'admin', '2023-06-21 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (782, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '3', '2023-06-21 08:00:00', '2023-06-22 00:00:00', NULL, NULL, 'admin', '2023-06-21 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (783, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '3', '2023-06-21 08:30:00', '2023-06-21 18:30:00', NULL, NULL, 'admin', '2023-06-21 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (784, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '3', '2023-06-21 17:30:00', '2023-06-22 08:30:00', NULL, NULL, 'admin', '2023-06-21 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (785, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '3', '2023-06-21 17:30:00', '2023-06-22 08:30:00', NULL, NULL, 'admin', '2023-06-21 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (786, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '3', '2023-06-21 00:00:00', '2023-06-21 08:30:00', NULL, NULL, 'admin', '2023-06-21 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (787, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '3', '2023-06-22 08:30:00', '2023-06-22 18:30:00', NULL, NULL, 'admin', '2023-06-22 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (788, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '3', '2023-06-22 17:30:00', '2023-06-23 08:30:00', NULL, NULL, 'admin', '2023-06-22 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (789, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '3', '2023-06-22 08:00:00', '2023-06-23 00:00:00', NULL, NULL, 'admin', '2023-06-22 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (790, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '3', '2023-06-22 17:30:00', '2023-06-23 08:30:00', NULL, NULL, 'admin', '2023-06-22 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (791, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '3', '2023-06-22 08:30:00', '2023-06-22 18:30:00', NULL, NULL, 'admin', '2023-06-22 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (792, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '3', '2023-06-22 00:00:00', '2023-06-22 08:30:00', NULL, NULL, 'admin', '2023-06-22 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (793, '高志标(每天)', '工程部门巡更', NULL, NULL, '3', '2023-06-22 08:30:00', '2023-06-22 18:00:00', NULL, NULL, 'admin', '2023-06-22 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (794, '程建林(每天)', '工程部门巡更', NULL, NULL, '3', '2023-06-22 17:30:00', '2023-06-23 08:30:00', NULL, NULL, 'admin', '2023-06-22 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (795, '高志标(每天)', '工程部门巡更', NULL, NULL, '0', '2023-06-23 08:30:00', '2023-06-23 18:00:00', NULL, NULL, 'admin', '2023-06-23 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (796, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '3', '2023-06-23 00:00:00', '2023-06-23 08:30:00', NULL, NULL, 'admin', '2023-06-23 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (797, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '0', '2023-06-23 17:30:00', '2023-06-24 08:30:00', NULL, NULL, 'admin', '2023-06-23 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (798, '程建林(每天)', '工程部门巡更', NULL, NULL, '0', '2023-06-23 17:30:00', '2023-06-24 08:30:00', NULL, NULL, 'admin', '2023-06-23 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (799, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '0', '2023-06-23 08:30:00', '2023-06-23 18:30:00', NULL, NULL, 'admin', '2023-06-23 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (800, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '0', '2023-06-23 17:30:00', '2023-06-24 08:30:00', NULL, NULL, 'admin', '2023-06-23 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (801, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '0', '2023-06-23 08:30:00', '2023-06-23 18:30:00', NULL, NULL, 'admin', '2023-06-23 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (802, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '2', '2023-06-23 08:00:00', '2023-06-24 00:00:00', NULL, NULL, 'admin', '2023-06-23 01:00:00', '', '2023-06-24 10:53:25', '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (803, '程建林(每天)', '工程部门巡更', NULL, NULL, '3', '2023-06-26 17:30:00', '2023-06-27 08:30:00', NULL, NULL, 'admin', '2023-06-26 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (804, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '3', '2023-06-26 17:30:00', '2023-06-27 08:30:00', NULL, NULL, 'admin', '2023-06-26 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (805, '刘春娟(每周)', '环境部门巡更', NULL, NULL, '0', '2023-06-26 00:00:00', '2023-07-03 18:30:00', NULL, NULL, 'admin', '2023-06-26 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (806, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '3', '2023-06-26 08:30:00', '2023-06-26 18:30:00', NULL, NULL, 'admin', '2023-06-26 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (807, '徐苗苗(每周)', '客服部门巡更', NULL, NULL, '0', '2023-06-26 00:00:00', '2023-07-03 18:30:00', NULL, NULL, 'admin', '2023-06-26 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (808, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '3', '2023-06-26 00:00:00', '2023-06-26 08:30:00', NULL, NULL, 'admin', '2023-06-26 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (809, '柳娜(每周)', '客服部门巡更', NULL, NULL, '0', '2023-06-26 00:00:00', '2023-07-03 18:30:00', NULL, NULL, 'admin', '2023-06-26 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (810, '高志标(每天)', '工程部门巡更', NULL, NULL, '3', '2023-06-26 08:30:00', '2023-06-26 18:00:00', NULL, NULL, 'admin', '2023-06-26 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (811, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '3', '2023-06-26 17:30:00', '2023-06-27 08:30:00', NULL, NULL, 'admin', '2023-06-26 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (812, '冀登芳(每周)', '环境部门巡更', NULL, NULL, '0', '2023-06-26 00:00:00', '2023-07-03 23:39:25', NULL, NULL, 'admin', '2023-06-26 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (813, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '3', '2023-06-26 08:00:00', '2023-06-27 00:00:00', NULL, NULL, 'admin', '2023-06-26 01:00:01', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (814, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '3', '2023-06-26 08:30:00', '2023-06-26 18:30:00', NULL, NULL, 'admin', '2023-06-26 01:00:01', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (815, '高志标（每周一次）隔油池', '工程部', NULL, NULL, '0', '2023-06-26 00:00:00', '2023-07-03 18:30:00', NULL, NULL, 'admin', '2023-06-26 01:00:01', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (816, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '3', '2023-06-27 17:30:00', '2023-06-28 08:30:00', NULL, NULL, 'admin', '2023-06-27 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (817, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '3', '2023-06-27 08:30:00', '2023-06-27 18:30:00', NULL, NULL, 'admin', '2023-06-27 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (818, '程建林(每天)', '工程部门巡更', NULL, NULL, '3', '2023-06-27 17:30:00', '2023-06-28 08:30:00', NULL, NULL, 'admin', '2023-06-27 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (819, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '3', '2023-06-27 08:30:00', '2023-06-27 18:30:00', NULL, NULL, 'admin', '2023-06-27 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (820, '高志标(每天)', '工程部门巡更', NULL, NULL, '3', '2023-06-27 08:30:00', '2023-06-27 18:00:00', NULL, NULL, 'admin', '2023-06-27 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (821, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '3', '2023-06-27 08:00:00', '2023-06-28 00:00:00', NULL, NULL, 'admin', '2023-06-27 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (822, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '3', '2023-06-27 00:00:00', '2023-06-27 08:30:00', NULL, NULL, 'admin', '2023-06-27 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (823, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '3', '2023-06-27 17:30:00', '2023-06-28 08:30:00', NULL, NULL, 'admin', '2023-06-27 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (824, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '3', '2023-06-28 00:00:00', '2023-06-28 08:30:00', NULL, NULL, 'admin', '2023-06-28 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (825, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '3', '2023-06-28 08:30:00', '2023-06-28 18:30:00', NULL, NULL, 'admin', '2023-06-28 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (826, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '3', '2023-06-28 08:00:00', '2023-06-29 00:00:00', NULL, NULL, 'admin', '2023-06-28 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (827, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '3', '2023-06-28 17:30:00', '2023-06-29 08:30:00', NULL, NULL, 'admin', '2023-06-28 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (828, '高志标(每天)', '工程部门巡更', NULL, NULL, '3', '2023-06-28 08:30:00', '2023-06-28 18:00:00', NULL, NULL, 'admin', '2023-06-28 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (829, '程建林(每天)', '工程部门巡更', NULL, NULL, '3', '2023-06-28 17:30:00', '2023-06-29 08:30:00', NULL, NULL, 'admin', '2023-06-28 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (830, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '3', '2023-06-28 08:30:00', '2023-06-28 18:30:00', NULL, NULL, 'admin', '2023-06-28 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (831, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '3', '2023-06-28 17:30:00', '2023-06-29 08:30:00', NULL, NULL, 'admin', '2023-06-28 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (832, '陈德胜(每天)', '工程部门巡更', NULL, NULL, '0', '2023-06-29 17:30:00', '2023-06-30 08:30:00', NULL, NULL, 'admin', '2023-06-29 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (833, '高志标(每天)', '工程部门巡更', NULL, NULL, '3', '2023-06-29 08:30:00', '2023-06-29 18:00:00', NULL, NULL, 'admin', '2023-06-29 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (834, '刘宝军(每天)', '工程部门巡更', NULL, NULL, '0', '2023-06-29 17:30:00', '2023-06-30 08:30:00', NULL, NULL, 'admin', '2023-06-29 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (835, '程建林(每天)', '工程部门巡更', NULL, NULL, '0', '2023-06-29 17:30:00', '2023-06-30 08:30:00', NULL, NULL, 'admin', '2023-06-29 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (836, '陈小龙(每天一次)', '中控室人员巡更', NULL, NULL, '3', '2023-06-29 08:30:00', '2023-06-29 18:30:00', NULL, NULL, 'admin', '2023-06-29 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (837, '袁树(每天一次)', '保安部门巡更', NULL, NULL, '3', '2023-06-29 00:00:00', '2023-06-29 08:30:00', NULL, NULL, 'admin', '2023-06-29 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (838, '祁守华(每天一次)', '保安部门巡更', NULL, NULL, '3', '2023-06-29 08:30:00', '2023-06-29 18:30:00', NULL, NULL, 'admin', '2023-06-29 01:00:00', '', NULL, '0', NULL, NULL, 1);
INSERT INTO `sys_patrol` VALUES (839, '王启洪(每天一次)', '保安部门巡更', NULL, NULL, '0', '2023-06-29 08:00:00', '2023-06-30 00:00:00', NULL, NULL, 'admin', '2023-06-29 01:00:00', '', NULL, '0', NULL, NULL, 1);

-- ----------------------------
-- Table structure for sys_patrol_order
-- ----------------------------
DROP TABLE IF EXISTS `sys_patrol_order`;
CREATE TABLE `sys_patrol_order`  (
  `patrol_order_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '巡更工单编号',
  `patrol_point_id` bigint(20) NULL DEFAULT NULL COMMENT '巡更点编号',
  `patrol_point_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '巡更点名称',
  `patrol_id` bigint(20) NULL DEFAULT NULL COMMENT '巡更任务编号',
  `patrol_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '巡更任务名称',
  `personnel_id` bigint(20) NULL DEFAULT NULL COMMENT '巡更人编号',
  `personnel_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '巡更人姓名',
  `patrol_result` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '巡更结果',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `region_id` bigint(20) NULL DEFAULT NULL COMMENT '区域id',
  PRIMARY KEY (`patrol_order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_patrol_order
-- ----------------------------
INSERT INTO `sys_patrol_order` VALUES (9, 92, NULL, 747, NULL, 19, NULL, NULL, NULL, '', '2023-06-14 01:17:12', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (10, 83, NULL, 747, NULL, 19, NULL, NULL, NULL, '', '2023-06-14 01:17:56', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (11, 79, NULL, 747, NULL, 19, NULL, NULL, NULL, '', '2023-06-14 01:18:03', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (12, 81, NULL, 747, NULL, 19, NULL, NULL, NULL, '', '2023-06-14 01:18:09', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (13, 82, NULL, 747, NULL, 19, NULL, NULL, NULL, '', '2023-06-14 01:18:15', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (14, 87, NULL, 747, NULL, 19, NULL, NULL, NULL, '', '2023-06-14 01:18:22', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (15, 104, NULL, 747, NULL, 19, NULL, NULL, NULL, '', '2023-06-14 01:18:29', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (16, 97, NULL, 747, NULL, 19, NULL, NULL, NULL, '', '2023-06-14 01:18:41', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (17, 103, NULL, 747, NULL, 19, NULL, NULL, NULL, '', '2023-06-14 01:18:49', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (18, 106, NULL, 747, NULL, 19, NULL, NULL, NULL, '', '2023-06-14 01:18:55', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (19, 101, NULL, 747, NULL, 19, NULL, NULL, NULL, '', '2023-06-14 01:19:02', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (20, 78, NULL, 747, NULL, 19, NULL, NULL, NULL, '', '2023-06-14 01:19:09', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (21, 99, NULL, 747, NULL, 19, NULL, NULL, NULL, '', '2023-06-14 01:19:20', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (22, 98, NULL, 747, NULL, 19, NULL, NULL, NULL, '', '2023-06-14 01:19:27', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (23, 96, NULL, 747, NULL, 19, NULL, NULL, NULL, '', '2023-06-14 01:19:35', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (24, 95, NULL, 747, NULL, 19, NULL, NULL, NULL, '', '2023-06-14 01:19:43', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (25, 88, NULL, 747, NULL, 19, NULL, NULL, NULL, '', '2023-06-14 01:19:52', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (26, 102, NULL, 747, NULL, 19, NULL, NULL, NULL, '', '2023-06-14 01:20:03', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (27, 89, NULL, 747, NULL, 19, NULL, NULL, NULL, '', '2023-06-14 02:15:21', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (28, 90, NULL, 747, NULL, 19, NULL, NULL, NULL, '', '2023-06-14 02:16:49', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (29, 79, NULL, 752, NULL, 17, NULL, NULL, NULL, '', '2023-06-14 09:03:49', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (30, 81, NULL, 752, NULL, 17, NULL, NULL, NULL, '', '2023-06-14 09:03:56', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (31, 82, NULL, 752, NULL, 17, NULL, NULL, NULL, '', '2023-06-14 09:04:06', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (32, 83, NULL, 752, NULL, 17, NULL, NULL, NULL, '', '2023-06-14 09:04:12', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (33, 95, NULL, 752, NULL, 17, NULL, NULL, NULL, '', '2023-06-14 09:04:25', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (34, 96, NULL, 752, NULL, 17, NULL, NULL, NULL, '', '2023-06-14 09:04:33', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (35, 97, NULL, 752, NULL, 17, NULL, NULL, NULL, '', '2023-06-14 09:04:44', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (36, 103, NULL, 752, NULL, 17, NULL, NULL, NULL, '', '2023-06-14 09:04:56', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (37, 78, NULL, 752, NULL, 17, NULL, NULL, NULL, '', '2023-06-14 09:05:18', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (38, 92, NULL, 752, NULL, 17, NULL, NULL, NULL, '', '2023-06-14 09:05:39', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (39, 104, NULL, 752, NULL, 17, NULL, NULL, NULL, '', '2023-06-14 10:37:40', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (40, 106, NULL, 752, NULL, 17, NULL, NULL, NULL, '', '2023-06-14 10:39:15', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (41, 99, NULL, 752, NULL, 17, NULL, NULL, NULL, '', '2023-06-14 10:40:32', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (42, 98, NULL, 752, NULL, 17, NULL, NULL, NULL, '', '2023-06-14 10:41:16', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (43, 101, NULL, 752, NULL, 17, NULL, NULL, NULL, '', '2023-06-14 10:42:54', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (44, 87, NULL, 752, NULL, 17, NULL, NULL, NULL, '', '2023-06-14 10:44:38', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (45, 88, NULL, 752, NULL, 17, NULL, NULL, NULL, '', '2023-06-14 10:46:25', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (46, 90, NULL, 752, NULL, 17, NULL, NULL, NULL, '', '2023-06-14 10:47:42', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (47, 102, NULL, 752, NULL, 17, NULL, NULL, NULL, '', '2023-06-14 10:48:59', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (48, 89, NULL, 752, NULL, 17, NULL, NULL, NULL, '', '2023-06-14 10:53:24', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (49, 89, NULL, 748, NULL, 18, NULL, NULL, NULL, '', '2023-06-14 17:47:31', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (50, 90, NULL, 748, NULL, 18, NULL, NULL, NULL, '', '2023-06-14 17:49:33', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (51, 88, NULL, 748, NULL, 18, NULL, NULL, NULL, '', '2023-06-14 17:51:34', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (52, 70, NULL, 749, NULL, 8, NULL, NULL, NULL, '', '2023-06-14 18:20:32', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (53, 53, NULL, 749, NULL, 8, NULL, NULL, NULL, '', '2023-06-14 18:23:58', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (54, 51, NULL, 749, NULL, 8, NULL, NULL, NULL, '', '2023-06-14 18:29:08', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (55, 57, NULL, 749, NULL, 8, NULL, NULL, NULL, '', '2023-06-14 18:42:20', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (56, 56, NULL, 749, NULL, 8, NULL, NULL, NULL, '', '2023-06-14 18:43:03', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (57, 69, NULL, 749, NULL, 8, NULL, NULL, NULL, '', '2023-06-14 18:52:44', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (58, 65, NULL, 749, NULL, 8, NULL, NULL, NULL, '', '2023-06-14 19:02:59', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (59, 54, NULL, 749, NULL, 8, NULL, NULL, NULL, '', '2023-06-14 19:03:08', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (60, 67, NULL, 749, NULL, 8, NULL, NULL, NULL, '', '2023-06-14 19:04:01', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (61, 66, NULL, 749, NULL, 8, NULL, NULL, NULL, '', '2023-06-14 19:11:44', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (62, 64, NULL, 749, NULL, 8, NULL, NULL, NULL, '', '2023-06-14 19:13:01', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (63, 68, NULL, 749, NULL, 8, NULL, NULL, NULL, '', '2023-06-14 19:13:26', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (64, 63, NULL, 749, NULL, 8, NULL, NULL, NULL, '', '2023-06-14 19:18:08', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (65, 62, NULL, 749, NULL, 8, NULL, NULL, NULL, '', '2023-06-14 19:19:00', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (66, 61, NULL, 749, NULL, 8, NULL, NULL, NULL, '', '2023-06-14 19:31:20', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (67, 60, NULL, 749, NULL, 8, NULL, NULL, NULL, '', '2023-06-14 19:31:58', '', NULL, 1);
INSERT INTO `sys_patrol_order` VALUES (68, 59, NULL, 749, NULL, 8, NULL, NULL, NULL, '', '2023-06-14 19:42:06', '', NULL, 1);

-- ----------------------------
-- Table structure for sys_patrol_order_img
-- ----------------------------
DROP TABLE IF EXISTS `sys_patrol_order_img`;
CREATE TABLE `sys_patrol_order_img`  (
  `img_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '图片编号',
  `patrol_order_id` bigint(20) NOT NULL COMMENT '巡更工单编号',
  `img_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片地址',
  PRIMARY KEY (`img_id`, `patrol_order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_patrol_order_img
-- ----------------------------

-- ----------------------------
-- Table structure for sys_patrol_patrol_point
-- ----------------------------
DROP TABLE IF EXISTS `sys_patrol_patrol_point`;
CREATE TABLE `sys_patrol_patrol_point`  (
  `patrol_id` bigint(20) NOT NULL COMMENT '巡更任务编号',
  `patrol_point_id` bigint(20) NOT NULL COMMENT '巡更点编号',
  PRIMARY KEY (`patrol_id`, `patrol_point_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_patrol_patrol_point
-- ----------------------------
INSERT INTO `sys_patrol_patrol_point` VALUES (282, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (282, 107);
INSERT INTO `sys_patrol_patrol_point` VALUES (296, 2);
INSERT INTO `sys_patrol_patrol_point` VALUES (296, 3);
INSERT INTO `sys_patrol_patrol_point` VALUES (296, 4);
INSERT INTO `sys_patrol_patrol_point` VALUES (296, 5);
INSERT INTO `sys_patrol_patrol_point` VALUES (296, 16);
INSERT INTO `sys_patrol_patrol_point` VALUES (296, 17);
INSERT INTO `sys_patrol_patrol_point` VALUES (297, 6);
INSERT INTO `sys_patrol_patrol_point` VALUES (297, 7);
INSERT INTO `sys_patrol_patrol_point` VALUES (297, 8);
INSERT INTO `sys_patrol_patrol_point` VALUES (297, 12);
INSERT INTO `sys_patrol_patrol_point` VALUES (297, 13);
INSERT INTO `sys_patrol_patrol_point` VALUES (297, 14);
INSERT INTO `sys_patrol_patrol_point` VALUES (297, 15);
INSERT INTO `sys_patrol_patrol_point` VALUES (298, 2);
INSERT INTO `sys_patrol_patrol_point` VALUES (298, 3);
INSERT INTO `sys_patrol_patrol_point` VALUES (298, 4);
INSERT INTO `sys_patrol_patrol_point` VALUES (298, 5);
INSERT INTO `sys_patrol_patrol_point` VALUES (298, 16);
INSERT INTO `sys_patrol_patrol_point` VALUES (298, 17);
INSERT INTO `sys_patrol_patrol_point` VALUES (299, 6);
INSERT INTO `sys_patrol_patrol_point` VALUES (299, 7);
INSERT INTO `sys_patrol_patrol_point` VALUES (299, 8);
INSERT INTO `sys_patrol_patrol_point` VALUES (299, 12);
INSERT INTO `sys_patrol_patrol_point` VALUES (299, 13);
INSERT INTO `sys_patrol_patrol_point` VALUES (299, 14);
INSERT INTO `sys_patrol_patrol_point` VALUES (300, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (300, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (300, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (300, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (300, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (300, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (300, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (300, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (300, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (300, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (300, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (300, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (300, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (300, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (300, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (300, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (300, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (301, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (301, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (301, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (301, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (301, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (301, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (301, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (301, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (301, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (301, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (301, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (301, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (301, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (301, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (301, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (301, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (301, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (302, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (302, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (302, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (302, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (302, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (302, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (302, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (302, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (302, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (302, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (302, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (302, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (302, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (302, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (302, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (302, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (302, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (303, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (303, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (303, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (303, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (303, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (303, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (303, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (303, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (303, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (303, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (303, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (303, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (303, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (303, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (303, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (303, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (303, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (304, 33);
INSERT INTO `sys_patrol_patrol_point` VALUES (304, 34);
INSERT INTO `sys_patrol_patrol_point` VALUES (304, 35);
INSERT INTO `sys_patrol_patrol_point` VALUES (304, 37);
INSERT INTO `sys_patrol_patrol_point` VALUES (304, 38);
INSERT INTO `sys_patrol_patrol_point` VALUES (304, 39);
INSERT INTO `sys_patrol_patrol_point` VALUES (304, 40);
INSERT INTO `sys_patrol_patrol_point` VALUES (304, 41);
INSERT INTO `sys_patrol_patrol_point` VALUES (304, 42);
INSERT INTO `sys_patrol_patrol_point` VALUES (304, 43);
INSERT INTO `sys_patrol_patrol_point` VALUES (304, 44);
INSERT INTO `sys_patrol_patrol_point` VALUES (304, 45);
INSERT INTO `sys_patrol_patrol_point` VALUES (305, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (305, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (305, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (305, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (305, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (305, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (305, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (305, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (305, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (305, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (305, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (305, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (305, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (305, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (305, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (305, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (305, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (305, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (305, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (305, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (306, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (306, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (306, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (306, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (306, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (306, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (306, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (306, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (306, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (306, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (306, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (306, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (306, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (306, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (306, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (306, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (306, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (306, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (306, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (306, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (307, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (307, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (307, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (307, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (307, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (307, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (307, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (307, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (307, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (307, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (307, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (307, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (307, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (307, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (307, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (307, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (307, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (307, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (307, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (307, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (308, 84);
INSERT INTO `sys_patrol_patrol_point` VALUES (308, 85);
INSERT INTO `sys_patrol_patrol_point` VALUES (308, 86);
INSERT INTO `sys_patrol_patrol_point` VALUES (308, 91);
INSERT INTO `sys_patrol_patrol_point` VALUES (308, 93);
INSERT INTO `sys_patrol_patrol_point` VALUES (308, 100);
INSERT INTO `sys_patrol_patrol_point` VALUES (308, 105);
INSERT INTO `sys_patrol_patrol_point` VALUES (322, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (322, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (322, 105);
INSERT INTO `sys_patrol_patrol_point` VALUES (322, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (329, 46);
INSERT INTO `sys_patrol_patrol_point` VALUES (329, 47);
INSERT INTO `sys_patrol_patrol_point` VALUES (329, 48);
INSERT INTO `sys_patrol_patrol_point` VALUES (329, 49);
INSERT INTO `sys_patrol_patrol_point` VALUES (329, 50);
INSERT INTO `sys_patrol_patrol_point` VALUES (329, 52);
INSERT INTO `sys_patrol_patrol_point` VALUES (329, 55);
INSERT INTO `sys_patrol_patrol_point` VALUES (329, 71);
INSERT INTO `sys_patrol_patrol_point` VALUES (329, 73);
INSERT INTO `sys_patrol_patrol_point` VALUES (329, 75);
INSERT INTO `sys_patrol_patrol_point` VALUES (329, 76);
INSERT INTO `sys_patrol_patrol_point` VALUES (329, 112);
INSERT INTO `sys_patrol_patrol_point` VALUES (379, 58);
INSERT INTO `sys_patrol_patrol_point` VALUES (380, 2);
INSERT INTO `sys_patrol_patrol_point` VALUES (380, 3);
INSERT INTO `sys_patrol_patrol_point` VALUES (380, 4);
INSERT INTO `sys_patrol_patrol_point` VALUES (380, 5);
INSERT INTO `sys_patrol_patrol_point` VALUES (380, 16);
INSERT INTO `sys_patrol_patrol_point` VALUES (380, 17);
INSERT INTO `sys_patrol_patrol_point` VALUES (381, 6);
INSERT INTO `sys_patrol_patrol_point` VALUES (381, 7);
INSERT INTO `sys_patrol_patrol_point` VALUES (381, 8);
INSERT INTO `sys_patrol_patrol_point` VALUES (381, 12);
INSERT INTO `sys_patrol_patrol_point` VALUES (381, 13);
INSERT INTO `sys_patrol_patrol_point` VALUES (381, 14);
INSERT INTO `sys_patrol_patrol_point` VALUES (381, 15);
INSERT INTO `sys_patrol_patrol_point` VALUES (382, 2);
INSERT INTO `sys_patrol_patrol_point` VALUES (382, 3);
INSERT INTO `sys_patrol_patrol_point` VALUES (382, 4);
INSERT INTO `sys_patrol_patrol_point` VALUES (382, 5);
INSERT INTO `sys_patrol_patrol_point` VALUES (382, 16);
INSERT INTO `sys_patrol_patrol_point` VALUES (382, 17);
INSERT INTO `sys_patrol_patrol_point` VALUES (383, 6);
INSERT INTO `sys_patrol_patrol_point` VALUES (383, 7);
INSERT INTO `sys_patrol_patrol_point` VALUES (383, 8);
INSERT INTO `sys_patrol_patrol_point` VALUES (383, 12);
INSERT INTO `sys_patrol_patrol_point` VALUES (383, 13);
INSERT INTO `sys_patrol_patrol_point` VALUES (383, 14);
INSERT INTO `sys_patrol_patrol_point` VALUES (384, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (384, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (384, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (384, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (384, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (384, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (384, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (384, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (384, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (384, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (384, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (384, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (384, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (384, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (384, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (384, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (384, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (385, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (385, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (385, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (385, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (385, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (385, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (385, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (385, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (385, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (385, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (385, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (385, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (385, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (385, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (385, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (385, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (385, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (386, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (386, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (386, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (386, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (386, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (386, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (386, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (386, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (386, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (386, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (386, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (386, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (386, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (386, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (386, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (386, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (386, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (387, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (387, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (387, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (387, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (387, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (387, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (387, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (387, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (387, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (387, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (387, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (387, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (387, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (387, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (387, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (387, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (387, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (388, 33);
INSERT INTO `sys_patrol_patrol_point` VALUES (388, 34);
INSERT INTO `sys_patrol_patrol_point` VALUES (388, 35);
INSERT INTO `sys_patrol_patrol_point` VALUES (388, 37);
INSERT INTO `sys_patrol_patrol_point` VALUES (388, 38);
INSERT INTO `sys_patrol_patrol_point` VALUES (388, 39);
INSERT INTO `sys_patrol_patrol_point` VALUES (388, 40);
INSERT INTO `sys_patrol_patrol_point` VALUES (388, 41);
INSERT INTO `sys_patrol_patrol_point` VALUES (388, 42);
INSERT INTO `sys_patrol_patrol_point` VALUES (388, 43);
INSERT INTO `sys_patrol_patrol_point` VALUES (388, 44);
INSERT INTO `sys_patrol_patrol_point` VALUES (388, 45);
INSERT INTO `sys_patrol_patrol_point` VALUES (389, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (389, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (389, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (389, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (389, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (389, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (389, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (389, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (389, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (389, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (389, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (389, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (389, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (389, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (389, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (389, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (389, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (389, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (389, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (389, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (390, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (390, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (390, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (390, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (390, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (390, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (390, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (390, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (390, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (390, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (390, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (390, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (390, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (390, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (390, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (390, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (390, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (390, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (390, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (390, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (391, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (391, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (391, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (391, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (391, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (391, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (391, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (391, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (391, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (391, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (391, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (391, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (391, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (391, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (391, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (391, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (391, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (391, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (391, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (391, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (392, 84);
INSERT INTO `sys_patrol_patrol_point` VALUES (392, 85);
INSERT INTO `sys_patrol_patrol_point` VALUES (392, 86);
INSERT INTO `sys_patrol_patrol_point` VALUES (392, 91);
INSERT INTO `sys_patrol_patrol_point` VALUES (392, 93);
INSERT INTO `sys_patrol_patrol_point` VALUES (392, 100);
INSERT INTO `sys_patrol_patrol_point` VALUES (392, 105);
INSERT INTO `sys_patrol_patrol_point` VALUES (393, 46);
INSERT INTO `sys_patrol_patrol_point` VALUES (393, 47);
INSERT INTO `sys_patrol_patrol_point` VALUES (393, 48);
INSERT INTO `sys_patrol_patrol_point` VALUES (393, 49);
INSERT INTO `sys_patrol_patrol_point` VALUES (393, 50);
INSERT INTO `sys_patrol_patrol_point` VALUES (393, 52);
INSERT INTO `sys_patrol_patrol_point` VALUES (393, 55);
INSERT INTO `sys_patrol_patrol_point` VALUES (393, 71);
INSERT INTO `sys_patrol_patrol_point` VALUES (393, 73);
INSERT INTO `sys_patrol_patrol_point` VALUES (393, 75);
INSERT INTO `sys_patrol_patrol_point` VALUES (393, 76);
INSERT INTO `sys_patrol_patrol_point` VALUES (394, 58);
INSERT INTO `sys_patrol_patrol_point` VALUES (400, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (400, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (400, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (400, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (400, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (400, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (400, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (400, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (400, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (400, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (400, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (400, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (400, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (400, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (400, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (400, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (400, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (401, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (401, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (401, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (401, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (401, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (401, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (401, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (401, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (401, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (401, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (401, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (401, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (401, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (401, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (401, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (401, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (401, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (402, 84);
INSERT INTO `sys_patrol_patrol_point` VALUES (402, 85);
INSERT INTO `sys_patrol_patrol_point` VALUES (402, 86);
INSERT INTO `sys_patrol_patrol_point` VALUES (402, 91);
INSERT INTO `sys_patrol_patrol_point` VALUES (402, 93);
INSERT INTO `sys_patrol_patrol_point` VALUES (402, 100);
INSERT INTO `sys_patrol_patrol_point` VALUES (402, 105);
INSERT INTO `sys_patrol_patrol_point` VALUES (403, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (403, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (403, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (403, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (403, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (403, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (403, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (403, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (403, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (403, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (403, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (403, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (403, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (403, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (403, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (403, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (403, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (403, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (403, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (403, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (405, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (405, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (405, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (405, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (405, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (405, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (405, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (405, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (405, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (405, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (405, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (405, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (405, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (405, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (405, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (405, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (405, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (405, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (405, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (405, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (406, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (406, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (406, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (406, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (406, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (406, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (406, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (406, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (406, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (406, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (406, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (406, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (406, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (406, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (406, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (406, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (406, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (407, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (407, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (407, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (407, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (407, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (407, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (407, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (407, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (407, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (407, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (407, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (407, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (407, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (407, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (407, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (407, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (407, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (414, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (414, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (414, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (414, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (414, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (414, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (414, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (414, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (414, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (414, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (414, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (414, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (414, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (414, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (414, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (414, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (414, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (414, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (414, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (414, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (415, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (415, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (415, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (415, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (415, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (415, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (415, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (415, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (415, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (415, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (415, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (415, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (415, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (415, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (415, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (415, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (415, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (419, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (419, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (419, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (419, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (419, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (419, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (419, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (419, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (419, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (419, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (419, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (419, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (419, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (419, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (419, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (419, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (419, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (419, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (419, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (419, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (424, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (424, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (424, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (424, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (424, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (424, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (424, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (424, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (424, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (424, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (424, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (424, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (424, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (424, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (424, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (424, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (424, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (425, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (425, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (425, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (425, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (425, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (425, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (425, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (425, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (425, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (425, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (425, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (425, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (425, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (425, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (425, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (425, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (425, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (426, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (426, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (426, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (426, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (426, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (426, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (426, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (426, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (426, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (426, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (426, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (426, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (426, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (426, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (426, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (426, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (426, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (428, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (428, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (428, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (428, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (428, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (428, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (428, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (428, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (428, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (428, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (428, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (428, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (428, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (428, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (428, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (428, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (428, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (429, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (429, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (429, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (429, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (429, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (429, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (429, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (429, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (429, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (429, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (429, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (429, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (429, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (429, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (429, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (429, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (429, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (429, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (429, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (429, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (431, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (431, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (431, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (431, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (431, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (431, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (431, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (431, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (431, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (431, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (431, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (431, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (431, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (431, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (431, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (431, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (431, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (431, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (431, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (431, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (432, 84);
INSERT INTO `sys_patrol_patrol_point` VALUES (432, 85);
INSERT INTO `sys_patrol_patrol_point` VALUES (432, 86);
INSERT INTO `sys_patrol_patrol_point` VALUES (432, 91);
INSERT INTO `sys_patrol_patrol_point` VALUES (432, 93);
INSERT INTO `sys_patrol_patrol_point` VALUES (432, 100);
INSERT INTO `sys_patrol_patrol_point` VALUES (432, 105);
INSERT INTO `sys_patrol_patrol_point` VALUES (439, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (439, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (439, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (439, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (439, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (439, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (439, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (439, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (439, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (439, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (439, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (439, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (439, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (439, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (439, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (439, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (439, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (439, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (439, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (439, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (442, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (442, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (442, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (442, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (442, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (442, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (442, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (442, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (442, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (442, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (442, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (442, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (442, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (442, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (442, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (442, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (442, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (447, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (447, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (447, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (447, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (447, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (447, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (447, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (447, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (447, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (447, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (447, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (447, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (447, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (447, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (447, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (447, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (447, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (447, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (447, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (447, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (448, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (448, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (448, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (448, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (448, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (448, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (448, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (448, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (448, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (448, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (448, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (448, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (448, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (448, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (448, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (448, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (448, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (448, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (448, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (448, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (449, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (449, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (449, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (449, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (449, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (449, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (449, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (449, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (449, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (449, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (449, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (449, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (449, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (449, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (449, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (449, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (449, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (450, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (450, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (450, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (450, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (450, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (450, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (450, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (450, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (450, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (450, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (450, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (450, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (450, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (450, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (450, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (450, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (450, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (451, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (451, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (451, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (451, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (451, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (451, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (451, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (451, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (451, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (451, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (451, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (451, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (451, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (451, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (451, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (451, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (451, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (452, 84);
INSERT INTO `sys_patrol_patrol_point` VALUES (452, 85);
INSERT INTO `sys_patrol_patrol_point` VALUES (452, 86);
INSERT INTO `sys_patrol_patrol_point` VALUES (452, 91);
INSERT INTO `sys_patrol_patrol_point` VALUES (452, 93);
INSERT INTO `sys_patrol_patrol_point` VALUES (452, 100);
INSERT INTO `sys_patrol_patrol_point` VALUES (452, 105);
INSERT INTO `sys_patrol_patrol_point` VALUES (453, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (453, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (453, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (453, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (453, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (453, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (453, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (453, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (453, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (453, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (453, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (453, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (453, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (453, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (453, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (453, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (453, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (454, 6);
INSERT INTO `sys_patrol_patrol_point` VALUES (454, 7);
INSERT INTO `sys_patrol_patrol_point` VALUES (454, 8);
INSERT INTO `sys_patrol_patrol_point` VALUES (454, 12);
INSERT INTO `sys_patrol_patrol_point` VALUES (454, 13);
INSERT INTO `sys_patrol_patrol_point` VALUES (454, 14);
INSERT INTO `sys_patrol_patrol_point` VALUES (455, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (455, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (455, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (455, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (455, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (455, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (455, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (455, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (455, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (455, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (455, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (455, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (455, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (455, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (455, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (455, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (455, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (456, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (456, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (456, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (456, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (456, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (456, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (456, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (456, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (456, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (456, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (456, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (456, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (456, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (456, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (456, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (456, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (456, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (456, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (456, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (456, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (457, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (457, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (457, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (457, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (457, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (457, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (457, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (457, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (457, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (457, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (457, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (457, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (457, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (457, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (457, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (457, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (457, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (458, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (458, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (458, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (458, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (458, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (458, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (458, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (458, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (458, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (458, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (458, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (458, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (458, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (458, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (458, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (458, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (458, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (459, 6);
INSERT INTO `sys_patrol_patrol_point` VALUES (459, 7);
INSERT INTO `sys_patrol_patrol_point` VALUES (459, 8);
INSERT INTO `sys_patrol_patrol_point` VALUES (459, 12);
INSERT INTO `sys_patrol_patrol_point` VALUES (459, 13);
INSERT INTO `sys_patrol_patrol_point` VALUES (459, 14);
INSERT INTO `sys_patrol_patrol_point` VALUES (459, 15);
INSERT INTO `sys_patrol_patrol_point` VALUES (460, 2);
INSERT INTO `sys_patrol_patrol_point` VALUES (460, 3);
INSERT INTO `sys_patrol_patrol_point` VALUES (460, 4);
INSERT INTO `sys_patrol_patrol_point` VALUES (460, 5);
INSERT INTO `sys_patrol_patrol_point` VALUES (460, 16);
INSERT INTO `sys_patrol_patrol_point` VALUES (460, 17);
INSERT INTO `sys_patrol_patrol_point` VALUES (461, 2);
INSERT INTO `sys_patrol_patrol_point` VALUES (461, 3);
INSERT INTO `sys_patrol_patrol_point` VALUES (461, 4);
INSERT INTO `sys_patrol_patrol_point` VALUES (461, 5);
INSERT INTO `sys_patrol_patrol_point` VALUES (461, 16);
INSERT INTO `sys_patrol_patrol_point` VALUES (461, 17);
INSERT INTO `sys_patrol_patrol_point` VALUES (462, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (462, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (462, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (462, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (462, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (462, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (462, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (462, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (462, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (462, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (462, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (462, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (462, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (462, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (462, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (462, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (462, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (462, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (462, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (462, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (463, 58);
INSERT INTO `sys_patrol_patrol_point` VALUES (464, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (464, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (464, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (464, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (464, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (464, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (464, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (464, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (464, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (464, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (464, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (464, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (464, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (464, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (464, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (464, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (464, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (464, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (464, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (464, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (465, 84);
INSERT INTO `sys_patrol_patrol_point` VALUES (465, 85);
INSERT INTO `sys_patrol_patrol_point` VALUES (465, 86);
INSERT INTO `sys_patrol_patrol_point` VALUES (465, 91);
INSERT INTO `sys_patrol_patrol_point` VALUES (465, 93);
INSERT INTO `sys_patrol_patrol_point` VALUES (465, 100);
INSERT INTO `sys_patrol_patrol_point` VALUES (465, 105);
INSERT INTO `sys_patrol_patrol_point` VALUES (476, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (476, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (476, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (476, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (476, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (476, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (476, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (476, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (476, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (476, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (476, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (476, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (476, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (476, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (476, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (476, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (476, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (476, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (476, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (476, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (478, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (478, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (478, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (478, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (478, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (478, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (478, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (478, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (478, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (478, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (478, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (478, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (478, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (478, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (478, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (478, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (478, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (479, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (479, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (479, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (479, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (747, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (747, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (747, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (747, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (747, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (747, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (747, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (747, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (747, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (747, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (747, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (747, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (747, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (747, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (747, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (747, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (747, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (747, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (747, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (747, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (748, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (748, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (748, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (748, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (748, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (748, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (748, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (748, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (748, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (748, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (748, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (748, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (748, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (748, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (748, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (748, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (748, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (748, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (748, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (748, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (749, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (749, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (749, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (749, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (749, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (749, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (749, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (749, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (749, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (749, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (749, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (749, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (749, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (749, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (749, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (749, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (749, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (750, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (750, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (750, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (750, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (750, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (750, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (750, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (750, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (750, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (750, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (750, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (750, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (750, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (750, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (750, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (750, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (750, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (751, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (751, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (751, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (751, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (751, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (751, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (751, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (751, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (751, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (751, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (751, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (751, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (751, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (751, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (751, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (751, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (751, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (752, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (752, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (752, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (752, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (752, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (752, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (752, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (752, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (752, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (752, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (752, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (752, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (752, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (752, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (752, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (752, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (752, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (752, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (752, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (752, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (753, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (753, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (753, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (753, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (753, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (753, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (753, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (753, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (753, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (753, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (753, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (753, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (753, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (753, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (753, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (753, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (753, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (756, 84);
INSERT INTO `sys_patrol_patrol_point` VALUES (756, 85);
INSERT INTO `sys_patrol_patrol_point` VALUES (756, 86);
INSERT INTO `sys_patrol_patrol_point` VALUES (756, 91);
INSERT INTO `sys_patrol_patrol_point` VALUES (756, 93);
INSERT INTO `sys_patrol_patrol_point` VALUES (756, 100);
INSERT INTO `sys_patrol_patrol_point` VALUES (756, 105);
INSERT INTO `sys_patrol_patrol_point` VALUES (764, 2);
INSERT INTO `sys_patrol_patrol_point` VALUES (764, 3);
INSERT INTO `sys_patrol_patrol_point` VALUES (764, 4);
INSERT INTO `sys_patrol_patrol_point` VALUES (764, 5);
INSERT INTO `sys_patrol_patrol_point` VALUES (764, 16);
INSERT INTO `sys_patrol_patrol_point` VALUES (764, 17);
INSERT INTO `sys_patrol_patrol_point` VALUES (765, 6);
INSERT INTO `sys_patrol_patrol_point` VALUES (765, 7);
INSERT INTO `sys_patrol_patrol_point` VALUES (765, 8);
INSERT INTO `sys_patrol_patrol_point` VALUES (765, 12);
INSERT INTO `sys_patrol_patrol_point` VALUES (765, 13);
INSERT INTO `sys_patrol_patrol_point` VALUES (765, 14);
INSERT INTO `sys_patrol_patrol_point` VALUES (765, 15);
INSERT INTO `sys_patrol_patrol_point` VALUES (766, 2);
INSERT INTO `sys_patrol_patrol_point` VALUES (766, 3);
INSERT INTO `sys_patrol_patrol_point` VALUES (766, 4);
INSERT INTO `sys_patrol_patrol_point` VALUES (766, 5);
INSERT INTO `sys_patrol_patrol_point` VALUES (766, 16);
INSERT INTO `sys_patrol_patrol_point` VALUES (766, 17);
INSERT INTO `sys_patrol_patrol_point` VALUES (767, 6);
INSERT INTO `sys_patrol_patrol_point` VALUES (767, 7);
INSERT INTO `sys_patrol_patrol_point` VALUES (767, 8);
INSERT INTO `sys_patrol_patrol_point` VALUES (767, 12);
INSERT INTO `sys_patrol_patrol_point` VALUES (767, 13);
INSERT INTO `sys_patrol_patrol_point` VALUES (767, 14);
INSERT INTO `sys_patrol_patrol_point` VALUES (768, 33);
INSERT INTO `sys_patrol_patrol_point` VALUES (768, 34);
INSERT INTO `sys_patrol_patrol_point` VALUES (768, 35);
INSERT INTO `sys_patrol_patrol_point` VALUES (768, 37);
INSERT INTO `sys_patrol_patrol_point` VALUES (768, 38);
INSERT INTO `sys_patrol_patrol_point` VALUES (768, 39);
INSERT INTO `sys_patrol_patrol_point` VALUES (768, 40);
INSERT INTO `sys_patrol_patrol_point` VALUES (768, 41);
INSERT INTO `sys_patrol_patrol_point` VALUES (768, 42);
INSERT INTO `sys_patrol_patrol_point` VALUES (768, 43);
INSERT INTO `sys_patrol_patrol_point` VALUES (768, 44);
INSERT INTO `sys_patrol_patrol_point` VALUES (768, 45);
INSERT INTO `sys_patrol_patrol_point` VALUES (769, 46);
INSERT INTO `sys_patrol_patrol_point` VALUES (769, 47);
INSERT INTO `sys_patrol_patrol_point` VALUES (769, 48);
INSERT INTO `sys_patrol_patrol_point` VALUES (769, 49);
INSERT INTO `sys_patrol_patrol_point` VALUES (769, 50);
INSERT INTO `sys_patrol_patrol_point` VALUES (769, 52);
INSERT INTO `sys_patrol_patrol_point` VALUES (769, 55);
INSERT INTO `sys_patrol_patrol_point` VALUES (769, 71);
INSERT INTO `sys_patrol_patrol_point` VALUES (769, 73);
INSERT INTO `sys_patrol_patrol_point` VALUES (769, 75);
INSERT INTO `sys_patrol_patrol_point` VALUES (769, 76);
INSERT INTO `sys_patrol_patrol_point` VALUES (769, 112);
INSERT INTO `sys_patrol_patrol_point` VALUES (770, 58);
INSERT INTO `sys_patrol_patrol_point` VALUES (771, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (771, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (771, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (771, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (771, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (771, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (771, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (771, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (771, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (771, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (771, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (771, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (771, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (771, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (771, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (771, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (771, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (772, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (772, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (772, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (772, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (772, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (772, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (772, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (772, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (772, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (772, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (772, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (772, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (772, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (772, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (772, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (772, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (772, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (772, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (772, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (772, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (773, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (773, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (773, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (773, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (773, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (773, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (773, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (773, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (773, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (773, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (773, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (773, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (773, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (773, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (773, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (773, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (773, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (773, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (773, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (773, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (774, 84);
INSERT INTO `sys_patrol_patrol_point` VALUES (774, 85);
INSERT INTO `sys_patrol_patrol_point` VALUES (774, 86);
INSERT INTO `sys_patrol_patrol_point` VALUES (774, 91);
INSERT INTO `sys_patrol_patrol_point` VALUES (774, 93);
INSERT INTO `sys_patrol_patrol_point` VALUES (774, 100);
INSERT INTO `sys_patrol_patrol_point` VALUES (774, 105);
INSERT INTO `sys_patrol_patrol_point` VALUES (775, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (775, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (775, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (775, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (775, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (775, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (775, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (775, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (775, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (775, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (775, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (775, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (775, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (775, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (775, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (775, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (775, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (775, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (775, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (775, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (776, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (776, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (776, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (776, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (776, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (776, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (776, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (776, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (776, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (776, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (776, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (776, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (776, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (776, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (776, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (776, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (776, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (777, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (777, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (777, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (777, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (777, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (777, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (777, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (777, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (777, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (777, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (777, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (777, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (777, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (777, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (777, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (777, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (777, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (778, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (778, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (778, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (778, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (778, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (778, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (778, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (778, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (778, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (778, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (778, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (778, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (778, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (778, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (778, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (778, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (778, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (779, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (779, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (779, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (779, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (779, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (779, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (779, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (779, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (779, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (779, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (779, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (779, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (779, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (779, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (779, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (779, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (779, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (780, 84);
INSERT INTO `sys_patrol_patrol_point` VALUES (780, 85);
INSERT INTO `sys_patrol_patrol_point` VALUES (780, 86);
INSERT INTO `sys_patrol_patrol_point` VALUES (780, 91);
INSERT INTO `sys_patrol_patrol_point` VALUES (780, 93);
INSERT INTO `sys_patrol_patrol_point` VALUES (780, 100);
INSERT INTO `sys_patrol_patrol_point` VALUES (780, 105);
INSERT INTO `sys_patrol_patrol_point` VALUES (781, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (781, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (781, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (781, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (781, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (781, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (781, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (781, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (781, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (781, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (781, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (781, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (781, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (781, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (781, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (781, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (781, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (782, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (782, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (782, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (782, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (782, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (782, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (782, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (782, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (782, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (782, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (782, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (782, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (782, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (782, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (782, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (782, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (782, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (782, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (782, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (782, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (783, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (783, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (783, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (783, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (783, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (783, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (783, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (783, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (783, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (783, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (783, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (783, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (783, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (783, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (783, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (783, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (783, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (783, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (783, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (783, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (784, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (784, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (784, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (784, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (784, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (784, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (784, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (784, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (784, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (784, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (784, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (784, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (784, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (784, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (784, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (784, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (784, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (785, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (785, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (785, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (785, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (785, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (785, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (785, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (785, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (785, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (785, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (785, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (785, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (785, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (785, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (785, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (785, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (785, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (786, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (786, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (786, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (786, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (786, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (786, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (786, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (786, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (786, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (786, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (786, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (786, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (786, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (786, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (786, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (786, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (786, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (786, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (786, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (786, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (787, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (787, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (787, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (787, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (787, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (787, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (787, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (787, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (787, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (787, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (787, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (787, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (787, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (787, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (787, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (787, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (787, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (787, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (787, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (787, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (788, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (788, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (788, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (788, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (788, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (788, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (788, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (788, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (788, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (788, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (788, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (788, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (788, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (788, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (788, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (788, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (788, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (789, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (789, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (789, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (789, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (789, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (789, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (789, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (789, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (789, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (789, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (789, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (789, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (789, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (789, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (789, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (789, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (789, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (789, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (789, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (789, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (790, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (790, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (790, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (790, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (790, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (790, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (790, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (790, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (790, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (790, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (790, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (790, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (790, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (790, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (790, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (790, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (790, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (791, 84);
INSERT INTO `sys_patrol_patrol_point` VALUES (791, 85);
INSERT INTO `sys_patrol_patrol_point` VALUES (791, 86);
INSERT INTO `sys_patrol_patrol_point` VALUES (791, 91);
INSERT INTO `sys_patrol_patrol_point` VALUES (791, 93);
INSERT INTO `sys_patrol_patrol_point` VALUES (791, 100);
INSERT INTO `sys_patrol_patrol_point` VALUES (791, 105);
INSERT INTO `sys_patrol_patrol_point` VALUES (792, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (792, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (792, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (792, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (792, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (792, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (792, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (792, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (792, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (792, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (792, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (792, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (792, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (792, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (792, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (792, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (792, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (792, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (792, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (792, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (793, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (793, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (793, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (793, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (793, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (793, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (793, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (793, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (793, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (793, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (793, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (793, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (793, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (793, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (793, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (793, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (793, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (794, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (794, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (794, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (794, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (794, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (794, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (794, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (794, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (794, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (794, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (794, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (794, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (794, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (794, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (794, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (794, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (794, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (795, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (795, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (795, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (795, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (795, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (795, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (795, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (795, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (795, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (795, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (795, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (795, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (795, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (795, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (795, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (795, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (795, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (796, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (796, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (796, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (796, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (796, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (796, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (796, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (796, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (796, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (796, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (796, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (796, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (796, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (796, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (796, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (796, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (796, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (796, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (796, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (796, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (797, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (797, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (797, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (797, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (797, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (797, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (797, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (797, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (797, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (797, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (797, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (797, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (797, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (797, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (797, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (797, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (797, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (798, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (798, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (798, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (798, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (798, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (798, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (798, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (798, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (798, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (798, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (798, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (798, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (798, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (798, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (798, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (798, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (798, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (799, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (799, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (799, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (799, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (799, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (799, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (799, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (799, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (799, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (799, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (799, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (799, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (799, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (799, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (799, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (799, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (799, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (799, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (799, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (799, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (800, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (800, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (800, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (800, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (800, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (800, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (800, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (800, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (800, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (800, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (800, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (800, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (800, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (800, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (800, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (800, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (800, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (801, 84);
INSERT INTO `sys_patrol_patrol_point` VALUES (801, 85);
INSERT INTO `sys_patrol_patrol_point` VALUES (801, 86);
INSERT INTO `sys_patrol_patrol_point` VALUES (801, 91);
INSERT INTO `sys_patrol_patrol_point` VALUES (801, 93);
INSERT INTO `sys_patrol_patrol_point` VALUES (801, 100);
INSERT INTO `sys_patrol_patrol_point` VALUES (801, 105);
INSERT INTO `sys_patrol_patrol_point` VALUES (802, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (802, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (802, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (802, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (802, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (802, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (802, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (802, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (802, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (802, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (802, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (802, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (802, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (802, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (802, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (802, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (802, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (802, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (802, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (802, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (803, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (803, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (803, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (803, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (803, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (803, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (803, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (803, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (803, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (803, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (803, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (803, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (803, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (803, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (803, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (803, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (803, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (804, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (804, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (804, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (804, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (804, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (804, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (804, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (804, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (804, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (804, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (804, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (804, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (804, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (804, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (804, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (804, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (804, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (805, 6);
INSERT INTO `sys_patrol_patrol_point` VALUES (805, 7);
INSERT INTO `sys_patrol_patrol_point` VALUES (805, 8);
INSERT INTO `sys_patrol_patrol_point` VALUES (805, 12);
INSERT INTO `sys_patrol_patrol_point` VALUES (805, 13);
INSERT INTO `sys_patrol_patrol_point` VALUES (805, 14);
INSERT INTO `sys_patrol_patrol_point` VALUES (805, 15);
INSERT INTO `sys_patrol_patrol_point` VALUES (806, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (806, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (806, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (806, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (806, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (806, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (806, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (806, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (806, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (806, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (806, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (806, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (806, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (806, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (806, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (806, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (806, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (806, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (806, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (806, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (807, 6);
INSERT INTO `sys_patrol_patrol_point` VALUES (807, 7);
INSERT INTO `sys_patrol_patrol_point` VALUES (807, 8);
INSERT INTO `sys_patrol_patrol_point` VALUES (807, 12);
INSERT INTO `sys_patrol_patrol_point` VALUES (807, 13);
INSERT INTO `sys_patrol_patrol_point` VALUES (807, 14);
INSERT INTO `sys_patrol_patrol_point` VALUES (808, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (808, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (808, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (808, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (808, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (808, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (808, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (808, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (808, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (808, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (808, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (808, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (808, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (808, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (808, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (808, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (808, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (808, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (808, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (808, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (809, 2);
INSERT INTO `sys_patrol_patrol_point` VALUES (809, 3);
INSERT INTO `sys_patrol_patrol_point` VALUES (809, 4);
INSERT INTO `sys_patrol_patrol_point` VALUES (809, 5);
INSERT INTO `sys_patrol_patrol_point` VALUES (809, 16);
INSERT INTO `sys_patrol_patrol_point` VALUES (809, 17);
INSERT INTO `sys_patrol_patrol_point` VALUES (810, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (810, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (810, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (810, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (810, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (810, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (810, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (810, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (810, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (810, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (810, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (810, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (810, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (810, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (810, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (810, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (810, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (811, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (811, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (811, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (811, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (811, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (811, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (811, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (811, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (811, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (811, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (811, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (811, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (811, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (811, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (811, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (811, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (811, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (812, 2);
INSERT INTO `sys_patrol_patrol_point` VALUES (812, 3);
INSERT INTO `sys_patrol_patrol_point` VALUES (812, 4);
INSERT INTO `sys_patrol_patrol_point` VALUES (812, 5);
INSERT INTO `sys_patrol_patrol_point` VALUES (812, 16);
INSERT INTO `sys_patrol_patrol_point` VALUES (812, 17);
INSERT INTO `sys_patrol_patrol_point` VALUES (813, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (813, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (813, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (813, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (813, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (813, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (813, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (813, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (813, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (813, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (813, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (813, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (813, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (813, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (813, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (813, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (813, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (813, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (813, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (813, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (814, 84);
INSERT INTO `sys_patrol_patrol_point` VALUES (814, 85);
INSERT INTO `sys_patrol_patrol_point` VALUES (814, 86);
INSERT INTO `sys_patrol_patrol_point` VALUES (814, 91);
INSERT INTO `sys_patrol_patrol_point` VALUES (814, 93);
INSERT INTO `sys_patrol_patrol_point` VALUES (814, 100);
INSERT INTO `sys_patrol_patrol_point` VALUES (814, 105);
INSERT INTO `sys_patrol_patrol_point` VALUES (815, 58);
INSERT INTO `sys_patrol_patrol_point` VALUES (816, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (816, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (816, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (816, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (816, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (816, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (816, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (816, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (816, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (816, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (816, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (816, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (816, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (816, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (816, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (816, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (816, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (817, 84);
INSERT INTO `sys_patrol_patrol_point` VALUES (817, 85);
INSERT INTO `sys_patrol_patrol_point` VALUES (817, 86);
INSERT INTO `sys_patrol_patrol_point` VALUES (817, 91);
INSERT INTO `sys_patrol_patrol_point` VALUES (817, 93);
INSERT INTO `sys_patrol_patrol_point` VALUES (817, 100);
INSERT INTO `sys_patrol_patrol_point` VALUES (817, 105);
INSERT INTO `sys_patrol_patrol_point` VALUES (818, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (818, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (818, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (818, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (818, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (818, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (818, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (818, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (818, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (818, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (818, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (818, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (818, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (818, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (818, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (818, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (818, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (819, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (819, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (819, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (819, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (819, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (819, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (819, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (819, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (819, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (819, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (819, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (819, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (819, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (819, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (819, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (819, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (819, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (819, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (819, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (819, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (820, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (820, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (820, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (820, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (820, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (820, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (820, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (820, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (820, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (820, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (820, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (820, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (820, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (820, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (820, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (820, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (820, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (821, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (821, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (821, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (821, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (821, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (821, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (821, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (821, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (821, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (821, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (821, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (821, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (821, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (821, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (821, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (821, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (821, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (821, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (821, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (821, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (822, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (822, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (822, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (822, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (822, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (822, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (822, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (822, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (822, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (822, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (822, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (822, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (822, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (822, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (822, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (822, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (822, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (822, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (822, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (822, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (823, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (823, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (823, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (823, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (823, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (823, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (823, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (823, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (823, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (823, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (823, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (823, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (823, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (823, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (823, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (823, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (823, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (824, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (824, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (824, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (824, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (824, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (824, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (824, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (824, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (824, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (824, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (824, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (824, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (824, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (824, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (824, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (824, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (824, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (824, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (824, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (824, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (825, 84);
INSERT INTO `sys_patrol_patrol_point` VALUES (825, 85);
INSERT INTO `sys_patrol_patrol_point` VALUES (825, 86);
INSERT INTO `sys_patrol_patrol_point` VALUES (825, 91);
INSERT INTO `sys_patrol_patrol_point` VALUES (825, 93);
INSERT INTO `sys_patrol_patrol_point` VALUES (825, 100);
INSERT INTO `sys_patrol_patrol_point` VALUES (825, 105);
INSERT INTO `sys_patrol_patrol_point` VALUES (826, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (826, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (826, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (826, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (826, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (826, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (826, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (826, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (826, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (826, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (826, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (826, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (826, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (826, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (826, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (826, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (826, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (826, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (826, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (826, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (827, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (827, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (827, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (827, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (827, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (827, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (827, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (827, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (827, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (827, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (827, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (827, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (827, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (827, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (827, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (827, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (827, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (828, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (828, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (828, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (828, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (828, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (828, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (828, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (828, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (828, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (828, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (828, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (828, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (828, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (828, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (828, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (828, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (828, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (829, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (829, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (829, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (829, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (829, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (829, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (829, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (829, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (829, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (829, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (829, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (829, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (829, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (829, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (829, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (829, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (829, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (830, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (830, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (830, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (830, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (830, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (830, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (830, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (830, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (830, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (830, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (830, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (830, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (830, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (830, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (830, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (830, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (830, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (830, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (830, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (830, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (831, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (831, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (831, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (831, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (831, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (831, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (831, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (831, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (831, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (831, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (831, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (831, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (831, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (831, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (831, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (831, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (831, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (832, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (832, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (832, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (832, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (832, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (832, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (832, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (832, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (832, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (832, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (832, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (832, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (832, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (832, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (832, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (832, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (832, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (833, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (833, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (833, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (833, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (833, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (833, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (833, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (833, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (833, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (833, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (833, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (833, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (833, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (833, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (833, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (833, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (833, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (834, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (834, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (834, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (834, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (834, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (834, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (834, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (834, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (834, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (834, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (834, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (834, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (834, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (834, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (834, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (834, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (834, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (835, 51);
INSERT INTO `sys_patrol_patrol_point` VALUES (835, 53);
INSERT INTO `sys_patrol_patrol_point` VALUES (835, 54);
INSERT INTO `sys_patrol_patrol_point` VALUES (835, 56);
INSERT INTO `sys_patrol_patrol_point` VALUES (835, 57);
INSERT INTO `sys_patrol_patrol_point` VALUES (835, 59);
INSERT INTO `sys_patrol_patrol_point` VALUES (835, 60);
INSERT INTO `sys_patrol_patrol_point` VALUES (835, 61);
INSERT INTO `sys_patrol_patrol_point` VALUES (835, 62);
INSERT INTO `sys_patrol_patrol_point` VALUES (835, 63);
INSERT INTO `sys_patrol_patrol_point` VALUES (835, 64);
INSERT INTO `sys_patrol_patrol_point` VALUES (835, 65);
INSERT INTO `sys_patrol_patrol_point` VALUES (835, 66);
INSERT INTO `sys_patrol_patrol_point` VALUES (835, 67);
INSERT INTO `sys_patrol_patrol_point` VALUES (835, 68);
INSERT INTO `sys_patrol_patrol_point` VALUES (835, 69);
INSERT INTO `sys_patrol_patrol_point` VALUES (835, 70);
INSERT INTO `sys_patrol_patrol_point` VALUES (836, 84);
INSERT INTO `sys_patrol_patrol_point` VALUES (836, 85);
INSERT INTO `sys_patrol_patrol_point` VALUES (836, 86);
INSERT INTO `sys_patrol_patrol_point` VALUES (836, 91);
INSERT INTO `sys_patrol_patrol_point` VALUES (836, 93);
INSERT INTO `sys_patrol_patrol_point` VALUES (836, 100);
INSERT INTO `sys_patrol_patrol_point` VALUES (836, 105);
INSERT INTO `sys_patrol_patrol_point` VALUES (837, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (837, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (837, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (837, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (837, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (837, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (837, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (837, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (837, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (837, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (837, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (837, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (837, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (837, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (837, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (837, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (837, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (837, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (837, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (837, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (838, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (838, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (838, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (838, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (838, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (838, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (838, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (838, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (838, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (838, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (838, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (838, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (838, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (838, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (838, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (838, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (838, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (838, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (838, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (838, 106);
INSERT INTO `sys_patrol_patrol_point` VALUES (839, 78);
INSERT INTO `sys_patrol_patrol_point` VALUES (839, 79);
INSERT INTO `sys_patrol_patrol_point` VALUES (839, 81);
INSERT INTO `sys_patrol_patrol_point` VALUES (839, 82);
INSERT INTO `sys_patrol_patrol_point` VALUES (839, 83);
INSERT INTO `sys_patrol_patrol_point` VALUES (839, 87);
INSERT INTO `sys_patrol_patrol_point` VALUES (839, 88);
INSERT INTO `sys_patrol_patrol_point` VALUES (839, 89);
INSERT INTO `sys_patrol_patrol_point` VALUES (839, 90);
INSERT INTO `sys_patrol_patrol_point` VALUES (839, 92);
INSERT INTO `sys_patrol_patrol_point` VALUES (839, 95);
INSERT INTO `sys_patrol_patrol_point` VALUES (839, 96);
INSERT INTO `sys_patrol_patrol_point` VALUES (839, 97);
INSERT INTO `sys_patrol_patrol_point` VALUES (839, 98);
INSERT INTO `sys_patrol_patrol_point` VALUES (839, 99);
INSERT INTO `sys_patrol_patrol_point` VALUES (839, 101);
INSERT INTO `sys_patrol_patrol_point` VALUES (839, 102);
INSERT INTO `sys_patrol_patrol_point` VALUES (839, 103);
INSERT INTO `sys_patrol_patrol_point` VALUES (839, 104);
INSERT INTO `sys_patrol_patrol_point` VALUES (839, 106);

-- ----------------------------
-- Table structure for sys_patrol_patrol_point_status
-- ----------------------------
DROP TABLE IF EXISTS `sys_patrol_patrol_point_status`;
CREATE TABLE `sys_patrol_patrol_point_status`  (
  `patrol_patrol_point_status_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '巡更计划表和计划内巡更点状态',
  `patrol_id` bigint(20) NOT NULL COMMENT '巡更任务编号',
  `patrol_point_id` bigint(20) NOT NULL COMMENT '点位id',
  `patrol_patrol_point_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态(0启用 1未启用)',
  PRIMARY KEY (`patrol_patrol_point_status_id`, `patrol_id`, `patrol_point_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8441 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_patrol_patrol_point_status
-- ----------------------------
INSERT INTO `sys_patrol_patrol_point_status` VALUES (616, 322, 106, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (617, 322, 105, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (618, 322, 104, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (619, 322, 103, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1939, 380, 2, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1940, 380, 3, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1941, 380, 4, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1942, 380, 5, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1943, 380, 16, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1944, 380, 17, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1945, 381, 6, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1946, 381, 7, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1947, 381, 8, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1948, 381, 12, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1949, 381, 13, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1950, 381, 14, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1951, 381, 15, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1952, 382, 2, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1953, 382, 3, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1954, 382, 4, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1955, 382, 5, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1956, 382, 16, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1957, 382, 17, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1958, 383, 6, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1959, 383, 7, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1960, 383, 8, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1961, 383, 12, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1962, 383, 13, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1963, 383, 14, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1964, 384, 51, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1965, 384, 53, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1966, 384, 54, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1967, 384, 56, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1968, 384, 57, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1969, 384, 59, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1970, 384, 60, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1971, 384, 61, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1972, 384, 62, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1973, 384, 63, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1974, 384, 64, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1975, 384, 65, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1976, 384, 66, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1977, 384, 67, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1978, 384, 68, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1979, 384, 69, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1980, 384, 70, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1981, 385, 51, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1982, 385, 53, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1983, 385, 54, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1984, 385, 56, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1985, 385, 57, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1986, 385, 59, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1987, 385, 60, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1988, 385, 61, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1989, 385, 62, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1990, 385, 63, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1991, 385, 64, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1992, 385, 65, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1993, 385, 66, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1994, 385, 67, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1995, 385, 68, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1996, 385, 69, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1997, 385, 70, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1998, 386, 51, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (1999, 386, 53, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2000, 386, 54, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2001, 386, 56, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2002, 386, 57, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2003, 386, 59, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2004, 386, 60, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2005, 386, 61, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2006, 386, 62, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2007, 386, 63, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2008, 386, 64, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2009, 386, 65, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2010, 386, 66, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2011, 386, 67, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2012, 386, 68, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2013, 386, 69, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2014, 386, 70, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2015, 387, 51, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2016, 387, 53, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2017, 387, 54, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2018, 387, 56, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2019, 387, 57, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2020, 387, 59, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2021, 387, 60, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2022, 387, 61, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2023, 387, 62, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2024, 387, 63, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2025, 387, 64, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2026, 387, 65, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2027, 387, 66, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2028, 387, 67, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2029, 387, 68, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2030, 387, 69, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2031, 387, 70, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2032, 388, 33, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2033, 388, 34, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2034, 388, 35, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2035, 388, 37, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2036, 388, 38, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2037, 388, 39, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2038, 388, 40, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2039, 388, 41, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2040, 388, 42, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2041, 388, 43, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2042, 388, 44, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2043, 388, 45, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2044, 389, 78, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2045, 389, 79, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2046, 389, 81, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2047, 389, 82, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2048, 389, 83, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2049, 389, 87, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2050, 389, 88, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2051, 389, 89, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2052, 389, 90, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2053, 389, 92, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2054, 389, 95, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2055, 389, 96, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2056, 389, 97, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2057, 389, 98, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2058, 389, 99, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2059, 389, 101, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2060, 389, 102, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2061, 389, 103, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2062, 389, 104, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2063, 389, 106, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2064, 390, 78, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2065, 390, 79, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2066, 390, 81, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2067, 390, 82, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2068, 390, 83, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2069, 390, 87, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2070, 390, 88, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2071, 390, 89, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2072, 390, 90, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2073, 390, 92, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2074, 390, 95, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2075, 390, 96, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2076, 390, 97, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2077, 390, 98, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2078, 390, 99, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2079, 390, 101, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2080, 390, 102, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2081, 390, 103, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2082, 390, 104, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2083, 390, 106, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2084, 391, 78, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2085, 391, 79, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2086, 391, 81, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2087, 391, 82, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2088, 391, 83, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2089, 391, 87, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2090, 391, 88, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2091, 391, 89, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2092, 391, 90, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2093, 391, 92, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2094, 391, 95, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2095, 391, 96, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2096, 391, 97, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2097, 391, 98, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2098, 391, 99, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2099, 391, 101, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2100, 391, 102, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2101, 391, 103, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2102, 391, 104, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2103, 391, 106, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2104, 392, 84, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2105, 392, 85, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2106, 392, 86, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2107, 392, 91, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2108, 392, 93, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2109, 392, 100, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2110, 392, 105, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2111, 393, 46, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2112, 393, 47, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2113, 393, 48, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2114, 393, 49, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2115, 393, 50, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2116, 393, 52, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2117, 393, 55, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2118, 393, 71, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2119, 393, 73, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2120, 393, 75, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2121, 393, 76, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2122, 394, 58, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2131, 400, 51, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2132, 400, 53, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2133, 400, 54, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2134, 400, 56, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2135, 400, 57, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2136, 400, 59, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2137, 400, 60, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2138, 400, 61, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2139, 400, 62, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2140, 400, 63, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2141, 400, 64, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2142, 400, 65, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2143, 400, 66, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2144, 400, 67, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2145, 400, 68, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2146, 400, 69, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2147, 400, 70, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2148, 401, 51, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2149, 401, 53, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2150, 401, 54, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2151, 401, 56, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2152, 401, 57, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2153, 401, 59, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2154, 401, 60, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2155, 401, 61, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2156, 401, 62, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2157, 401, 63, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2158, 401, 64, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2159, 401, 65, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2160, 401, 66, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2161, 401, 67, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2162, 401, 68, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2163, 401, 69, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2164, 401, 70, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2165, 402, 84, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2166, 402, 85, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2167, 402, 86, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2168, 402, 91, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2169, 402, 93, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2170, 402, 100, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2171, 402, 105, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2189, 407, 51, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2190, 407, 53, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2191, 407, 54, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2192, 407, 56, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2193, 407, 57, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2194, 407, 59, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2195, 407, 60, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2196, 407, 61, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2197, 407, 62, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2198, 407, 63, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2199, 407, 64, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2200, 407, 65, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2201, 407, 66, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2202, 407, 67, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2203, 407, 68, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2204, 407, 69, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2205, 407, 70, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2290, 403, 78, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2291, 403, 79, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2292, 403, 81, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2293, 403, 82, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2294, 403, 83, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2295, 403, 87, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2296, 403, 88, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2297, 403, 89, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2298, 403, 90, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2299, 403, 92, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2300, 403, 95, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2301, 403, 96, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2302, 403, 97, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2303, 403, 98, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2304, 403, 99, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2305, 403, 101, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2306, 403, 102, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2307, 403, 103, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2308, 403, 104, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2309, 403, 106, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2327, 405, 78, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2328, 405, 79, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2329, 405, 81, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2330, 405, 82, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2331, 405, 83, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2332, 405, 87, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2333, 405, 88, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2334, 405, 89, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2335, 405, 90, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2336, 405, 92, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2337, 405, 95, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2338, 405, 96, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2339, 405, 97, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2340, 405, 98, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2341, 405, 99, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2342, 405, 101, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2343, 405, 102, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2344, 405, 103, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2345, 405, 104, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2346, 405, 106, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2347, 414, 78, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2348, 414, 79, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2349, 414, 81, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2350, 414, 82, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2351, 414, 83, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2352, 414, 87, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2353, 414, 88, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2354, 414, 89, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2355, 414, 90, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2356, 414, 92, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2357, 414, 95, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2358, 414, 96, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2359, 414, 97, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2360, 414, 98, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2361, 414, 99, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2362, 414, 101, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2363, 414, 102, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2364, 414, 103, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2365, 414, 104, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2366, 414, 106, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2367, 406, 51, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2368, 406, 53, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2369, 406, 54, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2370, 406, 56, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2371, 406, 57, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2372, 406, 59, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2373, 406, 60, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2374, 406, 61, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2375, 406, 62, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2376, 406, 63, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2377, 406, 64, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2378, 406, 65, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2379, 406, 66, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2380, 406, 67, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2381, 406, 68, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2382, 406, 69, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2383, 406, 70, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2384, 415, 51, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2385, 415, 53, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2386, 415, 54, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2387, 415, 56, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2388, 415, 57, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2389, 415, 59, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2390, 415, 60, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2391, 415, 61, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2392, 415, 62, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2393, 415, 63, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2394, 415, 64, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2395, 415, 65, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2396, 415, 66, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2397, 415, 67, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2398, 415, 68, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2399, 415, 69, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2400, 415, 70, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2437, 419, 78, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2438, 419, 79, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2439, 419, 81, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2440, 419, 82, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2441, 419, 83, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2442, 419, 87, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2443, 419, 88, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2444, 419, 89, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2445, 419, 90, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2446, 419, 92, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2447, 419, 95, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2448, 419, 96, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2449, 419, 97, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2450, 419, 98, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2451, 419, 99, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2452, 419, 101, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2453, 419, 102, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2454, 419, 103, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2455, 419, 104, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2456, 419, 106, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2521, 424, 51, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2522, 424, 53, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2523, 424, 54, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2524, 424, 56, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2525, 424, 57, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2526, 424, 59, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2527, 424, 60, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2528, 424, 61, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2529, 424, 62, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2530, 424, 63, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2531, 424, 64, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2532, 424, 65, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2533, 424, 66, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2534, 424, 67, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2535, 424, 68, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2536, 424, 69, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2537, 424, 70, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2538, 425, 51, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2539, 425, 53, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2540, 425, 54, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2541, 425, 56, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2542, 425, 57, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2543, 425, 59, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2544, 425, 60, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2545, 425, 61, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2546, 425, 62, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2547, 425, 63, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2548, 425, 64, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2549, 425, 65, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2550, 425, 66, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2551, 425, 67, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2552, 425, 68, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2553, 425, 69, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2554, 425, 70, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2555, 426, 51, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2556, 426, 53, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2557, 426, 54, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2558, 426, 56, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2559, 426, 57, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2560, 426, 59, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2561, 426, 60, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2562, 426, 61, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2563, 426, 62, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2564, 426, 63, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2565, 426, 64, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2566, 426, 65, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2567, 426, 66, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2568, 426, 67, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2569, 426, 68, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2570, 426, 69, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2571, 426, 70, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2589, 428, 51, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2590, 428, 53, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2591, 428, 54, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2592, 428, 56, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2593, 428, 57, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2594, 428, 59, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2595, 428, 60, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2596, 428, 61, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2597, 428, 62, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2598, 428, 63, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2599, 428, 64, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2600, 428, 65, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2601, 428, 66, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2602, 428, 67, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2603, 428, 68, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2604, 428, 69, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2605, 428, 70, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2606, 429, 78, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2607, 429, 79, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2608, 429, 81, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2609, 429, 82, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2610, 429, 83, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2611, 429, 87, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2612, 429, 88, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2613, 429, 89, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2614, 429, 90, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2615, 429, 92, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2616, 429, 95, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2617, 429, 96, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2618, 429, 97, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2619, 429, 98, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2620, 429, 99, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2621, 429, 101, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2622, 429, 102, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2623, 429, 103, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2624, 429, 104, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2625, 429, 106, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2646, 431, 78, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2647, 431, 79, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2648, 431, 81, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2649, 431, 82, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2650, 431, 83, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2651, 431, 87, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2652, 431, 88, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2653, 431, 89, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2654, 431, 90, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2655, 431, 92, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2656, 431, 95, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2657, 431, 96, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2658, 431, 97, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2659, 431, 98, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2660, 431, 99, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2661, 431, 101, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2662, 431, 102, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2663, 431, 103, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2664, 431, 104, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2665, 431, 106, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2666, 432, 84, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2667, 432, 85, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2668, 432, 86, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2669, 432, 91, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2670, 432, 93, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2671, 432, 100, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2672, 432, 105, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2733, 439, 78, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2734, 439, 79, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2735, 439, 81, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2736, 439, 82, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2737, 439, 83, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2738, 439, 87, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2739, 439, 88, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2740, 439, 89, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2741, 439, 90, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2742, 439, 92, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2743, 439, 95, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2744, 439, 96, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2745, 439, 97, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2746, 439, 98, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2747, 439, 99, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2748, 439, 101, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2749, 439, 102, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2750, 439, 103, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2751, 439, 104, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2752, 439, 106, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2760, 442, 51, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2761, 442, 53, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2762, 442, 54, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2763, 442, 56, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2764, 442, 57, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2765, 442, 59, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2766, 442, 60, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2767, 442, 61, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2768, 442, 62, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2769, 442, 63, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2770, 442, 64, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2771, 442, 65, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2772, 442, 66, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2773, 442, 67, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2774, 442, 68, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2775, 442, 69, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2776, 442, 70, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2831, 447, 78, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2832, 447, 79, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2833, 447, 81, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2834, 447, 82, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2835, 447, 83, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2836, 447, 87, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2837, 447, 88, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2838, 447, 89, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2839, 447, 90, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2840, 447, 92, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2841, 447, 95, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2842, 447, 96, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2843, 447, 97, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2844, 447, 98, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2845, 447, 99, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2846, 447, 101, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2847, 447, 102, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2848, 447, 103, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2849, 447, 104, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2850, 447, 106, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2851, 448, 78, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2852, 448, 79, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2853, 448, 81, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2854, 448, 82, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2855, 448, 83, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2856, 448, 87, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2857, 448, 88, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2858, 448, 89, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2859, 448, 90, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2860, 448, 92, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2861, 448, 95, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2862, 448, 96, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2863, 448, 97, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2864, 448, 98, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2865, 448, 99, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2866, 448, 101, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2867, 448, 102, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2868, 448, 103, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2869, 448, 104, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2870, 448, 106, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2911, 450, 51, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2912, 450, 53, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2913, 450, 54, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2914, 450, 56, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2915, 450, 57, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2916, 450, 59, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2917, 450, 60, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2918, 450, 61, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2919, 450, 62, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2920, 450, 63, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2921, 450, 64, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2922, 450, 65, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2923, 450, 66, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2924, 450, 67, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2925, 450, 68, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2926, 450, 69, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2927, 450, 70, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2928, 449, 51, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2929, 449, 53, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2930, 449, 54, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2931, 449, 56, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2932, 449, 57, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2933, 449, 59, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2934, 449, 60, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2935, 449, 61, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2936, 449, 62, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2937, 449, 63, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2938, 449, 64, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2939, 449, 65, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2940, 449, 66, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2941, 449, 67, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2942, 449, 68, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2943, 449, 69, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2944, 449, 70, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2945, 451, 51, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2946, 451, 53, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2947, 451, 54, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2948, 451, 56, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2949, 451, 57, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2950, 451, 59, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2951, 451, 60, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2952, 451, 61, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2953, 451, 62, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2954, 451, 63, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2955, 451, 64, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2956, 451, 65, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2957, 451, 66, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2958, 451, 67, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2959, 451, 68, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2960, 451, 69, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2961, 451, 70, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2962, 452, 84, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2963, 452, 85, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2964, 452, 86, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2965, 452, 91, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2966, 452, 93, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2967, 452, 100, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2968, 452, 105, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2969, 453, 51, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2970, 453, 53, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2971, 453, 54, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2972, 453, 56, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2973, 453, 57, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2974, 453, 59, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2975, 453, 60, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2976, 453, 61, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2977, 453, 62, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2978, 453, 63, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2979, 453, 64, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2980, 453, 65, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2981, 453, 66, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2982, 453, 67, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2983, 453, 68, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2984, 453, 69, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2985, 453, 70, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2986, 455, 51, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2987, 455, 53, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2988, 455, 54, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2989, 455, 56, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2990, 455, 57, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2991, 455, 59, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2992, 455, 60, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2993, 455, 61, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2994, 455, 62, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2995, 455, 63, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2996, 455, 64, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2997, 455, 65, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2998, 455, 66, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (2999, 455, 67, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3000, 455, 68, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3001, 455, 69, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3002, 455, 70, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3003, 456, 78, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3004, 456, 79, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3005, 456, 81, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3006, 456, 82, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3007, 456, 83, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3008, 456, 87, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3009, 456, 88, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3010, 456, 89, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3011, 456, 90, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3012, 456, 92, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3013, 456, 95, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3014, 456, 96, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3015, 456, 97, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3016, 456, 98, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3017, 456, 99, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3018, 456, 101, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3019, 456, 102, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3020, 456, 103, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3021, 456, 104, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3022, 456, 106, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3023, 454, 6, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3024, 454, 7, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3025, 454, 8, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3026, 454, 12, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3027, 454, 13, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3028, 454, 14, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3029, 459, 6, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3030, 459, 7, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3031, 459, 8, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3032, 459, 12, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3033, 459, 13, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3034, 459, 14, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3035, 459, 15, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3036, 457, 51, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3037, 457, 53, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3038, 457, 54, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3039, 457, 56, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3040, 457, 57, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3041, 457, 59, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3042, 457, 60, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3043, 457, 61, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3044, 457, 62, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3045, 457, 63, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3046, 457, 64, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3047, 457, 65, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3048, 457, 66, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3049, 457, 67, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3050, 457, 68, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3051, 457, 69, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3052, 457, 70, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3053, 458, 51, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3054, 458, 53, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3055, 458, 54, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3056, 458, 56, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3057, 458, 57, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3058, 458, 59, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3059, 458, 60, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3060, 458, 61, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3061, 458, 62, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3062, 458, 63, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3063, 458, 64, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3064, 458, 65, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3065, 458, 66, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3066, 458, 67, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3067, 458, 68, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3068, 458, 69, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3069, 458, 70, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3070, 460, 2, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3071, 460, 3, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3072, 460, 4, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3073, 460, 5, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3074, 460, 16, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3075, 460, 17, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3076, 461, 2, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3077, 461, 3, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3078, 461, 4, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3079, 461, 5, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3080, 461, 16, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3081, 461, 17, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3082, 462, 78, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3083, 462, 79, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3084, 462, 81, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3085, 462, 82, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3086, 462, 83, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3087, 462, 87, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3088, 462, 88, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3089, 462, 89, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3090, 462, 90, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3091, 462, 92, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3092, 462, 95, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3093, 462, 96, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3094, 462, 97, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3095, 462, 98, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3096, 462, 99, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3097, 462, 101, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3098, 462, 102, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3099, 462, 103, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3100, 462, 104, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3101, 462, 106, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3102, 463, 58, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3103, 464, 78, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3104, 464, 79, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3105, 464, 81, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3106, 464, 82, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3107, 464, 83, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3108, 464, 87, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3109, 464, 88, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3110, 464, 89, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3111, 464, 90, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3112, 464, 92, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3113, 464, 95, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3114, 464, 96, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3115, 464, 97, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3116, 464, 98, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3117, 464, 99, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3118, 464, 101, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3119, 464, 102, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3120, 464, 103, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3121, 464, 104, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3122, 464, 106, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3123, 465, 84, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3124, 465, 85, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3125, 465, 86, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3126, 465, 91, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3127, 465, 93, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3128, 465, 100, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3129, 465, 105, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3261, 476, 78, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3262, 476, 79, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3263, 476, 81, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3264, 476, 82, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3265, 476, 83, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3266, 476, 87, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3267, 476, 88, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3268, 476, 89, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3269, 476, 90, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3270, 476, 92, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3271, 476, 95, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3272, 476, 96, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3273, 476, 97, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3274, 476, 98, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3275, 476, 99, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3276, 476, 101, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3277, 476, 102, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3278, 476, 103, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3279, 476, 104, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3280, 476, 106, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3292, 478, 51, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3293, 478, 53, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3294, 478, 54, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3295, 478, 56, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3296, 478, 57, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3297, 478, 59, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3298, 478, 60, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3299, 478, 61, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3300, 478, 62, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3301, 478, 63, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3302, 478, 64, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3303, 478, 65, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3304, 478, 66, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3305, 478, 67, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3306, 478, 68, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3307, 478, 69, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3308, 478, 70, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3309, 479, 51, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3310, 479, 53, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3311, 479, 54, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3312, 479, 56, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3313, 479, 57, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3314, 479, 59, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3315, 479, 60, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3316, 479, 61, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3317, 479, 62, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3318, 479, 63, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3319, 479, 64, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3320, 479, 65, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3321, 479, 66, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3322, 479, 67, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3323, 479, 68, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3324, 479, 69, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3325, 479, 70, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (3326, 482, 46, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6767, 282, 106, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6768, 282, 107, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6794, 301, 51, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6795, 301, 53, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6796, 301, 54, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6797, 301, 56, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6798, 301, 57, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6799, 301, 59, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6800, 301, 60, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6801, 301, 61, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6802, 301, 62, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6803, 301, 63, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6804, 301, 64, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6805, 301, 65, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6806, 301, 66, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6807, 301, 67, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6808, 301, 68, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6809, 301, 69, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6810, 301, 70, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6811, 300, 51, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6812, 300, 53, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6813, 300, 54, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6814, 300, 56, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6815, 300, 57, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6816, 300, 59, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6817, 300, 60, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6818, 300, 61, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6819, 300, 62, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6820, 300, 63, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6821, 300, 64, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6822, 300, 65, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6823, 300, 66, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6824, 300, 67, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6825, 300, 68, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6826, 300, 69, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6827, 300, 70, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6889, 307, 78, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6890, 307, 79, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6891, 307, 81, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6892, 307, 82, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6893, 307, 83, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6894, 307, 87, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6895, 307, 88, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6896, 307, 89, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6897, 307, 90, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6898, 307, 92, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6899, 307, 95, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6900, 307, 96, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6901, 307, 97, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6902, 307, 98, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6903, 307, 99, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6904, 307, 101, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6905, 307, 102, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6906, 307, 103, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6907, 307, 104, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6908, 307, 106, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6909, 305, 78, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6910, 305, 79, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6911, 305, 81, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6912, 305, 82, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6913, 305, 83, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6914, 305, 87, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6915, 305, 88, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6916, 305, 89, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6917, 305, 90, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6918, 305, 92, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6919, 305, 95, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6920, 305, 96, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6921, 305, 97, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6922, 305, 98, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6923, 305, 99, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6924, 305, 101, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6925, 305, 102, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6926, 305, 103, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6927, 305, 104, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6928, 305, 106, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6929, 306, 78, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6930, 306, 79, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6931, 306, 81, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6932, 306, 82, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6933, 306, 83, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6934, 306, 87, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6935, 306, 88, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6936, 306, 89, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6937, 306, 90, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6938, 306, 92, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6939, 306, 95, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6940, 306, 96, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6941, 306, 97, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6942, 306, 98, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6943, 306, 99, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6944, 306, 101, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6945, 306, 102, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6946, 306, 103, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6947, 306, 104, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6948, 306, 106, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6993, 748, 78, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6994, 748, 79, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6995, 748, 81, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6996, 748, 82, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6997, 748, 83, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6998, 748, 87, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (6999, 748, 88, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7000, 748, 89, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7001, 748, 90, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7002, 748, 92, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7003, 748, 95, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7004, 748, 96, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7005, 748, 97, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7006, 748, 98, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7007, 748, 99, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7008, 748, 101, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7009, 748, 102, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7010, 748, 103, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7011, 748, 104, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7012, 748, 106, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7013, 747, 78, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7014, 747, 79, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7015, 747, 81, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7016, 747, 82, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7017, 747, 83, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7018, 747, 87, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7019, 747, 88, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7020, 747, 89, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7021, 747, 90, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7022, 747, 92, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7023, 747, 95, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7024, 747, 96, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7025, 747, 97, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7026, 747, 98, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7027, 747, 99, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7028, 747, 101, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7029, 747, 102, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7030, 747, 103, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7031, 747, 104, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7032, 747, 106, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7033, 749, 51, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7034, 749, 53, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7035, 749, 54, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7036, 749, 56, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7037, 749, 57, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7038, 749, 59, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7039, 749, 60, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7040, 749, 61, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7041, 749, 62, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7042, 749, 63, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7043, 749, 64, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7044, 749, 65, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7045, 749, 66, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7046, 749, 67, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7047, 749, 68, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7048, 749, 69, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7049, 749, 70, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7050, 750, 51, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7051, 750, 53, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7052, 750, 54, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7053, 750, 56, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7054, 750, 57, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7055, 750, 59, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7056, 750, 60, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7057, 750, 61, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7058, 750, 62, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7059, 750, 63, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7060, 750, 64, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7061, 750, 65, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7062, 750, 66, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7063, 750, 67, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7064, 750, 68, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7065, 750, 69, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7066, 750, 70, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7067, 751, 51, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7068, 751, 53, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7069, 751, 54, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7070, 751, 56, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7071, 751, 57, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7072, 751, 59, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7073, 751, 60, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7074, 751, 61, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7075, 751, 62, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7076, 751, 63, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7077, 751, 64, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7078, 751, 65, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7079, 751, 66, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7080, 751, 67, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7081, 751, 68, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7082, 751, 69, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7083, 751, 70, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7084, 752, 78, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7085, 752, 79, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7086, 752, 81, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7087, 752, 82, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7088, 752, 83, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7089, 752, 87, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7090, 752, 88, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7091, 752, 89, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7092, 752, 90, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7093, 752, 92, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7094, 752, 95, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7095, 752, 96, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7096, 752, 97, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7097, 752, 98, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7098, 752, 99, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7099, 752, 101, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7100, 752, 102, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7101, 752, 103, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7102, 752, 104, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7103, 752, 106, '1');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7104, 753, 51, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7105, 753, 53, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7106, 753, 54, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7107, 753, 56, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7108, 753, 57, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7109, 753, 59, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7110, 753, 60, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7111, 753, 61, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7112, 753, 62, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7113, 753, 63, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7114, 753, 64, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7115, 753, 65, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7116, 753, 66, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7117, 753, 67, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7118, 753, 68, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7119, 753, 69, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7120, 753, 70, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7145, 308, 84, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7146, 308, 85, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7147, 308, 86, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7148, 308, 91, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7149, 308, 93, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7150, 308, 100, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7151, 308, 105, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7152, 756, 84, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7153, 756, 85, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7154, 756, 86, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7155, 756, 91, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7156, 756, 93, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7157, 756, 100, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7158, 756, 105, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7159, 302, 51, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7160, 302, 53, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7161, 302, 54, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7162, 302, 56, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7163, 302, 57, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7164, 302, 59, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7165, 302, 60, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7166, 302, 61, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7167, 302, 62, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7168, 302, 63, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7169, 302, 64, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7170, 302, 65, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7171, 302, 66, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7172, 302, 67, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7173, 302, 68, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7174, 302, 69, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7175, 302, 70, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7176, 303, 51, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7177, 303, 53, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7178, 303, 54, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7179, 303, 56, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7180, 303, 57, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7181, 303, 59, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7182, 303, 60, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7183, 303, 61, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7184, 303, 62, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7185, 303, 63, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7186, 303, 64, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7187, 303, 65, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7188, 303, 66, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7189, 303, 67, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7190, 303, 68, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7191, 303, 69, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7192, 303, 70, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7193, 296, 2, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7194, 296, 3, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7195, 296, 4, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7196, 296, 5, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7197, 296, 16, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7198, 296, 17, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7199, 297, 6, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7200, 297, 7, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7201, 297, 8, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7202, 297, 12, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7203, 297, 13, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7204, 297, 14, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7205, 297, 15, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7206, 298, 2, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7207, 298, 3, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7208, 298, 4, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7209, 298, 5, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7210, 298, 16, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7211, 298, 17, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7212, 299, 6, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7213, 299, 7, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7214, 299, 8, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7215, 299, 12, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7216, 299, 13, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7217, 299, 14, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7218, 304, 33, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7219, 304, 34, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7220, 304, 35, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7221, 304, 37, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7222, 304, 38, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7223, 304, 39, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7224, 304, 40, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7225, 304, 41, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7226, 304, 42, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7227, 304, 43, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7228, 304, 44, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7229, 304, 45, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7230, 329, 46, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7231, 329, 47, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7232, 329, 48, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7233, 329, 49, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7234, 329, 50, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7235, 329, 52, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7236, 329, 55, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7237, 329, 71, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7238, 329, 73, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7239, 329, 75, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7240, 329, 76, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7241, 329, 112, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7242, 379, 58, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7285, 764, 2, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7286, 764, 3, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7287, 764, 4, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7288, 764, 5, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7289, 764, 16, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7290, 764, 17, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7291, 765, 6, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7292, 765, 7, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7293, 765, 8, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7294, 765, 12, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7295, 765, 13, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7296, 765, 14, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7297, 765, 15, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7298, 766, 2, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7299, 766, 3, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7300, 766, 4, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7301, 766, 5, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7302, 766, 16, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7303, 766, 17, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7304, 767, 6, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7305, 767, 7, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7306, 767, 8, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7307, 767, 12, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7308, 767, 13, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7309, 767, 14, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7310, 768, 33, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7311, 768, 34, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7312, 768, 35, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7313, 768, 37, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7314, 768, 38, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7315, 768, 39, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7316, 768, 40, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7317, 768, 41, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7318, 768, 42, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7319, 768, 43, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7320, 768, 44, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7321, 768, 45, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7322, 769, 46, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7323, 769, 47, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7324, 769, 48, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7325, 769, 49, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7326, 769, 50, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7327, 769, 52, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7328, 769, 55, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7329, 769, 71, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7330, 769, 73, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7331, 769, 75, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7332, 769, 76, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7333, 769, 112, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7334, 770, 58, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7335, 774, 84, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7336, 774, 85, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7337, 774, 86, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7338, 774, 91, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7339, 774, 93, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7340, 774, 100, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7341, 774, 105, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7342, 775, 78, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7343, 775, 79, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7344, 775, 81, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7345, 775, 82, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7346, 775, 83, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7347, 775, 87, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7348, 775, 88, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7349, 775, 89, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7350, 775, 90, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7351, 775, 92, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7352, 775, 95, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7353, 775, 96, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7354, 775, 97, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7355, 775, 98, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7356, 775, 99, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7357, 775, 101, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7358, 775, 102, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7359, 775, 103, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7360, 775, 104, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7361, 775, 106, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7362, 771, 51, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7363, 771, 53, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7364, 771, 54, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7365, 771, 56, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7366, 771, 57, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7367, 771, 59, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7368, 771, 60, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7369, 771, 61, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7370, 771, 62, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7371, 771, 63, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7372, 771, 64, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7373, 771, 65, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7374, 771, 66, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7375, 771, 67, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7376, 771, 68, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7377, 771, 69, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7378, 771, 70, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7379, 773, 78, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7380, 773, 79, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7381, 773, 81, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7382, 773, 82, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7383, 773, 83, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7384, 773, 87, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7385, 773, 88, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7386, 773, 89, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7387, 773, 90, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7388, 773, 92, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7389, 773, 95, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7390, 773, 96, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7391, 773, 97, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7392, 773, 98, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7393, 773, 99, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7394, 773, 101, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7395, 773, 102, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7396, 773, 103, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7397, 773, 104, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7398, 773, 106, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7399, 772, 78, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7400, 772, 79, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7401, 772, 81, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7402, 772, 82, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7403, 772, 83, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7404, 772, 87, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7405, 772, 88, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7406, 772, 89, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7407, 772, 90, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7408, 772, 92, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7409, 772, 95, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7410, 772, 96, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7411, 772, 97, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7412, 772, 98, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7413, 772, 99, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7414, 772, 101, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7415, 772, 102, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7416, 772, 103, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7417, 772, 104, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7418, 772, 106, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7419, 776, 51, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7420, 776, 53, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7421, 776, 54, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7422, 776, 56, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7423, 776, 57, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7424, 776, 59, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7425, 776, 60, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7426, 776, 61, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7427, 776, 62, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7428, 776, 63, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7429, 776, 64, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7430, 776, 65, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7431, 776, 66, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7432, 776, 67, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7433, 776, 68, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7434, 776, 69, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7435, 776, 70, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7436, 777, 51, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7437, 777, 53, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7438, 777, 54, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7439, 777, 56, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7440, 777, 57, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7441, 777, 59, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7442, 777, 60, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7443, 777, 61, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7444, 777, 62, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7445, 777, 63, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7446, 777, 64, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7447, 777, 65, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7448, 777, 66, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7449, 777, 67, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7450, 777, 68, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7451, 777, 69, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7452, 777, 70, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7453, 778, 51, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7454, 778, 53, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7455, 778, 54, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7456, 778, 56, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7457, 778, 57, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7458, 778, 59, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7459, 778, 60, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7460, 778, 61, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7461, 778, 62, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7462, 778, 63, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7463, 778, 64, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7464, 778, 65, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7465, 778, 66, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7466, 778, 67, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7467, 778, 68, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7468, 778, 69, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7469, 778, 70, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7470, 779, 51, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7471, 779, 53, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7472, 779, 54, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7473, 779, 56, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7474, 779, 57, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7475, 779, 59, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7476, 779, 60, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7477, 779, 61, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7478, 779, 62, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7479, 779, 63, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7480, 779, 64, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7481, 779, 65, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7482, 779, 66, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7483, 779, 67, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7484, 779, 68, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7485, 779, 69, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7486, 779, 70, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7487, 780, 84, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7488, 780, 85, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7489, 780, 86, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7490, 780, 91, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7491, 780, 93, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7492, 780, 100, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7493, 780, 105, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7494, 781, 51, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7495, 781, 53, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7496, 781, 54, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7497, 781, 56, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7498, 781, 57, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7499, 781, 59, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7500, 781, 60, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7501, 781, 61, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7502, 781, 62, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7503, 781, 63, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7504, 781, 64, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7505, 781, 65, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7506, 781, 66, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7507, 781, 67, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7508, 781, 68, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7509, 781, 69, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7510, 781, 70, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7511, 782, 78, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7512, 782, 79, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7513, 782, 81, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7514, 782, 82, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7515, 782, 83, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7516, 782, 87, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7517, 782, 88, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7518, 782, 89, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7519, 782, 90, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7520, 782, 92, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7521, 782, 95, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7522, 782, 96, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7523, 782, 97, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7524, 782, 98, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7525, 782, 99, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7526, 782, 101, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7527, 782, 102, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7528, 782, 103, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7529, 782, 104, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7530, 782, 106, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7531, 783, 78, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7532, 783, 79, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7533, 783, 81, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7534, 783, 82, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7535, 783, 83, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7536, 783, 87, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7537, 783, 88, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7538, 783, 89, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7539, 783, 90, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7540, 783, 92, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7541, 783, 95, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7542, 783, 96, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7543, 783, 97, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7544, 783, 98, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7545, 783, 99, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7546, 783, 101, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7547, 783, 102, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7548, 783, 103, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7549, 783, 104, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7550, 783, 106, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7551, 784, 51, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7552, 784, 53, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7553, 784, 54, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7554, 784, 56, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7555, 784, 57, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7556, 784, 59, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7557, 784, 60, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7558, 784, 61, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7559, 784, 62, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7560, 784, 63, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7561, 784, 64, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7562, 784, 65, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7563, 784, 66, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7564, 784, 67, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7565, 784, 68, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7566, 784, 69, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7567, 784, 70, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7568, 785, 51, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7569, 785, 53, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7570, 785, 54, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7571, 785, 56, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7572, 785, 57, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7573, 785, 59, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7574, 785, 60, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7575, 785, 61, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7576, 785, 62, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7577, 785, 63, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7578, 785, 64, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7579, 785, 65, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7580, 785, 66, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7581, 785, 67, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7582, 785, 68, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7583, 785, 69, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7584, 785, 70, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7585, 786, 78, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7586, 786, 79, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7587, 786, 81, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7588, 786, 82, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7589, 786, 83, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7590, 786, 87, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7591, 786, 88, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7592, 786, 89, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7593, 786, 90, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7594, 786, 92, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7595, 786, 95, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7596, 786, 96, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7597, 786, 97, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7598, 786, 98, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7599, 786, 99, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7600, 786, 101, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7601, 786, 102, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7602, 786, 103, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7603, 786, 104, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7604, 786, 106, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7605, 788, 51, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7606, 788, 53, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7607, 788, 54, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7608, 788, 56, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7609, 788, 57, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7610, 788, 59, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7611, 788, 60, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7612, 788, 61, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7613, 788, 62, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7614, 788, 63, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7615, 788, 64, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7616, 788, 65, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7617, 788, 66, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7618, 788, 67, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7619, 788, 68, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7620, 788, 69, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7621, 788, 70, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7622, 787, 78, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7623, 787, 79, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7624, 787, 81, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7625, 787, 82, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7626, 787, 83, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7627, 787, 87, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7628, 787, 88, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7629, 787, 89, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7630, 787, 90, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7631, 787, 92, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7632, 787, 95, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7633, 787, 96, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7634, 787, 97, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7635, 787, 98, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7636, 787, 99, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7637, 787, 101, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7638, 787, 102, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7639, 787, 103, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7640, 787, 104, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7641, 787, 106, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7642, 789, 78, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7643, 789, 79, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7644, 789, 81, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7645, 789, 82, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7646, 789, 83, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7647, 789, 87, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7648, 789, 88, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7649, 789, 89, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7650, 789, 90, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7651, 789, 92, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7652, 789, 95, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7653, 789, 96, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7654, 789, 97, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7655, 789, 98, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7656, 789, 99, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7657, 789, 101, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7658, 789, 102, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7659, 789, 103, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7660, 789, 104, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7661, 789, 106, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7662, 790, 51, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7663, 790, 53, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7664, 790, 54, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7665, 790, 56, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7666, 790, 57, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7667, 790, 59, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7668, 790, 60, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7669, 790, 61, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7670, 790, 62, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7671, 790, 63, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7672, 790, 64, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7673, 790, 65, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7674, 790, 66, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7675, 790, 67, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7676, 790, 68, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7677, 790, 69, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7678, 790, 70, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7679, 791, 84, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7680, 791, 85, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7681, 791, 86, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7682, 791, 91, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7683, 791, 93, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7684, 791, 100, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7685, 791, 105, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7686, 793, 51, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7687, 793, 53, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7688, 793, 54, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7689, 793, 56, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7690, 793, 57, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7691, 793, 59, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7692, 793, 60, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7693, 793, 61, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7694, 793, 62, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7695, 793, 63, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7696, 793, 64, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7697, 793, 65, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7698, 793, 66, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7699, 793, 67, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7700, 793, 68, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7701, 793, 69, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7702, 793, 70, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7703, 794, 51, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7704, 794, 53, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7705, 794, 54, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7706, 794, 56, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7707, 794, 57, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7708, 794, 59, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7709, 794, 60, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7710, 794, 61, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7711, 794, 62, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7712, 794, 63, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7713, 794, 64, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7714, 794, 65, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7715, 794, 66, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7716, 794, 67, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7717, 794, 68, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7718, 794, 69, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7719, 794, 70, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7720, 792, 78, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7721, 792, 79, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7722, 792, 81, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7723, 792, 82, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7724, 792, 83, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7725, 792, 87, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7726, 792, 88, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7727, 792, 89, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7728, 792, 90, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7729, 792, 92, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7730, 792, 95, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7731, 792, 96, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7732, 792, 97, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7733, 792, 98, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7734, 792, 99, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7735, 792, 101, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7736, 792, 102, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7737, 792, 103, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7738, 792, 104, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7739, 792, 106, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7740, 795, 51, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7741, 795, 53, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7742, 795, 54, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7743, 795, 56, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7744, 795, 57, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7745, 795, 59, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7746, 795, 60, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7747, 795, 61, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7748, 795, 62, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7749, 795, 63, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7750, 795, 64, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7751, 795, 65, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7752, 795, 66, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7753, 795, 67, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7754, 795, 68, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7755, 795, 69, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7756, 795, 70, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7757, 796, 78, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7758, 796, 79, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7759, 796, 81, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7760, 796, 82, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7761, 796, 83, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7762, 796, 87, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7763, 796, 88, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7764, 796, 89, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7765, 796, 90, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7766, 796, 92, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7767, 796, 95, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7768, 796, 96, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7769, 796, 97, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7770, 796, 98, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7771, 796, 99, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7772, 796, 101, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7773, 796, 102, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7774, 796, 103, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7775, 796, 104, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7776, 796, 106, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7777, 797, 51, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7778, 797, 53, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7779, 797, 54, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7780, 797, 56, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7781, 797, 57, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7782, 797, 59, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7783, 797, 60, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7784, 797, 61, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7785, 797, 62, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7786, 797, 63, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7787, 797, 64, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7788, 797, 65, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7789, 797, 66, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7790, 797, 67, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7791, 797, 68, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7792, 797, 69, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7793, 797, 70, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7794, 798, 51, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7795, 798, 53, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7796, 798, 54, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7797, 798, 56, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7798, 798, 57, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7799, 798, 59, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7800, 798, 60, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7801, 798, 61, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7802, 798, 62, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7803, 798, 63, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7804, 798, 64, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7805, 798, 65, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7806, 798, 66, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7807, 798, 67, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7808, 798, 68, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7809, 798, 69, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7810, 798, 70, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7811, 799, 78, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7812, 799, 79, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7813, 799, 81, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7814, 799, 82, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7815, 799, 83, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7816, 799, 87, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7817, 799, 88, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7818, 799, 89, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7819, 799, 90, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7820, 799, 92, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7821, 799, 95, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7822, 799, 96, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7823, 799, 97, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7824, 799, 98, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7825, 799, 99, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7826, 799, 101, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7827, 799, 102, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7828, 799, 103, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7829, 799, 104, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7830, 799, 106, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7831, 800, 51, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7832, 800, 53, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7833, 800, 54, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7834, 800, 56, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7835, 800, 57, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7836, 800, 59, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7837, 800, 60, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7838, 800, 61, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7839, 800, 62, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7840, 800, 63, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7841, 800, 64, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7842, 800, 65, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7843, 800, 66, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7844, 800, 67, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7845, 800, 68, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7846, 800, 69, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7847, 800, 70, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7848, 801, 84, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7849, 801, 85, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7850, 801, 86, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7851, 801, 91, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7852, 801, 93, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7853, 801, 100, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7854, 801, 105, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7855, 802, 78, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7856, 802, 79, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7857, 802, 81, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7858, 802, 82, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7859, 802, 83, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7860, 802, 87, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7861, 802, 88, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7862, 802, 89, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7863, 802, 90, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7864, 802, 92, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7865, 802, 95, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7866, 802, 96, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7867, 802, 97, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7868, 802, 98, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7869, 802, 99, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7870, 802, 101, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7871, 802, 102, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7872, 802, 103, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7873, 802, 104, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7874, 802, 106, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7875, 803, 51, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7876, 803, 53, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7877, 803, 54, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7878, 803, 56, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7879, 803, 57, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7880, 803, 59, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7881, 803, 60, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7882, 803, 61, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7883, 803, 62, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7884, 803, 63, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7885, 803, 64, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7886, 803, 65, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7887, 803, 66, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7888, 803, 67, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7889, 803, 68, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7890, 803, 69, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7891, 803, 70, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7892, 804, 51, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7893, 804, 53, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7894, 804, 54, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7895, 804, 56, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7896, 804, 57, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7897, 804, 59, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7898, 804, 60, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7899, 804, 61, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7900, 804, 62, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7901, 804, 63, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7902, 804, 64, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7903, 804, 65, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7904, 804, 66, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7905, 804, 67, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7906, 804, 68, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7907, 804, 69, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7908, 804, 70, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7909, 805, 6, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7910, 805, 7, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7911, 805, 8, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7912, 805, 12, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7913, 805, 13, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7914, 805, 14, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7915, 805, 15, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7916, 806, 78, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7917, 806, 79, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7918, 806, 81, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7919, 806, 82, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7920, 806, 83, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7921, 806, 87, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7922, 806, 88, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7923, 806, 89, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7924, 806, 90, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7925, 806, 92, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7926, 806, 95, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7927, 806, 96, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7928, 806, 97, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7929, 806, 98, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7930, 806, 99, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7931, 806, 101, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7932, 806, 102, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7933, 806, 103, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7934, 806, 104, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7935, 806, 106, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7936, 807, 6, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7937, 807, 7, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7938, 807, 8, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7939, 807, 12, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7940, 807, 13, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7941, 807, 14, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7942, 808, 78, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7943, 808, 79, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7944, 808, 81, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7945, 808, 82, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7946, 808, 83, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7947, 808, 87, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7948, 808, 88, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7949, 808, 89, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7950, 808, 90, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7951, 808, 92, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7952, 808, 95, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7953, 808, 96, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7954, 808, 97, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7955, 808, 98, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7956, 808, 99, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7957, 808, 101, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7958, 808, 102, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7959, 808, 103, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7960, 808, 104, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7961, 808, 106, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7962, 809, 2, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7963, 809, 3, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7964, 809, 4, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7965, 809, 5, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7966, 809, 16, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7967, 809, 17, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7968, 810, 51, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7969, 810, 53, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7970, 810, 54, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7971, 810, 56, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7972, 810, 57, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7973, 810, 59, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7974, 810, 60, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7975, 810, 61, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7976, 810, 62, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7977, 810, 63, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7978, 810, 64, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7979, 810, 65, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7980, 810, 66, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7981, 810, 67, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7982, 810, 68, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7983, 810, 69, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7984, 810, 70, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7985, 811, 51, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7986, 811, 53, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7987, 811, 54, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7988, 811, 56, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7989, 811, 57, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7990, 811, 59, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7991, 811, 60, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7992, 811, 61, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7993, 811, 62, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7994, 811, 63, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7995, 811, 64, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7996, 811, 65, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7997, 811, 66, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7998, 811, 67, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (7999, 811, 68, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8000, 811, 69, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8001, 811, 70, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8002, 812, 2, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8003, 812, 3, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8004, 812, 4, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8005, 812, 5, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8006, 812, 16, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8007, 812, 17, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8008, 813, 78, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8009, 813, 79, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8010, 813, 81, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8011, 813, 82, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8012, 813, 83, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8013, 813, 87, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8014, 813, 88, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8015, 813, 89, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8016, 813, 90, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8017, 813, 92, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8018, 813, 95, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8019, 813, 96, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8020, 813, 97, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8021, 813, 98, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8022, 813, 99, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8023, 813, 101, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8024, 813, 102, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8025, 813, 103, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8026, 813, 104, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8027, 813, 106, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8028, 815, 58, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8029, 814, 84, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8030, 814, 85, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8031, 814, 86, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8032, 814, 91, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8033, 814, 93, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8034, 814, 100, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8035, 814, 105, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8036, 816, 51, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8037, 816, 53, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8038, 816, 54, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8039, 816, 56, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8040, 816, 57, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8041, 816, 59, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8042, 816, 60, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8043, 816, 61, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8044, 816, 62, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8045, 816, 63, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8046, 816, 64, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8047, 816, 65, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8048, 816, 66, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8049, 816, 67, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8050, 816, 68, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8051, 816, 69, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8052, 816, 70, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8053, 817, 84, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8054, 817, 85, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8055, 817, 86, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8056, 817, 91, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8057, 817, 93, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8058, 817, 100, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8059, 817, 105, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8060, 818, 51, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8061, 818, 53, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8062, 818, 54, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8063, 818, 56, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8064, 818, 57, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8065, 818, 59, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8066, 818, 60, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8067, 818, 61, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8068, 818, 62, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8069, 818, 63, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8070, 818, 64, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8071, 818, 65, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8072, 818, 66, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8073, 818, 67, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8074, 818, 68, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8075, 818, 69, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8076, 818, 70, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8077, 819, 78, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8078, 819, 79, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8079, 819, 81, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8080, 819, 82, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8081, 819, 83, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8082, 819, 87, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8083, 819, 88, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8084, 819, 89, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8085, 819, 90, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8086, 819, 92, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8087, 819, 95, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8088, 819, 96, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8089, 819, 97, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8090, 819, 98, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8091, 819, 99, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8092, 819, 101, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8093, 819, 102, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8094, 819, 103, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8095, 819, 104, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8096, 819, 106, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8097, 820, 51, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8098, 820, 53, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8099, 820, 54, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8100, 820, 56, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8101, 820, 57, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8102, 820, 59, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8103, 820, 60, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8104, 820, 61, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8105, 820, 62, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8106, 820, 63, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8107, 820, 64, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8108, 820, 65, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8109, 820, 66, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8110, 820, 67, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8111, 820, 68, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8112, 820, 69, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8113, 820, 70, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8114, 821, 78, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8115, 821, 79, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8116, 821, 81, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8117, 821, 82, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8118, 821, 83, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8119, 821, 87, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8120, 821, 88, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8121, 821, 89, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8122, 821, 90, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8123, 821, 92, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8124, 821, 95, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8125, 821, 96, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8126, 821, 97, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8127, 821, 98, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8128, 821, 99, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8129, 821, 101, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8130, 821, 102, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8131, 821, 103, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8132, 821, 104, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8133, 821, 106, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8134, 822, 78, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8135, 822, 79, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8136, 822, 81, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8137, 822, 82, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8138, 822, 83, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8139, 822, 87, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8140, 822, 88, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8141, 822, 89, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8142, 822, 90, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8143, 822, 92, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8144, 822, 95, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8145, 822, 96, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8146, 822, 97, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8147, 822, 98, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8148, 822, 99, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8149, 822, 101, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8150, 822, 102, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8151, 822, 103, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8152, 822, 104, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8153, 822, 106, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8154, 823, 51, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8155, 823, 53, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8156, 823, 54, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8157, 823, 56, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8158, 823, 57, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8159, 823, 59, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8160, 823, 60, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8161, 823, 61, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8162, 823, 62, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8163, 823, 63, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8164, 823, 64, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8165, 823, 65, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8166, 823, 66, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8167, 823, 67, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8168, 823, 68, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8169, 823, 69, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8170, 823, 70, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8171, 825, 84, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8172, 825, 85, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8173, 825, 86, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8174, 825, 91, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8175, 825, 93, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8176, 825, 100, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8177, 825, 105, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8178, 824, 78, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8179, 824, 79, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8180, 824, 81, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8181, 824, 82, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8182, 824, 83, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8183, 824, 87, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8184, 824, 88, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8185, 824, 89, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8186, 824, 90, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8187, 824, 92, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8188, 824, 95, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8189, 824, 96, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8190, 824, 97, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8191, 824, 98, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8192, 824, 99, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8193, 824, 101, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8194, 824, 102, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8195, 824, 103, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8196, 824, 104, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8197, 824, 106, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8198, 826, 78, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8199, 826, 79, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8200, 826, 81, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8201, 826, 82, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8202, 826, 83, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8203, 826, 87, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8204, 826, 88, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8205, 826, 89, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8206, 826, 90, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8207, 826, 92, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8208, 826, 95, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8209, 826, 96, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8210, 826, 97, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8211, 826, 98, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8212, 826, 99, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8213, 826, 101, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8214, 826, 102, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8215, 826, 103, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8216, 826, 104, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8217, 826, 106, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8218, 827, 51, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8219, 827, 53, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8220, 827, 54, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8221, 827, 56, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8222, 827, 57, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8223, 827, 59, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8224, 827, 60, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8225, 827, 61, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8226, 827, 62, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8227, 827, 63, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8228, 827, 64, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8229, 827, 65, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8230, 827, 66, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8231, 827, 67, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8232, 827, 68, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8233, 827, 69, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8234, 827, 70, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8235, 828, 51, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8236, 828, 53, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8237, 828, 54, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8238, 828, 56, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8239, 828, 57, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8240, 828, 59, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8241, 828, 60, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8242, 828, 61, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8243, 828, 62, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8244, 828, 63, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8245, 828, 64, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8246, 828, 65, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8247, 828, 66, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8248, 828, 67, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8249, 828, 68, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8250, 828, 69, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8251, 828, 70, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8252, 829, 51, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8253, 829, 53, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8254, 829, 54, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8255, 829, 56, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8256, 829, 57, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8257, 829, 59, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8258, 829, 60, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8259, 829, 61, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8260, 829, 62, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8261, 829, 63, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8262, 829, 64, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8263, 829, 65, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8264, 829, 66, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8265, 829, 67, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8266, 829, 68, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8267, 829, 69, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8268, 829, 70, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8269, 830, 78, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8270, 830, 79, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8271, 830, 81, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8272, 830, 82, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8273, 830, 83, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8274, 830, 87, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8275, 830, 88, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8276, 830, 89, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8277, 830, 90, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8278, 830, 92, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8279, 830, 95, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8280, 830, 96, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8281, 830, 97, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8282, 830, 98, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8283, 830, 99, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8284, 830, 101, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8285, 830, 102, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8286, 830, 103, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8287, 830, 104, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8288, 830, 106, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8289, 831, 51, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8290, 831, 53, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8291, 831, 54, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8292, 831, 56, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8293, 831, 57, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8294, 831, 59, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8295, 831, 60, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8296, 831, 61, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8297, 831, 62, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8298, 831, 63, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8299, 831, 64, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8300, 831, 65, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8301, 831, 66, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8302, 831, 67, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8303, 831, 68, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8304, 831, 69, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8305, 831, 70, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8306, 832, 51, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8307, 832, 53, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8308, 832, 54, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8309, 832, 56, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8310, 832, 57, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8311, 832, 59, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8312, 832, 60, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8313, 832, 61, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8314, 832, 62, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8315, 832, 63, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8316, 832, 64, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8317, 832, 65, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8318, 832, 66, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8319, 832, 67, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8320, 832, 68, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8321, 832, 69, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8322, 832, 70, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8323, 833, 51, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8324, 833, 53, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8325, 833, 54, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8326, 833, 56, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8327, 833, 57, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8328, 833, 59, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8329, 833, 60, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8330, 833, 61, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8331, 833, 62, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8332, 833, 63, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8333, 833, 64, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8334, 833, 65, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8335, 833, 66, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8336, 833, 67, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8337, 833, 68, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8338, 833, 69, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8339, 833, 70, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8340, 834, 51, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8341, 834, 53, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8342, 834, 54, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8343, 834, 56, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8344, 834, 57, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8345, 834, 59, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8346, 834, 60, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8347, 834, 61, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8348, 834, 62, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8349, 834, 63, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8350, 834, 64, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8351, 834, 65, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8352, 834, 66, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8353, 834, 67, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8354, 834, 68, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8355, 834, 69, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8356, 834, 70, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8357, 835, 51, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8358, 835, 53, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8359, 835, 54, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8360, 835, 56, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8361, 835, 57, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8362, 835, 59, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8363, 835, 60, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8364, 835, 61, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8365, 835, 62, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8366, 835, 63, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8367, 835, 64, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8368, 835, 65, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8369, 835, 66, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8370, 835, 67, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8371, 835, 68, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8372, 835, 69, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8373, 835, 70, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8374, 836, 84, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8375, 836, 85, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8376, 836, 86, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8377, 836, 91, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8378, 836, 93, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8379, 836, 100, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8380, 836, 105, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8381, 837, 78, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8382, 837, 79, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8383, 837, 81, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8384, 837, 82, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8385, 837, 83, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8386, 837, 87, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8387, 837, 88, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8388, 837, 89, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8389, 837, 90, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8390, 837, 92, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8391, 837, 95, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8392, 837, 96, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8393, 837, 97, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8394, 837, 98, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8395, 837, 99, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8396, 837, 101, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8397, 837, 102, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8398, 837, 103, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8399, 837, 104, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8400, 837, 106, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8401, 838, 78, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8402, 838, 79, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8403, 838, 81, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8404, 838, 82, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8405, 838, 83, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8406, 838, 87, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8407, 838, 88, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8408, 838, 89, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8409, 838, 90, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8410, 838, 92, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8411, 838, 95, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8412, 838, 96, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8413, 838, 97, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8414, 838, 98, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8415, 838, 99, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8416, 838, 101, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8417, 838, 102, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8418, 838, 103, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8419, 838, 104, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8420, 838, 106, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8421, 839, 78, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8422, 839, 79, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8423, 839, 81, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8424, 839, 82, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8425, 839, 83, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8426, 839, 87, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8427, 839, 88, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8428, 839, 89, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8429, 839, 90, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8430, 839, 92, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8431, 839, 95, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8432, 839, 96, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8433, 839, 97, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8434, 839, 98, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8435, 839, 99, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8436, 839, 101, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8437, 839, 102, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8438, 839, 103, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8439, 839, 104, '0');
INSERT INTO `sys_patrol_patrol_point_status` VALUES (8440, 839, 106, '0');

-- ----------------------------
-- Table structure for sys_patrol_personnel
-- ----------------------------
DROP TABLE IF EXISTS `sys_patrol_personnel`;
CREATE TABLE `sys_patrol_personnel`  (
  `patrol_id` bigint(20) NOT NULL COMMENT '巡更任务编号',
  `personnel_id` bigint(20) NOT NULL COMMENT '员工编号',
  PRIMARY KEY (`patrol_id`, `personnel_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_patrol_personnel
-- ----------------------------
INSERT INTO `sys_patrol_personnel` VALUES (282, 28);
INSERT INTO `sys_patrol_personnel` VALUES (296, 11);
INSERT INTO `sys_patrol_personnel` VALUES (297, 12);
INSERT INTO `sys_patrol_personnel` VALUES (298, 6);
INSERT INTO `sys_patrol_personnel` VALUES (299, 7);
INSERT INTO `sys_patrol_personnel` VALUES (300, 8);
INSERT INTO `sys_patrol_personnel` VALUES (301, 13);
INSERT INTO `sys_patrol_personnel` VALUES (302, 14);
INSERT INTO `sys_patrol_personnel` VALUES (303, 15);
INSERT INTO `sys_patrol_personnel` VALUES (304, 9);
INSERT INTO `sys_patrol_personnel` VALUES (305, 19);
INSERT INTO `sys_patrol_personnel` VALUES (306, 17);
INSERT INTO `sys_patrol_personnel` VALUES (307, 18);
INSERT INTO `sys_patrol_personnel` VALUES (308, 16);
INSERT INTO `sys_patrol_personnel` VALUES (322, 20);
INSERT INTO `sys_patrol_personnel` VALUES (329, 10);
INSERT INTO `sys_patrol_personnel` VALUES (379, 14);
INSERT INTO `sys_patrol_personnel` VALUES (380, 11);
INSERT INTO `sys_patrol_personnel` VALUES (381, 12);
INSERT INTO `sys_patrol_personnel` VALUES (382, 6);
INSERT INTO `sys_patrol_personnel` VALUES (383, 7);
INSERT INTO `sys_patrol_personnel` VALUES (384, 8);
INSERT INTO `sys_patrol_personnel` VALUES (385, 13);
INSERT INTO `sys_patrol_personnel` VALUES (386, 14);
INSERT INTO `sys_patrol_personnel` VALUES (387, 15);
INSERT INTO `sys_patrol_personnel` VALUES (388, 9);
INSERT INTO `sys_patrol_personnel` VALUES (389, 19);
INSERT INTO `sys_patrol_personnel` VALUES (390, 17);
INSERT INTO `sys_patrol_personnel` VALUES (391, 18);
INSERT INTO `sys_patrol_personnel` VALUES (392, 16);
INSERT INTO `sys_patrol_personnel` VALUES (393, 10);
INSERT INTO `sys_patrol_personnel` VALUES (394, 14);
INSERT INTO `sys_patrol_personnel` VALUES (400, 13);
INSERT INTO `sys_patrol_personnel` VALUES (401, 8);
INSERT INTO `sys_patrol_personnel` VALUES (402, 16);
INSERT INTO `sys_patrol_personnel` VALUES (403, 18);
INSERT INTO `sys_patrol_personnel` VALUES (405, 17);
INSERT INTO `sys_patrol_personnel` VALUES (406, 15);
INSERT INTO `sys_patrol_personnel` VALUES (407, 8);
INSERT INTO `sys_patrol_personnel` VALUES (414, 19);
INSERT INTO `sys_patrol_personnel` VALUES (415, 14);
INSERT INTO `sys_patrol_personnel` VALUES (419, 17);
INSERT INTO `sys_patrol_personnel` VALUES (424, 14);
INSERT INTO `sys_patrol_personnel` VALUES (425, 8);
INSERT INTO `sys_patrol_personnel` VALUES (426, 13);
INSERT INTO `sys_patrol_personnel` VALUES (428, 15);
INSERT INTO `sys_patrol_personnel` VALUES (429, 19);
INSERT INTO `sys_patrol_personnel` VALUES (431, 18);
INSERT INTO `sys_patrol_personnel` VALUES (432, 16);
INSERT INTO `sys_patrol_personnel` VALUES (439, 17);
INSERT INTO `sys_patrol_personnel` VALUES (442, 14);
INSERT INTO `sys_patrol_personnel` VALUES (447, 18);
INSERT INTO `sys_patrol_personnel` VALUES (448, 19);
INSERT INTO `sys_patrol_personnel` VALUES (449, 15);
INSERT INTO `sys_patrol_personnel` VALUES (450, 8);
INSERT INTO `sys_patrol_personnel` VALUES (451, 13);
INSERT INTO `sys_patrol_personnel` VALUES (452, 16);
INSERT INTO `sys_patrol_personnel` VALUES (453, 13);
INSERT INTO `sys_patrol_personnel` VALUES (454, 7);
INSERT INTO `sys_patrol_personnel` VALUES (455, 14);
INSERT INTO `sys_patrol_personnel` VALUES (456, 19);
INSERT INTO `sys_patrol_personnel` VALUES (457, 15);
INSERT INTO `sys_patrol_personnel` VALUES (458, 8);
INSERT INTO `sys_patrol_personnel` VALUES (459, 12);
INSERT INTO `sys_patrol_personnel` VALUES (460, 6);
INSERT INTO `sys_patrol_personnel` VALUES (461, 11);
INSERT INTO `sys_patrol_personnel` VALUES (462, 17);
INSERT INTO `sys_patrol_personnel` VALUES (463, 14);
INSERT INTO `sys_patrol_personnel` VALUES (464, 18);
INSERT INTO `sys_patrol_personnel` VALUES (465, 16);
INSERT INTO `sys_patrol_personnel` VALUES (476, 17);
INSERT INTO `sys_patrol_personnel` VALUES (478, 14);
INSERT INTO `sys_patrol_personnel` VALUES (479, 13);
INSERT INTO `sys_patrol_personnel` VALUES (480, 8);
INSERT INTO `sys_patrol_personnel` VALUES (481, 15);
INSERT INTO `sys_patrol_personnel` VALUES (482, 10);
INSERT INTO `sys_patrol_personnel` VALUES (483, 18);
INSERT INTO `sys_patrol_personnel` VALUES (484, 16);
INSERT INTO `sys_patrol_personnel` VALUES (485, 9);
INSERT INTO `sys_patrol_personnel` VALUES (487, 19);
INSERT INTO `sys_patrol_personnel` VALUES (488, 13);
INSERT INTO `sys_patrol_personnel` VALUES (489, 18);
INSERT INTO `sys_patrol_personnel` VALUES (490, 15);
INSERT INTO `sys_patrol_personnel` VALUES (491, 19);
INSERT INTO `sys_patrol_personnel` VALUES (492, 17);
INSERT INTO `sys_patrol_personnel` VALUES (493, 8);
INSERT INTO `sys_patrol_personnel` VALUES (494, 16);
INSERT INTO `sys_patrol_personnel` VALUES (495, 14);
INSERT INTO `sys_patrol_personnel` VALUES (496, 15);
INSERT INTO `sys_patrol_personnel` VALUES (497, 8);
INSERT INTO `sys_patrol_personnel` VALUES (498, 18);
INSERT INTO `sys_patrol_personnel` VALUES (499, 16);
INSERT INTO `sys_patrol_personnel` VALUES (500, 14);
INSERT INTO `sys_patrol_personnel` VALUES (501, 13);
INSERT INTO `sys_patrol_personnel` VALUES (502, 17);
INSERT INTO `sys_patrol_personnel` VALUES (503, 19);
INSERT INTO `sys_patrol_personnel` VALUES (504, 14);
INSERT INTO `sys_patrol_personnel` VALUES (505, 8);
INSERT INTO `sys_patrol_personnel` VALUES (506, 16);
INSERT INTO `sys_patrol_personnel` VALUES (507, 15);
INSERT INTO `sys_patrol_personnel` VALUES (508, 19);
INSERT INTO `sys_patrol_personnel` VALUES (509, 13);
INSERT INTO `sys_patrol_personnel` VALUES (510, 18);
INSERT INTO `sys_patrol_personnel` VALUES (511, 17);
INSERT INTO `sys_patrol_personnel` VALUES (512, 13);
INSERT INTO `sys_patrol_personnel` VALUES (513, 8);
INSERT INTO `sys_patrol_personnel` VALUES (514, 17);
INSERT INTO `sys_patrol_personnel` VALUES (515, 16);
INSERT INTO `sys_patrol_personnel` VALUES (516, 15);
INSERT INTO `sys_patrol_personnel` VALUES (517, 19);
INSERT INTO `sys_patrol_personnel` VALUES (518, 18);
INSERT INTO `sys_patrol_personnel` VALUES (519, 14);
INSERT INTO `sys_patrol_personnel` VALUES (520, 13);
INSERT INTO `sys_patrol_personnel` VALUES (521, 8);
INSERT INTO `sys_patrol_personnel` VALUES (522, 14);
INSERT INTO `sys_patrol_personnel` VALUES (523, 18);
INSERT INTO `sys_patrol_personnel` VALUES (524, 17);
INSERT INTO `sys_patrol_personnel` VALUES (525, 19);
INSERT INTO `sys_patrol_personnel` VALUES (526, 15);
INSERT INTO `sys_patrol_personnel` VALUES (527, 16);
INSERT INTO `sys_patrol_personnel` VALUES (528, 6);
INSERT INTO `sys_patrol_personnel` VALUES (529, 11);
INSERT INTO `sys_patrol_personnel` VALUES (530, 8);
INSERT INTO `sys_patrol_personnel` VALUES (531, 17);
INSERT INTO `sys_patrol_personnel` VALUES (532, 13);
INSERT INTO `sys_patrol_personnel` VALUES (533, 14);
INSERT INTO `sys_patrol_personnel` VALUES (534, 15);
INSERT INTO `sys_patrol_personnel` VALUES (535, 12);
INSERT INTO `sys_patrol_personnel` VALUES (536, 19);
INSERT INTO `sys_patrol_personnel` VALUES (537, 7);
INSERT INTO `sys_patrol_personnel` VALUES (538, 16);
INSERT INTO `sys_patrol_personnel` VALUES (539, 14);
INSERT INTO `sys_patrol_personnel` VALUES (540, 18);
INSERT INTO `sys_patrol_personnel` VALUES (541, 8);
INSERT INTO `sys_patrol_personnel` VALUES (542, 18);
INSERT INTO `sys_patrol_personnel` VALUES (543, 13);
INSERT INTO `sys_patrol_personnel` VALUES (544, 17);
INSERT INTO `sys_patrol_personnel` VALUES (545, 14);
INSERT INTO `sys_patrol_personnel` VALUES (546, 16);
INSERT INTO `sys_patrol_personnel` VALUES (547, 19);
INSERT INTO `sys_patrol_personnel` VALUES (548, 15);
INSERT INTO `sys_patrol_personnel` VALUES (549, 8);
INSERT INTO `sys_patrol_personnel` VALUES (550, 19);
INSERT INTO `sys_patrol_personnel` VALUES (551, 14);
INSERT INTO `sys_patrol_personnel` VALUES (552, 17);
INSERT INTO `sys_patrol_personnel` VALUES (553, 15);
INSERT INTO `sys_patrol_personnel` VALUES (554, 16);
INSERT INTO `sys_patrol_personnel` VALUES (555, 13);
INSERT INTO `sys_patrol_personnel` VALUES (556, 18);
INSERT INTO `sys_patrol_personnel` VALUES (557, 14);
INSERT INTO `sys_patrol_personnel` VALUES (558, 8);
INSERT INTO `sys_patrol_personnel` VALUES (559, 13);
INSERT INTO `sys_patrol_personnel` VALUES (560, 16);
INSERT INTO `sys_patrol_personnel` VALUES (561, 18);
INSERT INTO `sys_patrol_personnel` VALUES (562, 19);
INSERT INTO `sys_patrol_personnel` VALUES (563, 15);
INSERT INTO `sys_patrol_personnel` VALUES (564, 17);
INSERT INTO `sys_patrol_personnel` VALUES (565, 15);
INSERT INTO `sys_patrol_personnel` VALUES (566, 17);
INSERT INTO `sys_patrol_personnel` VALUES (567, 13);
INSERT INTO `sys_patrol_personnel` VALUES (568, 19);
INSERT INTO `sys_patrol_personnel` VALUES (569, 14);
INSERT INTO `sys_patrol_personnel` VALUES (570, 16);
INSERT INTO `sys_patrol_personnel` VALUES (571, 18);
INSERT INTO `sys_patrol_personnel` VALUES (572, 8);
INSERT INTO `sys_patrol_personnel` VALUES (573, 8);
INSERT INTO `sys_patrol_personnel` VALUES (574, 14);
INSERT INTO `sys_patrol_personnel` VALUES (575, 13);
INSERT INTO `sys_patrol_personnel` VALUES (576, 18);
INSERT INTO `sys_patrol_personnel` VALUES (577, 19);
INSERT INTO `sys_patrol_personnel` VALUES (578, 15);
INSERT INTO `sys_patrol_personnel` VALUES (579, 16);
INSERT INTO `sys_patrol_personnel` VALUES (580, 17);
INSERT INTO `sys_patrol_personnel` VALUES (581, 8);
INSERT INTO `sys_patrol_personnel` VALUES (582, 13);
INSERT INTO `sys_patrol_personnel` VALUES (583, 14);
INSERT INTO `sys_patrol_personnel` VALUES (584, 17);
INSERT INTO `sys_patrol_personnel` VALUES (585, 15);
INSERT INTO `sys_patrol_personnel` VALUES (586, 19);
INSERT INTO `sys_patrol_personnel` VALUES (587, 18);
INSERT INTO `sys_patrol_personnel` VALUES (588, 16);
INSERT INTO `sys_patrol_personnel` VALUES (589, 11);
INSERT INTO `sys_patrol_personnel` VALUES (590, 12);
INSERT INTO `sys_patrol_personnel` VALUES (591, 6);
INSERT INTO `sys_patrol_personnel` VALUES (592, 7);
INSERT INTO `sys_patrol_personnel` VALUES (593, 8);
INSERT INTO `sys_patrol_personnel` VALUES (594, 13);
INSERT INTO `sys_patrol_personnel` VALUES (595, 14);
INSERT INTO `sys_patrol_personnel` VALUES (596, 15);
INSERT INTO `sys_patrol_personnel` VALUES (597, 19);
INSERT INTO `sys_patrol_personnel` VALUES (598, 17);
INSERT INTO `sys_patrol_personnel` VALUES (599, 14);
INSERT INTO `sys_patrol_personnel` VALUES (600, 16);
INSERT INTO `sys_patrol_personnel` VALUES (601, 18);
INSERT INTO `sys_patrol_personnel` VALUES (602, 8);
INSERT INTO `sys_patrol_personnel` VALUES (603, 13);
INSERT INTO `sys_patrol_personnel` VALUES (604, 14);
INSERT INTO `sys_patrol_personnel` VALUES (605, 15);
INSERT INTO `sys_patrol_personnel` VALUES (606, 18);
INSERT INTO `sys_patrol_personnel` VALUES (607, 17);
INSERT INTO `sys_patrol_personnel` VALUES (608, 19);
INSERT INTO `sys_patrol_personnel` VALUES (609, 16);
INSERT INTO `sys_patrol_personnel` VALUES (610, 8);
INSERT INTO `sys_patrol_personnel` VALUES (611, 13);
INSERT INTO `sys_patrol_personnel` VALUES (612, 14);
INSERT INTO `sys_patrol_personnel` VALUES (613, 15);
INSERT INTO `sys_patrol_personnel` VALUES (614, 17);
INSERT INTO `sys_patrol_personnel` VALUES (615, 19);
INSERT INTO `sys_patrol_personnel` VALUES (616, 18);
INSERT INTO `sys_patrol_personnel` VALUES (617, 16);
INSERT INTO `sys_patrol_personnel` VALUES (618, 18);
INSERT INTO `sys_patrol_personnel` VALUES (619, 14);
INSERT INTO `sys_patrol_personnel` VALUES (620, 8);
INSERT INTO `sys_patrol_personnel` VALUES (621, 9);
INSERT INTO `sys_patrol_personnel` VALUES (622, 13);
INSERT INTO `sys_patrol_personnel` VALUES (623, 10);
INSERT INTO `sys_patrol_personnel` VALUES (624, 16);
INSERT INTO `sys_patrol_personnel` VALUES (625, 17);
INSERT INTO `sys_patrol_personnel` VALUES (626, 15);
INSERT INTO `sys_patrol_personnel` VALUES (627, 19);
INSERT INTO `sys_patrol_personnel` VALUES (634, 16);
INSERT INTO `sys_patrol_personnel` VALUES (636, 18);
INSERT INTO `sys_patrol_personnel` VALUES (637, 13);
INSERT INTO `sys_patrol_personnel` VALUES (638, 14);
INSERT INTO `sys_patrol_personnel` VALUES (639, 8);
INSERT INTO `sys_patrol_personnel` VALUES (640, 15);
INSERT INTO `sys_patrol_personnel` VALUES (641, 19);
INSERT INTO `sys_patrol_personnel` VALUES (644, 17);
INSERT INTO `sys_patrol_personnel` VALUES (645, 15);
INSERT INTO `sys_patrol_personnel` VALUES (646, 8);
INSERT INTO `sys_patrol_personnel` VALUES (647, 19);
INSERT INTO `sys_patrol_personnel` VALUES (648, 17);
INSERT INTO `sys_patrol_personnel` VALUES (649, 13);
INSERT INTO `sys_patrol_personnel` VALUES (650, 14);
INSERT INTO `sys_patrol_personnel` VALUES (651, 18);
INSERT INTO `sys_patrol_personnel` VALUES (652, 16);
INSERT INTO `sys_patrol_personnel` VALUES (653, 8);
INSERT INTO `sys_patrol_personnel` VALUES (654, 14);
INSERT INTO `sys_patrol_personnel` VALUES (655, 13);
INSERT INTO `sys_patrol_personnel` VALUES (656, 19);
INSERT INTO `sys_patrol_personnel` VALUES (657, 16);
INSERT INTO `sys_patrol_personnel` VALUES (658, 18);
INSERT INTO `sys_patrol_personnel` VALUES (659, 15);
INSERT INTO `sys_patrol_personnel` VALUES (660, 17);
INSERT INTO `sys_patrol_personnel` VALUES (661, 11);
INSERT INTO `sys_patrol_personnel` VALUES (662, 12);
INSERT INTO `sys_patrol_personnel` VALUES (663, 6);
INSERT INTO `sys_patrol_personnel` VALUES (664, 7);
INSERT INTO `sys_patrol_personnel` VALUES (665, 19);
INSERT INTO `sys_patrol_personnel` VALUES (666, 14);
INSERT INTO `sys_patrol_personnel` VALUES (667, 13);
INSERT INTO `sys_patrol_personnel` VALUES (668, 15);
INSERT INTO `sys_patrol_personnel` VALUES (669, 17);
INSERT INTO `sys_patrol_personnel` VALUES (670, 8);
INSERT INTO `sys_patrol_personnel` VALUES (671, 18);
INSERT INTO `sys_patrol_personnel` VALUES (672, 16);
INSERT INTO `sys_patrol_personnel` VALUES (673, 14);
INSERT INTO `sys_patrol_personnel` VALUES (674, 14);
INSERT INTO `sys_patrol_personnel` VALUES (675, 13);
INSERT INTO `sys_patrol_personnel` VALUES (676, 8);
INSERT INTO `sys_patrol_personnel` VALUES (677, 19);
INSERT INTO `sys_patrol_personnel` VALUES (678, 18);
INSERT INTO `sys_patrol_personnel` VALUES (679, 16);
INSERT INTO `sys_patrol_personnel` VALUES (680, 15);
INSERT INTO `sys_patrol_personnel` VALUES (681, 17);
INSERT INTO `sys_patrol_personnel` VALUES (682, 13);
INSERT INTO `sys_patrol_personnel` VALUES (683, 16);
INSERT INTO `sys_patrol_personnel` VALUES (684, 8);
INSERT INTO `sys_patrol_personnel` VALUES (685, 19);
INSERT INTO `sys_patrol_personnel` VALUES (686, 17);
INSERT INTO `sys_patrol_personnel` VALUES (687, 14);
INSERT INTO `sys_patrol_personnel` VALUES (688, 18);
INSERT INTO `sys_patrol_personnel` VALUES (689, 15);
INSERT INTO `sys_patrol_personnel` VALUES (690, 8);
INSERT INTO `sys_patrol_personnel` VALUES (691, 13);
INSERT INTO `sys_patrol_personnel` VALUES (692, 14);
INSERT INTO `sys_patrol_personnel` VALUES (693, 17);
INSERT INTO `sys_patrol_personnel` VALUES (694, 19);
INSERT INTO `sys_patrol_personnel` VALUES (695, 16);
INSERT INTO `sys_patrol_personnel` VALUES (696, 15);
INSERT INTO `sys_patrol_personnel` VALUES (697, 18);
INSERT INTO `sys_patrol_personnel` VALUES (698, 13);
INSERT INTO `sys_patrol_personnel` VALUES (699, 15);
INSERT INTO `sys_patrol_personnel` VALUES (700, 8);
INSERT INTO `sys_patrol_personnel` VALUES (701, 14);
INSERT INTO `sys_patrol_personnel` VALUES (702, 19);
INSERT INTO `sys_patrol_personnel` VALUES (703, 16);
INSERT INTO `sys_patrol_personnel` VALUES (704, 17);
INSERT INTO `sys_patrol_personnel` VALUES (705, 18);
INSERT INTO `sys_patrol_personnel` VALUES (706, 16);
INSERT INTO `sys_patrol_personnel` VALUES (707, 13);
INSERT INTO `sys_patrol_personnel` VALUES (708, 14);
INSERT INTO `sys_patrol_personnel` VALUES (709, 15);
INSERT INTO `sys_patrol_personnel` VALUES (710, 18);
INSERT INTO `sys_patrol_personnel` VALUES (711, 8);
INSERT INTO `sys_patrol_personnel` VALUES (712, 17);
INSERT INTO `sys_patrol_personnel` VALUES (713, 19);
INSERT INTO `sys_patrol_personnel` VALUES (714, 13);
INSERT INTO `sys_patrol_personnel` VALUES (715, 8);
INSERT INTO `sys_patrol_personnel` VALUES (716, 15);
INSERT INTO `sys_patrol_personnel` VALUES (717, 19);
INSERT INTO `sys_patrol_personnel` VALUES (718, 14);
INSERT INTO `sys_patrol_personnel` VALUES (719, 17);
INSERT INTO `sys_patrol_personnel` VALUES (720, 16);
INSERT INTO `sys_patrol_personnel` VALUES (721, 18);
INSERT INTO `sys_patrol_personnel` VALUES (722, 11);
INSERT INTO `sys_patrol_personnel` VALUES (723, 12);
INSERT INTO `sys_patrol_personnel` VALUES (724, 6);
INSERT INTO `sys_patrol_personnel` VALUES (725, 7);
INSERT INTO `sys_patrol_personnel` VALUES (726, 13);
INSERT INTO `sys_patrol_personnel` VALUES (727, 15);
INSERT INTO `sys_patrol_personnel` VALUES (728, 14);
INSERT INTO `sys_patrol_personnel` VALUES (729, 17);
INSERT INTO `sys_patrol_personnel` VALUES (730, 19);
INSERT INTO `sys_patrol_personnel` VALUES (731, 8);
INSERT INTO `sys_patrol_personnel` VALUES (732, 16);
INSERT INTO `sys_patrol_personnel` VALUES (733, 14);
INSERT INTO `sys_patrol_personnel` VALUES (734, 18);
INSERT INTO `sys_patrol_personnel` VALUES (735, 16);
INSERT INTO `sys_patrol_personnel` VALUES (736, 13);
INSERT INTO `sys_patrol_personnel` VALUES (737, 14);
INSERT INTO `sys_patrol_personnel` VALUES (738, 19);
INSERT INTO `sys_patrol_personnel` VALUES (739, 8);
INSERT INTO `sys_patrol_personnel` VALUES (740, 18);
INSERT INTO `sys_patrol_personnel` VALUES (741, 17);
INSERT INTO `sys_patrol_personnel` VALUES (742, 15);
INSERT INTO `sys_patrol_personnel` VALUES (747, 19);
INSERT INTO `sys_patrol_personnel` VALUES (748, 18);
INSERT INTO `sys_patrol_personnel` VALUES (749, 8);
INSERT INTO `sys_patrol_personnel` VALUES (750, 15);
INSERT INTO `sys_patrol_personnel` VALUES (751, 13);
INSERT INTO `sys_patrol_personnel` VALUES (752, 17);
INSERT INTO `sys_patrol_personnel` VALUES (753, 14);
INSERT INTO `sys_patrol_personnel` VALUES (756, 16);
INSERT INTO `sys_patrol_personnel` VALUES (764, 11);
INSERT INTO `sys_patrol_personnel` VALUES (765, 12);
INSERT INTO `sys_patrol_personnel` VALUES (766, 6);
INSERT INTO `sys_patrol_personnel` VALUES (767, 7);
INSERT INTO `sys_patrol_personnel` VALUES (768, 9);
INSERT INTO `sys_patrol_personnel` VALUES (769, 10);
INSERT INTO `sys_patrol_personnel` VALUES (770, 14);
INSERT INTO `sys_patrol_personnel` VALUES (771, 14);
INSERT INTO `sys_patrol_personnel` VALUES (772, 18);
INSERT INTO `sys_patrol_personnel` VALUES (773, 19);
INSERT INTO `sys_patrol_personnel` VALUES (774, 16);
INSERT INTO `sys_patrol_personnel` VALUES (775, 17);
INSERT INTO `sys_patrol_personnel` VALUES (776, 13);
INSERT INTO `sys_patrol_personnel` VALUES (777, 8);
INSERT INTO `sys_patrol_personnel` VALUES (778, 15);
INSERT INTO `sys_patrol_personnel` VALUES (779, 15);
INSERT INTO `sys_patrol_personnel` VALUES (780, 16);
INSERT INTO `sys_patrol_personnel` VALUES (781, 14);
INSERT INTO `sys_patrol_personnel` VALUES (782, 18);
INSERT INTO `sys_patrol_personnel` VALUES (783, 17);
INSERT INTO `sys_patrol_personnel` VALUES (784, 8);
INSERT INTO `sys_patrol_personnel` VALUES (785, 13);
INSERT INTO `sys_patrol_personnel` VALUES (786, 19);
INSERT INTO `sys_patrol_personnel` VALUES (787, 17);
INSERT INTO `sys_patrol_personnel` VALUES (788, 13);
INSERT INTO `sys_patrol_personnel` VALUES (789, 18);
INSERT INTO `sys_patrol_personnel` VALUES (790, 8);
INSERT INTO `sys_patrol_personnel` VALUES (791, 16);
INSERT INTO `sys_patrol_personnel` VALUES (792, 19);
INSERT INTO `sys_patrol_personnel` VALUES (793, 14);
INSERT INTO `sys_patrol_personnel` VALUES (794, 15);
INSERT INTO `sys_patrol_personnel` VALUES (795, 14);
INSERT INTO `sys_patrol_personnel` VALUES (796, 19);
INSERT INTO `sys_patrol_personnel` VALUES (797, 8);
INSERT INTO `sys_patrol_personnel` VALUES (798, 15);
INSERT INTO `sys_patrol_personnel` VALUES (799, 17);
INSERT INTO `sys_patrol_personnel` VALUES (800, 13);
INSERT INTO `sys_patrol_personnel` VALUES (801, 16);
INSERT INTO `sys_patrol_personnel` VALUES (802, 18);
INSERT INTO `sys_patrol_personnel` VALUES (803, 15);
INSERT INTO `sys_patrol_personnel` VALUES (804, 13);
INSERT INTO `sys_patrol_personnel` VALUES (805, 12);
INSERT INTO `sys_patrol_personnel` VALUES (806, 17);
INSERT INTO `sys_patrol_personnel` VALUES (807, 7);
INSERT INTO `sys_patrol_personnel` VALUES (808, 19);
INSERT INTO `sys_patrol_personnel` VALUES (809, 6);
INSERT INTO `sys_patrol_personnel` VALUES (810, 14);
INSERT INTO `sys_patrol_personnel` VALUES (811, 8);
INSERT INTO `sys_patrol_personnel` VALUES (812, 11);
INSERT INTO `sys_patrol_personnel` VALUES (813, 18);
INSERT INTO `sys_patrol_personnel` VALUES (814, 16);
INSERT INTO `sys_patrol_personnel` VALUES (815, 14);
INSERT INTO `sys_patrol_personnel` VALUES (816, 13);
INSERT INTO `sys_patrol_personnel` VALUES (817, 16);
INSERT INTO `sys_patrol_personnel` VALUES (818, 15);
INSERT INTO `sys_patrol_personnel` VALUES (819, 17);
INSERT INTO `sys_patrol_personnel` VALUES (820, 14);
INSERT INTO `sys_patrol_personnel` VALUES (821, 18);
INSERT INTO `sys_patrol_personnel` VALUES (822, 19);
INSERT INTO `sys_patrol_personnel` VALUES (823, 8);
INSERT INTO `sys_patrol_personnel` VALUES (824, 19);
INSERT INTO `sys_patrol_personnel` VALUES (825, 16);
INSERT INTO `sys_patrol_personnel` VALUES (826, 18);
INSERT INTO `sys_patrol_personnel` VALUES (827, 13);
INSERT INTO `sys_patrol_personnel` VALUES (828, 14);
INSERT INTO `sys_patrol_personnel` VALUES (829, 15);
INSERT INTO `sys_patrol_personnel` VALUES (830, 17);
INSERT INTO `sys_patrol_personnel` VALUES (831, 8);
INSERT INTO `sys_patrol_personnel` VALUES (832, 13);
INSERT INTO `sys_patrol_personnel` VALUES (833, 14);
INSERT INTO `sys_patrol_personnel` VALUES (834, 8);
INSERT INTO `sys_patrol_personnel` VALUES (835, 15);
INSERT INTO `sys_patrol_personnel` VALUES (836, 16);
INSERT INTO `sys_patrol_personnel` VALUES (837, 19);
INSERT INTO `sys_patrol_personnel` VALUES (838, 17);
INSERT INTO `sys_patrol_personnel` VALUES (839, 18);

-- ----------------------------
-- Table structure for sys_patrol_point
-- ----------------------------
DROP TABLE IF EXISTS `sys_patrol_point`;
CREATE TABLE `sys_patrol_point`  (
  `patrol_point_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '巡更点ID',
  `patrol_point_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '巡更点名称',
  `patrol_point_describe` varchar(800) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '巡更点描述',
  `patrol_point_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '巡更点二维码',
  `patrol_point_latitude` decimal(20, 10) NULL DEFAULT NULL COMMENT '巡更点纬度',
  `patrol_point_longitude` decimal(20, 10) NULL DEFAULT NULL COMMENT '巡更点经度',
  `patrol_point_altitude` decimal(20, 10) NULL DEFAULT NULL COMMENT '巡更点高度',
  `patrol_point_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态(0启用 1未启用)',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `region_id` bigint(20) NULL DEFAULT NULL COMMENT '区域id',
  PRIMARY KEY (`patrol_point_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_patrol_point
-- ----------------------------
INSERT INTO `sys_patrol_point` VALUES (2, '2——11号楼西侧2层客电梯厅', NULL, '172.23.220.191/system/point/scan/null', 40.7505937000, 114.9287379000, 719.7700000000, '0', 'admin', '2023-04-07 10:14:52', '', '2023-05-08 14:34:32', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (3, '3——19号楼1层电梯厅环境部', NULL, NULL, 40.7511115000, 114.9290148000, 726.8900000000, '0', 'admin', NULL, NULL, '2023-05-08 14:34:41', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (4, '4——11号楼中厅2层东电梯厅', NULL, NULL, 40.7504566000, 114.9290120000, 720.8400000000, '0', 'admin', NULL, NULL, '2023-05-08 14:34:57', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (5, '5——1号楼4层电梯厅', NULL, NULL, 40.7514026000, 114.9275569000, 719.0500000000, '0', 'admin', NULL, NULL, '2023-05-08 14:35:05', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (6, '6——16号楼外围', NULL, NULL, 40.7494782000, 114.9285479000, 739.7000000000, '0', 'admin', NULL, NULL, '2023-05-08 14:35:12', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (7, '7或23——8号楼1层电梯厅', NULL, NULL, 40.7499984000, 114.9306088000, 729.2800000000, '0', 'admin', NULL, NULL, '2023-05-09 08:31:36', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (8, '8或24——6号楼3层电梯厅', NULL, NULL, 40.7498834000, 114.9304602000, 0.0000000000, '0', 'admin', NULL, NULL, '2023-05-09 08:31:45', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (9, '9——8号楼大厅1层', NULL, NULL, 40.7489371000, 114.9294299000, 738.4700000000, '0', 'admin', NULL, NULL, '2023-05-08 14:35:32', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (10, '10——7号楼2层电梯厅', NULL, NULL, 40.7491457000, 114.9287470000, 721.7100000000, '0', 'admin', NULL, NULL, '2023-05-08 14:35:41', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (11, '11——7号楼5层电梯厅', NULL, NULL, 40.7490948000, 114.9285854000, 0.0000000000, '0', 'admin', NULL, NULL, '2023-05-08 14:35:47', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (12, '12——6号楼5层电梯厅环境部', NULL, NULL, 40.7491462000, 114.9276204000, 0.0000000000, '0', 'admin', NULL, NULL, '2023-05-08 14:35:55', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (13, '13——6号楼4层电梯厅', NULL, NULL, 40.7491840000, 114.9277491000, 0.0000000000, '0', 'admin', NULL, NULL, '2023-05-08 14:36:01', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (14, '14——6号楼1层电梯厅', NULL, NULL, 40.7492542000, 114.9275385000, 0.0000000000, '0', 'admin', NULL, NULL, '2023-05-08 14:36:10', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (15, '15——1园区外围3号车库口', NULL, NULL, 40.7495753000, 114.9273206000, 717.8200000000, '0', 'admin', NULL, NULL, '2023-05-08 14:36:17', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (16, '16——20号楼1层客电梯厅', NULL, NULL, 40.7505746000, 114.9293041000, 727.6800000000, '0', 'admin', NULL, NULL, '2023-05-08 14:36:25', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (17, '17——13号楼南大门', NULL, NULL, 40.7509217000, 114.9287236000, 721.9200000000, '0', 'admin', NULL, NULL, '2023-05-08 14:36:32', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (33, '33——10号楼电梯', NULL, NULL, 40.7492965000, 114.9302657000, 747.2700000000, '0', 'admin', NULL, NULL, '2023-05-08 14:37:25', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (34, '34——18号楼电梯', NULL, NULL, 40.7496695000, 114.9293259000, 743.3400000000, '0', 'admin', NULL, NULL, '2023-05-08 14:37:33', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (35, '35——9号楼电梯', NULL, NULL, 40.7498134000, 114.9304176000, 744.4700000000, '0', 'admin', NULL, NULL, '2023-05-08 14:37:40', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (37, '37——17号电梯', NULL, NULL, 40.7499134000, 114.9295238000, 737.1000000000, '0', 'admin', NULL, NULL, '2023-05-08 14:37:57', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (38, '38——4号楼客梯货梯', NULL, NULL, 40.7509018000, 114.9303865000, 738.0100000000, '0', 'admin', NULL, NULL, '2023-05-08 14:38:31', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (39, '39——20号楼客梯', NULL, NULL, 40.7509428000, 114.9292845000, 736.8300000000, '0', 'admin', NULL, NULL, '2023-05-08 14:38:21', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (40, '40——11号楼中厅东多功能厅电梯', NULL, NULL, 40.7504069000, 114.9298555000, 0.0000000000, '0', 'admin', NULL, NULL, '2023-05-08 14:38:39', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (41, '41——11号楼中厅东侧电梯', NULL, NULL, 40.7504682000, 114.9290173000, 0.0000000000, '0', 'admin', NULL, NULL, '2023-05-08 14:38:46', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (42, '42——11号楼中厅扶梯', NULL, NULL, 40.7504682000, 114.9290173000, 0.0000000000, '0', 'admin', NULL, NULL, '2023-05-08 14:38:55', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (43, '43——11号楼中厅西侧货梯', NULL, NULL, 40.7503753000, 114.9289684000, 0.0000000000, '0', 'admin', NULL, NULL, '2023-05-08 14:39:04', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (44, '44——11号楼中厅西侧电梯', NULL, NULL, 40.7504570000, 114.9291031000, 0.0000000000, '0', 'admin', NULL, NULL, '2023-05-08 14:39:10', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (45, '45——管委会电梯', NULL, NULL, 40.7505555000, 114.9280902000, 0.0000000000, '0', 'admin', NULL, NULL, '2023-05-08 14:39:17', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (46, '46——2号楼货梯机房', NULL, NULL, 40.7508914000, 114.9277315000, 743.6200000000, '0', 'admin', NULL, NULL, '2023-05-08 14:39:23', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (47, '47——14号楼电梯', NULL, NULL, 40.7507292000, 114.9282050000, 0.0000000000, '0', 'admin', NULL, NULL, '2023-05-08 14:39:33', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (48, '48——13号楼电梯机房', NULL, NULL, 40.7512653000, 114.9301586000, 749.9400000000, '0', 'admin', NULL, NULL, '2023-05-08 14:39:40', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (49, '49——1号楼货梯机房', NULL, NULL, 40.7512648000, 114.9275699000, 752.5800000000, '0', 'admin', NULL, NULL, '2023-05-08 14:39:47', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (50, '50——12号楼电梯机房', NULL, NULL, 40.7514933000, 114.9284672000, 741.5100000000, '0', 'admin', NULL, NULL, '2023-05-08 14:39:53', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (51, '51——19号楼货梯机房太阳能', NULL, NULL, 40.7513875000, 114.9294916000, 806.0800000000, '0', 'admin', NULL, NULL, '2023-05-08 14:34:12', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (52, '52——19号客梯机房加太阳能即热管两个功能', NULL, NULL, 40.7514597000, 114.9301490000, 724.5900000000, '0', 'admin', NULL, NULL, '2023-05-08 14:40:14', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (53, '53——2号小配电室', NULL, NULL, 40.7507052000, 114.9304085000, 715.3700000000, '0', 'admin', NULL, NULL, '2023-05-08 14:40:26', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (54, '54——消防高位水箱和3号楼电梯机房', NULL, NULL, 40.7512215000, 114.9303932000, 0.0000000000, '0', 'admin', NULL, NULL, '2023-05-09 09:06:42', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (55, '55——15电梯机房', NULL, NULL, 40.7511745000, 114.9304002000, 0.0000000000, '0', 'admin', NULL, NULL, '2023-05-08 18:26:42', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (56, '56——5号配电室', NULL, NULL, 40.7503868000, 114.9292937000, 0.0000000000, '0', 'admin', NULL, NULL, '2023-05-08 14:40:56', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (57, '57——中区小配电室', NULL, NULL, 40.7505645000, 114.9293755000, 0.0000000000, '0', 'admin', NULL, NULL, '2023-05-08 14:41:04', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (58, '58——11号楼地下隔油池', NULL, NULL, 40.7503781000, 114.9290832000, 0.0000000000, '0', 'admin', NULL, NULL, '2023-05-09 08:52:59', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (59, '59——东区小配电室', NULL, NULL, 40.7499219000, 114.9294864000, 0.0000000000, '0', 'admin', NULL, NULL, '2023-05-08 14:41:57', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (60, '60——4号配电室', NULL, NULL, 40.7501654000, 114.9297567000, 722.7600000000, '0', 'admin', NULL, NULL, '2023-05-08 14:42:11', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (61, '61——4号小配电室', NULL, NULL, 40.7496332000, 114.9299788000, 722.7600000000, '0', 'admin', NULL, NULL, '2023-05-08 14:42:23', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (62, '62——3号配电室', NULL, NULL, 40.7495452000, 114.9287640000, 0.0000000000, '0', 'admin', NULL, NULL, '2023-05-08 14:42:45', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (63, '63——3号小配电室', NULL, NULL, 40.7496416000, 114.9277790000, 0.0000000000, '0', 'admin', NULL, NULL, '2023-05-08 14:43:03', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (64, '64——西区小配电室', NULL, NULL, 40.7502718000, 114.9281493000, 722.7600000000, '0', 'admin', NULL, NULL, '2023-05-08 14:43:38', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (65, '65——生活水泵房', NULL, NULL, 40.7504184000, 114.9285717000, 722.7600000000, '0', 'admin', NULL, NULL, '2023-05-08 14:43:47', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (66, '66——1号小配电室', NULL, NULL, 40.7514977000, 114.9284856000, 0.0000000000, '0', 'admin', NULL, NULL, '2023-05-08 14:44:02', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (67, '67——1号配电室', NULL, NULL, 40.7514957000, 114.9284877000, 722.7600000000, '0', 'admin', NULL, NULL, '2023-05-08 14:44:17', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (68, '68——太阳能热水泵房', NULL, NULL, 40.7511314000, 114.9298654000, 0.0000000000, '0', 'admin', NULL, NULL, '2023-05-08 14:44:26', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (69, '69——2号配电室', NULL, NULL, 40.7510132000, 114.9304875000, 722.7600000000, '0', 'admin', NULL, NULL, '2023-05-08 14:44:38', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (70, '70——20号楼货梯', NULL, NULL, 40.7509603000, 114.9298751000, 745.4400000000, '0', 'admin', NULL, NULL, '2023-05-08 14:44:56', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (71, '71——8号楼货梯客梯机房', NULL, NULL, 40.7492343000, 114.9294665000, 741.2100000000, '0', 'admin', NULL, NULL, '2023-05-09 09:16:14', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (73, '73——6号楼客梯货梯机房', NULL, NULL, 40.7494039000, 114.9276464000, 732.3000000000, '0', 'admin', NULL, NULL, '2023-05-09 09:17:03', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (75, '75——16号楼无机房', NULL, NULL, 40.7498299000, 114.9288418000, 0.0000000000, '0', 'admin', NULL, NULL, '2023-05-08 14:46:05', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (76, '76——5号楼货梯客梯机房', NULL, NULL, 40.7498355000, 114.9277096000, 728.4700000000, '0', 'admin', NULL, NULL, '2023-05-09 09:17:28', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (78, '78——1号车库口5北侧', NULL, NULL, 40.7516175000, 114.9280157000, 716.4800000000, '0', 'admin', NULL, NULL, '2023-05-08 16:34:35', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (79, '79——3号车库报警阀室', NULL, NULL, 40.7496522000, 114.9280754000, 0.0000000000, '0', 'admin', NULL, NULL, '2023-05-08 14:47:09', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (81, '81——4号车库报警阀室', NULL, NULL, 40.7495059000, 114.9303405000, 0.0000000000, '0', 'admin', NULL, NULL, '2023-05-08 14:47:25', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (82, '82——2号车库报警阀室', NULL, NULL, 40.7510215000, 114.9304870000, 0.0000000000, '0', 'admin', NULL, NULL, '2023-05-08 14:48:04', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (83, '83——1号车库报警阀', NULL, NULL, 40.7516132000, 114.9280156000, 0.0000000000, '0', 'admin', NULL, NULL, '2023-05-08 14:48:18', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (84, '84——11号楼中厅二层东电梯厅', NULL, NULL, 40.7502741000, 114.9290773000, 722.4100000000, '0', 'admin', NULL, NULL, '2023-05-08 14:48:29', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (85, '85——20号楼一层客梯', NULL, NULL, 40.7511509000, 114.9294802000, 0.0000000000, '0', 'admin', NULL, NULL, '2023-05-08 14:48:42', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (86, '86——20号楼6层客梯旁弱电间', NULL, NULL, 40.7512012000, 114.9293116000, 0.0000000000, '0', 'admin', NULL, NULL, '2023-05-08 14:48:52', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (87, '87——20楼小食堂北门口', NULL, NULL, 40.7509663000, 114.9297105000, 723.2500000000, '0', 'admin', NULL, NULL, '2023-05-08 14:49:03', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (88, '88——2号车库口', NULL, NULL, 40.7510655000, 114.9308792000, 719.8900000000, '0', 'admin', NULL, NULL, '2023-05-08 14:49:11', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (89, '89——东门岗', NULL, NULL, 40.7503875000, 114.9310063000, 719.8800000000, '0', 'admin', NULL, NULL, '2023-05-08 14:49:22', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (90, '90——11号楼东侧创坝', NULL, NULL, 40.7503371000, 114.9304774000, 711.4900000000, '0', 'admin', NULL, NULL, '2023-05-08 14:49:34', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (91, '91——10号楼一层电梯口', NULL, NULL, 40.7493300000, 114.9303605000, 0.0000000000, '0', 'admin', NULL, NULL, '2023-05-08 14:49:44', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (92, '92——南门岗', NULL, NULL, 40.7490358000, 114.9290046000, 712.5700000000, '0', 'admin', NULL, NULL, '2023-05-08 16:34:59', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (93, '93——6号楼一层电梯厅', NULL, NULL, 40.7491491000, 114.9276723000, 0.0000000000, '0', 'admin', NULL, NULL, '2023-05-08 14:51:00', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (95, '95——3号车库口', NULL, NULL, 40.7495813000, 114.9273004000, 701.0200000000, '0', 'admin', NULL, NULL, '2023-05-08 14:51:30', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (96, '96——11号楼西区西创坝门口', NULL, NULL, 40.7503503000, 114.9274672000, 716.4400000000, '0', 'admin', NULL, NULL, '2023-05-08 14:51:45', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (97, '97——11号楼西过道管委会门口', NULL, NULL, 40.7500230000, 114.9286220000, 727.4400000000, '0', 'admin', NULL, NULL, '2023-05-08 14:51:55', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (98, '98——1号车库门口2号楼西侧', NULL, NULL, 40.7509298000, 114.9271611000, 728.8800000000, '0', 'admin', NULL, NULL, '2023-05-08 16:35:44', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (99, '99——2号楼北侧出口2号楼北侧氢气储存间门口', NULL, NULL, 40.7511839000, 114.9275714000, 728.2600000000, '0', 'admin', NULL, NULL, '2023-05-08 16:35:59', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (100, '100——19号楼6层弱电间', NULL, NULL, 40.7514927000, 114.9293652000, 739.5800000000, '0', 'admin', NULL, NULL, '2023-05-08 14:52:25', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (101, '101——19号楼西侧门口', NULL, NULL, 40.7512300000, 114.9289483000, 739.4300000000, '0', 'admin', NULL, NULL, '2023-05-08 14:52:36', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (102, '102——4号车库出入口', NULL, NULL, 40.7495318000, 114.9307166000, 722.7500000000, '0', 'admin', NULL, NULL, '2023-05-08 16:36:24', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (103, '103——11号楼西区1层中控室门口', NULL, NULL, 40.7505751000, 114.9285264000, 721.5900000000, '0', 'admin', NULL, NULL, '2023-05-08 14:53:12', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (104, '104——11号楼中区北侧咖啡厅门口', NULL, NULL, 40.7508990000, 114.9290078000, 731.1900000000, '0', 'admin', NULL, NULL, '2023-05-08 14:53:27', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (105, '105——19号楼一层电梯口', NULL, NULL, 40.7513900000, 114.9291863000, 741.7000000000, '0', 'admin', NULL, NULL, '2023-05-08 14:53:44', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (106, '106——20号楼物业门口', NULL, NULL, 40.7507434000, 114.9288406000, 0.0000000000, '0', 'admin', '2023-04-24 13:19:26', '', '2023-05-08 14:53:52', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (107, '中集测试用', NULL, NULL, 38.0709100000, 114.5089300000, 66.1204830000, '0', 'admin', '2023-04-25 10:50:56', '', '2023-06-01 09:33:08', NULL, 1);
INSERT INTO `sys_patrol_point` VALUES (112, '112——7号楼电梯机房', NULL, NULL, 40.7490948000, 114.9285854000, 0.0000000000, '0', '18032139488', '2023-05-16 13:54:36', '', '2023-05-16 13:55:34', NULL, 1);

-- ----------------------------
-- Table structure for sys_personnel
-- ----------------------------
DROP TABLE IF EXISTS `sys_personnel`;
CREATE TABLE `sys_personnel`  (
  `personnel_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '员工ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `post_id` bigint(20) NULL DEFAULT NULL COMMENT '岗位ID',
  `open_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '小程序openid',
  `personnel_login_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `personnel_password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `personnel_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '员工名字',
  `personnel_phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `personnel_sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `personnel_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态(0在职 1离职)',
  `personnel_entry_time` datetime NULL DEFAULT NULL COMMENT '入职时间',
  `personnel_resignation_time` datetime NULL DEFAULT NULL COMMENT '离职时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `region_id` bigint(20) NOT NULL COMMENT '区域id',
  PRIMARY KEY (`personnel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_personnel
-- ----------------------------
INSERT INTO `sys_personnel` VALUES (6, 201, 0, 'oEDSQ4tNSIjffgybf8pluggLXxNs', '17732704567', '$2a$10$GirrtYDgVRe3i8XCeNxEU.UiHkXwbsX7SnExW0Y/4dzCeCiVgyfmu', '柳娜', '17732704567', '1', NULL, NULL, NULL, NULL, 'admin', '2023-04-13 16:38:27', '', '2023-06-13 17:40:16', '/profile/upload/2023/04/13/微信图片_20230413154635_20230413163725A002.jpg', 1);
INSERT INTO `sys_personnel` VALUES (7, 201, 0, 'oEDSQ4uadVn4We6FTfqFD-qAnOr4', '17330138136', '$2a$10$EVeZDyVwATkAfgzTb3vKfeMCiR6qxytJAZ9l240zx4ma2Oy0UrXgW', '徐苗苗', '17330138136', '1', NULL, NULL, NULL, NULL, 'wuyexungen', '2023-04-13 16:47:00', '', '2023-06-14 10:11:44', '/profile/upload/2023/04/13/微信图片_20230413164617_20230413164637A003.jpg', 1);
INSERT INTO `sys_personnel` VALUES (8, 203, 0, 'oEDSQ4nXmp3kbXNTzqyidjxDx3HM', '18131337431', '$2a$10$J.C0QkSlDEMR3qFWcUHwTeD7GTnN5PeeaAbDfIrmBGKOKvzLT84fG', '刘宝军', '18131337431', '0', NULL, NULL, NULL, NULL, 'wuyexungen', '2023-04-13 16:55:29', '', '2023-06-14 18:16:26', '/profile/upload/2023/04/13/微信图片_20230413164750_20230413165507A005.jpg', 1);
INSERT INTO `sys_personnel` VALUES (9, 204, 0, '', '15230375052', '$2a$10$rZcpHVw7O107uW2ASdkynO2Jnyl4dmpKuorMpEjXhAOHcgwH3cPY6', '王建国', '15230375052', '0', NULL, NULL, NULL, NULL, 'admin', '2023-04-24 14:07:12', '', '2023-04-24 14:22:56', '/profile/upload/2023/04/24/微信图片_20230424142239_20230424142254A001.jpg', 1);
INSERT INTO `sys_personnel` VALUES (10, 204, 0, '', '15081301366', '$2a$10$cUBafe8e.10GyndEV1REMuqWbQxYJOWgpXortG89PMpCUVt7vLDJ6', '焦祁亮', '15081301366', '0', NULL, NULL, NULL, NULL, 'admin', '2023-04-24 14:09:26', '', '2023-04-24 14:23:13', '/profile/upload/2023/04/24/微信图片_20230424142306_20230424142311A002.jpg', 1);
INSERT INTO `sys_personnel` VALUES (11, 205, 0, 'oEDSQ4q5NpNpL8zfFAUstpvpfP0o', '13784563079', '$2a$10$P09SFrfkwvoSSUQJpl3WhOtyzRgfrh2p2IIYRIbnLUswkkDLJ0K.m', '冀登芳', '13784563079', '1', NULL, NULL, NULL, NULL, 'admin', '2023-04-24 14:10:28', '', '2023-06-13 20:03:48', '/profile/upload/2023/04/24/微信图片_20230424142330_20230424142335A003.jpg', 1);
INSERT INTO `sys_personnel` VALUES (12, 205, 0, '', '17731320833', '$2a$10$qwPF9pVDpLIAPpZuAhHYzOS3RUTUNawM0XUNwNMjOEpDD/T0MQh/O', '刘春娟', '17731320833', '1', NULL, NULL, NULL, NULL, 'admin', '2023-04-24 14:11:09', '', '2023-05-08 17:51:29', '/profile/upload/2023/04/24/微信图片_20230424142346_20230424142352A004.jpg', 1);
INSERT INTO `sys_personnel` VALUES (13, 203, 0, '', '13582837451', '$2a$10$jq96PeuVTB46LtHqVq977OUCjew7AKGKnNk.K5Dpa55pMVwWZ2GIC', '陈德胜', '13582837451', '0', NULL, NULL, NULL, NULL, 'admin', '2023-04-24 14:14:41', '', '2023-04-24 14:24:44', '/profile/upload/2023/04/24/微信图片_20230424142402_20230424142443A005.jpg', 1);
INSERT INTO `sys_personnel` VALUES (14, 203, 0, '', '18034310296', '$2a$10$uYdyvUuwkMxjd0UHkLVMx.Po4XRiKFYDpmQHZOUfBoomPTqh4GWBK', '高志标', '18034310296', '0', NULL, NULL, NULL, NULL, 'admin', '2023-04-24 14:15:19', '', '2023-04-24 14:24:53', '/profile/upload/2023/04/24/微信图片_20230424142406_20230424142451A006.jpg', 1);
INSERT INTO `sys_personnel` VALUES (15, 203, 0, 'oEDSQ4loGsXk1pY1o6zqz7fEe5ss', '18034036517', '$2a$10$roTpfGS0d4.Jy4MOt8uRce7OpEmJtth3117SVKDiKprNWIELIv/Pi', '程建林', '18034036517', '0', NULL, NULL, NULL, NULL, 'admin', '2023-04-24 14:16:37', '', '2023-06-13 19:30:36', '/profile/upload/2023/04/24/微信图片_20230424142415_20230424142458A007.jpg', 1);
INSERT INTO `sys_personnel` VALUES (16, 200, 0, '', '15831336155', '$2a$10$ueCiSI.rshvvbxT.NNwTc.fje/MQjaUOHjv.gkTH9fpfUum4g4T82', '陈小龙', '15831336155', '0', NULL, NULL, NULL, NULL, 'admin', '2023-04-24 14:18:45', '', '2023-04-24 14:25:18', '/profile/upload/2023/04/24/微信图片_20230424142419_20230424142517A009.jpg', 1);
INSERT INTO `sys_personnel` VALUES (17, 200, 0, 'oEDSQ4uO8_3KgYrR7c5LAhVXMOBA', '18032376958', '$2a$10$4nJDtmwEvbjZ.bd71kUp5uBrqdBs9TbtL0sGJab.MAXlbVawRYPrG', '祁守华', '18032376958', '0', NULL, NULL, NULL, NULL, 'admin', '2023-04-24 14:19:35', '', '2023-06-14 09:03:22', '/profile/upload/2023/04/24/微信图片_20230424142423_20230424142530A010.jpg', 1);
INSERT INTO `sys_personnel` VALUES (18, 200, 0, 'oEDSQ4j0yL3rP1mju_txnsFx8WUo', '18331353727', '$2a$10$kz92M.xtQ6N00bZd4kfhoOfoHYt8KDEBGJ7wPRrx0fF/qUM3IByDW', '王启洪', '18331353727', '0', NULL, NULL, NULL, NULL, 'admin', '2023-04-24 14:20:31', '', '2023-06-13 23:08:30', '/profile/upload/2023/04/24/微信图片_20230424142428_20230424142547A011.jpg', 1);
INSERT INTO `sys_personnel` VALUES (19, 200, 0, 'oEDSQ4ojAr3-E4yXqq7M38_xICF8', '19898998690', '$2a$10$VnE5NAtCKadcVv5I9xc44uOlfhozMvYFTqteVLeGUabj0zd273RP6', '袁树', '19898998690', '0', NULL, NULL, NULL, NULL, 'admin', '2023-04-24 14:21:11', '', '2023-06-14 01:05:31', '/profile/upload/2023/04/24/微信图片_20230424142432_20230424142553A012.jpg', 1);
INSERT INTO `sys_personnel` VALUES (20, NULL, 0, '', '13933039209', '$2a$10$W4ijAnlsMVVvP97QxvlVy.ZuooxaTF1POcqivy0lpJcRkWQjVHEwu', '夏', '13933039209', '0', NULL, NULL, NULL, NULL, 'admin', '2023-04-24 16:49:13', '', '2023-05-14 15:11:39', '/profile/upload/2023/05/14/3_20230514151116A004.jpg', 1);
INSERT INTO `sys_personnel` VALUES (24, 206, 0, 'oEDSQ4kd5SY35bd5I-PUJGhOSdaQ', 'hebeichanzhi', '$2a$10$leohaHBNT2TMpwrZoFWygerJhF1DIt8KJ4YI/NI8RV68uHXTdzcC6', '河北蝉智', '18332328758', '0', NULL, NULL, NULL, NULL, 'admin', '2023-05-14 15:10:14', '', '2023-06-14 11:02:06', '/profile/upload/2023/05/14/3_20230514150907A002.jpg', 1);
INSERT INTO `sys_personnel` VALUES (26, NULL, 1, '', '祁守华', '$2a$10$ls6gBHZX8qzYTe/2F./KWOvxH81xiRQpaoEMBC5JqhXZiYBUzlE7C', '祁守华', '18032376958', NULL, NULL, NULL, NULL, NULL, '', '2023-05-14 19:00:22', '', NULL, '', 1);
INSERT INTO `sys_personnel` VALUES (27, NULL, 1, '', '秩序部祁守华', '$2a$10$FC1tMHcR9NDHvdgJG7HbkuVQzPRuAL9ozo3HBbshVAjmEHATlS4bu', '秩序部祁守华', '18032376958', NULL, NULL, NULL, NULL, NULL, '', '2023-05-14 19:06:33', '', NULL, '', 1);
INSERT INTO `sys_personnel` VALUES (28, 206, 0, 'oEDSQ4jDKuscK9H57mTlj_U5xkW0', '912996617', '$2a$10$honJse4OG/KrYc84LRs73.Xqe.oOp3WQ1vKyNP4q/HRD/SFZNuCqi', '测试', '18232005950', NULL, NULL, NULL, NULL, NULL, 'admin', '2023-05-15 11:20:15', '', '2023-06-13 16:38:16', '', 1);
INSERT INTO `sys_personnel` VALUES (29, NULL, 1, '', '康国鸿', '$2a$10$/drCUe.BNvX6NEXWcvqmju4.k9NqLu.SaM1Tw10tuJ.EiujyACfNy', '康国鸿', '15931354568', NULL, NULL, NULL, NULL, NULL, '', '2023-05-15 20:34:04', '', NULL, '', 1);
INSERT INTO `sys_personnel` VALUES (30, NULL, 1, '', '张志鸿', '$2a$10$m7Edt1cWHIsVgPhIzFyrkuzc80K/ysrN/GufqrNerpJsptv4nfG2e', '张志鸿', '18032382969', NULL, NULL, NULL, NULL, NULL, '', '2023-05-16 13:51:18', '', NULL, '', 1);
INSERT INTO `sys_personnel` VALUES (31, NULL, 1, '', '456', '$2a$10$DholAAq.H5L/zXNXWIyi.uSIjDEO/w1oqhwqjPcBYEA9CEwDO2Fn2', '456', '456', NULL, NULL, NULL, NULL, NULL, '', '2023-05-16 15:08:32', '', '2023-06-12 14:42:36', '', 1);
INSERT INTO `sys_personnel` VALUES (33, 206, 0, 'oEDSQ4jDKuscK9H57mTlj_U5xkW0', 'weixiubumen', '$2a$10$edrEnbwz0Avbd5IoiBuncO1Z1Jn8lHLQD/8091PS0UnNDkFwLevEy', '维修员1', '18232005950', '0', '0', NULL, NULL, NULL, '18032139488', '2023-06-14 11:12:50', '', '2023-06-14 11:15:41', '', 1);

-- ----------------------------
-- Table structure for sys_personnel_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_personnel_post`;
CREATE TABLE `sys_personnel_post`  (
  `personnel_id` bigint(20) NOT NULL COMMENT '员工id',
  `post_id` bigint(20) NOT NULL COMMENT '岗位id',
  PRIMARY KEY (`personnel_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_personnel_post
-- ----------------------------
INSERT INTO `sys_personnel_post` VALUES (9, 4);
INSERT INTO `sys_personnel_post` VALUES (10, 4);
INSERT INTO `sys_personnel_post` VALUES (12, 4);
INSERT INTO `sys_personnel_post` VALUES (13, 4);
INSERT INTO `sys_personnel_post` VALUES (14, 4);
INSERT INTO `sys_personnel_post` VALUES (16, 4);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(11) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2023-03-24 14:38:49', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2023-03-24 14:38:49', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2023-03-24 14:38:49', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2023-03-24 14:38:49', '', NULL, '');

-- ----------------------------
-- Table structure for sys_region
-- ----------------------------
DROP TABLE IF EXISTS `sys_region`;
CREATE TABLE `sys_region`  (
  `region_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '区域划分id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '区域名称',
  `region_longitude` decimal(20, 10) NULL DEFAULT NULL COMMENT '区域经度',
  `region_latitude` decimal(20, 10) NULL DEFAULT NULL COMMENT '区域纬度',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '描述',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '上级区域id',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`region_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_region
-- ----------------------------
INSERT INTO `sys_region` VALUES (1, '张家口', 114.9287379000, 40.7505937000, '张家口描述', NULL, '', '2023-06-10 14:33:09', '', NULL);

-- ----------------------------
-- Table structure for sys_repair
-- ----------------------------
DROP TABLE IF EXISTS `sys_repair`;
CREATE TABLE `sys_repair`  (
  `repair_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '维修任务编号',
  `repair_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '维修任务名称',
  `repair_describe` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '维修任务描述',
  `repair_principal` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '维修任务负责人',
  `repair_phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人联系方式',
  `repair_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '巡更任务状态',
  `repair_start_time` datetime NULL DEFAULT NULL COMMENT '计划开始时间',
  `repair_actual_start_time` datetime NULL DEFAULT NULL COMMENT '实际开始时间',
  `repair_actual_end_time` datetime NULL DEFAULT NULL COMMENT '实际结束时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`repair_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_repair
-- ----------------------------

-- ----------------------------
-- Table structure for sys_repair_img
-- ----------------------------
DROP TABLE IF EXISTS `sys_repair_img`;
CREATE TABLE `sys_repair_img`  (
  `img_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '图片编号',
  `repair_id` bigint(20) NOT NULL COMMENT '维修任务编号',
  `img_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  PRIMARY KEY (`img_id`, `repair_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_repair_img
-- ----------------------------

-- ----------------------------
-- Table structure for sys_repair_order
-- ----------------------------
DROP TABLE IF EXISTS `sys_repair_order`;
CREATE TABLE `sys_repair_order`  (
  `repair_order_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '报修工单编号',
  `patrol_point_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '位置描述',
  `personnel_id` bigint(20) NULL DEFAULT NULL COMMENT '员工编号',
  `personnel_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '员工姓名',
  `personnel_phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '员工联系方式',
  `repair_order_describe` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异常描述',
  `repair_order_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `cause_of_issue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '故障原因',
  `reporting_time` datetime NULL DEFAULT NULL COMMENT '上报时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`repair_order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_repair_order
-- ----------------------------

-- ----------------------------
-- Table structure for sys_repair_order_img
-- ----------------------------
DROP TABLE IF EXISTS `sys_repair_order_img`;
CREATE TABLE `sys_repair_order_img`  (
  `img_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '图片编号',
  `repair_order_id` bigint(20) NOT NULL COMMENT '维修工单编号',
  `img_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  PRIMARY KEY (`img_id`, `repair_order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_repair_order_img
-- ----------------------------

-- ----------------------------
-- Table structure for sys_repair_patrol_point
-- ----------------------------
DROP TABLE IF EXISTS `sys_repair_patrol_point`;
CREATE TABLE `sys_repair_patrol_point`  (
  `repair_id` bigint(20) NOT NULL COMMENT '维修任务编号',
  `patrol_point_id` bigint(20) NOT NULL COMMENT '巡更点编号',
  PRIMARY KEY (`repair_id`, `patrol_point_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_repair_patrol_point
-- ----------------------------

-- ----------------------------
-- Table structure for sys_repair_personnel
-- ----------------------------
DROP TABLE IF EXISTS `sys_repair_personnel`;
CREATE TABLE `sys_repair_personnel`  (
  `repair_id` bigint(20) NOT NULL COMMENT '维修任务编号',
  `personnel_id` bigint(20) NOT NULL COMMENT '员工编号',
  PRIMARY KEY (`repair_id`, `personnel_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_repair_personnel
-- ----------------------------

-- ----------------------------
-- Table structure for sys_repair_repair_order
-- ----------------------------
DROP TABLE IF EXISTS `sys_repair_repair_order`;
CREATE TABLE `sys_repair_repair_order`  (
  `repair_order_id` bigint(20) NOT NULL COMMENT '报修工单编号',
  `repair_id` bigint(20) NOT NULL COMMENT '维修任务编号',
  PRIMARY KEY (`repair_order_id`, `repair_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_repair_repair_order
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(11) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-03-24 14:38:50', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2023-03-24 14:38:50', 'admin', '2023-05-15 12:05:20', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);
INSERT INTO `sys_role_dept` VALUES (2, 200);
INSERT INTO `sys_role_dept` VALUES (2, 201);
INSERT INTO `sys_role_dept` VALUES (2, 202);
INSERT INTO `sys_role_dept` VALUES (2, 203);
INSERT INTO `sys_role_dept` VALUES (2, 204);
INSERT INTO `sys_role_dept` VALUES (2, 205);
INSERT INTO `sys_role_dept` VALUES (2, 206);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 2008);
INSERT INTO `sys_role_menu` VALUES (2, 2009);
INSERT INTO `sys_role_menu` VALUES (2, 2010);
INSERT INTO `sys_role_menu` VALUES (2, 2011);
INSERT INTO `sys_role_menu` VALUES (2, 2012);
INSERT INTO `sys_role_menu` VALUES (2, 2013);
INSERT INTO `sys_role_menu` VALUES (2, 2032);
INSERT INTO `sys_role_menu` VALUES (2, 2033);
INSERT INTO `sys_role_menu` VALUES (2, 2034);
INSERT INTO `sys_role_menu` VALUES (2, 2035);
INSERT INTO `sys_role_menu` VALUES (2, 2036);
INSERT INTO `sys_role_menu` VALUES (2, 2037);
INSERT INTO `sys_role_menu` VALUES (2, 2040);
INSERT INTO `sys_role_menu` VALUES (2, 2041);
INSERT INTO `sys_role_menu` VALUES (2, 2042);
INSERT INTO `sys_role_menu` VALUES (2, 2043);
INSERT INTO `sys_role_menu` VALUES (2, 2044);
INSERT INTO `sys_role_menu` VALUES (2, 2045);
INSERT INTO `sys_role_menu` VALUES (2, 2065);
INSERT INTO `sys_role_menu` VALUES (2, 2066);
INSERT INTO `sys_role_menu` VALUES (2, 2067);
INSERT INTO `sys_role_menu` VALUES (2, 2068);
INSERT INTO `sys_role_menu` VALUES (2, 2069);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 100, 'admin', '超级管理员', '00', 'ry@163.com', '15888888888', '1', '/profile/avatar/2023/03/29/blob_20230329153056A001.png', '$2a$10$d6H9c346yKxikhv3eDDg2OobnT2i84kbDJnWT7wUcZy97OSp6WF1K', '0', '0', '127.0.0.1', '2023-06-29 17:28:31', 'admin', '2023-03-24 14:38:48', '', '2023-06-29 09:28:29', '管理员');
INSERT INTO `sys_user` VALUES (2, 100, 'wuyexungen', '运维', '00', 'xungen@qq.com', '15666666666', '1', '/profile/avatar/2023/04/13/blob_20230413165129A004.png', '$2a$10$dR3NYBrLBuqAqQPy86hxGuPqjZSj7OubIIxajzT/ZQE4zNeFXlUHO', '0', '2', '127.0.0.1', '2023-06-10 11:19:39', 'admin', '2023-03-24 14:38:48', 'admin', '2023-06-10 03:23:16', '运维');
INSERT INTO `sys_user` VALUES (100, NULL, '912996618', '912996618', '00', '', '18232005950', '0', '', '$2a$10$XJZA3HYVm4UP8YkUP0RkfejY/Tl7AbCddfw/ua9FkvmvO7vv1rYRq', '0', '2', '127.0.0.1', '2023-03-24 15:17:43', '', '2023-03-24 15:16:51', 'admin', '2023-03-28 15:24:46', NULL);
INSERT INTO `sys_user` VALUES (104, NULL, '912996617', '912996617', '00', '', '18232005950', '0', '', '$2a$10$YCvE.sobF.K5pJGTsm7/ROOtlWkh1c9g8kIDf5L4KUONJjSPaEXQa', '0', '2', '127.0.0.1', '2023-05-12 17:51:43', '', '2023-05-12 17:46:28', '', '2023-05-12 17:51:41', NULL);
INSERT INTO `sys_user` VALUES (105, NULL, '912996616', '912996616', '00', '', '18232005950', '0', '', '$2a$10$ifwmvdFmKThrKWx2x0.qDOiF8VtcGDgF/e4P6./jygbJfdwgcAJpO', '0', '2', '', NULL, '', '2023-05-12 17:53:50', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (106, 100, '18032139488', '张家口后台管理', '00', '', '18032139488', '0', '', '$2a$10$.iaG5TPFYzGEQjTp9.7vReTBPduNoR6Ui2XBw.Scd9qbv8XHjXXA6', '0', '0', '127.0.0.1', '2023-06-14 10:38:45', 'admin', '2023-05-15 12:01:12', 'admin', '2023-06-14 10:38:44', NULL);
INSERT INTO `sys_user` VALUES (107, 100, '18232005950', '石家庄测试用', '00', '', '18232005950', '0', '', '$2a$10$OZ.n5g67NzM5oyEAdOhNE..3xoA6EnhT2wjeNAHokS31TlN5ayA3W', '0', '0', '127.0.0.1', '2023-06-13 10:12:22', 'admin', '2023-06-12 06:45:51', '', '2023-06-13 02:12:22', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (106, 2);

-- ----------------------------
-- Table structure for sys_user_region
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_region`;
CREATE TABLE `sys_user_region`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `region_id` bigint(20) NOT NULL COMMENT '区域id',
  PRIMARY KEY (`user_id`, `region_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_region
-- ----------------------------
INSERT INTO `sys_user_region` VALUES (1, 1);
INSERT INTO `sys_user_region` VALUES (106, 1);
INSERT INTO `sys_user_region` VALUES (107, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (1, 2);
INSERT INTO `sys_user_role` VALUES (106, 2);
INSERT INTO `sys_user_role` VALUES (107, 2);

SET FOREIGN_KEY_CHECKS = 1;
