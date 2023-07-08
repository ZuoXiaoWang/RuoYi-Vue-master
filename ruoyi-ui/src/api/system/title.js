import request from '@/utils/request'

// 查询题目列表
export function listTitle(query) {
  return request({
    url: '/inspection/selectInspectionItemTitleList',
    method: 'get',
    params: query
  })
}

// 查询题目详细
export function getTitle(titleId) {
  return request({
    url: '/inspection/getValueByItemId/' + titleId,
    method: 'get'
  })
}

// 新增题目
export function addTitle(data) {
  return request({
    url: '/inspection/addInspectionItemTitle',
    method: 'post',
    data: data
  })
}

// 修改题目
export function updateTitle(data) {
  return request({
    url: '/inspection/editInspectionItemTitle',
    method: 'put',
    data: data
  })
}

// 删除题目
export function delTitle(titleId) {
  return request({
    url: '/inspection/inspectionItemTitle/' + titleId,
    method: 'delete'
  })
}
