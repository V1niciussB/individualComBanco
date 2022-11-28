var database = require("../database/config")

function listar() {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
    var instrucao = `
        SELECT * FROM usuario;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function entrar(email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", email, senha)
    var instrucao = `
        SELECT * FROM nadador WHERE email = '${email}' AND senha = '${senha}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

// Coloque os mesmos parâmetros aqui. Vá para a var instrucao
function cadastrar(nome, email, cpf, dtNasc, telefone, senha, modalidade, categoria, fkComp) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", nome, email, cpf, dtNasc, telefone, senha, categoria, modalidade, fkComp);

    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucao = `
        INSERT INTO nadador (nome, email, cpf, dtNasc, telefone, senha, categoria, fkModalidade, fkCompeticao) VALUES ('${nome}', '${email}', '${cpf}', '${dtNasc}', '${telefone}', '${senha}',  '${categoria}', ${modalidade}, ${fkComp});
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);

}

// Idade nadadores
function selectComp(filtro){
    var instrucao = `
    SELECT idNadador, nome, descricao as Modalidade, categoria, DATE(dataH) as "Data", TIME (dataH) as "Hora" FROM nadador
    JOIN modalidade ON idModalidade = fkModalidade
    JOIN competicao ON idComp = fkCompeticao
    ORDER BY ${filtro == undefined ? "idNadador" : filtro}`

    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}



module.exports = {
    entrar,
    cadastrar,
    listar,
    selectComp
};