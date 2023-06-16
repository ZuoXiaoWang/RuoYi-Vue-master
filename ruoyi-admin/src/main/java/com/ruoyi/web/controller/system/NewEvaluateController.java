package com.ruoyi.web.controller.system;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.NotNull;

import com.mchange.lang.LongUtils;
import com.ruoyi.common.core.controller.AppBaseController;
import com.ruoyi.common.core.domain.entity.SysPersonnel;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.NewRepair;
import com.ruoyi.system.domain.NewRepairFrom;
import com.ruoyi.system.domain.SysUserRegion;
import com.ruoyi.system.service.INewRepairFromService;
import com.ruoyi.system.service.INewRepairService;
import com.ruoyi.system.service.IRegionsByUserIdService;
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
import com.ruoyi.system.domain.NewEvaluate;
import com.ruoyi.system.service.INewEvaluateService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 评价单Controller
 *
 * @author ruoyi
 * @date 2023-05-13
 */
@RestController
@RequestMapping("/system/evaluate")
public class NewEvaluateController extends AppBaseController
{
    @Autowired
    private INewEvaluateService newEvaluateService;
    @Autowired
    private INewRepairService newRepairService;
    @Autowired
    private INewRepairFromService newRepairFromService;


    /**
     * 查询评价单列表
     */
    @GetMapping("/list")
    public TableDataInfo list(NewEvaluate newEvaluate)
    {
        startPage();
        newEvaluate.setUserId(getUserId());
        List<NewEvaluate> newEvaluates = newEvaluateService.selectNewEvaluateList(newEvaluate);
        return getDataTable(newEvaluates);
    }

    /**
     * 查询评价单列表
     */
    @GetMapping("/applist")
    public TableDataInfo applist(NewEvaluate newEvaluate)
    {
        SysPersonnel user = getUser();
        newEvaluate.setRegionId(user.getRegionId());
        List<NewEvaluate> list = newEvaluateService.selectNewEvaluateList(newEvaluate);
        return getDataTable(list);
    }

    /**
     * 导出评价单列表
     */
    @PreAuthorize("@ss.hasPermi('system:evaluate:export')")
    @Log(title = "评价单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, NewEvaluate newEvaluate)
    {
        List<NewEvaluate> list = newEvaluateService.selectNewEvaluateList(newEvaluate);
        ExcelUtil<NewEvaluate> util = new ExcelUtil<NewEvaluate>(NewEvaluate.class);
        util.exportExcel(response, list, "评价单数据");
    }

    /**
     * 获取评价单详细信息
     */
    @GetMapping(value = "/{evaluateId}")
    public AjaxResult getInfo(@PathVariable("evaluateId") Long evaluateId)
    {
        return success(newEvaluateService.selectNewEvaluateByEvaluateId(evaluateId));
    }

    /**
     * 新增评价单
     */
    @Log(title = "评价单", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody NewEvaluate newEvaluate)
    {
        newEvaluate.setRegionId(getUser().getRegionId());
        String msg = "";
        if(newEvaluate.getNewRepairId() == null){
            msg = "维修id不能为空";
        } else {
            if(newEvaluate.getState()!=null&&!"".equals(newEvaluate.getState())){
                int row = newEvaluateService.insertNewEvaluate(newEvaluate);
                boolean regFlag = row > 0;
                if (!regFlag) {
                    msg = "添加失败,请联系系统管理人员";
                }
                if("0".equals(newEvaluate.getState())){
                    NewRepair newRepair = newRepairService.selectNewRepairByNewRepairId(newEvaluate.getNewRepairId());
                    NewRepairFrom newRepairFrom = newRepairFromService.selectNewRepairFromByRepairFromId(newRepair.getNewRepairFromId());

                    newRepair.setImgUrls(newRepairService.selectImgUrls(newRepair.getNewRepairId()));
                    newRepair.setState("0");
                    newRepairService.updateNewRepair(newRepair);

                    newRepairFrom.setImgUrls(newRepairFromService.selectImgUrls(newRepairFrom.getRepairFromId()));
                    newRepairFrom.setState("1");
                    newRepairFromService.updateNewRepairFrom(newRepairFrom);
                }
            }else {
                msg = "类型不允许为空";
            }
        }
        return StringUtils.isEmpty(msg) ? success() : error(msg);
    }

    /**
     * 修改评价单
     */
    @Log(title = "评价单", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody NewEvaluate newEvaluate)
    {
        return toAjax(newEvaluateService.updateNewEvaluate(newEvaluate));
    }

    /**
     * 删除评价单
     */
    @Log(title = "评价单", businessType = BusinessType.DELETE)
    @DeleteMapping("/{evaluateIds}")
    public AjaxResult remove(@PathVariable String[] evaluateIds)
    {
        return toAjax(newEvaluateService.deleteNewEvaluateByEvaluateIds(evaluateIds));
    }

}
