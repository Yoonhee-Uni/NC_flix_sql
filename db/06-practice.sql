\c nc_flix

SELECT DISTINCT(title) FROM movies
JOIN stock
ON movies.movie_id = stock.movie_id
JOIN stores
ON stock.store_id = stores.store_id
WHERE city = 'Manchester'
;

-- \echo '\n this'
-- SELECT stock.store_id, DISTINCT movies.title, movies.rating 
-- FROM stock
-- JOIN movies
-- ON stock.movie_id = movies.movie_id
-- GROUP BY movies.rating, stock.store_id, movies.title
-- ORDER BY store_id
-- ;




-- INSERT INTO  rental(
-- stock_id, rental_start, rental_end, customer_id
-- )

-- SELECT movies.title,
--     CASE
--         WHEN classification IS NULL OR classification = 'U' THEN 'YES'
--         ELSE 'NO'
--         END AS  age_appropriate,
--     CASE
--         WHEN EXISTS (SELECT 1 FROM stock
--         JOIN stores ON stock.store_id = stores.store_id
--         WHERE stock.movie_id = movies.movie_id
--         AND stores.city = 'Birmingham') 
--         THEN 'YES'
--         ELSE 'NO'
--         END AS in_stock_nearby,
--     CASE
--         WHEN (SELECT COUNT(*)
--         FROM rental
--         JOIN stock ON rental.stock_id = stock.stock_id
--         WHERE stock.movie_id = movies.movie_id)
--         > 5 THEN 'NO'
--         ELSE 'YES'
--         END AS  not_too_mainstream
--     FROM movies
--     ;     


-- SELECT * FROM stock
-- JOIN  movies
-- ON stock.movie_id = movies.movie_id;

-- SELECT * FROM customers;

\echo 'number 6 all together'
SELECT 
stores.store_id, 
customers.location, 
COUNT(DISTINCT customers.customer_id) AS num_of_customer_in_same_location,
stores.city, 
customers.customer_name,
COUNT(rental.customer_id) AS most_valued_customer 
COUNT(DISTINCT(movies.title)) AS Avail_movies_per_store

FROM stores
LEFT JOIN stock
ON stores.store_id = stock.store_id
LEFT JOIN movies
ON stock.movie_id = movies.movie_id
FULL JOIN customers
ON customers.location = stores.city
JOIN rental
ON rental.customer_id = customers.customer_id

GROUP BY stores.store_id, stores.city, customers.location, customers.customer_name,
rental.customer_id 

ORDER BY city, COUNT(rental.customer_id) DESC
;



-- FROM customers

-- FULL JOIN stores
-- ON customers.location = stores.city 
-- LEFT JOIN stock
-- ON stores.store_id = stock.stock_id
-- JOIN movies
-- ON stock.movie_id = movies.movie_id
-- GROUP BY stores.store_id, 
-- customers.location, city;


\echo 'checking'
SELECT
stores.store_id, 
stores.city,
COUNT(DISTINCT(movies.title))


FROM stores

LEFT JOIN stock
ON stores.store_id = stock.store_id
LEFT JOIN movies
ON stock.movie_id = movies.movie_id
GROUP BY stores.store_id, city;

