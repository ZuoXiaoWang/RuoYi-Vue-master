/*
 Navicat Premium Data Transfer

 Source Server         : 服务器
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : 192.168.0.11:3306
 Source Schema         : ry-vue

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 04/04/2023 15:20:38
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

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
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

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
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

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
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

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
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

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
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
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
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (28, 'sys_patrol', '巡更任务', NULL, NULL, 'SysPatrol', 'crud', 'com.ruoyi.system', 'system', 'patrol', '巡更任务', 'ruoyi', '0', '/', '{}', 'admin', '2023-04-04 10:04:11', '', '2023-04-04 10:07:19', NULL);
INSERT INTO `gen_table` VALUES (31, 'sys_repair_order', '', NULL, NULL, 'SysRepairOrder', 'crud', 'com.ruoyi.system', 'system', 'order', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2023-04-04 11:09:29', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
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
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 308 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (251, '28', 'patrol_id', '巡更任务编号', 'bigint', 'Long', 'patrolId', '1', '1', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-04-04 10:04:11', '', '2023-04-04 10:07:19');
INSERT INTO `gen_table_column` VALUES (252, '28', 'patrol_name', '巡更任务名称', 'varchar(30)', 'String', 'patrolName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-04-04 10:04:11', '', '2023-04-04 10:07:19');
INSERT INTO `gen_table_column` VALUES (253, '28', 'patrol_describe', '巡更任务描述', 'varchar(500)', 'String', 'patrolDescribe', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 3, 'admin', '2023-04-04 10:04:11', '', '2023-04-04 10:07:19');
INSERT INTO `gen_table_column` VALUES (254, '28', 'patrol_principal', '巡更任务负责人', 'varchar(10)', 'String', 'patrolPrincipal', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-04-04 10:04:11', '', '2023-04-04 10:07:20');
INSERT INTO `gen_table_column` VALUES (255, '28', 'patrol_phone', '负责人联系方式', 'varchar(11)', 'String', 'patrolPhone', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-04-04 10:04:11', '', '2023-04-04 10:07:20');
INSERT INTO `gen_table_column` VALUES (256, '28', 'patrol_status', '巡更任务状态', 'char(1)', 'String', 'patrolStatus', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 6, 'admin', '2023-04-04 10:04:11', '', '2023-04-04 10:07:20');
INSERT INTO `gen_table_column` VALUES (257, '28', 'patrol_start_time', '计划开始时间', 'datetime', 'Date', 'patrolStartTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2023-04-04 10:04:11', '', '2023-04-04 10:07:20');
INSERT INTO `gen_table_column` VALUES (258, '28', 'patrol_end_time', '计划结束时间', 'datetime', 'Date', 'patrolEndTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2023-04-04 10:04:11', '', '2023-04-04 10:07:20');
INSERT INTO `gen_table_column` VALUES (259, '28', 'patrol_create_time', '任务创建时间', 'datetime', 'Date', 'patrolCreateTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 9, 'admin', '2023-04-04 10:04:11', '', '2023-04-04 10:07:20');
INSERT INTO `gen_table_column` VALUES (260, '28', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '0', '0', '0', NULL, 'EQ', 'textarea', '', 10, 'admin', '2023-04-04 10:04:11', '', '2023-04-04 10:07:20');
INSERT INTO `gen_table_column` VALUES (261, '28', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2023-04-04 10:04:11', '', '2023-04-04 10:07:20');
INSERT INTO `gen_table_column` VALUES (262, '28', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2023-04-04 10:04:11', '', '2023-04-04 10:07:20');
INSERT INTO `gen_table_column` VALUES (263, '28', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2023-04-04 10:04:11', '', '2023-04-04 10:07:20');
INSERT INTO `gen_table_column` VALUES (264, '28', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2023-04-04 10:04:11', '', '2023-04-04 10:07:20');
INSERT INTO `gen_table_column` VALUES (293, '31', 'repair_order_id', '报修工单编号', 'bigint', 'Long', 'repairOrderId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-04-04 11:09:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (294, '31', 'patrol_point_id', '巡更点编号', 'bigint', 'Long', 'patrolPointId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-04-04 11:09:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (295, '31', 'patrol_point_name', '巡更点名称', 'varchar(20)', 'String', 'patrolPointName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2023-04-04 11:09:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (296, '31', 'personnel_id', '员工编号', 'bigint', 'Long', 'personnelId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-04-04 11:09:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (297, '31', 'personnel_name', '员工姓名', 'varchar(20)', 'String', 'personnelName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2023-04-04 11:09:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (298, '31', 'personnel_phone', '员工联系方式', 'varchar(11)', 'String', 'personnelPhone', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-04-04 11:09:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (299, '31', 'repair_order_describe', '异常描述', 'varchar(500)', 'String', 'repairOrderDescribe', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 7, 'admin', '2023-04-04 11:09:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (300, '31', 'repair_order_status', '状态', 'char(1)', 'String', 'repairOrderStatus', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 8, 'admin', '2023-04-04 11:09:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (301, '31', 'cause_of_issue', '故障原因', 'varchar(255)', 'String', 'causeOfIssue', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2023-04-04 11:09:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (302, '31', 'reporting_time', '上报时间', 'datetime', 'Date', 'reportingTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 10, 'admin', '2023-04-04 11:09:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (303, '31', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 11, 'admin', '2023-04-04 11:09:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (304, '31', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2023-04-04 11:09:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (305, '31', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2023-04-04 11:09:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (306, '31', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2023-04-04 11:09:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (307, '31', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 15, 'admin', '2023-04-04 11:09:29', '', NULL);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
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
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-03-24 14:39:21', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-03-24 14:39:21', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-03-24 14:39:21', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2023-03-24 14:39:22', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-03-24 14:39:22', 'admin', '2023-03-28 15:57:25', '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2023-03-24 14:39:22', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
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
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-24 14:38:46', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-24 14:38:46', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-24 14:38:46', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-24 14:38:46', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-24 14:38:46', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-24 14:38:46', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-24 14:38:47', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-24 14:38:47', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-24 14:38:47', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-24 14:38:47', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
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
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_dict_data` VALUES (102, 1, '未开始', '0', 'sys_patrol_status', NULL, 'default', 'N', '0', 'admin', '2023-03-30 16:57:39', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 2, '进行中', '1', 'sys_patrol_status', NULL, 'default', 'N', '0', 'admin', '2023-03-30 16:57:53', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (104, 3, '已完成', '2', 'sys_patrol_status', NULL, 'default', 'N', '0', 'admin', '2023-03-30 16:58:08', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (105, 1, '正常', '0', 'sys_patrol_result', NULL, 'default', 'N', '0', 'admin', '2023-03-30 17:19:27', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (106, 2, '异常', '1', 'sys_patrol_result', NULL, 'default', 'N', '0', 'admin', '2023-03-30 17:19:38', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (107, 1, '已处理', '0', 'sys_repair_order_status', NULL, 'default', 'N', '0', 'admin', '2023-03-30 17:47:29', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (108, 2, '未处理', '1', 'sys_repair_order_status', NULL, 'default', 'N', '0', 'admin', '2023-03-30 17:47:36', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

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

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
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
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2023-03-24 14:39:24', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2023-03-24 14:39:24', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2023-03-24 14:39:24', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 215 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-24 14:41:37');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-24 14:47:08');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-24 14:49:56');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-24 14:51:33');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-24 15:05:24');
INSERT INTO `sys_logininfor` VALUES (105, '912996618', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '注册成功', '2023-03-24 15:16:52');
INSERT INTO `sys_logininfor` VALUES (106, '18232005950', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-03-24 15:16:58');
INSERT INTO `sys_logininfor` VALUES (107, '18232005950', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：18232005950 不存在', '2023-03-24 15:17:02');
INSERT INTO `sys_logininfor` VALUES (108, '912996618', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-03-24 15:17:15');
INSERT INTO `sys_logininfor` VALUES (109, '912996618', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-24 15:17:40');
INSERT INTO `sys_logininfor` VALUES (110, '912996618', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-24 15:20:44');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-24 15:21:39');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 09:13:06');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '192.168.0.9', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 10:24:34');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '192.168.0.9', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 11:25:31');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 14:02:02');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 14:56:07');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '192.168.0.9', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 16:00:54');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-28 09:17:33');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '192.168.0.9', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-28 09:58:25');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '192.168.0.9', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-28 10:46:42');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '192.168.0.9', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-28 11:19:38');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '192.168.0.9', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-28 14:05:21');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '192.168.0.9', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-28 15:57:57');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '192.168.0.9', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-28 15:58:06');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '192.168.0.9', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 10:16:30');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '192.168.0.9', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 10:47:01');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '192.168.0.9', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 11:29:07');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '192.168.0.9', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 14:09:23');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '192.168.0.9', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 15:11:39');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 09:57:11');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-30 10:03:08');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 10:03:12');
INSERT INTO `sys_logininfor` VALUES (133, '912996618', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-30 10:18:44');
INSERT INTO `sys_logininfor` VALUES (134, '912996618', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-30 10:23:05');
INSERT INTO `sys_logininfor` VALUES (135, '912996618', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-30 10:41:08');
INSERT INTO `sys_logininfor` VALUES (136, '912996618', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-30 10:44:55');
INSERT INTO `sys_logininfor` VALUES (137, '912996618', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-30 10:51:44');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 11:04:29');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 11:40:28');
INSERT INTO `sys_logininfor` VALUES (140, '912996617', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', 'Cannot invoke \"com.ruoyi.common.core.domain.entity.SysUser.getPassword()\" because \"user\" is null', '2023-03-30 11:43:24');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-30 11:44:14');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 11:44:51');
INSERT INTO `sys_logininfor` VALUES (143, '912996617', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-30 12:17:07');
INSERT INTO `sys_logininfor` VALUES (144, '912996617', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-30 14:05:54');
INSERT INTO `sys_logininfor` VALUES (145, '912996617', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', 'Cannot invoke \"com.ruoyi.common.core.domain.entity.SysUser.getPassword()\" because \"this.user\" is null', '2023-03-30 14:10:26');
INSERT INTO `sys_logininfor` VALUES (146, '912996617', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-30 14:15:04');
INSERT INTO `sys_logininfor` VALUES (147, '912996617', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-30 14:18:36');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 14:21:48');
INSERT INTO `sys_logininfor` VALUES (149, '912996617', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-30 14:34:17');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 14:34:42');
INSERT INTO `sys_logininfor` VALUES (151, '912996617', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-30 14:39:33');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 15:00:26');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-30 15:01:23');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 15:01:26');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-30 15:17:57');
INSERT INTO `sys_logininfor` VALUES (156, '912996617', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-30 15:18:04');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-03-30 15:20:15');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-03-30 15:20:20');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 15:20:23');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-30 15:33:30');
INSERT INTO `sys_logininfor` VALUES (161, '912996617', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-30 15:33:53');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 15:34:20');
INSERT INTO `sys_logininfor` VALUES (163, '912996617', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-30 15:43:20');
INSERT INTO `sys_logininfor` VALUES (164, '912996617', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '退出成功', '2023-03-30 15:43:45');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 16:00:46');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 16:56:05');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-31 09:35:07');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-31 11:31:20');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-31 14:06:30');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-31 14:17:53');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-31 14:17:57');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-31 15:50:48');
INSERT INTO `sys_logininfor` VALUES (173, NULL, '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '* 必须填写', '2023-04-01 11:13:43');
INSERT INTO `sys_logininfor` VALUES (174, NULL, '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '* 必须填写', '2023-04-01 11:14:02');
INSERT INTO `sys_logininfor` VALUES (175, '912996617', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', 'Redis command timed out; nested exception is io.lettuce.core.RedisCommandTimeoutException: Command timed out after 10 second(s)', '2023-04-01 11:15:13');
INSERT INTO `sys_logininfor` VALUES (176, '912996617', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-04-01 11:17:19');
INSERT INTO `sys_logininfor` VALUES (177, '912996617', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', 'Redis command timed out; nested exception is io.lettuce.core.RedisCommandTimeoutException: Command timed out after 10 second(s)', '2023-04-01 11:30:06');
INSERT INTO `sys_logininfor` VALUES (178, '912996617', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', 'Redis command timed out; nested exception is io.lettuce.core.RedisCommandTimeoutException: Command timed out after 10 second(s)', '2023-04-01 11:30:16');
INSERT INTO `sys_logininfor` VALUES (179, '912996617', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-04-01 11:30:17');
INSERT INTO `sys_logininfor` VALUES (180, '912996617', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', 'Redis command timed out; nested exception is io.lettuce.core.RedisCommandTimeoutException: Command timed out after 10 second(s)', '2023-04-01 13:03:05');
INSERT INTO `sys_logininfor` VALUES (181, '912996617', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-04-01 13:03:19');
INSERT INTO `sys_logininfor` VALUES (182, '912996617', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '退出成功', '2023-04-01 13:05:02');
INSERT INTO `sys_logininfor` VALUES (183, '912996617', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-04-01 13:07:38');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-04-01 14:11:43');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-01 14:11:49');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-04-01 14:28:52');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-04-01 14:28:54');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-01 14:28:58');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-01 14:28:59');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-04-01 14:32:35');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-01 14:32:40');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-03 10:15:16');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-03 14:10:33');
INSERT INTO `sys_logininfor` VALUES (194, '912996617', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-04-03 15:53:08');
INSERT INTO `sys_logininfor` VALUES (195, '912996610', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '登录用户：912996610 不存在', '2023-04-03 15:53:28');
INSERT INTO `sys_logininfor` VALUES (196, '912996610', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '登录用户：912996610 不存在', '2023-04-03 15:59:40');
INSERT INTO `sys_logininfor` VALUES (197, '912996617', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-04-03 15:59:50');
INSERT INTO `sys_logininfor` VALUES (198, '912996617', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '密码输入错误1次', '2023-04-03 15:59:55');
INSERT INTO `sys_logininfor` VALUES (199, '912996617', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '用户不存在/密码错误', '2023-04-03 15:59:55');
INSERT INTO `sys_logininfor` VALUES (200, '912996617', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '密码输入错误2次', '2023-04-03 16:06:29');
INSERT INTO `sys_logininfor` VALUES (201, '912996617', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '用户不存在/密码错误', '2023-04-03 16:06:29');
INSERT INTO `sys_logininfor` VALUES (202, '912996617', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-04-03 16:06:34');
INSERT INTO `sys_logininfor` VALUES (203, '912996617', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-04-03 16:25:11');
INSERT INTO `sys_logininfor` VALUES (204, '912996617', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-04-03 17:11:57');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-03 17:17:31');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-04 09:23:42');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-04 09:36:43');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-04 09:36:52');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-04 11:06:12');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-04 14:01:35');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-04 14:30:46');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-04 14:50:33');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-04 15:00:10');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-04 15:18:03');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
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
) ENGINE = InnoDB AUTO_INCREMENT = 2064 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-03-24 14:38:51', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 6, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2023-03-24 14:38:51', 'admin', '2023-03-30 16:28:03', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 7, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2023-03-24 14:38:51', 'admin', '2023-03-30 16:28:10', '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 8, 'http://ruoyi.vip', NULL, '', 0, 0, 'M', '1', '0', '', 'guide', 'admin', '2023-03-24 14:38:51', 'admin', '2023-03-30 16:28:15', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-03-24 14:38:51', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-03-24 14:38:52', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-03-24 14:38:52', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-03-24 14:38:52', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2023-03-24 14:38:52', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-03-24 14:38:52', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2023-03-24 14:38:52', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2023-03-24 14:38:52', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2023-03-24 14:38:52', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2023-03-24 14:38:53', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2023-03-24 14:38:53', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2023-03-24 14:38:53', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2023-03-24 14:38:53', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2023-03-24 14:38:53', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2023-03-24 14:38:53', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2023-03-24 14:38:53', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2023-03-24 14:38:53', 'admin', '2023-04-04 10:19:07', '代码生成菜单');
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
INSERT INTO `sys_menu` VALUES (2008, '员工管理', 1, 1, 'personnel', 'system/personnel/index', NULL, 1, 0, 'C', '0', '0', 'system:personnel:list', 'people', 'admin', '2023-03-27 15:58:09', 'admin', '2023-03-28 15:56:06', '员工管理菜单');
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
INSERT INTO `sys_menu` VALUES (2040, '巡更任务管理', 0, 2, 'patrol', 'system/patrol/index', NULL, 1, 0, 'C', '0', '0', 'system:patrol:list', 'time-range', 'admin', '2023-03-31 09:41:25', 'admin', '2023-03-31 16:20:38', '巡更任务管理菜单');
INSERT INTO `sys_menu` VALUES (2041, '巡更任务管理查询', 2040, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:patrol:query', '#', 'admin', '2023-03-31 09:41:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2042, '巡更任务管理新增', 2040, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:patrol:add', '#', 'admin', '2023-03-31 09:41:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2043, '巡更任务管理修改', 2040, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:patrol:edit', '#', 'admin', '2023-03-31 09:41:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2044, '巡更任务管理删除', 2040, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:patrol:remove', '#', 'admin', '2023-03-31 09:41:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, '巡更任务管理导出', 2040, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:patrol:export', '#', 'admin', '2023-03-31 09:41:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2046, '维修任务管理', 0, 3, 'repair', 'system/repair/index', NULL, 1, 0, 'C', '0', '0', 'system:repair:list', 'list', 'admin', '2023-03-31 15:14:49', 'admin', '2023-04-03 10:22:01', '维修任务菜单');
INSERT INTO `sys_menu` VALUES (2047, '维修任务查询', 2046, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:repair:query', '#', 'admin', '2023-03-31 15:14:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2048, '维修任务新增', 2046, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:repair:add', '#', 'admin', '2023-03-31 15:14:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2049, '维修任务修改', 2046, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:repair:edit', '#', 'admin', '2023-03-31 15:14:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2050, '维修任务删除', 2046, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:repair:remove', '#', 'admin', '2023-03-31 15:14:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2051, '维修任务导出', 2046, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:repair:export', '#', 'admin', '2023-03-31 15:14:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2052, '巡更工单管理', 0, 4, 'order', 'system/patrolOrder/index', NULL, 1, 0, 'C', '0', '0', 'system:order:list', 'documentation', 'admin', '2023-03-31 16:26:14', 'admin', '2023-04-03 10:24:36', '巡更工单管理菜单');
INSERT INTO `sys_menu` VALUES (2053, '巡更工单管理查询', 2052, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:order:query', '#', 'admin', '2023-03-31 16:26:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2054, '巡更工单管理新增', 2052, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:order:add', '#', 'admin', '2023-03-31 16:26:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2055, '巡更工单管理修改', 2052, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:order:edit', '#', 'admin', '2023-03-31 16:26:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2056, '巡更工单管理删除', 2052, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:order:remove', '#', 'admin', '2023-03-31 16:26:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2057, '巡更工单管理导出', 2052, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:order:export', '#', 'admin', '2023-03-31 16:26:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2058, '维修工单管理', 0, 5, 'repairOrder', 'system/repairOrder/index', NULL, 1, 0, 'C', '0', '0', 'system:repairOrder:list', 'dict', 'admin', '2023-04-03 11:15:17', 'admin', '2023-04-04 09:42:48', '维修工单菜单');
INSERT INTO `sys_menu` VALUES (2059, '维修工单查询', 2058, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:repairOrder:query', '#', 'admin', '2023-04-03 11:15:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2060, '维修工单新增', 2058, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:repairOrder:add', '#', 'admin', '2023-04-03 11:15:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2061, '维修工单修改', 2058, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:repairOrder:edit', '#', 'admin', '2023-04-03 11:15:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2062, '维修工单删除', 2058, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:repairOrder:remove', '#', 'admin', '2023-04-03 11:15:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2063, '维修工单导出', 2058, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:repairOrder:export', '#', 'admin', '2023-04-03 11:15:17', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2023-03-24 14:39:26', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2023-03-24 14:39:26', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 341 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', NULL, '/system/config', '127.0.0.1', '内网IP', '{\"configId\":5,\"configKey\":\"sys.account.registerUser\",\"configName\":\"账号自助-是否开启用户注册功能\",\"configType\":\"Y\",\"configValue\":\"true\",\"createBy\":\"admin\",\"createTime\":\"2023-03-24 14:39:22\",\"params\":{},\"remark\":\"是否开启注册用户功能（true开启，false关闭）\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 15:04:53', 143);
INSERT INTO `sys_oper_log` VALUES (101, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"员工状态\",\"dictType\":\"sys_steff_status\",\"params\":{},\"remark\":\"0在职 1离职\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 09:49:39', 141);
INSERT INTO `sys_oper_log` VALUES (102, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-27 09:49:38\",\"dictId\":100,\"dictName\":\"员工状态\",\"dictType\":\"sys_steff_status\",\"params\":{},\"remark\":\"员工状态列表\\n\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 09:50:13', 178);
INSERT INTO `sys_oper_log` VALUES (103, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-27 09:49:38\",\"dictId\":100,\"dictName\":\"员工状态\",\"dictType\":\"sys_staff_status\",\"params\":{},\"remark\":\"员工状态列表\\n\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 09:51:29', 121);
INSERT INTO `sys_oper_log` VALUES (104, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"在职\",\"dictSort\":1,\"dictType\":\"sys_staff_status\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"remark\":\"员工在职\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 09:51:57', 141);
INSERT INTO `sys_oper_log` VALUES (105, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"离职\",\"dictSort\":2,\"dictType\":\"sys_staff_status\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"remark\":\"员工离职\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 09:52:13', 155);
INSERT INTO `sys_oper_log` VALUES (106, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_staff\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 09:53:12', 557);
INSERT INTO `sys_oper_log` VALUES (107, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 10:02:58', 168);
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_staff\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 10:03:02', 245);
INSERT INTO `sys_oper_log` VALUES (109, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"staff\",\"className\":\"SysStaff\",\"columns\":[{\"capJavaField\":\"\\r\\nstaffId\",\"columnComment\":\"员工ID\",\"columnId\":16,\"columnName\":\"\\r\\nstaff_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 10:03:01\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"\\r\\nstaffId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"部门ID\",\"columnId\":17,\"columnName\":\"dept_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 10:03:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PostId\",\"columnComment\":\"岗位ID\",\"columnId\":18,\"columnName\":\"post_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 10:03:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"postId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserName\",\"columnComment\":\"用户账号\",\"columnId\":19,\"columnName\":\"user_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 10:03:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userName\",\"javaType\":\"String\",\"list\":true,\"pa', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 10:04:56', 251);
INSERT INTO `sys_oper_log` VALUES (110, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_staff\"}', NULL, 0, NULL, '2023-03-27 10:04:59', 742);
INSERT INTO `sys_oper_log` VALUES (111, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_staff\"}', NULL, 0, NULL, '2023-03-27 10:05:00', 156);
INSERT INTO `sys_oper_log` VALUES (112, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '192.168.0.9', '内网IP', '{\"tables\":\"sys_area\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 11:53:05', 292);
INSERT INTO `sys_oper_log` VALUES (113, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '192.168.0.9', '内网IP', '{\"businessName\":\"area\",\"className\":\"SysArea\",\"columns\":[{\"capJavaField\":\"AreaId\",\"columnComment\":\"区域ID\",\"columnId\":32,\"columnName\":\"area_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 11:53:05\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"areaId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"AreaName\",\"columnComment\":\"区域名称\",\"columnId\":33,\"columnName\":\"area_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 11:53:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"areaName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Leader\",\"columnComment\":\"负责人\",\"columnId\":34,\"columnName\":\"leader\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 11:53:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"leader\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"LeaderPhone\",\"columnComment\":\"负责人手机号\",\"columnId\":35,\"columnName\":\"leader_phone\",\"columnType\":\"varchar(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 11:53:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"leaderPhone\",\"javaType\":\"String\",\"list\":true,\"param', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 11:53:50', 252);
INSERT INTO `sys_oper_log` VALUES (114, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '192.168.0.9', '内网IP', '{\"tables\":\"sys_staff,sys_area\"}', NULL, 0, NULL, '2023-03-27 11:54:17', 982);
INSERT INTO `sys_oper_log` VALUES (115, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '192.168.0.9', '内网IP', '{\"tables\":\"sys_staff,sys_area\"}', NULL, 0, NULL, '2023-03-27 11:54:17', 258);
INSERT INTO `sys_oper_log` VALUES (116, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"time-range\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"巡更管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"patrol\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 14:04:13', 112);
INSERT INTO `sys_oper_log` VALUES (117, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"validCode\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"维修管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"repair\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 14:06:39', 95);
INSERT INTO `sys_oper_log` VALUES (118, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-24 14:38:51\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 14:07:14', 94);
INSERT INTO `sys_oper_log` VALUES (119, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-24 14:38:51\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 14:07:28', 110);
INSERT INTO `sys_oper_log` VALUES (120, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-24 14:38:51\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 14:07:38', 166);
INSERT INTO `sys_oper_log` VALUES (121, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-24 14:38:51\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 14:07:56', 94);
INSERT INTO `sys_oper_log` VALUES (122, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2001', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 15:17:14', 163);
INSERT INTO `sys_oper_log` VALUES (123, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2005', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 15:17:17', 107);
INSERT INTO `sys_oper_log` VALUES (124, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2004', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 15:17:20', 168);
INSERT INTO `sys_oper_log` VALUES (125, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2003', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 15:17:22', 78);
INSERT INTO `sys_oper_log` VALUES (126, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2002', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 15:17:25', 77);
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2000', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 15:17:29', 97);
INSERT INTO `sys_oper_log` VALUES (128, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/2,3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 15:23:20', 249);
INSERT INTO `sys_oper_log` VALUES (129, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_area,sys_personnel,sys_patrol_point,sys_patrol_line\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 15:23:51', 984);
INSERT INTO `sys_oper_log` VALUES (130, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"personnel\",\"className\":\"SysPersonnel\",\"columns\":[{\"capJavaField\":\"\\r\\npersonnelId\",\"columnComment\":\"员工ID\",\"columnId\":70,\"columnName\":\"\\r\\npersonnel_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 15:23:50\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"\\r\\npersonnelId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"部门ID\",\"columnId\":71,\"columnName\":\"dept_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 15:23:50\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PostId\",\"columnComment\":\"岗位ID\",\"columnId\":72,\"columnName\":\"post_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 15:23:50\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"postId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PersonnelLoginName\",\"columnComment\":\"用户账号\",\"columnId\":73,\"columnName\":\"personnel_login_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 15:23:50\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"per', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 15:25:31', 315);
INSERT INTO `sys_oper_log` VALUES (131, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_personnel\"}', NULL, 0, NULL, '2023-03-27 15:25:41', 754);
INSERT INTO `sys_oper_log` VALUES (132, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_personnel\"}', NULL, 0, NULL, '2023-03-27 15:25:41', 158);
INSERT INTO `sys_oper_log` VALUES (133, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"area\",\"className\":\"SysArea\",\"columns\":[{\"capJavaField\":\"AreaId\",\"columnComment\":\"区域ID\",\"columnId\":41,\"columnName\":\"area_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 15:23:50\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"areaId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"AreaName\",\"columnComment\":\"区域名称\",\"columnId\":42,\"columnName\":\"area_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 15:23:50\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"areaName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"AreaLeader\",\"columnComment\":\"负责人\",\"columnId\":43,\"columnName\":\"area_leader\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 15:23:50\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"areaLeader\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"AreaLeaderPhone\",\"columnComment\":\"负责人手机号\",\"columnId\":44,\"columnName\":\"area_leader_phone\",\"columnType\":\"varchar(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 15:23:50\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"areaLeaderPhone\",\"javaType\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 15:28:26', 173);
INSERT INTO `sys_oper_log` VALUES (134, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_area\"}', NULL, 0, NULL, '2023-03-27 15:28:30', 174);
INSERT INTO `sys_oper_log` VALUES (135, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_area\"}', NULL, 0, NULL, '2023-03-27 15:28:30', 89);
INSERT INTO `sys_oper_log` VALUES (136, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/7', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 15:30:41', 230);
INSERT INTO `sys_oper_log` VALUES (137, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_personnel\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 15:30:48', 254);
INSERT INTO `sys_oper_log` VALUES (138, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"personnel\",\"className\":\"SysPersonnel\",\"columns\":[{\"capJavaField\":\"\\r\\npersonnelId\",\"columnComment\":\"员工ID\",\"columnId\":86,\"columnName\":\"\\r\\npersonnel_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 15:30:47\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"\\r\\npersonnelId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"部门ID\",\"columnId\":87,\"columnName\":\"dept_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 15:30:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PostId\",\"columnComment\":\"岗位ID\",\"columnId\":88,\"columnName\":\"post_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 15:30:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"postId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PersonnelLoginName\",\"columnComment\":\"用户账号\",\"columnId\":89,\"columnName\":\"personnel_login_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 15:30:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"per', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 15:31:45', 190);
INSERT INTO `sys_oper_log` VALUES (139, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_personnel\"}', NULL, 0, NULL, '2023-03-27 15:31:50', 100);
INSERT INTO `sys_oper_log` VALUES (140, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_personnel\"}', NULL, 0, NULL, '2023-03-27 15:31:51', 106);
INSERT INTO `sys_oper_log` VALUES (141, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"personnel\",\"className\":\"SysPersonnel\",\"columns\":[{\"capJavaField\":\"\\r\\npersonnelId\",\"columnComment\":\"员工ID\",\"columnId\":86,\"columnName\":\"\\r\\npersonnel_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 15:30:47\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"\\r\\npersonnelId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2023-03-27 15:31:45\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"部门ID\",\"columnId\":87,\"columnName\":\"dept_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 15:30:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2023-03-27 15:31:45\",\"usableColumn\":false},{\"capJavaField\":\"PostId\",\"columnComment\":\"岗位ID\",\"columnId\":88,\"columnName\":\"post_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 15:30:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"postId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2023-03-27 15:31:45\",\"usableColumn\":false},{\"capJavaField\":\"PersonnelLoginName\",\"columnComment\":\"用户账号\",\"columnId\":89,\"columnName\":\"personnel_login_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 15:30:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 15:34:08', 234);
INSERT INTO `sys_oper_log` VALUES (142, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_personnel\"}', NULL, 0, NULL, '2023-03-27 15:34:12', 252);
INSERT INTO `sys_oper_log` VALUES (143, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_personnel\"}', NULL, 0, NULL, '2023-03-27 15:34:12', 146);
INSERT INTO `sys_oper_log` VALUES (144, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/sys_personnel', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 15:35:25', 271);
INSERT INTO `sys_oper_log` VALUES (145, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/8', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 15:37:22', 167);
INSERT INTO `sys_oper_log` VALUES (146, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_personnel\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 15:37:28', 266);
INSERT INTO `sys_oper_log` VALUES (147, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"personnel\",\"className\":\"SysPersonnel\",\"columns\":[{\"capJavaField\":\"PersonnelId\",\"columnComment\":\"员工ID\",\"columnId\":102,\"columnName\":\"personnel_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 15:37:28\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"personnelId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"部门ID\",\"columnId\":103,\"columnName\":\"dept_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 15:37:28\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PostId\",\"columnComment\":\"岗位ID\",\"columnId\":104,\"columnName\":\"post_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 15:37:28\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"postId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PersonnelLoginName\",\"columnComment\":\"用户账号\",\"columnId\":105,\"columnName\":\"personnel_login_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 15:37:28\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"personnelLo', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 15:39:04', 235);
INSERT INTO `sys_oper_log` VALUES (148, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_personnel\"}', NULL, 0, NULL, '2023-03-27 15:39:08', 157);
INSERT INTO `sys_oper_log` VALUES (149, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_personnel\"}', NULL, 0, NULL, '2023-03-27 15:39:08', 105);
INSERT INTO `sys_oper_log` VALUES (150, '员工管理', 2, 'com.ruoyi.web.controller.system.SysPersonnelController.edit()', 'PUT', 1, 'admin', NULL, '/system/personnel', '192.168.0.9', '内网IP', '{\"createBy\":\"\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"params\":{},\"personnelId\":1,\"personnelLoginName\":\"123\",\"personnelName\":\"ceshi\",\"personnelPassword\":\"\",\"personnelSex\":\"0\",\"personnelStatus\":\"0\",\"postId\":4,\"posts\":[{\"flag\":false,\"params\":{},\"postCode\":\"user\",\"postId\":4,\"postName\":\"普通员工\",\"postSort\":4}],\"updateBy\":\"\",\"updateTime\":\"2023-03-27 16:02:32\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 16:02:31', 121);
INSERT INTO `sys_oper_log` VALUES (151, '员工管理', 2, 'com.ruoyi.web.controller.system.SysPersonnelController.edit()', 'PUT', 1, 'admin', NULL, '/system/personnel', '192.168.0.9', '内网IP', '{\"createBy\":\"\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":104,\"params\":{},\"personnelId\":1,\"personnelLoginName\":\"123\",\"personnelName\":\"ceshi\",\"personnelPassword\":\"\",\"personnelSex\":\"0\",\"personnelStatus\":\"0\",\"postId\":4,\"postIds\":[],\"posts\":[{\"flag\":false,\"params\":{},\"postCode\":\"user\",\"postId\":4,\"postName\":\"普通员工\",\"postSort\":4}],\"updateBy\":\"\",\"updateTime\":\"2023-03-28 10:50:34\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 10:50:33', 100);
INSERT INTO `sys_oper_log` VALUES (152, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '192.168.0.9', '内网IP', '{\"tables\":\"sys_personnel_post\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 11:19:59', 254);
INSERT INTO `sys_oper_log` VALUES (153, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '192.168.0.9', '内网IP', '{\"businessName\":\"post\",\"className\":\"SysPersonnelPost\",\"columns\":[{\"capJavaField\":\"PersonnelId\",\"columnComment\":\"员工id\",\"columnId\":118,\"columnName\":\"personnel_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 11:19:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"personnelId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PostId\",\"columnComment\":\"岗位id\",\"columnId\":119,\"columnName\":\"post_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 11:19:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"postId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"了\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"system\",\"options\":\"{}\",\"packageName\":\"com.ruoyi.system\",\"params\":{},\"sub\":false,\"tableComment\":\" 是\",\"tableId\":10,\"tableName\":\"sys_personnel_post\",\"tplCategory\":\"crud\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 11:20:37', 180);
INSERT INTO `sys_oper_log` VALUES (154, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '192.168.0.9', '内网IP', '{\"businessName\":\"post\",\"className\":\"SysPersonnelPost\",\"columns\":[{\"capJavaField\":\"PersonnelId\",\"columnComment\":\"员工id\",\"columnId\":118,\"columnName\":\"personnel_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 11:19:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"personnelId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 11:20:37\",\"usableColumn\":false},{\"capJavaField\":\"PostId\",\"columnComment\":\"岗位id\",\"columnId\":119,\"columnName\":\"post_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 11:19:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"postId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 11:20:37\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"了\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"system\",\"options\":\"{}\",\"packageName\":\"com.ruoyi.system\",\"params\":{},\"sub\":false,\"tableComment\":\"员工岗位关联表\",\"tableId\":10,\"tableName\":\"sys_personnel_post\",\"tplCategory\":\"crud\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 11:20:58', 140);
INSERT INTO `sys_oper_log` VALUES (155, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '192.168.0.9', '内网IP', '{\"businessName\":\"post\",\"className\":\"SysPersonnelPost\",\"columns\":[{\"capJavaField\":\"PersonnelId\",\"columnComment\":\"员工id\",\"columnId\":118,\"columnName\":\"personnel_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 11:19:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"personnelId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 11:20:57\",\"usableColumn\":false},{\"capJavaField\":\"PostId\",\"columnComment\":\"岗位id\",\"columnId\":119,\"columnName\":\"post_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 11:19:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"postId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 11:20:57\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"了\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"system\",\"options\":\"{}\",\"packageName\":\"com.ruoyi.system\",\"params\":{},\"sub\":false,\"tableComment\":\"员工岗位关联表\",\"tableId\":10,\"tableName\":\"sys_personnel_post\",\"tplCategory\":\"crud\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 11:21:09', 150);
INSERT INTO `sys_oper_log` VALUES (156, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '192.168.0.9', '内网IP', '{\"tables\":\"sys_personnel_post\"}', NULL, 0, NULL, '2023-03-28 11:21:12', 612);
INSERT INTO `sys_oper_log` VALUES (157, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '192.168.0.9', '内网IP', '{\"tables\":\"sys_personnel_post\"}', NULL, 0, NULL, '2023-03-28 11:21:12', 85);
INSERT INTO `sys_oper_log` VALUES (158, '员工管理', 2, 'com.ruoyi.web.controller.system.SysPersonnelController.edit()', 'PUT', 1, 'admin', NULL, '/system/personnel', '192.168.0.9', '内网IP', '{\"createBy\":\"\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":104,\"deptName\":\"市场部门\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":104,\"params\":{},\"personnelId\":1,\"personnelLoginName\":\"123\",\"personnelName\":\"ceshi\",\"personnelPassword\":\"\",\"personnelSex\":\"0\",\"personnelStatus\":\"0\",\"postId\":4,\"postIds\":[3],\"posts\":[{\"flag\":false,\"params\":{},\"postCode\":\"user\",\"postId\":4,\"postName\":\"普通员工\",\"postSort\":4}],\"updateBy\":\"\",\"updateTime\":\"2023-03-28 10:50:34\"}', NULL, 1, 'class com.ruoyi.system.domain.SysPersonnel cannot be cast to class com.ruoyi.common.core.domain.entity.SysUser (com.ruoyi.system.domain.SysPersonnel and com.ruoyi.common.core.domain.entity.SysUser are in unnamed module of loader org.springframework.boot.devtools.restart.classloader.RestartClassLoader @4e833efd)', '2023-03-28 11:46:47', 32);
INSERT INTO `sys_oper_log` VALUES (159, '员工管理', 1, 'com.ruoyi.web.controller.system.SysPersonnelController.add()', 'POST', 1, 'admin', NULL, '/system/personnel', '192.168.0.9', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-28 14:15:41\",\"deptId\":104,\"params\":{},\"personnelEntryTime\":\"2023-03-23\",\"personnelLoginName\":\"912996613\",\"personnelName\":\"张三\",\"personnelPassword\":\"$2a$10$eBaiPingl.Hz7bCRivhfe.VS.gSZPKE4uoi3X0JihoAyGISF1lzqu\",\"personnelPhone\":\"18232005950\",\"personnelResignationTime\":\"2023-03-31\",\"personnelSex\":\"0\",\"personnelStatus\":\"1\",\"postIds\":[1,2]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'personnel_id\' cannot be null\r\n### The error may exist in file [C:\\CODE\\xungen\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysPersonnelPostMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_personnel_post(personnel_id, post_id) values                        (?,?)          ,              (?,?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'personnel_id\' cannot be null\n; Column \'personnel_id\' cannot be null; nested exception is java.sql.SQLIntegrityConstraintViolationException: Column \'personnel_id\' cannot be null', '2023-03-28 14:15:40', 219);
INSERT INTO `sys_oper_log` VALUES (160, '员工管理', 1, 'com.ruoyi.web.controller.system.SysPersonnelController.add()', 'POST', 1, 'admin', NULL, '/system/personnel', '192.168.0.9', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-28 14:18:15\",\"deptId\":104,\"params\":{},\"personnelEntryTime\":\"2023-03-23\",\"personnelLoginName\":\"912996613\",\"personnelName\":\"张三\",\"personnelPassword\":\"$2a$10$S5v4Eezr1fNNLH4NRInjKOClvwj3dS/OR0IOU4z0H8cWPA3H7P7gS\",\"personnelPhone\":\"18232005950\",\"personnelResignationTime\":\"2023-03-31\",\"personnelSex\":\"0\",\"personnelStatus\":\"1\",\"postIds\":[1,2]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'personnel_id\' cannot be null\r\n### The error may exist in file [C:\\CODE\\xungen\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysPersonnelPostMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_personnel_post(personnel_id, post_id) values                        (?,?)          ,              (?,?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'personnel_id\' cannot be null\n; Column \'personnel_id\' cannot be null; nested exception is java.sql.SQLIntegrityConstraintViolationException: Column \'personnel_id\' cannot be null', '2023-03-28 14:18:43', 29960);
INSERT INTO `sys_oper_log` VALUES (161, '员工管理', 1, 'com.ruoyi.web.controller.system.SysPersonnelController.add()', 'POST', 1, 'admin', NULL, '/system/personnel', '192.168.0.9', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-28 14:24:13\",\"deptId\":104,\"params\":{},\"personnelEntryTime\":\"2023-03-23\",\"personnelId\":2,\"personnelLoginName\":\"912996618\",\"personnelName\":\"裂了\",\"personnelPassword\":\"$2a$10$T6rXR3QkN1P4/jhQGJO1Bu84wz8p7KpzGhV.MfF/WXWYtD3Gw4dUm\",\"personnelPhone\":\"18232005950\",\"personnelResignationTime\":\"2023-03-31\",\"personnelSex\":\"1\",\"personnelStatus\":\"0\",\"postIds\":[2,3]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 14:24:20', 8676);
INSERT INTO `sys_oper_log` VALUES (162, '员工管理', 2, 'com.ruoyi.web.controller.system.SysPersonnelController.edit()', 'PUT', 1, 'admin', NULL, '/system/personnel', '192.168.0.9', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-28 14:24:13\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":104,\"deptName\":\"市场部门\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"params\":{},\"personnelEntryTime\":\"2023-03-23\",\"personnelId\":2,\"personnelLoginName\":\"912996618\",\"personnelName\":\"裂了\",\"personnelPassword\":\"\",\"personnelPhone\":\"18232005950\",\"personnelResignationTime\":\"2023-03-31\",\"personnelSex\":\"1\",\"personnelStatus\":\"0\",\"postIds\":[2],\"posts\":[],\"updateBy\":\"\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2-2\' for key \'sys_personnel_post.PRIMARY\'\r\n### The error may exist in file [C:\\CODE\\xungen\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysPersonnelPostMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_personnel_post(personnel_id, post_id) values                        (?,?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2-2\' for key \'sys_personnel_post.PRIMARY\'\n; Duplicate entry \'2-2\' for key \'sys_personnel_post.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2-2\' for key \'sys_personnel_post.PRIMARY\'', '2023-03-28 14:33:32', 59);
INSERT INTO `sys_oper_log` VALUES (163, '员工管理', 2, 'com.ruoyi.web.controller.system.SysPersonnelController.edit()', 'PUT', 1, 'admin', NULL, '/system/personnel', '192.168.0.9', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-28 14:24:13\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":104,\"deptName\":\"市场部门\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"params\":{},\"personnelEntryTime\":\"2023-03-23\",\"personnelId\":2,\"personnelLoginName\":\"912996618\",\"personnelName\":\"裂了\",\"personnelPassword\":\"\",\"personnelPhone\":\"18232005950\",\"personnelResignationTime\":\"2023-03-31\",\"personnelSex\":\"1\",\"personnelStatus\":\"0\",\"postIds\":[2],\"posts\":[],\"updateBy\":\"\",\"updateTime\":\"2023-03-28 14:36:07\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 14:36:06', 434);
INSERT INTO `sys_oper_log` VALUES (164, '员工管理', 2, 'com.ruoyi.web.controller.system.SysPersonnelController.edit()', 'PUT', 1, 'admin', NULL, '/system/personnel', '192.168.0.9', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-28 14:24:13\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"params\":{},\"personnelEntryTime\":\"2023-03-23\",\"personnelId\":2,\"personnelLoginName\":\"912996618\",\"personnelName\":\"裂了\",\"personnelPassword\":\"\",\"personnelPhone\":\"18232005950\",\"personnelResignationTime\":\"2023-03-31\",\"personnelSex\":\"1\",\"personnelStatus\":\"0\",\"postIds\":[2,3],\"posts\":[],\"updateBy\":\"\",\"updateTime\":\"2023-03-28 14:48:06\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 14:48:05', 439);
INSERT INTO `sys_oper_log` VALUES (165, '员工管理', 2, 'com.ruoyi.web.controller.system.SysPersonnelController.edit()', 'PUT', 1, 'admin', NULL, '/system/personnel', '192.168.0.9', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-28 14:24:13\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"params\":{},\"personnelEntryTime\":\"2023-03-23\",\"personnelId\":2,\"personnelLoginName\":\"912996618\",\"personnelName\":\"裂了\",\"personnelPassword\":\"\",\"personnelPhone\":\"18232005950\",\"personnelResignationTime\":\"2023-03-31\",\"personnelSex\":\"1\",\"personnelStatus\":\"0\",\"postIds\":[2],\"posts\":[{\"flag\":false,\"params\":{},\"postCode\":\"se\",\"postName\":\"项目经理\",\"postSort\":2},{\"flag\":false,\"params\":{},\"postCode\":\"hr\",\"postName\":\"人力资源\",\"postSort\":3}],\"updateBy\":\"\",\"updateTime\":\"2023-03-28 14:55:46\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 14:55:45', 602);
INSERT INTO `sys_oper_log` VALUES (166, '员工管理', 2, 'com.ruoyi.web.controller.system.SysPersonnelController.edit()', 'PUT', 1, 'admin', NULL, '/system/personnel', '192.168.0.9', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-28 14:24:13\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"params\":{},\"personnelEntryTime\":\"2023-03-23\",\"personnelId\":2,\"personnelLoginName\":\"912996618\",\"personnelName\":\"裂了\",\"personnelPassword\":\"\",\"personnelPhone\":\"18232005950\",\"personnelResignationTime\":\"2023-03-31\",\"personnelSex\":\"1\",\"personnelStatus\":\"0\",\"postIds\":[2,3],\"posts\":[{\"flag\":false,\"params\":{},\"postCode\":\"se\",\"postName\":\"项目经理\",\"postSort\":2}],\"updateBy\":\"\",\"updateTime\":\"2023-03-28 14:55:54\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 14:55:52', 403);
INSERT INTO `sys_oper_log` VALUES (167, '员工管理', 2, 'com.ruoyi.web.controller.system.SysPersonnelController.edit()', 'PUT', 1, 'admin', NULL, '/system/personnel', '192.168.0.9', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-28 14:24:13\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"params\":{},\"personnelEntryTime\":\"2023-03-23\",\"personnelId\":2,\"personnelLoginName\":\"912996618\",\"personnelName\":\"裂了\",\"personnelPassword\":\"\",\"personnelPhone\":\"18232005950\",\"personnelResignationTime\":\"2023-03-31\",\"personnelSex\":\"1\",\"personnelStatus\":\"0\",\"postIds\":[3],\"posts\":[{\"flag\":false,\"params\":{},\"postCode\":\"se\",\"postName\":\"项目经理\",\"postSort\":2},{\"flag\":false,\"params\":{},\"postCode\":\"hr\",\"postName\":\"人力资源\",\"postSort\":3}],\"updateBy\":\"\",\"updateTime\":\"2023-03-28 14:56:01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 14:56:00', 328);
INSERT INTO `sys_oper_log` VALUES (168, '员工管理', 3, 'com.ruoyi.web.controller.system.SysPersonnelController.remove()', 'DELETE', 1, 'admin', NULL, '/system/personnel/1', '192.168.0.9', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 14:56:35', 112);
INSERT INTO `sys_oper_log` VALUES (169, '员工管理', 2, 'com.ruoyi.web.controller.system.SysPersonnelController.edit()', 'PUT', 1, 'admin', NULL, '/system/personnel', '192.168.0.9', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-28 14:24:13\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"params\":{},\"personnelEntryTime\":\"2023-03-23\",\"personnelId\":2,\"personnelLoginName\":\"912996618\",\"personnelName\":\"裂了\",\"personnelPassword\":\"\",\"personnelPhone\":\"18232005950\",\"personnelResignationTime\":\"2023-03-31\",\"personnelSex\":\"1\",\"personnelStatus\":\"0\",\"postIds\":[3,4],\"posts\":[{\"flag\":false,\"params\":{},\"postCode\":\"hr\",\"postName\":\"人力资源\",\"postSort\":3}],\"updateBy\":\"\",\"updateTime\":\"2023-03-28 14:56:49\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 14:56:48', 339);
INSERT INTO `sys_oper_log` VALUES (170, '员工管理', 3, 'com.ruoyi.web.controller.system.SysPersonnelController.remove()', 'DELETE', 1, 'admin', NULL, '/system/personnel/2', '192.168.0.9', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 15:21:50', 117);
INSERT INTO `sys_oper_log` VALUES (171, '员工管理', 1, 'com.ruoyi.web.controller.system.SysPersonnelController.add()', 'POST', 1, 'admin', NULL, '/system/personnel', '192.168.0.9', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-28 15:22:22\",\"deptId\":103,\"params\":{},\"personnelEntryTime\":\"2023-03-23\",\"personnelId\":3,\"personnelLoginName\":\"912996618\",\"personnelName\":\"李乐\",\"personnelPassword\":\"$2a$10$BlqZsOhRVQgeLTJrkaDdgu9/ja3Msdm7QuMfrgfLUxaZTJv8Zrt4S\",\"personnelPhone\":\"18232005950\",\"personnelResignationTime\":\"2023-03-24\",\"personnelSex\":\"0\",\"personnelStatus\":\"0\",\"postIds\":[1,4]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 15:22:21', 572);
INSERT INTO `sys_oper_log` VALUES (172, '员工管理', 2, 'com.ruoyi.web.controller.system.SysPersonnelController.edit()', 'PUT', 1, 'admin', NULL, '/system/personnel', '192.168.0.9', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-28 15:22:22\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"params\":{},\"personnelEntryTime\":\"2023-03-23\",\"personnelId\":3,\"personnelLoginName\":\"912996618\",\"personnelName\":\"李乐\",\"personnelPassword\":\"\",\"personnelPhone\":\"18232005950\",\"personnelResignationTime\":\"2023-03-24\",\"personnelSex\":\"1\",\"personnelStatus\":\"0\",\"postIds\":[1,4],\"posts\":[{\"flag\":false,\"params\":{},\"postCode\":\"ceo\",\"postName\":\"董事长\",\"postSort\":1},{\"flag\":false,\"params\":{},\"postCode\":\"user\",\"postName\":\"普通员工\",\"postSort\":4}],\"updateBy\":\"\",\"updateTime\":\"2023-03-28 15:22:32\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 15:22:30', 347);
INSERT INTO `sys_oper_log` VALUES (173, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '192.168.0.9', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2023-03-24 15:16:51\",\"delFlag\":\"0\",\"email\":\"\",\"loginDate\":\"2023-03-24 15:17:43\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"912996618\",\"params\":{},\"phonenumber\":\"18232005950\",\"postIds\":[],\"roleIds\":[2],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"912996618\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 15:24:46', 225);
INSERT INTO `sys_oper_log` VALUES (174, '员工管理', 2, 'com.ruoyi.web.controller.system.SysPersonnelController.resetPwd()', 'PUT', 1, 'admin', NULL, '/system/personnel/resetPwd', '192.168.0.9', '内网IP', '{\"params\":{},\"personnelId\":3,\"personnelPassword\":\"$2a$10$rgOlImRCZ0Ri9ojo0d9n2.pEx63FlBs1NALpmRw/XplNpBe5npIvy\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 15:36:35', 208);
INSERT INTO `sys_oper_log` VALUES (175, '员工管理', 2, 'com.ruoyi.web.controller.system.SysPersonnelController.edit()', 'PUT', 1, 'admin', NULL, '/system/personnel', '192.168.0.9', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-28 15:22:22\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"params\":{},\"personnelEntryTime\":\"2023-03-23\",\"personnelId\":3,\"personnelLoginName\":\"912996618\",\"personnelName\":\"李乐\",\"personnelPassword\":\"\",\"personnelPhone\":\"18232005950\",\"personnelResignationTime\":\"2023-03-24\",\"personnelSex\":\"1\",\"personnelStatus\":\"0\",\"postIds\":[1,4],\"posts\":[{\"flag\":false,\"params\":{},\"postCode\":\"ceo\",\"postName\":\"董事长\",\"postSort\":1},{\"flag\":false,\"params\":{},\"postCode\":\"user\",\"postName\":\"普通员工\",\"postSort\":4}],\"updateBy\":\"admin\",\"updateTime\":\"2023-03-28 15:37:08\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 15:37:07', 346);
INSERT INTO `sys_oper_log` VALUES (176, '员工管理', 2, 'com.ruoyi.web.controller.system.SysPersonnelController.resetPwd()', 'PUT', 1, 'admin', NULL, '/system/personnel/resetPwd', '192.168.0.9', '内网IP', '{\"params\":{},\"personnelId\":3,\"personnelPassword\":\"$2a$10$y28OstWJGaEhhtzj6IW3kuViJrLRkwW9UTtxS6vQy7l8TZaBEQKCS\",\"updateBy\":\"admin\"}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'password\' in \'class com.ruoyi.system.domain.SysPersonnel\'', '2023-03-28 15:52:28', 102);
INSERT INTO `sys_oper_log` VALUES (177, '员工管理', 2, 'com.ruoyi.web.controller.system.SysPersonnelController.resetPwd()', 'PUT', 1, 'admin', NULL, '/system/personnel/resetPwd', '192.168.0.9', '内网IP', '{\"params\":{},\"personnelId\":3,\"personnelPassword\":\"$2a$10$tXItucaIHRleP5cjnKlkZuEhrz4my.orjXPbvw05mrV3yIBQK9AQ2\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 15:55:08', 281);
INSERT INTO `sys_oper_log` VALUES (178, '员工管理', 2, 'com.ruoyi.web.controller.system.SysPersonnelController.edit()', 'PUT', 1, 'admin', NULL, '/system/personnel', '192.168.0.9', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-28 15:22:22\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"params\":{},\"personnelEntryTime\":\"2023-03-23\",\"personnelId\":3,\"personnelLoginName\":\"912996618\",\"personnelName\":\"李乐\",\"personnelPassword\":\"\",\"personnelPhone\":\"18232005950\",\"personnelResignationTime\":\"2023-03-24\",\"personnelSex\":\"1\",\"personnelStatus\":\"0\",\"postIds\":[1,4],\"posts\":[{\"flag\":false,\"params\":{},\"postCode\":\"ceo\",\"postName\":\"董事长\",\"postSort\":1},{\"flag\":false,\"params\":{},\"postCode\":\"user\",\"postName\":\"普通员工\",\"postSort\":4}],\"updateBy\":\"admin\",\"updateTime\":\"2023-03-28 15:55:17\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 15:55:16', 476);
INSERT INTO `sys_oper_log` VALUES (179, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '192.168.0.9', '内网IP', '{\"children\":[],\"component\":\"system/personnel/index\",\"createTime\":\"2023-03-27 15:58:09\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"员工管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"personnel\",\"perms\":\"system:personnel:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 15:55:41', 134);
INSERT INTO `sys_oper_log` VALUES (180, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '192.168.0.9', '内网IP', '{\"children\":[],\"component\":\"system/personnel/index\",\"createTime\":\"2023-03-27 15:58:09\",\"icon\":\"people\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"员工管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"personnel\",\"perms\":\"system:personnel:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 15:56:06', 131);
INSERT INTO `sys_oper_log` VALUES (181, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', NULL, '/system/config', '192.168.0.9', '内网IP', '{\"configId\":5,\"configKey\":\"sys.account.registerUser\",\"configName\":\"账号自助-是否开启用户注册功能\",\"configType\":\"Y\",\"configValue\":\"false\",\"createBy\":\"admin\",\"createTime\":\"2023-03-24 14:39:22\",\"params\":{},\"remark\":\"是否开启注册用户功能（true开启，false关闭）\",\"updateBy\":\"admin\",\"updateTime\":\"2023-03-24 15:04:53\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 15:57:25', 104);
INSERT INTO `sys_oper_log` VALUES (182, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/4,5,6,9,10', '192.168.0.9', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 16:02:28', 229);
INSERT INTO `sys_oper_log` VALUES (183, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '192.168.0.9', '内网IP', '{\"tables\":\"sys_area,sys_patrol_point,sys_patrol_line,sys_patrol_line_patrol_point,sys_area_patrol_point\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 16:03:01', 824);
INSERT INTO `sys_oper_log` VALUES (184, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '192.168.0.9', '内网IP', '{\"businessName\":\"area\",\"className\":\"SysArea\",\"columns\":[{\"capJavaField\":\"AreaId\",\"columnComment\":\"区域ID\",\"columnId\":120,\"columnName\":\"area_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 16:03:00\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"areaId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"AreaName\",\"columnComment\":\"区域名称\",\"columnId\":121,\"columnName\":\"area_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 16:03:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"areaName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"AreaLeader\",\"columnComment\":\"负责人\",\"columnId\":122,\"columnName\":\"area_leader\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 16:03:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"areaLeader\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"AreaLeaderPhone\",\"columnComment\":\"负责人手机号\",\"columnId\":123,\"columnName\":\"area_leader_phone\",\"columnType\":\"varchar(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 16:03:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"areaLeaderPhone\",\"jav', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 16:04:48', 235);
INSERT INTO `sys_oper_log` VALUES (185, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '192.168.0.9', '内网IP', '{\"businessName\":\"point\",\"className\":\"SysAreaPatrolPoint\",\"columns\":[{\"capJavaField\":\"AreaId\",\"columnComment\":\"区域ID\",\"columnId\":129,\"columnName\":\"area_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 16:03:00\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"areaId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatrolPointId\",\"columnComment\":\"巡更点ID\",\"columnId\":130,\"columnName\":\"patrol_point_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 16:03:00\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"patrolPointId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"lile\",\"functionName\":\"区域和巡更点关联表\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"system\",\"options\":\"{}\",\"packageName\":\"com.ruoyi.system\",\"params\":{},\"sub\":false,\"tableComment\":\"区域和巡更点关联表\",\"tableId\":12,\"tableName\":\"sys_area_patrol_point\",\"tplCategory\":\"crud\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 16:05:43', 123);
INSERT INTO `sys_oper_log` VALUES (186, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '192.168.0.9', '内网IP', '{\"businessName\":\"line\",\"className\":\"SysPatrolLine\",\"columns\":[{\"capJavaField\":\"PatrolLineId\",\"columnComment\":\"巡更线路编号\",\"columnId\":131,\"columnName\":\"patrol_line_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 16:03:00\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"patrolLineId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatrolLineName\",\"columnComment\":\"巡更线路名称\",\"columnId\":132,\"columnName\":\"patrol_line_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 16:03:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"patrolLineName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":133,\"columnName\":\"create_by\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 16:03:00\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isPk\":\"0\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":134,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 16:03:00\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":false,\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isPk\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"Date\",\"list\":false,\"params\":{},\"pk\":false,\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 16:06:54', 187);
INSERT INTO `sys_oper_log` VALUES (187, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '192.168.0.9', '内网IP', '{\"businessName\":\"point\",\"className\":\"SysPatrolLinePatrolPoint\",\"columns\":[{\"capJavaField\":\"PatrolLineId\",\"columnComment\":\"巡更线路ID\",\"columnId\":138,\"columnName\":\"patrol_line_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 16:03:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"patrolLineId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatrolPointId\",\"columnComment\":\"巡更点ID\",\"columnId\":139,\"columnName\":\"patrol_point_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 16:03:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"patrolPointId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"巡更线与寻根点\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"system\",\"options\":\"{}\",\"packageName\":\"com.ruoyi.system\",\"params\":{},\"sub\":false,\"tableComment\":\"巡更线和巡更点关联表\",\"tableId\":14,\"tableName\":\"sys_patrol_line_patrol_point\",\"tplCategory\":\"crud\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 16:08:16', 103);
INSERT INTO `sys_oper_log` VALUES (188, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '192.168.0.9', '内网IP', '{\"businessName\":\"point\",\"className\":\"SysAreaPatrolPoint\",\"columns\":[{\"capJavaField\":\"AreaId\",\"columnComment\":\"区域ID\",\"columnId\":129,\"columnName\":\"area_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 16:03:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"areaId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 16:05:43\",\"usableColumn\":false},{\"capJavaField\":\"PatrolPointId\",\"columnComment\":\"巡更点ID\",\"columnId\":130,\"columnName\":\"patrol_point_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 16:03:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"patrolPointId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 16:05:43\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"lile\",\"functionName\":\"区域和巡更点关联表\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"system\",\"options\":\"{}\",\"packageName\":\"com.ruoyi.system\",\"params\":{},\"sub\":false,\"tableComment\":\"区域和巡更点关联表\",\"tableId\":12,\"tableName\":\"sys_area_patrol_point\",\"tplCategory\":\"crud\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 16:08:25', 127);
INSERT INTO `sys_oper_log` VALUES (189, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '192.168.0.9', '内网IP', '{\"businessName\":\"point\",\"className\":\"SysPatrolPoint\",\"columns\":[{\"capJavaField\":\"PatrolPointId\",\"columnComment\":\"巡更点ID\",\"columnId\":140,\"columnName\":\"patrol_point_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 16:03:01\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"patrolPointId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatrolPointName\",\"columnComment\":\"巡更点名称\",\"columnId\":141,\"columnName\":\"patrol_point_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 16:03:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"patrolPointName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatrolPointDescribe\",\"columnComment\":\"巡更点描述\",\"columnId\":142,\"columnName\":\"patrol_point_describe\",\"columnType\":\"varchar(800)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 16:03:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"patrolPointDescribe\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatrolPointUrl\",\"columnComment\":\"巡更点二维码\",\"columnId\":143,\"columnName\":\"patrol_point_url\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 16:03:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 16:11:27', 242);
INSERT INTO `sys_oper_log` VALUES (190, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '192.168.0.9', '内网IP', '{\"tables\":\"sys_area,sys_area_patrol_point,sys_patrol_line,sys_patrol_line_patrol_point,sys_patrol_point\"}', NULL, 0, NULL, '2023-03-28 16:11:41', 1224);
INSERT INTO `sys_oper_log` VALUES (191, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '192.168.0.9', '内网IP', '{\"tables\":\"sys_area,sys_area_patrol_point,sys_patrol_line,sys_patrol_line_patrol_point,sys_patrol_point\"}', NULL, 0, NULL, '2023-03-28 16:11:42', 908);
INSERT INTO `sys_oper_log` VALUES (192, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '192.168.0.9', '内网IP', '{\"tables\":\"sys_area,sys_area_patrol_point,sys_patrol_line,sys_patrol_line_patrol_point,sys_patrol_point\"}', NULL, 0, NULL, '2023-03-28 16:11:43', 582);
INSERT INTO `sys_oper_log` VALUES (193, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2020', '192.168.0.9', '内网IP', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2023-03-29 10:16:51', 6);
INSERT INTO `sys_oper_log` VALUES (194, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2021', '192.168.0.9', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 10:16:57', 132);
INSERT INTO `sys_oper_log` VALUES (195, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2022', '192.168.0.9', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 10:16:59', 117);
INSERT INTO `sys_oper_log` VALUES (196, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2023', '192.168.0.9', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 10:17:01', 125);
INSERT INTO `sys_oper_log` VALUES (197, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2024', '192.168.0.9', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 10:17:03', 98);
INSERT INTO `sys_oper_log` VALUES (198, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2025', '192.168.0.9', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 10:17:06', 179);
INSERT INTO `sys_oper_log` VALUES (199, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2020', '192.168.0.9', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 10:17:08', 140);
INSERT INTO `sys_oper_log` VALUES (200, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2015', '192.168.0.9', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 10:17:13', 104);
INSERT INTO `sys_oper_log` VALUES (201, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2016', '192.168.0.9', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 10:17:14', 140);
INSERT INTO `sys_oper_log` VALUES (202, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2017', '192.168.0.9', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 10:17:15', 121);
INSERT INTO `sys_oper_log` VALUES (203, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2018', '192.168.0.9', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 10:17:16', 86);
INSERT INTO `sys_oper_log` VALUES (204, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2019', '192.168.0.9', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 10:17:17', 84);
INSERT INTO `sys_oper_log` VALUES (205, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2014', '192.168.0.9', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 10:17:19', 103);
INSERT INTO `sys_oper_log` VALUES (206, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2031', '192.168.0.9', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 10:18:29', 113);
INSERT INTO `sys_oper_log` VALUES (207, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2027', '192.168.0.9', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 10:18:32', 97);
INSERT INTO `sys_oper_log` VALUES (208, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2028', '192.168.0.9', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 10:18:33', 151);
INSERT INTO `sys_oper_log` VALUES (209, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2029', '192.168.0.9', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 10:18:34', 120);
INSERT INTO `sys_oper_log` VALUES (210, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2030', '192.168.0.9', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 10:18:36', 84);
INSERT INTO `sys_oper_log` VALUES (211, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2026', '192.168.0.9', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 10:18:44', 117);
INSERT INTO `sys_oper_log` VALUES (212, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '192.168.0.9', '内网IP', '{\"businessName\":\"point\",\"className\":\"SysPatrolPoint\",\"columns\":[{\"capJavaField\":\"PatrolPointId\",\"columnComment\":\"巡更点ID\",\"columnId\":140,\"columnName\":\"patrol_point_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 16:03:01\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"patrolPointId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 16:11:26\",\"usableColumn\":false},{\"capJavaField\":\"PatrolPointName\",\"columnComment\":\"巡更点名称\",\"columnId\":141,\"columnName\":\"patrol_point_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 16:03:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"patrolPointName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 16:11:26\",\"usableColumn\":false},{\"capJavaField\":\"PatrolPointDescribe\",\"columnComment\":\"巡更点描述\",\"columnId\":142,\"columnName\":\"patrol_point_describe\",\"columnType\":\"varchar(800)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 16:03:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"patrolPointDescribe\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 16:11:27\",\"usableColumn\":false},{\"capJavaField\":\"PatrolPointUrl\",\"columnComment\":\"巡更点二维码\",\"columnId\":143,\"columnName\":\"patrol_point_url\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 16:03:01\",\"di', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 10:19:10', 197);
INSERT INTO `sys_oper_log` VALUES (213, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '192.168.0.9', '内网IP', '{\"tables\":\"sys_patrol_point\"}', NULL, 0, NULL, '2023-03-29 10:19:42', 268);
INSERT INTO `sys_oper_log` VALUES (214, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '192.168.0.9', '内网IP', '{\"tables\":\"sys_patrol_point\"}', NULL, 0, NULL, '2023-03-29 10:19:43', 89);
INSERT INTO `sys_oper_log` VALUES (215, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '192.168.0.9', '内网IP', '', NULL, 1, 'D:\\ruoyi\\uploadPath\\avatar\\2023\\03\\29\\blob_20230329151205A001.png', '2023-03-29 15:12:05', 199);
INSERT INTO `sys_oper_log` VALUES (216, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '192.168.0.9', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2023/03/29/blob_20230329153056A001.png\",\"code\":200}', 0, NULL, '2023-03-29 15:30:56', 291);
INSERT INTO `sys_oper_log` VALUES (217, '员工管理', 3, 'com.ruoyi.web.controller.system.SysPersonnelController.remove()', 'DELETE', 1, 'admin', NULL, '/system/personnel/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 11:04:37', 291);
INSERT INTO `sys_oper_log` VALUES (218, '员工管理', 1, 'com.ruoyi.web.controller.system.SysPersonnelController.add()', 'POST', 1, 'admin', NULL, '/system/personnel', '127.0.0.1', '内网IP', '{\"deptId\":103,\"params\":{},\"personnelLoginName\":\"912996618\",\"personnelName\":\"李乐\",\"personnelPassword\":\"123456\",\"personnelPhone\":\"18232005950\",\"personnelStatus\":\"0\",\"postIds\":[1,2]}', '{\"msg\":\"新增用户\'912996618\'失败，登录账号已存在\",\"code\":500}', 0, NULL, '2023-03-30 11:05:11', 10);
INSERT INTO `sys_oper_log` VALUES (219, '员工管理', 1, 'com.ruoyi.web.controller.system.SysPersonnelController.add()', 'POST', 1, 'admin', NULL, '/system/personnel', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-30 11:05:27\",\"deptId\":103,\"params\":{},\"personnelId\":4,\"personnelLoginName\":\"912996617\",\"personnelName\":\"李乐\",\"personnelPassword\":\"$2a$10$hbRWmL1/pfhYABUPZ.3gW./MUR9iGtjuk9R45BSaAFH5hqbKfF46S\",\"personnelPhone\":\"18232005950\",\"personnelStatus\":\"0\",\"postIds\":[1,2]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 11:05:25', 423);
INSERT INTO `sys_oper_log` VALUES (220, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/14,13,12,11', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 16:01:03', 171);
INSERT INTO `sys_oper_log` VALUES (221, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"point\",\"className\":\"SysPatrolPoint\",\"columns\":[{\"capJavaField\":\"PatrolPointId\",\"columnComment\":\"巡更点ID\",\"columnId\":140,\"columnName\":\"patrol_point_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 16:03:01\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"patrolPointId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2023-03-29 10:19:10\",\"usableColumn\":false},{\"capJavaField\":\"PatrolPointName\",\"columnComment\":\"巡更点名称\",\"columnId\":141,\"columnName\":\"patrol_point_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 16:03:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"patrolPointName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2023-03-29 10:19:10\",\"usableColumn\":false},{\"capJavaField\":\"PatrolPointDescribe\",\"columnComment\":\"巡更点描述\",\"columnId\":142,\"columnName\":\"patrol_point_describe\",\"columnType\":\"varchar(800)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 16:03:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"patrolPointDescribe\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2023-03-29 10:19:10\",\"usableColumn\":false},{\"capJavaField\":\"PatrolPointUrl\",\"columnComment\":\"巡更点二维码\",\"columnId\":143,\"columnName\":\"patrol_point_url\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 16:03:01\",\"di', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 16:05:18', 267);
INSERT INTO `sys_oper_log` VALUES (222, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_patrol_point\"}', NULL, 0, NULL, '2023-03-30 16:05:27', 289);
INSERT INTO `sys_oper_log` VALUES (223, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_patrol_point\"}', NULL, 0, NULL, '2023-03-30 16:05:27', 155);
INSERT INTO `sys_oper_log` VALUES (224, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/point/index\",\"createTime\":\"2023-03-29 10:20:04\",\"icon\":\"radio\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2032,\"menuName\":\"巡更点管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"point\",\"perms\":\"system:point:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 16:11:16', 154);
INSERT INTO `sys_oper_log` VALUES (225, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-27 14:06:39\",\"icon\":\"validCode\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"维修任务管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"repair\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 16:27:20', 87);
INSERT INTO `sys_oper_log` VALUES (226, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-27 14:04:13\",\"icon\":\"time-range\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"巡更任务管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"patrol\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 16:27:28', 156);
INSERT INTO `sys_oper_log` VALUES (227, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-03-30 16:27:40', 13);
INSERT INTO `sys_oper_log` VALUES (228, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-24 14:38:51\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 16:28:03', 99);
INSERT INTO `sys_oper_log` VALUES (229, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-24 14:38:51\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 16:28:10', 116);
INSERT INTO `sys_oper_log` VALUES (230, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-24 14:38:51\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 16:28:15', 105);
INSERT INTO `sys_oper_log` VALUES (231, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"巡更工单管理\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"patrolOrder\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 16:30:19', 120);
INSERT INTO `sys_oper_log` VALUES (232, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"维修工单管理\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"repairOrder\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 16:30:46', 132);
INSERT INTO `sys_oper_log` VALUES (233, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-30 16:30:19\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2038,\"menuName\":\"巡更工单管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"patrolOrder\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 16:30:59', 183);
INSERT INTO `sys_oper_log` VALUES (234, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-30 16:30:46\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2039,\"menuName\":\"维修工单管理\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"repairOrder\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 16:31:05', 134);
INSERT INTO `sys_oper_log` VALUES (235, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"巡更任务状态\",\"dictType\":\"sys_patrol_status\",\"params\":{},\"remark\":\"巡更任务状态\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 16:57:10', 153);
INSERT INTO `sys_oper_log` VALUES (236, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未开始\",\"dictSort\":1,\"dictType\":\"sys_patrol_status\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 16:57:39', 117);
INSERT INTO `sys_oper_log` VALUES (237, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"进行中\",\"dictSort\":2,\"dictType\":\"sys_patrol_status\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 16:57:53', 133);
INSERT INTO `sys_oper_log` VALUES (238, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已完成\",\"dictSort\":3,\"dictType\":\"sys_patrol_status\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 16:58:08', 133);
INSERT INTO `sys_oper_log` VALUES (239, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"巡更结果\",\"dictType\":\"sys_patrol_result\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 17:19:10', 155);
INSERT INTO `sys_oper_log` VALUES (240, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"正常\",\"dictSort\":1,\"dictType\":\"sys_patrol_result\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 17:19:27', 207);
INSERT INTO `sys_oper_log` VALUES (241, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"异常\",\"dictSort\":2,\"dictType\":\"sys_patrol_result\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 17:19:38', 114);
INSERT INTO `sys_oper_log` VALUES (242, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-30 17:19:10\",\"dictId\":102,\"dictName\":\"巡更结果\",\"dictType\":\"sys_patrol_result\",\"params\":{},\"remark\":\"巡更结果\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 17:19:51', 134);
INSERT INTO `sys_oper_log` VALUES (243, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-30 16:57:10\",\"dictId\":101,\"dictName\":\"巡更/维修任务状态\",\"dictType\":\"sys_patrol_status\",\"params\":{},\"remark\":\"巡更/维修任务状态\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 17:20:01', 145);
INSERT INTO `sys_oper_log` VALUES (244, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"报修工单状态\",\"dictType\":\"sys_repair_order_status\",\"params\":{},\"remark\":\"报修工单状态\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 17:47:14', 142);
INSERT INTO `sys_oper_log` VALUES (245, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已处理\",\"dictSort\":1,\"dictType\":\"sys_repair_order_status\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 17:47:29', 150);
INSERT INTO `sys_oper_log` VALUES (246, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未处理\",\"dictSort\":2,\"dictType\":\"sys_repair_order_status\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 17:47:36', 111);
INSERT INTO `sys_oper_log` VALUES (247, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_patrol,sys_patrol_personnel,sys_patrol_patrol_point\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 09:35:50', 814);
INSERT INTO `sys_oper_log` VALUES (248, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"patrol\",\"className\":\"SysPatrol\",\"columns\":[{\"capJavaField\":\"PatrolId\",\"columnComment\":\"巡更任务编号\",\"columnId\":153,\"columnName\":\"patrol_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 09:35:50\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"patrolId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatrolName\",\"columnComment\":\"巡更任务名称\",\"columnId\":154,\"columnName\":\"patrol_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 09:35:50\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"patrolName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatrolDescribe\",\"columnComment\":\"巡更任务描述\",\"columnId\":155,\"columnName\":\"patrol_describe\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 09:35:50\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"patrolDescribe\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatrolPrincipal\",\"columnComment\":\"巡更任务负责人\",\"columnId\":156,\"columnName\":\"patrol_principal\",\"columnType\":\"varchar(10)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 09:35:50\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 09:40:24', 362);
INSERT INTO `sys_oper_log` VALUES (249, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_patrol\"}', NULL, 0, NULL, '2023-03-31 09:40:52', 242);
INSERT INTO `sys_oper_log` VALUES (250, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_patrol\"}', NULL, 0, NULL, '2023-03-31 09:40:53', 133);
INSERT INTO `sys_oper_log` VALUES (251, '员工管理', 2, 'com.ruoyi.web.controller.system.SysPersonnelController.edit()', 'PUT', 1, 'admin', NULL, '/system/personnel', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-30 11:05:27\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"params\":{},\"personnelId\":4,\"personnelLoginName\":\"912996617\",\"personnelName\":\"李乐\",\"personnelPassword\":\"\",\"personnelPhone\":\"18232005950\",\"personnelStatus\":\"0\",\"postIds\":[1,2,3],\"posts\":[{\"flag\":false,\"params\":{},\"postCode\":\"ceo\",\"postName\":\"董事长\",\"postSort\":1},{\"flag\":false,\"params\":{},\"postCode\":\"se\",\"postName\":\"项目经理\",\"postSort\":2}],\"updateBy\":\"\",\"updateTime\":\"2023-03-31 11:32:06\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 11:32:05', 457);
INSERT INTO `sys_oper_log` VALUES (252, '巡更任务管理', 1, 'com.ruoyi.web.controller.system.SysPatrolController.add()', 'POST', 1, 'admin', NULL, '/system/patrol', '127.0.0.1', '内网IP', '{\"params\":{},\"patrolCreateTime\":\"2023-03-30\",\"patrolDescribe\":\"测试\",\"patrolEndTime\":\"2023-03-31\",\"patrolName\":\"测试\",\"patrolPhone\":\"18232005950\",\"patrolPrincipal\":\"测试\",\"patrolStartTime\":\"2023-03-29\",\"patrolStatus\":\"0\",\"remark\":\"测试\"}', NULL, 1, '获取用户信息异常', '2023-03-31 14:06:58', 9);
INSERT INTO `sys_oper_log` VALUES (253, '巡更任务管理', 1, 'com.ruoyi.web.controller.system.SysPatrolController.add()', 'POST', 1, 'admin', NULL, '/system/patrol', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-31 14:18:31\",\"params\":{},\"patrolCreateTime\":\"2023-03-17\",\"patrolDescribe\":\"测试\",\"patrolEndTime\":\"2023-03-24\",\"patrolId\":1,\"patrolName\":\"测试\",\"patrolPhone\":\"测试\",\"patrolPrincipal\":\"测试\",\"patrolStartTime\":\"2023-03-08\",\"patrolStatus\":\"0\",\"remark\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 14:18:30', 128);
INSERT INTO `sys_oper_log` VALUES (254, '巡更任务管理', 2, 'com.ruoyi.web.controller.system.SysPatrolController.edit()', 'PUT', 1, 'admin', NULL, '/system/patrol', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-31 14:18:32\",\"params\":{},\"patrolCreateTime\":\"2023-03-17\",\"patrolDescribe\":\"测试\",\"patrolEndTime\":\"2023-03-24\",\"patrolId\":1,\"patrolName\":\"测试\",\"patrolPhone\":\"测试\",\"patrolPrincipal\":\"测试\",\"patrolStartTime\":\"2023-03-08\",\"patrolStatus\":\"0\",\"remark\":\"测试\",\"updateTime\":\"2023-03-31 14:30:14\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 14:30:13', 182);
INSERT INTO `sys_oper_log` VALUES (255, '巡更任务管理', 2, 'com.ruoyi.web.controller.system.SysPatrolController.edit()', 'PUT', 1, 'admin', NULL, '/system/patrol', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-31 14:18:32\",\"params\":{},\"patrolCreateTime\":\"2023-03-17\",\"patrolDescribe\":\"测试\",\"patrolEndTime\":\"2023-03-24\",\"patrolId\":1,\"patrolName\":\"测试\",\"patrolPhone\":\"测试\",\"patrolPrincipal\":\"测试\",\"patrolStartTime\":\"2023-03-08\",\"patrolStatus\":\"0\",\"remark\":\"测试\",\"updateTime\":\"2023-03-31 14:33:31\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 14:33:30', 56036);
INSERT INTO `sys_oper_log` VALUES (256, '巡更任务管理', 2, 'com.ruoyi.web.controller.system.SysPatrolController.edit()', 'PUT', 1, 'admin', NULL, '/system/patrol', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-31 14:18:32\",\"params\":{},\"patrolCreateTime\":\"2023-03-17\",\"patrolDescribe\":\"测试\",\"patrolEndTime\":\"2023-03-24\",\"patrolId\":1,\"patrolName\":\"测试\",\"patrolPhone\":\"测试\",\"patrolPrincipal\":\"测试\",\"patrolStartTime\":\"2023-03-08\",\"patrolStatus\":\"0\",\"remark\":\"测试\",\"updateTime\":\"2023-03-31 14:34:30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 14:34:29', 42154);
INSERT INTO `sys_oper_log` VALUES (257, '员工管理', 2, 'com.ruoyi.web.controller.system.SysPersonnelController.edit()', 'PUT', 1, 'admin', NULL, '/system/personnel', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-30 11:05:27\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"params\":{},\"personnelId\":4,\"personnelLoginName\":\"912996617\",\"personnelName\":\"李乐\",\"personnelPassword\":\"\",\"personnelPhone\":\"18232005950\",\"personnelStatus\":\"0\",\"postIds\":[1,2],\"posts\":[{\"flag\":false,\"params\":{},\"postCode\":\"ceo\",\"postName\":\"董事长\",\"postSort\":1},{\"flag\":false,\"params\":{},\"postCode\":\"se\",\"postName\":\"项目经理\",\"postSort\":2},{\"flag\":false,\"params\":{},\"postCode\":\"hr\",\"postName\":\"人力资源\",\"postSort\":3}],\"updateBy\":\"\",\"updateTime\":\"2023-03-31 14:36:46\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 14:36:45', 578);
INSERT INTO `sys_oper_log` VALUES (258, '巡更任务管理', 2, 'com.ruoyi.web.controller.system.SysPatrolController.edit()', 'PUT', 1, 'admin', NULL, '/system/patrol', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-31 14:18:32\",\"params\":{},\"patrolCreateTime\":\"2023-03-17\",\"patrolDescribe\":\"测试\",\"patrolEndTime\":\"2023-03-24\",\"patrolId\":1,\"patrolName\":\"测试\",\"patrolPhone\":\"测试\",\"patrolPrincipal\":\"测试\",\"patrolStartTime\":\"2023-03-08\",\"patrolStatus\":\"0\",\"remark\":\"测试\",\"updateTime\":\"2023-03-31 14:46:17\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 14:46:16', 387967);
INSERT INTO `sys_oper_log` VALUES (259, '巡更任务管理', 3, 'com.ruoyi.web.controller.system.SysPatrolController.remove()', 'DELETE', 1, 'admin', NULL, '/system/patrol/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 14:50:47', 166);
INSERT INTO `sys_oper_log` VALUES (260, '巡更任务管理', 1, 'com.ruoyi.web.controller.system.SysPatrolController.add()', 'POST', 1, 'admin', NULL, '/system/patrol', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-31 14:51:14\",\"params\":{},\"patrolCreateTime\":\"2023-03-24\",\"patrolDescribe\":\"测试\",\"patrolEndTime\":\"2023-03-09\",\"patrolId\":2,\"patrolName\":\"测试\",\"patrolPhone\":\"12345678910\",\"patrolPointIds\":[],\"patrolPrincipal\":\"测试\",\"patrolStartTime\":\"2023-03-22\",\"patrolStatus\":\"0\",\"personnelIds\":[4],\"remark\":\"测试\"}', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'personnel\' not found. Available parameters are [arg0, collection, list]', '2023-03-31 14:51:13', 153);
INSERT INTO `sys_oper_log` VALUES (261, '巡更任务管理', 1, 'com.ruoyi.web.controller.system.SysPatrolController.add()', 'POST', 1, 'admin', NULL, '/system/patrol', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-31 15:04:26\",\"params\":{},\"patrolCreateTime\":\"2023-03-23\",\"patrolDescribe\":\"测试\",\"patrolEndTime\":\"2023-03-23\",\"patrolId\":3,\"patrolName\":\"测试\",\"patrolPhone\":\"12345678910\",\"patrolPointIds\":[],\"patrolPrincipal\":\"测试\",\"patrolStartTime\":\"2023-03-07\",\"patrolStatus\":\"0\",\"personnelIds\":[4]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 15:04:25', 369);
INSERT INTO `sys_oper_log` VALUES (262, '巡更任务管理', 3, 'com.ruoyi.web.controller.system.SysPatrolController.remove()', 'DELETE', 1, 'admin', NULL, '/system/patrol/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 15:04:34', 181);
INSERT INTO `sys_oper_log` VALUES (263, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/patrol/index\",\"createTime\":\"2023-03-31 09:41:25\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2040,\"menuName\":\"巡更任务管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"patrol\",\"perms\":\"system:patrol:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"修改菜单\'巡更任务管理\'失败，菜单名称已存在\",\"code\":500}', 0, NULL, '2023-03-31 15:06:01', 26);
INSERT INTO `sys_oper_log` VALUES (264, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-27 14:04:13\",\"icon\":\"time-range\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"巡更任务管理1\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"patrol\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 15:06:14', 112);
INSERT INTO `sys_oper_log` VALUES (265, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/patrol/index\",\"createTime\":\"2023-03-31 09:41:25\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2040,\"menuName\":\"巡更任务管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"patrol\",\"perms\":\"system:patrol:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 15:06:21', 117);
INSERT INTO `sys_oper_log` VALUES (266, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/patrol/index\",\"createTime\":\"2023-03-31 09:41:25\",\"icon\":\"time-range\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2040,\"menuName\":\"巡更任务管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"patrol\",\"perms\":\"system:patrol:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 15:07:17', 100);
INSERT INTO `sys_oper_log` VALUES (267, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2006', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 15:07:21', 102);
INSERT INTO `sys_oper_log` VALUES (268, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/18', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 15:12:13', 119);
INSERT INTO `sys_oper_log` VALUES (269, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/17', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 15:12:16', 187);
INSERT INTO `sys_oper_log` VALUES (270, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_repair,sys_repair_personnel,sys_repair_patrol_point\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 15:12:47', 389);
INSERT INTO `sys_oper_log` VALUES (271, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"repair\",\"className\":\"SysRepair\",\"columns\":[{\"capJavaField\":\"RepairId\",\"columnComment\":\"维修任务编号\",\"columnId\":171,\"columnName\":\"repair_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 15:12:47\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"repairId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":19,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RepairName\",\"columnComment\":\"维修任务名称\",\"columnId\":172,\"columnName\":\"repair_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 15:12:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"repairName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":19,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RepairDescribe\",\"columnComment\":\"维修任务描述\",\"columnId\":173,\"columnName\":\"repair_describe\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 15:12:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"repairDescribe\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":19,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RepairPrincipal\",\"columnComment\":\"维修任务负责人\",\"columnId\":174,\"columnName\":\"repair_principal\",\"columnType\":\"varchar(10)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 15:12:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 15:13:51', 283);
INSERT INTO `sys_oper_log` VALUES (272, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_repair\"}', NULL, 0, NULL, '2023-03-31 15:14:27', 487);
INSERT INTO `sys_oper_log` VALUES (273, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_repair\"}', NULL, 0, NULL, '2023-03-31 15:14:28', 129);
INSERT INTO `sys_oper_log` VALUES (274, '维修任务', 1, 'com.ruoyi.web.controller.system.SysRepairController.add()', 'POST', 1, 'admin', NULL, '/system/repair', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-31 16:18:44\",\"params\":{},\"patrolPointIds\":[],\"personnelIds\":[4],\"repairActualEndTime\":\"2023-03-18\",\"repairActualStartTime\":\"2023-03-24\",\"repairDescribe\":\"测试\",\"repairId\":1,\"repairName\":\"测试\",\"repairPhone\":\"12345678910\",\"repairPrincipal\":\"测\",\"repairStartTime\":\"2023-03-08\",\"repairStatus\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 16:18:43', 358);
INSERT INTO `sys_oper_log` VALUES (275, '维修任务', 2, 'com.ruoyi.web.controller.system.SysRepairController.edit()', 'PUT', 1, 'admin', NULL, '/system/repair', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-31 16:18:44\",\"params\":{},\"patrolPointIds\":[],\"personnelIds\":[],\"repairActualEndTime\":\"2023-03-18\",\"repairActualStartTime\":\"2023-03-24\",\"repairDescribe\":\"测试\",\"repairId\":1,\"repairName\":\"测试\",\"repairPhone\":\"12345678910\",\"repairPrincipal\":\"测\",\"repairStartTime\":\"2023-03-08\",\"repairStatus\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2023-03-31 16:18:56\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 16:18:55', 180);
INSERT INTO `sys_oper_log` VALUES (276, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-27 14:06:39\",\"icon\":\"validCode\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"维修任务管理1\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"repair\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 16:19:16', 148);
INSERT INTO `sys_oper_log` VALUES (277, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/repair/index\",\"createTime\":\"2023-03-31 15:14:49\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2046,\"menuName\":\"维修任务\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"repair\",\"perms\":\"system:repair:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 16:19:24', 166);
INSERT INTO `sys_oper_log` VALUES (278, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2007', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 16:19:35', 121);
INSERT INTO `sys_oper_log` VALUES (279, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/repair/index\",\"createTime\":\"2023-03-31 15:14:49\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2046,\"menuName\":\"维修任务管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"repair\",\"perms\":\"system:repair:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 16:19:47', 152);
INSERT INTO `sys_oper_log` VALUES (280, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/repair/index\",\"createTime\":\"2023-03-31 15:14:49\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2046,\"menuName\":\"维修任务管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"repair\",\"perms\":\"system:repair:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 16:20:16', 161);
INSERT INTO `sys_oper_log` VALUES (281, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/repair/index\",\"createTime\":\"2023-03-31 15:14:49\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2046,\"menuName\":\"维修任务管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"repair\",\"perms\":\"system:repair:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 16:20:33', 142);
INSERT INTO `sys_oper_log` VALUES (282, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/patrol/index\",\"createTime\":\"2023-03-31 09:41:25\",\"icon\":\"time-range\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2040,\"menuName\":\"巡更任务管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"patrol\",\"perms\":\"system:patrol:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 16:20:38', 108);
INSERT INTO `sys_oper_log` VALUES (283, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/21', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 16:23:31', 114);
INSERT INTO `sys_oper_log` VALUES (284, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/20', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 16:23:33', 147);
INSERT INTO `sys_oper_log` VALUES (285, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_patrol_order,sys_patrol_order_img\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 16:23:57', 393);
INSERT INTO `sys_oper_log` VALUES (286, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"order\",\"className\":\"SysPatrolOrder\",\"columns\":[{\"capJavaField\":\"PatrolOrderId\",\"columnComment\":\"巡更工单编号\",\"columnId\":189,\"columnName\":\"patrol_order_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 16:23:57\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"patrolOrderId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":22,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatrolPointId\",\"columnComment\":\"巡更点编号\",\"columnId\":190,\"columnName\":\"patrol_point_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 16:23:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"patrolPointId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":22,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatrolPointName\",\"columnComment\":\"巡更点名称\",\"columnId\":191,\"columnName\":\"patrol_point_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 16:23:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"patrolPointName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":22,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatrolId\",\"columnComment\":\"巡更任务编号\",\"columnId\":192,\"columnName\":\"patrol_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 16:23:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 16:25:04', 257);
INSERT INTO `sys_oper_log` VALUES (287, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_patrol_order\"}', NULL, 0, NULL, '2023-03-31 16:25:29', 669);
INSERT INTO `sys_oper_log` VALUES (288, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_patrol_order\"}', NULL, 0, NULL, '2023-03-31 16:25:30', 151);
INSERT INTO `sys_oper_log` VALUES (289, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"patrolOrder\",\"className\":\"SysPatrolOrder\",\"columns\":[{\"capJavaField\":\"PatrolOrderId\",\"columnComment\":\"巡更工单编号\",\"columnId\":189,\"columnName\":\"patrol_order_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 16:23:57\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"patrolOrderId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":22,\"updateBy\":\"\",\"updateTime\":\"2023-03-31 16:25:04\",\"usableColumn\":false},{\"capJavaField\":\"PatrolPointId\",\"columnComment\":\"巡更点编号\",\"columnId\":190,\"columnName\":\"patrol_point_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 16:23:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"patrolPointId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":22,\"updateBy\":\"\",\"updateTime\":\"2023-03-31 16:25:04\",\"usableColumn\":false},{\"capJavaField\":\"PatrolPointName\",\"columnComment\":\"巡更点名称\",\"columnId\":191,\"columnName\":\"patrol_point_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 16:23:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"patrolPointName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":22,\"updateBy\":\"\",\"updateTime\":\"2023-03-31 16:25:04\",\"usableColumn\":false},{\"capJavaField\":\"PatrolId\",\"columnComment\":\"巡更任务编号\",\"columnId\":192,\"columnName\":\"patrol_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 16:23:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 16:38:15', 287);
INSERT INTO `sys_oper_log` VALUES (290, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_patrol_order\"}', NULL, 0, NULL, '2023-03-31 16:38:21', 128);
INSERT INTO `sys_oper_log` VALUES (291, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_patrol_order\"}', NULL, 0, NULL, '2023-03-31 16:38:21', 128);
INSERT INTO `sys_oper_log` VALUES (292, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/sys_patrol_order', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 16:43:28', 245);
INSERT INTO `sys_oper_log` VALUES (293, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"patrolOrder\",\"className\":\"SysPatrolOrder\",\"columns\":[{\"capJavaField\":\"PatrolOrderId\",\"columnComment\":\"巡更工单编号\",\"columnId\":189,\"columnName\":\"patrol_order_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 16:23:57\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"patrolOrderId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":22,\"updateBy\":\"\",\"updateTime\":\"2023-03-31 16:43:28\",\"usableColumn\":false},{\"capJavaField\":\"PatrolPointId\",\"columnComment\":\"巡更点编号\",\"columnId\":190,\"columnName\":\"patrol_point_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 16:23:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"patrolPointId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":22,\"updateBy\":\"\",\"updateTime\":\"2023-03-31 16:43:28\",\"usableColumn\":false},{\"capJavaField\":\"PatrolPointName\",\"columnComment\":\"巡更点名称\",\"columnId\":191,\"columnName\":\"patrol_point_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 16:23:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"patrolPointName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":22,\"updateBy\":\"\",\"updateTime\":\"2023-03-31 16:43:28\",\"usableColumn\":false},{\"capJavaField\":\"PatrolId\",\"columnComment\":\"巡更任务编号\",\"columnId\":192,\"columnName\":\"patrol_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 16:23:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 16:44:31', 206);
INSERT INTO `sys_oper_log` VALUES (294, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_patrol_order\"}', NULL, 0, NULL, '2023-03-31 16:50:57', 377);
INSERT INTO `sys_oper_log` VALUES (295, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_patrol_order\"}', NULL, 0, NULL, '2023-03-31 16:50:57', 168);
INSERT INTO `sys_oper_log` VALUES (296, '巡更任务管理', 1, 'com.ruoyi.web.controller.system.SysPatrolController.add()', 'POST', 1, 'admin', NULL, '/system/patrol', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-04-01 14:33:23\",\"params\":{},\"patrolCreateTime\":\"2023-04-14\",\"patrolDescribe\":\"测试\",\"patrolEndTime\":\"2023-04-21\",\"patrolId\":4,\"patrolName\":\"测试\",\"patrolPhone\":\"18232005950\",\"patrolPointIds\":[],\"patrolPrincipal\":\"测试\",\"patrolStartTime\":\"2023-04-07\",\"patrolStatus\":\"0\",\"personnelIds\":[4]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-01 14:33:26', 3120);
INSERT INTO `sys_oper_log` VALUES (297, '维修任务', 2, 'com.ruoyi.web.controller.system.SysRepairController.edit()', 'PUT', 1, 'admin', NULL, '/system/repair', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-31 16:18:44\",\"params\":{},\"patrolPointIds\":[],\"personnelIds\":[4],\"repairActualEndTime\":\"2023-03-18\",\"repairActualStartTime\":\"2023-03-24\",\"repairDescribe\":\"测试\",\"repairId\":1,\"repairName\":\"测试\",\"repairPhone\":\"12345678910\",\"repairPrincipal\":\"测\",\"repairStartTime\":\"2023-03-08\",\"repairStatus\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2023-04-03 10:17:03\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 10:17:02', 251);
INSERT INTO `sys_oper_log` VALUES (298, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-30 16:30:19\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2038,\"menuName\":\"巡更工单管理1\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"patrolOrder\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 10:20:15', 185);
INSERT INTO `sys_oper_log` VALUES (299, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/order/index\",\"createTime\":\"2023-03-31 16:26:14\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2052,\"menuName\":\"巡更工单管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"order\",\"perms\":\"system:order:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 10:20:27', 129);
INSERT INTO `sys_oper_log` VALUES (300, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2038', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 10:20:36', 95);
INSERT INTO `sys_oper_log` VALUES (301, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/order/index\",\"createTime\":\"2023-03-31 16:26:14\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2052,\"menuName\":\"巡更工单管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"order\",\"perms\":\"system:order:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 10:20:43', 125);
INSERT INTO `sys_oper_log` VALUES (302, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/repair/index\",\"createTime\":\"2023-03-31 15:14:49\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2046,\"menuName\":\"维修任务管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"repair\",\"perms\":\"system:repair:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 10:21:30', 150);
INSERT INTO `sys_oper_log` VALUES (303, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/repair/index\",\"createTime\":\"2023-03-31 15:14:49\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2046,\"menuName\":\"维修任务管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"repair\",\"perms\":\"system:repair:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 10:22:01', 142);
INSERT INTO `sys_oper_log` VALUES (304, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/patrolOrder/index\",\"createTime\":\"2023-03-31 16:26:14\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2052,\"menuName\":\"巡更工单管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"order\",\"perms\":\"system:order:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 10:24:37', 78);
INSERT INTO `sys_oper_log` VALUES (305, '巡更工单管理', 1, 'com.ruoyi.web.controller.system.SysPatrolOrderController.add()', 'POST', 1, 'admin', NULL, '/system/patrolOrder', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-04-03 10:50:32\",\"params\":{},\"patrolOrderId\":1,\"patrolPointName\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 10:50:31', 124);
INSERT INTO `sys_oper_log` VALUES (306, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/sys_patrol_order', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 10:59:32', 264);
INSERT INTO `sys_oper_log` VALUES (307, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_repair_order,sys_repair_order_img\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 11:12:03', 345);
INSERT INTO `sys_oper_log` VALUES (308, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"repairOrder\",\"className\":\"SysRepairOrder\",\"columns\":[{\"capJavaField\":\"RepairOrderId\",\"columnComment\":\"报修工单编号\",\"columnId\":205,\"columnName\":\"repair_order_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-04-03 11:12:03\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"repairOrderId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":24,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatrolPointId\",\"columnComment\":\"巡更点编号\",\"columnId\":206,\"columnName\":\"patrol_point_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-04-03 11:12:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"patrolPointId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":24,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatrolPointName\",\"columnComment\":\"巡更点名称\",\"columnId\":207,\"columnName\":\"patrol_point_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-03 11:12:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"patrolPointName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":24,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PersonnelId\",\"columnComment\":\"员工编号\",\"columnId\":208,\"columnName\":\"personnel_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-04-03 11:12:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 11:13:34', 236);
INSERT INTO `sys_oper_log` VALUES (309, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"patrolOrder\",\"className\":\"SysPatrolOrder\",\"columns\":[{\"capJavaField\":\"PatrolOrderId\",\"columnComment\":\"巡更工单编号\",\"columnId\":189,\"columnName\":\"patrol_order_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 16:23:57\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"patrolOrderId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":22,\"updateBy\":\"\",\"updateTime\":\"2023-04-03 10:59:32\",\"usableColumn\":false},{\"capJavaField\":\"PatrolPointId\",\"columnComment\":\"巡更点编号\",\"columnId\":190,\"columnName\":\"patrol_point_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 16:23:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"patrolPointId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":22,\"updateBy\":\"\",\"updateTime\":\"2023-04-03 10:59:32\",\"usableColumn\":false},{\"capJavaField\":\"PatrolPointName\",\"columnComment\":\"巡更点名称\",\"columnId\":191,\"columnName\":\"patrol_point_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 16:23:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"patrolPointName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":22,\"updateBy\":\"\",\"updateTime\":\"2023-04-03 10:59:32\",\"usableColumn\":false},{\"capJavaField\":\"PatrolId\",\"columnComment\":\"巡更任务编号\",\"columnId\":192,\"columnName\":\"patrol_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-31 16:23:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 11:14:03', 475);
INSERT INTO `sys_oper_log` VALUES (310, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_repair_order\"}', NULL, 0, NULL, '2023-04-03 11:14:52', 261);
INSERT INTO `sys_oper_log` VALUES (311, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_repair_order\"}', NULL, 0, NULL, '2023-04-03 11:14:52', 120);
INSERT INTO `sys_oper_log` VALUES (312, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/sys_repair_order', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-03 11:19:18', 231);
INSERT INTO `sys_oper_log` VALUES (313, '字典类型', 5, 'com.ruoyi.web.controller.system.SysDictTypeController.export()', 'POST', 1, 'admin', NULL, '/system/dict/type/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"2\"}', NULL, 0, NULL, '2023-04-04 09:24:06', 926);
INSERT INTO `sys_oper_log` VALUES (314, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-30 16:30:46\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2039,\"menuName\":\"维修工单管理1\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"repairOrder\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-04 09:37:34', 96);
INSERT INTO `sys_oper_log` VALUES (315, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/repairOrder/index\",\"createTime\":\"2023-04-03 11:15:17\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2058,\"menuName\":\"维修工单管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"repairOrder\",\"perms\":\"system:repairOrder:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-04 09:37:49', 96);
INSERT INTO `sys_oper_log` VALUES (316, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2039', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-04 09:37:53', 102);
INSERT INTO `sys_oper_log` VALUES (317, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/repairOrder/index\",\"createTime\":\"2023-04-03 11:15:17\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2058,\"menuName\":\"维修工单管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"repairOrder\",\"perms\":\"system:repairOrder:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-04 09:42:49', 153);
INSERT INTO `sys_oper_log` VALUES (318, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/15,16,19,22,23,24,25', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-04 10:03:20', 218);
INSERT INTO `sys_oper_log` VALUES (319, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_repair,sys_patrol_point\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-04 10:03:50', 319);
INSERT INTO `sys_oper_log` VALUES (320, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_repair_order,sys_patrol_order,sys_patrol\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-04 10:04:12', 413);
INSERT INTO `sys_oper_log` VALUES (321, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"point\",\"className\":\"SysPatrolPoint\",\"columns\":[{\"capJavaField\":\"PatrolPointId\",\"columnComment\":\"巡更点ID\",\"columnId\":224,\"columnName\":\"patrol_point_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-04-04 10:03:50\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"patrolPointId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":26,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatrolPointName\",\"columnComment\":\"巡更点名称\",\"columnId\":225,\"columnName\":\"patrol_point_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-04 10:03:50\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patrolPointName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":26,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatrolPointDescribe\",\"columnComment\":\"巡更点描述\",\"columnId\":226,\"columnName\":\"patrol_point_describe\",\"columnType\":\"varchar(800)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-04 10:03:50\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"patrolPointDescribe\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":26,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatrolPointUrl\",\"columnComment\":\"巡更点二维码\",\"columnId\":227,\"columnName\":\"patrol_point_url\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-04 10:03:50\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":t', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-04 10:05:38', 199);
INSERT INTO `sys_oper_log` VALUES (322, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"repair\",\"className\":\"SysRepair\",\"columns\":[{\"capJavaField\":\"RepairId\",\"columnComment\":\"维修任务编号\",\"columnId\":237,\"columnName\":\"repair_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-04-04 10:03:50\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"repairId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":27,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RepairName\",\"columnComment\":\"维修任务名称\",\"columnId\":238,\"columnName\":\"repair_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-04 10:03:50\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"repairName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":27,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RepairDescribe\",\"columnComment\":\"维修任务描述\",\"columnId\":239,\"columnName\":\"repair_describe\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-04 10:03:50\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"repairDescribe\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":27,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RepairPrincipal\",\"columnComment\":\"维修任务负责人\",\"columnId\":240,\"columnName\":\"repair_principal\",\"columnType\":\"varchar(10)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-04 10:03:50\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isP', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-04 10:06:39', 197);
INSERT INTO `sys_oper_log` VALUES (323, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"patrol\",\"className\":\"SysPatrol\",\"columns\":[{\"capJavaField\":\"PatrolId\",\"columnComment\":\"巡更任务编号\",\"columnId\":251,\"columnName\":\"patrol_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-04-04 10:04:11\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"patrolId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":28,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatrolName\",\"columnComment\":\"巡更任务名称\",\"columnId\":252,\"columnName\":\"patrol_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-04 10:04:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patrolName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":28,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatrolDescribe\",\"columnComment\":\"巡更任务描述\",\"columnId\":253,\"columnName\":\"patrol_describe\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-04 10:04:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"patrolDescribe\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":28,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatrolPrincipal\",\"columnComment\":\"巡更任务负责人\",\"columnId\":254,\"columnName\":\"patrol_principal\",\"columnType\":\"varchar(10)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-04 10:04:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isP', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-04 10:07:20', 231);
INSERT INTO `sys_oper_log` VALUES (324, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"order\",\"className\":\"SysPatrolOrder\",\"columns\":[{\"capJavaField\":\"PatrolOrderId\",\"columnComment\":\"巡更工单编号\",\"columnId\":265,\"columnName\":\"patrol_order_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-04-04 10:04:11\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"patrolOrderId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":29,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatrolPointId\",\"columnComment\":\"巡更点编号\",\"columnId\":266,\"columnName\":\"patrol_point_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-04-04 10:04:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patrolPointId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":29,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatrolPointName\",\"columnComment\":\"巡更点名称\",\"columnId\":267,\"columnName\":\"patrol_point_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-04 10:04:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patrolPointName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":29,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatrolId\",\"columnComment\":\"巡更任务编号\",\"columnId\":268,\"columnName\":\"patrol_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-04-04 10:04:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-04 10:08:18', 184);
INSERT INTO `sys_oper_log` VALUES (325, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"order\",\"className\":\"SysRepairOrder\",\"columns\":[{\"capJavaField\":\"RepairOrderId\",\"columnComment\":\"报修工单编号\",\"columnId\":278,\"columnName\":\"repair_order_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-04-04 10:04:11\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"repairOrderId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":30,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatrolPointId\",\"columnComment\":\"巡更点编号\",\"columnId\":279,\"columnName\":\"patrol_point_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-04-04 10:04:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"patrolPointId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":30,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PatrolPointName\",\"columnComment\":\"巡更点名称\",\"columnId\":280,\"columnName\":\"patrol_point_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-04 10:04:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"patrolPointName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":30,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PersonnelId\",\"columnComment\":\"员工编号\",\"columnId\":281,\"columnName\":\"personnel_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-04-04 10:04:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-04 10:09:00', 207);
INSERT INTO `sys_oper_log` VALUES (326, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', NULL, '/system/user/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-04-04 10:18:09', 1221);
INSERT INTO `sys_oper_log` VALUES (327, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"tool/gen/index\",\"createTime\":\"2023-03-24 14:38:53\",\"icon\":\"code\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":116,\"menuName\":\"代码生成\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":3,\"path\":\"gen\",\"perms\":\"tool:gen:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-04 10:19:08', 172);
INSERT INTO `sys_oper_log` VALUES (328, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/26,27', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-04 10:19:25', 253);
INSERT INTO `sys_oper_log` VALUES (329, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/29,30', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-04 11:08:58', 243);
INSERT INTO `sys_oper_log` VALUES (330, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_patrol\"}', NULL, 0, NULL, '2023-04-04 11:09:10', 194);
INSERT INTO `sys_oper_log` VALUES (331, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_patrol\"}', NULL, 0, NULL, '2023-04-04 11:09:11', 124);
INSERT INTO `sys_oper_log` VALUES (332, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_repair_order\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-04 11:09:29', 184);
INSERT INTO `sys_oper_log` VALUES (333, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_patrol,sys_repair_order\"}', NULL, 0, NULL, '2023-04-04 11:09:32', 191);
INSERT INTO `sys_oper_log` VALUES (334, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_patrol,sys_repair_order\"}', NULL, 0, NULL, '2023-04-04 11:09:33', 193);
INSERT INTO `sys_oper_log` VALUES (335, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_patrol\"}', NULL, 0, NULL, '2023-04-04 14:53:34', 687);
INSERT INTO `sys_oper_log` VALUES (336, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_patrol\"}', NULL, 0, NULL, '2023-04-04 14:53:36', 152);
INSERT INTO `sys_oper_log` VALUES (337, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_patrol\"}', NULL, 0, NULL, '2023-04-04 14:53:38', 103);
INSERT INTO `sys_oper_log` VALUES (338, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_patrol\"}', NULL, 0, NULL, '2023-04-04 15:14:02', 218);
INSERT INTO `sys_oper_log` VALUES (339, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_patrol\"}', NULL, 0, NULL, '2023-04-04 15:14:03', 128);
INSERT INTO `sys_oper_log` VALUES (340, '员工管理', 2, 'com.ruoyi.web.controller.system.SysPersonnelController.edit()', 'PUT', 1, 'admin', NULL, '/system/personnel', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-30 11:05:27\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"params\":{},\"personnelId\":4,\"personnelLoginName\":\"912996617\",\"personnelName\":\"测试\",\"personnelPassword\":\"\",\"personnelPhone\":\"18233333333\",\"personnelStatus\":\"0\",\"postIds\":[1,2],\"posts\":[{\"flag\":false,\"params\":{},\"postCode\":\"ceo\",\"postName\":\"董事长\",\"postSort\":1},{\"flag\":false,\"params\":{},\"postCode\":\"se\",\"postName\":\"项目经理\",\"postSort\":2}],\"updateBy\":\"\",\"updateTime\":\"2023-04-04 15:18:42\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-04 15:18:39', 232);

-- ----------------------------
-- Table structure for sys_patrol
-- ----------------------------
DROP TABLE IF EXISTS `sys_patrol`;
CREATE TABLE `sys_patrol`  (
  `patrol_id` bigint NOT NULL AUTO_INCREMENT COMMENT '巡更任务编号',
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
  PRIMARY KEY (`patrol_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_patrol
-- ----------------------------
INSERT INTO `sys_patrol` VALUES (4, '测试', '测试', '测试', '18232005950', '0', '2023-04-07 00:00:00', '2023-04-21 00:00:00', '2023-04-14 00:00:00', NULL, 'admin', '2023-04-01 14:33:24', '', NULL);

-- ----------------------------
-- Table structure for sys_patrol_order
-- ----------------------------
DROP TABLE IF EXISTS `sys_patrol_order`;
CREATE TABLE `sys_patrol_order`  (
  `patrol_order_id` bigint NOT NULL AUTO_INCREMENT COMMENT '巡更工单编号',
  `patrol_point_id` bigint NULL DEFAULT NULL COMMENT '巡更点编号',
  `patrol_point_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '巡更点名称',
  `patrol_id` bigint NULL DEFAULT NULL COMMENT '巡更任务编号',
  `patrol_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '巡更任务名称',
  `personnel_id` bigint NULL DEFAULT NULL COMMENT '巡更人编号',
  `personnel_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '巡更人姓名',
  `patrol_result` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '巡更结果',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`patrol_order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_patrol_order
-- ----------------------------
INSERT INTO `sys_patrol_order` VALUES (1, NULL, '测试', NULL, NULL, NULL, NULL, '0', NULL, '', '2023-04-03 10:50:32', '', NULL);

-- ----------------------------
-- Table structure for sys_patrol_order_img
-- ----------------------------
DROP TABLE IF EXISTS `sys_patrol_order_img`;
CREATE TABLE `sys_patrol_order_img`  (
  `img_id` bigint NOT NULL AUTO_INCREMENT COMMENT '图片编号',
  `patrol_order_id` bigint NOT NULL COMMENT '巡更工单编号',
  `img_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片地址',
  PRIMARY KEY (`img_id`, `patrol_order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_patrol_order_img
-- ----------------------------

-- ----------------------------
-- Table structure for sys_patrol_patrol_point
-- ----------------------------
DROP TABLE IF EXISTS `sys_patrol_patrol_point`;
CREATE TABLE `sys_patrol_patrol_point`  (
  `patrol_id` bigint NOT NULL COMMENT '巡更任务编号',
  `patrol_point_id` bigint NOT NULL COMMENT '巡更点编号',
  PRIMARY KEY (`patrol_id`, `patrol_point_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_patrol_patrol_point
-- ----------------------------

-- ----------------------------
-- Table structure for sys_patrol_personnel
-- ----------------------------
DROP TABLE IF EXISTS `sys_patrol_personnel`;
CREATE TABLE `sys_patrol_personnel`  (
  `patrol_id` bigint NOT NULL COMMENT '巡更任务编号',
  `personnel_id` bigint NOT NULL COMMENT '员工编号',
  PRIMARY KEY (`patrol_id`, `personnel_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_patrol_personnel
-- ----------------------------
INSERT INTO `sys_patrol_personnel` VALUES (4, 4);

-- ----------------------------
-- Table structure for sys_patrol_point
-- ----------------------------
DROP TABLE IF EXISTS `sys_patrol_point`;
CREATE TABLE `sys_patrol_point`  (
  `patrol_point_id` bigint NOT NULL AUTO_INCREMENT COMMENT '巡更点ID',
  `patrol_point_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '巡更点名称',
  `patrol_point_describe` varchar(800) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '巡更点描述',
  `patrol_point_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '巡更点二维码',
  `patrol_point_latitude` decimal(10, 8) NULL DEFAULT NULL COMMENT '巡更点纬度',
  `patrol_point_longitude` decimal(10, 8) NULL DEFAULT NULL COMMENT '巡更点经度',
  `patrol_point_altitude` decimal(10, 8) NULL DEFAULT NULL COMMENT '巡更点高度',
  `patrol_point_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态(0启用 1未启用)',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`patrol_point_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_patrol_point
-- ----------------------------
INSERT INTO `sys_patrol_point` VALUES (1, '测试', NULL, 'ceshiceshi', 23.45656000, 23.45656000, 23.45656000, '0', '', NULL, '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_personnel
-- ----------------------------
DROP TABLE IF EXISTS `sys_personnel`;
CREATE TABLE `sys_personnel`  (
  `personnel_id` bigint NOT NULL AUTO_INCREMENT COMMENT '员工ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `post_id` bigint NULL DEFAULT NULL COMMENT '岗位ID',
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
  PRIMARY KEY (`personnel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_personnel
-- ----------------------------
INSERT INTO `sys_personnel` VALUES (4, 103, NULL, '912996617', '$2a$10$hbRWmL1/pfhYABUPZ.3gW./MUR9iGtjuk9R45BSaAFH5hqbKfF46S', '测试', '18233333333', NULL, '0', NULL, NULL, NULL, 'admin', '2023-03-30 11:05:27', '', '2023-04-04 15:18:42');

-- ----------------------------
-- Table structure for sys_personnel_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_personnel_post`;
CREATE TABLE `sys_personnel_post`  (
  `personnel_id` bigint NOT NULL COMMENT '员工id',
  `post_id` bigint NOT NULL COMMENT '岗位id',
  PRIMARY KEY (`personnel_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_personnel_post
-- ----------------------------
INSERT INTO `sys_personnel_post` VALUES (4, 1);
INSERT INTO `sys_personnel_post` VALUES (4, 2);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2023-03-24 14:38:49', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2023-03-24 14:38:49', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2023-03-24 14:38:49', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2023-03-24 14:38:49', '', NULL, '');

-- ----------------------------
-- Table structure for sys_repair
-- ----------------------------
DROP TABLE IF EXISTS `sys_repair`;
CREATE TABLE `sys_repair`  (
  `repair_id` bigint NOT NULL AUTO_INCREMENT COMMENT '维修任务编号',
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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_repair
-- ----------------------------
INSERT INTO `sys_repair` VALUES (1, '测试', '测试', '测', '12345678910', '0', '2023-03-08 00:00:00', '2023-03-24 00:00:00', '2023-03-18 00:00:00', NULL, 'admin', '2023-03-31 16:18:44', '', '2023-04-03 10:17:03');

-- ----------------------------
-- Table structure for sys_repair_order
-- ----------------------------
DROP TABLE IF EXISTS `sys_repair_order`;
CREATE TABLE `sys_repair_order`  (
  `repair_order_id` bigint NOT NULL AUTO_INCREMENT COMMENT '报修工单编号',
  `patrol_point_id` bigint NULL DEFAULT NULL COMMENT '巡更点编号',
  `patrol_point_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '巡更点名称',
  `personnel_id` bigint NULL DEFAULT NULL COMMENT '员工编号',
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_repair_order
-- ----------------------------

-- ----------------------------
-- Table structure for sys_repair_order_img
-- ----------------------------
DROP TABLE IF EXISTS `sys_repair_order_img`;
CREATE TABLE `sys_repair_order_img`  (
  `img_id` bigint NOT NULL AUTO_INCREMENT COMMENT '图片编号',
  `repair_order_id` bigint NOT NULL COMMENT '维修工单编号',
  `img_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  PRIMARY KEY (`img_id`, `repair_order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_repair_order_img
-- ----------------------------

-- ----------------------------
-- Table structure for sys_repair_patrol_point
-- ----------------------------
DROP TABLE IF EXISTS `sys_repair_patrol_point`;
CREATE TABLE `sys_repair_patrol_point`  (
  `repair_id` bigint NOT NULL COMMENT '维修任务编号',
  `patrol_point_id` bigint NOT NULL COMMENT '巡更点编号',
  PRIMARY KEY (`repair_id`, `patrol_point_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_repair_patrol_point
-- ----------------------------

-- ----------------------------
-- Table structure for sys_repair_personnel
-- ----------------------------
DROP TABLE IF EXISTS `sys_repair_personnel`;
CREATE TABLE `sys_repair_personnel`  (
  `repair_id` bigint NOT NULL COMMENT '维修任务编号',
  `personnel_id` bigint NOT NULL COMMENT '员工编号',
  PRIMARY KEY (`repair_id`, `personnel_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_repair_personnel
-- ----------------------------
INSERT INTO `sys_repair_personnel` VALUES (1, 4);

-- ----------------------------
-- Table structure for sys_repair_repair_order
-- ----------------------------
DROP TABLE IF EXISTS `sys_repair_repair_order`;
CREATE TABLE `sys_repair_repair_order`  (
  `repair_order_id` bigint NOT NULL COMMENT '报修工单编号',
  `repair_id` bigint NOT NULL COMMENT '维修任务编号',
  PRIMARY KEY (`repair_order_id`, `repair_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_repair_repair_order
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
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
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-03-24 14:38:50', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2023-03-24 14:38:50', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
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
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '/profile/avatar/2023/03/29/blob_20230329153056A001.png', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-04-04 15:18:06', 'admin', '2023-03-24 14:38:48', '', '2023-04-04 15:18:03', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-03-24 14:38:48', 'admin', '2023-03-24 14:38:48', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (100, NULL, '912996618', '912996618', '00', '', '18232005950', '0', '', '$2a$10$XJZA3HYVm4UP8YkUP0RkfejY/Tl7AbCddfw/ua9FkvmvO7vv1rYRq', '0', '0', '127.0.0.1', '2023-03-24 15:17:43', '', '2023-03-24 15:16:51', 'admin', '2023-03-28 15:24:46', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (1, 2);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (100, 2);

SET FOREIGN_KEY_CHECKS = 1;
