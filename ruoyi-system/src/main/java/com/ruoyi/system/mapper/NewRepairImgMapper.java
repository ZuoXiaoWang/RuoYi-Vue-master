package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.NewRepairImg;

/**
 * 【请填写功能名称】Mapper接口
 *
 * @author ruoyi
 * @date 2023-05-13
 */
public interface NewRepairImgMapper
{
    /**
     * 查询【请填写功能名称】
     *
     * @param imgId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public NewRepairImg selectNewRepairImgByImgId(Long imgId);

    /**
     * 查询【请填写功能名称】列表
     *
     * @param newRepairImg 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<NewRepairImg> selectNewRepairImgList(NewRepairImg newRepairImg);

    /**
     * 新增【请填写功能名称】
     *
     * @param newRepairImg 【请填写功能名称】
     * @return 结果
     */
    public int insertNewRepairImg(NewRepairImg newRepairImg);

    /**
     * 修改【请填写功能名称】
     *
     * @param newRepairImg 【请填写功能名称】
     * @return 结果
     */
    public int updateNewRepairImg(NewRepairImg newRepairImg);

    /**
     * 删除【请填写功能名称】
     *
     * @param imgId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteNewRepairImgByImgId(Long imgId);

    /**
     * 批量删除【请填写功能名称】
     *
     * @param imgIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteNewRepairImgByImgIds(Long[] imgIds);


    int deleteNewRepairImgByRepairIds(Long[] newRepairIds);

    int deleteNewRepairImgByRepairId(Long newRepairId);

    void batchRepairImg(List<NewRepairImg> list);

    List<String> selectImgUrls(Long newRepairId);
}
