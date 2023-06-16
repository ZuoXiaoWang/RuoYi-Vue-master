package com.ruoyi.system.service.impl;

import java.util.List;
import java.util.UUID;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.system.domain.NewEvaluateRepair;
import com.ruoyi.system.domain.NewRepair;
import com.ruoyi.system.domain.NewRepairFrom;
import com.ruoyi.system.mapper.NewEvaluateRepairMapper;
import com.ruoyi.system.mapper.NewRepairFromMapper;
import com.ruoyi.system.mapper.NewRepairMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.NewEvaluateMapper;
import com.ruoyi.system.domain.NewEvaluate;
import com.ruoyi.system.service.INewEvaluateService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 评价单Service业务层处理
 *
 * @author ruoyi
 * @date 2023-05-13
 */
@Transactional
@Service
public class NewEvaluateServiceImpl implements INewEvaluateService
{
    @Autowired
    private NewEvaluateMapper newEvaluateMapper;

    @Autowired
    private NewEvaluateRepairMapper newEvaluateRepairMapper;

    /**
     * 查询评价单
     *
     * @param evaluateId 评价单主键
     * @return 评价单
     */
    @Override
    public NewEvaluate selectNewEvaluateByEvaluateId(Long evaluateId)
    {
        return newEvaluateMapper.selectNewEvaluateByEvaluateId(evaluateId);
    }

    /**
     * 查询评价单列表
     *
     * @param newEvaluate 评价单
     * @return 评价单
     */
    @Override
    public List<NewEvaluate> selectNewEvaluateList(NewEvaluate newEvaluate)
    {
        return newEvaluateMapper.selectNewEvaluateList(newEvaluate);
    }


    /**
     * 新增评价单
     *
     * @param newEvaluate 评价单
     * @return 结果
     */
    @Override
    public int insertNewEvaluate(NewEvaluate newEvaluate)
    {
        newEvaluate.setCreateTime(DateUtils.getNowDate());
        newEvaluate.setEvaluateId(UUID.randomUUID().toString());
        int row = newEvaluateMapper.insertNewEvaluate(newEvaluate);
        //新增评价和维修关联
        NewEvaluateRepair newEvaluateRepair = new NewEvaluateRepair();
        newEvaluateRepair.setEvaluateId(newEvaluate.getEvaluateId());
        newEvaluateRepair.setNewRepairId(newEvaluate.getNewRepairId());
        newEvaluateRepairMapper.insertNewEvaluateRepair(newEvaluateRepair);
        return row;
    }

    /**
     * 修改评价单
     *
     * @param newEvaluate 评价单
     * @return 结果
     */
    @Override
    public int updateNewEvaluate(NewEvaluate newEvaluate)
    {
        newEvaluate.setUpdateTime(DateUtils.getNowDate());
        int row = newEvaluateMapper.updateNewEvaluate(newEvaluate);
        //删除评价维修关联
        newEvaluateRepairMapper.deleteNewEvaluateRepairByEvaluateId(newEvaluate.getEvaluateId());
        //新增评价和维修关联
        NewEvaluateRepair newEvaluateRepair = new NewEvaluateRepair();
        newEvaluateRepair.setEvaluateId(newEvaluate.getEvaluateId());
        newEvaluateRepair.setNewRepairId(newEvaluate.getNewRepairId());
        newEvaluateRepairMapper.insertNewEvaluateRepair(newEvaluateRepair);
        return row;
    }

    /**
     * 批量删除评价单
     *
     * @param evaluateIds 需要删除的评价单主键
     * @return 结果
     */
    @Override
    public int deleteNewEvaluateByEvaluateIds(String[] evaluateIds)
    {
        int row = newEvaluateMapper.deleteNewEvaluateByEvaluateIds(evaluateIds);
        newEvaluateRepairMapper.deleteNewEvaluateRepairByEvaluateIds(evaluateIds);
        return row;
    }

    /**
     * 删除评价单信息
     *
     * @param evaluateId 评价单主键
     * @return 结果
     */
    @Override
    public int deleteNewEvaluateByEvaluateId(String evaluateId)
    {
        int row = newEvaluateMapper.deleteNewEvaluateByEvaluateId(evaluateId);
        newEvaluateRepairMapper.selectNewEvaluateRepairByEvaluateId(evaluateId);
        return row;
    }
}
