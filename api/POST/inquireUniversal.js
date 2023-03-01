const express = require('express')
const api = express.Router()
const inquire=require('../encapsulation/inquire')
api.post('/', (req, res, next) => {
  //以下为可选参数
  /*filter=[{name:'',value:number||string,compare:''}]
  fields=['*']
  */
 
  let {fields,type,filter,offset,ItemsNum}=req.body

  inquire({req,res,next},{fields,type,filter,offset,ItemsNum}).then(result=>{
    res.json({ code: 0, message: result.result, number: result.number })
  }).catch(e => {
      res.status(503).json({ code: 1, message: e.message })
  }).finally(() => {
      next()
  })
})
module.exports = api
