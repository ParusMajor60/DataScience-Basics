-- SQL Basics 3

-- COUNT
SELECT COUNT(*)
FROM fake_apps;

SELECT COUNT(*)
FROM fake_apps
WHERE price = 0;

-- SUM
SELECT SUM(downloads)
FROM fake_apps;

-- MAX/MIN
SELECT MAX(downloads)
FROM fake_apps;

SELECT MIN(downloads)
FROM fake_apps;

SELECT MAX(price)
FROM fake_apps;

-- AVG
SELECT AVG(downloads)
FROM fake_apps;

--ROUND
SELECT name, ROUND(price, 0)
FROM fake_apps;

SELECT ROUND(AVG(price), 2)
FROM fake_apps;


-- GROUP BY
-- if want
SELECT AVG(imdb_rating)
FROM movies
WHERE year = 1999;

SELECT AVG(imdb_rating)
FROM movies
WHERE year = 2000;

SELECT AVG(imdb_rating)
FROM movies
WHERE year = 2001;

-- can do 
SELECT year,
   AVG(imdb_rating)
FROM movies
GROUP BY year
ORDER BY year;

--count the total number of apps for each price in the table
SELECT price, COUNT(*)
FROM fake_apps
GROUP BY price;

--count the total number of apps that has been downloaded more than 20,000 times, at each price
SELECT price, COUNT(*)
FROM fake_apps
WHERE downloads > 20000
GROUP BY price;

--calculates the total number of downloads for each category
SELECT category, SUM(downloads)
FROM fake_apps
GROUP BY category;


-- column reference for GROUP BY and ORDER BY
--1 is the first column selected
--2 is the second column selected
--3 is the third column selected, and so on
SELECT category, 
   price,
   AVG(downloads)
FROM fake_apps
GROUP BY category, price;
-- is equivalent to 
SELECT category, price, AVG(downloads)
FROM fake_apps
GROUP BY 1, 2;


-- HAVING
--When we want to limit the results of a query based on values of the individual rows, use WHERE.
--When we want to limit the results of a query based on an aggregate property, use HAVING

--want to see how many movies of different genres were produced each year, but only care about years and genres with at least 10 movies.
SELECT year,
   genre,
   COUNT(name)
FROM movies
GROUP BY 1, 2
HAVING COUNT(name) > 10

SELECT price,
    ROUND(AVG(downloads))
FROM fake_apps
GROUP BY price
HAVING COUNT(price) > 9;


--------------------------------------------------------------------
--COUNT: count the number of rows
--SUM: the sum of the values in a column
--MAX/MIN: the largest/smallest value
--AVG: the average of the values in a column
--ROUND: round the values in the column

--Aggregate functions combine multiple rows together to form a single value of more meaningful information.

--GROUP BY is a clause used with aggregate functions to combine data from one or more columns.
--HAVING limit the results of a query based on an aggregate property.