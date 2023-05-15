package com.ruoyi.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.core.controller.AppBaseController;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.bean.BeanUtils;
import com.ruoyi.system.domain.NewEvaluate;
import com.ruoyi.system.domain.NewRepairFrom;
import com.ruoyi.system.service.*;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.NewRepair;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 维修单Controller
 *
 * @author ruoyi
 * @date 2023-05-13
 */
@RestController
@RequestMapping("/system/newRepair")
public class NewRepairController extends AppBaseController {
    @Autowired
    private INewRepairService newRepairService;

    @Autowired
    private ISysPersonnelService sysPersonnelService;

    @Autowired
    private ISysDictDataService sysDictDataService;

    @Autowired
    private INewRepairFromService newRepairFromService;

    @Autowired
    private INewEvaluateService newEvaluateService;

    /**
     * 查询维修单列表
     */
    @GetMapping("/list")
    public TableDataInfo list(NewRepair newRepair) {
        startPage();
        List<NewRepair> list = newRepairService.selectNewRepairList(newRepair);
        return getDataTable(list);
    }

    @GetMapping("/selectOwnerPersonnelAll")
    public AjaxResult selectOwnerPersonnelAll() {
        AjaxResult success = AjaxResult.success();
        success.put("OwnerPersonnel",sysPersonnelService.selectOwnerPersonnelAll());
        return success;
    }

    @GetMapping("/listByPersonnel")
    public TableDataInfo listByPersonnel(NewRepair newRepair) {
        startPage();
        newRepair.setPersonnelId(getAppUserId());
        List<NewRepair> list;
        if (StringUtils.isNotEmpty(newRepair.getState())){
            list = newRepairService.selectNewRepairListWithStateFive(newRepair);
        }else{
            list = newRepairService.selectNewRepairListWithState(newRepair);
        }
        for(NewRepair nr: list){
            List<String> listStr = newRepairService.selectImgUrls(nr.getNewRepairId());
            if(listStr!=null&&listStr.size()!=0){
                nr.setImgUrl(newRepairService.selectImgUrls(nr.getNewRepairId()).get(0));
                nr.setImgUrls(newRepairService.selectImgUrls(nr.getNewRepairId()));
            }
        }
        return getDataTable(list);
    }

    /**
     * 导出维修单列表
     */
    @Log(title = "维修单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, NewRepair newRepair) {
        List<NewRepair> list = newRepairService.selectNewRepairList(newRepair);
        ExcelUtil<NewRepair> util = new ExcelUtil<NewRepair>(NewRepair.class);
        util.exportExcel(response, list, "维修单数据");
    }

    /**
     * 获取维修单详细信息
     */
    @GetMapping(value = "/{newRepairId}")
    public AjaxResult getInfo(@PathVariable("newRepairId") Long newRepairId) {
        AjaxResult ajax = AjaxResult.success();
        NewRepair newRepair = newRepairService.selectNewRepairByNewRepairId(newRepairId);
        newRepair.setMaintenanceClassification(sysDictDataService.selectDictLabel("maintenance_classification", newRepair.getMaintenanceClassification()));
        newRepair.setRegionalClassification(sysDictDataService.selectDictLabel("regional_classification" ,newRepair.getRegionalClassification()));

        NewEvaluate newEvaluate = new NewEvaluate();
        newEvaluate.setNewRepairId(newRepair.getNewRepairId());
        List<NewEvaluate> newEvaluates = newEvaluateService.selectNewEvaluateList(newEvaluate);
        newRepair.setEvaluateList(newEvaluates);

        ajax.put(AjaxResult.DATA_TAG, newRepair);
        ajax.put("imgUrls", newRepairService.selectImgUrls(newRepairId));
        return ajax;
    }

    /**
     * 新增维修单
     */
    @Log(title = "维修单", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody NewRepair newRepair) {
        String msg = "";
        if (StringUtils.isEmpty(newRepair.getRegionalClassification())) {
            msg = "区域不能为空";
        } else if (StringUtils.isEmpty(newRepair.getMaintenanceClassification())) {
            msg = "维修分类不能为空";
        } else if (StringUtils.isEmpty(newRepair.getState())) {
            msg = "状态不能为空";
        } else if (StringUtils.isEmpty(newRepair.getPaidType())) {
            msg = "是否有偿不能为空";
        }else if (newRepair.getPersonnelId() == null) {
            msg = "维修人员不能为空";
        } else {
            int row = newRepairService.insertNewRepair(newRepair);
            boolean regFlag = row > 0;
            if (!regFlag) {
                msg = "添加失败,请联系系统管理人员";
            }
        }
        return StringUtils.isEmpty(msg) ? success() : error(msg);
    }

    /**
     * 修改维修单
     */
    @Log(title = "维修单", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody NewRepair newRepair) {
        return toAjax(newRepairService.updateNewRepair(newRepair));
    }


    /**
     * 修改维修单状态用接口
     */
    @Log(title = "维修单", businessType = BusinessType.UPDATE)
    @PostMapping("/editNewRepair")
    public AjaxResult editNewRepair(@RequestBody NewRepair newRepair) {
        NewRepair newRepairBySql = newRepairService.selectNewRepairByNewRepairId(newRepair.getNewRepairId());
        newRepairBySql.setImgUrls(newRepairService.selectImgUrls(newRepair.getNewRepairId()));
        newRepairBySql.setState(newRepair.getState());
        return toAjax(newRepairService.updateNewRepair(newRepairBySql));
    }


    /**
     * 删除维修单
     */
    @Log(title = "维修单", businessType = BusinessType.DELETE)
    @DeleteMapping("/{newRepairIds}")
    public AjaxResult remove(@PathVariable Long[] newRepairIds) {
        return toAjax(newRepairService.deleteNewRepairByNewRepairIds(newRepairIds));
    }

    //撤回按钮
    @PostMapping(value = "rollback/{newRepairFromId}")
    public AjaxResult rollback(@PathVariable("newRepairFromId") Long newRepairFromId) {
//        NewRepairFrom newRepairFrom = newRepairFromService.selectNewRepairFromByRepairFromId(newRepairFromId);
//        NewRepair newRepair = newRepairService.selectNewRepairByNewRepairId(newRepairFrom.getNewRepairId());
//        newRepair.setState("4");



        return toAjax(newRepairFromService.deleteNewRepairFromByRepairFromId(newRepairFromId));
    }


    //小程序根据部门树查询
}
