You are now connected to database "nc_flix" as user "yoonhee".
DROP TABLE
CREATE TABLE
INSERT 0 60
 rental_id | stock_id | rental_start | rental_end | customer_id 
-----------+----------+--------------+------------+-------------
         1 |       34 | 2020-11-10   | 2020-11-13 |           8
         2 |       18 | 2020-10-02   | 2020-10-05 |           7
         3 |       33 | 2021-04-08   | 2021-04-13 |          10
         4 |       24 | 2021-04-19   | 2021-04-20 |           8
         5 |       24 | 2020-09-27   | 2020-09-29 |           8
         6 |       32 | 2021-06-03   | 2021-06-10 |           1
         7 |       19 | 2020-01-31   | 2020-02-05 |           9
         8 |       34 | 2020-02-13   | 2020-02-18 |           6
         9 |       34 | 2022-07-27   | 2022-07-30 |          11
        10 |       13 | 2022-01-01   | 2022-01-08 |          10
        11 |       35 | 2022-10-19   | 2022-10-23 |           6
        12 |        2 | 2020-07-17   | 2020-07-20 |           4
        13 |       27 | 2022-09-25   | 2022-09-30 |           7
        14 |       30 | 2020-02-14   | 2020-02-16 |           5
        15 |        7 | 2022-01-24   | 2022-01-26 |           9
        16 |       23 | 2022-08-18   | 2022-08-23 |           5
        17 |       15 | 2020-11-20   | 2020-11-22 |           8
        18 |       28 | 2021-08-13   | 2021-08-15 |          10
        19 |       31 | 2022-03-22   | 2022-03-25 |           6
        20 |       32 | 2021-07-25   | 2021-07-26 |          10
        21 |       12 | 2021-04-30   | 2021-05-10 |           2
        22 |        2 | 2022-05-23   | 2022-05-24 |           7
        23 |       17 | 2021-01-08   | 2021-01-14 |           1
        24 |       33 | 2021-01-28   | 2021-02-05 |           9
        25 |       20 | 2021-04-23   | 2021-04-27 |           9
        26 |        2 | 2020-07-23   | 2020-07-30 |           8
        27 |       24 | 2022-02-16   | 2022-02-18 |           5
        28 |       22 | 2020-07-25   | 2020-07-27 |          11
        29 |       18 | 2022-07-27   | 2022-07-28 |           1
        30 |       19 | 2021-01-04   | 2021-01-10 |           7
        31 |       21 | 2020-09-23   | 2020-09-26 |           7
        32 |       11 | 2021-11-10   | 2021-11-15 |           8
        33 |        6 | 2022-06-25   | 2022-06-26 |           7
        34 |       17 | 2020-10-28   | 2020-10-30 |           9
        35 |        6 | 2022-09-09   | 2022-09-12 |           6
        36 |       26 | 2020-07-24   | 2020-07-30 |          10
        37 |       23 | 2021-10-22   | 2021-10-25 |           9
        38 |       34 | 2021-12-24   | 2021-12-28 |           3
        39 |       33 | 2021-06-02   | 2021-06-14 |           9
        40 |       26 | 2021-06-21   | 2021-06-29 |           5
        41 |       25 | 2022-02-03   | 2022-02-10 |          10
        42 |       28 | 2021-11-09   | 2021-11-11 |           4
        43 |       35 | 2020-09-25   | 2020-09-30 |           1
        44 |       30 | 2020-08-13   | 2020-08-17 |           8
        45 |        6 | 2022-11-14   | 2020-11-15 |           2
        46 |       18 | 2020-09-18   | 2020-09-25 |           8
        47 |       18 | 2021-03-15   | 2021-03-20 |           8
        48 |       34 | 2021-04-23   | 2021-04-26 |           1
        49 |       13 | 2020-10-27   | 2020-10-28 |           6
        50 |       34 | 2022-07-26   | 2022-07-28 |           8
        51 |       20 | 2021-04-15   | 2021-04-25 |           7
        52 |       28 | 2021-04-17   | 2021-04-27 |           5
        53 |        5 | 2021-10-25   | 2021-10-29 |           3
        54 |       13 | 2022-12-06   | 2022-12-18 |           1
        55 |       26 | 2022-04-15   | 2022-04-16 |           6
        56 |        2 | 2020-08-08   | 2020-08-10 |           5
        57 |        7 | 2021-07-22   | 2021-07-25 |          10
        58 |       31 | 2022-04-20   | 2022-04-21 |           7
        59 |       33 | 2020-09-27   | 2020-09-28 |           5
        60 |        8 | 2020-03-13   | 2020-03-20 |          11
(60 rows)

               title                | age_appropriate | in_stock_nearby | not_too_mainstream 
------------------------------------+-----------------+-----------------+--------------------
 Ghostbusters II                    | YES             | NO              | YES
 The Breakfast Club                 | NO              | NO              | YES
 Todo Sobre Mi Madre                | NO              | NO              | YES
 The Lion King II: Simba's Pride    | YES             | NO              | YES
 The Care Bears Movie               | YES             | NO              | YES
 Tron                               | NO              | NO              | YES
 Highlander                         | NO              | NO              | YES
 Cleopatra                          | YES             | NO              | YES
 Catch Me If You Can                | NO              | YES             | NO
 Taxi Driver                        | NO              | YES             | YES
 The Princess Switch                | YES             | NO              | YES
 Girl, Interrupted                  | NO              | NO              | YES
 The Fellowship of the Ring         | NO              | NO              | YES
 Episode I - The Phantom Menace     | YES             | NO              | NO
 Episode IV - A New Hope            | NO              | NO              | NO
 Episode IX - The Rise of Skywalker | NO              | NO              | YES
 Back to the Future                 | YES             | YES             | YES
 Back to the Future Part II         | YES             | YES             | YES
 The Godfather                      | NO              | NO              | YES
 Raiders of the Lost Ark            | NO              | NO              | YES
 Pulp Fiction                       | YES             | NO              | NO
 Toy Story                          | YES             | YES             | YES
 Groundhog Day                      | YES             | NO              | YES
 A Fish Called Wanda                | YES             | NO              | YES
 Independance Day                   | NO              | NO              | YES
(25 rows)


 store_id, location, number of customers in the same location
 store_id |  location  | count 
----------+------------+-------
        1 | Leeds      |     4
        2 | Manchester |     3
          | Bolton     |     2
          | Leicester  |     1
          | Liverpool  |     1
(5 rows)


  number of films available in store
    city    | count 
------------+-------
 Birmingham |     3
 Leeds      |     5
 Manchester |     5
 Newcastle  |     3
(4 rows)


most valued customer (customer with the most rentals)
    city    | customer_name | most_valued_customer 
------------+---------------+----------------------
 Leeds      | Liam          |                   10
 Leeds      | Vel           |                    8
 Leeds      | Jim           |                    7
 Leeds      | David         |                    6
 Manchester | Alex          |                    7
 Manchester | Duncan        |                    6
 Manchester | Cat           |                    2
(7 rows)


 most popular film (film with most rentals)
 stock_id |          title          | count 
----------+-------------------------+-------
       34 | Episode IV - A New Hope |     6
(1 row)


 average rating of each store (calculated as average of all films in store) rounded to **1 decimal place**
 store_id |    city    | round 
----------+------------+-------
        1 | Leeds      |   6.0
        2 | Manchester |   8.3
        3 | Newcastle  |   6.6
        4 | Birmingham |   7.2
(4 rows)


 all together
