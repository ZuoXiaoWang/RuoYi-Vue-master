package com.ruoyi.system.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
public class PersonnelAndPatrolOrder extends BaseEntity {

    private String personnelName;

    private String openId;

    private Long postId;

    private Long deptId;
    private Long patrolPointId;
    private String patrolPointName;
    private String patrolName;
}
