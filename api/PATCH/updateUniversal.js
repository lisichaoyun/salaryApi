const express = require('express')
const api = express.Router()
const update=require('../encapsulation/update')
api.patch('/', (req, res, next) => {
  /*
  changeArr=[{name:'',value:''}]
  */
  let {type,changeArr,id}=req.body
  update({req, res, next},{type,changeArr,id}).catch(e => {
    res.status(500).json({ code: 2, message: e.message })
  }).finally(()=>{
    next()
  })
})
module.exports = api
