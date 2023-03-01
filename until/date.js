const myDate = new Date((new Date).getTime() + 8*60*60*1000)
const date = myDate.toJSON().split('T').join(' ').substring(0,10)
module.exports=date//获取当前日期