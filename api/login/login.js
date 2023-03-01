const express = require('express')
const api = express.Router()
const sql = require('../db')
const jsonWebToken =require('jsonwebtoken')
const SECRET_KEY=require('../../SECRET_KEY')
api.post('/', (req, res, next) => {
  let username=req.body.username
  let password=req.body.password
  sql.query('SELECT `user`.`password`,COUNT(*),`user`.id FROM `user` WHERE `user`.username=?',[username]).then(result=>{
    if(result[0]['COUNT(*)']==0){
      res.json({code:2,message:'账号不存在'})
    }else if(result[0]['password']!=password){
      res.json({code:2,message:'密码错误'})
    }else{
      let token=jsonWebToken.sign({userId:result[0]['id']},SECRET_KEY,{expiresIn:60*60*24*3})
      res.json({code:0,message:'登录成功',token:token,expired:(Date.now()+60*60*24*3*1000)})
    }
  }).catch(e=>{
    res.status(500).json({code:1,message:e.message})
  }).finally(()=>{
    next()
  })
})

module.exports = api
