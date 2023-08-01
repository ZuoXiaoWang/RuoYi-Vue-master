package com.ruoyi.app.controller;

import com.ruoyi.app.vo.RegionVo;
import com.ruoyi.common.core.controller.AppBaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.redis.RedisCache;
import com.ruoyi.common.utils.DictUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.concurrent.TimeUnit;

@RestController
@RequestMapping("/ui")
public class UiController extends AppBaseController {

    @Autowired
    private ISysRegionService regionService;

    @Autowired
    private ISysPatrolService patrolService;

    @Autowired
    private ISysPersonnelService personnelService;

    @Autowired
    private ISysPatrolPointService patrolPointService;

    @Autowired
    private INewRepairFromService newRepairFromService;

    @Autowired
    private INewRepairService newRepairService;

    @Autowired
    private RedisCache redisCache;

    @PostMapping("/regionId")
    public AjaxResult regionId(@RequestBody RegionVo regionVo) {
        if (redisCache.getCacheObject("regionId") == null) {
            redisCache.setCacheObject("regionId", regionVo.getRegionId(), 1, TimeUnit.DAYS);
        }
        return AjaxResult.success();
    }


    //ui获取区域列表
    @GetMapping("/regionList")
    public AjaxResult getRegionList() {
        AjaxResult ajax = AjaxResult.success();
        List<SysRegion> sysRegions = regionService.selectSysRegionList(new SysRegion());
        ajax.put("sysRegions", sysRegions);
        return ajax;
    }

    //ui获取巡更任务列表
    @GetMapping("/patrolList")
    public AjaxResult getPatrolList() {
        Long regionId = redisCache.getCacheObject("regionId");
        AjaxResult ajax = AjaxResult.success();
        if (regionId == null) {
            return ajax.put("sysPatrols", null);
        }
        SysPatrol sysPatrol = new SysPatrol();
        sysPatrol.setRegionId(regionId);
        List<SysPatrol> sysPatrols = patrolService.selectSysPatrolList4vue(sysPatrol);
        ajax.put("sysPatrols", sysPatrols);
        return ajax;
    }

    //ui获取巡更任务详情
    @PostMapping("/patrol")//patrol/{patrolId}
    public AjaxResult getPatrol(@RequestBody RegionVo regionVo) {
        AjaxResult ajax = AjaxResult.success();
        ajax.put("personnels", personnelService.selectPersonnelAll());
        ajax.put("patrolPoints", patrolPointService.selectPatrolPointAll());
        if (StringUtils.isNotNull(regionVo.getPatrolId())) {
            SysPatrol sysPatrol = patrolService.selectSysPatrolByPatrolId(regionVo.getPatrolId());
            ajax.put(AjaxResult.DATA_TAG, sysPatrol);
            ajax.put("personnelIds", personnelService.selectPersonnelListByPatrolId(regionVo.getPatrolId()));
            ajax.put("patrolPointIds", patrolPointService.selectPatrolPointListByPatrolId(regionVo.getPatrolId()));
        }
        return ajax;
    }

    //ui获取报修数量
    @GetMapping("/countRepairFrom")
    public AjaxResult getCountRepairFrom() {
        Long regionId = redisCache.getCacheObject("regionId");
        AjaxResult ajax = AjaxResult.success();
        if (regionId == null) {
            return ajax.put("countRepairFrom", null);
        }
        NewRepairFrom newRepairFrom = new NewRepairFrom();
        newRepairFrom.setRegionId(regionId);
        List<NewRepairFrom> list = newRepairFromService.selectNewRepairFromList(newRepairFrom);
        ajax.put("countRepairFrom", list.size());
        return ajax;
    }

    //ui获取维修完成数量

    @GetMapping("/countCompleteRepair")
    public AjaxResult getCountCompleteRepair() {
        Long regionId = redisCache.getCacheObject("regionId");
        AjaxResult ajax = AjaxResult.success();
        if (regionId == null) {
            return ajax.put("countCompleteRepair", null);
        }
        NewRepair newRepair = new NewRepair();
        newRepair.setRegionId(regionId);
        String dictValue = DictUtils.getDictValue("sys_patrol_status", "已完成");
        newRepair.setState(dictValue);
        List<NewRepair> newRepairs = newRepairService.selectNewRepairList(newRepair);
        ajax.put("countCompleteRepair", newRepairs.size());
        return ajax;
    }

    //ui获取报修列表

    @GetMapping("/repairList")
    public AjaxResult getRepairList() {
        Long regionId = redisCache.getCacheObject("regionId");
        AjaxResult ajax = AjaxResult.success();
        if (regionId == null) {
            return ajax.put("repairList", null);
        }
        NewRepairFrom newRepairFrom = new NewRepairFrom();
//        String dictValue = DictUtils.getDictValue("sys_patrol_status", "已完成");
//        newRepair.setState(dictValue);
        newRepairFrom.setRegionId(regionId);
        List<NewRepairFrom> list = newRepairFromService.selectNewRepairFromList(newRepairFrom);
        ajax.put("repairList", list);
        return ajax;
    }

    //ui获取前一周每一天的报修和维修数量

