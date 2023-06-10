import request from '@/utils/request'

// 查询评价单列表
export function listEvaluate(query) {
  return request({
    url: '/system/evaluate/list',
    method: 'get',
    params: query
  })
}

// 查询评价单详细
export function getEvaluate(
evaluateId) {
  return request({
    url: '/system/evaluate/' + 
evaluateId,
    method: 'get'
  })
}

// 新增评价单
export function addEvaluate(data) {
  return request({
    url: '/system/evaluate',
    method: 'post',
    data: data
  })
}

// 修改评价单
export function updateEvaluate(data) {
  return request({
    url: '/system/evaluate',
    method: 'put',
    data: data
  })
}

// 删除评价单
export function delEvaluate(
evaluateId) {
  return request({
    url: '/system/evaluate/' + 
evaluateId,
    method: 'delete'
  })
}
