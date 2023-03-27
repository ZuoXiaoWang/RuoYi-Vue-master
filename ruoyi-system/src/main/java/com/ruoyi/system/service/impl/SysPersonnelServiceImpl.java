package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysPersonnelMapper;
import com.ruoyi.system.domain.SysPersonnel;
import com.ruoyi.system.service.ISysPersonnelService;

/**
 * 员工管理Service业务层处理
 * 
 * @author lile
 * @date 2023-03-27
 */
@Service
public class SysPersonnelServiceImpl implements ISysPersonnelService 
{
    @Autowired
    private SysPersonnelMapper sysPersonnelMapper;

    /**
     * 查询员工管理
     * 
     * @param personnelId 员工管理主键
     * @return 员工管理
     */
    @Override
    public SysPersonnel selectSysPersonnelByPersonnelId(Long personnelId)
    {
        return sysPersonnelMapper.selectSysPersonnelByPersonnelId(personnelId);
    }

    /**
     * 查询员工管理列表
     * 
     * @param sysPersonnel 员工管理
     * @return 员工管理
     */
    @Override
    public List<SysPersonnel> selectSysPersonnelList(SysPersonnel sysPersonnel)
    {
        return sysPersonnelMapper.selectSysPersonnelList(sysPersonnel);
    }

    /**
     * 新增员工管理
     * 
     * @param sysPersonnel 员工管理
     * @return 结果
     */
    @Override
    public int insertSysPersonnel(SysPersonnel sysPersonnel)
    {
        sysPersonnel.setCreateTime(DateUtils.getNowDate());
        return sysPersonnelMapper.insertSysPersonnel(sysPersonnel);
    }

    /**
     * 修改员工管理
     * 
     * @param sysPersonnel 员工管理
     * @return 结果
     */
    @Override
    public int updateSysPersonnel(SysPersonnel sysPersonnel)
    {
        sysPersonnel.setUpdateTime(DateUtils.getNowDate());
        return sysPersonnelMapper.updateSysPersonnel(sysPersonnel);
    }

    /**
     * 批量删除员工管理
     * 
     * @param personnelIds 需要删除的员工管理主键
     * @return 结果
     */
    @Override
    public int deleteSysPersonnelByPersonnelIds(Long[] personnelIds)
    {
        return sysPersonnelMapper.deleteSysPersonnelByPersonnelIds(personnelIds);
    }

    /**
     * 删除员工管理信息
     * 
     * @param personnelId 员工管理主键
     * @return 结果
     */
    @Override
    public int deleteSysPersonnelByPersonnelId(Long personnelId)
    {
        return sysPersonnelMapper.deleteSysPersonnelByPersonnelId(personnelId);
    }
}
