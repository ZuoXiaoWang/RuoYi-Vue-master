package com.ruoyi.system.service.impl;

import java.util.List;

import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysPatrolPointMapper;
import com.ruoyi.system.domain.SysPatrolPoint;
import com.ruoyi.system.service.ISysPatrolPointService;

/**
 * 巡更点管理Service业务层处理
 *
 * @author lile
 * @date 2023-03-28
 */
@Service
public class SysPatrolPointServiceImpl implements ISysPatrolPointService {
    @Autowired
    private SysPatrolPointMapper sysPatrolPointMapper;

    /**
     * 查询巡更点管理
     *
     * @param patrolPointId 巡更点管理主键
     * @return 巡更点管理
     */
    @Override
    public SysPatrolPoint selectSysPatrolPointByPatrolPointId(Long patrolPointId) {
        return sysPatrolPointMapper.selectSysPatrolPointByPatrolPointId(patrolPointId);
    }

    /**
     * 查询巡更点管理列表
     *
     * @param sysPatrolPoint 巡更点管理
     * @return 巡更点管理
     */
    @Override
    public List<SysPatrolPoint> selectSysPatrolPointList(SysPatrolPoint sysPatrolPoint) {
        return sysPatrolPointMapper.selectSysPatrolPointList(sysPatrolPoint);
    }

    /**
     * 新增巡更点管理
     *
     * @param sysPatrolPoint 巡更点管理
     * @return 结果
     */
    @Override
    public int insertSysPatrolPoint(SysPatrolPoint sysPatrolPoint) {
        sysPatrolPoint.setCreateTime(DateUtils.getNowDate());
        return sysPatrolPointMapper.insertSysPatrolPoint(sysPatrolPoint);
    }

    /**
     * 修改巡更点管理
     *
     * @param sysPatrolPoint 巡更点管理
     * @return 结果
     */
    @Override
    public int updateSysPatrolPoint(SysPatrolPoint sysPatrolPoint) {
        sysPatrolPoint.setUpdateTime(DateUtils.getNowDate());
        return sysPatrolPointMapper.updateSysPatrolPoint(sysPatrolPoint);
    }

    /**
     * 批量删除巡更点管理
     *
     * @param patrolPointIds 需要删除的巡更点管理主键
     * @return 结果
     */
    @Override
    public int deleteSysPatrolPointByPatrolPointIds(Long[] patrolPointIds) {
        return sysPatrolPointMapper.deleteSysPatrolPointByPatrolPointIds(patrolPointIds);
    }

    /**
     * 删除巡更点管理信息
     *
     * @param patrolPointId 巡更点管理主键
     * @return 结果
     */
    @Override
    public int deleteSysPatrolPointByPatrolPointId(Long patrolPointId) {
        return sysPatrolPointMapper.deleteSysPatrolPointByPatrolPointId(patrolPointId);
    }

    @Override
    public List<SysPatrolPoint> selectPatrolPointAll() {
        return sysPatrolPointMapper.selectPatrolPointAll();
    }

    @Override
    public List<Long> selectPatrolPointListByPatrolId(Long patrolId) {
        return sysPatrolPointMapper.selectPatrolPointListByPatrolId(patrolId);
    }
}
