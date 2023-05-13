package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.NewEvaluate;

/**
 * 评价单Service接口
 *
 * @author ruoyi
 * @date 2023-05-13
 */
public interface INewEvaluateService
{
    /**
     * 查询评价单
     *
     * @param evaluateId 评价单主键
     * @return 评价单
     */
    public NewEvaluate selectNewEvaluateByEvaluateId(Long evaluateId);

    /**
     * 查询评价单列表
     *
     * @param newEvaluate 评价单
     * @return 评价单集合
     */
    public List<NewEvaluate> selectNewEvaluateList(NewEvaluate newEvaluate);

    /**
     * 新增评价单
     *
     * @param newEvaluate 评价单
     * @return 结果
     */
    public int insertNewEvaluate(NewEvaluate newEvaluate);

    /**
     * 修改评价单
     *
     * @param newEvaluate 评价单
     * @return 结果
     */
    public int updateNewEvaluate(NewEvaluate newEvaluate);

    /**
     * 批量删除评价单
     *
     * @param evaluateIds 需要删除的评价单主键集合
     * @return 结果
     */
    public int deleteNewEvaluateByEvaluateIds(Long[] evaluateIds);

    /**
     * 删除评价单信息
     *
     * @param evaluateId 评价单主键
     * @return 结果
     */
    public int deleteNewEvaluateByEvaluateId(Long evaluateId);
}
