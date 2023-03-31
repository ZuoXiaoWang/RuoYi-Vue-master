package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 了对象 sys_personnel_post
 *
 * @author ruoyi
 * @date 2023-03-28
 */
public class SysPersonnelPost extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 员工id
     */
    @Excel(name = "员工id")
    private Long personnelId;

    /**
     * 岗位id
     */
    @Excel(name = "岗位id")
    private Long postId;

    public void setPersonnelId(Long personnelId) {
        this.personnelId = personnelId;
    }

    public Long getPersonnelId() {
        return personnelId;
    }

    public void setPostId(Long postId) {
        this.postId = postId;
    }

    public Long getPostId() {
        return postId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("personnelId", getPersonnelId())
                .append("postId", getPostId())
                .toString();
    }
}
