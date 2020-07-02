use sis1_db;

/* MUNICÍPIOS */
create table municipios(
cod int unsigned auto_increment,
municipio varchar(50),
populacao int unsigned,
porte enum("micro","pequeno","médio","grande"),
primary key(cod)
)charset = "utf8mb4";

/*
load data infile '' into table municipios 
fields terminated by ';' enclosed by '"'
(municipio, populacao); 
*/

/* LICITAÇÕES */
create table licitacoes(
doctce varchar(8),	-- PK
municipio int unsigned, -- FK
orgao varchar(100),
numLicitacao varchar(80),
modalidade enum("Tomada de Preço", "Pregão Presencial", "Pregão Eletrônico", "Convite"),
descricao tinytext,
valorReferencia decimal(10,2),
situacao varchar(45),
primary key (doctce), -- Primary Key
foreign key (municipio) references municipios(cod)-- Foreign Key
) charset = utf8mb4;

/* FORNECEDORES */
create table fornecedores(
cnpj varchar(14),
razaoSocial varchar(100),
porte enum("epp", "me"),
naturezaJuridica enum("sociedade empresária limitada"),
obs tinytext,
sede int unsigned,
primary key (cnpj),
foreign key (sede) references municipios(cod)
)charset = utf8mb4;

/*SESSÕES LICITATORIAS*/
create table ses_licitatorias(
reg int unsigned auto_increment,
licitacao varchar(8), -- Foreign Key (doctce)
dataSessao date,
vencedor varchar(14), -- Foreign Key
melhorProposta decimal(10,2),
participanteI varchar(14), -- Foreign Key
propostaI decimal(10,2),
participanteII varchar(14), -- Foreign Key
propostaII decimal(10,2),
participanteIII varchar(14), -- Foreign Key
propostaIII decimal(10,2),
homologacao date,
primary key(reg),
foreign key (licitacao) references licitacoes(doctce),
foreign key (vencedor) references fornecedores(cnpj),
foreign key (participanteI) references fornecedores(cnpj),
foreign key (participanteII) references fornecedores(cnpj),
foreign key (participanteIII) references fornecedores(cnpj)
) charset = utf8mb4;