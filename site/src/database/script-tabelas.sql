-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql - banco local - ambiente de desenvolvimento
*/

CREATE DATABASE sharkAcademy;

USE sharkAcademy;

CREATE TABLE competicao (
	idComp int primary key,
    dataH datetime,
    localComp varchar(60)
);

CREATE TABLE modalidade (
	idModalidade int primary key,
    descricao varchar (40)
);

CREATE TABLE nadador (
	idNadador int primary key auto_increment, 
    nome varchar(60),
	email varchar(70),
    cpf char(11),
	dtNasc date,
	telefone varchar (11),
	senha varchar(50),
    categoria varchar(40),
    fkModalidade int,
    foreign key (fkModalidade) references modalidade (idModalidade),
    fkCompeticao int, 
     foreign key (fkCompeticao) references competicao (idComp)
);
