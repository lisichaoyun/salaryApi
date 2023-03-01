const sql = require('../db')
const InterfacePermissionSetting = require('../InterfacePermissionSetting')
module.exports=async function inquire({req,res,next},{fields=['*'],type,filter=[],offset,ItemsNum}) {
    
    let permissions = await sql.query('select permissions from user where id=?', [req.auth.userId])
    if (permissions[0]['permissions'] < InterfacePermissionSetting[type]) {
      res.json({ code: 2, message: '你没有权限' })
      next()
    } else {
      let filtion=filter.map((v=>{
        return `AND ${v.name}${v.compare}${v.value%1==0?v.value:`'${v.value}'`}`
      })).join(' ')
      let number=await sql.query(`SELECT COUNT(*) FROM ${type} WHERE id>=0 ${filtion}`)
      let result = await sql.query(`SELECT ${fields.join()} FROM ${type} WHERE id>=0 ${filtion} limit ${offset},${ItemsNum}`)
      return {result:result,number:number[0]['COUNT(*)']}
    }
  }