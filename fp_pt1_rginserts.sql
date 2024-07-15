use university;

INSERT INTO term
(term_name
, term_year)
VALUES
('Fall', 2024)
,('Winter', 2025);

INSERT INTO department
(department_name)
VALUES
('Computer Science and Engineering')
,('Mathematics')
,('Music');

INSERT INTO degree
(degree_name, department_id)
VALUES
('Computer Science'
, (SELECT department_id FROM department WHERE department_name = 'Computer Science and Engineering'))
,('Data Science'
, (SELECT department_id FROM department WHERE department_name = 'Mathematics'))
,('Organ Performance'
, (SELECT department_id FROM department WHERE department_name = 'Music'));

INSERT INTO course
(course_name, course_credit, course_code, course_num, degree_id)
VALUES
('Algorithm Thinking', 2, 'CSE', 180
, (SELECT degree_id FROM degree WHERE degree_name = 'Computer Science'))
,('Intro to Programming', 3, 'CSE', 110
, (SELECT degree_id FROM degree WHERE degree_name = 'Computer Science'))
,('Data Intuition and Design', 2, 'DS', 150
, (SELECT degree_id FROM degree WHERE degree_name = 'Computer Science'))
,('Organ Lessons 1', 2, 'MUSIC', '160B'
, (SELECT degree_id FROM degree WHERE degree_name = 'Computer Science'));

INSERT INTO person
(first_name, last_name, gender, city, state, birth_date)
VALUES
('Paul', 'Miller', 'M', 'Dallas', 'TX', '1996-02-22')
,('Katie', 'Smith', 'F', 'Provo', 'UT', '1995-07-22')
,('Kelly', 'Jones', 'F', 'Provo', 'UT', '1998-06-22')
,('Devon', 'Merrill', 'M', 'Mesa', 'AZ', '2000-07-22')
,('Mandy', 'Murdock', 'F', 'Topeka', 'KS', '1996-11-22')
,('Alece', 'Adams', 'F', 'Rigby', 'ID', '1997-05-22')
,('Bryce', 'Carlson', 'M', 'Bozeman', 'MT', '1997-11-22')
,('Preston', 'Larsen', 'M', 'Decatur', 'TN', '1996-09-22')
,('Julia', 'Madsen', 'F', 'Rexburg', 'ID', '1998-09-22')
,('Susan', 'Sorensen', 'F', 'Mesa', 'AZ', '1998-08-09')
,('Marty', 'Morring', NULL, NULL, NULL, NULL)
,('Nate', 'Norris', NULL, NULL, NULL, NULL)
,('Ben', 'Barrus', NULL, NULL, NULL, NULL)
,('John', 'Jensen', NULL, NULL, NULL, NULL)
,('Bill', 'Barney', NULL, NULL, NULL, NULL);

