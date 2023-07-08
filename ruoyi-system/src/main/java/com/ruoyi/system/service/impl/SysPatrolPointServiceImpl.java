package com.ruoyi.system.service.impl;

import java.util.List;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.mapper.InspectionItemMapper;
import com.ruoyi.system.mapper.InspectionItemPointMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysPatrolPointMapper;
import com.ruoyi.system.service.ISysPatrolPointService;
import org.springframework.transaction.annotation.Transactional;

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


    @Autowired
    private InspectionItemPointMapper inspectionItemPointMapper;

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
    @Transactional
    public int insertSysPatrolPoint(SysPatrolPoint sysPatrolPoint) {
        sysPatrolPoint.setCreateTime(DateUtils.getNowDate());
        int row = sysPatrolPointMapper.insertSysPatrolPoint(sysPatrolPoint);
        if (StringUtils.isNotEmpty(sysPatrolPoint.getItemId())){
            InspectionItemPoint inspectionItemPoint = new InspectionItemPoint();
            inspectionItemPoint.setItemId(sysPatrolPoint.getItemId());
            inspectionItemPoint.setPatrolPointId(sysPatrolPoint.getPatrolPointId());
            inspectionItemPointMapper.insertInspectionItemPoint(inspectionItemPoint);
        }
        return row;
    }

    /**
     * 修改巡更点管理
     *
     * @param sysPatrolPoint 巡更点管理
     * @return 结果
     */
    @Override
    @Transactional
    public int updateSysPatrolPoint(SysPatrolPoint sysPatrolPoint) {
        sysPatrolPoint.setUpdateTime(DateUtils.getNowDate());
        //删除所有此点位的巡检项目关联
        inspectionItemPointMapper.deleteInspectionItemPointByPatrolPointId(sysPatrolPoint.getPatrolPointId());
        int row = sysPatrolPointMapper.updateSysPatrolPoint(sysPatrolPoint);
        //添加关联
        if (StringUtils.isNotEmpty(sysPatrolPoint.getItemId())){
            InspectionItemPoint inspectionItemPoint = new InspectionItemPoint();
            inspectionItemPoint.setItemId(sysPatrolPoint.getItemId());
            inspectionItemPoint.setPatrolPointId(sysPatrolPoint.getPatrolPointId());
            inspectionItemPointMapper.insertInspectionItemPoint(inspectionItemPoint);
        }
        return row;
    }

    /**
     * 批量删除巡更点管理
     *
     * @param patrolPointIds 需要删除的巡更点管理主键
     * @return 结果
     */
    @Override
    @Transactional
    public int deleteSysPatrolPointByPatrolPointIds(Long[] patrolPointIds) {
        //删除所有此点位的巡检项目关联
        inspectionItemPointMapper.deleteInspectionItemPointByPatrolPointIds(patrolPointIds);
        return sysPatrolPointMapper.deleteSysPatrolPointByPatrolPointIds(patrolPointIds);
    }

    /**
     * 删除巡更点管理信息
     *
     * @param patrolPointId 巡更点管理主键
     * @return 结果
     */
    @Override
    @Transactional
    public int deleteSysPatrolPointByPatrolPointId(Long patrolPointId) {
        inspectionItemPointMapper.deleteInspectionItemPointByPatrolPointId(patrolPointId);
        return sysPatrolPointMapper.deleteSysPatrolPointByPatrolPointId(patrolPointId);
    }

    @Override
    public List<SysPatrolPoint> selectPatrolPointAll() {
        return sysPatrolPointMapper.selectPatrolPointAll();
    }

    @Override
    public List<SysPatrolPoint> selectPatrolPointListByPatrolIdWithName(Long patrolId) {
        return sysPatrolPointMapper.selectPatrolPointListByPatrolIdWithName(patrolId);
    }

    @Override
    public List<SysPatrolPoint> selectPatrolPointListByPatrolIdWithStatus(Long patrolId) {
        return sysPatrolPointMapper.selectPatrolPointListByPatrolIdWithStatus(patrolId);
    }

    @Override
    public List<SysPatrolPoint> selectPatrolPointListByRepairIdWithName(Long repairId) {
        return sysPatrolPointMapper.selectPatrolPointListByRepairIdWithName(repairId);
    }

    @Override
    public List<Long> selectPatrolPointListByPatrolId(Long patrolId) {
        return sysPatrolPointMapper.selectPatrolPointListByPatrolId(patrolId);
    }

    @Override
    public List<Long> selectPatrolPointListByRepairId(Long RepairId) {
        return sysPatrolPointMapper.selectPatrolPointListByRepairId(RepairId);
    }

    @Override
    public List<SysPatrolPoint> selectSysPatrolPointByPatrolPointIds(Long[] patrolPointIds) {
        return sysPatrolPointMapper.selectSysPatrolPointByPatrolPointIds(patrolPointIds);
    }

    @Override
    public List<PersonnelAndPatrolOrder> selectPersonnelAndPatrolOrderByPointId(Long patrolPointId) {
        return sysPatrolPointMapper.selectPersonnelAndPatrolOrderByPointId(patrolPointId);
    }
}
