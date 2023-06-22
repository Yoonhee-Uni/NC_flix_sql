\c nc_flix


\echo '\n 1. The store with the highest total of sequels is:'

-- SELECT * FROM movies WHERE 

SELECT stores.city, COUNT(DISTINCT(movies.title)) AS  Total_of_sequels  FROM movies
JOIN stock
ON movies.movie_id = stock.movie_id
JOIN stores
ON stock.store_id = stores.store_id
WHERE 
title LIKE'%II%' OR 
title LIKE'%IV%' OR  
title LIKE'%IX%'
GROUP BY city
ORDER BY Total_of_sequels DESC
LIMIT 1;


