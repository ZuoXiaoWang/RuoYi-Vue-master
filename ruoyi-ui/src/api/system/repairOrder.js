import request from '@/utils/request'

// 查询维修工单列表
export function listRepairOrder(query) {
  return request({
    url: '/system/repairOrder/list',
    method: 'get',
    params: query
  })
}

// 查询维修工单详细
export function getRepairOrder(repairOrderId) {
  return request({
    url: '/system/repairOrder/' + repairOrderId,
    method: 'get'
  })
}

export function createRepair(repairOrderId) {
  return request({
    url: '/system/repairOrder/createRepair/' + repairOrderId,
    method: 'get'
  })
}

// 新增维修工单
export function addRepairOrder(data) {
  return request({
    url: '/system/repairOrder',
    method: 'post',
    data: data
  })
}

// 修改维修工单
export function updateRepairOrder(data) {
  return request({
    url: '/system/repairOrder',
    method: 'put',
    data: data
  })
}

// 删除维修工单
export function delRepairOrder(repairOrderId) {
  return request({
    url: '/system/repairOrder/' + repairOrderId,
    method: 'delete'
  })
}
