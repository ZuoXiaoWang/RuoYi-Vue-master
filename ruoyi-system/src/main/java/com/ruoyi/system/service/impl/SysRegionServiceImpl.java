package com.ruoyi.system.service.impl;

import java.util.ArrayList;
import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.SysUserRegion;
import com.ruoyi.system.mapper.SysUserRegionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysRegionMapper;
import com.ruoyi.system.domain.SysRegion;
import com.ruoyi.system.service.ISysRegionService;

/**
 * 区域管理Service业务层处理
 *
 * @author ruoyi
 * @date 2023-06-10
 */
@Service
public class SysRegionServiceImpl implements ISysRegionService
{
    @Autowired
    private SysRegionMapper sysRegionMapper;

    @Autowired
    private SysUserRegionMapper sysUserRegionMapper;

    /**
     * 查询区域管理
     *
     * @param regionId 区域管理主键
     * @return 区域管理
     */
    @Override
    public SysRegion selectSysRegionByRegionId(Long regionId)
    {
        return sysRegionMapper.selectSysRegionByRegionId(regionId);
    }

    /**
     * 查询区域管理列表
     *
     * @param sysRegion 区域管理
     * @return 区域管理
     */
    @Override
    public List<SysRegion> selectSysRegionList(SysRegion sysRegion)
    {
        return sysRegionMapper.selectSysRegionList(sysRegion);
    }

    /**
     * 新增区域管理
     *
     * @param sysRegion 区域管理
     * @return 结果
     */
    @Override
    public int insertSysRegion(SysRegion sysRegion)
    {
        sysRegion.setCreateTime(DateUtils.getNowDate());
        return sysRegionMapper.insertSysRegion(sysRegion);
    }

    /**
     * 修改区域管理
     *
     * @param sysRegion 区域管理
     * @return 结果
     */
    @Override
    public int updateSysRegion(SysRegion sysRegion)
    {
        sysRegion.setUpdateTime(DateUtils.getNowDate());
        return sysRegionMapper.updateSysRegion(sysRegion);
    }

    /**
     * 批量删除区域管理
     *
     * @param regionIds 需要删除的区域管理主键
     * @return 结果
     */
    @Override
    public int deleteSysRegionByRegionIds(Long[] regionIds)
    {
        return sysRegionMapper.deleteSysRegionByRegionIds(regionIds);
    }

    /**
     * 删除区域管理信息
     *
     * @param regionId 区域管理主键
     * @return 结果
     */
    @Override
    public int deleteSysRegionByRegionId(Long regionId)
    {
        return sysRegionMapper.deleteSysRegionByRegionId(regionId);
    }

    // 添加区域和用户关联一对多
    @Override
    public int insertSysUsersRegion(SysUserRegion sysUsersRegion) {

        sysUserRegionMapper.deleteSysUserRegionByRegionId(sysUsersRegion.getRegionId());

        Long[] userIds = sysUsersRegion.getUserIds();
        if (StringUtils.isNotEmpty(userIds)) {
            //循环添加
            List<SysUserRegion> list = new ArrayList<>(userIds.length);
            for (Long userId : userIds
            ) {
                SysUserRegion sysUserRegion = new SysUserRegion();
                sysUserRegion.setRegionId(sysUsersRegion.getRegionId());
                sysUserRegion.setUserId(userId);
                list.add(sysUserRegion);
            }
            return sysUserRegionMapper.batchUserRegion(list);
        }
        return 0;
    }

    @Override
    public List<SysUserRegion> selectRegionUserByRegionId(Long regionId) {
        return sysUserRegionMapper.selectRegionUserByRegionId(regionId);
    }

}
