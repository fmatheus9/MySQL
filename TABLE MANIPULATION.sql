SELECT *
FROM sakila.language;

INSERT INTO language
VALUES(DEFAULT, 'Portugueses', DEFAULT); -- o default adiciona o valor "padrao", por exemplo em chaves primaria que tem AI (auto increment)

--adicionando multiplas linhas dentro da tabela
INSERT INTO language
VALUES
    (DEFAULT, 'Portugueses', DEFAULT), -- INSERIDO DUPLICADO 
    (DEFAULT, 'Spanish', DEFAULT),
    (DEFAULT, 'Polish', DEFAULT);

-- INSERIR UM novo pais - MULTIPLAS TABELAS
SELECT *
FROM country
ORDER BY country.country;

INSERT INTO country
VALUES
    (DEFAULT, "AAB", DEFAULT);

INSERT INTO city
VALUES
    (DEFAULT, "AAB - city", LAST_INSERT_ID(), DEFAULT); -- LAST_INSERT_ID -> insere no ultimo id inserido

SELECT *
FROM city
ORDER BY city.city_id DESC;

-- REMOVENDO UM ITEM DA TABELA
DELETE 
FROM country
WHERE country.country_id = 111;

--CRIANDO TABELAS
CREATE TABLE payment_backup AS
SELECT * FROM payment;

--Removendo tabelas
DROP TABLE payment_backup;

SELECT * FROM payment_backup;

-- ATUALIZANDO UM VALOR DENTRO DE UMA TABLEA
UPDATE payment
SET
    amount = 2.99,
    staff_id = 1
WHERE payment_id = 1;

SELECT * FROM payment
ORDER BY payment_id DESC;

--removendo um registro
DELETE FROM payment
ORDER BY payment_id DESC
LIMIT 1;
