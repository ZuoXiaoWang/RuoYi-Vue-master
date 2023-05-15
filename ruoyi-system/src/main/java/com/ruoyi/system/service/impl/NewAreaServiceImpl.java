package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.NewAreaMapper;
import com.ruoyi.system.domain.NewArea;
import com.ruoyi.system.service.INewAreaService;

/**
 * 区域Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-05-13
 */
@Service
public class NewAreaServiceImpl implements INewAreaService 
{
    @Autowired
    private NewAreaMapper newAreaMapper;

    /**
     * 查询区域
     * 
     * @param areaId 区域主键
     * @return 区域
     */
    @Override
    public NewArea selectNewAreaByAreaId(Long areaId)
    {
        return newAreaMapper.selectNewAreaByAreaId(areaId);
    }

    /**
     * 查询区域列表
     * 
     * @param newArea 区域
     * @return 区域
     */
    @Override
    public List<NewArea> selectNewAreaList(NewArea newArea)
    {
        return newAreaMapper.selectNewAreaList(newArea);
    }

    /**
     * 新增区域
     * 
     * @param newArea 区域
     * @return 结果
     */
    @Override
    public int insertNewArea(NewArea newArea)
    {
        return newAreaMapper.insertNewArea(newArea);
    }

    /**
     * 修改区域
     * 
     * @param newArea 区域
     * @return 结果
     */
    @Override
    public int updateNewArea(NewArea newArea)
    {
        return newAreaMapper.updateNewArea(newArea);
    }

    /**
     * 批量删除区域
     * 
     * @param areaIds 需要删除的区域主键
     * @return 结果
     */
    @Override
    public int deleteNewAreaByAreaIds(Long[] areaIds)
    {
        return newAreaMapper.deleteNewAreaByAreaIds(areaIds);
    }

    /**
     * 删除区域信息
     * 
     * @param areaId 区域主键
     * @return 结果
     */
    @Override
    public int deleteNewAreaByAreaId(Long areaId)
    {
        return newAreaMapper.deleteNewAreaByAreaId(areaId);
    }
}
