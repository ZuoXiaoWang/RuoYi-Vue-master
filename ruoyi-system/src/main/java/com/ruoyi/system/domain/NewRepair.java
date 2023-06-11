package com.ruoyi.system.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.util.List;

/**
 * 维修单对象 new_repair
 *
 * @author ruoyi
 * @date 2023-05-13
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class NewRepair extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 维修单id */
    private Long newRepairId;

    /** 维修位置 */
    @Excel(name = "维修位置")
    private String location;

    /** 维修描述 */
    @Excel(name = "维修描述")
    private String describe;

    /** 区域分类 */
    @Excel(name = "区域分类")
    private String regionalClassification;

    /** 维修分类 */
    @Excel(name = "维修分类")
    private String maintenanceClassification;

    /** 状态 */
    @Excel(name = "状态")
    private String state;

    /** 类型 */
    @Excel(name = "类型")
    private String paidType;

    private String imgUrl;

    private List<String> imgUrls;

    private Long personnelId;

    private String repairPersonnelName;

    private Long newRepairFromId;

    private String repairFromPersonnelName;

    private String repairPhone;

    private List evaluateList;

    /** 区域划分id */
    private Long regionId;
}
