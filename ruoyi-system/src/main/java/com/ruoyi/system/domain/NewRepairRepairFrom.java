package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 new_repair_repair_from
 *
 * @author ruoyi
 * @date 2023-05-13
 */
public class NewRepairRepairFrom extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 维修单id */
    private Long newRepairId;

    /** 报修单id */
    private Long newRepairFromId;

    public void setNewRepairId(Long newRepairId)
    {
        this.newRepairId = newRepairId;
    }

    public Long getNewRepairId()
    {
        return newRepairId;
    }
    public void setNewRepairFromId(Long newRepairFromId)
    {
        this.newRepairFromId = newRepairFromId;
    }

    public Long getNewRepairFromId()
    {
        return newRepairFromId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("newRepairId", getNewRepairId())
                .append("newRepairFromId", getNewRepairFromId())
                .toString();
    }
}
