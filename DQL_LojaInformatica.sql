-- SELECIONE TODOS CLIENTES CADASTRADOS.
select * from clientes;
	
-- SELECIONE O NOME E CPF DOS CLIENTES CADASTRADOS.
select nome, cpf from clientes;
	
-- SELECIONE O NOME E EMAIL DOS CLIENTES CADASTRADOS.
select nome, email from clientes;
	
-- SELECIONE O NOME E LIMITE DE CREDITO DOS CLIENTES CADASTRADOS.
select nome, limiteCredito from clientes;

-- SELECIONE TODOS ENDERECOS CADASTRADOS.
select * from enderecos;

-- SELECIONE O LOGRADOURO E O CEP DOS ENDERECOS CADASTRADOS.
select logradouro, cep from enderecos;

-- SELECIONE O BAIRRO E A CIDADE DOS ENDERECOS CADASTRADOS.
select bairro, cidade from enderecos;

-- SELECIONE O LOGRADOURO E O BAIRRO DOS ENDERECOS CADASTRADOS.
select logradouro, bairro from enderecos;

-- SELECIONE O LOGRADOURO, O CEP E A CIDADE DOS ENDERECOS CADASTRADOS.
select logradouro, cep, cidade from enderecos;

-- SELECIONE TODOS PRODUTOS CADASTRADOS.
select * from produtos;
 
-- SELECIONE A DESCRICAO DOS PRODUTOS CADASTRADOS. 
select descricao from produtos;

-- SELECIONE A DESCRICAO E O TIPO DOS PRODUTOS CADASTRADOS.
select descricao, tipo from produtos;
 
-- SELECIONE A DESCRICAO O TIPO E O PRECO DE COMPRA DOS PRODUTOS CADASTRADOS.
select descricao, tipo, precocompra from produtos;
 
-- SELECIONE A DESCRICAO O TIPO E O PRECO DE VENDA DOS PRODUTOS CADASTRADOS. 
select descricao, tipo, precovenda from produtos;

-- SELECIONE TODAS AS VENDAS.
select * from vendas;

-- SELECIONE O ID DO CLIENTE E O VALORTOTAL DA VENDA.
select fk_idCliente, valortotal from vendas;

-- SELECIONE O ID DO CLIENTE O VALORTOTAL E A DATA DA VENDA DA VENDA.
select fk_idCliente, valortotal, dataVenda from vendas;

-- SELECIONE O VALORTOTAL E A DATA DA VENDA DA VENDA.
select valortotal, datavenda from vendas;

-- SELECIONE TODAS OS ITENS DE VENDA
select * from vendas;

-- SELECIONE O ID DA VENDA E O ID DO PRODUTO VENDIDO.
select fk_idvenda, fk_idProduto from itemsvendas;

-- SELECIONE O ID DA VENDA O ID DO PRODUTO E A QUANTIDADE.
select fk_idvenda, fk_idproduto, quantidade from itemsvendas;

#-------WHERE  =  >  <  <=  >=  AND   OR  NOT   BETWEEN  LIMIT   IN -  NOT IN -------------------------------------------------------------------------------------------

-- SELECIONE O LOGRADOURO E O CEP DOS ENDERECOS CADASTRADOS 
-- ONDE O ID DO ENDERECO SEJA 1.
select logradouro, cep from enderecos where idEndereco > 1;

	-- SELECIONE O BAIRRO E A CIDADE DOS ENDERECOS CADASTRADOS 
-- ONDE O ID DO ENDERECO SEJA 2.
select bairro, cidade from enderecos where idEndereco = 2;

-- SELECIONE O LOGRADOURO E O BAIRRO DOS ENDERECOS CADASTRADOS
-- ONDE O ID DO ENDERECO SEJA 3.
SELECT LOGRADOURO AS 'NOME_RUA',BAIRRO FROM ENDERECOS  WHERE IDENDERECO = 3;

-- SELECIONE O LOGRADOURO, O CEP E A CIDADE DOS ENDERECOS CADASTRADOS ONDE O ID DO ENDERECO SEJA 4 .
select logradouro, cep, cidade from enderecos where idEndereco = 4;

-- SELECIONE A DESCRICAO DOS PRODUTOS CADASTRADOS WHERE 
-- ID DO PRODUTO SEJA MAIOR QUE 2. 
select descricao from produtos where idProduto > 2;

-- SELECIONE A DESCRICAO E O TIPO DOS PRODUTOS CADASTRADOS 
-- WHERE ID DO PRODUTO SEJA MENOR QUE 5 OU O PRODUTO SEJA 'MEMORIA DD4 8 GB'.
SELECT IDPRODUTO,DESCRICAO FROM PRODUTOS WHERE IDPRODUTO < 5 or DESCRICAO ='MEMORIA DDR4-8GB';

-- SELECIONE A DESCRICAO O TIPO E O PRECO DE COMPRA DOS PRODUTOS CADASTRADOS
-- WHERE ID DO PRODUTO ESTEJA ENTRE 2 E 5.
select idProduto, descricao,  tipo, precocompra from produtos where idProduto >2 and idProduto < 5;

