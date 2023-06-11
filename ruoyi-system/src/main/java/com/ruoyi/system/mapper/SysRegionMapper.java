package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SysRegion;

/**
 * 区域管理Mapper接口
 *
 * @author ruoyi
 * @date 2023-06-10
 */
public interface SysRegionMapper
{
    /**
     * 查询区域管理
     *
     * @param regionId 区域管理主键
     * @return 区域管理
     */
    public SysRegion selectSysRegionByRegionId(Long regionId);

    /**
     * 查询区域管理列表
     *
     * @param sysRegion 区域管理
     * @return 区域管理集合
     */
    public List<SysRegion> selectSysRegionList(SysRegion sysRegion);

    /**
     * 新增区域管理
     *
     * @param sysRegion 区域管理
     * @return 结果
     */
    public int insertSysRegion(SysRegion sysRegion);

    /**
     * 修改区域管理
     *
     * @param sysRegion 区域管理
     * @return 结果
     */
    public int updateSysRegion(SysRegion sysRegion);

    /**
     * 删除区域管理
     *
     * @param regionId 区域管理主键
     * @return 结果
     */
    public int deleteSysRegionByRegionId(Long regionId);

    /**
     * 批量删除区域管理
     *
     * @param regionIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysRegionByRegionIds(Long[] regionIds);
}
