-- -------------------------------------------------------------------------------------------

USE v_art;


-- -------------------------------------------------------------------------------------------
-- 1. When you visit art.ceiwebdev.com, and you search by Period/Style 
--    and you choose Impressionism, you get two resulting images 
--    ("Woman in the Garden" and "Irises"). 
--    Write the query to return those images.
--    HINT: No join is needed. 
-- -------------------------------------------------------------------------------------------

SELECT artfile
FROM artwork
WHERE period = 'Impressionism';

-- -------------------------------------------------------------------------------------------
-- 2. When you visit art.ceiwebdev.com, and you search by Subject and type in the word flower, 
--    you get three images. Write the query to display those images.
--   (remember the keyword might have been 'flowers' but they typed 'flower')
-- -------------------------------------------------------------------------------------------

SELECT artfile
FROM artwork aw
JOIN artwork_keyword akw
ON akw.artwork_id = aw.artwork_id
JOIN keyword kw
ON kw.keyword_id = akw.keyword_id
WHERE keyword LIKE 'flowers';
-- -------------------------------------------------------------------------------------------
-- 3. List ALL the artists from the artist table, 
--    but only the related artwork from the artwork table.
--    We need the first and last name and artwork title. 
-- -------------------------------------------------------------------------------------------

SELECT a.fname
,a.lname
,aw.title
FROM artist a
LEFT OUTER JOIN artwork aw
ON a.artist_id = aw.artist_id;

USE magazine;

-- -------------------------------------------------------------------------------------------
-- 4. List all subscriptions with magazine name, last and first name.
--    Sort alphabetically by magazine name.
-- -------------------------------------------------------------------------------------------

SELECT m.magazineName
,sr.subscriberLastName
,sr.subscriberFirstName
FROM magazine m 
JOIN subscription sn
ON sn.magazineKey = m.magazineKey
JOIN subscriber sr
ON sr.subscriberKey = sn.subscriberKey
ORDER BY m.magazineName;

-- -------------------------------------------------------------------------------------------
-- 5.  List all the magazines that Samantha Sanders subscribes to. 
-- -------------------------------------------------------------------------------------------

SELECT m.magazineName
FROM magazine m
JOIN subscription sn
ON m.magazineKey = sn.magazineKey
JOIN subscriber sr
ON sn.subscriberKey = sr.subscriberKey
WHERE subscriberLastName = 'Sanders' AND subscriberFirstname = 'Samantha';

USE employees;


-- -------------------------------------------------------------------------------------------
-- 6. List the first 5 employees from the Customer Service Department. 
--    Put them in alphabetical order by last name.
-- -------------------------------------------------------------------------------------------

SELECT e.first_name
,e.last_name
FROM employees e
JOIN dept_emp de
ON de.emp_no = e.emp_no
JOIN departments d
ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Customer Service'
ORDER BY e.last_name
LIMIT 5;

-- -------------------------------------------------------------------------------------------
-- 7. Find out the current salary and department of Mayuko Warwick. 
--    You can use the ORDER BY and LIMIT to get just the most recent salary. 
--    Format the salary to be readable (Use FORMAT())
-- -------------------------------------------------------------------------------------------
SELECT e.first_name
,e.last_name
,d.dept_name
,concat('$',format(s.salary,0,'en_US')) AS salary
FROM employees e 
JOIN dept_emp de
ON de.emp_no = e.emp_no
JOIN departments d 
ON d.dept_no = de.dept_no
JOIN salaries s
ON s.emp_no = e.emp_no
WHERE e.first_name = 'Mayuko' AND e.last_name = 'Warwick'
ORDER BY salary DESC
LIMIT 1;