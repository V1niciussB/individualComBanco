CREATE DATABASE sharkAcademy;

USE sharkAcademy;

CREATE TABLE competicao (
	idComp int primary key auto_increment,
    dataH datetime,
    localComp varchar(60)
);

CREATE TABLE modalidade (
	idModalidade int primary key auto_increment,
    descricao varchar (40)
);

CREATE TABLE nadador (
	idNadador int primary key auto_increment, 
    nome varchar(60),
	email varchar(70),
    cpf char(11),
	dtNasc date,
    genero char (1),
	telefone varchar (11),
	senha varchar(50),
    categoria varchar(40),
    fkModalidade int,
    foreign key (fkModalidade) references modalidade (idModalidade),
    fkCompeticao int, 
     foreign key (fkCompeticao) references competicao (idComp)
);

INSERT INTO modalidade VALUES
(null, "Livre"),
(null, "Costas"),
(null, "Peito"),
(null,"Borboleta");


SELECT * FROM nadador;
SELECT * FROM modalidade;

-- Pegando a idade dos ultimos nadadores cadastrados
SELECT nome, timestampdiff(year,dtNasc,curdate()) as idade FROM nadador
ORDER BY idNadador desc
limit 1;


INSERT INTO competicao VALUES 
(null, '2022-12-20 10:00:00', "Praça Charles Miller - Pacaembu"),
(null, '2022-12-20 10:40:00', "Praça Charles Miller - Pacaembu"),
(null, '2022-12-20 12:00:00', "Praça Charles Miller - Pacaembu"),
(null, '2022-12-20 12:00:00', "Praça Charles Miller - Pacaembu"),
(null, '2022-12-20 14:00:00', "Praça Charles Miller - Pacaembu"),

(null, '2022-12-21 13:00:00', "Praça Charles Miller - Pacaembu"),
(null, '2022-12-21 14:00:00', "Praça Charles Miller - Pacaembu"),
(null, '2022-12-21 15:00:00', "Praça Charles Miller - Pacaembu"),
(null, '2022-12-21 16:00:00', "Praça Charles Miller - Pacaembu"),
(null, '2022-12-21 17:00:00', "Praça Charles Miller - Pacaembu"),

(null, '2022-12-22 10:20:00', "Praça Charles Miller - Pacaembu"),
(null, '2022-12-22 11:40:00', "Praça Charles Miller - Pacaembu"),
(null, '2022-12-22 13:00:00', "Praça Charles Miller - Pacaembu"),
(null, '2022-12-22 14:30:00', "Praça Charles Miller - Pacaembu"),
(null, '2022-12-22 15:45:00', "Praça Charles Miller - Pacaembu"),

(null, '2022-12-23 10:00:00', "Praça Charles Miller - Pacaembu");


SELECT idNadador, nome, descricao, categoria, DATE_FORMAT( dataH, '%d/%c/%Y' ) as "Data", TIME_FORMAT (dataH, '%Hh%i') as "Hora" FROM nadador
JOIN modalidade ON idModalidade = fkModalidade
JOIN competicao ON idComp = fkCompeticao;

SELECT COUNT(genero) as genero FROM nadador
GROUP BY genero;

SELECT COUNT(fkModalidade) as modalidade FROM nadador
GROUP BY fkModalidade;