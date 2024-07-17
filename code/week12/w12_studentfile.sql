-- *********************************
-- W12 STUDENT SQL WORKBOOK
-- *********************************

/*
  RETURNING TO INSERTS:

  PARENT TABLE EXAMPLE:

    INSERT INTO tablename
      ( column_1
      , column_2
      , etc)
      VALUES
      ( 'String value'
      , 12
      , '2024-01-31' );
  
  CHILD TABLE EXAMPLE:

    INSERT INTO tablename
    ( column_1
    , column_2
    , foreign_key_column)
    VALUES
    ( 'String value'
    , 12
    , (SELECT primary_key_column FROM tablename WHERE column_name = '')
    );

  JOIN/LINKING TABLE EXAMPLE:

    INSERT INTO tablename
    ( foreign_key_column
    , foreign_key_column)
    VALUES
    ( (SELECT primary_key_column FROM tablename WHERE column_name = '')
    , (SELECT primary_key_column FROM tablename WHERE column_name = '')
    );

*/


/*
  ORDER OF OPERATION (The way we write our queries):
     SELECT     column_name AS 'Alias1'
     ,          Function(column_name_2) AS 'Alias2'
     FROM       table1 t1   -- t1 and t2 are table aliases
       JOIN       table2 t2   -- join types: INNER, LEFT, RIGHT
       ON         t1.table1_id = t2.table1_id -- PK and FK might not always be the same name
     WHERE      column_name = (SELECT column_name FROM table1 ...) -- Can only return one record when using =
     GROUP BY   column_name (Must be a column in the SELECT clause that is NOT in an aggregate function)
     HAVING     aggregate_function(column_name) = group condition
     ORDER BY   column_name (DESC)
     LIMIT      # of rows;
     To remember this: Stay Firm (JOINED) With God, Honoring Our Lord
*/

-- ************************
-- Subqueries for INSERTS
-- ************************

-- ~
USE film;
-- ~

-- ~
INSERT INTO rating
(rating_level)
VALUES
('G'),
('PG'),
('PG-13');
-- ~

-- *********
-- EXAMPLE
-- *********

-- ~
INSERT INTO movie
(movie_title, movie_year, rating_id)
VALUES
('Toy Story',1995,(SELECT rating_id FROM rating WHERE rating_level = 'G')),
('Toy Story 2',1999,(SELECT rating_id FROM rating WHERE rating_level = 'G')),
('Brigadoone',1954,(SELECT rating_id FROM rating WHERE rating_level = 'G')),
('The Empire Strikes Back',1977,(SELECT rating_id FROM rating WHERE rating_level = 'PG')),
('Coda',2021,(SELECT rating_id FROM rating WHERE rating_level = 'PG-13')),
('Guardians of the Galaxy',2014,(SELECT rating_id FROM rating WHERE rating_level = 'PG-13'));
-- ~

-- ~
INSERT INTO actor
(actor_fname, actor_lname)
VALUES
('Tom','Hanks'),
('Tim','Allen'),
('Annie','Potts'),
('John','Ratzenberger'),
('Gene','Kelly'),
('Cyd','Charisse'),
('Van','Johnson'),
('Harrison','Ford'),
('Carrie','Fisher'),
('Mark','Hamill'),
('Emilia','Jones'),
('Marlee','Matlin'),
('Troy','Kotsur'),
('Chris','Pratt'),
('Zoe','Saldana'),
('Dave','Bautista'),
('Vin','Diesel'),
('Bradley','Cooper'),
('Lee','Pace');
-- ~

-- ~
INSERT INTO genre
(genre_name)
VALUES
('Family'),
('Animated'),
('Musical'),
('Romance'),
('Sci-Fi'),
('Comedy'),
('Drama'),
('Music'),
('Action'),
('Adventure');
-- ~

-- ~
INSERT INTO studio
(studio_name)
VALUES
('Pixar'),
('MGM'),
('20th Century Fox'),
('Apple TV+'),
('Marvel'),
('Disney');
-- ~

