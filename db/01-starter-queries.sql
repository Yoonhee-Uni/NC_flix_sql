\c nc_flix

\echo '\n 1. Here are all the movie titles which were released in the 21st century:'
SELECT title AS released_21st_century FROM movies 
WHERE release_date BETWEEN '2001-01-01' AND '2100-12-31';

\echo '\n 2. This is our oldest customer:'
SELECT customer_name AS oldest_customer, date_of_birth FROM customers 
ORDER BY date_of_birth ASC
LIMIT 1;

\echo '\n 3. Customers beginning with D (youngest to oldest):'
SELECT customer_name, date_of_birth FROM customers
WHERE customer_name like 'D%'
ORDER BY date_of_birth DESC;


\echo '\n 4. This is the average rating of the all the movies made in the 80s:'
SELECT ROUND(AVG(rating),2) AS avg_rating FROM  movies
WHERE release_date BETWEEN '1980-01-01' AND '1989-12-31';



\echo '\n 5. These are the locations our customers live in, along with the total, and average number of loyalty points in that area.'
SELECT  DISTINCT(location), SUM(loyalty_points) AS total_point, 
ROUND(AVG(loyalty_points),2) AS AVG_point FROM customers
GROUP BY location;



\echo '\n 6. After decreasing the price of the movie rentals, the movie table now looks like:'

-- 6. The rise in living costs is affecting rentals, drop the cost of all rentals by 5% and display the updated table. **As this is a monetary value make sure it is rounded to 2 decimal places**

SELECT title, cost, ROUND((cost*0.95),2) AS disc_cost FROM movies

