
SELECT first_name AS manager_first_name, last_name AS manager_last_name, address, district, city, country FROM staff s
INNER JOIN address a
ON s.address_id = a.address_id
INNER JOIN city c
ON a.city_id = c.city_id
INNER JOIN country co
ON c.country_id = co.country_id;


---------
--2

SELECT store_id, i.inventory_id, title, rating, rental_rate, replacement_cost FROM inventory i
INNER JOIN film f
ON i.film_id = f.film_id;

----------
--3 

SELECT store_id, rating, COUNT(*) FROM inventory i
INNER JOIN film f
ON i.film_id = f.film_id
GROUP BY store_id, rating;


--4 



SELECT store_id, name AS category, COUNT(*) AS films, AVG(replacement_cost) AS avg_replacement_cost, SUM(replacement_cost) AS total_replacement_cost FROM inventory i
INNER JOIN film f
ON i.film_id = f.film_id
INNER JOIN film_category fc
ON f.film_id = fc.film_id
INNER JOIN category c
ON fc.category_id = c.category_id
GROUP BY store_id, name;


-- 5

SELECT first_name, last_name, c.store_id, active, address, city, country FROM customer c
INNER JOIN store s
ON c.store_id = s.store_id
INNER JOIN address a
ON s.address_id = a.address_id
INNER JOIN city ci
ON a.city_id = ci.city_id
INNER JOIN country co
ON ci.country_id = co.country_id;

-- 6


SELECT first_name, last_name, COUNT(*) as total_rentals, SUM(amount) AS total_payment_amount FROM customer c
INNER JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY first_name, last_name
ORDER BY SUM(amount) DESC;





