--1. Liste apenas as colunas film_id, title e release_year da tabela film.

SELECT 
    film_id,
    title,
    release_year
FROM film;

--2. Traga todos os dados do cliente (customer) com customer_id = 10.

SELECT *
FROM customer
WHERE customer_id = 10;

--3. Liste todos os atores ordenados pelo last_name em ordem alfabética (A→Z).

SELECT *
FROM actor
ORDER BY last_name ASC;

--4. Liste os filmes (film) cujo film_id seja ímpar, ordenados de forma decrescente.

SELECT *
FROM film
WHERE 
    film_id % 2 <> 0
ORDER BY film_id DESC;

--5. Liste os pagamentos (payment) com payment_id maior que 100 e menor que 120, ordenados do maior para o menor.

SELECT *
FROM payment
WHERE 
    payment_id > 100 AND payment_id < 120
ORDER BY payment_id DESC;

--6. Usando BETWEEN, liste os filmes com length (duração) entre 90 e 120 minutos.
SELECT *
FROM film
WHERE length BETWEEN 90 AND 120;

--alternativa?
SELECT *
FROM film
WHERE length >= 90 AND length <= 120;

--7. Liste os endereços (address) cujo district seja 'Alberta' ou 'QLD' ou 'Texas', usando IN.
SELECT *
FROM address
WHERE address.district IN ('Alberta', 'QLD', 'Texas'); --IN passa os valores entre parenteses

--8. Liste os atores cujo first_name tenha exatamente 4 letras e comece com 'J'.
SELECT *
FROM actor
WHERE actor.first_name LIKE 'J___';

--9. Liste os atores cujo last_name termine com 'SON'.--
SELECT *
FROM actor
WHERE actor.last_name LIKE '%SON';

--10. Liste os atores cujo first_name tenha a letra 'E' como segunda letra.
SELECT *
FROM actor
WHERE actor.first_name LIKE '_E%';

--11. Liste os endereços onde address2 não é nulo.
SELECT * 
FROM address
WHERE address2 IS NOT NULL;

--12. Liste os filmes (film) cujo original_language_id é nulo.
SELECT *
FROM film
WHERE film.original_language_id IS NULL;

--13. Na tabela payment, mostre payment_id, amount e uma coluna chamada 'amount_com_acrescimo' com o valor acrescido de 15%, apenas para o customer_id = 5.
SELECT 
    payment_id,
    amount,
    amount + (amount * 0.15) AS 'amount_com_acrescimo'
FROM payment
WHERE customer_id = 5;

--14. Na tabela film, mostre title, rental_rate e uma coluna 'valor_semanal' que seja rental_rate * 7. Use alias de tabela (AS f).
SELECT 
    f.title, 
    f.rental_rate, 
    f.rental_rate * 7 AS 'valor_semanal'
FROM film AS f;

--15. Na tabela film, mostre title, length e uma coluna 'duracao_horas' com a duração dividida por 60. Filtre apenas filmes com mais de 150 minutos.--
SELECT 
    f.title, 
    f.length, 
    f.length / 60 AS 'duracao_horas'
FROM film AS f
WHERE length > 150;

--16. Traga os 5 primeiros filmes da tabela film.
SELECT *
FROM film
LIMIT 5;

--17. Pule os 10 primeiros registros de customer e traga os 7 seguintes.
SELECT *
FROM customer
LIMIT 10,7;

--18. Usando REGEXP, liste os atores cujo first_name começa com 'B'.

--19. Usando REGEXP, liste os atores cujo last_name termina com 'N'.

--20. Usando REGEXP com colchetes, liste os atores cujo first_name contenha 'ar', 'er' ou 'or'.

--21. Liste film.title e language.name (idioma) de todos os filmes, usando JOIN entre film e language.
SELECT
    film.title,
    language.name
FROM film
JOIN language ON film.language_id = language.language_id;

--22. Liste o nome (first_name) e o email dos clientes junto com o address deles, usando JOIN entre customer e address.
SELECT
    customer.first_name,
    customer.email,
    address.address
FROM customer
JOIN address ON customer.address_id = address.address_id;

--23. Liste first_name do cliente, address e city (3 tabelas: customer, address, city) apenas para clientes cujo first_name é 'PATRICIA'.
SELECT  
    customer.first_name,
    address.address,
    city.city
FROM customer 
JOIN address ON customer.address_id = address.address_id
JOIN city ON city.city_id = address.city_id;

--24. Liste title do filme e first_name/last_name dos atores que atuaram nele, usando as tabelas film, film_actor e actor. Limite a 20 resultados.
SELECT
    film.title,
    actor.first_name,
    actor.last_name
FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id
LIMIT 20;

--25. Liste city e country usando JOIN entre city e country, apenas para o país 'Brazil'.
SELECT
    city.city,
    country.country
FROM city
JOIN country ON city.country_id = country.country_id
WHERE country.country = 'Brazil';

--26. Liste o nome e sobrenome dos clientes que moram em cidades do Brasil, com o nome da cidade, ordenados por cidade (A→Z). (dica: 4 tabelas)
SELECT
    customer.first_name,
    customer.last_name
FROM customer
JOIN address ad ON ad.address_id = customer.address_id
JOIN city cit ON ad.city_id = cit.city_id
JOIN country coun ON cit.country_id = coun.country_id
WHERE coun.country LIKE 'Brazil' 
ORDER BY cit.city ASC;

--27. Liste os filmes com rental_rate menor que 3, length maior que 100 e título começando com 'A', ordenados por length decrescente, mostrando só os 10 primeiros.
SELECT 
    film.title
FROM film
WHERE film.rental_rate > 3 AND length > 100 AND film.title LIKE 'A%'
ORDER BY film.length DESC
LIMIT 10;

--28. Mostre payment_id, amount e uma coluna 'desconto_20' com 20% de desconto, para pagamentos do staff_id = 2 com valor entre 3 e 6, 
--ordenados por amount.

SELECT
    payment_id,
    amount,
    amount - amount * 0.2 AS 'desconto_20'
FROM payment
WHERE payment.staff_id = 2 AND amount > 3 AND amount < 6
ORDER BY amount ASC;
