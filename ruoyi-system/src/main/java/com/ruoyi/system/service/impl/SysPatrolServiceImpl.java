package com.ruoyi.system.service.impl;

import java.beans.Transient;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import com.ruoyi.common.core.domain.entity.SysPersonnel;
import com.ruoyi.common.core.redis.RedisCache;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.mapper.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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

    @Autowired
    private SysPatrolPatrolPointStatusMapper sysPatrolPatrolPointStatusMapper;

    @Autowired
    private InspectionRoutePointRelMapper inspectionRoutePointRelMapper;


    @Autowired
    private RedisCache redisCache;

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

    @Override
    public SysPatrol selectSysPatrolTemplateByPatrolId(Long patrolId) {
        return sysPatrolMapper.selectSysPatrolTemplateByPatrolId(patrolId);
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

    @Override
    public List<SysPatrol> selectSysPatrolList4vue(SysPatrol sysPatrol) {
        return sysPatrolMapper.selectSysPatrolList4vue(sysPatrol);
    }

    @Override
    public int deleteSysPatrolWithEnd() {

//        //查询所有已经结束任务的patrolIds
//        return deleteSysPatrolByPatrolIds(patrolIds);
        return 0;
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

        //根据线路id查询点位
        Long[] longs = inspectionRoutePointRelMapper.selectInspectionRoutePointRelIds(sysPatrol.getInspectionRouteId());
        sysPatrol.setPatrolPointIds(longs);

        //新增巡更任务和点位关联
        insertPatrolPatrolPoint(sysPatrol);

        //设置巡更计划内点位状态
        insertPatrolPatrolPointStatus(sysPatrol);

        //获取过期时间(任务结束时间减去当前时间)
        Date patrolEndTime = sysPatrol.getPatrolEndTime();
        Date nowDate = DateUtils.getNowDate();
        int timeout = timeDistance4Patrol(patrolEndTime, nowDate);
        if (timeout < 0){
            return 0;
        }
        //向redis中添加过期时间
        redisCache.setCacheObject("patrolOverdueTime/"+sysPatrol.getPatrolId(),sysPatrol.getPatrolId(),timeout, TimeUnit.MINUTES);
        return row;
    }

    @Override
    @Transactional
    public int insertSysPatrol(SysPatrol sysPatrol, List<Long> personnelList, List<Long> patrolPointList) {
        sysPatrol.setCreateTime(DateUtils.getNowDate());
        int row = sysPatrolMapper.insertSysPatrol(sysPatrol);

        ArrayList<SysPatrolPersonnel> personnelArrayList = new ArrayList<>(personnelList.size());
        for (Long personnelId : personnelList) {
            SysPatrolPersonnel sysPatrolPersonnel = new SysPatrolPersonnel();
            sysPatrolPersonnel.setPatrolId(sysPatrol.getPatrolId());
            sysPatrolPersonnel.setPersonnelId(personnelId);
            personnelArrayList.add(sysPatrolPersonnel);
        }
        sysPatrolPersonnelMapper.batchPatrolPersonnel(personnelArrayList);

        ArrayList<SysPatrolPatrolPoint> patrolPointArrayList = new ArrayList<>(patrolPointList.size());
        for (Long PatrolPointId : patrolPointList) {
            SysPatrolPatrolPoint sysPatrolPatrolPoint = new SysPatrolPatrolPoint();
            sysPatrolPatrolPoint.setPatrolId(sysPatrol.getPatrolId());
            sysPatrolPatrolPoint.setPatrolPointId(PatrolPointId);
            patrolPointArrayList.add(sysPatrolPatrolPoint);
        }
        sysPatrolPatrolPointMapper.batchPatrolPatrolPoint(patrolPointArrayList);
        //设置巡更计划内点位状态
        ArrayList<SysPatrolPatrolPointStatus> list = new ArrayList<>(patrolPointList.size());
        for (Long PatrolPointId : patrolPointList
        ) {
            SysPatrolPatrolPointStatus sysPatrolPatrolPointStatus = new SysPatrolPatrolPointStatus();
            sysPatrolPatrolPointStatus.setPatrolId(sysPatrol.getPatrolId());
            sysPatrolPatrolPointStatus.setPatrolPointId(PatrolPointId);
            sysPatrolPatrolPointStatus.setPatrolPatrolPointStatus("0");
            list.add(sysPatrolPatrolPointStatus);
        }
        sysPatrolPatrolPointStatusMapper.batchPatrolPatrolPointStatus(list);

        //获取过期时间(任务结束时间减去当前时间)
        Date patrolEndTime = sysPatrol.getPatrolEndTime();
        Date nowDate = DateUtils.getNowDate();
        int timeout = timeDistance4Patrol(patrolEndTime, nowDate);
        if (timeout < 0){
            return 0;
        }
        //向redis中添加过期时间
        redisCache.setCacheObject("patrolOverdueTime/"+sysPatrol.getPatrolId(),sysPatrol.getPatrolId(),timeout, TimeUnit.MINUTES);
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

        //根据线路id查询点位
        Long[] longs = inspectionRoutePointRelMapper.selectInspectionRoutePointRelIds(sysPatrol.getInspectionRouteId());
        sysPatrol.setPatrolPointIds(longs);

        //新增巡更和点位
        insertPatrolPatrolPoint(sysPatrol);

        //删除巡更计划内点位状态
        sysPatrolPatrolPointStatusMapper.deleteSysPatrolPatrolPointStatusByPatrolId(patrolId);
        //设置巡更计划内点位状态
        insertPatrolPatrolPointStatus(sysPatrol);
        sysPatrol.setUpdateTime(DateUtils.getNowDate());
        return sysPatrolMapper.updateSysPatrol(sysPatrol);
    }

    @Override
    public int updateSysPatrolWithStatus(SysPatrol sysPatrol) {
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
        //删除巡更计划内点位状态
        sysPatrolPatrolPointStatusMapper.deleteSysPatrolPatrolPointStatusByPatrolIds(patrolIds);
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
        //删除巡更计划内点位状态
        sysPatrolPatrolPointStatusMapper.deleteSysPatrolPatrolPointStatusByPatrolId(patrolId);
        return sysPatrolMapper.deleteSysPatrolByPatrolId(patrolId);
    }

    /**
     * 查询任务的所有已经巡点和未巡点
     * @param patrolId
     * @return
     */
    @Override
    public List<SysPatrolPatrolPointStatus> selectPointStatusByPatrolId(Long patrolId) {
        return sysPatrolPatrolPointStatusMapper.selectPointStatusByPatrolId(patrolId);
    }

    @Override
    public List<PersonnelWithQuantity> getPersonnelWithQuantity() {
        return sysPatrolMapper.getPersonnelWithQuantity();
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
        if (StringUtils.isNotEmpty(patrolPoints)) {
            //循环添加
            List<SysPatrolPatrolPoint> list = new ArrayList<>(patrolPoints.length);
            for (Long PatrolPointId : patrolPoints
            ) {
                SysPatrolPatrolPoint sysPatrolPatrolPoint = new SysPatrolPatrolPoint();
                sysPatrolPatrolPoint.setPatrolId(sysPatrol.getPatrolId());
                sysPatrolPatrolPoint.setPatrolPointId(PatrolPointId);
                list.add(sysPatrolPatrolPoint);
            }
            sysPatrolPatrolPointMapper.batchPatrolPatrolPoint(list);
        }
    }

    /**
     * 为巡更计划内的点位设置状态
     */
    public void insertPatrolPatrolPointStatus(SysPatrol sysPatrol) {
        Long[] patrolPoints = sysPatrol.getPatrolPointIds();
        if (StringUtils.isNotEmpty(patrolPoints)) {
            //循环添加岛list
            ArrayList<SysPatrolPatrolPointStatus> list = new ArrayList<>(patrolPoints.length);
            for (Long PatrolPointId : patrolPoints
            ) {
                SysPatrolPatrolPointStatus sysPatrolPatrolPointStatus = new SysPatrolPatrolPointStatus();
                sysPatrolPatrolPointStatus.setPatrolId(sysPatrol.getPatrolId());
                sysPatrolPatrolPointStatus.setPatrolPointId(PatrolPointId);
                sysPatrolPatrolPointStatus.setPatrolPatrolPointStatus("0");
                list.add(sysPatrolPatrolPointStatus);
            }
            sysPatrolPatrolPointStatusMapper.batchPatrolPatrolPointStatus(list);
        }
    }


    public int timeDistance4Patrol(Date endDate, Date startTime) {

        long nd = 1000 * 24 * 60 * 60;
        long nh = 1000 * 60 * 60;
        long nm = 1000 * 60;
        // long ns = 1000;
        // 获得两个时间的毫秒时间差异
        long diff = endDate.getTime() - startTime.getTime();
        // 计算差多少天
        long day = diff / nd;
        // 计算差多少小时
        long hour = diff % nd / nh;
        // 计算差多少分钟
        long min = diff % nd % nh / nm;
        // 计算差多少秒//输出结果
        // long sec = diff % nd % nh % nm / ns;

        long timeout = day * 24 * 60 + hour * 60 + min;

        return (int) timeout;
    }

}
