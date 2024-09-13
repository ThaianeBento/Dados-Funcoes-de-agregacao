--1. Escolha dois exercícios que resolveu com INNER JOIN e resolva com Subquery
-- O nome da categoria e a quantidade de filmes
SELECT name, (SELECT COUNT(*) FROM film_category fc WHERE fc.category_id = ca.category_id) as total
FROM category ca;

-- Quantos filmes cada cliente alugou?
SELECT first_name, last_name, (SELECT COUNT(*) FROM rental WHERE rental.customer_id = c.customer_id) as total
FROM customer c
ORDER BY total desc;

--2. Escolha dois exercícios que resolveu com LEFT JOIN e resolva com SubQuery
--Quantos clientes não fizeram nenhum aluguel?
SELECT COUNT(*)
FROM customer c
WHERE c.customer_id  IN (
    SELECT r.customer_id
    FROM rental r
);

--Qual é o valor total de pagamentos recebidos por cada funcionário?
SELECT first_name, last_name,(SELECT SUM(payment.amount) FROM payment WHERE payment.staff_id = s.staff_id) AS total
FROM staff s;