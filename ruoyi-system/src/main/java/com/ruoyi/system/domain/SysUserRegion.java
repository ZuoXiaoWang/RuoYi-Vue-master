package com.ruoyi.system.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 sys_user_region
 *
 * @author ruoyi
 * @date 2023-06-10
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class SysUserRegion extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    private String name;
    /** 用户id */
    private Long userId;

    /** 区域id */
    private Long regionId;

    private Long[] userIds;
}