INSERT INTO section
(section_num, section_capacity, term_id, course_id)
VALUES
(1,30, (SELECT term_id FROM term WHERE CONCAT(term_name,'', term_year = 'Fall 2024'))
, (SELECT course_id FROM course WHERE CONCAT(course_code, ' ', course_num) = 'CSE 180'))
,(1,50, (SELECT term_id FROM term WHERE CONCAT(term_name,'', term_year = 'Fall 2024'))
, (SELECT course_id FROM course WHERE CONCAT(course_code, ' ', course_num) = 'CSE 110'))
,(2,45, (SELECT term_id FROM term WHERE CONCAT(term_name,'', term_year = 'Fall 2024'))
, (SELECT course_id FROM course WHERE CONCAT(course_code, ' ', course_num) = 'CSE 110'))
,(1,35, (SELECT term_id FROM term WHERE CONCAT(term_name,'', term_year = 'Fall 2024'))
, (SELECT course_id FROM course WHERE CONCAT(course_code, ' ', course_num) = 'DS 150'))
,(1,30, (SELECT term_id FROM term WHERE CONCAT(term_name,'', term_year = 'Fall 2024'))
, (SELECT course_id FROM course WHERE CONCAT(course_code, ' ', course_num) = 'MUSIC 160B'))
,(2,30, (SELECT term_id FROM term WHERE CONCAT(term_name,'', term_year = 'Winter 2025'))
, (SELECT course_id FROM course WHERE CONCAT(course_code, ' ', course_num) = 'CSE 180'))
,(3,35, (SELECT term_id FROM term WHERE CONCAT(term_name,'', term_year = 'Winter 2025'))
, (SELECT course_id FROM course WHERE CONCAT(course_code, ' ', course_num) = 'CSE 180'))
,(1,50, (SELECT term_id FROM term WHERE CONCAT(term_name,'', term_year = 'Winter 2025'))
, (SELECT course_id FROM course WHERE CONCAT(course_code, ' ', course_num) = 'CSE 110'))
,(2,50, (SELECT term_id FROM term WHERE CONCAT(term_name,'', term_year = 'Winter 2025'))
, (SELECT course_id FROM course WHERE CONCAT(course_code, ' ', course_num) = 'CSE 110'))
,(1,30, (SELECT term_id FROM term WHERE CONCAT(term_name,'', term_year = 'Winter 2025'))
, (SELECT course_id FROM course WHERE CONCAT(course_code, ' ', course_num) = 'MUSIC 160B'));

INSERT INTO role
(role_type)
VALUES
('Teacher')
,('Student')
,('TA');

INSERT INTO enrollment
(person_id, section_id, role_id)
VALUES
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(fname, ' ', lname) = 'Marty Morring')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_name, ' ', term_year) = 'Fall 2024'
   AND   CONCAT(course_code, ' ', course_num) = 'CSE 180'
   AND   section_num = 1)
, (SELECT role_id 
   FROM role 
   WHERE person_type = 'Teacher')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(fname, ' ', lname) = 'Marty Morring')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_name, ' ', term_year) = 'Winter 2025'
   AND   CONCAT(course_code, ' ', course_num) = 'CSE 180'
   AND   section_num = 2)
, (SELECT role_id 
   FROM role 
   WHERE person_type = 'Teacher')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(fname, ' ', lname) = 'Nate Norris')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_name, ' ', term_year) = 'Fall 2024'
   AND   CONCAT(course_code, ' ', course_num) = 'CSE 110'
   AND   section_num = 1)
, (SELECT role_id 
   FROM role 
   WHERE person_type = 'Teacher')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(fname, ' ', lname) = 'Nate Norris')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_name, ' ', term_year) = 'Fall 2024'
   AND   CONCAT(course_code, ' ', course_num) = 'CSE 110'
   AND   section_num = 2)
, (SELECT role_id 
   FROM role 
   WHERE person_type = 'Teacher')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(fname, ' ', lname) = 'Nate Norris')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_name, ' ', term_year) = 'Winter 2025'
   AND   CONCAT(course_code, ' ', course_num) = 'CSE 110'
   AND   section_num = 1)
, (SELECT role_id 
   FROM role 
   WHERE person_type = 'Teacher')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(fname, ' ', lname) = 'Nate Norris')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_name, ' ', term_year) = 'Winter 2025'
   AND   CONCAT(course_code, ' ', course_num) = 'CSE 110'
   AND   section_num = 2)
, (SELECT role_id 
   FROM role 
   WHERE person_type = 'Teacher')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(fname, ' ', lname) = 'Ben Barrus')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_name, ' ', term_year) = 'Fall 2024'
   AND   CONCAT(course_code, ' ', course_num) = 'DS 150'
   AND   section_num = 1)
, (SELECT role_id 
   FROM role 
   WHERE person_type = 'Teacher')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(fname, ' ', lname) = 'John Jensen')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_name, ' ', term_year) = 'Fall 2024'
   AND   CONCAT(course_code, ' ', course_num) = 'MUSIC 160B'
   AND   section_num = 1)
