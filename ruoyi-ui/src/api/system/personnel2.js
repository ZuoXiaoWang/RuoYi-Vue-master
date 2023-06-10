import request from '@/utils/request'
import {parseStrEmpty} from "@/utils/ruoyi";

// 查询员工管理列表
export function selectRepairPersonnelAll(query) {
  return request({
    url: '/system/newRepair/selectOwnerPersonnelAll',
    method: 'get',
    params: query
  })
}

// 查询员工管理详细
export function getPersonnel(personnelId) {
  return request({
    url: '/system/personnel/' + parseStrEmpty(personnelId),
    method: 'get'
  })
}

// 新增员工管理
export function addPersonnel(data) {
  return request({
    url: '/system/personnel',
    method: 'post',
    data: data
  })
}

// 修改员工管理
export function updatePersonnel(data) {
  return request({
    url: '/system/personnel',
    method: 'put',
    data: data
  })
}

// 删除员工管理
export function delPersonnel(personnelId) {
  return request({
    url: '/system/personnel/' + personnelId,
    method: 'delete'
  })
}

//员工密码重置
export function resetPersonnelPwd(personnelId, personnelPassword) {
  const data = {
    personnelId,
    personnelPassword
  }
  return request({
    url: '/system/personnel/resetPwd',
    method: 'put',
    data: data
  })
}
