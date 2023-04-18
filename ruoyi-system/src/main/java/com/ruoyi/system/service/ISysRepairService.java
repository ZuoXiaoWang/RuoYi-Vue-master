package com.ruoyi.system.service;

import java.util.List;

import com.ruoyi.system.domain.SysRepair;

/**
 * 维修任务Service接口
 *
 * @author lile
 * @date 2023-03-31
 */
public interface ISysRepairService {
    /**
     * 查询维修任务
     *
     * @param repairId 维修任务主键
     * @return 维修任务
     */
    public SysRepair selectSysRepairByRepairId(Long repairId);

    /**
     * 查询维修任务列表
     *
     * @param sysRepair 维修任务
     * @return 维修任务集合
     */
    public List<SysRepair> selectSysRepairList(SysRepair sysRepair);

    /**
     * 新增维修任务
     *
     * @param sysRepair 维修任务
     * @return 结果
     */
    public int insertSysRepair(SysRepair sysRepair);

    /**
     * 修改维修任务
     *
     * @param sysRepair 维修任务
     * @return 结果
     */
    public int updateSysRepair(SysRepair sysRepair);

    /**
     * 批量删除维修任务
     *
     * @param repairIds 需要删除的维修任务主键集合
     * @return 结果
     */
    public int deleteSysRepairByRepairIds(Long[] repairIds);

    /**
     * 删除维修任务信息
     *
     * @param repairId 维修任务主键
     * @return 结果
     */
    public int deleteSysRepairByRepairId(Long repairId);

    public List<String> selectImgUrlsByRepairId(Long repairId);
}
