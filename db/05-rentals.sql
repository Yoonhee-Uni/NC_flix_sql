\c nc_flix

DROP TABLE IF EXISTS rental;

CREATE TABLE rental(
rental_id SERIAL PRIMARY KEY,
stock_id INT REFERENCES stock(stock_id),
rental_start DATE,
rental_end  DATE,
customer_id INT REFERENCES customers(customer_id)
);

INSERT INTO  rental(
stock_id, rental_start, rental_end, customer_id
)
VALUES

(34, '2020-11-10', '2020-11-13',8),
(18, '2020-10-02', '2020-10-5', 7),
(33, '2021-04-08', '2021-04-13', 10),
(24, '2021-04-19', '2021-04-20', 8),
(24, '2020-09-27', '2020-09-29', 8),
(32, '2021-06-03', '2021-06-10', 1),
(19, '2020-01-31', '2020-02-05', 9),
(34, '2020-02-13', '2020-02-18', 6),
(34, '2022-07-27', '2022-07-30', 11),
( 13, '2022-01-01', '2022-01-08', 10),
( 35, '2022-10-19', '2022-10-23', 6),
( 2, '2020-07-17', '2020-07-20', 4),
( 27, '2022-09-25', '2022-09-30', 7),
( 30, '2020-02-14', '2020-02-16', 5),
( 7, '2022-01-24', '2022-01-26', 9),
( 23, '2022-08-18', '2022-08-23', 5),
( 15, '2020-11-20', '2020-11-22', 8),
( 28, '2021-08-13', '2021-08-15', 10),
( 31, '2022-03-22', '2022-03-25', 6),
( 32, '2021-07-25', '2021-07-26', 10),
( 12, '2021-04-30', '2021-05-10', 2),
( 2, '2022-05-23', '2022-05-24', 7),
( 17, '2021-01-08', '2021-01-14', 1),
( 33, '2021-01-28', '2021-02-05', 9),
( 20, '2021-04-23', '2021-04-27', 9),
( 2, '2020-07-23', '2020-07-30', 8),
( 24, '2022-02-16', '2022-02-18', 5),
( 22, '2020-07-25', '2020-07-27', 11),
( 18, '2022-07-27', '2022-07-28', 1),
( 19, '2021-01-04', '2021-01-10', 7),
( 21, '2020-09-23', '2020-09-26', 7),
( 11, '2021-11-10', '2021-11-15', 8),
( 6, '2022-06-25', '2022-06-26', 7),
( 17, '2020-10-28', '2020-10-30', 9),
( 6, '2022-09-09', '2022-09-12', 6),
( 26, '2020-07-24', '2020-07-30', 10),
( 23, '2021-10-22', '2021-10-25', 9),
( 34, '2021-12-24', '2021-12-28', 3),
( 33, '2021-06-02', '2021-06-14', 9),
( 26, '2021-06-21', '2021-06-29', 5),
( 25, '2022-02-03', '2022-02-10', 10),
( 28, '2021-11-09', '2021-11-11', 4),
( 35, '2020-09-25', '2020-09-30', 1),
( 30, '2020-08-13', '2020-08-17', 8),
( 6, '2022-11-14', '2020-11-15', 2),
( 18, '2020-09-18', '2020-09-25', 8),
( 18, '2021-03-15', '2021-03-20', 8),
( 34, '2021-04-23', '2021-04-26', 1),
( 13, '2020-10-27', '2020-10-28', 6),
( 34, '2022-07-26', '2022-07-28', 8),
( 20, '2021-04-15', '2021-04-25', 7),
( 28, '2021-04-17', '2021-04-27', 5),
( 5, '2021-10-25', '2021-10-29', 3),
( 13, '2022-12-06', '2022-12-18', 1),
( 26, '2022-04-15', '2022-04-16', 6),
( 2, '2020-08-08', '2020-08-10', 5),
( 7, '2021-07-22', '2021-07-25', 10),
( 31, '2022-04-20', '2022-04-21', 7),
( 33, '2020-09-27', '2020-09-28', 5),
( 8, '2020-03-13', '2020-03-20', 11);


SELECT * FROM rental;

