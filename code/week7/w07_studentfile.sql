-- *********************************
-- W07 STUDENT SQL WORKBOOK
-- *********************************

/*
     SELECT   column_name AS 'Alias1'
     ,        column_name_2 AS 'Alias2'
     FROM     table_name
     WHERE    column_name = condition (This is used to filter)
     ORDER BY column_name (DESC) (This is used to sort)
     LIMIT    # of rows;

     To remember this: Stay Firm With Our Lord
*/

USE world;
-- For questions 2 through 5, limit the records returned to 5.
-- 1. SELECT all columns from the country table
-- 2. SELECT the name, population, and continent from the country table
-- 3. Filter the previous query by populations bigger than 800,000 (>)
-- 4. Switch the filter to only show countries from the Americas (OR/IN)
-- 5. ORDER BY the population from greatest to least (DESC)
-- 6. Switch the ORDER BY to use continent, then switch continent to name.
--    Filter the name starting from G through J
-- 7. What is DESC doing? What do we do to show the results in alphabetical order?
-- 8. Do the same queries as above without DESC. What do we find as the smallest
--    country in the Americas?
-- 9. Switch the filter to be: population BETWEEN 400,000 AND 500,000
-- 10. ORDER BY population

-- *******************************
-- LIKE Operator (WHERE clause)
/*
   Using % as wildcard operators
   we can specify whether or not
   a string starts with, ends with
   or contains part of the string:
   'Las%'
   '%Las'
   '%Las%'
   'Las %'
*/
-- *******************************

-- 11. Select all city names that begin with 'Las'
-- 12. Add the CountryCode to tell which country those cities reside in
-- 13. SELECT all city names that end in 'gre'
-- 14. SELECT all city names with 'end' somewhere in them

-- *******************************
-- IS NULL/IS NOT NULL Operators
/*
   We apply IS NULL and IS NOT NULL
   to the end of a column in the WHERE
   clause. This will filter by NULL or
   NOT NULL values.
*/
-- *******************************

-- 15. SELECT all country names, lifeExpectancy, and continent
--     WHERE LifeExpectancy IS NULL
-- 16. Modify the previous query to use: IS NOT NULL
-- 17. ORDER the previous query by LifeExpectancy
-- 18. Modify the previous query to find the country with the highest
--     LifeExpectancy
-- 19. What is the LifeExpectancy of the United States?
-- 20. Modify the previous query to find the LifeExpectancy of Germany and the US.
--     If we remove the ORDER BY statement, does it affect the query?

-- *******************************
-- Calculations in SELECT clause
-- *******************************

USE bike;

-- Show me the products, model years, and list price and add $100 to each without editing the database 
SELECT product_name, model_year, list_price, list_price + 100
FROM product;

-- Show me products, and list price and list the column as "price_adjustment"
-- and show me only the prices over $1000
SELECT product_name, list_price + 100 AS price_adjustment
FROM product
WHERE list_price + 100 > 1000   -- can't use price_adjustment here because of Order of Executuion
ORDER BY price_adjustment;     -- can use it here however

-- *******************************
-- Nested OR/AND Operators
-- *******************************

-- Show me the products and model year of the products that start with Trek or Surly
-- (but not from 2016)
SELECT product_name, model_year
FROM product
WHERE (product_name LIKE 'Trek%' OR product_name LIKE 'Surly%') AND NOT model_year = 2016;
-- change AND to OR and now you get other brands that are not 2016
-- Without the ()s is only takes off 2016s for Surly
-- OR with REGEX and another NOT <>
-- The ^ means 'begins with'
SELECT product_name, model_year
FROM product
WHERE (product_name REGEXP '^Trek' OR product_name REGEXP '^Surly') AND model_year <> 2016;


-- *******************************
-- DISTINCT Operator
-- *******************************

USE v_art;

-- Show me all the different periods from the artwork 
-- (DISTINCT, only one of each - gets rid of repeats)
SELECT DISTINCT period
FROM   artwork;

-- *******************************
-- REGEXP Examples
-- *******************************

-- Selects any period with 'impr' anywhere in the name of the period
SELECT title, period
FROM artwork
WHERE period REGEXP 'impr';

-- Show me the title and period of the artwork that has 'the', 'in', or 'on' in the title
SELECT title
FROM artwork
WHERE title REGEXP 'the|in|on';