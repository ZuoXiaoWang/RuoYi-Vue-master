package com.ruoyi.system.domain;

import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
public class InspectionItemTitleValue extends BaseEntity {
    private String valueId;
    private String titleId;
    private String[] titleIds;
    private String itemValue;
    private Long regionId;
    private String seq;
    private String statusCd = "0";

    private Long userId;
}
