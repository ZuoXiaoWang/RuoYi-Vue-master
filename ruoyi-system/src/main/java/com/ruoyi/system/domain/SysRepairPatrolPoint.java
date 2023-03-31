package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 sys_repair_patrol_point
 *
 * @author ruoyi
 * @date 2023-03-31
 */
public class SysRepairPatrolPoint extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 维修任务编号 */
    private Long repairId;

    /** 巡更点编号 */
    private Long patrolPointId;

    public void setRepairId(Long repairId)
    {
        this.repairId = repairId;
    }

    public Long getRepairId()
    {
        return repairId;
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
                .append("repairId", getRepairId())
                .append("patrolPointId", getPatrolPointId())
                .toString();
    }
}
