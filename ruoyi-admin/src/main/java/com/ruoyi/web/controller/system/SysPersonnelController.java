package com.ruoyi.web.controller.system;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.NewEvaluate;
import com.ruoyi.system.domain.SysUserRegion;
import com.ruoyi.system.service.IRegionsByUserIdService;
import com.ruoyi.system.service.ISysPostService;
import com.ruoyi.system.service.ISysUserService;
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
import com.ruoyi.common.core.domain.entity.SysPersonnel;
import com.ruoyi.system.service.ISysPersonnelService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 员工管理Controller
 *
 * @author lile
 * @date 2023-03-27
 */
@RestController
@RequestMapping("/system/personnel")
public class SysPersonnelController extends BaseController {
    @Autowired
    private ISysPersonnelService sysPersonnelService;

    @Autowired
    private ISysPostService postService;

    @Autowired
    private ISysUserService userService;

    @Autowired
    private IRegionsByUserIdService regionsByUserIdService;

    /**
     * 查询员工管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:personnel:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysPersonnel sysPersonnel) {
        startPage();
        sysPersonnel.setUserId(getUserId());
        List<SysPersonnel> list = sysPersonnelService.selectSysPersonnelList(sysPersonnel);
        return getDataTable(list);


//        List<SysUserRegion> sysUserRegions = regionsByUserIdService.selectRegionsByUser(getUserId());
////        startPage();
//        List<SysPersonnel> list = new ArrayList<>();
//        for (SysUserRegion sysUserRegion: sysUserRegions
//        ) {
//            sysPersonnel.setRegionId(sysUserRegion.getRegionId());
//            list.addAll(sysPersonnelService.selectSysPersonnelList(sysPersonnel));
//        }
//        return getDataTable(list);
    }

    /**
     * 导出员工管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:personnel:export')")
    @Log(title = "员工管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysPersonnel sysPersonnel) {
        List<SysPersonnel> list = sysPersonnelService.selectSysPersonnelList(sysPersonnel);
        ExcelUtil<SysPersonnel> util = new ExcelUtil<SysPersonnel>(SysPersonnel.class);
        util.exportExcel(response, list, "员工管理数据");
    }

    /**
     * 获取员工管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:personnel:query')")
    @GetMapping(value = {"/", "/{personnelId}"})
    public AjaxResult getInfo(@PathVariable(value = "personnelId", required = false) Long personnelId) {
        AjaxResult ajax = AjaxResult.success();
        ajax.put("posts", postService.selectPostAll());
        if (StringUtils.isNotNull(personnelId)) {
            SysPersonnel sysPersonnel = sysPersonnelService.selectSysPersonnelByPersonnelId(personnelId);
            ajax.put(AjaxResult.DATA_TAG, sysPersonnel);
            ajax.put("postIds", postService.selectPostListByPersonnelId(personnelId));
        }
        return ajax;
    }

    /**
     * 重置密码
     */
    @PreAuthorize("@ss.hasPermi('system:personnel:resetPwd')")
    @Log(title = "员工管理", businessType = BusinessType.UPDATE)
    @PutMapping("/resetPwd")
    public AjaxResult resetPwd(@RequestBody SysPersonnel personnel) {
        personnel.setPersonnelPassword(SecurityUtils.encryptPassword(personnel.getPersonnelPassword()));
        personnel.setUpdateBy(getUsername());
        return toAjax(sysPersonnelService.resetPwd(personnel));
    }

    /**
     * 新增员工管理
     */
    @PreAuthorize("@ss.hasPermi('system:personnel:add')")
    @Log(title = "员工管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysPersonnel sysPersonnel) {
        if (!userService.checkUserNameUniqueByPersonnelLoginName(sysPersonnel)) {
            return error("新增用户'" + sysPersonnel.getPersonnelLoginName() + "'失败，登录账号已存在");
        }
        if (!sysPersonnelService.checkPersonnelLoginNameUnique(sysPersonnel)) {
            return error("新增员工'" + sysPersonnel.getPersonnelLoginName() + "'失败,登录账号已存在");
        }
        sysPersonnel.setPostId(1L);
        sysPersonnel.setCreateBy(getUsername());
        sysPersonnel.setPersonnelPassword(SecurityUtils.encryptPassword(sysPersonnel.getPersonnelPassword()));
        return toAjax(sysPersonnelService.insertSysPersonnel(sysPersonnel));
    }

    /**
     * 修改员工管理
     */
    @PreAuthorize("@ss.hasPermi('system:personnel:edit')")
    @Log(title = "员工管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysPersonnel sysPersonnel) {
        if (!sysPersonnelService.checkPersonnelLoginNameUnique(sysPersonnel)) {
            return error("修改员工'" + sysPersonnel.getPersonnelLoginName() + "'失败,登录账号已存在");
        }
        return toAjax(sysPersonnelService.updateSysPersonnel(sysPersonnel));
    }

    /**
     * 删除员工管理
     */
    @PreAuthorize("@ss.hasPermi('system:personnel:remove')")
    @Log(title = "员工管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{personnelIds}")
    public AjaxResult remove(@PathVariable Long[] personnelIds) {
        return toAjax(sysPersonnelService.deleteSysPersonnelByPersonnelIds(personnelIds));
    }
}
