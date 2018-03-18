-- SQL basics

SELECT * FROM celebs;

-- create table with column names and datatypes
CREATE TABLE celebs (id INTEGER, name TEXT, age INTEGER);

-- insert a row (a record)
INSERT INTO celebs (id, name, age)
VALUES(1,'Justin Bieber',21);

INSERT INTO celebs (id, name, age)
VALUES(2,'Beyonce',33);

-- select specifc column
SELECT name FROM celebs;

-- update table
UPDATE celebs
SET age = 22
WHERE id = 1;

-- add new column to table
ALTER TABLE celebs ADD COLUMN
twitter_handle TEXT;


UPDATE celebs
SET twitter_handle = '@taylorswift13'
WHERE id = 4;

-- delete rows (for cleaning data)
DELETE FROM celebs WHERE
twitter_handle IS NULL;


-- create table with constraints
CREATE TABLE celebs (
    id INTEGER PRIMARY KEY, 
    name TEXT UNIQUE,
    date_of_birth TEXT NOT NULL,
    date_of_death TEXT DEFAULT 'Not Applicable',
);

--PRIMARY KEY columns can be used to uniquely identify the row. 

--UNIQUE columns have a different value for every row. 
--This is similar to PRIMARY KEY except a table can have many different UNIQUE columns.

--NOT NULL columns must have a value. 
--Attempts to insert a row without a value for a NOT NULL column will result in a constraint violation and the new row will not be inserted.

--DEFAULT columns take an additional argument that will be the assumed value for an inserted row 
--if the new row does not specify a value for that column.
  
--------------------------------------------------------------
--CREATE TABLE creates a new table.
--INSERT INTO adds a new row to a table.
--SELECT queries data from a table.
--UPDATE edits a row in a table.
--ALTER TABLE changes an existing table.
--DELETE FROM deletes rows from a table.