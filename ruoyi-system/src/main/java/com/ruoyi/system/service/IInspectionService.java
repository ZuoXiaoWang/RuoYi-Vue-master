package com.ruoyi.system.service;

import com.ruoyi.system.domain.InspectionItem;
import com.ruoyi.system.domain.InspectionItemTitle;
import com.ruoyi.system.domain.InspectionItemTitleValue;

import java.util.List;

public interface IInspectionService {
    //新增巡检项目
    public int addInspectionItem(InspectionItem inspectionItem);

    //新增题目
    public int addInspectionItemTitle(InspectionItemTitle inspectionItemTitle);

    //修改巡检项目
    public int editInspectionItem(InspectionItem inspectionItem);

    //修改题目
    public int editInspectionItemTitle(InspectionItemTitle inspectionItemTitle);

    //查询巡检项目
    public List<InspectionItem> selectInspectionItemList(InspectionItem inspectionItem);

    //查询题目
    public List<InspectionItemTitle> selectInspectionItemTitle(InspectionItemTitle inspectionItemTitle);

    //查询value
    public List<InspectionItemTitleValue> selectInspectionItemTitleValue(InspectionItemTitleValue inspectionItemTitleValue);

    //删除巡检项目
    public int deleteInspectionItem(String[] ids);

    //删除题目
    public int deleteInspectionItemTitle(String[] ids);
}
