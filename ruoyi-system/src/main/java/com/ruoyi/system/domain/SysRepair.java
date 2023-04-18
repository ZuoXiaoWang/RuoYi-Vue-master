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
 * 维修任务对象 sys_repair
 *
 * @author lile
 * @date 2023-03-31
 */
public class SysRepair extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 维修任务编号
     */
    private Long repairId;

    private Long PersonnelId;

    private Long PatrolPointId;

    /**
     * 维修任务名称
     */
    @Excel(name = "维修任务名称")
    private String repairName;

    /**
     * 维修任务描述
     */
    @Excel(name = "维修任务描述")
    private String repairDescribe;

    /**
     * 维修任务负责人
     */
    @Excel(name = "维修任务负责人")
    private String repairPrincipal;

    /**
     * 负责人联系方式
     */
    @Excel(name = "负责人联系方式")
    private String repairPhone;

    /**
     * 维修任务状态
     */
    @Excel(name = "维修任务状态")
    private String repairStatus;

    /**
     * 计划开始时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "计划开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date repairStartTime;

    /**
     * 实际开始时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "实际开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date repairActualStartTime;

    /**
     * 实际结束时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "实际结束时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date repairActualEndTime;

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


    private String imgUrl;

    private List<String> imgUrls;


    public Long getRepairId() {
        return repairId;
    }

    public void setRepairId(Long repairId) {
        this.repairId = repairId;
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

    public String getRepairName() {
        return repairName;
    }

    public void setRepairName(String repairName) {
        this.repairName = repairName;
    }

    public String getRepairDescribe() {
        return repairDescribe;
    }

    public void setRepairDescribe(String repairDescribe) {
        this.repairDescribe = repairDescribe;
    }

    public String getRepairPrincipal() {
        return repairPrincipal;
    }

    public void setRepairPrincipal(String repairPrincipal) {
        this.repairPrincipal = repairPrincipal;
    }

    public String getRepairPhone() {
        return repairPhone;
    }

    public void setRepairPhone(String repairPhone) {
        this.repairPhone = repairPhone;
    }

    public String getRepairStatus() {
        return repairStatus;
    }

    public void setRepairStatus(String repairStatus) {
        this.repairStatus = repairStatus;
    }

    public Date getRepairStartTime() {
        return repairStartTime;
    }

    public void setRepairStartTime(Date repairStartTime) {
        this.repairStartTime = repairStartTime;
    }

    public Date getRepairActualStartTime() {
        return repairActualStartTime;
    }

    public void setRepairActualStartTime(Date repairActualStartTime) {
        this.repairActualStartTime = repairActualStartTime;
    }

    public Date getRepairActualEndTime() {
        return repairActualEndTime;
    }

    public void setRepairActualEndTime(Date repairActualEndTime) {
        this.repairActualEndTime = repairActualEndTime;
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

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public List<String> getImgUrls() {
        return imgUrls;
    }

    public void setImgUrls(List<String> imgUrls) {
        this.imgUrls = imgUrls;
    }

    @Override
    public String toString() {
        return "SysRepair{" +
                "repairId=" + repairId +
                ", PersonnelId=" + PersonnelId +
                ", PatrolPointId=" + PatrolPointId +
                ", repairName='" + repairName + '\'' +
                ", repairDescribe='" + repairDescribe + '\'' +
                ", repairPrincipal='" + repairPrincipal + '\'' +
                ", repairPhone='" + repairPhone + '\'' +
                ", repairStatus='" + repairStatus + '\'' +
                ", repairStartTime=" + repairStartTime +
                ", repairActualStartTime=" + repairActualStartTime +
                ", repairActualEndTime=" + repairActualEndTime +
                ", Personnels=" + Personnels +
                ", PersonnelIds=" + Arrays.toString(PersonnelIds) +
                ", PatrolPoints=" + PatrolPoints +
                ", PatrolPointIds=" + Arrays.toString(PatrolPointIds) +
                ", imgUrl='" + imgUrl + '\'' +
                ", imgUrls=" + imgUrls +
                '}';
    }
}
