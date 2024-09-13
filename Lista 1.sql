--Thaiane Bento

--A)
Select v.id_venda, p.nome As nome_cliente
From venda v, cliente c, pessoa p
Where v.id_cliente = c.id_cliente
And c.id_cliente = p.id_pessoa;

--B)
SELECT nome
FROM produto;

--C)
SELECT p.nome
FROM produto p, item_estoque ie
WHERE p.id_produto = ie.id_produto;

--D)
SELECT p.nome
FROM produto p,item_estoque ie
WHERE p.id_produto = ie.id_produto
AND ie.id_venda IS NOT NULL;

--E)
SELECT p.nome
FROM cliente c,fornecedor f, pessoa p
WHERE c.id_cliente = f.id_fornecedor
AND p.id_pessoa = f.id_fornecedor;

--F)
SELECT p.nome
FROM produto p, item_estoque ie
WHERE p.id_produto = ie.id_produto
AND ie.id_venda IS NOT NULL
GROUP BY p.nome;

--G)
SELECT p.nome
FROM pessoa p, fornecedor f
WHERE p.id_pessoa = f.id_fornecedor
AND SUBSTRING(p.nome, 1, 1) = 'A';

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
SELECT p.nome, v.data_hora
FROM pessoa p, venda v, cliente c
WHERE p.id_pessoa = c.id_cliente
AND c.id_cliente = v.id_cliente
AND (EXTRACT(MONTH FROM v.data_hora)) = 3 AND (EXTRACT(YEAR FROM v.data_hora)) = 2022;

--K)
SELECT p.nome
FROM produto p, fornecedor f
WHERE p.id_fornecedor = f.id_fornecedor
AND f.cnpj LIKE '%57';

--L)
SELECT p.nome
FROM pessoa p, cliente c
WHERE p.id_pessoa = c.id_cliente
AND p.endereco LIKE '%St.%';

--M)
SELECT p.nome
FROM produto p, item_estoque ie
WHERE p.id_produto = ie.id_produto
AND ie.id_venda IS NOT NULL
AND p.preco > 20;

SELECT *
From pessoa;
