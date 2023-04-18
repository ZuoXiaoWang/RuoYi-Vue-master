package com.ruoyi.system.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

public class SysRepairImg extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 图片编号 */
    private Long imgId;

    /** 维修工单编号 */
    private Long repairId;

    /** 图片地址 */
    private String imgUrl;

    public Long getImgId() {
        return imgId;
    }

    public void setImgId(Long imgId) {
        this.imgId = imgId;
    }

    public Long getRepairId() {
        return repairId;
    }

    public void setRepairId(Long repairId) {
        this.repairId = repairId;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    @Override
    public String toString() {
        return "SysRepairImg{" +
                "imgId=" + imgId +
                ", repairId=" + repairId +
                ", imgUrl='" + imgUrl + '\'' +
                '}';
    }
}
