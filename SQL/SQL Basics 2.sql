-- SQL Basics 2

-- only interested in two columns
SELECT name, genre
FROM movies

--AS is a keyword in SQL that allows you to rename a column or table using an alias
SELECT name AS 'Movie name'
FROM movies;

SELECT imdb_rating AS 'IMDb'
FROM movies;

--DISTINCT is used to return unique values in the output.
SELECT DISTINCT genre
FROM movies;


SELECT *
FROM movies
WHERE imdb_rating > 8;


--LIKE is a special operator used with the WHERE clause to search for a specific pattern in a column
--LIKE is not case sensitive
--The _ means you can substitute any individual character here without breaking the pattern
SELECT *
FROM movies
WHERE name LIKE 'Se_en';

--% is a wildcard character that matches zero or more missing letters in the pattern
--A% matches all movies with names that begin with letter 'A'
--%a matches all movies that end with 'a'
SELECT *
FROM movies
WHERE name LIKE '%man%';

--filter out NULL 
SELECT name
FROM movies
WHERE imdb_rating IS NOT NULL;


--BETWEEN two letters is not inclusive of the 2nd letter.
--BETWEEN two numbers is inclusive of the 2nd number.
-- selects all movies that begin with the letters 'D', 'E', and 'F'
SELECT *
FROM movies
WHERE name BETWEEN 'D' AND 'G';
-- selects all movies that were released in the 1970's
SELECT *
FROM movies
WHERE year BETWEEN 1970 AND 1979;


-- combine multiple conditions in a WHERE clause with AND operator
SELECT * 
FROM movies
WHERE year BETWEEN 1990 AND 1999
    AND genre = 'romance';

SELECT *
FROM movies
WHERE year BETWEEN 1970 AND 1979
    AND imdb_rating > 8;
	
SELECT *
FROM movies
WHERE year < 1985
    AND genre = 'horror';
	
-- with OR operator
SELECT *
FROM movies
WHERE year > 2014
    OR genre = 'action';

SELECT *
FROM movies
WHERE genre = 'romance'
    OR genre = 'comedy';
	
	
-- ORDER BY
SELECT name, year
FROM movies
ORDER BY name;

--DESC: descending order (high to low or Z-A);ASC: ascending order (low to high or A-Z).
SELECT name, year, imdb_rating
FROM movies
ORDER BY imdb_rating DESC;


-- LIMIT
SELECT *
FROM movies
LIMIT 10;

-- top 3 highest rated movies
SELECT *
FROM movies
ORDER BY imdb_rating DESC
LIMIT 3;


--A CASE statement allows us to create different outputs
--SQL's way of handling if/then logic
SELECT name,
 CASE
  WHEN imdb_rating > 7 THEN 'Good'
  WHEN imdb_rating > 5 THEN 'Okay'
  ELSE 'Bad'
 END AS 'Rating'
FROM movies;

SELECT name,
 CASE
  WHEN genre = 'romance' 
	OR genre = 'comedy' THEN 'fun'
  ELSE 'serious'
 END AS 'mood'
FROM movies;


--------------------------------------------------------------------
--SELECT is the clause we use every time we want to query information from a database.
--AS renames a column or table.
--DISTINCT return unique values.
--WHERE is a popular command that lets you filter the results of the query based on conditions that you specify.
--LIKE and BETWEEN are special operators.
--AND and OR combines multiple conditions.
--ORDER BY sorts the result.
--LIMIT specifies the maximum number of rows that the query will return.
--CASE creates different outputs.