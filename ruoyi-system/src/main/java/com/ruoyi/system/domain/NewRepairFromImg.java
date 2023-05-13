package com.ruoyi.system.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 new_repair_from_img
 *
 * @author ruoyi
 * @date 2023-05-13
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class NewRepairFromImg extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 图片编号 */
    private Long imgId;

    /** 报修编号 */
    private Long newRepairFromId;

    /** 图片地址 */
    @Excel(name = "图片地址")
    private String imgUrl;

}
