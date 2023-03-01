const express = require('express')
const api = express.Router()
const sql = require('../db')
const jsonWebToken =require('jsonwebtoken')
const SECRET_KEY=require('../../SECRET_KEY')
api.post('/',(req,res,next)=>{
let username=req.body.username
let password=req.body.password
let openid=req.body.openid
async function bindAccount(){

let correPassword=await sql.query('SELECT `user`.`password`,COUNT(`password`),`user`.id,user.permissions FROM `user` WHERE username=?',[username])
if(correPassword[0]['COUNT(`password`)']<1){
res.json({code:2,message:'账号不存在'})
}else if(correPassword[0]['password']!=password){
res.json({code:2,message:'密码错误'})
}else{
sql.query('UPDATE user SET wxOpenID=? WHERE id=?',[openid,correPassword[0].id]).then(()=>{
    let token=jsonWebToken.sign({userId:correPassword[0].id},SECRET_KEY,{expiresIn:60*60*24*3})
    res.json({code:0,message:'绑定成功',token:token,expired:Date.now()+60*60*24*3*1000,permissions:correPassword[0]['permissions']})
}).catch(e=>{
    res.status(503).json({code:1,message:e.message})
}).finally(()=>{
    next()
})
}
}
bindAccount().catch(e=>{
    res.status(503).json({code:1,message:e.message})
})
})

module.exports=api