package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SysUserRegion;

/**
 * 【请填写功能名称】Mapper接口
 *
 * @author ruoyi
 * @date 2023-06-10
 */
public interface SysUserRegionMapper
{
    /**
     * 查询【请填写功能名称】
     *
     * @param userId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public List<SysUserRegion> selectSysUserRegionByUserId(Long userId);

    /**
     * 查询【请填写功能名称】列表
     *
     * @param sysUserRegion 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<SysUserRegion> selectSysUserRegionList(SysUserRegion sysUserRegion);

    /**
     * 新增【请填写功能名称】
     *
     * @param sysUserRegion 【请填写功能名称】
     * @return 结果
     */
    public int insertSysUserRegion(SysUserRegion sysUserRegion);

    /**
     * 修改【请填写功能名称】
     *
     * @param sysUserRegion 【请填写功能名称】
     * @return 结果
     */
    public int updateSysUserRegion(SysUserRegion sysUserRegion);

    /**
     * 删除【请填写功能名称】
     *
     * @param userId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteSysUserRegionByUserId(Long userId);

    /**
     * 批量删除【请填写功能名称】
     *
     * @param userIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysUserRegionByUserIds(Long[] userIds);

    /**
     * 批量添加区域和用户关联
     */
    public int batchUserRegion(List<SysUserRegion> list);

}
