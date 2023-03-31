package com.ruoyi.system.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.SysPersonnelPost;
import com.ruoyi.system.mapper.SysPersonnelPostMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysPersonnelMapper;
import com.ruoyi.common.core.domain.entity.SysPersonnel;
import com.ruoyi.system.service.ISysPersonnelService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 员工管理Service业务层处理
 *
 * @author lile
 * @date 2023-03-27
 */
@Service
public class SysPersonnelServiceImpl implements ISysPersonnelService
{
    @Autowired
    private SysPersonnelMapper sysPersonnelMapper;

    @Autowired
    private SysPersonnelPostMapper sysPersonnelPostMapper;

    /**
     * 查询员工管理
     *
     * @param personnelId 员工管理主键
     * @return 员工管理
     */
    @Override
    public SysPersonnel selectSysPersonnelByPersonnelId(Long personnelId)
    {
        return sysPersonnelMapper.selectSysPersonnelByPersonnelId(personnelId);
    }

    @Override
    public SysPersonnel selectSysPersonnelByPersonnelLoginName(String loginName) {
        return sysPersonnelMapper.selectSysPersonnelByPersonnelLoginName(loginName);
    }

    /**
     * 查询员工管理列表
     *
     * @param sysPersonnel 员工管理
     * @return 员工管理
     */
    @Override
    public List<SysPersonnel> selectSysPersonnelList(SysPersonnel sysPersonnel)
    {
        return sysPersonnelMapper.selectSysPersonnelList(sysPersonnel);
    }

    /**
     * 新增员工管理
     *
     * @param sysPersonnel 员工管理
     * @return 结果
     */
    @Override
    @Transactional
    public int insertSysPersonnel(SysPersonnel sysPersonnel)
    {
        sysPersonnel.setCreateTime(DateUtils.getNowDate());
        int rows = sysPersonnelMapper.insertSysPersonnel(sysPersonnel);
        // 新增员工岗位关联
        insertPersonnelPost(sysPersonnel);
        return rows;
    }

    @Override
    public boolean checkPersonnelLoginNameUnique(SysPersonnel sysPersonnel) {
        Long personnelId = StringUtils.isNull(sysPersonnel.getPersonnelId()) ? -1L : sysPersonnel.getPersonnelId();
        SysPersonnel info = sysPersonnelMapper.checkPersonnelLoginNameUnique(sysPersonnel.getPersonnelLoginName());
        if (StringUtils.isNotNull(info) && info.getPersonnelId().longValue() != personnelId.longValue())
        {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }

    /**
     * 重置员工密码
     *
     * @param sysPersonnel 员工信息
     * @return 结果
     */
    @Override
    public int resetPwd(SysPersonnel sysPersonnel)
    {
        return sysPersonnelMapper.updateSysPersonnel(sysPersonnel);
    }

    /**
     * 修改员工管理
     *
     * @param sysPersonnel 员工管理
     * @return 结果
     */
    @Override
    @Transactional
    public int updateSysPersonnel(SysPersonnel sysPersonnel)
    {
        Long personnelId = sysPersonnel.getPersonnelId();
        // 删除员工与岗位关联
        sysPersonnelPostMapper.deletePersonnelPostByPersonnelId(personnelId);
        // 新增用户与岗位管理
        insertPersonnelPost(sysPersonnel);
        sysPersonnel.setUpdateTime(DateUtils.getNowDate());
        return sysPersonnelMapper.updateSysPersonnel(sysPersonnel);
    }

    /**
     * 批量删除员工管理
     *
     * @param personnelIds 需要删除的员工管理主键
     * @return 结果
     */
    @Override
    @Transactional
    public int deleteSysPersonnelByPersonnelIds(Long[] personnelIds)
    {

        // 删除员工岗位关联
        sysPersonnelPostMapper.deletePersonnelPost(personnelIds);
        return sysPersonnelMapper.deleteSysPersonnelByPersonnelIds(personnelIds);
    }

    /**
     * 删除员工管理信息
     *
     * @param personnelId 员工管理主键
     * @return 结果
     */
    @Override
    @Transactional
    public int deleteSysPersonnelByPersonnelId(Long personnelId)
    {
        // 删除员工岗位管理
        sysPersonnelPostMapper.deletePersonnelPostByPersonnelId(personnelId);
        return sysPersonnelMapper.deleteSysPersonnelByPersonnelId(personnelId);
    }

    @Override
    public List<SysPersonnel> selectPersonnelAll() {
        return sysPersonnelMapper.selectPersonnelAll();
    }

    @Override
    public List<Long> selectPersonnelListByPatrolId(Long patrolId) {
        return sysPersonnelMapper.selectPersonnelListByPatrolId(patrolId);
    }

    /**
     * 新增员工岗位信息
     *
     * @param sysPersonnel 员工对象
     */
    public void insertPersonnelPost(SysPersonnel sysPersonnel)
    {
        Long[] posts = sysPersonnel.getPostIds();
        if (StringUtils.isNotEmpty(posts))
        {
            // 新增用户与岗位管理
            List<SysPersonnelPost> list = new ArrayList<SysPersonnelPost>(posts.length);
            for (Long postId : posts)
            {
                SysPersonnelPost personnelPost = new SysPersonnelPost();
                personnelPost.setPersonnelId(sysPersonnel.getPersonnelId());
                personnelPost.setPostId(postId);
                list.add(personnelPost);
            }
            sysPersonnelPostMapper.batchPersonnelPost(list);
        }
    }
}
