


-- PESQUISAR

-- SELECIONE TODOS AS PESSOAS.
	select nome from clientes; 

-- SELECIONE TODAS AS PESSOAS QUE TEM NOME =  ' MARIA '
	select nome from clientes where nome like '%maria %';

-- SELECIONE TODAS AS PESSOAS QUE TEM SOBRENOME = 'SILVA'
	select nome from clientes where nome like '%silva%';

-- SELECIONE TODAS AS PESSOAS QUE MORAM EM SP
	select cidade from enderecos where cidade = 'SP';
	select * from enderecos;

-- SELECIONE TODAS AS PESSOAS QUE TEM SEXO MASCUINO ## Sem o atribto sexo##
	select nome from clientes where sexo = "m";##Não há um atributo definindo o sexo do cliente##

-- SELECIONE TODAS AS PESSOAS QUE TEM CREDITO = 1000
	select nome from clientes where limiteCredito = '1000';
	select * from clientes;

-- SELECIONE TODAS AS PESSOAS QUE TEM CREDIT0 > 1000
	select nome from clientes where limiteCredito > '1000';

-- SELECIONE TODAS AS PESSOAS QUE TEM CREDITO < 1000
	select nome from clientes where limiteCredito < '1000';

-- SELECIONE TODAS AS PESSOAS QUE NASCERAM EM 21-12-2000 
	select nome from pessoas where nascimento = '21-12-2000'; # Houve um erro pela falta do atribito Nascimento.#

-- SELECIONE O NOME E A CIDADE DAS PESSOAS QUE TEM CREDITO = 0
	select nome,fk_idendereco from clientes where limitecredito ='0';
	select * from clientes;

-- SELECIONE O SEXO DAS PESSOAS QUE TEM CREDITO > 1500
	select sexo from clientes where limiteCredito > 1500; # Houve um erro pela falta do atribito Sexo. #
	select * from clientes where limiteCredito > 1500;##Recurso para saber qual o sexo, já que nao existe o atributo sexo ##

-- SELECIONE O SOBRENOME DAS PESSOAS EM QUE O NOME COMECA COM A LETRA M
	select nome from clientes where nome like 'M%'; #Tirar duvida se tem como pegar apenas o sobre nome#

-- SELECIONE O NOME E O ENDERECO DAS PESSOAS QUE NASCERAM EM 30-11-2000
	select nome,fk_idEndereco from clientes where nascimento = '30-11-2000'; # Houve um erro pela falta do atribito Nascimento. # 

-- SELECIONE O NOME E O CREDITO DAS PESSOAS QUE TEM SEXO FEMININO
	select nome,limiteCredito from clientes where sexo like '%F%'; # Houve um erro pela falta do atribito sexo. #

-- SELECIONE A CIDADE DAS PESSOAS QUE TEM SOBRENOME 'SILVA' 
	select enderecos.cidade,clientes.nome from clientes join enderecos on enderecos.idEndereco = fk_idEndereco where nome like '%silva';
	#Exercício executado antes da explicação do conteudo #
 
-- SELECIONE O NOME, A DATA DE NASCIMENTO E A CIDADE DAS PESSOAS QUE NASCERAM ENTRE 01-01-2000 A 31-12-2001
	## NÃO EXISTE O ATRIBUTO NASCIMENTO ##
	select clientes.nome,enderecos.cidade from clientes join enderecos on enderecos.idEndereco =clientes.fk_idEndereco;
	## Uma busca paleativa com os atributos disponivel nas entidades ##

-- SELECIONE O NOME,SOBRENOME,CIDADE E SEXO DAS PESSOAS QUE TEM CREDITO > 2000
	select clientes.nome,enderecos.cidade from clientes join enderecos on enderecos.idEndereco = clientes.fk_idEndereco where limiteCredito > 2000; 
	# Há a falta do atribto sexo, busca realizada apens com atributos disponiveis nas entidades #
		
