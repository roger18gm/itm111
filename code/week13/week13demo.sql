USE bike;
SELECT brand_name AS 'Brand Name'
,      CONCAT('$', FORMAT(AVG(list_price),2)) AS 'Average Price'
FROM   brand b
INNER JOIN product p
ON b.brand_id = p.brand_id
GROUP BY brand_name WITH ROLLUP
ORDER BY GROUPING(brand_name)
       , AVG(list_price);












SELECT CONCAT('$',FORMAT(AVG(CASE WHEN b.brand_id = 1 THEN list_price END),2)) AS 'Electra'
,      CONCAT('$',FORMAT(AVG(CASE WHEN b.brand_id = 2 THEN list_price END),2)) AS 'Haro'
,      CONCAT('$',FORMAT(AVG(CASE WHEN b.brand_id = 3 THEN list_price END),2)) AS 'Heller'
,      CONCAT('$',FORMAT(AVG(CASE WHEN b.brand_id = 4 THEN list_price END),2)) AS 'Pure Cycles'
,      CONCAT('$',FORMAT(AVG(CASE WHEN b.brand_id = 5 THEN list_price END),2)) AS 'Ritchey'
,      CONCAT('$',FORMAT(AVG(CASE WHEN b.brand_id = 6 THEN list_price END),2)) AS 'Strider'
,      CONCAT('$',FORMAT(AVG(CASE WHEN b.brand_id = 7 THEN list_price END),2)) AS 'Sun Bicycles'
,      CONCAT('$',FORMAT(AVG(CASE WHEN b.brand_id = 8 THEN list_price END),2)) AS 'Surly'
,      CONCAT('$',FORMAT(AVG(CASE WHEN b.brand_id = 9 THEN list_price END),2)) AS 'Trek'
,      CONCAT('$',FORMAT(AVG(CASE WHEN b.brand_id BETWEEN 1 AND 9 THEN list_price END),2)) AS 'Avg of Averages'
FROM   brand b
JOIN   product p
ON     b.brand_id = p.brand_id;






USE sakila;
WITH CustomerRentals AS (
    SELECT
        c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        (SELECT COUNT(*) FROM rental r WHERE r.customer_id = c.customer_id) AS total_rentals
    FROM
        customer c
)
SELECT
    customer_id,
    customer_name,
    total_rentals
FROM
    CustomerRentals
ORDER BY
    total_rentals DESC
LIMIT 5;