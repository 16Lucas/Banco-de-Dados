CREATE database `exercicio2` ;

create table Exercicios (
	id INT PRIMARY KEY,
    tipo VARCHAR(50),
    minutos INT, 
    calorias int,
    frequencia_cardio int );
    
INSERT INTO Exercicios (id, tipo, minutos, calorias, frequencia_cardio)
values (1,'Andar Bicicleta', 30, 100, 110);

INSERT INTO Exercicios (id, tipo, minutos, calorias, frequencia_cardio)
values (2,'Correr Maratona', 10, 30, 105);

INSERT INTO Exercicios (id, tipo, minutos, calorias, frequencia_cardio)
values (3,'Luta Marcial', 15, 200, 120);

INSERT INTO Exercicios (id, tipo, minutos, calorias, frequencia_cardio)
values (4,'Andar Esteira', 45, 200, 105);

INSERT INTO Exercicios (id, tipo, minutos, calorias, frequencia_cardio)
values (5,'Natação', 50, 250, 130);

INSERT INTO Exercicios (id, tipo, minutos, calorias, frequencia_cardio)
values (6,'Futebol', 60, 240, 120);

SELECT * FROM Exercicios where calorias > 200 order by calorias;
SELECT * FROM Exercicios where calorias > 50 and minutos < 30;
SELECT * FROM Exercicios where minutos > 45 and calorias = 120;
SELECT * FROM Exercicios where calorias > 200 OR FREQUENCIA_CARDIO = 130;

select max(minutos) from exercicios;
select min(minutos) from exercicios;



CREATE TABLE Musicas (
	id INTEGER PRIMARY KEY,
	titulo varchar(150),
	artista varchar(150),
	modo varchar(150),
	duracao INTEGER,
	lancamento INTEGER ); 
    
INSERT INTO Musicas (id, titulo, artista, modo, duracao, lancamento)
values  (1,'Bohemian Rhapsody', 'Queen', 'epic', 60, 1975);

INSERT INTO Musicas (id, titulo, artista, modo, duracao, lancamento)
values  (2,'Let it go', 'Idina Menzel', 'epic', 227, 2013);

INSERT INTO Musicas (id, titulo, artista, modo, duracao, lancamento)
values  (3,'I will survive', 'Gloria Gaynor', 'epic', 198, 1978);

INSERT INTO Musicas (id, titulo, artista, modo, duracao, lancamento)
values  (4,'Twist and Shout', 'The Beatles', 'happy', 152, 1963); 

INSERT INTO Musicas (id, titulo, artista, modo, duracao, lancamento)
values  (5,'La Bamba', 'Ritchie Valens', 'happy', 166, 1958);

INSERT INTO Musicas (id, titulo, artista, modo, duracao, lancamento)
values  (6,'I will always love you', 'Whitney Houston', 'epic', 273, 1992);

INSERT INTO Musicas (id, titulo, artista, modo, duracao, lancamento)
values  (7,'Sweet Caroline', 'Neil Diamond', 'happy', 201, 1969);

INSERT INTO Musicas (id, titulo, artista, modo, duracao, lancamento)
values  (8,'Dont cry','Guns N Roses', 'happy', 193, 2011); 

INSERT INTO Musicas (id, titulo, artista, modo, duracao, lancamento)
values  (10,'WELCOME TO JUNGLE','Guns N Roses', 'happy', 193, 2011);

select * from Musicas;

select * from musicas order by titulo;
select * from musicas order by artista;
select * from musicas where modo = 'epic' or lancamento > 1990;
select * from musicas where modo = 'happy' or lancamento < 1990;
select max(duracao) from musicas;
select min(duracao) from musicas;
select titulo from modo = 'epic' and lancamento > 1990 and duracao < 5 * 60; 