-- SELECIONE O NOME, ENDERECO, CREDITO E A DATA DE NASCIMENTO DAS PESSOAS QUE TEM NOME = 'JOSE'
	select clientes.nome,enderecos.*,clientes.limiteCredito from clientes join enderecos on enderecos.idEndereco = clientes.fk_idEndereco where nome like 'jose%';
	select * from clientes;#Não há um cliente chamado JOSE# 

-- APRESENTE A QUANTIDADE DE CLIENTES CADASTRADOS NO SISTEMA
	select count(nome) from clientes;

-- SELECIONE TODOS OS PRODUTOS
	select * from produtos;

 -- SELECIONE TODOS PRODUTOS COM PRECO UNITARIO = 99
	select * from produtos where precoCompra = '99';

 -- SELECIONE TODOS PRODUTOS COM PRECO UNITARIO > 99
	select * from produtos where precoCompra  > '99';

 -- SELECIONE TODOS PRODUTOS COM PRECO UNITARIO < 99
	select * from produtos where precoCompra < '99';

 -- SELECIONE TODOS PRODUTOS COM PRECO UNITARIO = 199
	select * from produtos where precoCompra = '199';

 -- SELECIONE TODOS PRODUTOS COM PRECO VENDA = 99
	select * from produtos where precoVenda = '99';

 -- SELECIONE TODOS PRODUTOS COM PRECO VENDA = >100
	select * from produtos where precoVenda > '99';

 -- SELECIONE TODOS PRODUTOS COM PRECO VENDA <50
	select * from produtos where precoVenda < '50';

 -- SELECIONE TODOS PRODUTOS COM PRECO UNITARIO >99 E <500
	select * from produtos where precoCompra > 99 and precoCompra < 500;

 -- SELECIONE TODOS PRODUTOS COM ESTOQUE = 0
	select * from itemsvendas where quantidade = '0';

 -- SELECIONE TODOS PRODUTOS COM ESTOQUE >10
	select * from itemsvendas where quantidade > '10';

 -- SELECIONE TODOS PRODUTOS COM ESTOQUE <5
	select * from itemsvendas where quantidade < '5';

 -- SELECIONE TODOS PRODUTOS COM ESTOQUE >2 E <10
	select * from itemsvendas where quantidade > '2' and quantidade < 10;

 -- SELECIONE TODOS PRODUTOS COM DATA DA COMPRA FEITA EM 12-12-2021(completar)
	select p.descricao,v.datavenda from itemsvendas i join produtos p on p.idProduto = i.fk_idProduto 
	join vendas v on v.dataVenda = i.fk_idVenda where dataVenda = '2024-10-08';
    #Não há o atributo datadaCompra, alterei a pergunta para dataVenda e para uma data existente no BD#
		 

 -- SELECIONE TODOS PRODUTOS COM DATA DA COMPRA FEITA EM 12-12-2010
	select p.descricao,v.dataVenda  from itemsvendas i join produtos p on p.idProduto = i.fk_idProduto 
	join vendas v on v.idVenda = i.fk_idVenda where dataVenda = '2024-10-08'; 
	#Não há o atributo datadaCompra, alterei a pergunta para dataVenda e para uma data existente no BD#

 -- SELECIONE A DESCRICAO DOS PRODUTOS COM DATA DA COMPRA FEITA EM 12-12-2021
	select p.descricao,v.datavenda from itemsvendas i join produtos p on p.idProduto = i.fk_idProduto
	join vendas v on v.idVenda = i.fk_idVenda where dataVenda = '2024-10-09';  

 -- SELECIONE O PRECO UNITARIO DOS PRODUTOS COM DATA DA COMPRA FEITA EM 12-11-2011
	select p.precoVenda,v.datavenda from itemsvendas i join produtos p on p.idProduto = i.fk_idProduto
	join vendas v on v.idVenda = i.fk_idVenda where dataVenda = '2024-10-08';  

 -- SELECIONE A DESCRICAO E O ESTOQUE DOS PRODUTOS COM DATA DA COMPRA FEITA EM 12-12-2021
	select p.descricao,v.datavenda from itemsvendas i join produtos p on p.idProduto = i.fk_idProduto
	join vendas v on v.idVenda = i.fk_idVenda where dataVenda = '2024-10-09';  

 -- SELECIONE A DESCRICAO E O PRECO VENDA DOS PRODUTOS COM DATA DA COMPRA FEITA EM 12-12-2021
	select p.descricao,v.datavenda,p.precoVenda from itemsvendas i join produtos p on p.idProduto = i.fk_idProduto
	join vendas v on v.idVenda = i.fk_idVenda where dataVenda = '2024-10-16';# Verificar por que no dia 16 nao retorna nada #
    select * from vendas; 

 -- SELECIONE O ESTOQUE E A DATA DE COMPRA DOS PRODUTOS COM PRECO UNITARIO DE 10
 select p.descricao,v.datavenda, p.precoCompra from itemsvendas i join produtos p on p.idProduto = i.fk_idProduto
	join vendas v on v.idVenda = i.fk_idVenda where p.precoCompra = '50';  
	select * from produtos;
 -- SELECIONE A DESCRICAO E O PRECO VENDA DOS PRODUTOS COM PRECO UNITARIO >250
