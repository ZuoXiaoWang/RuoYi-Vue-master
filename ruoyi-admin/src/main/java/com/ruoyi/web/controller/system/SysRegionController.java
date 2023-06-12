package com.ruoyi.system.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.system.domain.SysUserRegion;
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
import com.ruoyi.system.domain.SysRegion;
import com.ruoyi.system.service.ISysRegionService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 区域管理Controller
 *
 * @author ruoyi
 * @date 2023-06-10
 */
@RestController
@RequestMapping("/system/region")
public class SysRegionController extends BaseController
{
    @Autowired
    private ISysRegionService sysRegionService;

    /**
     * 查询区域管理列表
     */
    @GetMapping("/list")
    public TableDataInfo list(SysRegion sysRegion)
    {
        startPage();
        List<SysRegion> list = sysRegionService.selectSysRegionList(sysRegion);
        return getDataTable(list);
    }

    /**
     * 导出区域管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:region:export')")
    @Log(title = "区域管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysRegion sysRegion)
    {
        List<SysRegion> list = sysRegionService.selectSysRegionList(sysRegion);
        ExcelUtil<SysRegion> util = new ExcelUtil<SysRegion>(SysRegion.class);
        util.exportExcel(response, list, "区域管理数据");
    }

    /**
     * 获取区域管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:region:query')")
    @GetMapping(value = "/{regionId}")
    public AjaxResult getInfo(@PathVariable("regionId") Long regionId)
    {
        return success(sysRegionService.selectSysRegionByRegionId(regionId));
    }

    /**
     * 新增区域管理
     */
    @PreAuthorize("@ss.hasPermi('system:region:add')")
    @Log(title = "区域管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysRegion sysRegion)
    {
        return toAjax(sysRegionService.insertSysRegion(sysRegion));
    }

    /**
     * 修改区域管理
     */
    @PreAuthorize("@ss.hasPermi('system:region:edit')")
    @Log(title = "区域管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysRegion sysRegion)
    {
        return toAjax(sysRegionService.updateSysRegion(sysRegion));
    }

    /**
     * 删除区域管理
     */
    @PreAuthorize("@ss.hasPermi('system:region:remove')")
    @Log(title = "区域管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{regionIds}")
    public AjaxResult remove(@PathVariable Long[] regionIds)
    {
        return toAjax(sysRegionService.deleteSysRegionByRegionIds(regionIds));
    }

    // 添加用户列表绑定到区域
    @PreAuthorize("@ss.hasPermi('system:region:add')")
    @PostMapping("/addRegionWithUser")
    public AjaxResult addRegionWithUser(@RequestBody SysUserRegion sysUserRegion)
    {
        return toAjax(sysRegionService.insertSysUsersRegion(sysUserRegion));
    }


//    // 修改用户列表
//    @PostMapping("/updataRegionWithUser")
//    public AjaxResult updataRegionWithUser(@RequestBody SysUserRegion sysUserRegion)
//    {
//        return toAjax(sysRegionService.insertSysUsersRegion(sysUserRegion));
//    }
//

    @GetMapping("/getRegionUserByRegionId/{regionId}")
    public AjaxResult getRegionUserByRegionId(@PathVariable Long regionId){
        AjaxResult ajax = AjaxResult.success();
        List<SysUserRegion> sysUserRegions = sysRegionService.selectRegionUserByRegionId(regionId);
        return ajax.put("sysUserRegions",sysUserRegions);
    }
}
