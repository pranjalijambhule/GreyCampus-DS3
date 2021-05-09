
----------------------     ASSIGNMENT 1
-- 1. Do we have actors in the actor table that share the full name and if yes display those shared names.

SELECT * FROM actor;

SELECT first_name, last_name, COUNT (first_name) FROM actor
GROUP BY first_name, last_name
HAVING COUNT(first_name) > 1;

----------------------------------------------------------------------------------------------------------

-- 2. Return the customer IDs of customers who have spent at least $110 with the staff member who has an ID of 2.


SELECT * FROM payment;

SELECT customer_id, staff_id, SUM(amount) FROM payment
WHERE staff_id = 2
GROUP BY customer_id, staff_id
HAVING SUM(amount) >= 110;


----------------------------------------------------------------------------------------------------------

-- 3. How many films begin with the letter J?

SELECT * FROM film;

SELECT COUNT(title) FROM film
WHERE title ILIKE 'j%';


---------------------------------------------------------------------------------------------------------

-- 4. What customer has the highest customer ID number whose name starts with an 'E' and has an ID lower than 500?

SELECT * FROM customer;

SELECT first_name, last_name, address_id, customer_id FROM customer
WHERE first_name ILIKE 'e%' AND address_id < 500
ORDER BY customer_id DESC
LIMIT 1;

--------------------------------------------------------------------------------------------------------

-- 5. How many films have the word Truman somewhere in the title?

SELECT * FROM film;

SELECT COUNT(*) FROM film
WHERE title ILIKE '%Truman%';

--------------------------------------------------------------------------------------------------------

-- 6. Display the total amount payed by all customers in the payment table.

SELECT COUNT(payment_id) FROM payment;
SELECT COUNT(DISTINCT(payment_id)) FROM payment;


-- As there are no repeated payment_id we can go with direct sum
SELECT SUM (amount) FROM payment;

---------------------------------------------------------------------------------------------------------

-- 7. Display the total amount payed by each customer in the payment table.

SELECT * FROM payment;

SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
LIMIT 10;


---------------------------------------------------------------------------------------------------------

-- 8. What is the highest total_payment done.

SELECT * FROM payment;

SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 1;

---------------------------------------------------------------------------------------------------------

-- 9. Which customers have not rented any movies so far.

SELECT customer_id, amount FROM payment
WHERE amount = 0;
LIMIT 10;

---------------------------------------------------------------------------------------------------------

-- 10. How many payment transactions were greater than $5.00?
 
SELECT * FROM payment;

SELECT payment_id, customer_id, amount FROM payment
WHERE amount > 5
ORDER BY amount DESC
LIMIT 10;
