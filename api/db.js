const mysql = require('mysql')
const pool = mysql.createPool({
  host: 'localhost',
  port: '3306',
  user: 'root',
  password: 'lisichaoyun@163.com',
  database: 'payrollmanagementsystem',
  // multipleStatements: true//允许多条查询语句默认关闭
})

module.exports.query = (sqlStatement, sqlParameter) => {
  return new Promise((resolve, reject) => {
    pool.getConnection((err, connection) => {
      if (err) {
        reject(new Error('数据库连接错误'))
        return
      }
      connection.query(sqlStatement, sqlParameter, (err, result) => {
        if (err) {
          reject(err)
          return
        }
        resolve(result)
        connection.release() //释放到连接池
      })
    })
  })
}

//增'INSERT INTO websites(Id,name,url,alexa,country) VALUES(0,?,?,?,?)'
//删'DELETE FROM websites where id=6'
//改'UPDATE websites SET name = ?,url = ? WHERE Id = ?'
//查'SELECT * FROM websites'
//关闭连接connection.end()有回调