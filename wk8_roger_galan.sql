-- -------------------------------------------------------------------------------------------

USE magazine;


-- (REMINDER: With all of these problems, make sure you use aliases, such as "3% off,")
-- -------------------------------------------------------------------------------------------
-- 1. List the magazine name and then take 3% off the magazine price 
--    and round to two decimal places.
-- -------------------------------------------------------------------------------------------

SELECT magazineName
, round((magazinePrice * 0.97),2) AS '3% off'
FROM magazine;

-- -------------------------------------------------------------------------------------------
-- 2. Show the primary key of id from the subscriber table 
--    and using the date of 2020-12-20 as if it were today's date, 
--    how long in years, ROUNDED to the nearest year, has it been since their subscription started?  
-- -------------------------------------------------------------------------------------------

SELECT subscriberKey
,round(datediff('2020-12-20', subscriptionStartDate) / 365) AS 'Years since subscription'
FROM subscription;

-- -------------------------------------------------------------------------------------------
-- 3. Show the subscriptionStartDate and subscriptionLength 
--    and add the subscriptionLength to the subscriptionStartDate 
--    to see the date of how long their subscription will go. 
--    After you have that date, then include the format function 
--    to change the date to the format of: September 1, 2023.
-- -------------------------------------------------------------------------------------------

SELECT subscriptionStartDate
,subscriptionLength
, date_format(date_add(subscriptionStartDate, interval subscriptionLength month), '%M %e, %Y') AS 'Subscription end'
FROM subscription;


USE bike;

-- -------------------------------------------------------------------------------------------
-- 4. We need a list of all the products without the year 
--    at the end of the product_name string. 
--    Notice that some have two years listed, 
--    make sure you take those off as well. 
--    Order your results by product_id and 
--    limit your results to the first 14.
-- -------------------------------------------------------------------------------------------

SELECT substring(product_name, 1 , locate(' - ', product_name)) AS 'Product Name without Year'
FROM product
ORDER BY product_id
LIMIT 14;

-- -------------------------------------------------------------------------------------------
-- 5. List the 2019 model year bikes, their price, 
--    show the amount needed for a 10% down payment 
--    and divide the remaining balance into 4 equal payments. 
--    Display all monetary values with a dollar sign, 
--    comma at the thousands place and two decimal places. 
--    Adjust the column headings to appear as the screenshot shows.
-- -------------------------------------------------------------------------------------------

SELECT product_name AS 'Bike'
, concat('$',format(list_price,2,'en_US')) AS 'Price'
, concat('$',format((list_price * .1),2, 'en_US')) AS '10% Down'
, concat('$',round((list_price * .9) / 4, 2)) AS '4 Equal Payments'
FROM product
WHERE model_year = 2019;