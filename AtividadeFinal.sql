create schema PASSAGENS;
USE PASSAGENS;

CREATE TABLE Companhias (
    idCompanhia INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE Passageiros (
    idPassageiro INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE Voos (
    idVoo INT PRIMARY KEY AUTO_INCREMENT,
    numero_voo VARCHAR(10) NOT NULL
);

CREATE TABLE Cidades (
    idCidade INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    pais VARCHAR(50)
);

CREATE TABLE Aeroportos (
    idAeroporto INT PRIMARY KEY AUTO_INCREMENT ,
    nome VARCHAR(100),    
    fk_idCidade INT,
    FOREIGN KEY (fk_idCidade) REFERENCES Cidades(idCidade)
);

CREATE TABLE TipoAeronaves (
    idTipoAeronave INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(100) NOT NULL,
    fk_idCompanhia INT NOT NULL,
    FOREIGN KEY (fk_idCompanhia) REFERENCES Companhias(idCompanhia)
);

CREATE TABLE Assentos (
    idAssento INT PRIMARY KEY AUTO_INCREMENT,
    numero VARCHAR(10) NOT NULL,
    classe VARCHAR(50) NOT NULL,
    fk_idTipoAeronave INT,
    FOREIGN KEY (fk_idTipoAeronave) REFERENCES TipoAeronaves(idTipoAeronave)
);

CREATE TABLE Trechos (
    idTrecho INT PRIMARY KEY AUTO_INCREMENT,
    fk_idVoo INT NOT NULL,
    origem_idAeroporto INT NOT NULL,
    destino_idAeroporto INT NOT NULL,
    fk_idTipoAeronave INT NOT NULL,
    FOREIGN KEY (fk_idVoo) REFERENCES Voos(idVoo),
    FOREIGN KEY (origem_idAeroporto) REFERENCES Aeroportos(idAeroporto),
    FOREIGN KEY (destino_idAeroporto) REFERENCES Aeroportos(idAeroporto),
    FOREIGN KEY (fk_idTipoAeronave) REFERENCES TipoAeronaves(idTipoAeronave)
);

CREATE TABLE Trechos_Dia (
    idTrechoDia INT PRIMARY KEY AUTO_INCREMENT,
    fk_idTrecho INT NOT NULL,
    data DATE NOT NULL,
    vagas_disponiveis INT NOT NULL,
    FOREIGN KEY (fk_idTrecho) REFERENCES Trechos(idTrecho)
);

CREATE TABLE Horarios (
    idHorario INT PRIMARY KEY AUTO_INCREMENT,
    horario_partida TIME NOT NULL,
    horario_chegada TIME NOT NULL,
    fk_idTrecho INT NOT NULL,
    FOREIGN KEY (fk_idTrecho) REFERENCES Trechos(idTrecho)
);

CREATE TABLE Reservas (
    idReserva INT PRIMARY KEY AUTO_INCREMENT,
    fk_idPassageiro INT NOT NULL,
    prazo DATE,
    fk_idAssento INT NOT NULL,
    fk_idTrecho INT NOT NULL,
    fk_idTrechoDia INT NOT NULL,
    FOREIGN KEY (fk_idPassageiro) REFERENCES Passageiros(idPassageiro),
    FOREIGN KEY (fk_idAssento) REFERENCES Assentos(idAssento),
    FOREIGN KEY (fk_idTrecho) REFERENCES Trechos(idTrecho),
    FOREIGN KEY (fk_idTrechoDia) REFERENCES Trechos_Dia(idTrechoDia)
);

INSERT INTO Companhias (nome) VALUES
('Azul'),
('Gol'),
('Latam');

INSERT INTO Passageiros (idPassageiro, nome) VALUES
(1, 'Lucas Oliveira'),
(2, 'Lidia Resende'),
(3, 'Jonas Bibilio'),
(4, 'Marcia Azevedo'),
(5, 'Luciano Santos');

INSERT INTO Cidades (nome, pais) VALUES
('Belo Horizonte', 'Brasil'),
('São Paulo', 'Brasil'),
('Rio de Janeiro', 'Brasil'),
('Brasília', 'Brasil'),
('Buenos Aires', 'Argentina'),
('Nova York', 'EUA');

INSERT INTO Aeroportos (nome, fk_idCidade) VALUES
('Confins', 1),
('Guarulhos', 2),
('Santos Dumont', 3),
('Congonhas', 2),
('Brasília Aeroporto', 4),
('Ezeiza', 5);

INSERT INTO TipoAeronaves (descricao, fk_idCompanhia) VALUES
('Boeing 737', 1),
('Airbus A320', 2),
('Boeing 777', 3),
('Airbus A320', 1);

INSERT INTO Assentos (numero, classe, fk_idTipoAeronave) VALUES
('1A', 'Executiva', 1),
('1B', 'Executiva', 1),
('2A', 'Executiva', 1),
('2B', 'Executiva', 1),
('3A', 'Econômica', 1),
('3B', 'Econômica', 1),
('4A', 'Econômica', 1),
('4A', 'Econômica', 1),
('1A', 'Executiva', 2),
('1B', 'Executiva', 2),
('2A', 'Econômica', 2),
('2B', 'Econômica', 2),
('3A', 'Econômica', 2),
('3B', 'Econômica', 2),
('1A', 'Executiva', 3),
('1B', 'Executiva', 3),
('2A', 'Econômica', 3),
('2B', 'Econômica', 3),
('3A', 'Econômica', 3),
('3B', 'Econômica', 3),
('1A', 'Executiva', 4),
('1B', 'Executiva', 4),
('2A', 'Econômica', 4),
('2B', 'Econômica', 4),
('3A', 'Econômica', 4),
('3B', 'Econômica', 4);

INSERT INTO Voos (numero_voo) VALUES
('AZ123'),
('GOL456'),
('LAT789');

INSERT INTO Trechos (fk_idVoo, origem_idAeroporto, destino_idAeroporto, fk_idTipoAeronave) VALUES
(1, 1, 2, 1),
(2, 3, 4, 2), 
(3, 5, 6, 3), 
(3, 2, 6, 4), 
(3, 1, 5, 1); 

INSERT INTO Trechos_Dia (fk_idTrecho, data, vagas_disponiveis) VALUES
(1, '2024-12-01', 50),
(2, '2024-08-19', 45),
(3, '2024-04-20', 30),
(4, '2024-10-05', 50),
(5, '2024-01-02', 40);

INSERT INTO Horarios (horario_partida, horario_chegada, fk_idTrecho) VALUES
('08:00:00', '10:00:00', 1),
('12:00:00', '15:00:00', 2),
('18:00:00', '22:00:00', 3),
('15:00:00', '19:00:00', 4),
('10:00:00', '17:00:00', 5);

INSERT INTO Reservas (fk_idPassageiro, prazo, fk_idAssento, fk_idTrecho, fk_idTrechoDia) VALUES
(1, '2024-11-20', 1, 1, 1),
(2, '2024-11-21', 2, 1, 1),
(4, '2024-11-22', 21, 3, 3),
(5, '2024-11-22', 22, 3, 3);

#CRIE 10 PERGUNTAS COM SUB-CONSULTAS NESTE EXERCICIO E RESPONDA AS MESMAS COM SQL.

# 1 - Selecione o nome dos passageiros que irão de classe EXECUTIVA.

select nome from passageiros where idPassageiro in (
select fk_idPassageiro from reservas where  fk_idAssento in (
select idAssento from assentos where classe = 'EXECUTIVA'));

# 2 - Selecione os nomes dos Aeroportos da cidade de São Paulo.

select nome from aeroportos where fk_idCidade in (
select idCidade from cidades where nome = 'São Paulo');

# 3 - Selecione as descrições das Aeronaves da Companhia aerea AZUL 

select descricao from tipoaeronaves where fk_idCompanhia in (
select idCompanhia from Companhias where nome = 'AZUL' );

# 4 - Qual o numero e a classe do assento do passageiro 'Lucas Oliveira' ?

select numero, classe from assentos where idAssento in (
select fk_idAssento from Reservas where fk_idPassageiro in (
select idPassageiro from passageiros where nome = 'Lucas Oliveira'));

# 5 - Quais os horarios de partida para o trecho saindo de CONFINS ? 

select horario_partida from horarios where fk_idTrecho in (
select idTrecho from trechos where origem_idAeroporto in (
select idAeroporto from aeroportos where nome = 'CONFINS')); 

# 6 - Quais os numeros e a classe da Aeronave de descrição 'Boeing 737' ? 
select numero, classe from assentos where fk_idTipoAeronave in (
select idTipoAeronave from TipoAeronaves where descricao = 'Boeing 737');

# 7 - Qual o nome da cidade do trecho que está com o horario de parida às 18 ? 

select nome from cidades where idCidade in (
select fk_idCidade from aeroportos where idAeroporto in (
select origem_idAeroporto from trechos where idTrecho in (
select fk_idtrecho from horarios where horario_partida = '18:00:00')));

# 8 - Quais os nomes dos passageiros que irão embarcar em Confins ? 

select nome from passageiros where idPassageiro in (
select fk_idPassageiro from reservas where fk_idTrecho in ( 
select idTrecho from trechos where origem_idAeroporto in (
select idAeroporto from aeroportos where nome  = 'Confins' ) ));

# 9 - Qual o nome do passageiro não efetuou nenhuma reserva

select nome from passageiros where idPassageiro not in (
select fk_idPassageiro from reservas);

# 10 - Quais nomes de cidades não tem um aeroporto? 

select nome from cidades where idCidade not in (
select fk_idCidade from aeroportos); 

#CRIE 20 PERGUNTAS COM JOIN NESTE EXERCICIO E RESPONDA AS MESMAS COM SQL.

# 1 - Liste os nome dos passageiros e os numeros do vôos que fizeram reservas.

select p.nome, v.numero_voo 
from passageiros p 
join reservas r on p.idPassageiro = r.fk_idPassageiro
join trechos t on t.idtrecho = r.fk_idTrecho
join voos v on v.idVoo = t.fk_idvoo; 
 
# 2 - Liste os nome dos passageiros e seus respectivivos assentos e classes

select p.nome, a.numero as assento, a.classe
from passageiros p 
join reservas r on p.idPassageiro = r.fk_idPassageiro
join assentos a on r.fk_idAssento = a.idAssento; 

# 3 - Liste os numeros de vôo e seus respectivos horario de partida e de chegada.

select v.numero_voo, h.horario_partida, h.horario_chegada
from trechos t 
join voos v on v.idVoo = t.fk_idVoo
join horarios h on t.idTrecho = h.fk_idtrecho;  

# 4 - Liste os numeros de vôo, os aeroporto de origem e destino, além de seus respectivos horario de partida e de chegada.

select v.numero_voo, a1.nome as OrigemAeroporto, a2.nome as DestinoAeroporto, h.horario_partida, h.horario_chegada
from trechos t 
join voos v on v.idVoo = t.fk_idVoo
join horarios h on t.idTrecho = h.fk_idtrecho  
join aeroportos a1 on t.origem_idAeroporto = a1.idAeroporto  
join aeroportos a2 on t.destino_idAeroporto = a2.idAeroporto;  

# 5 - Liste o nome da companhia e a descrição do tipo da aeronave

select c.nome, t.descricao
from companhias c
join tipoaeronaves t on c.idCompanhia = fk_idCompanhia;

# 6 - Liste o nome dos passageiros, o nome do aeroporto de destino e o nome do aeroporto de origem.

select p.nome, a1.nome as Origem_Aeroporto, a2.nome as Destino_Aeroporto 
from passageiros p 
join reservas r on p.idPassageiro = fk_idPassageiro
join trechos t on r.fk_idtrecho = t.idtrecho
join aeroportos a1 on t.origem_idAeroporto = a1.idAeroporto  
join aeroportos a2 on t.destino_idAeroporto = a2.idAeroporto; 

# 7 - Liste o nome dos passageiros, a cidade e o país de destino

select p.nome, c.nome as cidade, c.pais as Pais_Destino
from passageiros p
join reservas r on p.idPassageiro = r.fk_idPassageiro
join trechos t on r.fk_idTrecho = t.idTrecho
join aeroportos a on t.destino_idAeroporto = a.idAeroporto
join cidades c on a.fk_idCidade = c.idCIdade;

# 8 - Quais os nomes dos passabeiros e o horarios de partidas que irão embarcar entre 00:00 às 12:00 horas;

select p.nome, h.horario_partida
from passageiros p 
join reservas r on p.idPassageiro = r.fk_idPassageiro
join trechos t on r.fk_idTrecho = t.idTrecho
join horarios h on t.idTrecho = h.fk_idTrecho
where h.horario_partida between '00:00:00' and '12:00:00';

# 9 - Liste o nome das companhias, a descrição do tipo da aeronave e quantas vagas disponiveis

select c.nome, ta.descricao, td.vagas_disponiveis
from companhias c 
join tipoaeronaves ta on c.idCompanhia = ta.fk_idCompanhia
join trechos t on ta.idTipoaeronave = t.fk_idtipoaeronave
join trechos_dia td on t.idTrecho = td.fk_idTrecho;

# 10 - Liste o numero do Vôo, o aeroporto de origem, o aeroporto de destino, o tipo da aeronave e as vagas disponiveis.

select v.Numero_voo,  a1.nome as Origem_Aeroporto, a2.nome as Destino_Aeroporto, ta.Descricao, td.Vagas_disponiveis
from voos v
join trechos t on v.idVoo = t.fk_idVoo 
join aeroportos a1 on t.origem_idAeroporto = a1.idAeroporto  
join aeroportos a2 on t.destino_idAeroporto = a2.idAeroporto
join tipoAeronaves ta on t.fk_idtipoaeronave = ta.idtipoaeronave
join trechos_dia td on t.idtrecho = td.fk_idtrecho;  

# 11 - Qual o numero do assento e a classe das reservas com prazo na data 2024-11-22

select a.numero as Assentos, a.Classe
from reservas r 
join assentos a on r.fk_idAssento = a.idAssento
where r.prazo = '2024-11-22';

# 12 - Qual o nome do passageiro e qual o prazo da sua passagem

select p.nome, prazo 
from passageiros p
join reservas r on p.idPassageiro = r.fk_idPassageiro;

# 13 - Qual o nome do passageiro, horario de chegada e o nome do aeroporto de destino ?

select p.Nome, a.nome as AeroportoDestino, Horario_chegada
from passageiros p 
join reservas r on p.idPassageiro = r.fk_idPassageiro
join trechos t on r.fk_idTrecho = t.idTrecho
join aeroportos a on t.destino_idAeroporto = a.idAeroporto
join horarios h on t.idTrecho = h.fk_idtrecho;

# 14 - Selecione o nome do aeroporto, a cidade e o país, onde o país não é o Brasil

select a.nome as Aeroporto, c.nome as Cidade, c.Pais
from aeroportos a 
join cidades c on a.fk_idCidade = c.idCidade
where c.pais <> 'Brasil';

# 15 -  Qual o nome da companhia com Vôo de destino no aeroporto de Guarulhos?

select c.nome
from companhias c
join tipoaeronaves ta on c.idCompanhia = ta.fk_idCompanhia
join trechos t on ta.idTipoaeronave = t.fk_idtipoaeronave
join aeroportos a on t.destino_idAeroporto = a.idAeroporto
where a.nome = 'Guarulhos';  

# 16 - Liste os nomes do aeroportos que começam com a letra C e sua cidade.

select a.nome as Aeroporto, c.nome as Cidade
from aeroportos a 
join cidades c on a.fk_idCidade = c.idCidade
where a.nome like'C%';

# 17 - Selecione o nome do aeroporto de origem, o tipo da aeronave e quantas vagas disponiveis, ordenando pelo numero de vagas.

select a.nome as Aeroporto , ta.descricao as Tipo_Aeronaves , td.Vagas_disponiveis
from aeroportos a 
join trechos t on a.idAeroporto = t.origem_idAeroporto  
join tipoaeronaves ta on t.fk_idTipoaeronave = ta.idtipoaeronave
join trechos_dia td on t.idTrecho = td.fk_idTrecho
order by td.vagas_disponiveis;

# 18 - Selecione todos os aeroportos e liste todos os nomes aeroportos de destinos vinculados.

select a1.nome as Origem_Aeroporto, a2.nome as Destino_Aeroporto
from trechos t
right join  aeroportos a1 on  t.origem_idAeroporto = a1.idAeroporto 
left join  aeroportos a2 on t.destino_idAeroporto = a2.idAeroporto;

# 19 -  Liste os aeroportos que não possuem trechos associados como origem.

SELECT a.nome AS Aeroporto
FROM aeroportos a
LEFT JOIN trechos t ON a.idAeroporto = t.origem_idAeroporto
WHERE t.idTrecho IS NULL;

# 20 - Liste os nomes dos passageiros, o número do voo, e os aeroportos de destino dos trechos onde as reservas foram feitas após '2024-11-20'

SELECT p.nome AS Nome_Passageiro, v.Numero_voo, a.nome AS Destino_Aeroporto
FROM reservas r
JOIN trechos t ON r.fk_idTrecho = t.idTrecho
JOIN voos v ON t.fk_idVoo = v.idVoo
JOIN aeroportos a ON t.destino_idAeroporto = a.idAeroporto
JOIN passageiros p ON r.fk_idPassageiro = p.idPassageiro
WHERE r.prazo > '2024-11-20'
ORDER BY p.nome;