select descricao,precovenda from produtos where precoVenda > 250;

 -- SELECIONE A DESCRICAO E A DATA DA COMPRA DOS PRODUTOS COM ESTOQUE = 10
 ## NÃO HÁ COMO FORNERCER A INFORMÃO sobre o atributo estoque## 

 -- SELECIONE A DESCRICAO, O ESTOQUE, A DATA DA COMPRA DOS PRODUTOS COM PRECO VENDA >=500 ORDENE O RESULTADO PELA DESCRICAO NA ORDEM CONTRARIA 
 select descricao,precoVenda from produtos where precoVenda >=500 order by precoVenda desc;
 
-- -------------------CALCULAR-------------------------------------------------------------
-- Quantos clientes temos cadastrados em nosso sistema?
select count(nome) from clientes;

-- Quantos enderecos temos cadastrados em nosso sistema?
select count(idendereco) from enderecos;

-- Quantos produtos temos cadastrados em nosso sistema?
select count(idproduto) from produtos;

-- Quantas vendas já fizemos?
select count(idvenda) from vendas;

-- Quantos clientes temos cadastrados em nosso sistema que tem limite de credito zero?
select count(nome) from clientes where limiteCredito = '0';

-- Quantos enderecos temos cadastrados em nosso sistema, que são da cidade de BH?
select count(idendereco) from enderecos where cidade = 'BH';

-- Quantos enderecos temos cadastrados em nosso sistema, que são casa?
select count(idendereco) from enderecos where complemento = 'casa';

-- Quantos enderecos temos cadastrados em nosso sistema, que são de outro estado?(Matriz em MG)?
select count(idendereco) from enderecos where cidade != "bh";

-- Quantos produtos temos cadastrados em nosso sistema, que são da categoria Acessorios?
select count(idproduto) from produtos where tipo = 'acessorios';

-- Quantos produtos temos cadastrados em nosso sistema, que são da categoria Memoria?
select count(idproduto) from produtos where tipo = 'memoria';

-- Quantos produtos temos cadastrados em nosso sistema, que o preço de compra é maior que 50?
select count(idproduto) from produtos where precoCompra > '50';

-- Quantos produtos temos cadastrados em nosso sistema, que o preço de compra é maior que 500 e menor que 100?
select count(idproduto) from produtos where precoCompra >'500' and precoCompra < 100 ;

-- Quantos produtos temos cadastrados em nosso sistema, que o preço de compra é igual a 200?
select count(idproduto) from produtos where precoCompra = '200';

-- Quantos produtos temos cadastrados em nosso sistema, que o preço de venda é maior que 500?
select count(idproduto) from produtos where precoVenda > 500;

# Quantos produtos temos cadastrados em nosso sistema, que o preço de venda é maior que 500
--  e pertence ao tipo de Memoria?
select count(idproduto) from produtos where precoVenda > 500 and tipo like '%memoria%';
select * from produtos;

# Quantos produtos temos cadastrados em nosso sistema, que o preço de compra é menor que 100
--  ou preco de venda é maior que 200?
select count(idproduto) from produtos where precoCompra < 100 or precoVenda > 200;

