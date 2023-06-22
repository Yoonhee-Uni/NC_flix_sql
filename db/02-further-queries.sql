\c nc_flix

\echo '\n 1. Here are the number of films in stock for each genre:'
SELECT genres.genre_name, COUNT(genres.genre_name) FROM genres
INNER JOIN movies_genres 
ON genres.genre_id = movies_genres.genre_id
INNER JOIN movies 
ON movies_genres.movie_id = movies.movie_id
INNER JOIN stock
ON movies.movie_id = stock.movie_id
GROUP BY genres.genre_name
;


\echo '\n 2. Here is the average rating for films in stock in Newcastle:'
SELECT ROUND(AVG(DISTINCT movies.rating),2) FROM movies
INNER JOIN stock
ON stock.movie_id = movies.movie_id
INNER JOIN stores
ON stock.store_id = stores.store_id
WHERE  stores.city = 'Newcastle';

SELECT * FROM movies
INNER JOIN stock
ON stock.movie_id = movies.movie_id
INNER JOIN stores
ON stock.store_id = stores.store_id
WHERE  stores.city = 'Newcastle';



\echo '\n 3. Here are all the films made in 90s with above average rating:'
WITH movies_90s AS (
SELECT title, rating FROM movies
WHERE release_date BETWEEN '1990-01-01' AND '1999-12-31'
)
SELECT title
FROM movies_90s
WHERE rating > (SELECT AVG(rating) FROM movies_90s);

\echo '\n 4. Here is the number of copies of the top rated film of the 5 most recently released films we have in stock across all stores:'



-- SELECT movies.title, movies.release_date, movies.rating FROM movies
-- INNER JOIN stock
-- ON movies.movie_id = stock.movie_id
-- ORDER BY release_date DESC;

WITH movies_ss AS (
SELECT movies.title, movies.release_date, movies.rating, stock.stock_id FROM movies
INNER JOIN stock
ON movies.movie_id = stock.movie_id
ORDER BY release_date DESC),

new_top_rated_movie AS(
SELECT title, COUNT(stock_id) AS Number_of_copies, rating,release_date FROM movies_ss
GROUP BY title, rating, release_date
ORDER BY release_date DESC
LIMIT 5)

SELECT title, Number_of_copies FROM  new_top_rated_movie
ORDER BY rating DESC
LIMIT 1;

\echo '\n 5. These are the locations where our customers live which dont have stores:'

with customer_stores AS(
SELECT * FROM customers
CROSS JOIN stores
WHERE (customers.location = 'Leeds' AND stores.store_id =1)
OR (customers.location = 'Manchester' AND stores.store_id =2)
OR (customers.location = 'Newcastle' AND stores.store_id =3)
OR (customers.location = 'Birmingham' AND stores.store_id =4))

SELECT * FROM customer_stores
;

-- SELECT * FROM TableA A
-- LEFT JOIN TableB B ON
-- A.key = B.key WHERE B.key IS NULL

-- SELECT * FROM   customers
-- ;
-- SELECT * FROM stores;

SELECT location
FROM customers
EXCEPT 
SELECT city
FROM stores;

\echo '\n 6. These are all the locations which our business has influence over'
SELECT location
FROM customers
UNION 
SELECT city
FROM stores;



\echo '\n 7a. This store has the highest quantity of stock:'
-- WITH join_tables AS (
--     SELECT * FROM movies
--     INNER JOIN stock
--     ON movies.movie_id = stock.movie_id
-- ),

-- WITH new_table AS (
--     SELECT * FROM join_tables
--     INNER JOIN stores 
--     ON join_tables.store_id = stores.store_id
-- )

-- SELECT * FROM new_table;

WITH join_tables AS(
SELECT * FROM stock
INNER JOIN stores
ON stock.store_id = stores.store_id
)

SELECT city , COUNT(movie_id) AS total_stock FROM join_tables
GROUP BY city
ORDER BY total_stock DESC
LIMIT 1
;



\echo '\n 7b. ...and this is the most abundant genre in that store:'
WITH cities_with_customers AS (SELECT location FROM customers
INTERSECT
SELECT city FROM stores),
store_with_highest_stock_quantity AS (
    SELECT city, COUNT(*) AS number_of_movies_in_stock
    FROM stock
    JOIN stores
    ON stores.store_id = stock.store_id
    WHERE city IN (SELECT * FROM cities_with_customers)
    GROUP BY city
    ORDER BY number_of_movies_in_stock DESC
    LIMIT 1
    )
SELECT genre_name, COUNT(*) AS number_of_movies 
FROM genres
JOIN movies_genres
ON movies_genres.genre_id = genres.genre_id
JOIN movies
ON movies.movie_id = movies_genres.movie_id
JOIN stock
ON stock.movie_id = movies_genres.movie_id
JOIN stores
ON stores.store_id = stock.store_id
WHERE stores.city IN (SELECT city FROM store_with_highest_stock_quantity)
GROUP BY genre_name
ORDER BY number_of_movies DESC
LIMIT 1;



-- WITH  movie_and_genres AS (
-- SELECT genres.genre_id, genres.genre_name, movies_genres.movie_id,movies_genres.movie_genre_id FROM genres
-- INNER JOIN movies_genres 
-- ON genres.genre_id = movies_genres.genre_id),

-- join_movies_genres AS (
--     SELECT movie_and_genres.movie_genre_id,movie_and_genres.movie_id, movie_and_genres.genre_id, movie_and_genres.genre_name, movies.title 
--     FROM movie_and_genres
--     INNER JOIN movies
--     ON movie_and_genres.movie_id = movies.movie_id
-- ),

-- join_movies_stock AS (
--     SELECT join_movies_genres.movie_genre_id,join_movies_genres.movie_id, join_movies_genres.genre_id, join_movies_genres.genre_name, join_movies_genres.title, stock.store_id, stock.stock_id
--     FROM  join_movies_genres
--     INNER JOIN stock
--     ON join_movies_genres.movie_id = stock.stock_id
-- ),

-- join_stock_stores AS (
--     SELECT 
--     join_movies_stock.movie_genre_id,
--     join_movies_stock.movie_id, 
--     join_movies_stock.genre_id, 
--     join_movies_stock.genre_name, 
--     join_movies_stock.title, 
--     join_movies_stock.store_id,
--     join_movies_stock.stock_id, 
--     stores.city
--     FROM join_movies_stock
--     INNER JOIN stores
--     ON join_movies_stock.store_id = stores.store_id
-- )

-- SELECT DISTINCT(genre_name), COUNT(DISTINCT(title)) AS total_stock 
-- FROM join_stock_stores
-- WHERE city = 'Manchester'
-- GROUP BY  genre_name
-- ORDER BY total_stock DESC
-- LIMIT 1; 





