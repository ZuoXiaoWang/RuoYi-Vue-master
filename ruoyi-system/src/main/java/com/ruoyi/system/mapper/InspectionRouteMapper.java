package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.InspectionRoute;

/**
 * 【请填写功能名称】Mapper接口
 *
 * @author ruoyi
 * @date 2023-06-28
 */
public interface InspectionRouteMapper
{
    /**
     * 查询【请填写功能名称】
     *
     * @param inspectionRouteId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public InspectionRoute selectInspectionRouteByInspectionRouteId(String inspectionRouteId);

    /**
     * 查询【请填写功能名称】列表
     *
     * @param inspectionRoute 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<InspectionRoute> selectInspectionRouteList(InspectionRoute inspectionRoute);

    /**
     * 新增【请填写功能名称】
     *
     * @param inspectionRoute 【请填写功能名称】
     * @return 结果
     */
    public int insertInspectionRoute(InspectionRoute inspectionRoute);

    /**
     * 修改【请填写功能名称】
     *
     * @param inspectionRoute 【请填写功能名称】
     * @return 结果
     */
    public int updateInspectionRoute(InspectionRoute inspectionRoute);

    /**
     * 删除【请填写功能名称】
     *
     * @param inspectionRouteId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteInspectionRouteByInspectionRouteId(String inspectionRouteId);

    /**
     * 批量删除【请填写功能名称】
     *
     * @param inspectionRouteIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteInspectionRouteByInspectionRouteIds(String[] inspectionRouteIds);



}
