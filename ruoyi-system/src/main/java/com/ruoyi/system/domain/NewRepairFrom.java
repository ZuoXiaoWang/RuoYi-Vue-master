package com.ruoyi.system.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.util.List;

/**
 * 报修单对象 new_repair_from
 *
 * @author ruoyi
 * @date 2023-05-13
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class NewRepairFrom extends BaseEntity
{
    private static final long serialVersionUID = 1L;


    /** 报修单id */
    private Long repairFromId;

    /** 报修位置 */
    @Excel(name = "报修位置")
    private String location;

    /** 报修描述 */
    @Excel(name = "报修描述")
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

    private String personnelName;

    private String repairPhone;

    private Long newRepairId;

    private List evaluateList;

    //滞留时长 小时
    private Integer detainHours;

    /** 区域划分id */
    private Long regionId;

}
