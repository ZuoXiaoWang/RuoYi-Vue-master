package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.NewRepairRepairFrom;

/**
 * 【请填写功能名称】Mapper接口
 *
 * @author ruoyi
 * @date 2023-05-13
 */
public interface NewRepairRepairFromMapper
{
    /**
     * 查询【请填写功能名称】
     *
     * @param newRepairId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public NewRepairRepairFrom selectNewRepairRepairFromByNewRepairId(Long newRepairId);

    /**
     * 查询【请填写功能名称】列表
     *
     * @param newRepairRepairFrom 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<NewRepairRepairFrom> selectNewRepairRepairFromList(NewRepairRepairFrom newRepairRepairFrom);

    /**
     * 新增【请填写功能名称】
     *
     * @param newRepairRepairFrom 【请填写功能名称】
     * @return 结果
     */
    public int insertNewRepairRepairFrom(NewRepairRepairFrom newRepairRepairFrom);

    /**
     * 修改【请填写功能名称】
     *
     * @param newRepairRepairFrom 【请填写功能名称】
     * @return 结果
     */
    public int updateNewRepairRepairFrom(NewRepairRepairFrom newRepairRepairFrom);

    /**
     * 删除【请填写功能名称】
     *
     * @param newRepairId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteNewRepairRepairFromByNewRepairId(Long newRepairId);

    /**
     * 批量删除【请填写功能名称】
     *
     * @param newRepairIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteNewRepairRepairFromByNewRepairIds(Long[] newRepairIds);
}
