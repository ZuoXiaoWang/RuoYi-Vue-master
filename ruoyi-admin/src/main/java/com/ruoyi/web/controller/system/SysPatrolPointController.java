package com.ruoyi.web.controller.system;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;
import javax.imageio.ImageIO;
import javax.imageio.stream.ImageOutputStream;
import javax.imageio.stream.MemoryCacheImageOutputStream;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.core.controller.AppBaseController;
import com.ruoyi.common.utils.QrCodeCreateUtil;
import com.ruoyi.common.utils.bean.BeanUtils;
import com.ruoyi.common.utils.ip.IpUtils;
import com.ruoyi.system.domain.*;
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
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.service.ISysPatrolPointService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;


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

    @Autowired
    private IRegionsByUserIdService regionsByUserIdService;

    /**
     * 查询巡更点管理列表
     */
    @GetMapping("/list")
    public TableDataInfo list(SysPatrolPoint sysPatrolPoint) {
        startPage();
        sysPatrolPoint.setUserId(getUserId());
        List<SysPatrolPoint> sysPatrolPoints = sysPatrolPointService.selectSysPatrolPointList(sysPatrolPoint);
        return getDataTable(sysPatrolPoints);


//        List<SysUserRegion> sysUserRegions = regionsByUserIdService.selectRegionsByUser(getUserId());
//        startPage();
//        List<SysPatrolPoint> list = new ArrayList<>();
//        for (SysUserRegion sysUserRegion : sysUserRegions
//        ) {
//            sysPatrolPoint.setRegionId(sysUserRegion.getRegionId());
//            list.addAll(sysPatrolPointService.selectSysPatrolPointList(sysPatrolPoint));
//        }
//        return getDataTable(list);
    }

    /**
     * 查询所有巡更点列表
     */
    @GetMapping("/listAll")
    public TableDataInfo listAll(SysPatrolPoint sysPatrolPoint) {
        List<SysUserRegion> sysUserRegions = regionsByUserIdService.selectRegionsByUser(getUserId());
        List<SysPatrolPoint> list = new ArrayList<>();
        for (SysUserRegion sysUserRegion : sysUserRegions
        ) {
            sysPatrolPoint.setRegionId(sysUserRegion.getRegionId());
            list.addAll(sysPatrolPointService.selectSysPatrolPointList(sysPatrolPoint));
        }
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
        try {
            sysPatrolPoint.setCreateBy(getAppUsername());
        } catch (Exception e) {
            sysPatrolPoint.setCreateBy(getUsername());
        }
//        sysPatrolPoint.setPatrolPointUrl(IpUtils.getHostIp() + "/system/point/scan/" + sysPatrolPoint.getPatrolPointId());
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
    public void QRcode(HttpServletResponse response, @PathVariable Long[] patrolPointIds) {
        //根据ids查询所有url
        List<SysPatrolPoint> sysPatrolPoints = sysPatrolPointService.selectSysPatrolPointByPatrolPointIds(patrolPointIds);
        getCodeZip(response, sysPatrolPoints);
    }


    //点位倒查
    @GetMapping("/selectPersonnelAndPatrolOrderByPointId/{patrolPointId}")
    public TableDataInfo selectPersonnelAndPatrolOrderByPointId(@PathVariable Long patrolPointId) {
        List<PersonnelAndPatrolOrder> list = sysPatrolPointService.selectPersonnelAndPatrolOrderByPointId(patrolPointId);
        return getDataTable(list);
    }


    /**
     * 获取二维码压缩包
     *
     * @param response
     * @param list     二维码字符串列表
     */
    private void getCodeZip(HttpServletResponse response, List<SysPatrolPoint> list) {
        response.setContentType("application/zip");
        response.setHeader("Content-Disposition", "attachment;filename=QRcode.zip");
        ZipOutputStream zos = null;
        try {
            zos = new ZipOutputStream(response.getOutputStream());
            // zos.setLevel(5);//压缩等级
            for (int j = 0; j < list.size(); j++) {
//                String codeString = String.valueOf(list.get(j).getPatrolPointId());
                String codeString = handelForPointScan(list.get(j));// 获取二维码字符串
                String title = String.valueOf(list.get(j).getPatrolPointId());// 获取二维码title
                BufferedImage qrCode;
                if (getUserId().equals(1L)) {
                    qrCode = QrCodeCreateUtil.createQrCode(codeString, 2500, title, getUserId());// 生成二维码图片
                } else {
                    qrCode = QrCodeCreateUtil.createQrCode(codeString, 800, title, getUserId());
                }
                try (ByteArrayOutputStream byteOutputStream = new ByteArrayOutputStream();
                     ImageOutputStream imageOutputStream = new MemoryCacheImageOutputStream(byteOutputStream)) {
                    ImageIO.write(qrCode, "PNG", imageOutputStream);
                    zos.putNextEntry(new ZipEntry(list.get(j).getPatrolPointId() + ".PNG"));
                    byte[] bytes = byteOutputStream.toByteArray();
                    zos.write(bytes);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (null != zos) {
                    zos.closeEntry();
                    zos.flush();
                    zos.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }


    /**
     * 扫码返回
     */
    public String getInfoByScan(Long patrolPointId) {
        AjaxResult success = AjaxResult.success();
        SysPatrolPoint sysPatrolPoint = sysPatrolPointService.selectSysPatrolPointByPatrolPointId(patrolPointId);
        PointScan pointScan = new PointScan();
        pointScan.setPatrolPointLongitude(sysPatrolPoint.getPatrolPointLongitude());
        pointScan.setPatrolPointLatitude(sysPatrolPoint.getPatrolPointLatitude());
        pointScan.setPatrolPointAltitude(sysPatrolPoint.getPatrolPointAltitude());
        success.put(AjaxResult.DATA_TAG, pointScan);
        return success.toString();
    }


    /**
     * 处理类
     */
    public String handelForPointScan(SysPatrolPoint sysPatrolPoint) {
        PointScan pointScan = new PointScan();
        BeanUtils.copyBeanProp(pointScan, sysPatrolPoint);
        AjaxResult success = AjaxResult.success();
        success.put(AjaxResult.DATA_TAG, pointScan);
        return success.toString();
    }
}
