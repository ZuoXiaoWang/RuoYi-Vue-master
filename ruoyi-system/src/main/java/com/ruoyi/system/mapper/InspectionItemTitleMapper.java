package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.InspectionItemTitle;

/**
 * 【请填写功能名称】Mapper接口
 *
 * @author ruoyi
 * @date 2023-06-27
 */
public interface InspectionItemTitleMapper
{
    /**
     * 查询【请填写功能名称】
     *
     * @param titleId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public InspectionItemTitle selectInspectionItemTitleByTitleId(String titleId);

    /**
     * 查询【请填写功能名称】列表
     *
     * @param inspectionItemTitle 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<InspectionItemTitle> selectInspectionItemTitleList(InspectionItemTitle inspectionItemTitle);

    /**
     * 新增【请填写功能名称】
     *
     * @param inspectionItemTitle 【请填写功能名称】
     * @return 结果
     */
    public int insertInspectionItemTitle(InspectionItemTitle inspectionItemTitle);

    /**
     * 修改【请填写功能名称】
     *
     * @param inspectionItemTitle 【请填写功能名称】
     * @return 结果
     */
    public int updateInspectionItemTitle(InspectionItemTitle inspectionItemTitle);

    /**
     * 删除【请填写功能名称】
     *
     * @param titleId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteInspectionItemTitleByTitleId(String titleId);

    /**
     * 批量删除【请填写功能名称】
     *
     * @param titleIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteInspectionItemTitleByTitleIds(String[] titleIds);
}
