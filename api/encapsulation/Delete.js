const sql = require('../db')
const InterfacePermissionSetting = require('../InterfacePermissionSetting')
module.exports=async function Delete({req, res, next},{type,id}){
    let permissions = await sql.query('select permissions from user where id=?', [req.auth.userId])
    if (permissions[0]['permissions'] < InterfacePermissionSetting[type]) {
      res.json({ code: 2, message: '你没有权限' })
      next()
    } else {
      await sql.query(`DELETE FROM ${type} where id=?`, [id]).then(() => {
        res.json({ code: 0, message: '成功' })
      })
    }
}