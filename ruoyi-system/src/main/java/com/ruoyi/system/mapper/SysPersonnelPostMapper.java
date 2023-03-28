package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SysPersonnelPost;
import com.ruoyi.system.domain.SysUserPost;

/**
 * 了Mapper接口
 *
 * @author ruoyi
 * @date 2023-03-28
 */
public interface SysPersonnelPostMapper
{
    /**
     * 通过PersonnelID删除Personnel和岗位关联
     *
     * @param PersonnelId PersonnelID
     * @return 结果
     */
    public int deletePersonnelPostByPersonnelId(Long PersonnelId);

    /**
     * 通过岗位ID查询岗位使用数量
     *
     * @param postId 岗位ID
     * @return 结果
     */
    public int countPersonnelPostByPostId(Long postId);

    /**
     * 批量删除Personnel和岗位关联
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deletePersonnelPost(Long[] ids);

    /**
     * 批量新增员工岗位信息
     *
     * @param PersonnelPostList 员工岗位列表
     * @return 结果
     */
    public int batchPersonnelPost(List<SysPersonnelPost> PersonnelPostList);
}
