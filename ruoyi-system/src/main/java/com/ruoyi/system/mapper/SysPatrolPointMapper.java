package com.ruoyi.system.mapper;

import java.util.List;

import com.ruoyi.system.domain.SysPatrolPersonnel;
import com.ruoyi.system.domain.SysPatrolPoint;
import com.ruoyi.system.domain.SysRepairPersonnel;

/**
 * 巡更点管理Mapper接口
 *
 * @author lile
 * @date 2023-03-28
 */
public interface SysPatrolPointMapper {
    /**
     * 查询巡更点管理
     *
     * @param patrolPointId 巡更点管理主键
     * @return 巡更点管理
     */
    public SysPatrolPoint selectSysPatrolPointByPatrolPointId(Long patrolPointId);

    /**
     * 查询巡更点管理列表
     *
     * @param sysPatrolPoint 巡更点管理
     * @return 巡更点管理集合
     */
    public List<SysPatrolPoint> selectSysPatrolPointList(SysPatrolPoint sysPatrolPoint);

    /**
     * 新增巡更点管理
     *
     * @param sysPatrolPoint 巡更点管理
     * @return 结果
     */
    public int insertSysPatrolPoint(SysPatrolPoint sysPatrolPoint);

    /**
     * 修改巡更点管理
     *
     * @param sysPatrolPoint 巡更点管理
     * @return 结果
     */
    public int updateSysPatrolPoint(SysPatrolPoint sysPatrolPoint);

    /**
     * 删除巡更点管理
     *
     * @param patrolPointId 巡更点管理主键
     * @return 结果
     */
    public int deleteSysPatrolPointByPatrolPointId(Long patrolPointId);

    /**
     * 批量删除巡更点管理
     *
     * @param patrolPointIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysPatrolPointByPatrolPointIds(Long[] patrolPointIds);

    public List<SysPatrolPoint> selectPatrolPointAll();

    public List<SysPatrolPoint> selectPatrolPointListByPatrolIdAndPersonnelId(SysPatrolPersonnel sysPatrolPersonnel);

    public List<SysPatrolPoint> selectPatrolPointListByRepairIdAndPersonnelId(SysRepairPersonnel sysRepairPersonnel);

    public List<Long> selectPatrolPointListByPatrolId(Long patrolId);

    public List<Long> selectPatrolPointListByRepairId(Long repairId);
}
