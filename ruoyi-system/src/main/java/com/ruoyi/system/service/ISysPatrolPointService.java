package com.ruoyi.system.service;

import java.util.List;

import com.ruoyi.system.domain.SysPatrolPersonnel;
import com.ruoyi.system.domain.SysPatrolPoint;
import com.ruoyi.system.domain.SysRepairPersonnel;

/**
 * 巡更点管理Service接口
 *
 * @author lile
 * @date 2023-03-28
 */
public interface ISysPatrolPointService {
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
     * 批量删除巡更点管理
     *
     * @param patrolPointIds 需要删除的巡更点管理主键集合
     * @return 结果
     */
    public int deleteSysPatrolPointByPatrolPointIds(Long[] patrolPointIds);

    /**
     * 删除巡更点管理信息
     *
     * @param patrolPointId 巡更点管理主键
     * @return 结果
     */
    public int deleteSysPatrolPointByPatrolPointId(Long patrolPointId);

    public List<SysPatrolPoint> selectPatrolPointAll();

    public List<SysPatrolPoint> selectPatrolPointListByPatrolIdAndPersonnelId(SysPatrolPersonnel sysPatrolPersonnel);

    public List<SysPatrolPoint> selectPatrolPointListByRepairIdAndPersonnelId(SysRepairPersonnel sysRepairPersonnel);

    public List<Long> selectPatrolPointListByPatrolId(Long patrolId);

    public List<Long> selectPatrolPointListByRepairId(Long RepairId);

}
