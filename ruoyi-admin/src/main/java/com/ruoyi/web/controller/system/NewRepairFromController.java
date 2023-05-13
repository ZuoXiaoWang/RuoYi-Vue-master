package com.ruoyi.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.core.controller.AppBaseController;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.bean.BeanUtils;
import com.ruoyi.system.domain.NewRepair;
import com.ruoyi.system.domain.SysRepairOrder;
import com.ruoyi.system.service.INewRepairService;
import org.aspectj.weaver.loadtime.Aj;
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
import com.ruoyi.system.domain.NewRepairFrom;
import com.ruoyi.system.service.INewRepairFromService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 报修单Controller
 *
 * @author ruoyi
 * @date 2023-05-13
 */
@RestController
@RequestMapping("/system/newRrepairFrom")
public class NewRepairFromController extends AppBaseController
{
    @Autowired
    private INewRepairFromService newRepairFromService;

    @Autowired
    private INewRepairService newRepairService;

    /**
     * 查询报修单列表
     */
    @GetMapping("/list")
    public TableDataInfo list(NewRepairFrom newRepairFrom)
    {
        startPage();
        List<NewRepairFrom> list = newRepairFromService.selectNewRepairFromList(newRepairFrom);
        return getDataTable(list);
    }


    /**
     * 维修人员查询
     */
    @GetMapping("/listByRepairPersonnel")
    public TableDataInfo listByRepairPersonnel(NewRepairFrom newRepairFrom)
    {
        if (getAppDeptId().equals(206L)){
            startPage();
            List<NewRepairFrom> list = newRepairFromService.selectNewRepairFromList(newRepairFrom);
            return getDataTable(list);
        }else return getDataTable(null);
    }

    /**
     * 导出报修单列表
     */
    @PreAuthorize("@ss.hasPermi('system:newRrepairFrom:export')")
    @Log(title = "报修单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, NewRepairFrom newRepairFrom)
    {
        List<NewRepairFrom> list = newRepairFromService.selectNewRepairFromList(newRepairFrom);
        ExcelUtil<NewRepairFrom> util = new ExcelUtil<NewRepairFrom>(NewRepairFrom.class);
        util.exportExcel(response, list, "报修单数据");
    }

    /**
     * 获取报修单详细信息
     */
    @GetMapping(value = "/{repairFromId}")
    public AjaxResult getInfo(@PathVariable("repairFromId") Long repairFromId)
    {
        AjaxResult ajax = AjaxResult.success();
        NewRepairFrom newRepairFrom = newRepairFromService.selectNewRepairFromByRepairFromId(repairFromId);
        ajax.put(AjaxResult.DATA_TAG,newRepairFrom);
        ajax.put("imgUrls",newRepairFromService.selectImgUrls(repairFromId));
        return ajax;
    }

    /**
     * 新增报修单
     */
    @Log(title = "报修单", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody NewRepairFrom newRepairFrom)
    {
        String msg = "";
        if (StringUtils.isEmpty(newRepairFrom.getRegionalClassification())){
            msg = "区域不能为空";
        } else if(StringUtils.isEmpty(newRepairFrom.getMaintenanceClassification())){
            msg = "维修分类不能为空";
        }else {
            //设置报修人
            newRepairFrom.setPersonnelId(getUserId());
            //报修单设置未开始
            newRepairFrom.setState("0");
            //默认设置为无偿
            newRepairFrom.setPaidType("0");
            int row = newRepairFromService.insertNewRepairFrom(newRepairFrom);
            boolean regFlag = row > 0;
            if (!regFlag) {
                msg = "添加失败,请联系系统管理人员";
            }
        }
        return StringUtils.isEmpty(msg) ? success() : error(msg);
    }

    /**
     * 修改报修单
     */
    @Log(title = "报修单", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody NewRepairFrom newRepairFrom)
    {
        return toAjax(newRepairFromService.updateNewRepairFrom(newRepairFrom));
    }

    /**
     * 删除报修单
     */
    @Log(title = "报修单", businessType = BusinessType.DELETE)
	@DeleteMapping("/{repairFromIds}")
    public AjaxResult remove(@PathVariable Long[] repairFromIds)
    {
        return toAjax(newRepairFromService.deleteNewRepairFromByRepairFromIds(repairFromIds));
    }

    //根据用户查询报修
    @GetMapping("/listByPersonnel")
    public TableDataInfo listByPersonnel(NewRepairFrom newRepairFrom)
    {
        startPage();
        newRepairFrom.setPersonnelId(getAppUserId());
        List<NewRepairFrom> list = newRepairFromService.selectNewRepairFromList(newRepairFrom);
        return getDataTable(list);
    }




    //接单
    @PostMapping("/pickUpRepairFrom/{repairFromId}")
    public AjaxResult remove(@PathVariable("repairFromId") Long repairFromId){
        //报修单设为进行中
        NewRepairFrom newRepairFrom = newRepairFromService.selectNewRepairFromByRepairFromId(repairFromId);
        newRepairFrom.setState("1");
        newRepairFromService.updateNewRepairFrom(newRepairFrom);
        //生成维修单
        NewRepair newRepair = new NewRepair();
        BeanUtils.copyBeanProp(newRepair,newRepairFrom);
        newRepair.setNewRepairFromId(newRepairFrom.getRepairFromId());
        newRepair.setPersonnelId(getAppUserId());
        return success(newRepairService.insertNewRepair(newRepair));
    }

    /**
     * 新增报修单
     */
    @Log(title = "报修单", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    public AjaxResult appAdd(@RequestBody NewRepairFrom newRepairFrom)
    {
        String msg = "";
        if (StringUtils.isEmpty(newRepairFrom.getRegionalClassification())){
            msg = "区域不能为空";
        } else if(StringUtils.isEmpty(newRepairFrom.getMaintenanceClassification())){
            msg = "维修分类不能为空";
        }else {
            //设置报修人
            newRepairFrom.setPersonnelId(getAppUserId());
            //报修单设置未开始
            newRepairFrom.setState("0");
            //默认设置为无偿
            newRepairFrom.setPaidType("0");
            int row = newRepairFromService.insertNewRepairFrom(newRepairFrom);
            boolean regFlag = row > 0;
            if (!regFlag) {
                msg = "添加失败,请联系系统管理人员";
            }
        }
        return StringUtils.isEmpty(msg) ? success() : error(msg);
    }
}
