package com.ruoyi.system.domain;

import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
public class InspectionItem extends BaseEntity {
    private String itemId;
    private String itemName;
    private String remark;
    private Long regionId;
    private String statusCd = "0";
    private Long userId;
}
