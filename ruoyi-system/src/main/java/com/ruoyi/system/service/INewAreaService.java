package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.NewArea;

/**
 * 区域Service接口
 * 
 * @author ruoyi
 * @date 2023-05-13
 */
public interface INewAreaService 
{
    /**
     * 查询区域
     * 
     * @param areaId 区域主键
     * @return 区域
     */
    public NewArea selectNewAreaByAreaId(Long areaId);

    /**
     * 查询区域列表
     * 
     * @param newArea 区域
     * @return 区域集合
     */
    public List<NewArea> selectNewAreaList(NewArea newArea);

    /**
     * 新增区域
     * 
     * @param newArea 区域
     * @return 结果
     */
    public int insertNewArea(NewArea newArea);

    /**
     * 修改区域
     * 
     * @param newArea 区域
     * @return 结果
     */
    public int updateNewArea(NewArea newArea);

    /**
     * 批量删除区域
     * 
     * @param areaIds 需要删除的区域主键集合
     * @return 结果
     */
    public int deleteNewAreaByAreaIds(Long[] areaIds);

    /**
     * 删除区域信息
     * 
     * @param areaId 区域主键
     * @return 结果
     */
    public int deleteNewAreaByAreaId(Long areaId);
}
