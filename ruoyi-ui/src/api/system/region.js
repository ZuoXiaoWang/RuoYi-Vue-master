import request from '@/utils/request'

// 查询区域管理列表
export function listRegion(query) {
  return request({
    url: '/system/region/list',
    method: 'get',
    params: query
  })
}

export function listRegionAll(query) {
  return request({
    url: '/app/listAll',
    method: 'get',
    params: query
  })
}

// 查询区域管理详细
export function getRegion(regionId) {
  return request({
    url: '/system/region/' + regionId,
    method: 'get'
  })
}

// 新增区域管理
export function addRegion(data) {
  return request({
    url: '/system/region',
    method: 'post',
    data: data
  })
}

// 修改区域管理
export function updateRegion(data) {
  return request({
    url: '/system/region',
    method: 'put',
    data: data
  })
}

// 删除区域管理
export function delRegion(regionId) {
  return request({
    url: '/system/region/' + regionId,
    method: 'delete'
  })
}

// 添加用户列表绑定到区域

export function addRegionWithUser(data) {
  return request({
    url: '/system/region/addRegionWithUser',
    method: 'post',
    data: data
  })
}

//管理员回查
export function getRegionUserByRegionId(regionId) {
  return request({
    url: '/system/region/getRegionUserByRegionId/' + regionId,
    method: 'get',
  })
}
