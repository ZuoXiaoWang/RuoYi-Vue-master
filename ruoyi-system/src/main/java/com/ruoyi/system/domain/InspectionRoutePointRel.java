package com.ruoyi.system.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 inspection_route_point_rel
 *
 * @author ruoyi
 * @date 2023-06-28
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class InspectionRoutePointRel extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** inspection_route and point relation ID */
    private String irpRelId;

    /** 路线ID */
    @Excel(name = "路线ID")
    private String inspectionRouteId;

    /** 巡检点ID */
    @Excel(name = "巡检点ID")
    private Long patrolPointId;

    /** 小区ID */
    @Excel(name = "小区ID")
    private Long regionId;

    /** 数据状态 */
    @Excel(name = "数据状态")
    private String statusCd  = "0";

    /** 巡检点开始时间 */
    @Excel(name = "巡检点开始时间")
    private String pointStartTime;

    /** 巡检点结束时间 */
    @Excel(name = "巡检点结束时间")
    private String pointEndTime;

    /** 排序 */
    @Excel(name = "排序")
    private Long sortNumber;

    private Long userId;

}
