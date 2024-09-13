--Thaiane Bento E Henrique Knaul

--A)
select v.id_venda, p.nome As nome_cliente
from venda v
	INNER JOIN cliente as c
		ON  v.id_cliente = c.id_cliente
	INNER JOIN pessoa p
		ON c.id_cliente = p.id_pessoa;

--B)
SELECT nome
FROM produto;

--C)
SELECT p.nome
FROM produto p, item_estoque ie
INNER JOIN item_estoque ie
	ON p.id_produto = ie.id_produto;

--D)
SELECT p.nome
FROM produto p
INNER JOIN item_estoque ie
 ON p.id_produto = ie.id_produto
 WHERE ie.id_venda IS NOT NULL;

--E)
SELECT p.nome
FROM cliente c,fornecedor f, pessoa p
WHERE c.id_cliente = f.id_fornecedor
AND p.id_pessoa = f.id_fornecedor;

--F)
SELECT p.nome
FROM cliente c
INNER JOIN fornecedor as f
ON c.id_cliente = f.id_fornecedor
INNER JOIN pessoa p 
ON p.id_pessoa = f.id_fornecedor;

--G)
SELECT p.nome
FROM pessoa p
INNER JOIN  fornecedor f
ON p.id_pessoa = f.id_fornecedor
WHERE SUBSTRING(p.nome, 1, 1) = 'A';

--H)
SELECT p.nome
FROM produto p
WHERE p.preco BETWEEN 10 AND 100;

--I)
SELECT v.id_venda, v.data_hora
FROM venda v
WHERE (EXTRACT(MONTH FROM v.data_hora))= 6 AND (EXTRACT(DAY FROM v.data_hora)) >= 23
   OR (EXTRACT(MONTH FROM v.data_hora)) > 6 AND (EXTRACT(MONTH FROM v.data_hora)) < 12
   OR (EXTRACT(MONTH FROM v.data_hora)) = 12 AND (EXTRACT(DAY FROM v.data_hora)) <= 29;

--J)
SELECT ps.nome, v.data_hora
FROM pessoa as ps
INNER JOIN cliente as c
ON ps.id_pessoa = c.id_cliente
INNER JOIN venda as v
ON c.id_cliente = v.id_cliente
WHERE (EXTRACT(MONTH FROM v.data_hora)) = 3 AND (EXTRACT(YEAR FROM v.data_hora)) = 2022;

--K)
SELECT p.nome
FROM produto p 
INNER JOIN fornecedor f
ON p.id_fornecedor = f.id_fornecedor
WHERE f.cnpj LIKE '%57';

--L)
SELECT p.nome
FROM pessoa p, cliente c
WHERE p.id_pessoa = c.id_cliente
AND p.endereco LIKE '%St.%';

--M)
SELECT p.nome
FROM produto p
INNER JOIN item_estoque ie
ON p.id_produto = ie.id_produto
WHERE ie.id_venda IS NOT NULL
AND p.preco > 20;