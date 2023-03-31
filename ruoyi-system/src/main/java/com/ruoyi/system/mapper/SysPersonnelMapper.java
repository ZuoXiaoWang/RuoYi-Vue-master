package com.ruoyi.system.mapper;

import java.util.List;

import com.ruoyi.common.core.domain.entity.SysPersonnel;

/**
 * 员工管理Mapper接口
 *
 * @author lile
 * @date 2023-03-27
 */
public interface SysPersonnelMapper {
    /**
     * 查询员工管理
     *
     * @param personnelId 员工管理主键
     * @return 员工管理
     */
    public SysPersonnel selectSysPersonnelByPersonnelId(Long personnelId);

    public SysPersonnel selectSysPersonnelByPersonnelLoginName(String loginName);

    /**
     * 查询员工管理列表
     *
     * @param sysPersonnel 员工管理
     * @return 员工管理集合
     */
    public List<SysPersonnel> selectSysPersonnelList(SysPersonnel sysPersonnel);

    /**
     * 新增员工管理
     *
     * @param sysPersonnel 员工管理
     * @return 结果
     */
    public int insertSysPersonnel(SysPersonnel sysPersonnel);

    /**
     * 校验员工名称是否唯一
     *
     * @param sysPersonnelLoginName 员工名称
     * @return 结果
     */
    public SysPersonnel checkPersonnelLoginNameUnique(String sysPersonnelLoginName);

    /**
     * 修改员工管理
     *
     * @param sysPersonnel 员工管理
     * @return 结果
     */
    public int updateSysPersonnel(SysPersonnel sysPersonnel);

    /**
     * 删除员工管理
     *
     * @param personnelId 员工管理主键
     * @return 结果
     */
    public int deleteSysPersonnelByPersonnelId(Long personnelId);

    /**
     * 批量删除员工管理
     *
     * @param personnelIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysPersonnelByPersonnelIds(Long[] personnelIds);

    public List<SysPersonnel> selectPersonnelAll();

    public List<Long> selectPersonnelListByPatrolId(Long patrolId);

    public List<Long> selectPersonnelListByRepairId(Long repairId);
}
