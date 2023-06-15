package com.ruoyi.web.controller.system;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.core.controller.AppBaseController;
import com.ruoyi.common.core.domain.entity.SysPersonnel;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.service.*;
import org.checkerframework.checker.units.qual.A;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 巡更工单管理Controller
 *
 * @author lile
 * @date 2023-03-31
 */
@RestController
@RequestMapping("/system/patrolOrder")
public class SysPatrolOrderController extends AppBaseController {
    @Autowired
    private ISysPatrolOrderService sysPatrolOrderService;

    @Autowired
    private ISysPersonnelService personnelService;

    @Autowired
    private ISysPatrolPointService patrolPointService;

    @Autowired
    private ISysPatrolService sysPatrolService;

    @Autowired
    private IRegionsByUserIdService regionsByUserIdService;

    /**
     * 查询巡更工单管理列表
     */
    @GetMapping("/list")
    public TableDataInfo list(SysPatrolOrder sysPatrolOrder) {
        List<SysUserRegion> sysUserRegions = regionsByUserIdService.selectRegionsByUser(getUserId());
        startPage();
        ArrayList<SysPatrolOrder> list = new ArrayList<>();
        for (SysUserRegion sysUserRegion: sysUserRegions
        ) {
            sysPatrolOrder.setRegionId(sysUserRegion.getRegionId());
            list.addAll(sysPatrolOrderService.selectSysPatrolOrderList(sysPatrolOrder));
        }
        return getDataTable(list);
    }

    /**
     * 导出巡更工单管理列表
     */
    @Log(title = "巡更工单管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysPatrolOrder sysPatrolOrder) {
        List<SysPatrolOrder> list = sysPatrolOrderService.selectSysPatrolOrderList(sysPatrolOrder);
        ExcelUtil<SysPatrolOrder> util = new ExcelUtil<SysPatrolOrder>(SysPatrolOrder.class);
        util.exportExcel(response, list, "巡更工单管理数据");
    }

    /**
     * 获取巡更工单管理详细信息
     */
    @GetMapping(value = "/{patrolOrderId}")
    public AjaxResult getInfo(@PathVariable("patrolOrderId") Long patrolOrderId) {
        AjaxResult ajax = AjaxResult.success();
        SysPatrolOrder sysPatrolOrder = sysPatrolOrderService.selectSysPatrolOrderByPatrolOrderId(patrolOrderId);
        ajax.put(AjaxResult.DATA_TAG, sysPatrolOrder);
        ajax.put("imgUrls", sysPatrolOrderService.selectImgUrlsByPatrolOrderId(patrolOrderId));
        return ajax;
    }

    /**
     * 生成维修任务
     */
    @GetMapping(value = "/createRepair/{patrolOrderId}")
    public AjaxResult createRepair(@PathVariable("patrolOrderId") Long patrolOrderId) {
        SysPatrolOrder sysPatrolOrder = sysPatrolOrderService.selectSysPatrolOrderByPatrolOrderId(patrolOrderId);
        SysRepair repair = new SysRepair();
        repair.setRepairName(sysPatrolOrder.getPatrolName());
        repair.setRepairDescribe(sysPatrolOrder.getRemark());
        repair.setRepairStatus("0");
        Long[] longArrayForPoints = {sysPatrolOrder.getPatrolPointId()};
        repair.setPatrolPointIds(longArrayForPoints);
        AjaxResult ajax = AjaxResult.success();
        ajax.put("personnels", personnelService.selectPersonnelAll());
        ajax.put("patrolPoints", patrolPointService.selectPatrolPointAll());
        ajax.put(AjaxResult.DATA_TAG, repair);
        ajax.put("patrolPointIds", longArrayForPoints);
        ajax.put("imgUrls", sysPatrolOrder.getImgUrls());
        return ajax;
    }

    /**
     * 新增巡更工单管理
     */
    @Log(title = "巡更工单管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysPatrolOrder sysPatrolOrder) {
        sysPatrolOrder.setRegionId(getUser().getRegionId());

        sysPatrolOrder.setPersonnelId(getAppUserId());
        SysPatrol sysPatrol = sysPatrolService.selectSysPatrolByPatrolId(sysPatrolOrder.getPatrolId());
        if (sysPatrol.getPatrolStatus().equals("3")) {
            return AjaxResult.error("抱歉任务已经过期");
        }

        if (sysPatrol.getPatrolActualStartTime() == null){
            //设置实际开始时间
            sysPatrol.setPatrolActualStartTime(DateUtils.getNowDate());
            sysPatrolService.updateSysPatrolWithStatus(sysPatrol);
        }
        //将任务中状态点位设置为1
        sysPatrolOrderService.changePatrolPatrolPointStatusService(sysPatrolOrder, "1");
        //新增巡更工单
        sysPatrolOrderService.insertSysPatrolOrder(sysPatrolOrder);
        //查询所有任务中状态为0的点位
        List<SysPatrolPoint> sysPatrolPoints = patrolPointService.selectPatrolPointListByPatrolIdWithStatus(sysPatrolOrder.getPatrolId());
        if (sysPatrolPoints.size() > 0) {
            //设置任务为进行中状态
            sysPatrol.setPatrolStatus("1");
            sysPatrolService.updateSysPatrolWithStatus(sysPatrol);
        } else {
            //设置任务为已完成状态
            sysPatrol.setPatrolStatus("2");
            //设置实际结束时间
            sysPatrol.setPatrolActualEndTime(DateUtils.getNowDate());
            sysPatrolService.updateSysPatrolWithStatus(sysPatrol);
        }
        return AjaxResult.success();
    }

    /**
     * 修改巡更工单管理
     */
    @Log(title = "巡更工单管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysPatrolOrder sysPatrolOrder) {
        return toAjax(sysPatrolOrderService.updateSysPatrolOrder(sysPatrolOrder));
    }

    /**
     * 删除巡更工单管理
     */
    @Log(title = "巡更工单管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{patrolOrderIds}")
    public AjaxResult remove(@PathVariable Long[] patrolOrderIds) {
        return toAjax(sysPatrolOrderService.deleteSysPatrolOrderByPatrolOrderIds(patrolOrderIds));
    }
}
