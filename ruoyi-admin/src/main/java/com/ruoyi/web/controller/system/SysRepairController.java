package com.ruoyi.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.core.controller.AppBaseController;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.SysPatrol;
import com.ruoyi.system.service.ISysPatrolPointService;
import com.ruoyi.system.service.ISysPersonnelService;
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
import com.ruoyi.system.domain.SysRepair;
import com.ruoyi.system.service.ISysRepairService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 维修任务Controller
 *
 * @author lile
 * @date 2023-03-31
 */
@RestController
@RequestMapping("/system/repair")
public class SysRepairController extends AppBaseController {
    @Autowired
    private ISysRepairService sysRepairService;

    @Autowired
    private ISysPersonnelService personnelService;

    @Autowired
    private ISysPatrolPointService patrolPointService;


    /**
     * 查询维修任务列表
     */
    @PreAuthorize("@ss.hasPermi('system:repair:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysRepair sysRepair) {
        startPage();
        List<SysRepair> list = sysRepairService.selectSysRepairList(sysRepair);
        return getDataTable(list);
    }

    /**
     * 根据员工查询维修任务列表
     */
    @GetMapping("/ListByPersonnel")
    public TableDataInfo withPersonnelList(SysRepair sysRepair) {
        sysRepair.setPersonnelId(getAppUserId());
        startPage();
        List<SysRepair> list = sysRepairService.selectSysRepairList(sysRepair);
        return getDataTable(list);
    }

    /**
     * 导出维修任务列表
     */
    @PreAuthorize("@ss.hasPermi('system:repair:export')")
    @Log(title = "维修任务", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysRepair sysRepair) {
        List<SysRepair> list = sysRepairService.selectSysRepairList(sysRepair);
        ExcelUtil<SysRepair> util = new ExcelUtil<SysRepair>(SysRepair.class);
        util.exportExcel(response, list, "维修任务数据");
    }

    /**
     * 获取维修任务详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:repair:query')")
    @GetMapping(value = {"/", "/{repairId}"})
    public AjaxResult getInfo(@PathVariable(value = "repairId", required = false) Long repairId) {
        AjaxResult ajax = AjaxResult.success();
        ajax.put("personnels", personnelService.selectPersonnelAll());
        ajax.put("patrolPoints", patrolPointService.selectPatrolPointAll());
        if (StringUtils.isNotNull(repairId)) {
            SysRepair sysRepair = sysRepairService.selectSysRepairByRepairId(repairId);
            ajax.put(AjaxResult.DATA_TAG, sysRepair);
            ajax.put("personnelIds", personnelService.selectPersonnelListByRepairId(repairId));
            ajax.put("patrolPointIds", patrolPointService.selectPatrolPointListByRepairId(repairId));
        }

        return ajax;
    }

    /**
     * 新增维修任务
     */
    @PreAuthorize("@ss.hasPermi('system:repair:add')")
    @Log(title = "维修任务", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysRepair sysRepair) {
        sysRepair.setCreateBy(getUsername());
        return toAjax(sysRepairService.insertSysRepair(sysRepair));
    }

    /**
     * 修改维修任务
     */
    @PreAuthorize("@ss.hasPermi('system:repair:edit')")
    @Log(title = "维修任务", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysRepair sysRepair) {
        return toAjax(sysRepairService.updateSysRepair(sysRepair));
    }

    /**
     * 修改维修任务已完成(小程序用)
     */
    @Log(title = "维修任务", businessType = BusinessType.UPDATE)
    @PostMapping("/changeStatus")
    public AjaxResult changeStatus(@RequestBody SysRepair sysRepair) {
        if (StringUtils.isNotEmpty(sysRepair.getRepairStatus())){
            return toAjax(sysRepairService.updateSysRepair(sysRepair));
        }return toAjax(0);
    }

    /**
     * 删除维修任务
     */
    @PreAuthorize("@ss.hasPermi('system:repair:remove')")
    @Log(title = "维修任务", businessType = BusinessType.DELETE)
    @DeleteMapping("/{repairIds}")
    public AjaxResult remove(@PathVariable Long[] repairIds) {
        return toAjax(sysRepairService.deleteSysRepairByRepairIds(repairIds));
    }
}
