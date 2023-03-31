package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.util.Arrays;
import java.util.List;

/**
 * 巡更工单管理对象 sys_patrol_order
 *
 * @author lile
 * @date 2023-03-31
 */
public class SysPatrolOrder extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 巡更工单编号 */
    private Long patrolOrderId;

    /** 巡更点编号 */
    @Excel(name = "巡更点编号")
    private Long patrolPointId;

    /** 巡更点名称 */
    @Excel(name = "巡更点名称")
    private String patrolPointName;

    /** 巡更任务编号 */
    @Excel(name = "巡更任务编号")
    private Long patrolId;

    /** 巡更任务名称 */
    @Excel(name = "巡更任务名称")
    private String patrolName;

    /** 巡更人编号 */
    @Excel(name = "巡更人编号")
    private Long personnelId;

    /** 巡更人姓名 */
    @Excel(name = "巡更人姓名")
    private String personnelName;

    /** 巡更结果 */
    @Excel(name = "巡更结果")
    private String patrolResult;

    private String imgUrl;

    private List<String> imgUrls;

    public void setPatrolOrderId(Long patrolOrderId)
    {
        this.patrolOrderId = patrolOrderId;
    }

    public Long getPatrolOrderId()
    {
        return patrolOrderId;
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
    public void setPatrolId(Long patrolId)
    {
        this.patrolId = patrolId;
    }

    public Long getPatrolId()
    {
        return patrolId;
    }
    public void setPatrolName(String patrolName)
    {
        this.patrolName = patrolName;
    }

    public String getPatrolName()
    {
        return patrolName;
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
    public void setPatrolResult(String patrolResult)
    {
        this.patrolResult = patrolResult;
    }

    public String getPatrolResult()
    {
        return patrolResult;
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
        return "SysPatrolOrder{" +
                "patrolOrderId=" + patrolOrderId +
                ", patrolPointId=" + patrolPointId +
                ", patrolPointName='" + patrolPointName + '\'' +
                ", patrolId=" + patrolId +
                ", patrolName='" + patrolName + '\'' +
                ", personnelId=" + personnelId +
                ", personnelName='" + personnelName + '\'' +
                ", patrolResult='" + patrolResult + '\'' +
                ", imgUrl='" + imgUrl + '\'' +
                ", imgUrls=" + imgUrls +
                '}';
    }
}
