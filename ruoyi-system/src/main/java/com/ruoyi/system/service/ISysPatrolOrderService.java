package com.ruoyi.system.service;

import java.util.List;

import com.ruoyi.system.domain.SysPatrolOrder;
import com.ruoyi.system.domain.SysPatrolOrderImg;
import com.ruoyi.system.domain.SysPatrolPatrolPointStatus;

/**
 * 巡更工单管理Service接口
 *
 * @author lile
 * @date 2023-03-31
 */
public interface ISysPatrolOrderService {
    /**
     * 查询巡更工单管理
     *
     * @param patrolOrderId 巡更工单管理主键
     * @return 巡更工单管理
     */
    public SysPatrolOrder selectSysPatrolOrderByPatrolOrderId(Long patrolOrderId);

    /**
     * 查询巡更工单管理列表
     *
     * @param sysPatrolOrder 巡更工单管理
     * @return 巡更工单管理集合
     */
    public List<SysPatrolOrder> selectSysPatrolOrderList(SysPatrolOrder sysPatrolOrder);

    /**
     * 新增巡更工单管理
     *
     * @param sysPatrolOrder 巡更工单管理
     * @return 结果
     */
    public int insertSysPatrolOrder(SysPatrolOrder sysPatrolOrder);

    /**
     * 修改巡更工单管理
     *
     * @param sysPatrolOrder 巡更工单管理
     * @return 结果
     */
    public int updateSysPatrolOrder(SysPatrolOrder sysPatrolOrder);

    /**
     * 批量删除巡更工单管理
     *
     * @param patrolOrderIds 需要删除的巡更工单管理主键集合
     * @return 结果
     */
    public int deleteSysPatrolOrderByPatrolOrderIds(Long[] patrolOrderIds);

    /**
     * 删除巡更工单管理信息
     *
     * @param patrolOrderId 巡更工单管理主键
     * @return 结果
     */
    public int deleteSysPatrolOrderByPatrolOrderId(Long patrolOrderId);

    public List<String> selectImgUrlsByPatrolOrderId(Long patrolOrderId);

    //根据任务id和点位id查询所有没有巡更的
    public void changePatrolPatrolPointStatusService(SysPatrolOrder sysPatrolOrder,String status);
}
