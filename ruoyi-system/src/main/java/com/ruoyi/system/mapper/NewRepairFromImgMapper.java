package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.NewRepairFromImg;

/**
 * 【请填写功能名称】Mapper接口
 *
 * @author ruoyi
 * @date 2023-05-13
 */
public interface NewRepairFromImgMapper
{
    /**
     * 查询【请填写功能名称】
     *
     * @param imgId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public NewRepairFromImg selectNewRepairFromImgByImgId(Long imgId);

    /**
     * 查询【请填写功能名称】列表
     *
     * @param newRepairFromImg 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<NewRepairFromImg> selectNewRepairFromImgList(NewRepairFromImg newRepairFromImg);

    /**
     * 新增【请填写功能名称】
     *
     * @param newRepairFromImg 【请填写功能名称】
     * @return 结果
     */
    public int insertNewRepairFromImg(NewRepairFromImg newRepairFromImg);

    /**
     * 修改【请填写功能名称】
     *
     * @param newRepairFromImg 【请填写功能名称】
     * @return 结果
     */
    public int updateNewRepairFromImg(NewRepairFromImg newRepairFromImg);

    /**
     * 删除【请填写功能名称】
     *
     * @param imgId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteNewRepairFromImgByImgId(Long imgId);

    /**
     * 批量删除【请填写功能名称】
     *
     * @param imgIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteNewRepairFromImgByImgIds(Long[] imgIds);

    int deleteNewRepairFromImgByRepairFromId(Long newRepairFromId);

    int deleteNewRepairFromImgByRepairFromIds(Long[] newRepairFromIds);

    void batchRepairFromImg(List<NewRepairFromImg> list);

    List<String> selectImgUrls(Long newRepairFromId);
}
