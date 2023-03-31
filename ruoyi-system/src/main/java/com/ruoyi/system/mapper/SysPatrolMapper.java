package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SysPatrol;

/**
 * 巡更任务管理Mapper接口
 * 
 * @author lile
 * @date 2023-03-31
 */
public interface SysPatrolMapper 
{
    /**
     * 查询巡更任务管理
     * 
     * @param patrolId 巡更任务管理主键
     * @return 巡更任务管理
     */
    public SysPatrol selectSysPatrolByPatrolId(Long patrolId);

    /**
     * 查询巡更任务管理列表
     * 
     * @param sysPatrol 巡更任务管理
     * @return 巡更任务管理集合
     */
    public List<SysPatrol> selectSysPatrolList(SysPatrol sysPatrol);

    /**
     * 新增巡更任务管理
     * 
     * @param sysPatrol 巡更任务管理
     * @return 结果
     */
    public int insertSysPatrol(SysPatrol sysPatrol);

    /**
     * 修改巡更任务管理
     * 
     * @param sysPatrol 巡更任务管理
     * @return 结果
     */
    public int updateSysPatrol(SysPatrol sysPatrol);

    /**
     * 删除巡更任务管理
     * 
     * @param patrolId 巡更任务管理主键
     * @return 结果
     */
    public int deleteSysPatrolByPatrolId(Long patrolId);

    /**
     * 批量删除巡更任务管理
     * 
     * @param patrolIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysPatrolByPatrolIds(Long[] patrolIds);
}
