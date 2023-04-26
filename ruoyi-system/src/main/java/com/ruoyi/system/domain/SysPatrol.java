package com.ruoyi.system.domain;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.entity.SysPersonnel;
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
    @Excel(name = "巡更任务负责人")
    private String patrolPrincipal;

    /**
     * 负责人联系方式
     */
    @Excel(name = "负责人联系方式")
    private String patrolPhone;

    /**
     * 巡更任务状态
     */
    @Excel(name = "巡更任务状态")
    private String patrolStatus;

    /**
     * 计划开始时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "计划开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date patrolStartTime;

    /**
     * 计划结束时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "计划结束时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date patrolEndTime;

    /**
     * 任务创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "任务创建时间", width = 30, dateFormat = "yyyy-MM-dd")
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "SysPatrol{" +
                "patrolId=" + patrolId +
                ", patrolName='" + patrolName + '\'' +
                ", patrolDescribe='" + patrolDescribe + '\'' +
                ", patrolPrincipal='" + patrolPrincipal + '\'' +
                ", patrolPhone='" + patrolPhone + '\'' +
                ", patrolStatus='" + patrolStatus + '\'' +
                ", patrolStartTime=" + patrolStartTime +
                ", patrolEndTime=" + patrolEndTime +
                ", patrolCreateTime=" + patrolCreateTime +
                ", PersonnelId=" + PersonnelId +
                ", PatrolPointId=" + PatrolPointId +
                ", Personnels=" + Personnels +
                ", PersonnelIds=" + Arrays.toString(PersonnelIds) +
                ", PatrolPoints=" + PatrolPoints +
                ", PatrolPointIds=" + Arrays.toString(PatrolPointIds) +
                ", Type='" + type + '\'' +
                '}';
    }

    private String type;

    public void setPatrolId(Long patrolId) {
        this.patrolId = patrolId;
    }

    public Long getPatrolId() {
        return patrolId;
    }

    public void setPatrolName(String patrolName) {
        this.patrolName = patrolName;
    }

    public String getPatrolName() {
        return patrolName;
    }

    public void setPatrolDescribe(String patrolDescribe) {
        this.patrolDescribe = patrolDescribe;
    }

    public String getPatrolDescribe() {
        return patrolDescribe;
    }

    public void setPatrolPrincipal(String patrolPrincipal) {
        this.patrolPrincipal = patrolPrincipal;
    }

    public String getPatrolPrincipal() {
        return patrolPrincipal;
    }

    public void setPatrolPhone(String patrolPhone) {
        this.patrolPhone = patrolPhone;
    }

    public String getPatrolPhone() {
        return patrolPhone;
    }

    public void setPatrolStatus(String patrolStatus) {
        this.patrolStatus = patrolStatus;
    }

    public String getPatrolStatus() {
        return patrolStatus;
    }

    public void setPatrolStartTime(Date patrolStartTime) {
        this.patrolStartTime = patrolStartTime;
    }

    public Date getPatrolStartTime() {
        return patrolStartTime;
    }

    public void setPatrolEndTime(Date patrolEndTime) {
        this.patrolEndTime = patrolEndTime;
    }

    public Date getPatrolEndTime() {
        return patrolEndTime;
    }

    public void setPatrolCreateTime(Date patrolCreateTime) {
        this.patrolCreateTime = patrolCreateTime;
    }

    public Date getPatrolCreateTime() {
        return patrolCreateTime;
    }


    public Long getPersonnelId() {
        return PersonnelId;
    }

    public void setPersonnelId(Long personnelId) {
        PersonnelId = personnelId;
    }

    public Long getPatrolPointId() {
        return PatrolPointId;
    }

    public void setPatrolPointId(Long patrolPointId) {
        PatrolPointId = patrolPointId;
    }

    public List<SysPersonnel> getPersonnels() {
        return Personnels;
    }

    public void setPersonnels(List<SysPersonnel> personnels) {
        Personnels = personnels;
    }

    public Long[] getPersonnelIds() {
        return PersonnelIds;
    }

    public void setPersonnelIds(Long[] personnelIds) {
        PersonnelIds = personnelIds;
    }

    public List<SysPatrolPoint> getPatrolPoints() {
        return PatrolPoints;
    }

    public void setPatrolPoints(List<SysPatrolPoint> patrolPoints) {
        PatrolPoints = patrolPoints;
    }

    public Long[] getPatrolPointIds() {
        return PatrolPointIds;
    }

    public void setPatrolPointIds(Long[] patrolPointIds) {
        PatrolPointIds = patrolPointIds;
    }

}
