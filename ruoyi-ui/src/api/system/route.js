import request from '@/utils/request'

// 查询巡更路线列表
export function listRoute(query) {
  return request({
    url: '/system/route/routeList',
    method: 'get',
    params: query
  })
}

// 新增巡更路线
export function addRoute(data) {
  return request({
    url: '/system/route/insertInspectionRoute',
    method: 'post',
    data: data
  })
}

// 修改巡更路线
export function updateRoute(data) {
  return request({
    url: '/system/route/updateInspectionRoute',
    method: 'put',
    data: data
  })
}

// 删除巡更路线
export function delRoute(inspectionRouteId) {
  return request({
    url: '/system/route/' + inspectionRouteId,
    method: 'delete'
  })
}

//单击修改查询详情
export function getRoute(routeId) {
  return request({
    url: '/system/route/getRoute/' + routeId,
    method: 'get'
  })
}