# Quantas memorias temos cadastradas em nosso sistema, que o preço de compra é maior que 200
--  e o preço de venda é menor que 400?
select count(tipo) from produtos where precoCompra > 200 and precoVenda < 400 and tipo like '%memoria%';

# Qual o produto mais caro(feito a compra) cadastrado em nosso sistema?
select max(precocompra) from produtos;

# Qual a maior venda cadastrada em nosso sistema?
select max(valortotal) from vendas;
select * from vendas;

# Qual o produto mais barato(feito a compra) cadastrado em nosso sistema?
select min(precocompra) from produtos;

# Qual o produto mais caro(pra comprar) em nosso estoque e quantas unidades temos?
select max(precoCompra) from produtos;

# Qual o produto mais barato(pra comprar) em nosso estoque e qual seu tipo?
select min(precoCompra) from produtos;

# Qual o produto mais caro(pra comprar) em nosso estoque e quantas unidades temos?
select max(precocompra) from produtos; 

# Qual a soma total das nossas vendas?
select sum(valortotal) from vendas;

# Qual o valor total das vendas do intervalo 2024-09-01 a 2024-09-31?
select valortotal,datavenda from vendas where datavenda between '2024-10-01' and '2024-10-31';
select * from vendas;

# Some o valor total das vendas do dia 2024-09-01 ou pode ser o dia 2024-09-31?
select sum(valortotal) from vendas where datavenda like '%2024-10-16%' or dataVenda like '%2024-10-10%';

-- SELECIONE TODOS CLIENTES CADASTRADOS.
	select * from clientes;
	
-- SELECIONE O NOME E CPF DOS CLIENTES CADASTRADOS.
	select nome,cpf from clientes;

-- SELECIONE O NOME E EMAIL DOS CLIENTES CADASTRADOS.
	select nome,email from clientes;
	
-- SELECIONE O NOME E LIMITE DE CREDITO DOS CLIENTES CADASTRADOS.
	select nome,limiteCredito from clientes;

-- SELECIONE TODOS ENDERECOS CADASTRADOS.
select * from enderecos;

-- SELECIONE O LOGRADOURO E O CEP DOS ENDERECOS CADASTRADOS.
select logradouro,cep from enderecos;

-- SELECIONE O BAIRRO E A CIDADE DOS ENDERECOS CADASTRADOS.
select bairro, cidade from enderecos;

-- SELECIONE O LOGRADOURO E O BAIRRO DOS ENDERECOS CADASTRADOS.
select bairro, logradouro from enderecos;

-- SELECIONE O LOGRADOURO, O CEP E A CIDADE DOS ENDERECOS CADASTRADOS.
select cep, cidade from enderecos;

-- SELECIONE TODOS PRODUTOS CADASTRADOS.
 select * from produtos;
 
-- SELECIONE A DESCRICAO DOS PRODUTOS CADASTRADOS. 
 select descricao from produtos;

-- SELECIONE A DESCRICAO E O TIPO DOS PRODUTOS CADASTRADOS.
	select descricao,tipo from produtos;
 
-- SELECIONE A DESCRICAO O TIPO E O PRECO DE COMPRA DOS PRODUTOS CADASTRADOS.
	select descricao,tipo,precoCompra from produtos;
  
-- SELECIONE A DESCRICAO O TIPO E O PRECO DE VENDA DOS PRODUTOS CADASTRADOS. 
	select descricao,tipo,precoVenda from produtos;

-- SELECIONE TODAS AS VENDAS.
select * from vendas;

-- SELECIONE O ID DO CLIENTE E O VALORTOTAL DA VENDA.
select fk_idCliente,valorTotal from vendas;

-- SELECIONE O ID DO CLIENTE O VALORTOTAL E A DATA DA VENDA DA VENDA.
select fk_idCliente,valorTotal,dataVenda from vendas;

-- SELECIONE O VALORTOTAL E A DATA DA VENDA DA VENDA.
select valorTotal,dataVenda from vendas;

