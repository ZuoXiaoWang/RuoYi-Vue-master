package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.SysRepairPersonnel;

import java.util.List;

/**
 * 【请填写功能名称】Mapper接口
 *
 * @author ruoyi
 * @date 2023-03-31
 */
public interface SysRepairPersonnelMapper
{
    /**
     * 查询【请填写功能名称】
     *
     * @param repairId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public SysRepairPersonnel selectSysRepairPersonnelByRepairId(Long repairId);

    /**
     * 查询【请填写功能名称】列表
     *
     * @param sysRepairPersonnel 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<SysRepairPersonnel> selectSysRepairPersonnelList(SysRepairPersonnel sysRepairPersonnel);

    /**
     * 新增【请填写功能名称】
     *
     * @param sysRepairPersonnel 【请填写功能名称】
     * @return 结果
     */
    public int insertSysRepairPersonnel(SysRepairPersonnel sysRepairPersonnel);

    /**
     * 修改【请填写功能名称】
     *
     * @param sysRepairPersonnel 【请填写功能名称】
     * @return 结果
     */
    public int updateSysRepairPersonnel(SysRepairPersonnel sysRepairPersonnel);

    /**
     * 删除【请填写功能名称】
     *
     * @param repairId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteSysRepairPersonnelByRepairId(Long repairId);

    /**
     * 批量删除【请填写功能名称】
     *
     * @param repairIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysRepairPersonnelByRepairIds(Long[] repairIds);

    public int batchRepairPersonnel(List<SysRepairPersonnel> repairPersonnelList);
}
