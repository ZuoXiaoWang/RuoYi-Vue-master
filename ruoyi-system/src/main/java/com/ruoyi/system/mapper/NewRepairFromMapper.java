package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.NewRepairFrom;

/**
 * 报修单Mapper接口
 * 
 * @author ruoyi
 * @date 2023-05-13
 */
public interface NewRepairFromMapper 
{
    /**
     * 查询报修单
     * 
     * @param repairFromId 报修单主键
     * @return 报修单
     */
    public NewRepairFrom selectNewRepairFromByRepairFromId(Long repairFromId);

    /**
     * 查询报修单列表
     * 
     * @param newRepairFrom 报修单
     * @return 报修单集合
     */
    public List<NewRepairFrom> selectNewRepairFromList(NewRepairFrom newRepairFrom);

    /**
     * 新增报修单
     * 
     * @param newRepairFrom 报修单
     * @return 结果
     */
    public int insertNewRepairFrom(NewRepairFrom newRepairFrom);

    /**
     * 修改报修单
     * 
     * @param newRepairFrom 报修单
     * @return 结果
     */
    public int updateNewRepairFrom(NewRepairFrom newRepairFrom);

    /**
     * 删除报修单
     * 
     * @param repairFromId 报修单主键
     * @return 结果
     */
    public int deleteNewRepairFromByRepairFromId(Long repairFromId);

    /**
     * 批量删除报修单
     * 
     * @param repairFromIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteNewRepairFromByRepairFromIds(Long[] repairFromIds);
}
