package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 sys_patrol_personnel
 *
 * @author ruoyi
 * @date 2023-03-31
 */
public class SysPatrolPersonnel extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 巡更任务编号
     */
    private Long patrolId;

    /**
     * 员工编号
     */
    private Long personnelId;

    public void setPatrolId(Long patrolId) {
        this.patrolId = patrolId;
    }

    public Long getPatrolId() {
        return patrolId;
    }

    public void setPersonnelId(Long personnelId) {
        this.personnelId = personnelId;
    }

    public Long getPersonnelId() {
        return personnelId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("patrolId", getPatrolId())
                .append("personnelId", getPersonnelId())
                .toString();
    }
}