-- ~
INSERT INTO feature
(feature_name)
VALUES
('Bloopers'),
('Actor Interviews'),
('Cut Scenes'),
('Trailers'),
('Extended Scenes'),
('Deleted Scenes');
-- ~

-- ~
INSERT INTO media
(media_type)
VALUES
('DVD'),
('Blu-ray'),
('Streaming'),
('4k');
-- ~

-- ~
INSERT INTO price
(price_value)
VALUES
(19.95),
(24.95),
(35.00),
(21.95);
-- ~

-- **********
-- PRACTICE
-- **********

-- ~
INSERT INTO cast
(movie_id, actor_id)
VALUES
( (SELECT movie_id FROM movie WHERE movie_title = 'Toy Story')
, (SELECT actor_id FROM actor WHERE CONCAT(actor_fname, ' ', actor_lname) = 'Tom Hanks')
),
(1,2),
(1,3),
(1,4),
(2,1),
(2,2),
(2,3),
(2,4),
(3,5),
(3,6),
(3,7),
(4,8),
(4,9),
(4,10),
(5,11),
(5,12),
(5,13),
(6,14),
(6,15),
(6,16),
(6,17),
(6,18),
(6,19);
-- ~

-- ~
INSERT INTO movie_genre
(movie_id, genre_id)
VALUES
( (SELECT movie_id FROM movie WHERE movie_title = 'Toy Story')
, (SELECT genre_id FROM genre WHERE genre_name = 'Family')
),
(1,2),
(2,1),
(2,2),
(3,3),
(3,4),
(4,5),
(5,6),
(5,7),
(5,8),
(6,5),
(6,6),
(6,8),
(6,9);
-- ~

-- ~
INSERT INTO movie_studio
(movie_id, studio_id)
VALUES
( (SELECT movie_id FROM movie WHERE movie_title = 'Toy Story')
, (SELECT studio_id FROM studio WHERE studio_name = 'Pixar')
),
(2,1),
(3,2),
(4,3),
(5,4),
(6,5),
(6,6);
-- ~

-- ~
INSERT INTO movie_feature
(movie_id, feature_id)
VALUES
( (SELECT movie_id FROM movie WHERE movie_title = 'Toy Story')
, (SELECT feature_id FROM feature WHERE feature_name = 'Bloopers')
),
(2,2),
(4,3),
(4,1),
(5,4),
(6,5),
(6,6),
(6,4);
-- ~

-- ~
INSERT INTO movie_media
(movie_id, media_id, price_id)
VALUES
((SELECT movie_id FROM movie WHERE movie_title = 'Toy Story')
,(SELECT media_id FROM media WHERE media_type = 'DVD')
,(SELECT price_id FROM price WHERE price_value = 19.95)),
(2,1,2),
(3,1,1),
(4,2,3),
(5,3,NULL),
(6,4,4),
(6,2,1);
-- ~


-- ***********************
-- Subqueries for SELECT
-- ***********************

-- **********
-- Example
-- **********
-- ~
USE v_art;
-- ~
-- Week 9 Q1. - Rewrite using a subquery
--    When you visit art.ceiwebdev.com, and you search by artist first name 
--    and you choose Rembrandt, you get two resulting images 
--    ("Night watch" and "Storm Galilee"). 
--    Write the query that will display these images.
-- ~
SELECT lname, fname, title
FROM artist
INNER JOIN artwork 
	ON artist.artist_id = artwork.artist_id
WHERE artist.fname = 'Rembrandt';
-- ~

-- Revised Query Below --

-- ~

-- ~

-- **********
-- Practice
-- **********
-- ~
USE employees;
-- ~
-- Week 10 Q6. - Rewrite using a subquery
--    Find out who the managers of the Research department are. 
--    List the department name and the name of the managers.
-- ~
SELECT dept_name, first_name, last_name
FROM departments
LEFT JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
LEFT JOIN employees
ON dept_manager.emp_no = employees.emp_no
WHERE departments.dept_name = 'Research';
-- ~

-- Revised Query Below --
-- ~

-- ~
