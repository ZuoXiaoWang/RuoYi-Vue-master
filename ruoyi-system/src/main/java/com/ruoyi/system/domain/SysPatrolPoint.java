package com.ruoyi.system.domain;

import java.math.BigDecimal;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 巡更点管理对象 sys_patrol_point
 *
 * @author lile
 * @date 2023-03-28
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class SysPatrolPoint extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 巡更点ID
     */
    @Excel(name = "巡更点编号")
    private Long patrolPointId;

    /**
     * 巡更点名称
     */
    @Excel(name = "巡更点名称")
    private String patrolPointName;

    /**
     * 巡更点描述
     */
    @Excel(name = "巡更点描述")
    private String patrolPointDescribe;

    /**
     * 巡更点二维码
     */

    private String patrolPointUrl;

    /**
     * 巡更点纬度
     */
    @Excel(name = "巡更点纬度",scale = 10)
    private BigDecimal patrolPointLatitude;

    /**
     * 巡更点经度
     */
    @Excel(name = "巡更点经度",scale = 10)
    private BigDecimal patrolPointLongitude;

    /**
     * 巡更点高度
     */
    @Excel(name = "巡更点高度",scale = 10)
    private BigDecimal patrolPointAltitude;

    /**
     * 状态
     */
    @Excel(name = "状态", readConverterExp = "0=启用,1=未启用")
    private String patrolPointStatus;

    /**
     * 巡更计划内巡更点巡更状态
     */
    private String patrolPatrolPointStatus;

    /** 区域划分id */
    private Long regionId;

    private Long userId;

    private String itemId;

}
