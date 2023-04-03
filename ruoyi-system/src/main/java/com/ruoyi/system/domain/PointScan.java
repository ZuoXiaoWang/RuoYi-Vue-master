package com.ruoyi.system.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.math.BigDecimal;

public class PointScan extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 巡更点纬度
     */
    private BigDecimal patrolPointLatitude;

    /**
     * 巡更点经度
     */
    private BigDecimal patrolPointLongitude;

    /**
     * 巡更点高度
     */
    private BigDecimal patrolPointAltitude;

    public BigDecimal getPatrolPointLatitude() {
        return patrolPointLatitude;
    }

    public void setPatrolPointLatitude(BigDecimal patrolPointLatitude) {
        this.patrolPointLatitude = patrolPointLatitude;
    }

    public BigDecimal getPatrolPointLongitude() {
        return patrolPointLongitude;
    }

    public void setPatrolPointLongitude(BigDecimal patrolPointLongitude) {
        this.patrolPointLongitude = patrolPointLongitude;
    }

    public BigDecimal getPatrolPointAltitude() {
        return patrolPointAltitude;
    }

    public void setPatrolPointAltitude(BigDecimal patrolPointAltitude) {
        this.patrolPointAltitude = patrolPointAltitude;
    }

    @Override
    public String toString() {
        return "PointScan{" +
                "patrolPointLatitude=" + patrolPointLatitude +
                ", patrolPointLongitude=" + patrolPointLongitude +
                ", patrolPointAltitude=" + patrolPointAltitude +
                '}';
    }
}
