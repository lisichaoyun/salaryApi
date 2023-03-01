const express = require('express')
const api = express.Router()
const sql = require('../db')
const jsonWebToken = require('jsonwebtoken')
const SECRET_KEY = require('../../SECRET_KEY')
const date = require('../../until/date')
api.post('/', (req, res, next) => {
  let username = req.body.username
  let password = req.body.password
  let name = req.body.name
  let gender = req.body.gender
  let RegisterTime = date
  let birthday = req.body.birthday
  let identify=req.body.identify

  
  let permissions=null
  if(identify=='Administrator'){
    permissions=3
  }else if(identify=='PersonnelSpecialist'){
    permissions=2
  }else if(identify=='FinanceProfessional'){
    permissions=1
  }else if(identify=='GeneralUser'){
    permissions=0
  }else{
    res.status(500).json({code:1,messaeg:'参数错误'})
    next()
  }
  sql
    .query(
      'INSERT INTO `user`(username,password,name,gender,RegisterTime,birthday,permissions) VALUES(?,?,?,?,?,?,?)',
      [username, password, name, gender,RegisterTime,birthday,permissions]
    )
    .then(result => {
      let token = jsonWebToken.sign({ userId: result.insertId }, SECRET_KEY, {
        expiresIn: 60 * 60 * 24 * 3,
      })
      res.json({
        code: 0,
        message: '注册成功',
        token: token,
        expired: Date.now() + 60 * 60 * 24 * 3 * 1000,
      })
    })
    .catch(e => {
      res.status(500).json({ code: 1, messaeg: e.messaeg })
    })
    .finally(() => {
      next()
    })
})

module.exports = api
