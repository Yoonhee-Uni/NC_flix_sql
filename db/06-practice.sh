You are now connected to database "nc_flix" as user "yoonhee".
           title            
----------------------------
 Back to the Future
 Back to the Future Part II
 Catch Me If You Can
 Taxi Driver
 Toy Story
(5 rows)

number 6 all together
checking
 store_id |    city    | count 
----------+------------+-------
        1 | Leeds      |     5
        2 | Manchester |     5
        3 | Newcastle  |     3
        4 | Birmingham |     3
(4 rows)

valued_cust
    city    | customer_name | rental_count 
------------+---------------+--------------
 Leeds      | Liam          |           10
 Manchester | Alex          |            7
(2 rows)

join practice without order
    city    | movie_id 
------------+----------
 Newcastle  |        5
 Leeds      |        7
 Leeds      |        7
 Leeds      |        7
 Leeds      |        7
 Leeds      |        7
 Leeds      |        7
 Manchester |        9
 Manchester |        9
 Manchester |        9
 Manchester |        9
 Manchester |        9
 Manchester |        9
 Manchester |        9
 Manchester |        9
 Manchester |        9
 Manchester |        9
 Manchester |        9
 Manchester |        9
 Manchester |       10
 Manchester |       10
 Manchester |       10
 Manchester |       10
 Newcastle  |       12
 Birmingham |       14
 Birmingham |       14
 Birmingham |       14
 Birmingham |       14
 Birmingham |       14
 Birmingham |       14
 Birmingham |       14
 Birmingham |       14
 Birmingham |       14
 Birmingham |       14
 Birmingham |       14
 Birmingham |       14
 Birmingham |       15
 Birmingham |       15
 Leeds      |       15
 Leeds      |       15
 Leeds      |       15
 Leeds      |       15
 Birmingham |       15
 Birmingham |       15
 Birmingham |       16
 Birmingham |       16
 Leeds      |       16
 Leeds      |       16
 Leeds      |       16
 Leeds      |       16
 Manchester |       17
 Manchester |       17
 Manchester |       17
 Manchester |       17
 Manchester |       18
 Manchester |       18
 Manchester |       18
 Manchester |       18
 Newcastle  |       21
 Newcastle  |       21
 Newcastle  |       21
 Leeds      |       21
 Leeds      |       22
 Leeds      |       22
 Manchester |       22
(65 rows)

join practice without order2
    city    |             movie_name             | rental_count | row_num 
------------+------------------------------------+--------------+---------
 Birmingham | Episode IV - A New Hope            |           10 |       1
 Birmingham | Episode I - The Phantom Menace     |           10 |       2
 Birmingham | Episode IX - The Rise of Skywalker |            2 |       3
 Leeds      | Toy Story                          |            4 |       1
 Leeds      | Highlander                         |            4 |       2
 Leeds      | Episode IV - A New Hope            |            3 |       3
 Manchester | Catch Me If You Can                |            8 |       1
 Manchester | Back to the Future                 |            4 |       2
 Manchester | Taxi Driver                        |            3 |       3
 Manchester | Back to the Future Part II         |            1 |       4
 Manchester | Toy Story                          |            1 |       5
 Newcastle  | Pulp Fiction                       |            6 |       1
 Newcastle  | The Care Bears Movie               |            3 |       2
 Newcastle  | Girl, Interrupted                  |            1 |       3
(14 rows)

