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