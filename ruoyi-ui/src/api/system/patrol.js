import request from '@/utils/request'
import {parseStrEmpty} from "@/utils/ruoyi";

// 查询巡更任务管理列表
export function listPatrol(query) {
  return request({
    url: '/system/patrol/list', method: 'get', params: query
  })
}

// 查询巡更任务管理详细
export function getPatrol(patrolId) {
  return request({
    url: '/system/patrol/' + parseStrEmpty(patrolId), method: 'get'
  })
}

//查询任务模板
export function getPatrolTemplate(patrolId) {
  return request({
    url: '/system/patrol/patrolTemplate/' + patrolId, method: 'get'
  })
}

//查询统计数据
export function getCount() {
  return request({
    url: '/system/patrol/getCount', method: 'get'
  })
}

// 新增巡更任务管理
export function addPatrol(data) {
  return request({
    url: '/system/patrol', method: 'post', data: data
  })
}

//新增巡更任务模板
export function addPatrolTemplate(data) {
  return request({
    url: '/system/patrol/template', method: 'post', data
  })
}

// 修改巡更任务管理

export function updatePatrol(data) {
  return request({
    url: '/system/patrol', method: 'put', data: data
  })
}

// 删除巡更任务管理
export function delPatrol(patrolId) {
  return request({
    url: '/system/patrol/' + patrolId, method: 'delete'
  })
}

// 巡更点已巡和未巡信息
export function getPotinStatusByPatrolId(patrolId) {
  return request({
    url: 'system/patrol/getPotinStatusByPatrolId/' + patrolId, method: "get"
  })
}
