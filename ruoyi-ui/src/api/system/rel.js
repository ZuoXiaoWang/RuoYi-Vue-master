import request from '@/utils/request'

// 查询巡更路线点
export function getRoutePoint(routeId) {
  return request({
    url: '/system/route/getRoutePoint/' + routeId,
    method: 'get',
  })
}

// 查询【请填写功能名称】列表
// export function listRel(query) {
//   return request({
//     url: '/system/rel/list',
//     method: 'get',
//     params: query
//   })
// }

// 查询【请填写功能名称】详细
export function getRel(irpRelId) {
  return request({
    url: '/system/rel/' + irpRelId,
    method: 'get'
  })
}

// 新增【请填写功能名称】
export function addRel(data) {
  return request({
    url: '/system/rel',
    method: 'post',
    data: data
  })
}

// 修改【请填写功能名称】
export function updateRel(data) {
  return request({
    url: '/system/rel',
    method: 'put',
    data: data
  })
}

// 删除【请填写功能名称】
export function delRel(irpRelId) {
  return request({
    url: '/system/rel/' + irpRelId,
    method: 'delete'
  })
}
