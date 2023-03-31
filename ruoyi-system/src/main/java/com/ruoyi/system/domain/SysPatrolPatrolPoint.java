package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 sys_patrol_patrol_point
 *
 * @author ruoyi
 * @date 2023-03-31
 */
public class SysPatrolPatrolPoint extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 巡更任务编号 */
    private Long patrolId;

    /** 巡更点编号 */
    private Long patrolPointId;

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

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("patrolId", getPatrolId())
                .append("patrolPointId", getPatrolPointId())
                .toString();
    }
}
