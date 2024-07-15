-- -------------------------------------------------------------------------------------------

USE bike;

-- -------------------------------------------------------------------------------------------
-- 1. Get the average quantity that we have in all our bike stocks.
--    Round to the nearest whole number.
-- -------------------------------------------------------------------------------------------
SELECT ROUND(AVG(quantity)) AS 'Stock Average'
FROM stock;

-- -------------------------------------------------------------------------------------------
-- 2. Show each bike that needs to be reordered
--    (those bikes that are out of stock).
--    Filter the results to only the lowest quantity of zero.
-- -------------------------------------------------------------------------------------------
SELECT DISTINCT(product_name)
FROM product p
JOIN stock s
ON p. product_id = s.product_id
WHERE s.quantity = 0
ORDER BY p.product_name;


-- -------------------------------------------------------------------------------------------
-- 3. How many bikes for each category of bike do we have in stock at
--    our "Rowlett Bikes" store. We need to see the name of the category
--    as well as the number of bikes in the category.
--    Sort it by lowest total first.
-- -------------------------------------------------------------------------------------------
SELECT c.category_name, SUM(sk.quantity) AS 'instock'
FROM category c
JOIN product p
ON c.category_id = p.category_id
JOIN stock sk
ON p.product_id = sk.product_id
JOIN store st
ON sk.store_id = st.store_id
WHERE st.store_id = 3
GROUP BY c.category_name
ORDER BY SUM(sk.quantity);



USE employees;


-- -------------------------------------------------------------------------------------------
-- 4. How many employees do we have?
-- -------------------------------------------------------------------------------------------
SELECT COUNT(*) AS 'Number of Employees'
FROM employees;

-- -------------------------------------------------------------------------------------------
-- 5. Get the average salaries in each department.
--    We only need those departments that have
--    average salaries that are below 60,000.
--    Format the salary to 2 decimal places and a comma
--    in the thousands place and dollar sign in front. 
-- -------------------------------------------------------------------------------------------
SELECT dept_name, CONCAT('$',FORMAT(AVG(s.salary), 2)) AS 'average salary'
FROM departments d
JOIN dept_emp de
on d.dept_no = de.dept_no
JOIN employees e
ON de.emp_no = e.emp_no
JOIN salaries s
ON s.emp_no = e.emp_no
GROUP BY dept_name
HAVING AVG(s.salary) < 60000;

-- -------------------------------------------------------------------------------------------
-- 6. Find out how many males work in each department
--    List the department name and number of male workers,
--    ordered from most to least.
-- -------------------------------------------------------------------------------------------

SELECT dept_name, FORMAT(COUNT(*),0) AS 'Number of Males'
FROM departments d
JOIN dept_emp de
ON de.dept_no = d.dept_no
JOIN employees e
ON e.emp_no = de.emp_no 
WHERE e.gender = 'M'
GROUP BY dept_name
ORDER BY COUNT(*) DESC;
-- HAVING COUNT(*) = 'M';