const express = require('express')
const api = express.Router()
const sql = require('../db')
const InterfacePermissionSetting = require('../InterfacePermissionSetting')
api.get('/', (req, res, next) => {
  /*
  参数type
  */
  async function run() {
    let permissions = await sql.query('select permissions from user where id=?', [req.auth.userId])
    if (permissions[0]['permissions'] < InterfacePermissionSetting[req.query.type]) {
      res.json({ code: 2, message: '你没有权限' })
      next()
    } else {
      await sql
        .query("SELECT COLUMN_NAME FROM information_schema. COLUMNS WHERE TABLE_SCHEMA = 'payrollmanagementsystem' AND TABLE_NAME = ?",[req.query.type])
        .then(result => {
          res.json({ code: 0, message: result })
        })
    }
  }
  run()
    .catch(e => {
      res.status(500).json({ code: 1, message: e.message })
    })
    .finally(() => {
      next()
    })
})

module.exports = api
// [
//   {name:'基本工资',value:5000},
//   {name:'效绩奖金',value:3000},
//   {name:'全勤工资',value:1000},
//   {name:'迟到扣款',value:200},
//   {name:'请假扣款',value:200}
// ]