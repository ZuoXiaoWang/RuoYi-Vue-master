package com.ruoyi.system.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.uuid.UUID;
import com.ruoyi.system.domain.InspectionRoutePointRel;
import com.ruoyi.system.mapper.InspectionRoutePointRelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.InspectionRouteMapper;
import com.ruoyi.system.domain.InspectionRoute;
import com.ruoyi.system.service.IInspectionRouteService;
import org.springframework.transaction.annotation.Transactional;

@Service
public class InspectionRouteServiceImpl implements IInspectionRouteService {
    @Autowired
    private InspectionRouteMapper inspectionRouteMapper;

    @Autowired
    private InspectionRoutePointRelMapper inspectionRoutePointRelMapper;


    @Override
    public List<InspectionRoute> selectInspectionRouteList(InspectionRoute inspectionRoute) {
        return inspectionRouteMapper.selectInspectionRouteList(inspectionRoute);
    }

    @Override
    public List<InspectionRoutePointRel> selectInspectionRoutePointRel(InspectionRoutePointRel inspectionRoutePointRel) {
        return inspectionRoutePointRelMapper.selectInspectionRoutePointRelList(inspectionRoutePointRel);
    }

    @Override
    @Transactional
    public int insertInspectionRoute(InspectionRoute inspectionRoute) {
        inspectionRoute.setInspectionRouteId(UUID.fastUUID().toString());
        inspectionRoute.setCreateTime(DateUtils.getNowDate());
        Long[] patrolPointIds = inspectionRoute.getPatrolPointIds();
        ArrayList<InspectionRoutePointRel> list = new ArrayList<>();
        for (Long patrolPointId : patrolPointIds
        ) {
            InspectionRoutePointRel inspectionRoutePointRel = new InspectionRoutePointRel();
            inspectionRoutePointRel.setIrpRelId(UUID.fastUUID().toString());
            inspectionRoutePointRel.setInspectionRouteId(inspectionRoute.getInspectionRouteId());
            inspectionRoutePointRel.setPatrolPointId(patrolPointId);
            inspectionRoutePointRel.setRegionId(inspectionRoute.getRegionId());
            list.add(inspectionRoutePointRel);
        }
        inspectionRoutePointRelMapper.batchInsertInspectionRouteRel(list);
        return inspectionRouteMapper.insertInspectionRoute(inspectionRoute);
    }

    @Override
    public int insertInspectionRoutePointRel(InspectionRoutePointRel inspectionRoutePointRel) {
        inspectionRoutePointRel.setInspectionRouteId(UUID.fastUUID().toString());
        inspectionRoutePointRel.setCreateTime(DateUtils.getNowDate());
        return inspectionRoutePointRelMapper.insertInspectionRoutePointRel(inspectionRoutePointRel);
    }

    @Override
    @Transactional
    public int updateInspectionRoute(InspectionRoute inspectionRoute) {
        //删除巡检点表根据inspectionRouteId
        inspectionRoutePointRelMapper.deleteInspectionRoutePointRelByInspectionRouteId(inspectionRoute.getInspectionRouteId());

        Long[] patrolPointIds = inspectionRoute.getPatrolPointIds();
        ArrayList<InspectionRoutePointRel> list = new ArrayList<>();
        for (Long patrolPointId : patrolPointIds
        ) {
            InspectionRoutePointRel inspectionRoutePointRel = new InspectionRoutePointRel();
            inspectionRoutePointRel.setIrpRelId(UUID.fastUUID().toString());
            inspectionRoutePointRel.setInspectionRouteId(inspectionRoute.getInspectionRouteId());
            inspectionRoutePointRel.setPatrolPointId(patrolPointId);
            inspectionRoutePointRel.setRegionId(inspectionRoute.getRegionId());
            list.add(inspectionRoutePointRel);
        }
        inspectionRoutePointRelMapper.batchInsertInspectionRouteRel(list);
        return inspectionRouteMapper.updateInspectionRoute(inspectionRoute);
    }

    @Override
    @Transactional
    public int deleteInspectionRouteByInspectionRouteIds(String[] inspectionRouteIds) {
        //删除路线点
        inspectionRoutePointRelMapper.deleteInspectionRoutePointRelByInspectionRouteIds(inspectionRouteIds);
        return inspectionRouteMapper.deleteInspectionRouteByInspectionRouteIds(inspectionRouteIds);
    }

    @Override
    @Transactional
    public int deleteInspectionRouteByInspectionRouteId(String inspectionRouteId) {
        //删除路线点
        inspectionRoutePointRelMapper.deleteInspectionRoutePointRelByInspectionRouteId(inspectionRouteId);
        return inspectionRouteMapper.deleteInspectionRouteByInspectionRouteId(inspectionRouteId);
    }

    @Override
    public int deleteInspectionRouteByInspectionRouteRel(String[] inspectionRouteRelIds) {
        //删除巡检点
        return inspectionRoutePointRelMapper.deleteInspectionRoutePointRelByIrpRelIds(inspectionRouteRelIds);
    }

    @Override
    public Long[] selectInspectionRoutePointRelIds(String routeId) {
        return inspectionRoutePointRelMapper.selectInspectionRoutePointRelIds(routeId);
    }
}
