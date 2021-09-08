-- 1. How many actors are there with the last name 'Wahlberg'?
-- Encapsulate * with COUNT() to find interger amount.
SELECT *
FROM actor
WHERE last_name = 'Wahlberg';
-- LIKE = similar
-- = = the same

-- 2. How many payments were made btween $3.99 and $5.99?
-- Encapsulate * with COUNT() to find interger amount.
SELECT *
FROM payment
WHERE amount > 3.99 and amount < 5.99
ORDER BY amount;

-- 3. What film does the store have the most of? 
-- (search inventory)
SELECT film.title, inventory.film_id, inventory.store_id
FROM inventory
JOIN film ON inventory.film_id = film.film_id;

-- 4. How many customers have the last name 'William'?
-- There is no customers with a last name of william, BUT
-- there is 1 customer with the last name williams and 1 williamson
SELECT * 
FROM customer
WHERE last_name like 'William%';

-- 5. What store employee (get the id) sold the most rentals?
SELECT staff.staff_id, staff.username, payment.rental_id, payment.amount
FROM staff
JOIN payment ON staff.staff_id = payment.staff_id
WHERE

-- 6. How many different district names are there?
-- keyword = DIFFERENT
-- 603 all together and 378 with no repeats
SELECT DISTINCT district
FROM address;

-- 7 What film has the most actors in it? 
-- (use film_actor table and get film_id)
SELECT film.title, film_actor.actor_id, film_actor.film_id, actor.first_name, actor.last_name
FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id;

-- 8. From store_id1, how many customers have a last name 
-- ending with 'es'?
-- (use customer table)
SELECT *
FROM customer
WHERE last_name like '%es';

-- 9. How many payment amounts(4.99,5.99, etc.) had a number of 
-- rentals above 250 for customers with ids between 380 and 430? 
-- (use group by having >250)
SELECT payment.customer_id, payment.amount, rental.rental_id, rental.inventory_id
FROM payment
JOIN rental ON payment.customer_id = rental.customer_id
WHERE payment.customer_id > 380 and payment.customer_id < 430;
-- GROUP BY having > 250


-- 10. Within the film table, how many rating categories are 
-- there? 
-- And what rating has the most movies total?
-- 5 catergories with PG-13 with the most movies overall
SELECT rating, COUNT(title)
FROM film
GROUP BY rating
ORDER BY COUNT(title);

