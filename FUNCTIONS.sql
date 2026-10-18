-- VALORE MAXIMO E MINIMO
SELECT 
    MAX(amount) AS 'Valor máximo',
    MIN(amount) AS 'Valor mínimo'
FROM payment;

--MEDIA
SELECT 
    AVG(amount) AS 'Valor médio'
FROM payment;

--SOMA e CONTADOR
SELECT 
    SUM(amount) AS 'VAlor total das vendas',
    COUNT(amount) AS 'Numero de vendas'
FROM payment
WHERE staff_id = ;

--AGRUPANDO => VALOR TOTAL QUE CADA CLIENTE GASTOU
SELECT 
    customer.first_name as 'Nome',
    payment.customer_id,
    SUM(amount) as "Total"
FROM payment
JOIN customer ON payment.customer_id = customer.customer_id
GROUP BY customer_id
ORDER BY Total DESC;

--FILTRANDO VALORES COM HAVING
SELECT 
    customer.first_name as 'Nome',
    payment.customer_id,
    SUM(amount) as "Total",
    COUNT(amount) AS "Compras"
FROM payment
JOIN customer ON payment.customer_id = customer.customer_id
GROUP BY customer_id
HAVING Total >= 175 AND Compras >= 40 -- se tem uma funcao de agregaçao tem q usar o having ao inves do where. O where filtra linhas 
ORDER BY Total DESC;
