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
    categoria varchar (30),
    dataH datetime,
    localComp varchar(60)
);

CREATE TABLE modalidade (
	idModalidade int primary key,
    descricao varchar (40),
    fkComp int,
    foreign key (fkComp) references competicao (idComp)
);

CREATE TABLE nadador (
	idNadador int primary key, 
    nome varchar(60),
    cpf char(11),
    dataNasc date,
    genero char(6),
    fkComp int,
    foreign key (fkComp) references competicao (idComp)
);