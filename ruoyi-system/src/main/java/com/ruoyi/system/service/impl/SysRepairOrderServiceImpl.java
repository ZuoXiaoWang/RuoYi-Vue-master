package com.ruoyi.system.service.impl;

import java.util.ArrayList;
import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.SysPatrolOrder;
import com.ruoyi.system.domain.SysPatrolOrderImg;
import com.ruoyi.system.domain.SysRepairOrderImg;
import com.ruoyi.system.mapper.SysRepairOrderImgMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysRepairOrderMapper;
import com.ruoyi.system.domain.SysRepairOrder;
import com.ruoyi.system.service.ISysRepairOrderService;

/**
 * 维修工单Service业务层处理
 *
 * @author lile
 * @date 2023-04-03
 */
@Service
public class SysRepairOrderServiceImpl implements ISysRepairOrderService
{
    @Autowired
    private SysRepairOrderMapper sysRepairOrderMapper;

    @Autowired
    private SysRepairOrderImgMapper repairOrderImgMapper;

    /**
     * 查询维修工单
     *
     * @param repairOrderId 维修工单主键
     * @return 维修工单
     */
    @Override
    public SysRepairOrder selectSysRepairOrderByRepairOrderId(Long repairOrderId)
    {
        return sysRepairOrderMapper.selectSysRepairOrderByRepairOrderId(repairOrderId);
    }

    /**
     * 查询维修工单列表
     *
     * @param sysRepairOrder 维修工单
     * @return 维修工单
     */
    @Override
    public List<SysRepairOrder> selectSysRepairOrderList(SysRepairOrder sysRepairOrder)
    {
        return sysRepairOrderMapper.selectSysRepairOrderList(sysRepairOrder);
    }

    /**
     * 新增维修工单
     *
     * @param sysRepairOrder 维修工单
     * @return 结果
     */
    @Override
    public int insertSysRepairOrder(SysRepairOrder sysRepairOrder)
    {
        sysRepairOrder.setCreateTime(DateUtils.getNowDate());
        int row = sysRepairOrderMapper.insertSysRepairOrder(sysRepairOrder);
        //新增图片
        insertRepairOrderImg(sysRepairOrder);
        return row;
    }

    /**
     * 修改维修工单
     *
     * @param sysRepairOrder 维修工单
     * @return 结果
     */
    @Override
    public int updateSysRepairOrder(SysRepairOrder sysRepairOrder)
    {
        //删除图片
        repairOrderImgMapper.deleteSysRepairOrderImgByRepairOrder(sysRepairOrder.getRepairOrderId());
        //添加图片
        insertRepairOrderImg(sysRepairOrder);
        sysRepairOrder.setUpdateTime(DateUtils.getNowDate());
        return sysRepairOrderMapper.updateSysRepairOrder(sysRepairOrder);
    }

    /**
     * 批量删除维修工单
     *
     * @param repairOrderIds 需要删除的维修工单主键
     * @return 结果
     */
    @Override
    public int deleteSysRepairOrderByRepairOrderIds(Long[] repairOrderIds)
    {
        //删除图片
        repairOrderImgMapper.deleteSysRepairOrderImgByRepairOrders(repairOrderIds);
        return sysRepairOrderMapper.deleteSysRepairOrderByRepairOrderIds(repairOrderIds);
    }

    /**
     * 删除维修工单信息
     *
     * @param repairOrderId 维修工单主键
     * @return 结果
     */
    @Override
    public int deleteSysRepairOrderByRepairOrderId(Long repairOrderId)
    {
        repairOrderImgMapper.deleteSysRepairOrderImgByRepairOrder(repairOrderId);
        return sysRepairOrderMapper.deleteSysRepairOrderByRepairOrderId(repairOrderId);
    }

    @Override
    public List<String> selectImgUrlsByRepairOrderId(Long repairOrderId) {
        return repairOrderImgMapper.selectImgUrlsByRepairOrderId(repairOrderId);
    }

    /**
     * 新增维修工单图片
     *
     * @param sysRepairOrder
     */
    public void insertRepairOrderImg(SysRepairOrder sysRepairOrder) {
        List<String> imgUrls = sysRepairOrder.getImgUrls();
        if (StringUtils.isNotEmpty(imgUrls)) {
            List<SysRepairOrderImg> list = new ArrayList<SysRepairOrderImg>(imgUrls.size());
            for (String imgUrl : imgUrls) {
                SysRepairOrderImg sysRepairOrderImg = new SysRepairOrderImg();
                sysRepairOrderImg.setRepairOrderId(sysRepairOrder.getRepairOrderId());
                sysRepairOrderImg.setImgUrl(imgUrl);
                list.add(sysRepairOrderImg);
            }
            repairOrderImgMapper.batchRepairOrderImg(list);
        }
    }
}
