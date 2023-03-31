package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SysPatrolOrderImg;

/**
 * 【请填写功能名称】Mapper接口
 *
 * @author ruoyi
 * @date 2023-03-31
 */
public interface SysPatrolOrderImgMapper
{
    /**
     * 查询【请填写功能名称】
     *
     * @param imgId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public SysPatrolOrderImg selectSysPatrolOrderImgByImgId(Long imgId);

    /**
     * 查询【请填写功能名称】列表
     *
     * @param sysPatrolOrderImg 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<SysPatrolOrderImg> selectSysPatrolOrderImgList(SysPatrolOrderImg sysPatrolOrderImg);

    /**
     * 新增【请填写功能名称】
     *
     * @param sysPatrolOrderImg 【请填写功能名称】
     * @return 结果
     */
    public int insertSysPatrolOrderImg(SysPatrolOrderImg sysPatrolOrderImg);

    /**
     * 修改【请填写功能名称】
     *
     * @param sysPatrolOrderImg 【请填写功能名称】
     * @return 结果
     */
    public int updateSysPatrolOrderImg(SysPatrolOrderImg sysPatrolOrderImg);

    /**
     * 删除【请填写功能名称】
     *
     * @param imgId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteSysPatrolOrderImgByImgId(Long imgId);

    /**
     * 批量删除【请填写功能名称】
     *
     * @param imgIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysPatrolOrderImgByImgIds(Long[] imgIds);

    public List<String> selectImgUrlsByPatrolOrderId(Long patrolOrderId);
}
