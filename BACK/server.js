const express = require("express")
const app = express()
const porta = 3000
const cors = require('cors')
const mysql = require('mysql2/promise')
const conexao = require('./db.js')
// Importando biblioteca de hash e salt
const bcrypt = require('bcrypt');
app.use(express.json())
app.use(cors())

// FALE CONOSOCO
app.post("/contato", async (req,res)=>{
    try {

        const{nome, email, assunto, mensagem} = req.body
      
        // tratativas para ver se esta tudo correto
        if(assunto==""){
            return res.json({resposta: "Preencha um assunto"})
        }else if(email.length <6){
            return res.json({resposta: "Preencha o email"})
        }else if(nome.length <6){
            return res.json({resposta: "Preencha o seu nome completo"})
        }else if(mensagem.length <11){
            return res.json({resposta: "Preencha o que o nosso site pode melhorar"})
        }

        // montando um mysql para inserir informaçoes na tabela 
        let sql = `INSERT INTO faleconosco (nome, email, assunto, mensagem) VALUES (?,?,?,?)`
        let [resul2] = await conexao.query(sql,[nome, email, assunto, mensagem])

        // para ve se houve mensagem ou não, 
        if(resul2.affectedRows == 1){
            return res.json({resposta :"Mensagem feita com sucesso"})
        }else{
            return res.json({resposta: "Erro ao fazer a mensagem"})
        }        

    } catch (error) {
       console.log(error) 
    }
})


//SENHA
app.get("/hash", async (req,res)=>{
    try {
        let {senha} = req.body
        senha = senha.trim()
        senha = senha.replace(("ㅤ", ""))

        if(senha==""){
            return res.send("Preencha uma senha ")
        }else if(senha.length < 6){
            return res.send("A senha tem que conter menos")
        }


        const hash = crypto.createHash("sha256").update(senha).digest("hex")
        res.send(` Usuario cadastrado com Sucesso ${hash} `)
        

    } catch (error) {
       console.log(`O seu erro foi ${error}`) 
    }
})

app.post("/cadastro_login", async (req,res)=>{
  try {
     // garante que todos os campos existem
    const {
        nome_compl_user = "",
        email_user = "",
        dt_nasc_user = "",
        senha_user = ""
        } = req.body || {};
    
    const senhaTrim = senha_user.trim().replace("ㅤ", "");
                    
    // tratativas para ver se esta tudo correto
    if (senhaTrim === ""){
        return res.json({
            "resposta": "Preencha uma senha"
        })
    } 
    if (senhaTrim.length < 6){
        return res.json({"resposta": "A senha tem que conter menos"});
    }
    if (email_user.length < 6){
        return res.json({"resposta": "Preencha o email"});
    }
    if (nome_compl_user.length < 6){
        return res.json({"resposta": "Preencha o seu nome completo"});
    }
    if (dt_nasc_user.length < 6){
        return res.json({"resposta": "Prencha a data **/**/****"});
    }
    
    // verificar email existente
    const sqlSelect = `SELECT * FROM cadastro WHERE email_user = ?`;
    const [rows] = await conexao.query(sqlSelect, [email_user]);
    
    if (rows.length !== 0){
        return res.json({"resposta":"Email já esta cadastrado! Tente novamente"});
    }
    
    // criar hash da senha
        const crypto = require("crypto");
        const hash = crypto.createHash("sha256").update(senhaTrim).digest("hex");
    
        // inserir novo usuário
        const sqlInsert = `INSERT INTO cadastro (nome_compl_user, email_user, dt_nasc_user, senha_user) VALUES (?,?,?,?)`;
        const [resul2] = await conexao.query(sqlInsert, [nome_compl_user, email_user, dt_nasc_user, hash]);
    
        if (resul2.affectedRows === 1){
            return res.json({"resposta":"Cadastro feito com sucesso!"});
        } 
            
        return res.json({"resposta":"Erro ao fazer o cadastro"});  
    
    } catch (error) {
        console.log(error)
        return res.json({erro: "Erro interno no servidor"});
    }
   
})

app.post("/login", async (req, res) => {
    try {
        const { email_user, senha_user } = req.body;

        const email_userTrim= email_user?.trim();
        const senha_userTrim= senha_user?.trim();

        //Select para fazer a verificação do meu cadastro, para fazer login
        let sql = `SELECT * FROM cadastro WHERE email_user=?`;
        const [resultado] = await conexao.query(sql, [email_userTrim]);

        if (resultado.length == 0) {
            return res.json({
                "resposta":"Email não cadastrado"
            })
        }
        
        const hasdoBanco = resultado[0].senha_user;


        const crypto = require("crypto");
        const hash = crypto.createHash("sha256").update(senha_userTrim).digest("hex");

        
        if (hash==hasdoBanco) {
            return res.json({
                "resposta":"Login feito com sucesso"
            })
        } else {
            return res.json({
                "resposta":"Seu email ou senha estão incorretos, tente novamente"
            })
        }


    } catch (error) {
        console.log(`O erro foi ${error}`);
    }
});

app.post("/vaga", async (req,res) =>{
    try {
        const { nome_compl, email, qual_vaga } = req.body

        let sql = `INSERT INTO vagas (nome_compl, email, qual_vaga) VALUES (?,?,?)`
        let [resuVAGA] = await conexao.query(sql,[nome_compl, email, qual_vaga])

        // para ve se houve mensagem ou não, 
        if(resuVAGA.affectedRows == 1){
            return res.json({resposta:"Mensagem feita com sucesso"})
        }else{
            return res.json({resposta:"Erro ao cadastrar"})
        }   
        
    } catch (error) {
        console.log(error)
        return res.json({ resposta: "Erro no servidor" })
    }
})

app.listen(porta,()=>{
    console.log("servidor rodando")
})