You are now connected to database "nc_flix" as user "yoonhee".

 1. Here are the number of films in stock for each genre:
 genre_name | count 
------------+-------
 drama      |     7
 fantasy    |     3
 action     |    16
 crime      |    10
 family     |     4
 comedy     |     8
 sci_fi     |    17
(7 rows)


 2. Here is the average rating for films in stock in Newcastle:
 round 
-------
  7.67
(1 row)

 movie_id |        title         | release_date | rating | cost | classification | stock_id | store_id | movie_id | store_id |   city    
----------+----------------------+--------------+--------+------+----------------+----------+----------+----------+----------+-----------
       12 | Girl, Interrupted    | 2000-03-24   |      8 | 2.00 | 12             |       22 |        3 |       12 |        3 | Newcastle
       21 | Pulp Fiction         | 1994-05-21   |      5 | 2.00 |                |       23 |        3 |       21 |        3 | Newcastle
       21 | Pulp Fiction         | 1994-05-21   |      5 | 2.00 |                |       24 |        3 |       21 |        3 | Newcastle
       21 | Pulp Fiction         | 1994-05-21   |      5 | 2.00 |                |       25 |        3 |       21 |        3 | Newcastle
        5 | The Care Bears Movie | 1985-08-14   |     10 | 1.00 |                |       26 |        3 |        5 |        3 | Newcastle
(5 rows)


 3. Here are all the films made in 90s with above average rating:
             title              
--------------------------------
 Episode I - The Phantom Menace
 Toy Story
 Groundhog Day
 Independance Day
(4 rows)


 4. Here is the number of copies of the top rated film of the 5 most recently released films we have in stock across all stores:
   title   | number_of_copies 
-----------+------------------
 Toy Story |                3
(1 row)


 5. These are the locations where our customers live which dont have stores:
 customer_id | customer_name | date_of_birth |  location  | loyalty_points | store_id |    city    
-------------+---------------+---------------+------------+----------------+----------+------------
           1 | David         | 1992-12-30    | Leeds      |            202 |        1 | Leeds
           4 | Cat           | 1985-11-02    | Manchester |             29 |        2 | Manchester
           5 | Alex          | 2001-06-24    | Manchester |           1045 |        2 | Manchester
           6 | Duncan        | 1994-01-19    | Manchester |             99 |        2 | Manchester
           7 | Vel           | 1989-05-01    | Leeds      |             14 |        1 | Leeds
           8 | Liam          | 1993-10-03    | Leeds      |                |        1 | Leeds
           9 | Jim           | 1989-05-01    | Leeds      |             14 |        1 | Leeds
(7 rows)

 location  
-----------
 Leicester
 Bolton
 Liverpool
(3 rows)


 6. These are all the locations which our business has influence over
  location  
------------
 Leeds
 Newcastle
 Bolton
 Birmingham
 Leicester
 Liverpool
 Manchester
(7 rows)


 7a. This store has the highest quantity of stock:
    city    | total_stock 
------------+-------------
 Manchester |          11
(1 row)


 7b. ...and this is the most abundant genre in that store:
 genre_name | number_of_movies 
------------+------------------
 comedy     |                8
(1 row)

