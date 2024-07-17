-- *********************************
-- W10 STUDENT SQL WORKBOOK
-- *********************************

/*
  ORDER OF OPERATION (The way we write our queries):
     SELECT     column_name AS 'Alias1'
     ,          Function(column_name_2) AS 'Alias2'
     FROM       table1 t1   -- t1 and t2 are table aliases
       JOIN       table2 t2   -- join types: INNER, LEFT, RIGHT
       ON         t1.table1_id = t2.table1_id -- PK and FK might not always be the same name
     WHERE      column_name = condition (Cannot contain an aggregate function)
     GROUP BY   column_name (Must be a column in the SELECT clause that is NOT in an aggregate function)
     HAVING     aggregate_function(column_name) = group condition
     ORDER BY   column_name (DESC)
     LIMIT      # of rows;
     To remember this: Stay Firm (JOINED) With God, Honoring Our Lord
*/

/*
  ORDER OF EXECUTION (The way the code actually runs):
    FROM       table1 t1   
      JOIN       table2 t2  
      ON         t1.table1_id = t2.table1_id
    WHERE      column_name = condition
    GROUP BY   column_name 
    HAVING     aggregate_function(column_name) = group condition
    SELECT     column_name AS 'Alias1'
    ,          Function(column_name_2) AS 'Alias2'
    ORDER BY   column_name (DESC)
    LIMIT      # of rows;
    To remember this: For with God, He sends out love
*/

/*
  Common Aggregate Functions:
  COUNT()
  SUM()
  AVG()
  MAX()
  MIN()
*/

-- Let's use the v_art database, select it
USE v_art;

-- 1. Show me the country, firstname, and lastname from the table artist
SELECT country
,      fname
,      lname
FROM artist;

-- 2. Which artist are from France? What if there were thousands?
SELECT country
,      fname
,      lname
FROM artist
WHERE country = 'France';

-- 3. How many total artist are from France?
SELECT COUNT(country) AS 'Artist Count'
FROM artist
WHERE country = 'France';

-- This next one won't work, why?
-- 4. Can't use fname and lname anymore because the summary count doesn't go with one person
SELECT COUNT(country) AS 'Artist Count'
,      fname
,      lname
FROM artist
WHERE country = 'France';

-- 5. But I could use country because that is the same for all
SELECT COUNT(country) AS 'Artist Count'
,      country
FROM artist
WHERE country = 'France';

-- Switch to the bike database
USE bike;

-- 6. Show me the list prices of the products
SELECT list_price
FROM product;

-- 7. Show me the average list price
SELECT AVG(list_price) AS 'Average Price'
FROM product;

-- 8. Show me the average list price with only two decimals, outputs an integer
SELECT ROUND(AVG(list_price),2) AS averagelistprice
FROM product;

-- 9. Add the Format function to display with commas
SELECT FORMAT(AVG(list_price),2) AS averagelistprice
FROM product;

-- 10. Show me the total cost of all the items
SELECT SUM(list_price) AS 'Grand Total'
FROM product;

-- 11. Show me the most expensive and least expensive item in one query
SELECT MAX(list_price) AS 'most expensive' 
,      MIN(list_price) AS 'least expensive'
FROM product;

-- 12. Show me which one (item) is the most expensive
SELECT product_name
,      list_price
FROM product
ORDER BY list_price DESC
LIMIT 1;
-- OR 
SELECT product_name
,      list_price
FROM product
WHERE list_price IN (SELECT MAX(list_price) FROM product);

-- 13. Show me the average list price for 2016 models
--     If I wanted the average of each model year I could get one year at a time this way
SELECT AVG(list_price) AS 'Average Price'
FROM product
WHERE model_year = 2016;
-- 14. And I'd have to do that for each year. What if I wanted all the years at once?
--     Show me the average list price for 2017 models
SELECT AVG(list_price) AS 'Average Price'
FROM product
WHERE model_year = 2017;

-- **********
-- GROUP BY
-- **********

-- 15. Show me the average list price of each model year listed by year
--     Answer: use GROUP BY
SELECT AVG(list_price) AS 'Average Price'
FROM product
GROUP BY model_year;

-- 16.1 We can use model_year to clarify. The model year is the same for each row
SELECT model_year
,      AVG(list_price) AS 'Average Price'
FROM product
GROUP BY model_year;

-- 16.2 DOES NOT WORK - WHY NOT?
SELECT model_year
,      AVG(list_price) AS 'Average Price'
FROM product
WHERE model_year;

-- 17. Show me the average list price of each model year listed by year only if the 
--     list prices are over $2800
SELECT model_year
,      AVG(list_price) AS 'Avg Price'
FROM   product
WHERE  list_price > 2800
GROUP BY model_year;

-- ****************************
-- WITH ROLLUP, DISTINCT, ALL
-- WITH ROLLUP is a subclause of GROUP BY
-- ****************************

-- 18. Show me the average list price of each model year listed by year only if the list prices are over $2800
--     Then show me the final average of all the averages
SELECT model_year
,      AVG(list_price) AS 'Avg Price'
FROM   product
WHERE  list_price > 2800
GROUP BY model_year WITH ROLLUP;

