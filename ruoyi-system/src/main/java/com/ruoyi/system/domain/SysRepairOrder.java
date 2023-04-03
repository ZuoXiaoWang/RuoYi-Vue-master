package com.ruoyi.system.domain;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 维修工单对象 sys_repair_order
 *
 * @author lile
 * @date 2023-04-03
 */
public class SysRepairOrder extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 报修工单编号 */
    private Long repairOrderId;

    /** 巡更点编号 */
    @Excel(name = "巡更点编号")
    private Long patrolPointId;

    /** 巡更点名称 */
    @Excel(name = "巡更点名称")
    private String patrolPointName;

    /** 员工编号 */
    @Excel(name = "员工编号")
    private Long personnelId;

    /** 员工姓名 */
    @Excel(name = "员工姓名")
    private String personnelName;

    /** 员工联系方式 */
    @Excel(name = "员工联系方式")
    private String personnelPhone;

    /** 异常描述 */
    @Excel(name = "异常描述")
    private String repairOrderDescribe;

    /** 状态 */
    @Excel(name = "状态")
    private String repairOrderStatus;

    /** 故障原因 */
    @Excel(name = "故障原因")
    private String causeOfIssue;

    /** 上报时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "上报时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date reportingTime;

    private String imgUrl;

    private List<String> imgUrls;

    public void setRepairOrderId(Long repairOrderId)
    {
        this.repairOrderId = repairOrderId;
    }

    public Long getRepairOrderId()
    {
        return repairOrderId;
    }
    public void setPatrolPointId(Long patrolPointId)
    {
        this.patrolPointId = patrolPointId;
    }

    public Long getPatrolPointId()
    {
        return patrolPointId;
    }
    public void setPatrolPointName(String patrolPointName)
    {
        this.patrolPointName = patrolPointName;
    }

    public String getPatrolPointName()
    {
        return patrolPointName;
    }
    public void setPersonnelId(Long personnelId)
    {
        this.personnelId = personnelId;
    }

    public Long getPersonnelId()
    {
        return personnelId;
    }
    public void setPersonnelName(String personnelName)
    {
        this.personnelName = personnelName;
    }

    public String getPersonnelName()
    {
        return personnelName;
    }
    public void setPersonnelPhone(String personnelPhone)
    {
        this.personnelPhone = personnelPhone;
    }

    public String getPersonnelPhone()
    {
        return personnelPhone;
    }
    public void setRepairOrderDescribe(String repairOrderDescribe)
    {
        this.repairOrderDescribe = repairOrderDescribe;
    }

    public String getRepairOrderDescribe()
    {
        return repairOrderDescribe;
    }
    public void setRepairOrderStatus(String repairOrderStatus)
    {
        this.repairOrderStatus = repairOrderStatus;
    }

    public String getRepairOrderStatus()
    {
        return repairOrderStatus;
    }
    public void setCauseOfIssue(String causeOfIssue)
    {
        this.causeOfIssue = causeOfIssue;
    }

    public String getCauseOfIssue()
    {
        return causeOfIssue;
    }
    public void setReportingTime(Date reportingTime)
    {
        this.reportingTime = reportingTime;
    }

    public Date getReportingTime()
    {
        return reportingTime;
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
        return "SysRepairOrder{" +
                "repairOrderId=" + repairOrderId +
                ", patrolPointId=" + patrolPointId +
                ", patrolPointName='" + patrolPointName + '\'' +
                ", personnelId=" + personnelId +
                ", personnelName='" + personnelName + '\'' +
                ", personnelPhone='" + personnelPhone + '\'' +
                ", repairOrderDescribe='" + repairOrderDescribe + '\'' +
                ", repairOrderStatus='" + repairOrderStatus + '\'' +
                ", causeOfIssue='" + causeOfIssue + '\'' +
                ", reportingTime=" + reportingTime +
                ", imgUrl='" + imgUrl + '\'' +
                ", imgUrls=" + imgUrls +
                '}';
    }
}
