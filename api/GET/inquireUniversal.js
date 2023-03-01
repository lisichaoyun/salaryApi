const express = require('express')
const api = express.Router()
const inquire= require('../encapsulation/inquire')
api.get('/', (req, res, next) => {
  //以下为可选参数
  /*
  fields=['*']
  */
 
  let {fields,type,offset,ItemsNum}=req.query
  if(fields!==undefined){
    fields=JSON.parse(fields)
  }else{
    fields=['*']
  }
  inquire({req,res,next},{fields,type,offset,ItemsNum}).then(result=>{
    res.json({code:0,message:result.result,number:result.number})
  }).catch(e => {
      res.status(503).json({ code: 1, message: e.message })
  }).finally(() => {
      next()
  })
})
module.exports = api