-- 19. Do the same one but show me the total 
--     Sum of all the sums 'Grand Total' - still for each model year 
--     listed by year only if the list prices are over $2800
SELECT model_year
,      SUM(list_price) AS 'Total Price'
FROM   product
WHERE  list_price > 2800
GROUP BY model_year WITH ROLLUP;

-- 20. Same as above but only count each price once
--     If we had bikes the same price we might not want to include 
--     the same price twice in the average, we'd use DISTINCT
SELECT model_year
,      SUM(DISTINCT list_price) AS 'Total Price'
FROM   product
WHERE  list_price > 2800
GROUP BY model_year WITH ROLLUP;

-- 21. Same as above but instead of DISTINCT try ALL and then without them
--     ALL is the default and is assumed when not there
--     Delete ALL vs DISTINCT
SELECT model_year
,      SUM(ALL list_price) AS 'Total Price'
FROM   product
WHERE  list_price > 2800
GROUP BY model_year WITH ROLLUP;

-- 22. Works well with COUNT. 
--     Same as above with ALL but use COUNT instead of AVG - see how it works well with COUNT
SELECT model_year
,      COUNT(ALL list_price) AS 'Number of Prices'
FROM   product
WHERE  list_price > 2800
GROUP BY model_year WITH ROLLUP;

-- 23. Same as above with COUNT instead of ALL, leave it blank
SELECT model_year
,      COUNT(list_price) AS 'Number of Prices'
FROM   product
WHERE  list_price > 2800
GROUP BY model_year WITH ROLLUP;

-- 24. Same as above with COUNT instead of AVG but use DISTINCT instead of all 
--     Here we can count all the unique list_prices over 2800
SELECT model_year
,      COUNT(DISTINCT list_price) AS 'Number of Prices'
FROM   product
WHERE  list_price > 2800
GROUP BY model_year WITH ROLLUP;

-- *****************
-- HAVING vs WHERE
-- WHERE can use any column in the base table but HAVING can't
-- HAVING relies on columns that exist in the SELECT clause that
-- are not in an aggregate function
-- *****************

-- NOTE: HAVING filters after the grouping. Remember you only have access to what has been grouped 
--       and aggregated (values and aggregates that are part of the group). 

-- 25.1 Show me the average list price of each model year listed by year only if the list prices are over $2800
--     BUT ONLY SHOW me those model years with their average prices over $4000
SELECT model_year
,      FORMAT(AVG(list_price),2) AS 'Average Price'
FROM   product
WHERE  list_price > 2800
GROUP BY model_year
HAVING   FORMAT(AVG(list_price),2) > '4,000.00';

-- NOTE: Be careful using FORMAT in a HAVING clause (it's a string not a number at that point)
-- 25.2 Does work because it is an integer
SELECT model_year
,      FORMAT(AVG(list_price),2) AS 'Average Price'
FROM   product
WHERE  list_price > 2800
GROUP BY model_year
HAVING   AVG(list_price) > 4000;

-- 25.3 Does not work because the column being used in the having clause in not in the group by
SELECT model_year
,      FORMAT(AVG(list_price),2) AS 'Average Price'
FROM   product
WHERE  list_price > 2800
GROUP BY model_year
HAVING   list_price > 4000;

-- 25.4 This works:
SELECT model_year
,      FORMAT(AVG(list_price),2) AS 'Average Price'
FROM   product
WHERE  list_price > 2800
GROUP BY model_year
HAVING   AVG(list_price) > 4000;

-- 26. An average price of each brand
SELECT brand_name
,      FORMAT(AVG(list_price),2) AS 'Average Price'
FROM   brand b
INNER JOIN product p
ON         b.brand_id = p.brand_id
GROUP BY   brand_name;

-- 27. Filtering before and after the grouping
--     Filter to all model years excluding and newer than 2016
SELECT brand_name
,      FORMAT(AVG(list_price),2) AS 'Average Price'
FROM   brand b
INNER JOIN product p
ON         b.brand_id = p.brand_id
WHERE      model_year > 2016
GROUP BY   brand_name;

-- *******************
-- Problem Solving
-- *******************

-- Switch to the magazine database

-- 1.1 How many people subscribe to Beautiful Birds

-- 1.2 Add magazineName to the last query
--     I can add magazineName because the WHERE does limit it to that magazine

-- 2. Now how do I see subscribers to all magazines?

-- 3. What would I add to see just magazines with 2 or more subscribers?
--    OR HAVING COUNT(*) >= 2

-- 4. What is the total revenue for each magazine?
--    What about using COUNT(*)

-- Switch to the bike database

-- 5. Get the highest and lowest priced bike in each brand

-- 6. How many bikes we have total in stock everywhere. 13,511

-- 7. How can we group it to see how many of each bike we have in stock everywhere?

-- 8. We can also see how many we have at of each bike at each store

-- 9. WITH ROLLUP shows a total of each bike at the stores and grand total at bottom 13,511

-- 10. If we reverse the grouping with store name as group and product as the sub group we get the total of how many bikes we have at each store.

-- 11.1 Now we can see if one specific bike is at any of the stores adding a WHERE

-- 11.2 Do the same thing but only show bikes with the name 'Electra Cruiser 1 Ladies'
