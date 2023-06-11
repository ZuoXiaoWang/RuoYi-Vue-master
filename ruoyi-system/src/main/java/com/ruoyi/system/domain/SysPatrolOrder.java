package com.ruoyi.system.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.util.Arrays;
import java.util.List;

/**
 * 巡更工单管理对象 sys_patrol_order
 *
 * @author lile
 * @date 2023-03-31
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class SysPatrolOrder extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 巡更工单编号 */
    private Long patrolOrderId;

    /** 巡更点编号 */
    @Excel(name = "巡更点编号")
    private Long patrolPointId;

    /** 巡更点名称 */
    @Excel(name = "巡更点名称")
    private String patrolPointName;

    /** 巡更任务编号 */
    @Excel(name = "巡更任务编号")
    private Long patrolId;

    /** 巡更任务名称 */
    @Excel(name = "巡更任务名称")
    private String patrolName;

    /** 巡更人编号 */
    @Excel(name = "巡更人编号")
    private Long personnelId;

    /** 巡更人姓名 */
    @Excel(name = "巡更人姓名")
    private String personnelName;

    /** 巡更结果 */
    @Excel(name = "巡更结果")
    private String patrolResult;

    private String imgUrl;

    private List<String> imgUrls;

    /** 区域划分id */
    private Long regionId;
}
