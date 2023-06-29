package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.InspectionItemTitleValue;

/**
 * 【请填写功能名称】Mapper接口
 *
 * @author ruoyi
 * @date 2023-06-27
 */
public interface InspectionItemTitleValueMapper
{
    /**
     * 查询【请填写功能名称】
     *
     * @param valueId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public InspectionItemTitleValue selectInspectionItemTitleValueByValueId(String valueId);

    /**
     * 查询【请填写功能名称】列表
     *
     * @param inspectionItemTitleValue 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<InspectionItemTitleValue> selectInspectionItemTitleValueList(InspectionItemTitleValue inspectionItemTitleValue);

    /**
     * 新增【请填写功能名称】
     *
     * @param inspectionItemTitleValue 【请填写功能名称】
     * @return 结果
     */
    public int insertInspectionItemTitleValue(InspectionItemTitleValue inspectionItemTitleValue);

    /**
     * 修改【请填写功能名称】
     *
     * @param inspectionItemTitleValue 【请填写功能名称】
     * @return 结果
     */
    public int updateInspectionItemTitleValue(InspectionItemTitleValue inspectionItemTitleValue);

    /**
     * 删除【请填写功能名称】
     *
     * @param valueId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteInspectionItemTitleValueByValueId(String valueId);

    //根据TitleId删除inspectionItemTitleValue
    public int deleteInspectionItemTitleValueByTitleId(String TitleId);

    /**
     * 批量删除【请填写功能名称】
     *
     * @param valueIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteInspectionItemTitleValueByValueIds(String[] valueIds);


    public void batchInspectionItemTitleValue(List<InspectionItemTitleValue> inspectionItemTitleValueList);
}