SELECT movies.title,
    CASE
        WHEN classification IS NULL OR classification = 'U' THEN 'YES'
        ELSE 'NO'
        END AS  age_appropriate,
    CASE
        WHEN EXISTS (SELECT 1 FROM stock
        JOIN stores ON stock.store_id = stores.store_id
        WHERE stock.movie_id = movies.movie_id
        AND stores.city = 'Manchester') 
        THEN 'YES'
        ELSE 'NO'
        END AS in_stock_nearby,
    CASE
        WHEN (SELECT COUNT(*)
        FROM rental
        JOIN stock ON rental.stock_id = stock.stock_id
        WHERE stock.movie_id = movies.movie_id)
        > 5 THEN 'NO'
        ELSE 'YES'
        END AS  not_too_mainstream
    FROM movies
    ;     


-- Query the Rental Information table you made in Task 5. Create a single output with the following information:

-- -   store_id, location, number of customers in the same location


\echo '\n store_id, location, number of customers in the same location'

SELECT stores.store_id, customers.location, COUNT(DISTINCT customers.customer_id)
FROM customers
LEFT JOIN stores
ON customers.location = stores.city 
GROUP BY stores.store_id, customers.location;


\echo '\n  number of films available in store'

SELECT city, COUNT(DISTINCT title) FROM stock
JOIN stores
ON stock.store_id = stores.store_id
JOIN movies
ON stock.movie_id = movies.movie_id
GROUP BY city;

\echo '\nmost valued customer (customer with the most rentals)'

SELECT 
DISTINCT stores.city,
customers.customer_name,
COUNT(rental.customer_id) AS most_valued_customer 
FROM rental

JOIN customers
ON rental.customer_id = customers.customer_id

JOIN stores
ON customers.location = stores.city

GROUP BY stores.city,
customers.customer_name,
rental.customer_id

ORDER BY city, COUNT(rental.customer_id) DESC
;

\echo '\n most popular film (film with most rentals)'
SELECT stock.stock_id, movies.title, COUNT(movies.title) FROM  rental
JOIN  stock
ON stock.stock_id = rental.stock_id
JOIN movies
ON stock.movie_id = movies.movie_id
GROUP BY movies.title, stock.stock_id
ORDER BY COUNT DESC
LIMIT 1;

\echo '\n average rating of each store (calculated as average of all films in store) rounded to **1 decimal place**'

SELECT stock.store_id, stores.city, 
ROUND(AVG(movies.rating),1)
FROM stores
LEFT JOIN stock
ON stores.store_id = stock.store_id
LEFT JOIN movies
ON stock.movie_id = movies.movie_id
GROUP BY stock.store_id, stores.city
ORDER BY store_id;


\echo '\n all together'
SELECT 
stores.store_id, 
stores.city, 
COUNT(DISTINCT customers.customer_id) AS number_of_customers,
COUNT(DISTINCT title) AS 
number_of_films_available,
customer_name,
(SELECT COUNT(rental.customer_id) FROM rental)


-- FROM stores
-- LEFT JOIN customers
-- ON customers.location = stores.city
-- FULL JOIN stock
-- ON stores.store_id = stock.store_id
-- LEFT JOIN movies
-- ON stock.movie_id = movies.movie_id
-- GROUP BY stores.store_id, customers.location, city;



-- SELECT stores.store_id, stores.city, 
-- COUNT(customers.location) AS number_of_customers,
-- COUNT(DISTINCT title) AS number_of_films_available,
-- COUNT(rental.customer_id) AS most_valued_customer,
-- COUNT(movies.title) AS most_popular_film,
-- ROUND(AVG(movies.rating),1) AS average_rating
-- FROM stores
-- LEFT JOIN customers
-- ON customers.location = stores.city
-- JOIN stock
-- ON stores.store_id = stock.store_id
-- JOIN movies
-- ON stock.movie_id = movies.movie_id
-- JOIN rental
-- ON stock.stock_id = rental.stock_id
-- GROUP BY 
-- stores.store_id, 
-- customers.location, 
-- stores.city, 
-- rental.customer_id, 
-- customer_name,
-- movies.title, 
-- stock.stock_id;




