package com.ruoyi.system.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 inspection_item_point
 *
 * @author ruoyi
 * @date 2023-07-03
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class InspectionItemPoint extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 巡更点ID */
    private Long patrolPointId;

    /** 主键ID */
    private String itemId;
}
