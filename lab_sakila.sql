USE sakila;

-- Display all available tables in the Sakila database.
SHOW TABLES;

-- Retrieve all the data from the tables actor, film and customer.
SELECT * FROM actor, film, customer;

-- Retrieve the following columns from their respective tables:
-- -- 3.1 Titles of all films from the film table
SELECT title FROM film;

-- -- 3.2 List of languages used in films, with the column aliased as language from the language table
SELECT name FROM language AS language; 

-- -- 3.3 List of first names of all employees from the staff table
SELECT first_name FROM staff;

-- Retrieve unique release years.
SELECT DISTINCT release_year FROM film;

-- Counting records for database insights:
-- -- 5.1 Determine the number of stores that the company has.
SELECT COUNT(store_id) FROM store;

-- -- 5.2 Determine the number of employees that the company has.
SELECT COUNT(staff_id) FROM staff;

-- -- 5.3 Determine how many films are available for rent and how many have been rented.
SELECT 
    COUNT(inventory_id) AS rentable_films,
    COUNT(CASE WHEN return_date IS NOT NULL THEN rental_date END) AS rented_films 
FROM rental;

-- -- 5.4 Determine the number of distinct last names of the actors in the database.
SELECT COUNT(DISTINCT last_name) FROM actor;

-- Retrieve the 10 longest films.
SELECT title FROM film
ORDER BY length DESC
LIMIT 10;

-- Use filtering techniques in order to:
-- -- 7.1 Retrieve all actors with the first name "SCARLETT".
SELECT first_name, last_name FROM actor
WHERE first_name="SCARLETT";

-- BONUS:
-- -- 7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes.
SELECT title FROM film WHERE title LIKE '%ARMAGEDDON%' AND length > 100; 

-- -- 7.3 Determine the number of films that include Behind the Scenes content
SELECT title FROM film WHERE special_features LIKE '%Behind the Scenes%';