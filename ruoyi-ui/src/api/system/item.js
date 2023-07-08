import request from '@/utils/request'

// 查询巡更项目列表
export function listItem(query) {
  return request({
    url: '/inspection/selectInspectionItemList',
    method: 'get',
    params: query
  })
}

// 查询巡更项目详细
// export function getItem(itemId) {
//   return request({
//     url: '/system/item/' + itemId,
//     method: 'get'
//   })
// }

// 新增巡更项目
export function addItem(data) {
  return request({
    url: '/inspection/addInspectionItem',
    method: 'post',
    data: data
  })
}

// 修改巡更项目
export function updateItem(data) {
  return request({
    url: '/inspection/editInspectionItem',
    method: 'put',
    data: data
  })
}

// 删除巡更项目
export function delItem(itemId) {
  return request({
    url: '/inspection/inspectionItem/' + itemId,
    method: 'delete'
  })
}
