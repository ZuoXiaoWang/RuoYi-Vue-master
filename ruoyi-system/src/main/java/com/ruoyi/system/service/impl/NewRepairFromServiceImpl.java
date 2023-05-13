package com.ruoyi.system.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.mapper.NewRepairFromImgMapper;
import com.ruoyi.system.mapper.NewRepairFromPersonnelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.NewRepairFromMapper;
import com.ruoyi.system.service.INewRepairFromService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 报修单Service业务层处理
 *
 * @author ruoyi
 * @date 2023-05-13
 */
@Transactional
@Service
public class NewRepairFromServiceImpl implements INewRepairFromService {
    @Autowired
    private NewRepairFromMapper newRepairFromMapper;

    @Autowired
    private NewRepairFromPersonnelMapper newRepairFromPersonnelMapper;

    @Autowired
    private NewRepairFromImgMapper newRepairFromImgMapper;

    /**
     * 查询报修单
     *
     * @param repairFromId 报修单主键
     * @return 报修单
     */
    @Override
    public NewRepairFrom selectNewRepairFromByRepairFromId(Long repairFromId) {
        return newRepairFromMapper.selectNewRepairFromByRepairFromId(repairFromId);
    }

    @Override
    public List<String> selectImgUrls(Long repairFromId) {
        return newRepairFromImgMapper.selectImgUrls(repairFromId);
    }

    /**
     * 查询报修单列表
     *
     * @param newRepairFrom 报修单
     * @return 报修单
     */
    @Override
    public List<NewRepairFrom> selectNewRepairFromList(NewRepairFrom newRepairFrom) {
        return newRepairFromMapper.selectNewRepairFromList(newRepairFrom);
    }

    /**
     * 新增报修单
     *
     * @param newRepairFrom 报修单
     * @return 结果
     */
    @Override
    public int insertNewRepairFrom(NewRepairFrom newRepairFrom) {
        newRepairFrom.setCreateTime(DateUtils.getNowDate());
        int row = newRepairFromMapper.insertNewRepairFrom(newRepairFrom);
        //增加报修单和人员关联
        NewRepairFromPersonnel newRepairFromPersonnel = new NewRepairFromPersonnel();
        newRepairFromPersonnel.setNewRepairFromId(newRepairFrom.getRepairFromId());
        newRepairFromPersonnel.setPersonnelId(newRepairFrom.getPersonnelId());
        newRepairFromPersonnelMapper.insertNewRepairFromPersonnel(newRepairFromPersonnel);
        //添加图片
        insertRepairFromImg(newRepairFrom);
        return row;
    }

    /**
     * 修改报修单
     *
     * @param newRepairFrom 报修单
     * @return 结果
     */
    @Override
    public int updateNewRepairFrom(NewRepairFrom newRepairFrom) {
        newRepairFrom.setUpdateTime(DateUtils.getNowDate());
        int row = newRepairFromMapper.updateNewRepairFrom(newRepairFrom);
        //删除报修单和人员关联
        newRepairFromPersonnelMapper.deleteNewRepairFromPersonnelByNewRepairFromId(newRepairFrom.getRepairFromId());
        //删除图片
        newRepairFromImgMapper.deleteNewRepairFromImgByRepairFromId(newRepairFrom.getRepairFromId());
        //增加报修单和人员关联
        NewRepairFromPersonnel newRepairFromPersonnel = new NewRepairFromPersonnel();
        newRepairFromPersonnel.setNewRepairFromId(newRepairFrom.getRepairFromId());
        newRepairFromPersonnel.setPersonnelId(newRepairFrom.getPersonnelId());
        newRepairFromPersonnelMapper.insertNewRepairFromPersonnel(newRepairFromPersonnel);
        //添加图片
        insertRepairFromImg(newRepairFrom);
        return row;
    }

    /**
     * 批量删除报修单
     *
     * @param repairFromIds 需要删除的报修单主键
     * @return 结果
     */
    @Override
    public int deleteNewRepairFromByRepairFromIds(Long[] repairFromIds) {
        int row = newRepairFromMapper.deleteNewRepairFromByRepairFromIds(repairFromIds);
        //删除报修单和人员关联
        newRepairFromPersonnelMapper.deleteNewRepairFromPersonnelByNewRepairFromIds(repairFromIds);
        //批量删除图片
        newRepairFromImgMapper.deleteNewRepairFromImgByRepairFromIds(repairFromIds);
        return row;
    }

    /**
     * 删除报修单信息
     *
     * @param repairFromId 报修单主键
     * @return 结果
     */
    @Override
    public int deleteNewRepairFromByRepairFromId(Long repairFromId) {
        int row = newRepairFromMapper.deleteNewRepairFromByRepairFromId(repairFromId);
        //删除报修单和人员关联
        newRepairFromPersonnelMapper.deleteNewRepairFromPersonnelByNewRepairFromId(repairFromId);
        //删除图片
        newRepairFromImgMapper.deleteNewRepairFromImgByRepairFromId(repairFromId);
        return row;
    }

    //插入多个图片
    public void insertRepairFromImg(NewRepairFrom newRepairFrom) {
        List<String> imgUrls = newRepairFrom.getImgUrls();
        if (StringUtils.isNotEmpty(imgUrls)) {
            ArrayList<NewRepairFromImg> list = new ArrayList<>(imgUrls.size());
            for (String imgUrl : imgUrls
            ) {
                NewRepairFromImg newRepairFromImg = new NewRepairFromImg();
                newRepairFromImg.setNewRepairFromId(newRepairFrom.getRepairFromId());
                newRepairFromImg.setImgUrl(imgUrl);
                list.add(newRepairFromImg);
            }
            newRepairFromImgMapper.batchRepairFromImg(list);
        }
    }
}
