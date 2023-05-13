package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.NewRepairFromPersonnel;

/**
 * 【请填写功能名称】Mapper接口
 *
 * @author ruoyi
 * @date 2023-05-13
 */
public interface NewRepairFromPersonnelMapper
{
    /**
     * 查询【请填写功能名称】
     *
     * @param newRepairFromId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public NewRepairFromPersonnel selectNewRepairFromPersonnelByNewRepairFromId(Long newRepairFromId);

    /**
     * 查询【请填写功能名称】列表
     *
     * @param newRepairFromPersonnel 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<NewRepairFromPersonnel> selectNewRepairFromPersonnelList(NewRepairFromPersonnel newRepairFromPersonnel);

    /**
     * 新增【请填写功能名称】
     *
     * @param newRepairFromPersonnel 【请填写功能名称】
     * @return 结果
     */
    public int insertNewRepairFromPersonnel(NewRepairFromPersonnel newRepairFromPersonnel);

    /**
     * 修改【请填写功能名称】
     *
     * @param newRepairFromPersonnel 【请填写功能名称】
     * @return 结果
     */
    public int updateNewRepairFromPersonnel(NewRepairFromPersonnel newRepairFromPersonnel);

    /**
     * 删除【请填写功能名称】
     *
     * @param newRepairFromId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteNewRepairFromPersonnelByNewRepairFromId(Long newRepairFromId);

    /**
     * 批量删除【请填写功能名称】
     *
     * @param newRepairFromIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteNewRepairFromPersonnelByNewRepairFromIds(Long[] newRepairFromIds);
}
