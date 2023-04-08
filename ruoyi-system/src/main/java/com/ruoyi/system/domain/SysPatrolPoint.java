package com.ruoyi.system.domain;

import java.math.BigDecimal;

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

    public void setPatrolPointId(Long patrolPointId) {
        this.patrolPointId = patrolPointId;
    }

    public Long getPatrolPointId() {
        return patrolPointId;
    }

    public void setPatrolPointName(String patrolPointName) {
        this.patrolPointName = patrolPointName;
    }

    public String getPatrolPointName() {
        return patrolPointName;
    }

    public void setPatrolPointDescribe(String patrolPointDescribe) {
        this.patrolPointDescribe = patrolPointDescribe;
    }

    public String getPatrolPointDescribe() {
        return patrolPointDescribe;
    }

    public void setPatrolPointUrl(String patrolPointUrl) {
        this.patrolPointUrl = patrolPointUrl;
    }

    public String getPatrolPointUrl() {
        return patrolPointUrl;
    }

    public void setPatrolPointLatitude(BigDecimal patrolPointLatitude) {
        this.patrolPointLatitude = patrolPointLatitude;
    }

    public BigDecimal getPatrolPointLatitude() {
        return patrolPointLatitude;
    }

    public void setPatrolPointLongitude(BigDecimal patrolPointLongitude) {
        this.patrolPointLongitude = patrolPointLongitude;
    }

    public BigDecimal getPatrolPointLongitude() {
        return patrolPointLongitude;
    }

    public void setPatrolPointAltitude(BigDecimal patrolPointAltitude) {
        this.patrolPointAltitude = patrolPointAltitude;
    }

    public BigDecimal getPatrolPointAltitude() {
        return patrolPointAltitude;
    }

    public void setPatrolPointStatus(String patrolPointStatus) {
        this.patrolPointStatus = patrolPointStatus;
    }

    public String getPatrolPointStatus() {
        return patrolPointStatus;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("patrolPointId", getPatrolPointId())
                .append("patrolPointName", getPatrolPointName())
                .append("patrolPointDescribe", getPatrolPointDescribe())
                .append("patrolPointUrl", getPatrolPointUrl())
                .append("patrolPointLatitude", getPatrolPointLatitude())
                .append("patrolPointLongitude", getPatrolPointLongitude())
                .append("patrolPointAltitude", getPatrolPointAltitude())
                .append("patrolPointStatus", getPatrolPointStatus())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .toString();
    }
}
