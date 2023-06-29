package com.ruoyi.system.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 inspection_route
 *
 * @author ruoyi
 * @date 2023-06-28
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class InspectionRoute extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** Route_ID */
    private String inspectionRouteId;

    /** 路线名称 */
    @Excel(name = "路线名称")
    private String routeName;

    /** 小区ID */
    @Excel(name = "小区ID")
    private Long regionId;

    /** 路线顺序 */
    @Excel(name = "路线顺序")
    private String seq;

    /** 数据状态 */
    @Excel(name = "数据状态")
    private String statusCd  = "0";

    private Long userId;

    private Long[] PatrolPointIds;
}

