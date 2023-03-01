const express=require('express')
const api = express.Router()
const insert=require('../encapsulation/insert')
const settler=require('../filter/settler')

api.post('/', async function (req, res, next) {

  const BeforeSettlementKey=await require('../config/BeforeSettlementKey').get()//异步解析配置

  /*
  data=[{name:'',value:''}]
  */
 
  let { type, data } = req.body

  if (type == 'salaryinquiry') {
    //解析判断data必要参数
    if(data.every(v=>{
      return BeforeSettlementKey.includes(v.name)
    })){
      res.json({code:1,message:'请检查data参数的完整性'})
      next()
    }

    //设置工资表特殊处理函数
    await settler(data).then(result => {
      data = result
    }).catch(e => {
      res.status(500).json({ code: 2, message: e.message })
      next()
    })
  }
  

  insert({ req, res, next }, { type, data }).then(result => {
      res.json({code:0,message:`工资添加成功id为${result.insertId}`})
    }).catch(e => {
      res.status(500).json({ code: 3, message: e.message })
    }).finally(() => {
      next()
    })
})

module.exports=api
