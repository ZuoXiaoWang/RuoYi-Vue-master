package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 区域对象 new_area
 * 
 * @author ruoyi
 * @date 2023-05-13
 */
public class NewArea extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 区域id */
    private Long areaId;

    /** 区域名称 */
    @Excel(name = "区域名称")
    private String areaName;

    /** 区域值 */
    @Excel(name = "区域值")
    private String areaValue;

    public void setAreaId(Long areaId) 
    {
        this.areaId = areaId;
    }

    public Long getAreaId() 
    {
        return areaId;
    }
    public void setAreaName(String areaName) 
    {
        this.areaName = areaName;
    }

    public String getAreaName() 
    {
        return areaName;
    }
    public void setAreaValue(String areaValue) 
    {
        this.areaValue = areaValue;
    }

    public String getAreaValue() 
    {
        return areaValue;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("areaId", getAreaId())
            .append("areaName", getAreaName())
            .append("areaValue", getAreaValue())
            .toString();
    }
}
