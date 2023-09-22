CREATE DATABASE bdSangue;
USE bdSangue;

-- TABELA EMPRESA
-- id Empresa
-- Nome empresa
-- Responsavel Empresa
-- Cnpj empresa
-- logradouro Empresa
CREATE TABLE tbEmpresa (
	idEMpresa INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nomeEmpresa VARCHAR (60),
    responsavelEmpresa VARCHAR (50),
    cnpjEmpresa VARCHAR (14),
    cepEmpresa VARCHAR (8),
    logradouroEmpresa VARCHAR (50)
);

INSERT INTO tbEmpresa VALUES
(null, 'Hospital Israelita Albert Einstein','Daniel Alves','60765823000130','06455010','Av. Juruá, 706'),
(null, 'Hospital das Clínicas','Gustavo Antunes','60448040000122','05403000','Avenida Doutor Enéas de Carvalho Aguiar, 255'),
(null, 'Hospital Sirio Libanes','Gustavo Silva','61590410000124','01308050','Rua Dona Adma Jafet, 91'),
(null, 'Hospital Alemão Oswaldo Cruz','Guilherme Oliveira','60726502000126','01323020','Rua	 Treze de Maio, 1815'),
(null, 'Hospital Sancta Maggiore','Samuel Oliveira','461479003189','01323901','Rua Maestro Cardim, 1137');

SELECT * FROM tbEmpresa;

-- TABELA FONE EMPRESA
-- id Fone empresa
-- num fone empresa
-- id empresa (tb empresa)
CREATE TABLE tbFoneEmpresa (
	idFoneEmpresa INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    numeroFoneEmpresa VARCHAR (11),
    idEmpresa INT
);

INSERT INTO tbFoneEmpresa VALUES 
(null,'1121516519',1),
(null,'1126610000',2),
(null,'1133940200',3),
(null,'1135491000',4),
(null,'1140859410',5);

SELECT * FROM tbFoneEmpresa;

-- TABELA SANGUE
-- id Sangue
-- tipo Sangue
-- doador Sangue
-- data Sangue
-- qtd sangue
CREATE TABLE tbSangue (
	idSangue INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    tipoSangue VARCHAR (3),
    dataColetaSangue DATE,
    dataValidadeSangue DATE,
    qtdSangue DOUBLE,
    idEmpresa INT
);

INSERT INTO tbSangue VALUES 
(null,'O+','2023-08-23','2023-10-23','220',1),
(null,'A-','2023-06-14','2023-09-24','140',2),
(null,'B+','2023-04-17','2023-05-07','100',3),
(null,'A+','2023-08-31','2023-09-22','158',4),
(null,'AB-','2023-02-17','2023-04-17','170',5),
(null,'B-','2023-04-14','2023-05-24','200',3),
(null,'O-','2023-01-23','2023-03-18','154',2),
(null,'A+','2023-08-14','2024-09-24','140',2),
(null,'A+','2023-02-11','2023-03-22','158',4),
(null,'B+','2023-04-07','2023-05-07','100',3),
(null,'AB-','2023-02-17','2023-04-17','170',5),
(null,'B+','2023-01-27','2023-05-07','100',3),
(null,'AB-','2023-03-17','2023-04-17','170',5);

SELECT * FROM tbSangue;

-- TABELA SENSOR
-- id Sensor
-- codigo Sensor
-- id Empresa (tb empresa)
CREATE TABLE tbSensor(
	idSensor INT PRIMARY KEY AUTO_INCREMENT,
    codigoSensor VARCHAR (10),
    idEmpresa INT
);

INSERT INTO tbSensor VALUES
(null,'8726109',1),
(null,'1340965',2),
(null,'9832132',3),
(null,'0445977',4),
(null,'1587865',5),
(null,'6987854',2),
(null,'2578456',5),
(null,'1587895',1),
(null,'0021158',4);

SELECT * FROM tbSensor;

-- TABELA ARMAZENAMENTO
-- id armazenamento
-- temperatura armazenamento
-- qtd de Bolsa de Sangue
-- id Sangue (tb sangue)
CREATE TABLE tbArmazenamento (
	idArmazenamento INT PRIMARY KEY AUTO_INCREMENT,
    temperaturaArmazenamento DOUBLE,
    idSangue INT
);

INSERT INTO tbArmazenamento VALUES 
(null,3.2,1),
(null,2.6,2),
(null,1.4,3),
(null,1.3,4),
(null,2.4,5),
(null,1.6,6),
(null,2.0,7),
(null,1.9,8),
(null,1.3,9),
(null,2.8,10),
(null,1.7,11),
(null,1.0,12),
(null,2.2,13);

SELECT * FROM tbArmazenamento;

-- TABRLA USUARIO
-- id Usuario
-- login Usuario
-- senha Usuario
-- id Empresa (tb Empresa)

CREATE TABLE tbUSuario(
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    loginUsuario VARCHAR (15),
    senhaUSuario VARCHAR (10),
    idEmpresa INT
);

INSERT INTO tbUsuario VALUES
(null,'Einsten19','albert19',1),
(null,'Clinicas21','hospita21',2),
(null,'Sirio41','libanes58',3),
(null,'Cruz22','Hosp54',4),
(null,'Maggiore17','sancta17',5);

SELECT * FROM tbUsuario;

-- Select onde mostra os hospitais que tem nosso produto --
SELECT nomeEmpresa AS 'Nome Hospital' from tbEmpresa;

-- Select onde mostra a temperatura do sangue estocado --
SELECT temperaturaArmazenamento AS 'Temperatura Sangue' FROM tbArmazenamento;

-- Select onde mostra os francos com a validade próxima --
SELECT idSangue AS 'Id Sangue', tipoSangue AS 'Tipo Sanguineo', dataColetaSangue AS 'Data Coleta Sangue',dataValidadeSangue AS 'Data de Validade do sangue', qtdSangue AS 'Quantidade de sangue (ml)' FROM tbSangue
ORDER BY dataValidadeSangue;