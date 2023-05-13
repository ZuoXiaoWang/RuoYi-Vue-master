package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 new_repair_img
 *
 * @author ruoyi
 * @date 2023-05-13
 */
public class NewRepairImg extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 图片编号 */
    private Long imgId;

    /** 维修编号 */
    private Long newRepairId;

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
    public void setNewRepairId(Long newRepairId)
    {
        this.newRepairId = newRepairId;
    }

    public Long getNewRepairId()
    {
        return newRepairId;
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
                .append("newRepairId", getNewRepairId())
                .append("imgUrl", getImgUrl())
                .toString();
    }
}
