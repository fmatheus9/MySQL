SELECT addr.address_id, addr.address, cit.city_id, cit.city, cus.first_name
FROM address AS addr
JOIN city cit ON cit.city_id = addr.city_id
JOIN customer cus ON cus.address_id = addr.address_id
WHERE cus.first_name = 'MARY';

SELECT * 
FROM customer;
