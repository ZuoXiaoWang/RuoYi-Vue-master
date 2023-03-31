package com.ruoyi.system.mapper;

import java.util.List;

import com.ruoyi.system.domain.SysPatrolPersonnel;
import com.ruoyi.system.domain.SysPersonnelPost;

/**
 * 【请填写功能名称】Mapper接口
 *
 * @author ruoyi
 * @date 2023-03-31
 */
public interface SysPatrolPersonnelMapper {
    /**
     * 查询【请填写功能名称】
     *
     * @param patrolId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public SysPatrolPersonnel selectSysPatrolPersonnelByPatrolId(Long patrolId);

    /**
     * 查询【请填写功能名称】列表
     *
     * @param sysPatrolPersonnel 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<SysPatrolPersonnel> selectSysPatrolPersonnelList(SysPatrolPersonnel sysPatrolPersonnel);

    /**
     * 新增【请填写功能名称】
     *
     * @param sysPatrolPersonnel 【请填写功能名称】
     * @return 结果
     */
    public int insertSysPatrolPersonnel(SysPatrolPersonnel sysPatrolPersonnel);

    /**
     * 修改【请填写功能名称】
     *
     * @param sysPatrolPersonnel 【请填写功能名称】
     * @return 结果
     */
    public int updateSysPatrolPersonnel(SysPatrolPersonnel sysPatrolPersonnel);

    /**
     * 删除【请填写功能名称】
     *
     * @param patrolId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteSysPatrolPersonnelByPatrolId(Long patrolId);

    /**
     * 批量删除【请填写功能名称】
     *
     * @param patrolIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysPatrolPersonnelByPatrolIds(Long[] patrolIds);

    public int batchPatrolPersonnel(List<SysPatrolPersonnel> PatrolPersonnelList);
}
