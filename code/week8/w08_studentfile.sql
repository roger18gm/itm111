-- *********************************
-- W08 STUDENT SQL WORKBOOK
-- *********************************

/*
     SELECT   column_name AS 'Alias1'
     ,        Function(column_name_2) AS 'Alias2'
     FROM     table_name
     WHERE    column_name = condition
     ORDER BY column_name (DESC)
     LIMIT    # of rows;
     To remember this: Stay Firm With Our Lord
*/

-- *******************************
-- Function Reference
-- https://www.w3schools.com/mysql/mysql_ref_functions.asp
-- *******************************


-- *******************************
-- String Manipulation
-- *******************************

/*
    CONCAT()
    RIGHT()
    LEFT()
    LOCATE()
    SUBSTRING_INDEX()
    UPPER()
    LOWER()
    TRIM()
    RTRIM()
    LTRIM()
*/

-- Use the bike database

-- 1. Output all columns (*) from the 'store' table

-- 2. Add some text with two columns like this: "The 'store_name' email is 'email'" 

-- 3. If we used store_id instead of the store_name, 
--    it would become a part of the string and would not be an integer any more.

-- 4. Show me only the first 15 characters for all the product names (Hint: try RIGHT)

-- 5. Show me only the last 10 characters for all the product names

-- DEMO:
-- Trim the spaces from a line of text; 
-- deletes any spaces from the left (leading) and right (trailing)
SELECT TRIM('    This is the password   ') , ('This is the password');
-- Trim the right side; deletes any spaces from the right (trailing)
SELECT RTRIM('    This is the password   '), ('    This is the password');
-- Trim the left side; deletes any spaces from the left (leading)
SELECT LTRIM('    This is the password   '), ('This is the password   ');

-- 6. Change all the text to upper case for store names

-- 7. Change all the text to lower case for store names

-- Note: parameters for LOCATE(find, search, [start]) returns 
--       an integer of where it is located
-- 8. Locate the word 'Girl' in the product name 
--    and return the product name too 
--    only display the ones that have the word Girl

-- Note: parameters for SUBSTRING(string, start, length)--
-- 9. Show me the product_name and then 
--    extract the actual text of Girl from product_names as a new column
--    return everything after the word 'Girl' in a new column


-- *******************************
-- Number Manipulation
-- *******************************

/*
    ROUND()
    FLOOR()
    CEILING()
    FORMAT()
*/

-- 10. Show prices of products

-- 11. Round the list price from products and show the price 
--     do it for no parameter,1 decimal place, 2 decimal places, and 3 decimal places

-- 12. Round down (remove any decimal)

-- 13. Roundup  the list price from products and show the price

-- 14. Return the prices with the dollar sign in front (Use FORMAT())


-- *******************************
-- Date Manipulation
-- *******************************

/*
    DATEDIFF()
    DATE_ADD()
    DATE_FORMAT()
    NOW()
*/

-- 15. Show me the year of the order date

-- 16. Show me the day of the order date

-- 17. Show me the month of the order date
-- Hint: SELECT MONTH(order_date), order_date

-- 18. Show me the system date and time (There are 2 ways)

-- 19. Add 9 days to the order_date 

-- Show me how many days until Halloween
SELECT DATEDIFF('2024-10-31', NOW()) AS 'Days until Halloween';

-- What does this do? 
SELECT CEILING(DATEDIFF('2023-12-25', '2023-6-25') / 7 ); 
-- DATEDIFF returns days, if you divide by 7, it ...

-- Format Code	Description
-- %c	Month, numeric
-- %M	Month name
-- %e	Day of the month, numeric
-- %D	Day of the month with suffix
-- %y	Year, 2 digits
-- %Y	Year, 4 digits
-- %W	Weekday name

-- 20. Show me the order date as something like this 'January 1st, 2035'


-- **************************
--  Problem Solving Practice
-- **************************

USE bike; -- for first 2 queries, magazine for last 2.

-- 1. --parameters for DATEDIFF(date, date)
-- Show the cust_order_id and using today's date. 
-- How long in years, ROUNDED to the nearest year, 
-- has it been since the product shipped.
-- 1st step - Find the columns and have correct number of columns for the query
SELECT cust_order_id
,      shipped_date
,      shipped_date AS 'Years Since Shipped'
FROM   cust_order;

-- 2nd step, apply first function
SELECT cust_order_id
,      shipped_date
,      DATEDIFF(shipped_date, NOW()) AS 'Years Since Shipped'
FROM   cust_order;

-- Oh its negative. I need to switch the dates
SELECT cust_order_id
,      shipped_date
,      DATEDIFF(NOW(), shipped_date) AS 'Years Since Shipped'
FROM   cust_order;

-- 3rd step -- we need it in years
SELECT cust_order_id
,      shipped_date
,      DATEDIFF(NOW(), shipped_date)/365 AS 'Years Since Shipped'
FROM   cust_order;

-- 4th step -- Now I need to round it
SELECT cust_order_id
,      shipped_date
,      ROUND(DATEDIFF(NOW(), shipped_date)/365) AS 'Years Since Shipped'
FROM   cust_order;

-- Query complete!

-- 2. -- parameters for DATE_FORMAT(date, format)--
	  -- parameters for DATE_ADD(date, interval)--
-- Show the shipped_date
-- Add 2 months to each shipped_date 
-- Format that date so it takes the format of Month name, 
-- number day with comma and then a 4 digit year like: 
-- January 4, 2019
-- 1st step - Find the columns and have correct number of columns for the query

-- 2nd step

-- Does it look right?
-- 3rd step

-- Query finished.

USE magazine;
-- 3. -- parameters for LOCATE(find, search, start)
-- Find any string with 'Ma' in it,
-- we want to take from that word on and 
-- take it off the magazine name
-- 1st step - Find the columns and have correct number of columns for the query

-- 2nd step. Find only those with 'Ma' in it

-- 3rd step. take anything from 'Ma' onward off the name

-- Hmmm. The M is still there.

-- 4th step. Get the M off too

-- Looks good. Just add a space in the LOCATE function in the SELECT clause


-- 4. -- What if we wanted the reverse of the last question?
