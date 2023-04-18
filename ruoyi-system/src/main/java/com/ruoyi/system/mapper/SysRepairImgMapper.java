package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SysRepairImg;
import com.ruoyi.system.domain.SysRepairOrderImg;

/**
 * 【请填写功能名称】Mapper接口
 *
 * @author ruoyi
 * @date 2023-04-18
 */
public interface SysRepairImgMapper
{
    /**
     * 查询【请填写功能名称】
     *
     * @param imgId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public SysRepairImg selectSysRepairImgByImgId(Long imgId);

    /**
     * 查询【请填写功能名称】列表
     *
     * @param sysRepairImg 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<SysRepairImg> selectSysRepairImgList(SysRepairImg sysRepairImg);

    /**
     * 新增【请填写功能名称】
     *
     * @param sysRepairImg 【请填写功能名称】
     * @return 结果
     */
    public int insertSysRepairImg(SysRepairImg sysRepairImg);

    /**
     * 修改【请填写功能名称】
     *
     * @param sysRepairImg 【请填写功能名称】
     * @return 结果
     */
    public int updateSysRepairImg(SysRepairImg sysRepairImg);

    /**
     * 删除【请填写功能名称】
     *
     * @param imgId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteSysRepairImgByImgId(Long imgId);

    /**
     * 批量删除【请填写功能名称】
     *
     * @param imgIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysRepairImgByImgIds(Long[] imgIds);

    public int batchRepairImg(List<SysRepairImg> sysRepairImgs);

    public int deleteSysRepairImgByRepair(Long repairId);

    public int deleteSysRepairImgByRepairs(Long[] repairIds);

    public List<String> selectImgUrlsByRepairId(Long repairId);
}
