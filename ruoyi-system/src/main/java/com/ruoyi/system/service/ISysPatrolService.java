package com.ruoyi.system.service;

import java.util.List;

import com.ruoyi.system.domain.SysPatrol;
import com.ruoyi.system.domain.SysPatrolPatrolPointStatus;
import com.ruoyi.system.domain.SysPatrolPoint;

/**
 * 巡更任务管理Service接口
 *
 * @author lile
 * @date 2023-03-31
 */
public interface ISysPatrolService {
    /**
     * 查询巡更任务管理
     *
     * @param patrolId 巡更任务管理主键
     * @return 巡更任务管理
     */
    public SysPatrol selectSysPatrolByPatrolId(Long patrolId);

    /**
     * 查询任务模板
     */
    public SysPatrol selectSysPatrolTemplateByPatrolId(Long patrolId);

    /**
     * 查询巡更任务管理列表
     *
     * @param sysPatrol 巡更任务管理
     * @return 巡更任务管理集合
     */
    public List<SysPatrol> selectSysPatrolList(SysPatrol sysPatrol);

    public List<SysPatrol> selectSysPatrolList4vue(SysPatrol sysPatrol);

    public int deleteSysPatrolWithEnd();

    /**
     * 新增巡更任务管理
     *
     * @param sysPatrol 巡更任务管理
     * @return 结果
     */
    public int insertSysPatrol(SysPatrol sysPatrol);

    public int insertSysPatrol(SysPatrol sysPatrol,List<Long> personnelList,List<Long> patrolPointList);

    /**
     * 修改巡更任务管理
     *
     * @param sysPatrol 巡更任务管理
     * @return 结果
     */
    public int updateSysPatrol(SysPatrol sysPatrol);

    public int updateSysPatrolWithStatus(SysPatrol sysPatrol);

    /**
     * 批量删除巡更任务管理
     *
     * @param patrolIds 需要删除的巡更任务管理主键集合
     * @return 结果
     */
    public int deleteSysPatrolByPatrolIds(Long[] patrolIds);

    /**
     * 删除巡更任务管理信息
     *
     * @param patrolId 巡更任务管理主键
     * @return 结果
     */
    public int deleteSysPatrolByPatrolId(Long patrolId);

    /**
     * 查询所有已巡和未巡点
     */
    public List<SysPatrolPatrolPointStatus> selectPointStatusByPatrolId(Long patrolId);
}
