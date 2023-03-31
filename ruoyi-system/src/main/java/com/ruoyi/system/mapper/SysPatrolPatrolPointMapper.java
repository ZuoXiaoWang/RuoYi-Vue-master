package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SysPatrolPatrolPoint;
import com.ruoyi.system.domain.SysPersonnelPost;

/**
 * 【请填写功能名称】Mapper接口
 *
 * @author ruoyi
 * @date 2023-03-31
 */
public interface SysPatrolPatrolPointMapper
{
    /**
     * 查询【请填写功能名称】
     *
     * @param patrolId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public SysPatrolPatrolPoint selectSysPatrolPatrolPointByPatrolId(Long patrolId);

    /**
     * 查询【请填写功能名称】列表
     *
     * @param sysPatrolPatrolPoint 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<SysPatrolPatrolPoint> selectSysPatrolPatrolPointList(SysPatrolPatrolPoint sysPatrolPatrolPoint);

    /**
     * 新增【请填写功能名称】
     *
     * @param sysPatrolPatrolPoint 【请填写功能名称】
     * @return 结果
     */
    public int insertSysPatrolPatrolPoint(SysPatrolPatrolPoint sysPatrolPatrolPoint);

    /**
     * 修改【请填写功能名称】
     *
     * @param sysPatrolPatrolPoint 【请填写功能名称】
     * @return 结果
     */
    public int updateSysPatrolPatrolPoint(SysPatrolPatrolPoint sysPatrolPatrolPoint);

    /**
     * 删除【请填写功能名称】
     *
     * @param patrolId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteSysPatrolPatrolPointByPatrolId(Long patrolId);

    /**
     * 批量删除【请填写功能名称】
     *
     * @param patrolIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysPatrolPatrolPointByPatrolIds(Long[] patrolIds);
    public int batchPatrolPatrolPoint(List<SysPatrolPatrolPoint> PatrolPatrolPointList);
}
