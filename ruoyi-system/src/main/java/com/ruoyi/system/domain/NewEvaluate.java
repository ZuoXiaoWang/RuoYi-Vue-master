package com.ruoyi.system.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 评价单对象 new_evaluate
 *
 * @author ruoyi
 * @date 2023-05-13
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class NewEvaluate extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    private Long personnelId;

    /** 评价id */
    private Long evaluateId;

    private Long newRepairId;

    /** 评价 */
    @Excel(name = "评价")
    private Long evaluate;

    /** 描述 */
    @Excel(name = "描述")
    private String describe;
}
