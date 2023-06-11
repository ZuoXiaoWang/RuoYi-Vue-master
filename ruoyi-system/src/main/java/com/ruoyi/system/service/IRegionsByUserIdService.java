package com.ruoyi.system.service;

import com.ruoyi.system.domain.SysUserRegion;

import java.util.List;

public interface IRegionsByUserIdService {
    //根据userId查询所有区域
    public List<SysUserRegion> selectRegionsByUser(Long userId);
}
