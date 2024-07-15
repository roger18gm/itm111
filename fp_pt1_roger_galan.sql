-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema university
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `university` ;

-- -----------------------------------------------------
-- Schema university
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `university` ;
USE `university` ;

-- -----------------------------------------------------
-- Table `university`.`person`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`person` ;

CREATE TABLE IF NOT EXISTS `university`.`person` (
  `person_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fname` VARCHAR(45) NOT NULL,
  `lname` VARCHAR(45) NOT NULL,
  `gender` VARCHAR(1) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(2) NULL,
  `birth_date` DATE NULL,
  PRIMARY KEY (`person_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`term`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`term` ;

CREATE TABLE IF NOT EXISTS `university`.`term` (
  `term_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `term_name` VARCHAR(45) NOT NULL,
  `term_year` INT NOT NULL,
  PRIMARY KEY (`term_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`department` ;

CREATE TABLE IF NOT EXISTS `university`.`department` (
  `department_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `department_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`department_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`degree`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`degree` ;

CREATE TABLE IF NOT EXISTS `university`.`degree` (
  `degree_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `degree_name` VARCHAR(45) NOT NULL,
  `department_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`degree_id`),
  INDEX `fk_degree_department1_idx` (`department_id` ASC) VISIBLE,
  CONSTRAINT `fk_degree_department1`
    FOREIGN KEY (`department_id`)
    REFERENCES `university`.`department` (`department_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`course` ;

CREATE TABLE IF NOT EXISTS `university`.`course` (
  `course_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `course_name` VARCHAR(45) NOT NULL,
  `course_credit` INT NOT NULL,
  `course_code` VARCHAR(45) NOT NULL,
  `course_num` VARCHAR(45) NOT NULL,
  `degree_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`course_id`),
  INDEX `fk_course_degree1_idx` (`degree_id` ASC) VISIBLE,
  CONSTRAINT `fk_course_degree1`
    FOREIGN KEY (`degree_id`)
    REFERENCES `university`.`degree` (`degree_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`section`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`section` ;

CREATE TABLE IF NOT EXISTS `university`.`section` (
  `section_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `section_num` INT NOT NULL,
  `section_capacity` INT NOT NULL,
  `term_id` INT UNSIGNED NOT NULL,
  `course_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`section_id`),
  INDEX `fk_section_term1_idx` (`term_id` ASC) VISIBLE,
  INDEX `fk_section_course1_idx` (`course_id` ASC) VISIBLE,
  CONSTRAINT `fk_section_term1`
    FOREIGN KEY (`term_id`)
    REFERENCES `university`.`term` (`term_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_course1`
    FOREIGN KEY (`course_id`)
    REFERENCES `university`.`course` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`role` ;

CREATE TABLE IF NOT EXISTS `university`.`role` (
  `role_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `person_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`role_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`enrollment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`enrollment` ;

CREATE TABLE IF NOT EXISTS `university`.`enrollment` (
  `enrollment_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `person_id` INT UNSIGNED NOT NULL,
  `section_id` INT UNSIGNED NOT NULL,
  `role_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`enrollment_id`),
  INDEX `fk_enrollment_person_idx` (`person_id` ASC) VISIBLE,
  INDEX `fk_enrollment_section1_idx` (`section_id` ASC) VISIBLE,
  INDEX `fk_enrollment_role1_idx` (`role_id` ASC) VISIBLE,
  CONSTRAINT `fk_enrollment_person`
    FOREIGN KEY (`person_id`)
    REFERENCES `university`.`person` (`person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_enrollment_section1`
    FOREIGN KEY (`section_id`)
    REFERENCES `university`.`section` (`section_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_enrollment_role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `university`.`role` (`role_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

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
(fname, lname, gender, city, state, birth_date)
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
(1,30, (SELECT term_id FROM term WHERE CONCAT(term_name,' ', term_year) = 'Fall 2024')
, (SELECT course_id FROM course WHERE CONCAT(course_code, ' ', course_num) = 'CSE 180'))
,(1,50, (SELECT term_id FROM term WHERE CONCAT(term_name,' ', term_year) = 'Fall 2024')
, (SELECT course_id FROM course WHERE CONCAT(course_code, ' ', course_num) = 'CSE 110'))
,(2,45, (SELECT term_id FROM term WHERE CONCAT(term_name,' ', term_year) = 'Fall 2024')
, (SELECT course_id FROM course WHERE CONCAT(course_code, ' ', course_num) = 'CSE 110'))
,(1,35, (SELECT term_id FROM term WHERE CONCAT(term_name,' ', term_year) = 'Fall 2024')
, (SELECT course_id FROM course WHERE CONCAT(course_code, ' ', course_num) = 'DS 150'))
,(1,30, (SELECT term_id FROM term WHERE CONCAT(term_name,' ', term_year) = 'Fall 2024')
, (SELECT course_id FROM course WHERE CONCAT(course_code, ' ', course_num) = 'MUSIC 160B'))
,(2,30, (SELECT term_id FROM term WHERE CONCAT(term_name,' ', term_year) = 'Winter 2025')
, (SELECT course_id FROM course WHERE CONCAT(course_code, ' ', course_num) = 'CSE 180'))
,(3,35, (SELECT term_id FROM term WHERE CONCAT(term_name,' ', term_year) = 'Winter 2025')
, (SELECT course_id FROM course WHERE CONCAT(course_code, ' ', course_num) = 'CSE 180'))
,(1,50, (SELECT term_id FROM term WHERE CONCAT(term_name,' ', term_year) = 'Winter 2025')
, (SELECT course_id FROM course WHERE CONCAT(course_code, ' ', course_num) = 'CSE 110'))
,(2,50, (SELECT term_id FROM term WHERE CONCAT(term_name,' ', term_year) = 'Winter 2025')
, (SELECT course_id FROM course WHERE CONCAT(course_code, ' ', course_num) = 'CSE 110'))
,(1,30, (SELECT term_id FROM term WHERE CONCAT(term_name,' ', term_year) = 'Winter 2025')
, (SELECT course_id FROM course WHERE CONCAT(course_code, ' ', course_num) = 'MUSIC 160B'));

INSERT INTO role
(person_type)
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
   AND   CONCAT(course_code, ' ', course_num) = 'CSE 110'
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
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(fname, ' ', lname) = 'Preston Larsen')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_name, ' ', term_year) = 'Winter 2025'
   AND   CONCAT(course_code, ' ', course_num) = 'CSE 110'
   AND   section_num = 2)
, (SELECT role_id 
   FROM role 
   WHERE person_type = 'Student')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(fname, ' ', lname) = 'Julia Madsen')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_name, ' ', term_year) = 'Winter 2025'
   AND   CONCAT(course_code, ' ', course_num) = 'CSE 110'
   AND   section_num = 2)
, (SELECT role_id 
   FROM role 
   WHERE person_type = 'Student')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(fname, ' ', lname) = 'Susan Sorensen')
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
)
;















