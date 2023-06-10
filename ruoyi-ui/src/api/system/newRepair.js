import request from '@/utils/request'

// 查询维修单列表
export function listNewRepair(query) {
  return request({
    url: '/system/newRepair/list',
    method: 'get',
    params: query
  })
}

// 查询维修单详细
export function getNewRepair(newRepairId) {
  return request({
    url: '/system/newRepair/' + newRepairId,
    method: 'get'
  })
}

// 新增维修单
export function addNewRepair(data) {
  return request({
    url: '/system/newRepair',
    method: 'post',
    data: data
  })
}

// 修改维修单
export function updateNewRepair(data) {
  return request({
    url: '/system/newRepair',
    method: 'put',
    data: data
  })
}

// 删除维修单
export function delNewRepair(newRepairId) {
  return request({
    url: '/system/newRepair/' + newRepairId,
    method: 'delete'
  })
}


//查询维修人员列表
export function selectRepairPersonnelAll() {
  return request({
    url: '/system/newRepair/selectRepairPersonnelAll',
    method: 'get'
  })
}