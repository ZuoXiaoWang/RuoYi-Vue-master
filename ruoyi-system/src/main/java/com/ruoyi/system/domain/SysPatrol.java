package com.ruoyi.system.domain;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.entity.SysPersonnel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 巡更任务管理对象 sys_patrol
 *
 * @author lile
 * @date 2023-03-31
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class SysPatrol extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 巡更任务编号
     */
    private Long patrolId;

    /**
     * 巡更任务名称
     */
    @Excel(name = "巡更任务名称")
    private String patrolName;

    /**
     * 巡更任务描述
     */
    @Excel(name = "巡更任务描述")
    private String patrolDescribe;

    /**
     * 巡更任务负责人
     */
    private String patrolPrincipal;

    /**
     * 负责人联系方式
     */
    private String patrolPhone;

    /**
     * 巡更任务状态
     */
    @Excel(name = "巡更任务状态",readConverterExp = "0=未开始,1=进行中,2=已完成")
    private String patrolStatus;

    /**
     * 计划开始时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date patrolStartTime;

    /**
     * 计划结束时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date patrolEndTime;

    /**
     * 任务创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date patrolCreateTime;


    private Long PersonnelId;

    private Long PatrolPointId;


    /**
     * 员工列表
     */
    private List<SysPersonnel> Personnels;

    private Long[] PersonnelIds;

    /**
     * 点位列表
     */
    private List<SysPatrolPoint> PatrolPoints;

    private Long[] PatrolPointIds;

    //实际开始时间
    private Date patrolActualStartTime;

    //实际结束时间
    private Date patrolActualEndTime;

    //是否为定时任务模板
    private String type;

    /** 区域划分id */
    private Long regionId;

}
