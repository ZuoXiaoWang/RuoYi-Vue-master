package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 new_repair_personnel
 *
 * @author ruoyi
 * @date 2023-05-13
 */
public class NewRepairPersonnel extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 维修编号 */
    private Long newRepairId;

    /** 员工编号 */
    private Long personnelId;

    public void setNewRepairId(Long newRepairId)
    {
        this.newRepairId = newRepairId;
    }

    public Long getNewRepairId()
    {
        return newRepairId;
    }
    public void setPersonnelId(Long personnelId)
    {
        this.personnelId = personnelId;
    }

    public Long getPersonnelId()
    {
        return personnelId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("newRepairId", getNewRepairId())
                .append("personnelId", getPersonnelId())
                .toString();
    }
}
