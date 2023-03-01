const sql=require('../db')
module.exports.get=async function(){
    return await sql.query('SELECT * FROM beforesettlementkey')
}