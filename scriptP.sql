drop database bdsangue;

create database bdsangue;
use bdsangue;

create table empresa (
idEmpresa int primary key auto_increment,
nome varchar(45),
responsavel varchar(45),
CNPJ char(8) unique,
telefone varchar(45) unique,
email varchar(45)
);

insert into empresa values 
	(null, 'MedicalExpo', 'Jonathan', '03526020', '11-951938872', 'MedExpo@gmail.com'),
    (null, 'Frenesius', 'Leonardo', '02312309', '11-945200901', 'Frenesius@gmail.com'),
    (null, 'HHemo', 'Amanda', '03213466', '11-927422386', 'HHemo@gmail.com');
    
    
create table sensor (
idSensor int primary key auto_increment,
fkEmpresa int,
constraint FKempresaSensor foreign key (FkEmpresa) references empresa(idEmpresa)
)auto_increment = 100;


insert into sensor values 
	(null, 1),
    (null, 2),
    (null, 3),
    (null, 1),
    (null, 2);
    

create table registro (
idRegistro int primary key auto_increment,
horário datetime default current_timestamp,
temperatura varchar(10),
fkSensor int,
constraint FkSensor foreign key (FkSensor) references sensor(idSensor)
) auto_increment = 1000; 

insert into registro (temperatura, fkSensor) values
	('23.3', '100'),
    ('31,02', '101'),
    ('20.5', '102'),
    ('09.1', '101'),
    ('13.2', 100);
    
    select * from registro;
    

create table endereço (
idEndereço int primary key auto_increment,
nomeRua varchar(45),
número varchar(45),
CEP varchar(45),
fkEmpresa int,
constraint FkEmpresaEndereço foreign key (FkEmpresa) references empresa(idEmpresa)
) auto_increment = 1000;

insert into endereço values
	(null, 'Hadock Lobo', '84', '02452023', '1'),
    (null, 'Liberdade', '104', '10957592', '2'),
    (null, 'Rua Augusta', '8104', '98466842', '3');
    

create table usuario (
idUsuario int primary key auto_increment,
email varchar(45),
senha varchar(45),
nomeNick varchar(45),
fkEmpresa int,
constraint FkEmpresaUsuario foreign key (FkEmpresa) references empresa(idEmpresa)
) auto_increment = 10000;

insert into usuario values
	(null, 'fabio@gmail.com', 'senha123', 'FabioLegal', '1'),
    (null, 'gerson@gmail.com', 'minhasenha', 'Gers0n', '2'),
    (null, 'pedro@gmail.com', 'senhasenha', 'P3dr0', '3'),
    (null, 'leandro@gmail.com', 'senhaminha', 'leando', '2'),
    (null, 'larissa@gmail.com', 'larissasenha', 'larissinha', '1'),
    (null, 'zepiriquito@gmail.com', 'senhalegal', 'Osvaldo', '3');
    
    
-- SELECTS
    
    -- nome das empresas e seus respectivos sensores
    select empresa.nome as 'Empresa', sensor.idSensor as Sensores from empresa join sensor on idEmpresa = fkEmpresa;
    
    
    -- nome das empresas e seus respectivos endereços
    select empresa.nome as 'Empresa', endereço.nomeRua as 'Rua' from empresa join endereço on idEmpresa = fkEmpresa;
    

    -- temperatura de determinado horário de determinados sensores
    select registro.temperatura, registro.horário, sensor.idSensor from registro join sensor on idSensor = Fksensor where idSensor = 100;
    
    
    
    

