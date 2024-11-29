
DROP SCHEMA IF EXISTS `NewtonLoc`;
CREATE SCHEMA `NewtonLoc`;
USE `NewtonLoc`;
-- -----------------------------------------------------
-- Table `lojaCarros`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE `CLIENTES` (
`idCliente` INT NOT NULL
AUTO_INCREMENT,
`nome` VARCHAR(45) NOT NULL,
`cpf` CHAR(11) NOT NULL,
`telefone` CHAR(11) NOT NULL,
`email` VARCHAR(45) NOT NULL,
`pontuacao` INT NOT NULL,
`tipo` VARCHAR(45) NOT NULL,
PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `LojaCarros`.`Carros`
-- -----------------------------------------------------
CREATE TABLE`CARROS` (
`idCarro` INT NOT NULL
AUTO_INCREMENT,
`fabricante` VARCHAR(45) NOT NULL,
`modelo` VARCHAR(45) NOT NULL,
`cor` VARCHAR(15) NOT NULL,
`anoFabricacao` YEAR NOT NULL,
`potenciaMotor` DECIMAL(4,1) NOT NULL,
`categoria` VARCHAR(45) NOT NULL,
`quilometragem` BIGINT NOT NULL,
PRIMARY KEY (`idCarro`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `LojaCarros`.`DadosVeiculo`
-- -----------------------------------------------------
CREATE TABLE`DIMENSOES` (
`idDimensao` INT AUTO_INCREMENT,
`altura_mm` DECIMAL(4,3) NOT NULL,
`largura_mm` DECIMAL(4,3) NOT NULL,
`comprimento_mm` DECIMAL(4,3) NOT
NULL,
`peso_kg` INT NOT NULL,
`tanque_L` INT NOT NULL,
`entre_eixos_mm` DECIMAL(4,3) NOT
NULL,
`porta_mala_L` INT NOT NULL,
`ocupante` INT NOT NULL,
`fk_idCarro` INT NOT NULL,
CONSTRAINT `fk_Dimensoes_Carros`
FOREIGN KEY (`fk_idCarro`)
REFERENCES `CARROS` (`idCarro`)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
PRIMARY KEY (`idDimensao`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `LojaCarros`.`Locacao`
-- -----------------------------------------------------
CREATE TABLE `LOCACAO` (
`idLocacao` INT NOT NULL
AUTO_INCREMENT,
`dataLocacao` DATE NOT NULL,
`valorDiaria` DOUBLE NOT NULL,
`fk_idCliente` INT NOT NULL,
`fk_idCarro` INT NOT NULL,
PRIMARY KEY (`idLocacao`),
CONSTRAINT `fk_Locacao_Clientes`
FOREIGN KEY (`fk_idCliente`)
REFERENCES `CLIENTES` (`idCliente`)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT `fk_Locacao_Carros`
FOREIGN KEY (`fk_idCarro`)
REFERENCES `CARROS`(`idCarro`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;
INSERT INTO CLIENTES (nome,cpf,telefone,email,pontuacao,tipo)values
('Teclaudio Screen','12341234121','31987655434','te@gmail.com',0,'Basico'),
('Maria Teclas','12332143445','32987800987','m@gmail.com',100,'Basico'),
('Jonas Mouse','44489865432','31976533234','mouse@gmail.com',500,'Basico'),
('Carlos CPU','45609087678','31978900627','cpu@gmail.com',1200,'Intemediario'),
('Tiana Cooler','67512399900','31976432111','ti@gmail.com',3000,'Intermediario'),
('Cassandra Pixel','88890097666','31980077654','cas@gmail.com',5600,'Premium');
INSERT INTO CARROS
(fabricante,modelo,cor,anoFabricacao,potenciaMotor,categoria,quilometragem)values
('Fiat','Toro Freedom','preto','2022',1.8,'SUV',12000),
('Toyota','Yaris','Branco','2022',1.5,'Sedan',3000),
('Ford','Fiesta','Branco','2021',1.6,'Hatch',566),
('Toyota','Corolla','Branco','2023',2.0,'Sedan',1022),
('Hyundai','Hb20','Vermelho','2023',2.0,'Hatch',300),
('Volksvagen','Gol','Verde','2020',1.6,'Hatch',5059),
('Chevrolet','Onix','preto','2019',1.6,'Hatch',12034);
INSERT INTO locacao(dataLocacao,valorDiaria,fk_idCliente,fk_idCarro)
values
('2023-01-10',123,1,1),
('2023-01-10',183,2,2),
('2023-01-10',100,3,3),
('2023-01-10',199,4,4),
('2023-01-10',99,5,5),
('2023-02-10',183,2,2);

insert into dimensoes(altura_mm, largura_mm, comprimento_mm,peso_kg, tanque_L, entre_eixos_mm, porta_mala_L, ocupante, fk_idcarro)
values ('1.475','1.656','3.892','1.020','55','2.467','285','5','6'),
('1.480','1.760','4.540', '1.230','60','2.600','470','5','4'),
('1.673','1.844','4.945','1.65','55','2.982','0','5', '1'),
('1.487','1.765','3.935','1.084','54','2.488','270','5','3'),
('1.490','1.730','4.425','1.130','45' ,'2.550','473','5','2'),
('1.470','1.720','4.015','993','50','2.530','300','5','5'),
('1.471','1.731','4.163','1.034','44','2.551','303','5','7');
select * from dimensoes;
select * from carros;
select * from locacao;
select * from clientes;

#Questao 1 -- Qual o modelo do carro que já foi alugado
	select modelo from carros where idcarro in (select fk_idcarro from locacao);
    select modelo from carros c join locacao l on c.idcarro = l.fk_idCarro where c.idCarro = l.fk_idcarro group by modelo;

#Questao 2 -- Qual o nome do cliente que já alugou um carro
	select nome from clientes where idcliente in (select fk_idcarro from locacao);
    select nome from clientes c join locacao l on c.idCliente = l.fk_idCliente where c.idCliente = l.fk_idCliente;

#Questao 3 -- Qual o nome do cliente que alugou o carro com a diária mais alta.
	select nome from clientes where idcliente in (select fk_idCliente from locacao where valordiaria = (select max(valordiaria) from locacao));
	select c.nome,l.valordiaria from locacao l join clientes c on c.idcliente = l.fk_idcliente where valordiaria = (select max(valordiaria) from locacao) ; 

#Questao 4-- Qual a categoria do carro que foi alugado por ultimo.
	select 	categoria from carros where idcarro in (select fk_idcarro from locacao where dataLocacao = (select max(datalocacao) from locacao ));
    select categoria from carros c join locacao l on c.idcarro = fk_idCarro where dataLocacao = (select max(datalocacao) from locacao);    

#Questao 5 -- Qual o nome do fabricante(s) que produziu o carro(s) mais potente(s)
select fabricante from carros where potenciaMotor = (select max(potenciamotor) from carros);
#Fabricante e potência do motor está na mesma tabela #

#Questao 6 -- Qual a cor da SUV locada no dia 2024-10-22 ### DATA DE LOCAÇÃO NÃO EXISTENTE ###
select cor from carros where idcarro in (select fk_idcarro from locacao where datalocacao = '2023-01-10' and categoria = 'suv'); 
select cor from carros c join locacao l on c.idCarro = l.fk_idCarro where l.datalocacao = '2023-01-10' and categoria = 'suv' ;


#Questao 7 -- Qual o modelo do carro, fabricante, cor que tem a menor diária
select modelo, fabricante, cor from carros where idcarro in (select fk_idCarro from locacao where valorDiaria = (select min(valorDiaria) from locacao));
select c.modelo,c.fabricante,c.cor from locacao l join carros c on c.idcarro = l.fk_idcarro where valordiaria = (select min(valordiaria) from locacao) ;


#Questao 8 -- Qual o modelo do carro e categoria que não foi alugado ainda
	select modelo,categoria from carros where idCarro not in(select fk_idcarro from locacao);
    select modelo,categoria from carros c join locacao l on c.idCarro = l.fk_idCarro where l.idlocacao <> l.fk_idCarro;
    
    

#Questao 9 -- Qual o nome do cliente que nunca alugou um carro do ano de fabricao 2013
	select nome from clientes where idCliente  not in (select fk_idCliente from locacao where fk_idCarro = (select idcarro from carros where anofabricacao = '2013'));
	select nome from clientes c join locacao l on c.idcliente = l.fk_idcliente join carros cr on cr.idcarro = l.fk_idcarro where cr.idcarro = l.fk_idCarro and  cr.anofabricacao <> '2013'; 
    
	
#Questao 10 -- Qual o nome do cliente que já alugou um carro SUV
select nome from clientes where idCliente in (select fk_idCliente from locacao where fk_idCarro = (select idcarro from carros where categoria = 'suv'));
select c.nome,cr.categoria from locacao l join clientes c on c.idcliente = l.fk_idcliente join carros cr on cr.idcarro = l.fk_idcarro where categoria = 'suv'; 

#Questao 11 -- Qual o nome do cliente que NÃO alugou um carro Sedan
select nome from clientes where idCliente in (select fk_idcliente from locacao where fk_idCarro = (select idcarro from carros where categoria <> 'sedan'));
select nome from clientes c join locacao l on c.idCliente = l.fk_idCliente join carros cr on cr.idCarro = l.fk_idCarro where categoria <> "sedan";

#Questao 12 -- Qual a categoria do cliente que já alugou um carro com mais de 3000 quilômetros rodados
select nome from clientes where idCliente in (select fk_idcliente from locacao where fk_idCarro = (select idcarro from carros where quilometragem > '3000'));
select nome from clientes c join locacao l on c.idcliente = l.fk_idCliente join carros cr on cr.idCarro = l.fk_idCarro where quilometragem > '3000';  

#Questao 13 -- Qual o modelo do carro que tem a menor altura.
select modelo from carros where idcarro in (select fk_idcarro from dimensoes where altura_mm = (select min(altura_mm) from dimensoes));
select modelo from carros cr join dimensoes d on cr.idCarro = d.fk_idCarro where d.altura_mm = (select min(altura_mm) from dimensoes); 

#Questao 14 -- Qual o tamanho do porta mala do carro que é da categoria Hatch
select porta_mala_l from dimensoes where fk_idCarro in (select idcarro from carros where categoria = 'hatch');
select porta_mala_l from dimensoes d join carros c on c.idCarro = d.fk_idCarro where categoria = "hatch";

#Questao 15 – Você deve criar mais 10 sub Consultas nesse sistema.

# Qual o carro hatch de maior comprimento.
select modelo from carros where idCarro in (select fk_idcarro from dimensoes where comprimento_mm = (select min(comprimento_mm) from dimensoes));
select modelo from carros c join dimensoes d on c.idCarro = d.fk_idCarro where d.comprimento_mm = (select min(comprimento_mm) from dimensoes);

# Qual carro com o maior porta-malas.
select modelo from carros where idCarro in (select fk_idcarro from dimensoes where porta_mala_l = (select max(porta_mala_l) from dimensoes));
select modelo from carros c join dimensoes d on c.idCarro = d.fk_idCarro where d.porta_mala_L = (select max(porta_mala_L) from dimensoes);

# Qual carro com o maior tanque .
select modelo from carros where idCarro in (select fk_idcarro from dimensoes where tanque_L = (select max(tanque_L) from dimensoes));
select modelo from carros c join dimensoes d on c.idCarro = d.fk_idCarro where d.tanque_L= (select max(tanque_L) from dimensoes);

# Qual carro foi locado em 23-01-10.
select modelo from carros where idcarro in (select fk_idcarro from locacao where dataLocacao = '23-01-10');
select modelo from carros c join locacao l on c.idCarro = l.fk_idCarro where l.dataLocacao = '23-01-10';

# Qual cliente alugou o Corolla
select nome from clientes where idcliente in (select fk_idcliente from locacao where fk_idCarro = (select idcarro from carros where modelo = 'Corolla'));
select nome from clientes c join locacao l on c.idCliente = l.fk_idCliente join carros cr on cr.idCarro = l.fk_idCarro where cr.modelo = 'corolla';

# Qual cliente alugou um carro de potência 1.5 
select nome from clientes where idcliente in (select fk_idcliente from locacao where fk_idCarro = (select idcarro from carros where potenciaMotor = '1.5'));
select nome from clientes c join locacao l on c.idCliente = l.fk_idcliente join carros cr on cr.idCarro = l.fk_idCarro where potenciaMotor = '1.5';

# Qual carro de maior peso 
select modelo from carros where idcarro in (select fk_idcarro from dimensoes where peso_kg = (select max(peso_kg) from dimensoes));
select modelo from carros c join dimensoes d on c.idCarro = d.fk_idCarro where d.peso_kg = (select max(peso_kg) from dimensoes);

#Qual carro de maior entre-eixos.
select modelo from carros where idcarro in (select fk_idcarro from dimensoes where entre_eixos_mm = (select max(entre_eixos_mm) from dimensoes));
select modelo from carros c join dimensoes d on c.idCarro = d.fk_idCarro where d.entre_eixos_mm = (select max(entre_eixos_mm) from dimensoes);

# Qual carro com o menor porta-malas
select modelo from carros where idcarro in (select fk_idcarro from dimensoes where porta_mala_L = (select min(porta_mala_L) from dimensoes));
select modelo from carros c join dimensoes d on c.idCarro = d.fk_idCarro where d.porta_mala_L = (select min(porta_mala_L) from dimensoes);

# qual carro com a diaria mais alta.
select modelo from carros where idcarro in (select fk_idcarro from locacao where valorDiaria = (select max(valorDiaria) from locacao));
select modelo from carros c join locacao l on c.idCarro = l.fk_idCarro where l.valorDiaria = (select max(valorDiaria) from locacao);