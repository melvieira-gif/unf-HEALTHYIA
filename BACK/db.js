const mysql = require('mysql2/promise') 
//pool de conexão
//a variavel pool vai chamar o mysql
const pool =  mysql.createPool({
    //criar as configurações do Banco de dados
    //o host é endereço do banco de dados
    host:"localhost",
    user:"root",
    password:"",
    port:3306,
    database:'healthyIA',
    waitForConnections:true, //quando atinge o limite de pessoas entrando no bd, tem que esepera para ser o proximo
    connectionLimit:10 //numero de pessoas conectados ni banco 
})

module.exports = pool