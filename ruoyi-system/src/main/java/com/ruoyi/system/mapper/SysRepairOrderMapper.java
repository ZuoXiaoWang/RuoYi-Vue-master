package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SysRepairOrder;

/**
 * 维修工单Mapper接口
 *
 * @author lile
 * @date 2023-04-03
 */
public interface SysRepairOrderMapper
{
    /**
     * 查询维修工单
     *
     * @param repairOrderId 维修工单主键
     * @return 维修工单
     */
    public SysRepairOrder selectSysRepairOrderByRepairOrderId(Long repairOrderId);

    /**
     * 查询维修工单列表
     *
     * @param sysRepairOrder 维修工单
     * @return 维修工单集合
     */
    public List<SysRepairOrder> selectSysRepairOrderList(SysRepairOrder sysRepairOrder);

    /**
     * 新增维修工单
     *
     * @param sysRepairOrder 维修工单
     * @return 结果
     */
    public int insertSysRepairOrder(SysRepairOrder sysRepairOrder);

    /**
     * 修改维修工单
     *
     * @param sysRepairOrder 维修工单
     * @return 结果
     */
    public int updateSysRepairOrder(SysRepairOrder sysRepairOrder);

    /**
     * 删除维修工单
     *
     * @param repairOrderId 维修工单主键
     * @return 结果
     */
    public int deleteSysRepairOrderByRepairOrderId(Long repairOrderId);

    /**
     * 批量删除维修工单
     *
     * @param repairOrderIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysRepairOrderByRepairOrderIds(Long[] repairOrderIds);
}
