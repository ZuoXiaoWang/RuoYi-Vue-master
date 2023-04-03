package com.ruoyi.web.controller.system;

import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.swing.filechooser.FileSystemView;

import com.ruoyi.common.core.controller.AppBaseController;
import com.ruoyi.common.utils.ip.IpUtils;
import com.ruoyi.system.domain.*;
import org.apache.commons.io.IOUtils;
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
import com.ruoyi.system.service.ISysPatrolPointService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

import static com.ruoyi.common.utils.QrCodeUtil.createQrCode;

/**
 * 巡更点管理Controller
 *
 * @author lile
 * @date 2023-03-30
 */
@RestController
@RequestMapping("/system/point")
public class SysPatrolPointController extends AppBaseController {
    @Autowired
    private ISysPatrolPointService sysPatrolPointService;

    /**
     * 扫码返回
     */
    @GetMapping("/scan/{patrolPointId}")
    public AjaxResult getInfoByScan(@PathVariable Long patrolPointId) {
        AjaxResult success = AjaxResult.success();
        SysPatrolPoint sysPatrolPoint = sysPatrolPointService.selectSysPatrolPointByPatrolPointId(patrolPointId);
        PointScan pointScan = new PointScan();
        pointScan.setPatrolPointLongitude(sysPatrolPoint.getPatrolPointLongitude());
        pointScan.setPatrolPointLatitude(sysPatrolPoint.getPatrolPointLatitude());
        pointScan.setPatrolPointAltitude(sysPatrolPoint.getPatrolPointAltitude());
        success.put(AjaxResult.DATA_TAG,pointScan);
        return success;
    }

    /**
     * 查询巡更点管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:point:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysPatrolPoint sysPatrolPoint) {
        startPage();
        List<SysPatrolPoint> list = sysPatrolPointService.selectSysPatrolPointList(sysPatrolPoint);
        return getDataTable(list);
    }

    /**
     * 查询点位列表根据巡更任务编号
     */
    @GetMapping("/PointListByPatrol/{patrolId}")
    public TableDataInfo PointListByPatrol(@PathVariable Long patrolId) {
        List<SysPatrolPoint> list = sysPatrolPointService.selectPatrolPointListByPatrolIdWithName(patrolId);
        return getDataTable(list);
    }


    /**
     * 查询点位列表根据维修任务编号
     */
    @GetMapping("/PointListByRepair/{repairId}")
    public TableDataInfo PointListByRepair(@PathVariable Long repairId) {
        List<SysPatrolPoint> list = sysPatrolPointService.selectPatrolPointListByRepairIdWithName(repairId);
        return getDataTable(list);
    }

    /**
     * 导出巡更点管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:point:export')")
    @Log(title = "巡更点管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysPatrolPoint sysPatrolPoint) {
        List<SysPatrolPoint> list = sysPatrolPointService.selectSysPatrolPointList(sysPatrolPoint);
        ExcelUtil<SysPatrolPoint> util = new ExcelUtil<SysPatrolPoint>(SysPatrolPoint.class);
        util.exportExcel(response, list, "巡更点管理数据");
    }

    /**
     * 获取巡更点管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:point:query')")
    @GetMapping(value = "/{patrolPointId}")
    public AjaxResult getInfo(@PathVariable("patrolPointId") Long patrolPointId) {
        return success(sysPatrolPointService.selectSysPatrolPointByPatrolPointId(patrolPointId));
    }



    /**
     * 新增巡更点管理
     */
    @PreAuthorize("@ss.hasPermi('system:point:add')")
    @Log(title = "巡更点管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysPatrolPoint sysPatrolPoint) {
        sysPatrolPoint.setCreateBy(getAppUsername());
        sysPatrolPoint.setPatrolPointUrl(IpUtils.getHostIp()+"/system/point/scan/"+sysPatrolPoint.getPatrolPointId());
        return toAjax(sysPatrolPointService.insertSysPatrolPoint(sysPatrolPoint));
    }

    /**
     * 修改巡更点管理
     */
    @PreAuthorize("@ss.hasPermi('system:point:edit')")
    @Log(title = "巡更点管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysPatrolPoint sysPatrolPoint) {
        return toAjax(sysPatrolPointService.updateSysPatrolPoint(sysPatrolPoint));
    }

    /**
     * 删除巡更点管理
     */
    @PreAuthorize("@ss.hasPermi('system:point:remove')")
    @Log(title = "巡更点管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{patrolPointIds}")
    public AjaxResult remove(@PathVariable Long[] patrolPointIds) {
        return toAjax(sysPatrolPointService.deleteSysPatrolPointByPatrolPointIds(patrolPointIds));
    }

    /**
     * 根据patrolPointIds批量生成二维码
     */
    @GetMapping(value = "/qrcode/{patrolPointIds}")
//    public AjaxResult QRcode(HttpServletResponse response,@PathVariable Long[] patrolPointIds) {
//        //根据ids查询所有url
//        List<SysPatrolPoint> sysPatrolPoints = sysPatrolPointService.selectSysPatrolPointByPatrolPointIds(patrolPointIds);
//
//        return genQRcode(response,data);
//    }

    /**
     * 生成zip文件
     */
    private void genQRcode(HttpServletResponse response, byte[] data) throws IOException
    {
        response.reset();
        response.addHeader("Access-Control-Allow-Origin", "*");
        response.addHeader("Access-Control-Expose-Headers", "Content-Disposition");
        response.setHeader("Content-Disposition", "attachment; filename=\"二维码.zip\"");
        response.addHeader("Content-Length", "" + data.length);
        response.setContentType("application/octet-stream; charset=UTF-8");
        IOUtils.write(data, response.getOutputStream());
    }
}
