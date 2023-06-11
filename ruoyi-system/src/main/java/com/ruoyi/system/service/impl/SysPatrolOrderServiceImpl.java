package com.ruoyi.system.service.impl;

import java.util.ArrayList;
import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.SysPatrolOrderImg;
import com.ruoyi.system.domain.SysPatrolPatrolPointStatus;
import com.ruoyi.system.mapper.SysPatrolOrderImgMapper;
import com.ruoyi.system.mapper.SysPatrolPatrolPointStatusMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysPatrolOrderMapper;
import com.ruoyi.system.domain.SysPatrolOrder;
import com.ruoyi.system.service.ISysPatrolOrderService;

/**
 * 巡更工单管理Service业务层处理
 *
 * @author lile
 * @date 2023-03-31
 */
@Service
public class SysPatrolOrderServiceImpl implements ISysPatrolOrderService
{
    @Autowired
    private SysPatrolOrderMapper sysPatrolOrderMapper;

    @Autowired
    private SysPatrolOrderImgMapper patrolOrderImgMapper;

    @Autowired
    private SysPatrolPatrolPointStatusMapper sysPatrolPatrolPointStatusMapper;

    /**
     * 查询巡更工单管理
     *
     * @param patrolOrderId 巡更工单管理主键
     * @return 巡更工单管理
     */
    @Override
    public SysPatrolOrder selectSysPatrolOrderByPatrolOrderId(Long patrolOrderId)
    {
        return sysPatrolOrderMapper.selectSysPatrolOrderByPatrolOrderId(patrolOrderId);
    }

    /**
     * 查询巡更工单管理列表
     *
     * @param sysPatrolOrder 巡更工单管理
     * @return 巡更工单管理
     */
    @Override
    public List<SysPatrolOrder> selectSysPatrolOrderList(SysPatrolOrder sysPatrolOrder)
    {
        return sysPatrolOrderMapper.selectSysPatrolOrderList(sysPatrolOrder);
    }

    /**
     * 新增巡更工单管理
     *
     * @param sysPatrolOrder 巡更工单管理
     * @return 结果
     */
    @Override
    public int insertSysPatrolOrder(SysPatrolOrder sysPatrolOrder)
    {
        sysPatrolOrder.setCreateTime(DateUtils.getNowDate());
        int row = sysPatrolOrderMapper.insertSysPatrolOrder(sysPatrolOrder);
        insertPatrolOrderImg(sysPatrolOrder);
        //修改巡计划内的巡更点状态(已巡更)
        //changePatrolPatrolPointStatus(sysPatrolOrder,"1");
        return row;
    }

    /**
     * 修改巡更工单管理
     *
     * @param sysPatrolOrder 巡更工单管理
     * @return 结果
     */
    @Override
    public int updateSysPatrolOrder(SysPatrolOrder sysPatrolOrder)
    {
        //删除图片
        patrolOrderImgMapper.deleteSysPatrolOrderImgByPatrolOrder(sysPatrolOrder.getPatrolOrderId());
        //新增图片
        insertPatrolOrderImg(sysPatrolOrder);
        sysPatrolOrder.setUpdateTime(DateUtils.getNowDate());
        return sysPatrolOrderMapper.updateSysPatrolOrder(sysPatrolOrder);
    }

    /**
     * 批量删除巡更工单管理
     *
     * @param patrolOrderIds 需要删除的巡更工单管理主键
     * @return 结果
     */
    @Override
    public int deleteSysPatrolOrderByPatrolOrderIds(Long[] patrolOrderIds)
    {
        //删除图片
        patrolOrderImgMapper.deleteSysPatrolOrderImgByPatrolOrders(patrolOrderIds);
        return sysPatrolOrderMapper.deleteSysPatrolOrderByPatrolOrderIds(patrolOrderIds);
    }

    /**
     * 删除巡更工单管理信息
     *
     * @param patrolOrderId 巡更工单管理主键
     * @return 结果
     */
    @Override
    public int deleteSysPatrolOrderByPatrolOrderId(Long patrolOrderId)
    {
        //删除图片
        patrolOrderImgMapper.deleteSysPatrolOrderImgByPatrolOrder(patrolOrderId);
        return sysPatrolOrderMapper.deleteSysPatrolOrderByPatrolOrderId(patrolOrderId);
    }

    @Override
    public List<String> selectImgUrlsByPatrolOrderId(Long patrolOrderId) {
        return patrolOrderImgMapper.selectImgUrlsByPatrolOrderId(patrolOrderId);
    }

    @Override
    public void changePatrolPatrolPointStatusService(SysPatrolOrder sysPatrolOrder,String status) {
        changePatrolPatrolPointStatus(sysPatrolOrder,status);
    }

    /**
     * 新增巡更工单图片
     *
     * @param sysPatrolOrder
     */
    public void insertPatrolOrderImg(SysPatrolOrder sysPatrolOrder) {
        List<String> imgUrls = sysPatrolOrder.getImgUrls();
        if (StringUtils.isNotEmpty(imgUrls)) {
            List<SysPatrolOrderImg> list = new ArrayList<SysPatrolOrderImg>(imgUrls.size());
            for (String imgUrl : imgUrls) {
                SysPatrolOrderImg sysPatrolOrderImg = new SysPatrolOrderImg();
                sysPatrolOrderImg.setPatrolOrderId(sysPatrolOrder.getPatrolOrderId());
                sysPatrolOrderImg.setImgUrl(imgUrl);
                list.add(sysPatrolOrderImg);
            }
            patrolOrderImgMapper.batchPatrolOrderImg(list);
        }
    }

    /**
     * 将巡更计划内点位修改为已巡更
     */
    public void changePatrolPatrolPointStatus(SysPatrolOrder sysPatrolOrder,String status){
        //查询计划内点位
        SysPatrolPatrolPointStatus sysPatrolPatrolPointStatus = sysPatrolPatrolPointStatusMapper.selectSysPatrolPatrolPointStatusByPatrolIdAndPatrolPointId(sysPatrolOrder);
        sysPatrolPatrolPointStatus.setPatrolPatrolPointStatus(status);
        sysPatrolPatrolPointStatusMapper.updateSysPatrolPatrolPointStatus(sysPatrolPatrolPointStatus);
    }
}
