 # 1. — ENCONTRE O NOME DOS MARINHEIROS QUE RESERVARAM PELO MENOS 1 BARCO.
 select distinct m.nome_marin
 from marinheiros m 
 join reservas r on m.id_marin = r.fk_id_marin;
  
 
# 2.--  ENCONTRE O NOME DOS MARINHEIROS QUE RESERVARAM O BARCO INTERLAKE AZUL.
select m.nome_marin 
from marinheiros m 
join reservas r on m.id_marin = r.fk_id_marin
join barcos b on b.id_barco = r.fk_id_barco
where b.nome_barco = 'Interlake'
and b.cor = 'AZUL';

# 3.--  ENCONTRE A AVALIAÇÃO DOS MARINHEIROS QUE RESERVARAM O BARCO MARINE.
select m.avaliacao 
from marinheiros m 
join reservas r on m.id_marin = r.fk_id_marin
join barcos b on b.id_barco = r.fk_id_barco
where b.nome_barco = 'Marine';

# 4.--  ENCONTRE A DATA DE NASCIMENTO E O NOME, DOS MARINHEIROS QUE RESERVARAM O BARCO CLIPPER
select m.dataNascimento, m.nome_marin
from marinheiros m 
join reservas r on m.id_marin = r.fk_id_marin
join barcos b on b.id_barco = r.fk_id_barco
where b.nome_barco = 'CLIPPER';


# 5.--  ENCONTRE O ID E O DIA EM QUE OS MARINHEIROS RESERVARAM UM BARCO VERMELHO
select r.fk_id_marin, r.diaReserva
from reservas r 
join barcos b on b.id_barco = r.fk_id_barco
where b.cor = 'VERMELHO';

# 6.--  ENCONTRE O ID E O DIA EM QUE OS MARINHEIROS RESERVARAM UM BARCO VERDE
select r.fk_id_marin, r.diaReserva
from reservas r 
join barcos b on b.id_barco = r.fk_id_barco
where b.cor = 'VERDE';

# 7.--  ENCONTRE O ID E O DIA EM QUE OS MARINHEIROS RESERVARAM UM BARCO AZUL
select r.fk_id_marin, r.diaReserva
from reservas r 
join barcos b on b.id_barco = r.fk_id_barco
where b.cor = 'AZUL';

# 8. — ENCONTRE AS CORES DOS BARCOS RESERVADOS POR LUBBER APRESENTE O NOME DO BARCO E A COR
select b.nome_barco, b.cor
from barcos b 
join reservas r on b.id_barco = r.fk_id_barco 
join marinheiros m on m.id_marin = r.fk_id_marin
where m.nome_marin = 'Lubber';

# 9. — ENCONTRE AS DATAS E O NOME DOS BARCOS RESERVADOS POR TECLAUDIO. 
select  r.diaReserva, b.nome_barco
from barcos b 
join reservas r on b.id_barco = r.fk_id_barco 
join marinheiros m on m.id_marin = r.fk_id_marin
where m.nome_marin = 'TECLAUDIO';

# 10.— ENCONTRE AS CORES E O NOME DOS BARCOS RESERVADOS POR DUSTIN NO DIA 10/10/2023
select  b.cor, b.nome_barco
from barcos b 
join reservas r on b.id_barco = r.fk_id_barco 
join marinheiros m on m.id_marin = r.fk_id_marin
where m.nome_marin = 'DUSTIN'
and r.diaReserva = '2023.10.10';

# 11.— ENCONTRE O NOME DE QUEM RESERVOU UM BARCO NO DIA 2023/05/09
select  m.nome_marin
from marinheiros m 
join reservas r on m.id_marin = r.fk_id_marin 
and r.diaReserva = '23.05.09';

 #12.— ENCONTRE O NOME DE QUEM RESERVOU UM BARCO DEPOIS DO DIA 2023/05/09 AGRUPE PELOS NOMES
 select  m.nome_marin
from marinheiros m 
join reservas r on m.id_marin = r.fk_id_marin 
and r.diaReserva > '23.05.09'
group by m.nome_marin;
 