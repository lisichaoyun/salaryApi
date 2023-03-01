/*
判断两个数组的内容是否相同不包括顺序
*/
module.exports = function (arr1, arr2) {
  let flag = true
  if (arr1.length !== arr2.length) {
    flag = false
  } else {
    arr1.forEach(item => {
      if (arr2.indexOf(item) === -1) {
        flag = false
      }
    })
  }
  return flag
}
