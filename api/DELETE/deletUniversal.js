const express = require('express')
const api = express.Router()
const Delete=require('../encapsulation/Delete')
api.delete('/:type/:id', (req, res, next) => {
  let {type,id}=req.params
  Delete({req, res, next},{type,id}).catch(e => {
      res.status(500).json({ code: 2, message: e.message })
    }).finally(() => {
      next()
    })
})
module.exports = api
