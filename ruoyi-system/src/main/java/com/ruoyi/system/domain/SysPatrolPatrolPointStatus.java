package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 sys_patrol_patrol_point_status
 *
 * @author ruoyi
 * @date 2023-04-20
 */
public class SysPatrolPatrolPointStatus extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 巡更计划表和计划内巡更点状态 */
    private Long patrolPatrolPointStatusId;

    /** 巡更任务编号 */
    private Long patrolId;

    /** 点位id */
    private Long patrolPointId;

    /** 状态(0启用 1未启用) */
    @Excel(name = "状态(0启用 1未启用)")
    private String patrolPatrolPointStatus;

    public void setPatrolPatrolPointStatusId(Long patrolPatrolPointStatusId)
    {
        this.patrolPatrolPointStatusId = patrolPatrolPointStatusId;
    }

    public Long getPatrolPatrolPointStatusId()
    {
        return patrolPatrolPointStatusId;
    }
    public void setPatrolId(Long patrolId)
    {
        this.patrolId = patrolId;
    }

    public Long getPatrolId()
    {
        return patrolId;
    }
    public void setPatrolPointId(Long patrolPointId)
    {
        this.patrolPointId = patrolPointId;
    }

    public Long getPatrolPointId()
    {
        return patrolPointId;
    }
    public void setPatrolPatrolPointStatus(String patrolPatrolPointStatus)
    {
        this.patrolPatrolPointStatus = patrolPatrolPointStatus;
    }

    public String getPatrolPatrolPointStatus()
    {
        return patrolPatrolPointStatus;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("patrolPatrolPointStatusId", getPatrolPatrolPointStatusId())
                .append("patrolId", getPatrolId())
                .append("patrolPointId", getPatrolPointId())
                .append("patrolPatrolPointStatus", getPatrolPatrolPointStatus())
                .toString();
    }
}
