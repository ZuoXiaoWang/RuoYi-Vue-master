package com.ruoyi.common.core.domain.entity;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.entity.SysDept;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 员工管理对象 sys_personnel
 *
 * @author lile
 * @date 2023-03-27
 */
public class SysPersonnel extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 员工ID
     */
    private Long personnelId;

    /**
     * 部门ID
     */
    @Excel(name = "部门ID")
    private Long deptId;

    /**
     * 岗位ID
     */
    @Excel(name = "岗位ID")
    private Long postId;

    /**
     * 用户账号
     */
    @Excel(name = "用户账号")
    private String personnelLoginName;

    /**
     * 密码
     */
    @Excel(name = "密码")
    private String personnelPassword;

    /**
     * 员工名字
     */
    @Excel(name = "员工名字")
    private String personnelName;

    /**
     * 手机号码
     */
    @Excel(name = "手机号码")
    private String personnelPhone;

    /**
     * 性别
     */
    @Excel(name = "性别")
    private String personnelSex;

    /**
     * 状态
     */
    @Excel(name = "状态")
    private String personnelStatus;

    /**
     * 入职时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "入职时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date personnelEntryTime;

    /**
     * 离职时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "离职时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date personnelResignationTime;

    /**
     * 部门
     */
    private SysDept dept;

    /**
     * 岗位组
     */
    private List<SysPost> posts;

    /**
     * 岗位组
     */
    private Long[] postIds;

    /**
     * 用户头像
     */
    private String avatar;

    public Long getPersonnelId() {
        return personnelId;
    }

    public void setPersonnelId(Long personnelId) {
        this.personnelId = personnelId;
    }

    public Long getDeptId() {
        return deptId;
    }

    public void setDeptId(Long deptId) {
        this.deptId = deptId;
    }

    public Long getPostId() {
        return postId;
    }

    public void setPostId(Long postId) {
        this.postId = postId;
    }

    public String getPersonnelLoginName() {
        return personnelLoginName;
    }

    public void setPersonnelLoginName(String personnelLoginName) {
        this.personnelLoginName = personnelLoginName;
    }

    public String getPersonnelPassword() {
        return personnelPassword;
    }

    public void setPersonnelPassword(String personnelPassword) {
        this.personnelPassword = personnelPassword;
    }

    public String getPersonnelName() {
        return personnelName;
    }

    public void setPersonnelName(String personnelName) {
        this.personnelName = personnelName;
    }

    public String getPersonnelPhone() {
        return personnelPhone;
    }

    public void setPersonnelPhone(String personnelPhone) {
        this.personnelPhone = personnelPhone;
    }

    public String getPersonnelSex() {
        return personnelSex;
    }

    public void setPersonnelSex(String personnelSex) {
        this.personnelSex = personnelSex;
    }

    public String getPersonnelStatus() {
        return personnelStatus;
    }

    public void setPersonnelStatus(String personnelStatus) {
        this.personnelStatus = personnelStatus;
    }

    public Date getPersonnelEntryTime() {
        return personnelEntryTime;
    }

    public void setPersonnelEntryTime(Date personnelEntryTime) {
        this.personnelEntryTime = personnelEntryTime;
    }

    public Date getPersonnelResignationTime() {
        return personnelResignationTime;
    }

    public void setPersonnelResignationTime(Date personnelResignationTime) {
        this.personnelResignationTime = personnelResignationTime;
    }

    public SysDept getDept() {
        return dept;
    }

    public void setDept(SysDept dept) {
        this.dept = dept;
    }

    public List<SysPost> getPosts() {
        return posts;
    }

    public void setPosts(List<SysPost> posts) {
        this.posts = posts;
    }

    public Long[] getPostIds() {
        return postIds;
    }

    public void setPostIds(Long[] postIds) {
        this.postIds = postIds;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    @Override
    public String toString() {
        return "SysPersonnel{" +
                "personnelId=" + personnelId +
                ", deptId=" + deptId +
                ", postId=" + postId +
                ", personnelLoginName='" + personnelLoginName + '\'' +
                ", personnelPassword='" + personnelPassword + '\'' +
                ", personnelName='" + personnelName + '\'' +
                ", personnelPhone='" + personnelPhone + '\'' +
                ", personnelSex='" + personnelSex + '\'' +
                ", personnelStatus='" + personnelStatus + '\'' +
                ", personnelEntryTime=" + personnelEntryTime +
                ", personnelResignationTime=" + personnelResignationTime +
                ", dept=" + dept +
                ", posts=" + posts +
                ", postIds=" + Arrays.toString(postIds) +
                ", avatar='" + avatar + '\'' +
                '}';
    }
}
