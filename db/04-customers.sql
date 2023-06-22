\c nc_flix


\echo '\n 1. Here is the information about the customers and their loyalty status:'
SELECT customer_name, location, loyalty_points,
CASE
    WHEN loyalty_points = 0 THEN 'doesn''t even go here'
    WHEN loyalty_points < 10 THEN 'bronze status'
    WHEN loyalty_points BETWEEN 10 AND 100 THEN 'silver status' 
    WHEN loyalty_points > 100 THEN  'gold status'
    ELSE 'NULL'
END AS loyalty_membership_status
FROM Customers;




-- SELECT OrderID, Quantity,
-- CASE
--     WHEN Quantity > 30 THEN 'The quantity is greater than 30'
--     WHEN Quantity = 30 THEN 'The quantity is 30'
--     ELSE 'The quantity is under 30'
-- END AS QuantityText
-- FROM OrderDetails;

\echo '\n 2. Here is a comprehensive output of the customers ordered by loyalty points, and grouped by area:'
-- WITH cust_loc AS(
-- SELECT customer_name, date_of_birth, location, loyalty_points
-- FROM customers
-- GROUP BY location )

-- SELECT customer_name, date_of_birth, location, loyalty_points
-- FROM cust_loc
-- ORDER BY loyalty_points DESC;

SELECT customer_name, EXTRACT(YEAR FROM age(date_of_birth)) AS age, location, loyalty_points
FROM customers
ORDER BY location, loyalty_points DESC;

