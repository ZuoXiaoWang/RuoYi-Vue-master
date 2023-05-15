package com.ruoyi.system.service.impl;

import java.util.ArrayList;
import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.mapper.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.service.INewRepairService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 维修单Service业务层处理
 *
 * @author ruoyi
 * @date 2023-05-13
 */
@Transactional
@Service
public class NewRepairServiceImpl implements INewRepairService
{
    @Autowired
    private NewRepairMapper newRepairMapper;

    @Autowired
    private NewRepairRepairFromMapper repairRepairFromMapper;

    @Autowired
    private NewRepairPersonnelMapper repairPersonnelMapper;

    @Autowired
    private NewRepairImgMapper repairImgMapper;

    @Autowired
    private NewRepairFromMapper repairFromMapper;

    /**
     * 查询维修单
     *
     * @param newRepairId 维修单主键
     * @return 维修单
     */
    @Override
    public NewRepair selectNewRepairByNewRepairId(Long newRepairId)
    {
        return newRepairMapper.selectNewRepairByNewRepairId(newRepairId);
    }

    @Override
    public List<String> selectImgUrls(Long newRepairId) {
        return repairImgMapper.selectImgUrls(newRepairId);
    }

    /**
     * 查询维修单列表
     *
     * @param newRepair 维修单
     * @return 维修单
     */
    @Override
    public List<NewRepair> selectNewRepairList(NewRepair newRepair)
    {
        return newRepairMapper.selectNewRepairList(newRepair);
    }

    @Override
    public List<NewRepair> selectNewRepairListWithStateFive(NewRepair newRepair)
    {
        return newRepairMapper.selectNewRepairListWithStateFive(newRepair);
    }
    @Override
    public List<NewRepair> selectNewRepairListWithState(NewRepair newRepair)
    {
        return newRepairMapper.selectNewRepairListWithState(newRepair);
    }

    /**
     * 新增维修单
     *
     * @param newRepair 维修单
     * @return 结果
     */
    @Override
    public int insertNewRepair(NewRepair newRepair)
    {

        newRepair.setCreateTime(DateUtils.getNowDate());
        int row = newRepairMapper.insertNewRepair(newRepair);
        if(newRepair.getNewRepairFromId() != null){
            //新增报修维修关联
            NewRepairRepairFrom newRepairRepairFrom = new NewRepairRepairFrom();
            newRepairRepairFrom.setNewRepairFromId(newRepair.getNewRepairFromId());
            newRepairRepairFrom.setNewRepairId(newRepair.getNewRepairId());
            repairRepairFromMapper.insertNewRepairRepairFrom(newRepairRepairFrom);
        }
        //新增维修单和人员关联
        NewRepairPersonnel newRepairPersonnel = new NewRepairPersonnel();
        newRepairPersonnel.setNewRepairId(newRepair.getNewRepairId());
        newRepairPersonnel.setPersonnelId(newRepair.getPersonnelId());
        repairPersonnelMapper.insertNewRepairPersonnel(newRepairPersonnel);
        //新增图片
        insertRepairImg(newRepair);
        return row;
    }

    /**
     * 修改维修单
     *
     * @param newRepair 维修单
     * @return 结果
     */
    @Override
    public int updateNewRepair(NewRepair newRepair)
    {
        newRepair.setUpdateTime(DateUtils.getNowDate());
        int row = newRepairMapper.updateNewRepair(newRepair);
        //删除维修单和人员关联
        repairPersonnelMapper.deleteNewRepairPersonnelByNewRepairId(newRepair.getNewRepairId());
        //新增维修单和人员关联
        NewRepairPersonnel newRepairPersonnel = new NewRepairPersonnel();
        newRepairPersonnel.setNewRepairId(newRepair.getNewRepairId());
        newRepairPersonnel.setPersonnelId(newRepair.getPersonnelId());
        repairPersonnelMapper.insertNewRepairPersonnel(newRepairPersonnel);
        //删除维修单和图片关联
        repairImgMapper.deleteNewRepairImgByRepairId(newRepair.getNewRepairId());
        //增加维修单和图片关联
        insertRepairImg(newRepair);
        if (newRepair.getState().equals("5")){
            NewRepairRepairFrom newRepairRepairFrom = repairRepairFromMapper.selectNewRepairRepairFromByNewRepairId(newRepair.getNewRepairId());
            NewRepairFrom newRepairFrom = repairFromMapper.selectNewRepairFromByRepairFromId(newRepairRepairFrom.getNewRepairFromId());
            newRepairFrom.setState("2");
            repairFromMapper.updateNewRepairFrom(newRepairFrom);
        }
        return row;
    }

    /**
     * 批量删除维修单
     *
     * @param newRepairIds 需要删除的维修单主键
     * @return 结果
     */
    @Override
    public int deleteNewRepairByNewRepairIds(Long[] newRepairIds)
    {
        int row = newRepairMapper.deleteNewRepairByNewRepairIds(newRepairIds);
        //删除报修和维修关联
        repairRepairFromMapper.deleteNewRepairRepairFromByNewRepairIds(newRepairIds);
        //删除维修单和人员关联
        repairPersonnelMapper.deleteNewRepairPersonnelByNewRepairIds(newRepairIds);
        //删除图片
        repairImgMapper.deleteNewRepairImgByRepairIds(newRepairIds);
        return row;
    }

    /**
     * 删除维修单信息
     *
     * @param newRepairId 维修单主键
     * @return 结果
     */
    @Override
    public int deleteNewRepairByNewRepairId(Long newRepairId)
    {
        int row = newRepairMapper.deleteNewRepairByNewRepairId(newRepairId);
        //删除报修和维修关联
        repairRepairFromMapper.deleteNewRepairRepairFromByNewRepairId(newRepairId);
        //删除维修单和人员关联
        repairPersonnelMapper.deleteNewRepairPersonnelByNewRepairId(newRepairId);
        //删除图片
        repairImgMapper.deleteNewRepairImgByRepairId(newRepairId);
        return row;
    }


    //插入多个图片
    public void insertRepairImg(NewRepair newRepair) {
        List<String> imgUrls = newRepair.getImgUrls();
        if (StringUtils.isNotEmpty(imgUrls)) {
            ArrayList<NewRepairImg> list = new ArrayList<>(imgUrls.size());
            for (String imgUrl : imgUrls
            ) {
                NewRepairImg newRepairImg = new NewRepairImg();
                newRepairImg.setNewRepairId(newRepair.getNewRepairId());
                newRepairImg.setImgUrl(imgUrl);
                list.add(newRepairImg);
            }
            repairImgMapper.batchRepairImg(list);
        }
    }
}
