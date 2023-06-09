package com.ruoyi.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.RuoYiApplication;
import com.ruoyi.common.core.controller.AppBaseController;
import com.ruoyi.common.core.domain.entity.SysPersonnel;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.domain.SysPatrolPoint;
import com.ruoyi.system.domain.SysRepair;
import com.ruoyi.system.service.*;
import org.springframework.boot.test.context.SpringBootTest;
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
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.SysPatrol;
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
    private ISysRepairService sysRepairService;

    @Autowired
    private ISysPersonnelService sysPersonnelService;

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
        List<SysPatrol> list = sysPatrolService.selectSysPatrolList4vue(sysPatrol);
        return getDataTable(list);
    }

    /**
     * 导出巡更任务管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:patrol:export')")
    @Log(title = "巡更任务管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysPatrol sysPatrol)
    {
        List<SysPatrol> list = sysPatrolService.selectSysPatrolList4vue(sysPatrol);
        ExcelUtil<SysPatrol> util = new ExcelUtil<SysPatrol>(SysPatrol.class);
        util.exportExcel(response, list, "巡更任务管理数据");
    }


    /**
     * 根据员工查询巡更任务列表
     */
    @GetMapping("/ListByPersonnel")
    public TableDataInfo withPersonnelList(SysPatrol sysPatrol) {
        sysPatrol.setPersonnelId(getAppUserId());
        sysPatrol.setPatrolStatus("0");
        List<SysPatrol> list = sysPatrolService.selectSysPatrolList(sysPatrol);
        sysPatrol.setPatrolStatus("1");
        List<SysPatrol> sysPatrols = sysPatrolService.selectSysPatrolList(sysPatrol);
        list.addAll(sysPatrols);
        return getDataTable(list);
    }


    /**
     * 获取巡更任务管理详细信息
     */
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
     * 获取任务模板
     */
    @GetMapping("/patrolTemplate/{patrolId}")
    public AjaxResult getTemplateInfo(@PathVariable(value = "patrolId") Long patrolId){
        AjaxResult ajax = AjaxResult.success();
        ajax.put("personnels", personnelService.selectPersonnelAll());
        ajax.put("patrolPoints", patrolPointService.selectPatrolPointAll());
        SysPatrol sysPatrol = sysPatrolService.selectSysPatrolTemplateByPatrolId(patrolId);
        ajax.put(AjaxResult.DATA_TAG, sysPatrol);
        ajax.put("personnelIds", personnelService.selectPersonnelListByPatrolId(patrolId));
        ajax.put("patrolPointIds", patrolPointService.selectPatrolPointListByPatrolId(patrolId));
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
        sysPatrol.setType("0");
        sysPatrol.setPatrolStatus("0");
        return toAjax(sysPatrolService.insertSysPatrol(sysPatrol));
    }
    /**
     * 新增巡更任务模板
     */
    @PostMapping("/template")
    public AjaxResult addTemplate(@RequestBody SysPatrol sysPatrol) {
        sysPatrol.setCreateBy(getUsername());
        sysPatrol.setType("1");
        sysPatrol.setPatrolStatus("0");
        sysPatrolService.insertSysPatrol(sysPatrol);
        return AjaxResult.success(AjaxResult.DATA_TAG,sysPatrol.getPatrolId());
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

    /**
     * 显示所有已巡点和未巡点
     */
    @GetMapping("/getPotinStatusByPatrolId/{patrolId}")
    public AjaxResult getPointStatusByPatrolId(){
        AjaxResult ajaxResult = new AjaxResult();
        List<SysPatrolPoint> list = sysPatrolService.selectPointStatusByPatrolId(296L);
        return ajaxResult.put("pointListStatus",list);
    }

    @GetMapping("/getCount")
    public AjaxResult getCount(){
        AjaxResult ajax = AjaxResult.success();
        ajax.put("todayPatrol",getTodayPatrolCount());
        ajax.put("Personnel",getPersonnelCount());
        ajax.put("unCompletePatrol",getUnCompletePatrolCount());
        ajax.put("completePatrol",getCompletePatrolCount());
        ajax.put("repair",getRepairCount());
        return ajax;
    }
    /**
     * 查询今日巡更数量
     */
    public int getTodayPatrolCount(){
        SysPatrol sysPatrol = new SysPatrol();
        sysPatrol.setPatrolStartTime(DateUtils.parseDate(DateUtils.getDate()));
        List<SysPatrol> sysPatrols = sysPatrolService.selectSysPatrolList(sysPatrol);
        return sysPatrols.size();
    }
    /**
     * 查询今日巡更人员数量
     */
    public int getPersonnelCount(){
        List<SysPersonnel> sysPersonnels = sysPersonnelService.selectSysPersonnelList(new SysPersonnel());
        return sysPersonnels.size();
    }
    /**
     * 查询未完成巡更任务
     */
    public int getUnCompletePatrolCount(){
        SysPatrol sysPatrol = new SysPatrol();
        sysPatrol.setPatrolStatus("0");
        List<SysPatrol> sysPatrols = sysPatrolService.selectSysPatrolList(sysPatrol);
        return sysPatrols.size();
    }
    /**
     * 查询已完成巡更任务
     */
    public int getCompletePatrolCount(){
        SysPatrol sysPatrol = new SysPatrol();
        sysPatrol.setPatrolStatus("1");
        List<SysPatrol> sysPatrols = sysPatrolService.selectSysPatrolList(sysPatrol);
        return sysPatrols.size();
    }
    /**
     * 查询报警维修数量
     */
    public int getRepairCount(){
        List<SysRepair> sysRepairs = sysRepairService.selectSysRepairList(new SysRepair());
        return sysRepairs.size();
    }



}
