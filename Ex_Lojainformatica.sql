-- SELECIONE TODOS AS PESSOAS.

select * from clientes;
 
-- SELECIONE TODAS AS PESSOAS QUE TEM NOME = ' MARIA '
select * from clientes where nome like'%Maria %';

-- SELECIONE TODAS AS PESSOAS QUE TEM SOBRENOME = 'SILVA'
select * from clientes where nome like'%Silva%';

-- SELECIONE TODAS AS PESSOAS QUE MORAM EM SP
select * from enderecos where estado = 'SP';  

-- SELECIONE TODAS AS PESSOAS QUE TEM SEXO MASCULINO


-- SELECIONE TODAS AS PESSOAS QUE TEM CREDITO = 1000
select * from clientes where limiteCredito = 1000;

-- SELECIONE TODAS AS PESSOAS QUE TEM CREDIT0 > 1000
select * from clientes where limiteCredito > 1000;

-- SELECIONE TODAS AS PESSOAS QUE TEM CREDITO < 1000
select * from clientes where limiteCredito < 1000;

-- SELECIONE TODAS AS PESSOAS QUE NASCERAM EM 21-12-2000

-- SELECIONE O NOME E A CIDADE DAS PESSOAS QUE TEM CREDITO = 0
select nome, cidade from clientes, enderecos where limiteCredito = 0;

-- SELECIONE O SEXO DAS PESSOAS QUE TEM CREDITO > 1500

-- SELECIONE O SOBRENOME DAS PESSOAS EM QUE O NOME COMECA COM A LETRA M
select * from clientes where nome like'M%';

-- SELECIONE O NOME E O ENDERECO DAS PESSOAS QUE NASCERAM EM 30-11-2000

-- SELECIONE O NOME E O CREDITO DAS PESSOAS QUE TEM SEXO FEMININO


-- SELECIONE A CIDADE DAS PESSOAS QUE TEM SOBRENOME 'SILVA'
select cidade from enderecos where idEndereco in (
select fk_idEndereco from clientes where nome like'%SILVA%');

-- SELECIONE O NOME, A DATA DE NASCIMENTO E A CIDADE DAS PESSOAS QUE NASCERAM ENTRE 01-01-2000 A 31-12-2001

-- SELECIONE O NOME,SOBRENOME,CIDADE E SEXO DAS PESSOAS QUE TEM CREDITO > 2000
select c.nome, cidade 
from clientes c
join enderecos e on c.fk_idEndereco = e.idEndereco 
where limiteCredito > 2000;

-- SELECIONE O NOME, ENDERECO, CREDITO E A DATA DE NASCIMENTO DAS PESSOAS QUE TEM NOME = 'JOSE'
select c.nome, logradouro, limiteCredito
from clientes c
join enderecos e on c.fk_idEndereco = e.idEndereco 
where nome = 'JOSE';

-- APRESENTE A QUANTIDADE DE CLIENTES CADASTRADOS NO SISTEMA
select count(idCliente) from clientes;

-- SELECIONE TODOS OS PRODUTOS
select * from produtos;

-- SELECIONE TODOS PRODUTOS COM PRECO UNITARIO = 99
select * from produtos where precoCompra = 99;

-- SELECIONE TODOS PRODUTOS COM PRECO UNITARIO > 99
select * from produtos where precoCompra > 99;

-- SELECIONE TODOS PRODUTOS COM PRECO UNITARIO < 99
select * from produtos where precoCompra < 99;

-- SELECIONE TODOS PRODUTOS COM PRECO UNITARIO = 199
select * from produtos where precoCompra > 99;

-- SELECIONE TODOS PRODUTOS COM PRECO VENDA = 99
select * from produtos where precoVenda = 99;

-- SELECIONE TODOS PRODUTOS COM PRECO VENDA = >100
select * from produtos where precoVenda >= 100;

-- SELECIONE TODOS PRODUTOS COM PRECO VENDA <50
select * from produtos where precoVenda < 50;

-- SELECIONE TODOS PRODUTOS COM PRECO UNITARIO >99 E <500
select * from produtos where precoCompra > 99 and precoCompra < 500;

-- SELECIONE TODOS PRODUTOS COM ESTOQUE = 0


-- SELECIONE TODOS PRODUTOS COM ESTOQUE >10

-- SELECIONE TODOS PRODUTOS COM ESTOQUE <5

-- SELECIONE TODOS PRODUTOS COM ESTOQUE >2 E <10

-- SELECIONE TODOS PRODUTOS COM DATA DA COMPRA FEITA EM 12-12-2021


-- SELECIONE TODOS PRODUTOS COM DATA DA COMPRA FEITA EM 12-12-2010

-- SELECIONE TODOS PRODUTOS COM DATA DA COMPRA FEITA ENTRE 12-12-2010 E 12-01-2011

