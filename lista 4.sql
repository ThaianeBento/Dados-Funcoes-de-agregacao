--Liste nome do filme e as vezes que foi alugado.
SELECT f.title, COUNT(r.inventory_id) as total
FROM film f
	INNER JOIN inventory as i 
		ON f.film_id = i.film_id
	INNER JOIN rental as r
		ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY total

--Quem é o cliente que gastou mais com alugueis?
SELECT cu.customer_id, cu.first_name, cu.last_name, SUM(p.amount) as total
FROM customer cu
	INNER JOIN payment p
		ON cu.customer_id = p.customer_id
GROUP BY (cu.customer_id)
ORDER BY (total) desc

LIMIT 1;

-- Qual é o ator que aparece no maior número de filmes?
SELECT a.actor_id, a.first_name, a.last_name, COUNT(fa.actor_id) as total
FROM actor a
	INNER JOIN film_actor fa
		ON a.actor_id = fa.actor_id
GROUP BY (a.actor_id)
ORDER BY total desc

LIMIT 1;

-- Qual é o ator que aparece no maior número de filmes?
SELECT a.actor_id, a.first_name, a.last_name, COUNT(fa.actor_id) as total
FROM actor a
	INNER JOIN film_actor fa
		ON a.actor_id = fa.actor_id
GROUP BY (a.actor_id)
ORDER BY total desc

LIMIT 1;

--Qual é a categoria de filme mais popular entre os clientes?

SELECT ca.name, COUNT(r.inventory_id) as total
FROM category  ca
	LEFT JOIN film_category as fc
		ON ca.category_id = fc.category_id
	LEFT JOIN film f
		ON fc.film_id = f.film_id
	LEFT JOIN inventory i
		ON f.film_id = i.film_id
	LEFT JOIN rental r
		ON i.inventory_id = r.inventory_id
GROUP BY (ca.name)
ORDER BY total DESC

LIMIT 1;

-- Qual funcionário realizou o maior número de aluguéis?
SELECT sta.first_name, COUNT(r.staff_id) as total
FROM staff sta
	LEFT JOIN rental r
		ON sta.staff_id = r.staff_id
GROUP BY (sta.staff_id)
ORDER BY total DESC

LIMIT 1;

-- Qual é a média de duração dos filmes por categoria?
SELECT ca.name, AVG(f.length) AS average_duration
FROM category ca
	INNER JOIN film_category fc 
		ON ca.category_id = fc.category_id
	INNER JOIN film f
		ON fc.film_id = f.film_id
GROUP BY ca.name;

-- Quantos aluguéis foram realizados em cada loja?
SELECT s.store_id, COUNT(r.rental_id) AS total_rentals
FROM store s
	INNER JOIN rental r 
		ON s.store_id = r.store_id
GROUP BY s.store_id;

--Qual é o valor total de pagamentos recebidos por cada funcionário?
SELECT s.first_name, s.last_name, SUM(p.amount) AS total_payments
FROM staff s
	LEFT JOIN payment p 
		ON s.staff_id = p.staff_id
GROUP BY s.staff_id;

-- Quantos clientes estão ativos atualmente no banco de dados?
SELECT COUNT(*) AS active_customers
FROM customer
WHERE active = 1;

-- Qual é o custo médio de substituição dos filmes por categoria?
SELECT ca.name, AVG(f.replacement_cost) AS average_replacement_cost
FROM category ca
INNER JOIN film_category fc ON ca.category_id = fc.category_id
INNER JOIN film f ON fc.film_id = f.film_id
GROUP BY ca.name;

--Qual é a receita total de aluguel para cada loja?
SELECT s.store_id, SUM(p.amount) AS total_revenue
FROM store s
	INNER JOIN payment p
		ON s.store_id = p.store_id
GROUP BY s.store_id;

-- Quantos filmes cada cliente alugou?
SELECT c.first_name, c.last_name, COUNT(r.rental_id) AS total_rentals
FROM customer c
	INNER JOIN rental r 
		ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY total_rentals DESC;

--Qual é o número total de filmes disponíveis em cada idioma?
SELECT l.name, COUNT(f.film_id) AS total_films
FROM language l
	INNER JOIN film f 
		ON l.language_id = f.language_id
GROUP BY l.language_id;

--Qual é a duração média de aluguel de todos os filmes?
SELECT AVG(f.length) AS average_rental_duration
FROM film f;

-- Quanto cada cliente gastou em média em aluguéis?
SELECT c.first_name, c.last_name, AVG(p.amount) AS average_spent
FROM customer c
	INNER JOIN payment p 
		ON c.customer_id = p.customer_id
GROUP BY c.customer_id;

--Quantos clientes não fizeram nenhum aluguel?
SELECT COUNT(*) AS inactive_customers
FROM customer c
	LEFT JOIN rental r 
		ON c.customer_id = r.customer_id
WHERE r.rental_id IS NULL;

--Quais foram as 10 categorias mais locadas?
SELECT ca.name, COUNT(r.rental_id) AS total_rentals
FROM category ca
	INNER JOIN film_category fc 
		ON ca.category_id = fc.category_id
	INNER JOIN film f 
		ON fc.film_id = f.film_id
	INNER JOIN inventory i 
		ON f.film_id = i.film_id
	INNER JOIN rental r 
		ON i.inventory_id = r.inventory_id
GROUP BY ca.name
ORDER BY total_rentals DESC
LIMIT 10;

-- Quais foram as 10 categorias mais rentáveis?
SELECT ca.name, SUM(p.amount) AS total_revenue
FROM category ca
	INNER JOIN film_category fc 
		ON ca.category_id = fc.category_id
	INNER JOIN film f 
		ON fc.film_id = f.film_id
	INNER JOIN inventory i 
		ON f.film_id = i.film_id
	INNER JOIN rental r 
		ON i.inventory_id = r.inventory_id
	INNER JOIN payment p 
		ON r.rental_id = p.rental_id
GROUP BY ca.name
ORDER BY total_revenue DESC
LIMIT 10;

--Quais foram os 10 filmes mais locados?
SELECT f.title, COUNT(r.rental_id) AS total_rentals
FROM film f
	INNER JOIN inventory i 
		ON f.film_id = i.film_id
	INNER JOIN rental r 
		ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY total_rentals DESC
LIMIT 10;

--Quais os 10 clientes que mais alugam filmes?
SELECT c.first_name, c.last_name, COUNT(r.rental_id) AS total_rentals
FROM customer c
	INNER JOIN rental r
		ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY total_rentals DESC
LIMIT 10;

-- O nome da categoria e a quantidade de filmes
SELECT ca.name, COUNT(f.film_id) AS total_films
FROM category ca
	INNER JOIN film_category fc 
		ON ca.category_id = fc.category_id
	INNER JOIN film f 
		ON fc.film_id = f.film_id
GROUP BY ca.name;