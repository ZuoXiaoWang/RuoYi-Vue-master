package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.system.domain.SysPatrolOrderImg;
import com.ruoyi.system.mapper.SysPatrolOrderImgMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysPatrolOrderMapper;
import com.ruoyi.system.domain.SysPatrolOrder;
import com.ruoyi.system.service.ISysPatrolOrderService;

/**
 * 巡更工单管理Service业务层处理
 *
 * @author lile
 * @date 2023-03-31
 */
@Service
public class SysPatrolOrderServiceImpl implements ISysPatrolOrderService
{
    @Autowired
    private SysPatrolOrderMapper sysPatrolOrderMapper;

    @Autowired
    private SysPatrolOrderImgMapper patrolOrderImgMapper;

    /**
     * 查询巡更工单管理
     *
     * @param patrolOrderId 巡更工单管理主键
     * @return 巡更工单管理
     */
    @Override
    public SysPatrolOrder selectSysPatrolOrderByPatrolOrderId(Long patrolOrderId)
    {
        return sysPatrolOrderMapper.selectSysPatrolOrderByPatrolOrderId(patrolOrderId);
    }

    /**
     * 查询巡更工单管理列表
     *
     * @param sysPatrolOrder 巡更工单管理
     * @return 巡更工单管理
     */
    @Override
    public List<SysPatrolOrder> selectSysPatrolOrderList(SysPatrolOrder sysPatrolOrder)
    {
        return sysPatrolOrderMapper.selectSysPatrolOrderList(sysPatrolOrder);
    }

    /**
     * 新增巡更工单管理
     *
     * @param sysPatrolOrder 巡更工单管理
     * @return 结果
     */
    @Override
    public int insertSysPatrolOrder(SysPatrolOrder sysPatrolOrder)
    {
        sysPatrolOrder.setCreateTime(DateUtils.getNowDate());
        return sysPatrolOrderMapper.insertSysPatrolOrder(sysPatrolOrder);
    }

    /**
     * 修改巡更工单管理
     *
     * @param sysPatrolOrder 巡更工单管理
     * @return 结果
     */
    @Override
    public int updateSysPatrolOrder(SysPatrolOrder sysPatrolOrder)
    {
        sysPatrolOrder.setUpdateTime(DateUtils.getNowDate());
        return sysPatrolOrderMapper.updateSysPatrolOrder(sysPatrolOrder);
    }

    /**
     * 批量删除巡更工单管理
     *
     * @param patrolOrderIds 需要删除的巡更工单管理主键
     * @return 结果
     */
    @Override
    public int deleteSysPatrolOrderByPatrolOrderIds(Long[] patrolOrderIds)
    {
        return sysPatrolOrderMapper.deleteSysPatrolOrderByPatrolOrderIds(patrolOrderIds);
    }

    /**
     * 删除巡更工单管理信息
     *
     * @param patrolOrderId 巡更工单管理主键
     * @return 结果
     */
    @Override
    public int deleteSysPatrolOrderByPatrolOrderId(Long patrolOrderId)
    {
        return sysPatrolOrderMapper.deleteSysPatrolOrderByPatrolOrderId(patrolOrderId);
    }

    @Override
    public List<String> selectImgUrlsByPatrolOrderId(Long patrolOrderId) {
        return patrolOrderImgMapper.selectImgUrlsByPatrolOrderId(patrolOrderId);
    }
}
