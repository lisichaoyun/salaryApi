const express = require('express')
const app = express()

const cors = require('cors')
app.use(cors({ credentials: true, origin: true }))

const cookieParser = require('cookie-parser')
const logger = require('morgan')

const { expressjwt } = require('express-jwt')
const SECRET_KEY = require('./SECRET_KEY')
app.use(
  expressjwt({ secret: SECRET_KEY, algorithms: ['HS256'] }).unless({
    path: [
      { url: '/wxlogin', method: 'POST' },
      { url: '/bindAccount', method: 'POST' },
      {url:'/login',method:'POST'},
      {url:'/register',method:'POST'},
    ],
  })
)

app.use(logger('dev'))
app.use(express.json())
app.use(express.urlencoded({ extended: false }))
app.use(cookieParser())

/*-接口添加-----------------------------------------------------------*/
app.use('/wxlogin',require('./api/login/wxlogin'))
app.use('/bindAccount',require('./api/login/bindAccount'))
app.use('/login',require('./api/login/login'))
app.use('/register',require('./api/login/register'))

app.use('/addUniversal',require('./api/POST/addUniversal'))
app.use('/deletUniversal',require('./api/DELETE/deletUniversal'))
app.use('/updateUniversal',require('./api/PATCH/updateUniversal'))
app.use('/inquireUniversal',require('./api/GET/inquireUniversal'))
app.use('/inquireUniversal',require('./api/POST/inquireUniversal'))
app.use('/getTemplateUniversal',require('./api/GET/getTemplateUniversal'))

module.exports = app
