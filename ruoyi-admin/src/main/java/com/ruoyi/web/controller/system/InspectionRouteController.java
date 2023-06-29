package com.ruoyi.web.controller.system;

import java.util.List;

import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.InspectionRoutePointRel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.system.domain.InspectionRoute;
import com.ruoyi.system.service.IInspectionRouteService;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 【请填写功能名称】Controller
 *
 * @author ruoyi
 * @date 2023-06-28
 */
@RestController
@RequestMapping("/system/route")
public class InspectionRouteController extends BaseController
{
    @Autowired
    private IInspectionRouteService inspectionRouteService;

    //查询路线
    @GetMapping("/routeList")
    public TableDataInfo routeList(InspectionRoute inspectionRoute)
    {
        startPage();
        List<InspectionRoute> list = inspectionRouteService.selectInspectionRouteList(inspectionRoute);
        return getDataTable(list);
    }

    //查询路线点
    @GetMapping("/routePointList")
    public TableDataInfo routePointList(InspectionRoutePointRel inspectionRoutePointRel){
        if (StringUtils.isEmpty(inspectionRoutePointRel.getInspectionId())){
            return getDataTable(null);
        }
        startPage();
        List<InspectionRoutePointRel> list = inspectionRouteService.selectInspectionRoutePointRel(inspectionRoutePointRel);
        return getDataTable(list);
    }

    //新增路线
    @PostMapping("/insertInspectionRoute")
    public AjaxResult insertInspectionRoute(@RequestBody InspectionRoute inspectionRoute){
        if (inspectionRoute.getRegionId() == 0L){
            return AjaxResult.error();
        }
        return toAjax(inspectionRouteService.insertInspectionRoute(inspectionRoute));
    }

    //新增路线点
    @PostMapping("/insertInspectionRoutePointRel")
    public AjaxResult insertInspectionRoutePointRel(@RequestBody InspectionRoutePointRel inspectionRoutePointRel){
        if (StringUtils.isEmpty(inspectionRoutePointRel.getInspectionId())||inspectionRoutePointRel.getRegionId() == 0L){
            return AjaxResult.error();
        }
        return toAjax(inspectionRouteService.insertInspectionRoutePointRel(inspectionRoutePointRel));
    }

    //更新路线
    @PutMapping("/updateInspectionRoute")
    public AjaxResult updateInspectionRoute(@RequestBody InspectionRoute inspectionRoute){
        if (inspectionRoute.getRegionId() == 0L){
            return AjaxResult.error();
        }
        return toAjax(inspectionRouteService.updateInspectionRoute(inspectionRoute));
    }


    //删除路线
    @DeleteMapping("/{areaIds}")
    public AjaxResult deleteInspectionRouteByInspectionRouteIds(@PathVariable String[] areaIds){
        return toAjax(inspectionRouteService.deleteInspectionRouteByInspectionRouteIds(areaIds));
    }
}
