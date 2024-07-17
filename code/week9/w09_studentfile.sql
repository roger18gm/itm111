-- *********************************
-- W09 STUDENT SQL WORKBOOK
-- *********************************

/*
     SELECT     column_name AS 'Alias1'
     ,          Function(column_name_2) AS 'Alias2'
     FROM       table1 t1   -- t1 and t2 are table aliases
     JOIN       table2 t2   -- join types: INNER, LEFT, RIGHT
     ON         t1.table1_id = t2.table1_id -- PK and FK might not always be the same name
     WHERE      column_name = condition
     ORDER BY   column_name (DESC)
     LIMIT      # of rows;
     To remember this: Stay Firm (JOINED) With Our Lord
*/

-- **************************
--  INNER JOIN
-- **************************

-- Use the v_art database

-- 1.1 Look at artist_id in the artist table

-- 1.2 Look at artist_id in the artwork table

-- 1.3 A list of all the artists with each of their art works 

-- ***************************************
--  USING() "clause/function"
-- We can use the USING "clause/function"
-- only when the primary and foreign keys
-- have the same name.  
-- The USING clause isn't universal for all RDBMS 
-- and there are some limitations with USING. 
-- THIS IS ONLY FOR YOUR INFORMATION 
-- DO NOT USE USING IN YOUR QUERIES
-- ***************************************

SELECT     fname
,          lname
,          title
FROM       artist a
INNER JOIN artwork aw
USING      (artist_id);

-- ********************************************
--  ON clause
-- We use the ON clause because is becomes 
-- very clear what ids you are talking about.
-- ********************************************

SELECT     fname
,          lname
,          title
FROM       artist a
INNER JOIN artwork aw
ON         a.artist_id = aw.artist_id;



-- NOTE: We specify INNER JOIN and not just JOIN to allow for cross server compatability 
--    (it's industry standard as well to specify which join).
--    these are the two IDs (usually the same) from two tables you are merging

-- Use world database

-- 2. Show all cities in the continent of Asia. This one targets city names

-- 3. Show all languages in country of Egypt. Note: You do not need the alias on Name this time but it is good to do so.

-- 4. Show the country and city populations and country and city names in the continents 
--    in the western hemisphere (HINT: Use continent)
--    Format the population and order by country population and city population 
--    from greatest to least.

-- Use the bike database

-- 5.1 Output 'category' table

-- 5.2 Output 'product' table

-- 5.3 Output products, categories, and list prices

-- 5.4. I also want the brand as well, this involves 3 tables

-- 6. On your own: All children category bikes

-- 7. On your own: All staff at Rowlett Bikes Store

-- 8. All products ordered with price and quantity

-- 9. All products ordered in March 2016

-- **************************
--  LEFT `OUTER` JOIN
-- **************************

-- Use the v_art database

-- 10. A list of all the artists even if they don't have any artwork
--    in other words: all artist and only related artwork
--    adding a table alias for artist called 'a'
--    adding a table alias for artwork called 'aw'
--    using a. meaning the table artist and aw. for the table artwork

-- 11. What if I only want Leonardo diVinci's?
--    OR fname = 'Leonardo'

-- 12. On their own: A list of all the artwork from artists
--    Show all art from the Netherlands. (title, artfile, period, arttype, artlocation).

-- **************************
--  RIGHT `OUTER` JOIN
-- **************************

-- USE the magazine database

-- show table aliases, AS is an optional keyword with column aliases
-- and with table aliases

-- 13. There is one magazine with no subscribers. How would you show all magazines
-- and only the related data of the subscription table? (On their own)
-- list out magazineName, magazinePrice, and subscriptionStartDate (use table aliases)

-- 14. Now add to the query above the 3rd table of subscribers so you can see
-- their last name (demonstrates using 3 tables in a OUTER JOIN) (On their Own)
-- It should still show the one magazine with  date and name as null

-- 15. Need the second JOIN as LEFT otherwise you don't get all the results from 
-- the first join that includes the one magazine with no relations.
-- Because that magazine didn't have a related magazineKey in the first JOIN, it won't
-- show the next join either (no subscriber either), unless we ask for all in the previous join.
-- A Venn diagram can explain this with 3 circles. 

-- **************************
--  FULL `OUTER` JOIN (DEMO)
-- **************************

-- FULL OUTER JOIN can only be simulated with a UNION in MySQL
-- Copy the LEFT OUTER JOIN above and UNION it to Same with the RIGHT JOINS
SELECT magazineName, magazinePrice, subscriptionStartDate, subscriberLastName
FROM magazine m 
	LEFT JOIN subscription s
	ON m.magazineKey = s.magazineKey
    LEFT JOIN subscriber sr
    ON s.subscriberKey = sr.subscriberKey
UNION
SELECT magazineName, magazinePrice, subscriptionStartDate, subscriberLastName
FROM magazine m 
	RIGHT JOIN subscription s
	ON m.magazineKey = s.magazineKey
    RIGHT JOIN subscriber sr
    ON s.subscriberKey = sr.subscriberKey;

-- *********************************
-- Common Errors & How to Fix Them
-- *********************************

-- Use v_art
USE v_art;
-- Common Error: missing the table alias. Throws an Unknown column error. Add the alias 'aw' after artwork
-- Show all titles with their period and keyword.
SELECT     title
,          period
,          keyword
FROM       artwork 
INNER JOIN artwork_keyword awk
ON         aw.artwork_id = awk.artwork_id
INNER JOIN keyword k
ON         awk.keyword_id = k.keyword_id;

-- Common Error: missing the table alias. Throws an ambiguity error. Add the table alias 'aw.'
SELECT     title
,          period
,          keyword
FROM       artwork aw
INNER JOIN artwork_keyword awk
ON         artwork_id = awk.artwork_id
INNER JOIN keyword k
ON         awk.keyword_id = k.keyword_id;

-- Common Error: Query runs but no results are found. Most likely, you are trying to use a string column in the ON clause.
USE magazine;
SELECT    magazineName
,         subscriberFirstName
,         subscriberLastName
FROM      magazine m
INNER JOIN subscription s
ON        m.magazineName = s.magazineKey
INNER JOIN subscriber sr
ON        s.subscriberKey = sr.subscriberKey;