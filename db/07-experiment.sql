\c nc_flix


CREATE TABLE exercise(
ex_id SERIAL PRIMARY KEY,
stock_id INT REFERENCES stock(stock_id),
rental_start DATE,
rental_end  DATE,
customer_id INT REFERENCES customers(customer_id)
);

INSERT INTO  exercise(
stock_id, rental_start, rental_end, customer_id
)
VALUES

(34, '2020-11-10', '2020-11-13',8),
(18, '2020-10-02', '2020-10-5', 7),
(33, '2021-04-08', '2021-04-13', 10),
(24, '2021-04-19', '2021-04-20', 8),
(24, '2020-09-27', '2020-09-29', 8),
(32, '2021-06-03', '2021-06-10', 1),
(19, '2020-01-31', '2020-02-05', 9),
(34, '2020-02-13', '2020-02-18', 6),
(34, '2022-07-27', '2022-07-30', 11),
( 13, '2022-01-01', '2022-01-08', 10),
( 35, '2022-10-19', '2022-10-23', 6),
( 2, '2020-07-17', '2020-07-20', 4),
( 27, '2022-09-25', '2022-09-30', 7),
( 30, '2020-02-14', '2020-02-16', 5),
( 7, '2022-01-24', '2022-01-26', 9);

SELECT * FROM  exercise;

DELETE FROM exercise
WHERE customer_id = 8;

SELECT * FROM exercise

