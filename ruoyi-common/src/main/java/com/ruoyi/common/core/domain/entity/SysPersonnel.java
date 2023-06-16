package com.ruoyi.common.core.domain.entity;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.entity.SysDept;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 员工管理对象 sys_personnel
 *
 * @author lile
 * @date 2023-03-27
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class SysPersonnel extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 员工ID
     */
    private Long personnelId;

    /**
     * 部门ID
     */
    @Excel(name = "部门ID")
    private Long deptId;

    /**
     * 岗位ID
     */
    @Excel(name = "岗位ID")
    private Long postId;

    /**
     * 用户账号
     */
    @Excel(name = "用户账号")
    private String personnelLoginName;

    /**
     * 密码
     */
    @Excel(name = "密码")
    private String personnelPassword;

    /**
     * 员工名字
     */
    @Excel(name = "员工名字")
    private String personnelName;

    /**
     * 手机号码
     */
    @Excel(name = "手机号码")
    private String personnelPhone;

    /**
     * 性别
     */
    @Excel(name = "性别")
    private String personnelSex;

    /**
     * 状态
     */
    @Excel(name = "状态")
    private String personnelStatus;

    /**
     * 入职时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "入职时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date personnelEntryTime;

    /**
     * 离职时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "离职时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date personnelResignationTime;

    /**
     * 部门
     */
    private SysDept dept;

    /**
     * 岗位组
     */
    private List<SysPost> posts;

    /**
     * 岗位组
     */
    private Long[] postIds;

    /**
     * 用户头像
     */
    private String avatar;

    /**
     * 小程序openid
     */
    private String openId;

    /** 区域划分id */

    private Long regionId;

    private Long userId;
}
