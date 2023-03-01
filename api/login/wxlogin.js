const express = require('express')
const api = express.Router()
const sql = require('../db')
const https = require('https')
const jsonWebToken =require('jsonwebtoken')
const SECRET_KEY=require('../../SECRET_KEY')
api.post('/', (req, res, next) => {
    let appid='wxb5ece1acdf271c4c'
    let secret='354c809097037368c70c13eaeced4ba8'
    let js_code=req.body.code
    let grant_type='authorization_code'
    let data=''
  https
    .get('https://api.weixin.qq.com/sns/jscode2session?appid='+appid+'&secret='+secret+'&js_code='+js_code+'&grant_type='+grant_type, response => {
      response.on('data', chunk => {
        data+=chunk
      })
      response.on('end', () => {
        data=JSON.parse(data)
        //session_key: "S3dNe72IiwkWbLLuGdEjIg==", openid: "oEBFhwlhyCiHT-MPyaBaEAObLnM8"
        sql.query('SELECT user.id,user.permissions FROM user WHERE user.wxOpenID=?',[data.openid]).then(result=>{
            if(result.length==0){
                //如果不存在则提示绑定
                res.json({code:2,message:'请使用微信号绑定账号',data:data})
            }else{
                let token=jsonWebToken.sign({userId:result[0]['id']},SECRET_KEY,{expiresIn:60*60*24*3})
                res.json({code:0,message:{token:token,expired:(Date.now()+60*60*24*3*1000),permissions:result[0]['permissions']}})
            }
        }).catch(e=>{
            res.status(503).json({code:1,message:e.message})
        }).finally(()=>{
          next()
        })
      })
    })
    .on('error', e => {
        res.status(503).json({code:1,message:e.message})
        next()
    })
})
module.exports = api
