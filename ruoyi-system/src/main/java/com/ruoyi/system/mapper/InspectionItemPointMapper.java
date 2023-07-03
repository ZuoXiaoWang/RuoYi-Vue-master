package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.InspectionItemPoint;

/**
 * 【请填写功能名称】Mapper接口
 *
 * @author ruoyi
 * @date 2023-07-03
 */
public interface InspectionItemPointMapper
{
    /**
     * 查询【请填写功能名称】
     *
     * @param patrolPointId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public InspectionItemPoint selectInspectionItemPointByPatrolPointId(Long patrolPointId);

    /**
     * 查询【请填写功能名称】列表
     *
     * @param inspectionItemPoint 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<InspectionItemPoint> selectInspectionItemPointList(InspectionItemPoint inspectionItemPoint);

    /**
     * 新增【请填写功能名称】
     *
     * @param inspectionItemPoint 【请填写功能名称】
     * @return 结果
     */
    public int insertInspectionItemPoint(InspectionItemPoint inspectionItemPoint);

    /**
     * 修改【请填写功能名称】
     *
     * @param inspectionItemPoint 【请填写功能名称】
     * @return 结果
     */
    public int updateInspectionItemPoint(InspectionItemPoint inspectionItemPoint);

    /**
     * 删除【请填写功能名称】
     *
     * @param patrolPointId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteInspectionItemPointByPatrolPointId(Long patrolPointId);

    /**
     * 批量删除【请填写功能名称】
     *
     * @param patrolPointIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteInspectionItemPointByPatrolPointIds(Long[] patrolPointIds);
}
