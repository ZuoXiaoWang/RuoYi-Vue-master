package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 sys_repair_order_img
 *
 * @author ruoyi
 * @date 2023-04-03
 */
public class SysRepairOrderImg extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 图片编号 */
    private Long imgId;

    /** 维修工单编号 */
    private Long repairOrderId;

    /** 图片地址 */
    @Excel(name = "图片地址")
    private String imgUrl;

    public void setImgId(Long imgId)
    {
        this.imgId = imgId;
    }

    public Long getImgId()
    {
        return imgId;
    }
    public void setRepairOrderId(Long repairOrderId)
    {
        this.repairOrderId = repairOrderId;
    }

    public Long getRepairOrderId()
    {
        return repairOrderId;
    }
    public void setImgUrl(String imgUrl)
    {
        this.imgUrl = imgUrl;
    }

    public String getImgUrl()
    {
        return imgUrl;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("imgId", getImgId())
            .append("repairOrderId", getRepairOrderId())
            .append("imgUrl", getImgUrl())
            .toString();
    }
}
