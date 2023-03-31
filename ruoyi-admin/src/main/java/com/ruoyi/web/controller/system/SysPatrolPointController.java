package com.ruoyi.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

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
import com.ruoyi.system.domain.SysPatrolPoint;
import com.ruoyi.system.service.ISysPatrolPointService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 巡更点管理Controller
 *
 * @author lile
 * @date 2023-03-30
 */
@RestController
@RequestMapping("/system/point")
public class SysPatrolPointController extends BaseController {
    @Autowired
    private ISysPatrolPointService sysPatrolPointService;

    /**
     * 查询巡更点管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:point:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysPatrolPoint sysPatrolPoint) {
        startPage();
        List<SysPatrolPoint> list = sysPatrolPointService.selectSysPatrolPointList(sysPatrolPoint);
        return getDataTable(list);
    }

    /**
     * 导出巡更点管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:point:export')")
    @Log(title = "巡更点管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysPatrolPoint sysPatrolPoint) {
        List<SysPatrolPoint> list = sysPatrolPointService.selectSysPatrolPointList(sysPatrolPoint);
        ExcelUtil<SysPatrolPoint> util = new ExcelUtil<SysPatrolPoint>(SysPatrolPoint.class);
        util.exportExcel(response, list, "巡更点管理数据");
    }

    /**
     * 获取巡更点管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:point:query')")
    @GetMapping(value = "/{patrolPointId}")
    public AjaxResult getInfo(@PathVariable("patrolPointId") Long patrolPointId) {
        return success(sysPatrolPointService.selectSysPatrolPointByPatrolPointId(patrolPointId));
    }

    /**
     * 新增巡更点管理
     */
    @PreAuthorize("@ss.hasPermi('system:point:add')")
    @Log(title = "巡更点管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysPatrolPoint sysPatrolPoint) {
        return toAjax(sysPatrolPointService.insertSysPatrolPoint(sysPatrolPoint));
    }

    /**
     * 修改巡更点管理
     */
    @PreAuthorize("@ss.hasPermi('system:point:edit')")
    @Log(title = "巡更点管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysPatrolPoint sysPatrolPoint) {
        return toAjax(sysPatrolPointService.updateSysPatrolPoint(sysPatrolPoint));
    }

    /**
     * 删除巡更点管理
     */
    @PreAuthorize("@ss.hasPermi('system:point:remove')")
    @Log(title = "巡更点管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{patrolPointIds}")
    public AjaxResult remove(@PathVariable Long[] patrolPointIds) {
        return toAjax(sysPatrolPointService.deleteSysPatrolPointByPatrolPointIds(patrolPointIds));
    }
}
