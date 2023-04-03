package com.ruoyi.system.mapper;

import java.util.List;

import com.ruoyi.system.domain.SysPatrolOrderImg;
import com.ruoyi.system.domain.SysRepairOrderImg;

/**
 * 【请填写功能名称】Mapper接口
 *
 * @author ruoyi
 * @date 2023-04-03
 */
public interface SysRepairOrderImgMapper
{
    /**
     * 查询【请填写功能名称】
     *
     * @param imgId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public SysRepairOrderImg selectSysRepairOrderImgByImgId(Long imgId);

    /**
     * 查询【请填写功能名称】列表
     *
     * @param sysRepairOrderImg 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<SysRepairOrderImg> selectSysRepairOrderImgList(SysRepairOrderImg sysRepairOrderImg);

    /**
     * 新增【请填写功能名称】
     *
     * @param sysRepairOrderImg 【请填写功能名称】
     * @return 结果
     */
    public int insertSysRepairOrderImg(SysRepairOrderImg sysRepairOrderImg);

    /**
     * 修改【请填写功能名称】
     *
     * @param sysRepairOrderImg 【请填写功能名称】
     * @return 结果
     */
    public int updateSysRepairOrderImg(SysRepairOrderImg sysRepairOrderImg);

    /**
     * 删除【请填写功能名称】
     *
     * @param imgId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteSysRepairOrderImgByImgId(Long imgId);

    /**
     * 批量删除【请填写功能名称】
     *
     * @param imgIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysRepairOrderImgByImgIds(Long[] imgIds);

    public List<String> selectImgUrlsByRepairOrderId(Long repairId);

    public int batchRepairOrderImg(List<SysRepairOrderImg> sysRepairOrderImgs);

    /**
     * 根据维修工单删除图片
     */
    public int deleteSysRepairOrderImgByRepairOrder(Long repairOrderId);

    /**
     * 根据维修工单s删除图片
     */
    public int deleteSysRepairOrderImgByRepairOrders(Long[] repairOrderIds);
}