-- SELECIONE TODAS OS ITENS DE VENDA
select * from itemsvendas;

-- SELECIONE O ID DA VENDA E O ID DO PRODUTO VENDIDO.
select fk_idvenda,fk_idproduto from itemsvendas;

-- SELECIONE O ID DA VENDA O ID DO PRODUTO E A QUANTIDADE.
select fk_idProduto,fk_idVenda,quantidade from itemsvendas;

#-------WHERE  =  >  <  <=  >=  AND   OR  NOT   BETWEEN  LIMIT   IN -  NOT IN -------------------------------------------------------------------------------------------

-- SELECIONE O LOGRADOURO E O CEP DOS ENDERECOS CADASTRADOS 
-- ONDE O ID DO ENDERECO SEJA 1.
select Logradouro,cep from enderecos where idEndereco = '1'; 

-- SELECIONE O BAIRRO E A CIDADE DOS ENDERECOS CADASTRADOS 
-- ONDE O ID DO ENDERECO SEJA 2.
select bairro,cidade from enderecos where idendereco = '2';

-- SELECIONE O LOGRADOURO E O BAIRRO DOS ENDERECOS CADASTRADOS
-- ONDE O ID DO ENDERECO SEJA 3.
SELECT LOGRADOURO AS 'NOME_RUA',BAIRRO FROM ENDERECOS  WHERE IDENDERECO = 3;


-- SELECIONE O LOGRADOURO, O CEP E A CIDADE DOS ENDERECOS CADASTRADOS ONDE O ID DO ENDERECO SEJA 4 .
SELECT LOGRADOURO,cep,cidade FROM ENDERECOS  WHERE IDENDERECO = 4;

-- SELECIONE A DESCRICAO DOS PRODUTOS CADASTRADOS WHERE 
-- ID DO PRODUTO SEJA MAIOR QUE 2. 
select descricao from produtos where idProduto > '2';

-- SELECIONE A DESCRICAO E O TIPO DOS PRODUTOS CADASTRADOS 
-- WHERE ID DO PRODUTO SEJA MENOR QUE 5 OU O PRODUTO SEJA 'MEMORIA DD4 8 GB'.
SELECT IDPRODUTO,DESCRICAO FROM PRODUTOS WHERE IDPRODUTO < 5 OR DESCRICAO ='MEMORIA DDR4-8GB' ;

-- SELECIONE A DESCRICAO O TIPO E O PRECO DE COMPRA DOS PRODUTOS CADASTRADOS
-- WHERE ID DO PRODUTO ESTEJA ENTRE 2 E 5.
select descricao,tipo,precocompra from produtos where idProduto > 2 and idProduto < 5;

-- SELECIONE A DESCRICAO O TIPO E O PRECO DE VENDA DOS PRODUTOS CADASTRADOS
-- WHERE ID DO PRODUTO ESTEJA ENTRE 2 E 5 PARA QUE TAMBEM APAREÇA O 2 E 5. 

 SELECT IDPRODUTO,DESCRICAO,TIPO,PRECOVENDA FROM PRODUTOS WHERE IDPRODUTO >=2 AND IDPRODUTO <= 5 ;
  SELECT IDPRODUTO,DESCRICAO,TIPO,PRECOVENDA FROM PRODUTOS WHERE IDPRODUTO BETWEEN 2 AND 5 ;

-- SELECIONE O ID DO CLIENTE E O VALORTOTAL DA VENDA ONDE O 
-- VALOR TOTAL SEJA MAIOR QUE R$100.00 E TAMBEM A DATA DE VENDA SEJA POSTERIOR A 2024-09-30
select fk_idCliente,valortotal from vendas where valortotal > 100 and dataVenda > 2024-09-30;

-- SELECIONE O ID DO CLIENTE O VALORTOTAL E A DATA DA VENDA DA VENDA 
-- ONDE O VALOR TOTAL SEJA MENOR QUE R$300.00 E DATA DA VENDA MAIOR QUE ATUAL
select fk_idCliente,valortotal,dataVenda from vendas where valortotal < 300 and dataVenda > now();


