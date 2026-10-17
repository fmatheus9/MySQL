use sakila; 

SELECT actor.actor_id, actor.first_name FROM sakila.actor;

SELECT * FROM sakila.actor
WHERE actor_id = 1;

SELECT * FROM sakila.actor
ORDER BY actor.actor_id DESC;

SELECT * FROM sakila.actor
WHERE actor_id % 2 = 0
ORDER BY actor_id ASC;

SELECT * FROM sakila.actor
WHERE actor_id > 2 AND actor_id < 10
ORDER BY actor_id DESC;

SELECT * FROM sakila.actor
WHERE actor.actor_id BETWEEN 1 AND 4;

SELECT * FROM sakila.actor
WHERE actor.actor_id LIKE 1;

--- MODIFICANDO COLUNAS 
SELECT 
    payment_id, customer_id, staff_id, rental_id, amount, amount - (amount * 0.1) AS '10% discount'
FROM payment
WHERE customer_id = 1;

SELECT * 
FROM payment AS p
WHERE p.amount <= 2.99
ORDER BY p.staff_id ASC;

SELECT * 
FROM address AS a
WHERE a.district = 'CALIFORNIA' AND a.address_id % 2 = 0
ORDER BY a.district ASC;

SELECT * 
FROM address AS a
WHERE a.city_id IN ("449","120");

SELECT *
FROM actor AS ac    
WHERE ac.first_name LIKE 'A_';

SELECT *
FROM actor AS ac    
WHERE ac.first_name LIKE 'A_____';

SELECT *
FROM actor AS ac    
WHERE ac.first_name LIKE '_A%';

SELECT * 
FROM address AS a
WHERE a.address2 IS NULL;

SELECT *
FROM actor AS a
LIMIT 5,10; -- CONTA 10 REGISTROS A PARTIR DO 5

SELECT *
FROM actor AS a
WHERE a.first_name REGEXP '^a';

SELECT *
FROM actor AS a
WHERE a.first_name REGEXP '[ger]a';
