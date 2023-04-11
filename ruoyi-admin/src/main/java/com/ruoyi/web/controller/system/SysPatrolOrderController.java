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
import com.ruoyi.system.domain.SysPatrolOrder;
import com.ruoyi.system.service.ISysPatrolOrderService;
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
public class SysPatrolOrderController extends BaseController {
    @Autowired
    private ISysPatrolOrderService sysPatrolOrderService;

    /**
     * 查询巡更工单管理列表
     */
    @GetMapping("/list")
    public TableDataInfo list(SysPatrolOrder sysPatrolOrder) {
        startPage();
        List<SysPatrolOrder> list = sysPatrolOrderService.selectSysPatrolOrderList(sysPatrolOrder);
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
        ajax.put("imgUrls",sysPatrolOrderService.selectImgUrlsByPatrolOrderId(patrolOrderId));
        return ajax;
    }

    /**
     * 新增巡更工单管理
     */
    @Log(title = "巡更工单管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysPatrolOrder sysPatrolOrder) {


        //员工可以设置巡更任务状态和维修任务状态
        //需要校验任务点位是否都有工单
        return toAjax(sysPatrolOrderService.insertSysPatrolOrder(sysPatrolOrder));
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
