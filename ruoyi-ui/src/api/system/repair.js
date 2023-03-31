import request from '@/utils/request'
import {parseStrEmpty} from "@/utils/ruoyi";

// 查询维修任务列表
export function listRepair(query) {
  return request({
    url: '/system/repair/list',
    method: 'get',
    params: query
  })
}

// 查询维修任务详细
export function getRepair(repairId) {
  return request({
    url: '/system/repair/' + parseStrEmpty(repairId),
    method: 'get'
  })
}

// 新增维修任务
export function addRepair(data) {
  return request({
    url: '/system/repair',
    method: 'post',
    data: data
  })
}

// 修改维修任务
export function updateRepair(data) {
  return request({
    url: '/system/repair',
    method: 'put',
    data: data
  })
}

// 删除维修任务
export function delRepair(repairId) {
  return request({
    url: '/system/repair/' + repairId,
    method: 'delete'
  })
}
