package com.ruoyi.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.core.controller.AppBaseController;
import com.ruoyi.common.core.domain.entity.SysPersonnel;
import com.ruoyi.common.utils.StringUtils;
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
import com.ruoyi.system.domain.SysPatrol;
import com.ruoyi.system.service.ISysPatrolService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 巡更任务管理Controller
 *
 * @author lile
 * @date 2023-03-31
 */
@RestController
@RequestMapping("/system/patrol")
public class SysPatrolController extends AppBaseController {
    @Autowired
    private ISysPatrolService sysPatrolService;

    @Autowired
    private ISysPersonnelService personnelService;

    @Autowired
    private ISysPatrolPointService patrolPointService;

    /**
     * 查询巡更任务管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:patrol:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysPatrol sysPatrol) {
        startPage();
        List<SysPatrol> list = sysPatrolService.selectSysPatrolList(sysPatrol);
        return getDataTable(list);
    }


    /**
     * 根据员工查询巡更任务列表
     */
    @GetMapping("/ListByPersonnel")
    public TableDataInfo withPersonnelList(SysPatrol sysPatrol) {
        sysPatrol.setPersonnelId(getAppUserId());
        startPage();
        List<SysPatrol> list = sysPatrolService.selectSysPatrolList(sysPatrol);
        return getDataTable(list);
    }


    /**
     * 获取巡更任务管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:patrol:query')")
    @GetMapping(value = {"/", "/{patrolId}"})
    public AjaxResult getInfo(@PathVariable(value = "patrolId", required = false) Long patrolId) {
        AjaxResult ajax = AjaxResult.success();
        ajax.put("personnels", personnelService.selectPersonnelAll());
        ajax.put("patrolPoints", patrolPointService.selectPatrolPointAll());
        if (StringUtils.isNotNull(patrolId)) {
            SysPatrol sysPatrol = sysPatrolService.selectSysPatrolByPatrolId(patrolId);
            ajax.put(AjaxResult.DATA_TAG, sysPatrol);
            ajax.put("personnelIds", personnelService.selectPersonnelListByPatrolId(patrolId));
            ajax.put("patrolPointIds", patrolPointService.selectPatrolPointListByPatrolId(patrolId));
        }

        return ajax;
    }

    /**
     * 新增巡更任务管理
     */
    @PreAuthorize("@ss.hasPermi('system:patrol:add')")
    @Log(title = "巡更任务管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysPatrol sysPatrol) {
        sysPatrol.setCreateBy(getUsername());
        return toAjax(sysPatrolService.insertSysPatrol(sysPatrol));
    }

    /**
     * 修改巡更任务管理(员工可以修改巡更状态)
     */
    @Log(title = "巡更任务管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysPatrol sysPatrol) {
        return toAjax(sysPatrolService.updateSysPatrol(sysPatrol));
    }

    /**
     * 删除巡更任务管理
     */
    @PreAuthorize("@ss.hasPermi('system:patrol:remove')")
    @Log(title = "巡更任务管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{patrolIds}")
    public AjaxResult remove(@PathVariable Long[] patrolIds) {
        return toAjax(sysPatrolService.deleteSysPatrolByPatrolIds(patrolIds));
    }
}
