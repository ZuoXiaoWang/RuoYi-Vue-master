package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.InspectionRoute;
import com.ruoyi.system.domain.InspectionRoutePointRel;

public interface IInspectionRouteService
{
    //查询路线
    public List<InspectionRoute> selectInspectionRouteList(InspectionRoute inspectionRoute);

    //查询路线点
    public List<InspectionRoutePointRel> selectInspectionRoutePointRel(InspectionRoutePointRel inspectionRoutePointRel);

    //新增路线
    public int insertInspectionRoute(InspectionRoute inspectionRoute);

    //新增路线点
    public int insertInspectionRoutePointRel(InspectionRoutePointRel inspectionRoutePointRel);

    //更新路线
    public int updateInspectionRoute(InspectionRoute inspectionRoute);

    //删除路线
    public int deleteInspectionRouteByInspectionRouteIds(String[] inspectionRouteIds);

    //删除路线
    public int deleteInspectionRouteByInspectionRouteId(String inspectionRouteId);

    //删除巡检点
    public int deleteInspectionRouteByInspectionRouteRel(String[] inspectionRouteRelIds);


    //查询路线下巡检点
    public Long[] selectInspectionRoutePointRelIds(String routeId);
}
