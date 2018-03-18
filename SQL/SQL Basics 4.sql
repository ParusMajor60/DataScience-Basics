-- SQL Basics 4
-- Multiple tables

SELECT *
FROM orders;


SELECT *
FROM subscriptions;

SELECT *
FROM customers;


-- JOIN
SELECT *
FROM orders
JOIN customers
    ON orders.customer_id = customers.customer_id

SELECT orders.order_id,
       customers.customer_name
FROM orders
JOIN customers
    ON orders.customer_id = customers.customer_id
	
SELECT *
FROM orders
JOIN subscriptions
    ON orders.subscription_id 
    = subscriptions.subscription_id;

SELECT *
FROM orders
JOIN subscriptions
    ON orders.subscription_id 
    = subscriptions.subscription_id
WHERE description = 'Fashion Magazine';


-- Inner Joins
SELECT COUNT(*)
FROM newspaper;

SELECT COUNT(*)
FROM online;

-- want to know how many subscribe to both
SELECT COUNT(*)
FROM newspaper
JOIN online
    ON newspaper.id = online.id;
	
	
-- LEFT JOIN
--A left join will keep all rows from the first table, regardless of whether there is a matching row in the second table
--want to know how many users subscribe to the print news paper, but not to the online
SELECT *
FROM newspaper
LEFT JOIN online
		ON newspaper.id = online.id;
   
-- find which users do not subscribe to the online edition
SELECT *
FROM newspaper
LEFT JOIN online
		ON newspaper.id = online.id
WHERE online.id IS NULL;


-- CROSS JOIN
-- basically just purely combine all 
-- the following returns only two columns together
SELECT shirts.shirt_color,
       pants.pant_color
FROM shirts
CROSS JOIN pants;

-- for one month counting the number of customers who were subscribed to the newspaper during March (3)
SELECT COUNT(*)
FROM newspaper
WHERE start_month < 3
		AND end_month > 3;
    
SELECT *
FROM newspaper
CROSS JOIN months;

--select all months where a user was subscribed.
SELECT *
FROM newspaper
CROSS JOIN months
WHERE start_month < month
		AND end_month > month;
		
		
-- count and group by
SELECT month, COUNT(*) AS subscribers
FROM newspaper
CROSS JOIN months
WHERE start_month < month
		AND end_month > month
GROUP BY month;


-- UNION
SELECT *
FROM newspaper
UNION
SELECT *
FROM online;


-- WITH
--want to know how many magazines each customer subscribes to
WITH previous_query AS (
		SELECT customer_id,
				COUNT(subscription_id) as subscriptions
    FROM orders
    GROUP BY customer_id
)
  
SELECT customers.customer_name,
				previous_query.subscriptions
FROM previous_query
JOIN customers
		ON previous_query.customer_id = customers.customer_id;
		
		
------------------------------------------------------------------------
--JOIN will combine rows from different tables if the join condition is true.

--LEFT JOIN will return every row in the left table, and if the join condition is not met, NULL values are used to fill in the columns from the right table.

--Primary key is a column that serves a unique identifier for the rows in the table.

--Foreign key is a column that contains the primary key to another table.

--CROSS JOIN lets us combine all rows of one table with all rows of another table

--UNION stacks one dataset on top of another.

--WITH allows us to define a bunch of temporary tables that can be used in the final query.