, (SELECT role_id 
   FROM role 
   WHERE person_type = 'Teacher')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(fname, ' ', lname) = 'John Jensen')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_name, ' ', term_year) = 'Winter 2025'
   AND   CONCAT(course_code, ' ', course_num) = 'MUSIC 160B'
   AND   section_num = 1)
, (SELECT role_id 
   FROM role 
   WHERE person_type = 'Teacher')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(fname, ' ', lname) = 'Bill Barney')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_name, ' ', term_year) = 'Winter 2025'
   AND   CONCAT(course_code, ' ', course_num) = 'CSE 180'
   AND   section_num = 3)
, (SELECT role_id 
   FROM role 
   WHERE person_type = 'Teacher')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(fname, ' ', lname) = 'Paul Miller')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_name, ' ', term_year) = 'Fall 2024'
   AND   CONCAT(course_code, ' ', course_num) = 'CSE 180'
   AND   section_num = 1)
, (SELECT role_id 
   FROM role 
   WHERE person_type = 'Student')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(fname, ' ', lname) = 'Paul Miller')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_name, ' ', term_year) = 'Fall 2024'
   AND   CONCAT(course_code, ' ', course_num) = 'CSE 180'
   AND   section_num = 2)
, (SELECT role_id 
   FROM role 
   WHERE person_type = 'Student')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(fname, ' ', lname) = 'Katie Smith')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_name, ' ', term_year) = 'Fall 2024'
   AND   CONCAT(course_code, ' ', course_num) = 'DS 150'
   AND   section_num = 1)
, (SELECT role_id 
   FROM role 
   WHERE person_type = 'Student')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(fname, ' ', lname) = 'Kelly Jones')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_name, ' ', term_year) = 'Fall 2024'
   AND   CONCAT(course_code, ' ', course_num) = 'DS 150'
   AND   section_num = 1)
, (SELECT role_id 
   FROM role 
   WHERE person_type = 'Student')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(fname, ' ', lname) = 'Devon Merrill')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_name, ' ', term_year) = 'Fall 2024'
   AND   CONCAT(course_code, ' ', course_num) = 'MUSIC 160B'
   AND   section_num = 1)
, (SELECT role_id 
   FROM role 
   WHERE person_type = 'Student')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(fname, ' ', lname) = 'Mandy Murdock')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_name, ' ', term_year) = 'Fall 2024'
   AND   CONCAT(course_code, ' ', course_num) = 'DS 150'
   AND   section_num = 1)
, (SELECT role_id 
   FROM role 
   WHERE person_type = 'Student')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(fname, ' ', lname) = 'Mandy Murdock')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_name, ' ', term_year) = 'Fall 2024'
   AND   CONCAT(course_code, ' ', course_num) = 'MUSIC 160B'
   AND   section_num = 1)
, (SELECT role_id 
   FROM role 
   WHERE person_type = 'Student')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(fname, ' ', lname) = 'Alece Adams')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_name, ' ', term_year) = 'Winter 2025'
   AND   CONCAT(course_code, ' ', course_num) = 'CSE 180'
   AND   section_num = 3)
, (SELECT role_id 
   FROM role 
   WHERE person_type = 'TA')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(fname, ' ', lname) = 'Bryce Carlson')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_name, ' ', term_year) = 'Winter 2025'
   AND   CONCAT(course_code, ' ', course_num) = 'CSE 180'
   AND   section_num = 2)
, (SELECT role_id 
   FROM role 
   WHERE person_type = 'Student')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(fname, ' ', lname) = 'Bryce Carlson')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_name, ' ', term_year) = 'Winter 2025'
   AND   CONCAT(course_code, ' ', course_num) = 'CSE 110'
   AND   section_num = 1)
, (SELECT role_id 
   FROM role 
   WHERE person_type = 'TA')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(fname, ' ', lname) = 'Bryce Carlson')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_name, ' ', term_year) = 'Winter 2025'
   AND   CONCAT(course_code, ' ', course_num) = 'MUSIC 160B'
   AND   section_num = 1)
, (SELECT role_id 
   FROM role 
   WHERE person_type = 'Student')
)
;













