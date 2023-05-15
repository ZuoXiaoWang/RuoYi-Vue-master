package com.ruoyi.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
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
import com.ruoyi.system.domain.NewArea;
import com.ruoyi.system.service.INewAreaService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 区域Controller
 *
 * @author ruoyi
 * @date 2023-05-13
 */
@RestController
@RequestMapping("/system/area")
public class NewAreaController extends BaseController
{
    @Autowired
    private INewAreaService newAreaService;

    /**
     * 查询区域列表
     */
    @GetMapping("/list")
    public TableDataInfo list(NewArea newArea)
    {
        startPage();
        List<NewArea> list = newAreaService.selectNewAreaList(newArea);
        return getDataTable(list);
    }

    /**
     * 导出区域列表
     */
    @PreAuthorize("@ss.hasPermi('system:area:export')")
    @Log(title = "区域", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, NewArea newArea)
    {
        List<NewArea> list = newAreaService.selectNewAreaList(newArea);
        ExcelUtil<NewArea> util = new ExcelUtil<NewArea>(NewArea.class);
        util.exportExcel(response, list, "区域数据");
    }

    /**
     * 获取区域详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:area:query')")
    @GetMapping(value = "/{areaId}")
    public AjaxResult getInfo(@PathVariable("areaId") Long areaId)
    {
        return success(newAreaService.selectNewAreaByAreaId(areaId));
    }

    /**
     * 新增区域
     */
    @PreAuthorize("@ss.hasPermi('system:area:add')")
    @Log(title = "区域", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody NewArea newArea)
    {
        return toAjax(newAreaService.insertNewArea(newArea));
    }

    /**
     * 修改区域
     */
    @PreAuthorize("@ss.hasPermi('system:area:edit')")
    @Log(title = "区域", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody NewArea newArea)
    {
        return toAjax(newAreaService.updateNewArea(newArea));
    }

    /**
     * 删除区域
     */
    @PreAuthorize("@ss.hasPermi('system:area:remove')")
    @Log(title = "区域", businessType = BusinessType.DELETE)
	@DeleteMapping("/{areaIds}")
    public AjaxResult remove(@PathVariable Long[] areaIds)
    {
        return toAjax(newAreaService.deleteNewAreaByAreaIds(areaIds));
    }
}
