import request from '@/utils/request'

// 查询报修单列表
export function listNewRepairFrom(query) {
  return request({
    url: '/system/newRepairFrom/list',
    method: 'get',
    params: query
  })
}

// 查询报修单详细
export function getNewRepairFrom(repairFromId) {
  return request({
    url: '/system/newRepairFrom/' + repairFromId,
    method: 'get'
  })
}

// 新增报修单
export function addNewRepairFrom(data) {
  return request({
    url: '/system/newRepairFrom',
    method: 'post',
    data: data
  })
}

// 修改报修单
export function updateNewRepairFrom(data) {
  return request({
    url: '/system/newRepairFrom',
    method: 'put',
    data: data
  })
}

// 删除报修单
export function delNewRepairFrom(repairFromId) {
  return request({
    url: '/system/newRepairFrom/' + repairFromId,
    method: 'delete'
  })
}

//派单
export function pickUpRepairFrom(repairFromId,userId) {
  return request({
    url: '/system/newRepairFrom/pickUpRepairFrom/' + repairFromId + '/' + userId,
    method: 'post'
  })
}