    @GetMapping("/countLastWeekRepairAndFrom")
    public AjaxResult getCountLastWeekRepairAndFrom() {
        Long regionId = redisCache.getCacheObject("regionId");
        AjaxResult ajax = AjaxResult.success();
        if (regionId == null) {
            return ajax.put("repairFrom[0]", null);
        }
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.HOUR_OF_DAY, 0);  // 清除时
        calendar.set(Calendar.MINUTE, 0);       // 清除分
        calendar.set(Calendar.SECOND, 0);       // 清除秒
        calendar.set(Calendar.MILLISECOND, 0);
        NewRepair newRepair = new NewRepair();
        newRepair.setRegionId(regionId);
        NewRepairFrom newRepairFrom = new NewRepairFrom();
        Map<String, Object> stringObjectMap = new HashMap<>();
        newRepairFrom.setRegionId(regionId);
        SysPatrol sysPatrol = new SysPatrol();
        // 区域id
        sysPatrol.setRegionId(regionId);
        // 巡更任务状态已完成数量
        sysPatrol.setPatrolStatus("2");
        for (int i = 1; i <= 7; i++) {
            calendar.add(Calendar.DATE, -i);
            Date date = calendar.getTime();
            newRepair.setCreateTime(date);
            newRepairFrom.setCreateTime(date);
            sysPatrol.setCreateTime(date);
            // 维修单数量
            List<NewRepair> newRepairs = newRepairService.selectNewRepairList(newRepair);
            // 报修单数量
            List<NewRepairFrom> newRepairFroms = newRepairFromService.selectNewRepairFromList(newRepairFrom);
           // 巡更任务完成量
            List<SysPatrol> selectSysPatrolList = patrolService.selectSysPatrolList(sysPatrol);
            ajax.put("repair" + i, newRepairs.size());
            ajax.put("repairFrom" + i, newRepairFroms.size());
            ajax.put("PatrolNum" + i, selectSysPatrolList.size());
            calendar.setTime(new Date());
            calendar.set(Calendar.HOUR_OF_DAY, 0);  // 清除时
            calendar.set(Calendar.MINUTE, 0);       // 清除分
            calendar.set(Calendar.SECOND, 0);       // 清除秒
            calendar.set(Calendar.MILLISECOND, 0);
        }
        return ajax;
    }


    //巡更计划完成排行(前十)
    @GetMapping("/getPersonnelWithQuantity")
    public AjaxResult getPersonnelWithQuantity() {
        AjaxResult ajax = AjaxResult.success();
        List<PersonnelWithQuantity> personnelWithQuantity = patrolService.getPersonnelWithQuantity();
        ajax.put(AjaxResult.DATA_TAG, personnelWithQuantity);
        return ajax;
    }

    //巡更点列表

    @GetMapping("/getPointsList")
    public AjaxResult getPointsList() {
        Long regionId = redisCache.getCacheObject("regionId");
        AjaxResult ajax = AjaxResult.success();
        if (regionId == null) {
            return ajax.put(AjaxResult.DATA_TAG, null);
        }
        SysPatrolPoint sysPatrolPoint = new SysPatrolPoint();
        sysPatrolPoint.setRegionId(regionId);
        List<SysPatrolPoint> sysPatrolPoints = patrolPointService.selectSysPatrolPointList(sysPatrolPoint);
        ajax.put(AjaxResult.DATA_TAG, sysPatrolPoints);
        return ajax;
    }


    //每天巡更任务完成量

    @GetMapping("/getEverydayComplete")
    public AjaxResult getEverydayComplete() {
        Long regionId = redisCache.getCacheObject("regionId");
        AjaxResult ajax = AjaxResult.success();
        if (regionId == null) {
            return ajax.put("date0", null);
        }
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.HOUR_OF_DAY, 0);  // 清除时
        calendar.set(Calendar.MINUTE, 0);       // 清除分
        calendar.set(Calendar.SECOND, 0);       // 清除秒
        calendar.set(Calendar.MILLISECOND, 0);


        SysPatrol sysPatrol = new SysPatrol();
        sysPatrol.setPatrolStatus("2");
        sysPatrol.setRegionId(regionId);
        for (int i = 1; i <= 7; i++) {
            calendar.add(Calendar.DATE, -i);
            Date date = calendar.getTime();
            sysPatrol.setUpdateTime(date);
            List<SysPatrol> sysPatrols = patrolService.selectSysPatrolList4vue(sysPatrol);
            ajax.put("date" + i, sysPatrols.size());
            calendar.setTime(new Date());
            calendar.set(Calendar.HOUR_OF_DAY, 0);  // 清除时
            calendar.set(Calendar.MINUTE, 0);       // 清除分
            calendar.set(Calendar.SECOND, 0);       // 清除秒
            calendar.set(Calendar.MILLISECOND, 0);
        }
        return ajax;
    }


    /**
     * 显示所有已巡点和未巡点
     */
    @PostMapping("/getPotinStatusByPatrolId")///getPotinStatusByPatrolId/{patrolId}
    public AjaxResult getPointStatusByPatrolId(@RequestBody RegionVo regionVo) {
        AjaxResult ajaxResult = new AjaxResult();
        List<SysPatrolPatrolPointStatus> list = patrolService.selectPointStatusByPatrolId(regionVo.getPatrolId());
        return ajaxResult.put("pointListStatus", list);
    }

}
