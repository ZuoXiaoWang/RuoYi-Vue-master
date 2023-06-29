package com.ruoyi.system.service.impl;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.uuid.UUID;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.mapper.InspectionItemMapper;
import com.ruoyi.system.mapper.InspectionItemTitleMapper;
import com.ruoyi.system.mapper.InspectionItemTitleValueMapper;
import com.ruoyi.system.service.IInspectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service

public class InspectionServiceImpl implements IInspectionService {
    @Autowired
    private InspectionItemMapper inspectionItemMapper;

    @Autowired
    private InspectionItemTitleMapper inspectionItemTitleMapper;

    @Autowired
    private InspectionItemTitleValueMapper inspectionItemTitleValueMapper;


    @Override
    public int addInspectionItem(InspectionItem inspectionItem) {
        inspectionItem.setItemId(UUID.fastUUID().toString());
        inspectionItem.setCreateTime(DateUtils.getNowDate());
        return inspectionItemMapper.insertInspectionItem(inspectionItem);
    }

    @Override
    @Transactional
    public int addInspectionItemTitle(InspectionItemTitle inspectionItemTitle) {
        inspectionItemTitle.setTitleId(UUID.fastUUID().toString());
        int row = inspectionItemTitleMapper.insertInspectionItemTitle(inspectionItemTitle);
        insertInspectionItemTitleValues(inspectionItemTitle);
        return row;
    }

    @Override
    public int editInspectionItem(InspectionItem inspectionItem) {
        return inspectionItemMapper.updateInspectionItem(inspectionItem);
    }

    @Override
    @Transactional
    public int editInspectionItemTitle(InspectionItemTitle inspectionItemTitle) {
        //根据title删除所有value
        inspectionItemTitleValueMapper.deleteInspectionItemTitleValueByTitleId(inspectionItemTitle.getTitleId());
        //添加新的value
        insertInspectionItemTitleValues(inspectionItemTitle);
        //更新title
        return inspectionItemTitleMapper.updateInspectionItemTitle(inspectionItemTitle);
    }

    @Override
    public List<InspectionItem> selectInspectionItemList(InspectionItem inspectionItem) {
        return inspectionItemMapper.selectInspectionItemList(inspectionItem);
    }

    @Override
    public List<InspectionItemTitle> selectInspectionItemTitle(InspectionItemTitle inspectionItemTitle) {
        return inspectionItemTitleMapper.selectInspectionItemTitleList(inspectionItemTitle);
    }

    @Override
    public List<InspectionItemTitleValue> selectInspectionItemTitleValue(InspectionItemTitleValue inspectionItemTitleValue) {
        return inspectionItemTitleValueMapper.selectInspectionItemTitleValueList(inspectionItemTitleValue);
    }

    @Override
    public int deleteInspectionItem(String[] ids) {
        return inspectionItemMapper.deleteInspectionItemByItemIds(ids);
    }

    @Override
    public int deleteInspectionItemTitle(String[] ids) {
        return inspectionItemTitleMapper.deleteInspectionItemTitleByTitleIds(ids);
    }

    //添加多个题目
    public void insertInspectionItemTitleValues(InspectionItemTitle inspectionItemTitle) {
        List<InspectionItemTitleValue> inspectionItemTitleValues = inspectionItemTitle.getInspectionItemTitleValue();
        if(StringUtils.isNotEmpty(inspectionItemTitleValues)){
            ArrayList<InspectionItemTitleValue> list = new ArrayList<>(inspectionItemTitleValues.size());
            for (InspectionItemTitleValue inspectionItemTitleValue : inspectionItemTitleValues
                    ) {
                inspectionItemTitleValue.setValueId(UUID.fastUUID().toString());
                inspectionItemTitleValue.setTitleId(inspectionItemTitle.getTitleId());
                list.add(inspectionItemTitleValue);
            }
            inspectionItemTitleValueMapper.batchInspectionItemTitleValue(list);
        }
    }
}
