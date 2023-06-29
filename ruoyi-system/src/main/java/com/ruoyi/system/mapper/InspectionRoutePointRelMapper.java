package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.InspectionRoutePointRel;

/**
 * 【请填写功能名称】Mapper接口
 *
 * @author ruoyi
 * @date 2023-06-28
 */
public interface InspectionRoutePointRelMapper
{
    /**
     * 查询【请填写功能名称】
     *
     * @param irpRelId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public InspectionRoutePointRel selectInspectionRoutePointRelByIrpRelId(String irpRelId);

    /**
     * 查询【请填写功能名称】列表
     *
     * @param inspectionRoutePointRel 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<InspectionRoutePointRel> selectInspectionRoutePointRelList(InspectionRoutePointRel inspectionRoutePointRel);

    /**
     * 新增【请填写功能名称】
     *
     * @param inspectionRoutePointRel 【请填写功能名称】
     * @return 结果
     */
    public int insertInspectionRoutePointRel(InspectionRoutePointRel inspectionRoutePointRel);

    /**
     * 修改【请填写功能名称】
     *
     * @param inspectionRoutePointRel 【请填写功能名称】
     * @return 结果
     */
    public int updateInspectionRoutePointRel(InspectionRoutePointRel inspectionRoutePointRel);

    /**
     * 删除【请填写功能名称】
     *
     * @param irpRelId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteInspectionRoutePointRelByIrpRelId(String irpRelId);

    /**
     * 批量删除【请填写功能名称】
     *
     * @param irpRelIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteInspectionRoutePointRelByIrpRelIds(String[] irpRelIds);


    public int deleteInspectionRoutePointRelByInspectionRouteIds(String[] inspectionRouteIds);

    public int deleteInspectionRoutePointRelByInspectionRouteId(String inspectionRouteId);

    public int batchInsertInspectionRouteRel(List<InspectionRoutePointRel> inspectionRoutePointRels);


    public Long[] selectInspectionRoutePointRelIds(String routeId);
}
