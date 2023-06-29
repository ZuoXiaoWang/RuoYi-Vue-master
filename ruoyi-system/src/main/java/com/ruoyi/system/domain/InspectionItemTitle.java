package com.ruoyi.system.domain;

import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;
import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Data
public class InspectionItemTitle extends BaseEntity {
    public static final String TITLE_TYPE_SINGLE = "1001"; // 单选题
    public static final String TITLE_TYPE_MULTIPLE = "2002"; // 多选题
    public static final String TITLE_TYPE_QUESTIONS = "3003"; // 简答题

    private String titleId;
    private String itemId;
    private String titleType;
    private String itemTitle;
    private Long regionId;
    private String seq;
    private String statusCd = "0";
    private List<InspectionItemTitleValue> inspectionItemTitleValue;

    private Long userId;
}
