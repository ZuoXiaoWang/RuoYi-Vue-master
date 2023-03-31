package com.ruoyi.system.mapper;

import java.util.List;

import com.ruoyi.system.domain.SysPatrolPersonnel;
import com.ruoyi.system.domain.SysRepairPatrolPoint;
import com.ruoyi.system.domain.SysRepairPersonnel;

/**
 * 【请填写功能名称】Mapper接口
 *
 * @author ruoyi
 * @date 2023-03-31
 */
public interface SysRepairPatrolPointMapper
{
    /**
     * 查询【请填写功能名称】
     *
     * @param repairId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public SysRepairPatrolPoint selectSysRepairPatrolPointByRepairId(Long repairId);

    /**
     * 查询【请填写功能名称】列表
     *
     * @param sysRepairPatrolPoint 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<SysRepairPatrolPoint> selectSysRepairPatrolPointList(SysRepairPatrolPoint sysRepairPatrolPoint);

    /**
     * 新增【请填写功能名称】
     *
     * @param sysRepairPatrolPoint 【请填写功能名称】
     * @return 结果
     */
    public int insertSysRepairPatrolPoint(SysRepairPatrolPoint sysRepairPatrolPoint);

    /**
     * 修改【请填写功能名称】
     *
     * @param sysRepairPatrolPoint 【请填写功能名称】
     * @return 结果
     */
    public int updateSysRepairPatrolPoint(SysRepairPatrolPoint sysRepairPatrolPoint);

    /**
     * 删除【请填写功能名称】
     *
     * @param repairId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteSysRepairPatrolPointByRepairId(Long repairId);

    /**
     * 批量删除【请填写功能名称】
     *
     * @param repairIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysRepairPatrolPointByRepairIds(Long[] repairIds);

    public int batchRepairPatrolPoint(List<SysRepairPatrolPoint> repairPatrolPointList);
}
