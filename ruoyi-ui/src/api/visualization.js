import request from '@/utils/request'

// 查询区域列表
export function regionList() {
    return request({
        url: '/ui/regionList',
        method: 'get',
    })
}

// 当前区域巡更任务列表
export function patrolList() {
    return request({
        url: '/ui/patrolList',
        method: 'get',
    })
}

// 获取巡更任务详情
export function patrolInfo(data) {
    return request({
        url: '/ui/patrol',
        method: 'post',
        data: data
    })
}

// 获取报修数量
export function countRepairFrom() {
    return request({
        url: '/ui/countRepairFrom',
        method: 'get',
    })
}

// 获取维修完成数量
export function countCompleteRepair() {
    return request({
        url: '/ui/countCompleteRepair',
        method: 'get',
    })
}

// 获取报修列表
export function repairList() {
    return request({
        url: '/ui/repairList',
        method: 'get',
    })
}

// 获取前一周每一天的报修和维修数量
export function countLastWeekRepairAndFrom() {
    return request({
        url: '/ui/countLastWeekRepairAndFrom',
        method: 'get',
    })
}

// 巡更计划完成排行(前十)
export function getPersonnelWithQuantity() {
    return request({
        url: '/ui/getPersonnelWithQuantity',
        method: 'get',
    })
}

// 巡更点列表
export function getPointsList() {
    return request({
        url: '/ui/getPointsList',
        method: 'get',
    })
}

// 获取七日巡更任务完成量
export function getEverydayComplete() {
    return request({
        url: '/ui/getEverydayComplete',
        method: 'get',
    })
}

//获取当前任务的所有已巡和未巡点
export function getPotinStatusByPatrolId(data) {
    return request({
        url: '/ui/getPotinStatusByPatrolId',
        method: 'post',
        data: data
    })
}

export function regionId(data) {
    return request({
        url: '/ui/regionId',
        method: 'post',
        data: data
    })
}
