package com.ruoyi.system.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 区域管理对象 sys_region
 *
 * @author ruoyi
 * @date 2023-06-10
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class SysRegion extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 区域划分id */
    private Long regionId;

    /** 区域名称 */
    @Excel(name = "区域名称")
    private String name;

    /** 描述 */
    @Excel(name = "描述")
    private String description;

    /** 上级区域id */
    @Excel(name = "上级区域id")
    private Long parentId;
}