-- SELECIONE A DESCRICAO O TIPO E O PRECO DE VENDA DOS PRODUTOS CADASTRADOS
-- WHERE ID DO PRODUTO ESTEJA ENTRE 2 E 5 PARA QUE TAMBEM APAREÇA O 2 E 5. 
SELECT IDPRODUTO,DESCRICAO,TIPO,PRECOCOMPRA FROM PRODUTOS WHERE IDPRODUTO BETWEEN 2 AND 5 ;

-- SELECIONE O ID DO CLIENTE E O VALORTOTAL DA VENDA ONDE O 
-- VALOR TOTAL SEJA MAIOR QUE R$100.00 E TAMBEM A DATA DE VENDA SEJA POSTERIOR A 2024-09-30
select fk_idcliente, valortotal from vendas where valortotal > '100,00' and datavenda > '2024-09-30';

-- SELECIONE O ID DO CLIENTE O VALORTOTAL E A DATA DA VENDA DA VENDA 
-- ONDE O VALOR TOTAL SEJA MENOR QUE R$300.00 E DATA DA VENDA MAIOR QUE ATUAL
select fk_idcliente, valortotal, datavenda from vendas where valortotal < '300,00' and datavenda > now();

-- SELECIONE O VALORTOTAL E A DATA DA VENDA  ONDE O 
-- VALOR TOTAL SEJA MAIOR QUE R$100.00 E MENOR QUE R$500.00.
select valortotal, datavenda from vendas where valortotal > '100,00' and valortotal < '500,00';

-- SELECIONE TODAS OS ITENS DE VENDA ONDE O ID DOS ITENS SEJA MAIOR QUE 2.
 select * from itemsvendas where idItemVenda > 2;
 
-- SELECIONE O ID DA VENDA E O ID DO PRODUTO VENDIDO ONDE AMBOS SEJAM MAIOR QUE 3.
select fk_idvenda,  fk_idproduto from itemsvendas where fk_idVenda > 3 and fk_idProduto > 3;

-- SELECIONE O ID DA VENDA O ID DO PRODUTO E A QUANTIDADE ONDE A QUANTIDADE SEJA MAIOR QUE 2 E MENOR QUE 4.
select fk_idvenda, fk_idproduto, quantidade from itemsvendas where quantidade > 2 and quantidade < 4;

#---------------ORDER BY     LIMIT    GROUP BY    LIKE   ----------------------------------------------------------------------------------------------------------------------------

-- SELECIONE O ID DO CLIENTE E O VALORTOTAL DA VENDA ONDE O 
-- VALOR TOTAL SEJA MAIOR QUE R$100.00 ORDENE OS RESULTADOS PELO VALOR TOTAL
select fk_idcliente, valortotal from vendas where valorTotal > '100,00' 
order by valortotal;

-- SELECIONE O ID DO CLIENTE O VALORTOTAL E A DATA DA VENDA DA 
-- VENDA ONDE O VALOR TOTAL SEJA MENOR QUE R$300.00 ORDENE OS RESULTADOS PELA DATA DA VENDA
select fk_idcliente, valortotal, datavenda from vendas where valorTotal < '300,00' 
order by datavenda;

-- SELECIONE O VALORTOTAL E A DATA DA VENDA DA VENDA ONDE O 
-- VALOR TOTAL SEJA MAIOR QUE R$100.00 E MENOR QUE R$500.00. 
-- ORDENE OS RESULTADOS PELO VALOR TOTAL
select valortotal, dataVenda from vendas where valorTotal > '100,00' and valortotal < '500,00'
order by valortotal;

-- SELECIONE TODOS CLIENTES CADASTRADOS ORDENE PELO NOME EM ORDEM DECRESCENTE.
select * from clientes order by nome desc;

-- SELECIONE O NOME E CPF DOS CLIENTES CADASTRADOS ONDE O NOME COMEÇE COM A LETRA A.
select nome, cpf from clientes where nome like'A%';

-- SELECIONE O NOME E EMAIL DOS CLIENTES CADASTRADOS ONDE O EMAIL TERMINE COM A LETRA A.
select nome, email from clientes where nome like'%A';

-- SELECIONE O NOME E LIMITE DE CREDITO DOS CLIENTES CADASTRADOS 
-- ONDE O NOME CONTENHA A SILABA MA
select nome, limitecredito from clientes where nome like'%MA%';

-- DE QUEM É O CPF NUMERO: 123.123.123-99? R: Leandro Silva
SELECT * FROM CLIENTES WHERE CPF = '123.123.123-99';

-- QUAL O NOME DO CLIENTE QUE TEM O EMAIL JS@GMAIL.COM? R: Ninguém
select * from clientes where email = 'JS@GMAIL.COM';

-- QUAIS AS VENDAS FEITAS PARA O CLIENTE DE ID 4? R: idvenda = 5
select * from vendas where fk_idCliente = 4;

-- EM QUE DATA FOI REALIZADA UM VENDA MAIOR QUE 500? R: 2024-10-09 21:15:43
select datavenda from vendas where valorTotal > '500,00';

-- QUAL CLIENTE MORA NO ENDERECO QUE O ID É IGUAL A 2? R: Marcus Santos, idCliente = 2
select * from clientes where fk_idEndereco = 2;





















