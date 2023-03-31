import request from '@/utils/request'

// 查询巡更工单管理列表
export function listPatrolOrder(query) {
    return request({
        url: '/system/patrolOrder/list',
        method: 'get',
        params: query
    })
}

// 查询巡更工单管理详细
export function getPatrolOrder(patrolOrderId) {
    return request({
        url: '/system/patrolOrder/' + patrolOrderId,
        method: 'get'
    })
}

// 新增巡更工单管理
export function addPatrolOrder(data) {
    return request({
        url: '/system/patrolOrder',
        method: 'post',
        data: data
    })
}

// 修改巡更工单管理
export function updatePatrolOrder(data) {
    return request({
        url: '/system/patrolOrder',
        method: 'put',
        data: data
    })
}

// 删除巡更工单管理
export function delPatrolOrder(patrolOrderId) {
    return request({
        url: '/system/patrolOrder/' + patrolOrderId,
        method: 'delete'
    })
}
