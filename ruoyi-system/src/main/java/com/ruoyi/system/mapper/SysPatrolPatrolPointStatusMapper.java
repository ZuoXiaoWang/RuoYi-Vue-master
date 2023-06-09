package com.ruoyi.system.mapper;

import java.util.List;

import com.ruoyi.system.domain.SysPatrolOrder;
import com.ruoyi.system.domain.SysPatrolPatrolPointStatus;
import com.ruoyi.system.domain.SysPatrolPersonnel;
import com.ruoyi.system.domain.SysPatrolPoint;

/**
 * 【请填写功能名称】Mapper接口
 *
 * @author ruoyi
 * @date 2023-04-20
 */
public interface SysPatrolPatrolPointStatusMapper
{
    /**
     * 查询【请填写功能名称】
     *
     * @param patrolPatrolPointStatusId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public SysPatrolPatrolPointStatus selectSysPatrolPatrolPointStatusByPatrolPatrolPointStatusId(Long patrolPatrolPointStatusId);

    /**
     * 查询【请填写功能名称】列表
     *
     * @param sysPatrolPatrolPointStatus 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<SysPatrolPatrolPointStatus> selectSysPatrolPatrolPointStatusList(SysPatrolPatrolPointStatus sysPatrolPatrolPointStatus);

    /**
     * 新增【请填写功能名称】
     *
     * @param sysPatrolPatrolPointStatus 【请填写功能名称】
     * @return 结果
     */
    public int insertSysPatrolPatrolPointStatus(SysPatrolPatrolPointStatus sysPatrolPatrolPointStatus);

    /**
     * 修改【请填写功能名称】
     *
     * @param sysPatrolPatrolPointStatus 【请填写功能名称】
     * @return 结果
     */
    public int updateSysPatrolPatrolPointStatus(SysPatrolPatrolPointStatus sysPatrolPatrolPointStatus);

    /**
     * 删除【请填写功能名称】
     *
     * @param patrolPatrolPointStatusId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteSysPatrolPatrolPointStatusByPatrolPatrolPointStatusId(Long patrolPatrolPointStatusId);

    /**
     * 批量删除【请填写功能名称】
     *
     * @param patrolPatrolPointStatusIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysPatrolPatrolPointStatusByPatrolPatrolPointStatusIds(Long[] patrolPatrolPointStatusIds);
    public int batchPatrolPatrolPointStatus(List<SysPatrolPatrolPointStatus> patrolPatrolPointStatusList);

    public int deleteSysPatrolPatrolPointStatusByPatrolId(Long patrolId);

    public int deleteSysPatrolPatrolPointStatusByPatrolIds(Long[] patrolIds);

    public SysPatrolPatrolPointStatus selectSysPatrolPatrolPointStatusByPatrolIdAndPatrolPointId(SysPatrolOrder sysPatrolOrder);

    /**
     * 查询所有已经巡点和未巡点
     */
    public List<SysPatrolPoint> selectPointStatusByPatrolId(Long patrolId);
}
