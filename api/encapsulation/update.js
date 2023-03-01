const sql = require('../db')
const InterfacePermissionSetting = require('../InterfacePermissionSetting')
module.exports = async function update({req, res, next},{type,changeArr,id}) {
  let permissions = await sql.query('select permissions from user where id=?', [req.auth.userId])
  if (permissions[0]['permissions'] < InterfacePermissionSetting[type]) {
    res.json({ code: 2, message: '你没有权限' })
    next()
  } else {
    let statementArr = changeArr.map(v => {
      return `${v.name}=${v.value % 1 == 0 ? v.value : "'" + v.value + "'"}`
    })
    await sql.query(`UPDATE ${type} SET ${statementArr.join()} WHERE id=${id}`).then(() => {
      res.json({ code: 0, message: '成功' })
    })
  }
}
