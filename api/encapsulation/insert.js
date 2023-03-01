const sql = require('../db')
const InterfacePermissionSetting = require('../InterfacePermissionSetting')
module.exports = async function insert({ req, res, next }, { type, data }) {
  let permissions = await sql.query('select permissions from user where id=?', [req.auth.userId])
  if (permissions[0]['permissions'] < InterfacePermissionSetting[type]) {
    res.json({ code: 2, message: '你没有权限' })
    next()
  } else {
    return await sql.query(`INSERT INTO ${type}(${data.map(v => v.name).join(',')}) VALUES(${data.map(v => {
      if(v.value%1!==0){
        return `'${v.value}'`
      }else{
        return v.value
      }
    }).join(',')})`)
  }
}
