package com.ruoyi.system.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.util.Date;

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
    private String evaluateId;

    private Long newRepairId;

    /** 评价 */
    @Excel(name = "评价")
    private Double evaluate;

    /** 描述 */
    @Excel(name = "描述")
    private String describe;

    private String remark;

    private String state;//0驳回 1提交
    private String createBy;
    private Date createTime;
    private String updateBy;
    private Date updateTime;
    /** 区域划分id */
    private Long regionId;
}