-- SELECIONE A DESCRICAO DOS PRODUTOS COM DATA DA COMPRA FEITA EM 12-12-2021

-- SELECIONE O PRECO UNITARIO DOS PRODUTOS COM DATA DA COMPRA FEITA EM 12-11-2011

-- SELECIONE A DESCRICAO E O ESTOQUE DOS PRODUTOS COM DATA DA COMPRA FEITA EM 12-12-2021

-- SELECIONE A DESCRICAO E O PRECO VENDA DOS PRODUTOS COM DATA DA COMPRA FEITA EM 12-12-2021

-- SELECIONE O ESTOQUE E A DATA DE COMPRA DOS PRODUTOS COM PRECO UNITARIO DE 10

-- SELECIONE A DESCRICAO E O PRECO VENDA DOS PRODUTOS COM PRECO UNITARIO >250
select descricao, precovenda from produtos where precocompra > 250;

-- SELECIONE A DESCRICAO E A DATA DA COMPRA DOS PRODUTOS COM ESTOQUE = 10

-- SELECIONE A DESCRICAO, O ESTOQUE, A DATA DA COMPRA DOS PRODUTOS COM PRECO VENDA >=500 ORDENE O RESULTADO PELA DESCRICAO NA ORDEM CONTRARIA

-- Quantos clientes temos cadastrados em nosso sistema?
select count(idCliente) from clientes;

-- Quantos enderecos temos cadastrados em nosso sistema?
select count(idEndereco) from enderecos;

-- Quantos produtos temos cadastrados em nosso sistema?
select count(idProduto) from produtos;

-- Quantas vendas já fizemos?
select count(idVenda) from vendas;

-- Quantos clientes temos cadastrados em nosso sistema que tem limite de credito zero?
select count(idCliente) from clientes where limiteCredito = 0;

-- Quantos enderecos temos cadastrados em nosso sistema, que são da cidade de BH?
select count(idEndereco) from enderecos where cidade = 'BH';

-- Quantos enderecos temos cadastrados em nosso sistema, que são casa?
select count(idEndereco) from enderecos where complemento = 'CASA' ;

-- Quantos enderecos temos cadastrados em nosso sistema, que são de outro estado? (Matriz em MG)?
select count(idEndereco) from enderecos where estado <> 'MG';

-- Quantos produtos temos cadastrados em nosso sistema, que são da categoria Acessorios?
select count(idProduto) from produtos where tipo = 'Acessorios';
select * from produtos;

-- Quantos produtos temos cadastrados em nosso sistema, que são da categoria Memoria?
select count(idProduto) from produtos where tipo = 'Memoria';

-- Quantos produtos temos cadastrados em nosso sistema, que o preço de compra é maior que 50?
select count(idProduto) from produtos where precoCompra > 50;

-- Quantos produtos temos cadastrados em nosso sistema, que o preço de compra é maior que 500 e menor que 100?
select count(idProduto) from produtos where precoCompra > 500 and precoCompra < 100;

-- Quantos produtos temos cadastrados em nosso sistema, que o preço de compra é igual a 200?
select count(idProduto) from produtos where precoCompra = 200;

-- Quantos produtos temos cadastrados em nosso sistema, que o preço de venda é maior que 500?
select count(idProduto) from produtos where precoVenda > 500;

# Quantos produtos temos cadastrados em nosso sistema, que o preço de venda é maior que 500  e pertence ao tipo de Memoria?
select count(idProduto) from produtos where precoVenda > 500 and tipo = 'Memoria';

# Quantos produtos temos cadastrados em nosso sistema, que o preço de compra é menor que 100 ou preco de venda é maior que 200?
select count(idProduto) from produtos where precoCompra < 100 or precoVenda > 200;

# Quantas memorias temos cadastradas em nosso sistema, que o preço de compra é maior que 200 e o preço de venda é menor que 400?
select count(idProduto) from produtos where tipo = 'Memoria' and precoCompra >  200 and precoVenda < 400;

# Qual o produto mais caro(feito a compra) cadastrado em nosso sistema?
select max(precocompra) from produtos;

# Qual a maior venda cadastrada em nosso sistema?

# Qual o produto mais barato(feito a compra) cadastrado em nosso sistema?

# Qual o produto mais caro(pra comprar) em nosso estoque e quantas unidades temos?

# Qual o produto mais barato(pra comprar) em nosso estoque e qual seu tipo?

# Qual o produto mais caro(pra comprar) em nosso estoque e quantas unidades temos?

# Qual a soma total das nossas vendas?

# Qual o valor total das vendas do intervalo 2024-09-01 a 2024-09-31?

-- Some o valor total das vendas do dia 2024-09-01 ou pode ser o dia 2024-09-31?