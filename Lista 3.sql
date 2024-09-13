-- Discente: Kaique de Oliveira, Thaiane 

-- Utilizando left, rigth e somente quando necessário, inner join, resolva:
--1. Todas as vendas e o nome do cliente.
select v.*, p.nome from venda v
	left join cliente c
		on v.id_cliente = c.id_cliente
	left join pessoa p
		on c.id_cliente = p.id_pessoa

--2. Todos os produtos, inclusive aqueles que não foram fornecidos por nenhum fornecedor.
select p.id_produto, p.nome, ps.nome from produto p
	left join fornecedor f 
		on p.id_fornecedor = f.id_fornecedor
	left join pessoa ps 
		on p.id_fornecedor = ps.id_pessoa

--3. Todos os produtos que foram adicionados ao estoque.
select p.id_produto, p.nome, ie.id_item from produto p
	inner join item_estoque ie
		on p.id_produto = ie.id_produto
		
--4. Todos os produtos que foram vendidos, incluindo detalhes da venda.
select p.id_produto, p.nome, ie.id_item, v.id_venda, v.data_hora from produto p
	inner join item_estoque ie
		on p.id_produto = ie.id_produto
	inner join venda v
		on ie.id_venda = v.id_venda

--5. Nomes das pessoas que são clientes mas não são fornecedores.
select p.nome from pessoa p
	left join cliente  c
		on p.id_pessoa = c.id_cliente
	left join fornecedor f 
		on p.id_pessoa = f.id_fornecedor
	where c.id_cliente is not null and f.id_fornecedor is null

--6. Nomes das pessoas que são tanto clientes quanto fornecedores.
select p.nome from pessoa p
	inner join cliente c
		on p.id_pessoa = c.id_cliente
	inner join fornecedor f 
		on p.id_pessoa = f.id_fornecedor
		
--7. Produtos que não estão em estoque.
select p.id_produto, p.nome from produto P
	left join item_estoque ie 
		on p.id_produto = ie.id_produto
	where ie.id_item is null

--8. Produtos que estão em estoque mas nunca foram vendidos.
select distinct p.id_produto, p.nome from produto p
	inner join item_estoque ie
		on p.id_produto = ie.id_produto
	left join venda v
		on ie.id_venda = v.id_venda
	where v.id_venda is null
	
--9. Vendas que não têm produtos associados.
select * from venda v
	left join item_estoque ie
		on v.id_venda = ie.id_venda
	where ie.id_item is null

--10. Clientes que nunca fizeram uma compra.
select p.nome from pessoa p
	inner join cliente c
		on p.id_pessoa = c.id_cliente
	left join venda v
		on c.id_cliente = v.id_cliente
	where v.id_venda is null
	
--11. Pessoas que não são clientes.
select p.nome from pessoa p
	left join cliente c
		on p.id_pessoa = c.id_cliente
	where c.id_cliente is null
	
--12. Pessoas que não são fornecedores.
select p.nome from pessoa p
	left join fornecedor f
		on p.id_pessoa = f.id_fornecedor
	where f.id_fornecedor is null

--13. Pessoas que não são clientes nem fornecedores.
select p.nome from pessoa p 
	left join cliente c
		on p.id_pessoa = c.id_cliente
	left join fornecedor f
		on p.id_pessoa = f.id_fornecedor
	where c.id_cliente is null and f.id_fornecedor is null
		
--14. Fornecedores que não têm produtos associados a eles.
select p.nome from fornecedor f
	left join produto p
		on f.id_fornecedor = p.id_fornecedor
	where p.id_produto is null

--15. Clientes que nunca realizaram uma compra (detalhamento do valor gasto igual a 0).
select p.nome from pessoa p
	left join cliente c
		on p.id_pessoa = c.id_cliente
	left join venda v
		on c.id_cliente = v.id_cliente
	left join item_estoque ie
		on v.id_venda = ie.id_venda
	where v.id_venda is null or ie.id_venda is null
	