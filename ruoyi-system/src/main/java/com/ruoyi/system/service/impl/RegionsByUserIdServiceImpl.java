package com.ruoyi.system.service.impl;

import com.ruoyi.system.domain.SysUserRegion;
import com.ruoyi.system.mapper.SysUserRegionMapper;
import com.ruoyi.system.service.IRegionsByUserIdService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RegionsByUserIdServiceImpl implements IRegionsByUserIdService {
    @Autowired
    private SysUserRegionMapper sysUserRegionMapper;
    @Override
    public List<SysUserRegion> selectRegionsByUser(Long userId) {
        return sysUserRegionMapper.selectSysUserRegionByUserId(userId);
    }
}
