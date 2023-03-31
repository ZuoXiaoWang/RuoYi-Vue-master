package com.ruoyi.system.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.mapper.SysRepairPatrolPointMapper;
import com.ruoyi.system.mapper.SysRepairPersonnelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysRepairMapper;
import com.ruoyi.system.service.ISysRepairService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 维修任务Service业务层处理
 *
 * @author lile
 * @date 2023-03-31
 */
@Service
public class SysRepairServiceImpl implements ISysRepairService {
    @Autowired
    private SysRepairMapper sysRepairMapper;

    @Autowired
    private SysRepairPersonnelMapper repairPersonnelMapper;

    @Autowired
    private SysRepairPatrolPointMapper repairPatrolPointMapper;

    /**
     * 查询维修任务
     *
     * @param repairId 维修任务主键
     * @return 维修任务
     */
    @Override
    public SysRepair selectSysRepairByRepairId(Long repairId) {
        return sysRepairMapper.selectSysRepairByRepairId(repairId);
    }

    /**
     * 查询维修任务列表
     *
     * @param sysRepair 维修任务
     * @return 维修任务
     */
    @Override
    public List<SysRepair> selectSysRepairList(SysRepair sysRepair) {
        return sysRepairMapper.selectSysRepairList(sysRepair);
    }

    /**
     * 新增维修任务
     *
     * @param sysRepair 维修任务
     * @return 结果
     */
    @Override
    @Transactional
    public int insertSysRepair(SysRepair sysRepair) {
        sysRepair.setCreateTime(DateUtils.getNowDate());
        int row = sysRepairMapper.insertSysRepair(sysRepair);
        //新增维修与员工
        insertRepairPersonnel(sysRepair);
        //新增维修与点位
        insertRepairPatrolPoint(sysRepair);
        return row;
    }

    /**
     * 修改维修任务
     *
     * @param sysRepair 维修任务
     * @return 结果
     */
    @Override
    @Transactional
    public int updateSysRepair(SysRepair sysRepair) {
        Long repairId = sysRepair.getRepairId();
        //删除维修与员工
        repairPersonnelMapper.deleteSysRepairPersonnelByRepairId(repairId);
        //新增维修与员工
        insertRepairPersonnel(sysRepair);
        //删除维修与点位
        repairPatrolPointMapper.deleteSysRepairPatrolPointByRepairId(repairId);
        //新增维修与点位
        insertRepairPatrolPoint(sysRepair);
        sysRepair.setUpdateTime(DateUtils.getNowDate());
        return sysRepairMapper.updateSysRepair(sysRepair);
    }

    /**
     * 批量删除维修任务
     *
     * @param repairIds 需要删除的维修任务主键
     * @return 结果
     */
    @Override
    @Transactional
    public int deleteSysRepairByRepairIds(Long[] repairIds) {
        repairPersonnelMapper.deleteSysRepairPersonnelByRepairIds(repairIds);
        repairPatrolPointMapper.deleteSysRepairPatrolPointByRepairIds(repairIds);
        return sysRepairMapper.deleteSysRepairByRepairIds(repairIds);
    }

    /**
     * 删除维修任务信息
     *
     * @param repairId 维修任务主键
     * @return 结果
     */
    @Override
    @Transactional
    public int deleteSysRepairByRepairId(Long repairId) {
        repairPersonnelMapper.deleteSysRepairPersonnelByRepairId(repairId);
        repairPatrolPointMapper.selectSysRepairPatrolPointByRepairId(repairId);
        return sysRepairMapper.deleteSysRepairByRepairId(repairId);
    }


    public void insertRepairPersonnel(SysRepair sysRepair) {
        Long[] personnels = sysRepair.getPersonnelIds();
        if (StringUtils.isNotEmpty(personnels)) {
            List<SysRepairPersonnel> list = new ArrayList<SysRepairPersonnel>(personnels.length);
            for (Long personnelId : personnels) {
                SysRepairPersonnel sysRepairPersonnel = new SysRepairPersonnel();
                sysRepairPersonnel.setRepairId(sysRepair.getRepairId());
                sysRepairPersonnel.setPersonnelId(personnelId);
                list.add(sysRepairPersonnel);
            }
            repairPersonnelMapper.batchRepairPersonnel(list);
        }
    }


    /**
     * 新增巡更任务点位关联
     */
    public void insertRepairPatrolPoint(SysRepair sysRepair) {
        Long[] patrolPoints = sysRepair.getPatrolPointIds();
        if (StringUtils.isNotEmpty(patrolPoints)){
            List<SysRepairPatrolPoint> list = new ArrayList<>(patrolPoints.length);
            for (Long patrolPointId: patrolPoints
            ) {
                SysRepairPatrolPoint sysRepairPatrolPoint = new SysRepairPatrolPoint();
                sysRepairPatrolPoint.setRepairId(sysRepair.getRepairId());
                sysRepairPatrolPoint.setPatrolPointId(patrolPointId);
                list.add(sysRepairPatrolPoint);
            }
            repairPatrolPointMapper.batchRepairPatrolPoint(list);
        }
    }
}
