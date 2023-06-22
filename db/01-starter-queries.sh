You are now connected to database "nc_flix" as user "yoonhee".

 1. Here are all the movie titles which were released in the 21st century:
       released_21st_century        
------------------------------------
 Todo Sobre Mi Madre
 Catch Me If You Can
 The Princess Switch
 The Fellowship of the Ring
 Episode IX - The Rise of Skywalker
(5 rows)


 2. This is our oldest customer:
 oldest_customer | date_of_birth 
-----------------+---------------
 Cat             | 1985-11-02
(1 row)


 3. Customers beginning with D (youngest to oldest):
 customer_name | date_of_birth 
---------------+---------------
 Duncan        | 1994-01-19
 David         | 1992-12-30
(2 rows)


 4. This is the average rating of the all the movies made in the 80s:
 avg_rating 
------------
       7.00
(1 row)


 5. These are the locations our customers live in, along with the total, and average number of loyalty points in that area.
  location  | total_point | avg_point 
------------+-------------+-----------
 Leicester  |             |          
 Manchester |        1173 |    391.00
 Leeds      |         230 |     76.67
 Liverpool  |          13 |     13.00
 Bolton     |         198 |    198.00
(5 rows)


 6. After decreasing the price of the movie rentals, the movie table now looks like:
               title                | cost | disc_cost 
------------------------------------+------+-----------
 Ghostbusters II                    | 1.50 |      1.43
 The Breakfast Club                 | 2.00 |      1.90
 Todo Sobre Mi Madre                | 1.25 |      1.19
 The Lion King II: Simba's Pride    | 1.50 |      1.43
 The Care Bears Movie               | 1.00 |      0.95
 Tron                               | 2.00 |      1.90
 Highlander                         | 1.00 |      0.95
 Cleopatra                          | 1.00 |      0.95
 Catch Me If You Can                | 2.00 |      1.90
 Taxi Driver                        | 1.00 |      0.95
 The Princess Switch                | 1.00 |      0.95
 Girl, Interrupted                  | 2.00 |      1.90
 The Fellowship of the Ring         | 2.50 |      2.38
 Episode I - The Phantom Menace     | 1.50 |      1.43
 Episode IV - A New Hope            | 2.25 |      2.14
 Episode IX - The Rise of Skywalker | 1.25 |      1.19
 Back to the Future                 | 2.50 |      2.38
 Back to the Future Part II         | 1.75 |      1.66
 The Godfather                      | 1.50 |      1.43
 Raiders of the Lost Ark            | 2.25 |      2.14
 Pulp Fiction                       | 2.00 |      1.90
 Toy Story                          | 1.50 |      1.43
 Groundhog Day                      | 1.50 |      1.43
 A Fish Called Wanda                | 1.50 |      1.43
 Independance Day                   | 1.00 |      0.95
(25 rows)