-- SELECIONE O VALORTOTAL E A DATA DA VENDA  ONDE O 
-- VALOR TOTAL SEJA MAIOR QUE R$100.00 E MENOR QUE R$500.00.
select valortotal,dataVenda from vendas where valortotal > 100 and valorTotal < 500;
select * from vendas;

-- SELECIONE TODAS OS ITENS DE VENDA ONDE O ID DOS ITENS SEJA MAIOR QUE 2.
 SELECT IDPRODUTO, DESCRICAO,TIPO FROM PRODUTOS WHERE NOT IDPRODUTO = (2) ;

-- SELECIONE O ID DA VENDA E O ID DO PRODUTO VENDIDO ONDE AMBOS SEJAM MAIOR QUE 3.
select fk_idVenda,fk_idProduto from itemsvendas where fk_idProduto > 3 and fk_idVenda > 3;

-- SELECIONE O ID DA VENDA O ID DO PRODUTO E A QUANTIDADE ONDE A QUANTIDADE SEJA MAIOR QUE 2 E MENOR QUE 4.
select fk_idVenda,fk_idProduto,quantidade from itemsvendas where quantidade > 2 and quantidade < 4;
select * from itemsvendas;

#---------------ORDER BY     LIMIT    GROUP BY    LIKE   ----------------------------------------------------------------------------------------------------------------------------

-- SELECIONE O ID DO CLIENTE E O VALORTOTAL DA VENDA ONDE O 
-- VALOR TOTAL SEJA MAIOR QUE R$100.00 ORDENE OS RESULTADOS PELO VALOR TOTAL
select fk_idcliente,valortotal from vendas where valorTotal > 100 order by valorTotal;

-- SELECIONE O ID DO CLIENTE O VALORTOTAL E A DATA DA VENDA DA 
-- VENDA ONDE O VALOR TOTAL SEJA MENOR QUE R$300.00 ORDENE OS RESULTADOS PELA DATA DA VENDA
select fk_idcliente,valortotal,dataVenda from vendas where valorTotal < 300 order by dataVenda;

-- SELECIONE O VALORTOTAL E A DATA DA VENDA DA V:ENDA ONDE O 
-- VALOR TOTAL SEJA MAIOR QUE R$100.00 E MENOR QUE R$500.00. 
-- ORDENE OS RESULTADOS PELO VALOR TOTAL
select dataVenda,valortotal from vendas where valorTotal > 100 and valorTotal < 500 order by valorTotal;

-- SELECIONE TODOS CLIENTES CADASTRADOS ORDENE PELO NOME EM ORDEM DECRESCENTE.
select * from clientes order by nome desc;

-- SELECIONE O NOME E CPF DOS CLIENTES CADASTRADOS ONDE O NOME COMEÇE COM A LETRA A.
select nome,cpf from clientes where nome like 'a%';
select * from clientes;
-- SELECIONE O NOME E EMAIL DOS CLIENTES CADASTRADOS ONDE O EMAIL TERMINE COM A LETRA A.
select nome,email from clientes where email like '%a';

-- SELECIONE O NOME E LIMITE DE CREDITO DOS CLIENTES CADASTRADOS 
-- ONDE O NOME CONTENHA A SILABA MA
select nome,limitecredito from clientes where nome like '%ma%';

-- DE QUEM É O CPF NUMERO: 123.123.123-99?
select nome from clientes where cpf like '%123.123.123-99%';

-- QUAL O NOME DO CLIENTE QUE TEM O EMAIL JS@GMAIL.COM?
select nome from clientes where email like '%js@gmail.com%';

-- QUAIS AS VENDAS FEITAS PARA O CLIENTE DE ID 4?
select idvenda from vendas where fk_idCliente like '%4%'; 

-- EM QUE DATA FOI REALIZADA UM VENDA MAIOR QUE 500?
select datavenda from vendas where valorTotal > 500;

-- QUAL CLIENTE MORA NO ENDERECO QUE O ID É IGUAL A 2?
select nome from clientes where fk_idEndereco like "%2%"; 
