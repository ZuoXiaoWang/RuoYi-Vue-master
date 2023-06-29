package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.InspectionItem;

/**
 * 【请填写功能名称】Mapper接口
 *
 * @author ruoyi
 * @date 2023-06-27
 */
public interface InspectionItemMapper
{
    /**
     * 查询【请填写功能名称】
     *
     * @param itemId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public InspectionItem selectInspectionItemByItemId(String itemId);

    /**
     * 查询【请填写功能名称】列表
     *
     * @param inspectionItem 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<InspectionItem> selectInspectionItemList(InspectionItem inspectionItem);

    /**
     * 新增【请填写功能名称】
     *
     * @param inspectionItem 【请填写功能名称】
     * @return 结果
     */
    public int insertInspectionItem(InspectionItem inspectionItem);

    /**
     * 修改【请填写功能名称】
     *
     * @param inspectionItem 【请填写功能名称】
     * @return 结果
     */
    public int updateInspectionItem(InspectionItem inspectionItem);

    /**
     * 删除【请填写功能名称】
     *
     * @param itemId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteInspectionItemByItemId(String itemId);

    /**
     * 批量删除【请填写功能名称】
     *
     * @param itemIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteInspectionItemByItemIds(String[] itemIds);
}
