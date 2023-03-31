package com.ruoyi.system.service.impl;

import java.beans.Transient;
import java.util.ArrayList;
import java.util.List;

import com.ruoyi.common.core.domain.entity.SysPersonnel;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.SysPatrolPatrolPoint;
import com.ruoyi.system.domain.SysPatrolPersonnel;
import com.ruoyi.system.domain.SysPersonnelPost;
import com.ruoyi.system.mapper.SysPatrolPatrolPointMapper;
import com.ruoyi.system.mapper.SysPatrolPersonnelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysPatrolMapper;
import com.ruoyi.system.domain.SysPatrol;
import com.ruoyi.system.service.ISysPatrolService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 巡更任务管理Service业务层处理
 *
 * @author lile
 * @date 2023-03-31
 */
@Service
public class SysPatrolServiceImpl implements ISysPatrolService {
    @Autowired
    private SysPatrolMapper sysPatrolMapper;

    @Autowired
    private SysPatrolPersonnelMapper sysPatrolPersonnelMapper;

    @Autowired
    private SysPatrolPatrolPointMapper sysPatrolPatrolPointMapper;

    /**
     * 查询巡更任务管理
     *
     * @param patrolId 巡更任务管理主键
     * @return 巡更任务管理
     */
    @Override
    public SysPatrol selectSysPatrolByPatrolId(Long patrolId) {
        return sysPatrolMapper.selectSysPatrolByPatrolId(patrolId);
    }

    /**
     * 查询巡更任务管理列表
     *
     * @param sysPatrol 巡更任务管理
     * @return 巡更任务管理
     */
    @Override
    public List<SysPatrol> selectSysPatrolList(SysPatrol sysPatrol) {
        return sysPatrolMapper.selectSysPatrolList(sysPatrol);
    }

    /**
     * 新增巡更任务管理
     *
     * @param sysPatrol 巡更任务管理
     * @return 结果
     */
    @Override
    @Transactional
    public int insertSysPatrol(SysPatrol sysPatrol) {
        sysPatrol.setCreateTime(DateUtils.getNowDate());
        int row = sysPatrolMapper.insertSysPatrol(sysPatrol);
        //新增巡更任务和员工关联
        insertPatrolPersonnel(sysPatrol);
        //新增巡更任务和点位关联
        insertPatrolPatrolPoint(sysPatrol);
        return row;
    }

    /**
     * 修改巡更任务管理
     *
     * @param sysPatrol 巡更任务管理
     * @return 结果
     */
    @Override
    @Transactional
    public int updateSysPatrol(SysPatrol sysPatrol) {
        Long patrolId = sysPatrol.getPatrolId();
        //删除巡更和员工
        sysPatrolPersonnelMapper.deleteSysPatrolPersonnelByPatrolId(patrolId);
        //新增巡更和员工
        insertPatrolPersonnel(sysPatrol);
        //删除巡更和点位
        sysPatrolPatrolPointMapper.deleteSysPatrolPatrolPointByPatrolId(patrolId);
        //新增巡更和点位
        insertPatrolPatrolPoint(sysPatrol);
        sysPatrol.setUpdateTime(DateUtils.getNowDate());
        return sysPatrolMapper.updateSysPatrol(sysPatrol);
    }

    /**
     * 批量删除巡更任务管理
     *
     * @param patrolIds 需要删除的巡更任务管理主键
     * @return 结果
     */
    @Override
    @Transactional
    public int deleteSysPatrolByPatrolIds(Long[] patrolIds) {
        //批量删除巡更和员工
        sysPatrolPersonnelMapper.deleteSysPatrolPersonnelByPatrolIds(patrolIds);
        //批量删除巡更和点位
        sysPatrolPatrolPointMapper.deleteSysPatrolPatrolPointByPatrolIds(patrolIds);
        return sysPatrolMapper.deleteSysPatrolByPatrolIds(patrolIds);
    }

    /**
     * 删除巡更任务管理信息
     *
     * @param patrolId 巡更任务管理主键
     * @return 结果
     */
    @Override
    @Transactional
    public int deleteSysPatrolByPatrolId(Long patrolId) {
        //删除巡更和员工
        sysPatrolPersonnelMapper.deleteSysPatrolPersonnelByPatrolId(patrolId);
        //删除巡更和点位
        sysPatrolPatrolPointMapper.deleteSysPatrolPatrolPointByPatrolId(patrolId);
        return sysPatrolMapper.deleteSysPatrolByPatrolId(patrolId);
    }


    /**
     * 新增巡更任务员工关联
     *
     * @param sysPatrol 巡更对象
     */

    public void insertPatrolPersonnel(SysPatrol sysPatrol) {
        Long[] personnels = sysPatrol.getPersonnelIds();
        if (StringUtils.isNotEmpty(personnels)) {
            // 新增巡更任务员工关联
            List<SysPatrolPersonnel> list = new ArrayList<SysPatrolPersonnel>(personnels.length);
            for (Long personnelId : personnels) {
                SysPatrolPersonnel sysPatrolPersonnel = new SysPatrolPersonnel();
                sysPatrolPersonnel.setPatrolId(sysPatrol.getPatrolId());
                sysPatrolPersonnel.setPersonnelId(personnelId);
                list.add(sysPatrolPersonnel);
            }
            sysPatrolPersonnelMapper.batchPatrolPersonnel(list);
        }
    }


    /**
     * 新增巡更任务点位关联
     */
    public void insertPatrolPatrolPoint(SysPatrol sysPatrol) {
        Long[] patrolPoints = sysPatrol.getPatrolPointIds();
        if (StringUtils.isNotEmpty(patrolPoints)){
            //循环添加
            List<SysPatrolPatrolPoint> list = new ArrayList<>(patrolPoints.length);
            for (Long PatrolPointId: patrolPoints
                 ) {
                SysPatrolPatrolPoint sysPatrolPatrolPoint = new SysPatrolPatrolPoint();
                sysPatrolPatrolPoint.setPatrolId(sysPatrol.getPatrolId());
                sysPatrolPatrolPoint.setPatrolPointId(PatrolPointId);
                list.add(sysPatrolPatrolPoint);
            }
            sysPatrolPatrolPointMapper.batchPatrolPatrolPoint(list);
        }
    }
}
