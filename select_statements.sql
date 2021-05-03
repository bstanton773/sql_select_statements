-- Hello World SQL Query, SELECT all records FROM specified table
SELECT * 
FROM actor;

-- Query for first_name and last_name of the actor table
SELECT first_name, last_name
FROM actor;

-- Query for all actors with the first_name Nick -- using the WHERE clause
SELECT first_name, last_name
FROM actor
WHERE first_name = 'Nick';

-- Quest for all first_names that are equal to Nick using WHERE/LIKE
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'Nick';

-- Query for all first_names that start with a J -- Using WHERE/LIKE + wildcard (%)
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'J%';

-- Query for all first_name data that starts with K and has 2 letters after the K using WHERE/LIKE and underscores(_)
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'K__';

-- Query for all first_name data that starts with K and ends with th and has at least 2 letters in between
SELECT *
FROM actor
WHERE first_name LIKE 'K_%_th';


-- Comparing Operators:
-- Greater Than (>) -- Less Than (<)
-- Greater Than or Equal (>=) -- Less Than or Equal (<=)
-- Not Equal (<>)
-- BETWEEN/AND

-- Explore Data with SELECT ALL query (Specific to changing into new table)
SELECT *
FROM payment;


-- Query for data that shows customers who paid an amount GREATER than $2
SELECT customer_id, amount
FROM payment
WHERE amount > '2.00';

-- Query for data for customers who paid LESS THAN $7.99
SELECT *
FROM payment
WHERE amount < 7.99;

-- Query for data for customers who paid LESS THAN or EQUAL TO $7.99
SELECT *
FROM payment
WHERE amount <= 7.99;


-- Query for data GREATER THAN or EQUAL TO $2 and ORDER BY amount
SELECT customer_id, amount
FROM payment
WHERE amount >= 2.00
ORDER BY amount DESC;

-- Query for data >= 2.00 and <= 7.99
SELECT customer_id, amount
FROM payment
WHERE amount >= 2.00 AND amount <= 7.99;
-- Same as above but with BETWEEN/AND
SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 2.00 AND 7.99;

-- Query for data that shows customers who paid an amount
-- NOT EQUAL to $0.00 - Order by amount
SELECT customer_id, amount
FROM payment
WHERE amount != 0.00
ORDER BY amount ASC;




-- SQL Aggregations => SUM(), AVG(), COUNT(), MIN(), MAX()

-- Query to display the sum of amounts paid
SELECT SUM(amount)
FROM payment
WHERE amount > 5.99;

--Query to display the average of amounts paid
SELECT AVG(amount)
FROM payment
WHERE amount > 5.99;

-- Query to display the count of amounts paid 
SELECT COUNT(*)
FROM payment;

-- Query to display the count of unique amount paid
SELECT COUNT(DISTINCT amount)
FROM payment;

-- Query to get Min/Max from amount paid
SELECT MIN(amount)
FROM payment
WHERE amount > 5.99;

SELECT MAX(amount)
FROM payment;


-- Query to display the count of each amount paid using the GROUP BY clause
SELECT amount, COUNT(*)
FROM payment
WHERE amount > 5.99
GROUP BY amount;

-- Query to display customer_ids with the summed amount for each customer
SELECT customer_id, SUM(amount) as total_paid, COUNT(amount) as total_visits
FROM payment
GROUP BY customer_id
ORDER BY total_visits DESC, total_paid DESC;

-- Query to display the count of each amount paid that is more than 10 -- using GROUP BY and HAVING clause
SELECT amount, COUNT(*)
FROM payment
GROUP BY amount
HAVING COUNT(*) > 100;

-- Query to display where the amount is less than 7.99 and total paid over $1000 
SELECT amount, SUM(amount) as total_paid
FROM payment
WHERE amount < 7.99
GROUP BY amount
HAVING SUM(amount) > 1000
ORDER BY total_paid DESC;


-- Query to display the top 10 customers (in total paid) who have been to the store less than 10 times 
-- and only counting payments more than $2.99
SELECT customer_id, COUNT(*) as total_visits, SUM(amount) as total_paid
FROM payment
WHERE amount > 2.99
GROUP BY customer_id
HAVING COUNT(*) < 10
ORDER BY total_paid DESC
LIMIT 10;

SELECT *
FROM payment;




