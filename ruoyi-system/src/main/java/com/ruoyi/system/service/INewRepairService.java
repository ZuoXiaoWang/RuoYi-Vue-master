package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.NewRepair;

/**
 * 维修单Service接口
 *
 * @author ruoyi
 * @date 2023-05-13
 */
public interface INewRepairService
{
    /**
     * 查询维修单
     *
     * @param newRepairId 维修单主键
     * @return 维修单
     */
    public NewRepair selectNewRepairByNewRepairId(Long newRepairId);

    List<String> selectImgUrls(Long newRepairId);

    /**
     * 查询维修单列表
     *
     * @param newRepair 维修单
     * @return 维修单集合
     */
    public List<NewRepair> selectNewRepairList(NewRepair newRepair);

    /**
     * 新增维修单
     *
     * @param newRepair 维修单
     * @return 结果
     */
    public int insertNewRepair(NewRepair newRepair);

    /**
     * 修改维修单
     *
     * @param newRepair 维修单
     * @return 结果
     */
    public int updateNewRepair(NewRepair newRepair);

    /**
     * 批量删除维修单
     *
     * @param newRepairIds 需要删除的维修单主键集合
     * @return 结果
     */
    public int deleteNewRepairByNewRepairIds(Long[] newRepairIds);

    /**
     * 删除维修单信息
     *
     * @param newRepairId 维修单主键
     * @return 结果
     */
    public int deleteNewRepairByNewRepairId(Long newRepairId);
}
