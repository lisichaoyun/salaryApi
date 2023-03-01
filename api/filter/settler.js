const sql=require('../db')
const datetime=require('../../until/datetime')
module.exports=async function (data) {
    let foundamouts = await sql.query('SELECT name,tax_public,tax_private FROM foundamout')
    
    const BeforeSettlementKey=await require('../config/BeforeSettlementKey').get()//异步解析配置

    let BeforeSettlementKeyAddition=BeforeSettlementKey.filter(v=>v.handle=='+').map(v=>v.name)
    let BeforeSettlementKeySubtraction=BeforeSettlementKey.filter(v=>v.handle=='-').map(v=>v.name)
    
    let BeforeSettlement=eval(`${data.map(v=>{
        if(BeforeSettlementKeyAddition.includes(v.name)){
            return v.value
        }
    }).filter(v=>v!==undefined).join('+')}-${data.map(v=>{
        if(BeforeSettlementKeySubtraction.includes(v.name)){
            return v.value
        }
    }).filter(v=>v!==undefined).join('-')
    }`)
    
    let foundamoutAccountPri=foundamouts.map(v=>{//五险一金个人交税明细
        return {name:v.name,value:BeforeSettlement*(v.tax_private/100)}
    })
    let foundamoutAccountPriAccount=eval(foundamoutAccountPri.map(v=>v.value).join('+'))

    let foundamoutAccountPub=foundamouts.map(v=>{//五险一金公司缴纳明细
        return {name:v.name,value:BeforeSettlement*(v.tax_public/100)}
    })
    let afterAccount=eval(`${BeforeSettlement}-${foundamoutAccountPriAccount}`)//税前工资
    
    let taxs=await sql.query(`SELECT * FROM individualincometax WHERE threshold<=${afterAccount} ORDER BY level ASC`)

    let firstThreshold
    let firstTax
    let lastThreshold
    let lastTax
    
    if(taxs.length===1){
        let a=taxs[taxs.length-1].threshold
        let b=(taxs[taxs.length-1].tax)/100
        firstThreshold=a
        firstTax=b
        lastThreshold=a
        lastTax=b
    }else if(taxs.length===0){
        throw new Error('系统配置查询错误')
    }else{
    /*上一级部分*/
        firstThreshold=taxs[taxs.length-1-1].threshold
        firstTax=(taxs[taxs.length-1-1].tax)/100

        /*多出下一级部分*/
        lastThreshold=taxs[taxs.length-1].threshold
        lastTax=(taxs[taxs.length-1].tax)/100
    }
    
    /*最小起征工资*/
    let minimumWage=Math.min(taxs.map(v=>v.threshold))
    /*速扣除数 */
    let speedDeduction=afterAccount*lastTax-(firstThreshold*firstTax+(afterAccount-firstThreshold)*lastTax)

    let taxAccount=(afterAccount-minimumWage)*lastTax-speedDeduction

    let result=[{name:'五险一金',value:foundamoutAccountPriAccount},{name:'个税扣款',value:taxAccount},{name:'最终工资',value:afterAccount-foundamoutAccountPriAccount-taxAccount},{name:'创建时间',value:datetime}]
    
    return result.concat(data)
}