package com.ruoyi.web.controller.system;

import com.mchange.lang.LongUtils;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.InspectionItem;
import com.ruoyi.system.domain.InspectionItemTitle;
import com.ruoyi.system.domain.InspectionItemTitleValue;
import com.ruoyi.system.service.IInspectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/inspection")
public class InspectionItemController extends BaseController {
    @Autowired
    private IInspectionService inspectionService;

    //新增巡检项目
    @PostMapping("/addInspectionItem")
    public AjaxResult addInspectionItem(@RequestBody InspectionItem inspectionItem) {
        if (inspectionItem.getRegionId() == 0L) {
            return AjaxResult.error();
        }
        int rows = inspectionService.addInspectionItem(inspectionItem);
        return toAjax(rows);
    }

    //新增题目
    @PostMapping("/addInspectionItemTitle")
    public AjaxResult addInspectionItemTitle(@RequestBody InspectionItemTitle inspectionItemTitle) {
        if (StringUtils.isEmpty(inspectionItemTitle.getItemId())) {
            return AjaxResult.error();
        }
        int rows = inspectionService.addInspectionItemTitle(inspectionItemTitle);
        return toAjax(rows);
    }


    //新增题目
    @PostMapping("/addInspectionItemTitleValue")
    public AjaxResult addInspectionItemTitleValue(@RequestBody List<InspectionItemTitleValue> inspectionItemTitleValues) {
        inspectionService.insertItemValues(inspectionItemTitleValues);
        return AjaxResult.success();
    }

    //修改巡检项目
    @PutMapping("/editInspectionItem")
    public AjaxResult editInspectionItem(@RequestBody InspectionItem inspectionItem) {
        if (StringUtils.isEmpty(inspectionItem.getItemId()) || inspectionItem.getRegionId() == 0L) {
            return AjaxResult.error();
        }
        int rows = inspectionService.editInspectionItem(inspectionItem);
        return toAjax(rows);
    }

    //修改题目
    @PutMapping("/editInspectionItemTitle")
    public AjaxResult editInspectionItemTitle(@RequestBody InspectionItemTitle inspectionItemTitle) {
        InspectionItem inspectionItem = inspectionService.selectInspectionItemByItemId(inspectionItemTitle.getItemId());
        inspectionItemTitle.setRegionId(inspectionItem.getRegionId());
        if (StringUtils.isEmpty(inspectionItemTitle.getItemId())) {
            return AjaxResult.error();
        }
        int rows = inspectionService.editInspectionItemTitle(inspectionItemTitle);
        return toAjax(rows);
    }

    //查询巡检项目
    @GetMapping("/selectInspectionItemList")
    public TableDataInfo selectInspectionItemList(InspectionItem inspectionItem) {
        inspectionItem.setUserId(getUserId());
        startPage();
        List<InspectionItem> list = inspectionService.selectInspectionItemList(inspectionItem);
        return getDataTable(list);
    }

    //查询题目
    @GetMapping("/selectInspectionItemTitleList")
    public TableDataInfo selectInspectionItemTitleList(InspectionItemTitle inspectionItemTitle) {
        if (StringUtils.isEmpty(inspectionItemTitle.getItemId())) {
            return null;
        }
        inspectionItemTitle.setUserId(getUserId());
        startPage();
        List<InspectionItemTitle> list = inspectionService.selectInspectionItemTitle(inspectionItemTitle);
        return getDataTable(list);
    }

    //查询value根据titleId
    @GetMapping("/getValueByItemId/{titleId}")
    public AjaxResult getValueByItemId(@PathVariable String titleId){
//        InspectionItemTitle inspectionItemTitle = inspectionService.selectInspectionItemTitleByTitleId(titleId);
        InspectionItemTitleValue inspectionItemTitleValue = new InspectionItemTitleValue();
        inspectionItemTitleValue.setTitleId(titleId);
        List<InspectionItemTitleValue> list = inspectionService.selectInspectionItemTitleValue(inspectionItemTitleValue);
        AjaxResult success = AjaxResult.success();
        return success.put(AjaxResult.DATA_TAG,list);
    }

    //查询value
    @GetMapping("/selectInspectionItemTitleValueList")
    public TableDataInfo selectInspectionItemTitleValueList(InspectionItemTitleValue inspectionItemTitleValue) {
        if (StringUtils.isEmpty(inspectionItemTitleValue.getTitleId())) {
            return null;
        }
        inspectionItemTitleValue.setUserId(getUserId());
        startPage();
        List<InspectionItemTitleValue> list = inspectionService.selectInspectionItemTitleValue(inspectionItemTitleValue);
        return getDataTable(list);
    }

    //删除巡检项目
    @DeleteMapping("/inspectionItem/{areaIds}")
    public AjaxResult deleteInspectionItem(@PathVariable String[] areaIds) {
        return toAjax(inspectionService.deleteInspectionItem(areaIds));
    }

    //删除题目
    @DeleteMapping("/inspectionItemTitle/{areaIds}")
    public AjaxResult deleteInspectionItemTitle(@PathVariable String[] areaIds) {
        return toAjax(inspectionService.deleteInspectionItemTitle(areaIds));
    }
}
