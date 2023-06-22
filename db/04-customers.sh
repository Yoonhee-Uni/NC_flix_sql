You are now connected to database "nc_flix" as user "yoonhee".

 1. Here is the information about the customers and their loyalty status:
 customer_name |  location  | loyalty_points | loyalty_membership_status 
---------------+------------+----------------+---------------------------
 David         | Leeds      |            202 | gold status
 Joe           | Liverpool  |             13 | silver status
 Verity        | Leicester  |                | NULL
 Cat           | Manchester |             29 | silver status
 Alex          | Manchester |           1045 | gold status
 Duncan        | Manchester |             99 | silver status
 Vel           | Leeds      |             14 | silver status
 Liam          | Leeds      |                | NULL
 Jim           | Leeds      |             14 | silver status
 Paul C        | Bolton     |            198 | gold status
 Haz           | Bolton     |                | NULL
(11 rows)


 2. Here is a comprehensive output of the customers ordered by loyalty points, and grouped by area:
 customer_name | age |  location  | loyalty_points 
---------------+-----+------------+----------------
 Haz           |  30 | Bolton     |               
 Paul C        |  32 | Bolton     |            198
 Liam          |  29 | Leeds      |               
 David         |  30 | Leeds      |            202
 Vel           |  34 | Leeds      |             14
 Jim           |  34 | Leeds      |             14
 Verity        |  26 | Leicester  |               
 Joe           |  33 | Liverpool  |             13
 Alex          |  21 | Manchester |           1045
 Duncan        |  29 | Manchester |             99
 Cat           |  37 | Manchester |             29
(11 rows)

