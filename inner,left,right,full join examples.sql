-- DEMO FOR CLASS
DROP DATABASE IF EXISTS joins;
CREATE DATABASE IF NOT EXISTS joins;
USE joins;
DROP TABLE IF EXISTS artist;
CREATE TABLE IF NOT EXISTS artist (
artist_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
fname VARCHAR(45),
lname VARCHAR(45)
);
DROP TABLE IF EXISTS artwork;
CREATE TABLE IF NOT EXISTS artwork (
artwork_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(45),
artist_id INT UNSIGNED,
CONSTRAINT `fk_artwork_artist`
    FOREIGN KEY (`artist_id`)
    REFERENCES `joins`.`artist` (`artist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

INSERT INTO artist (fname, lname)
VALUES
('Vincent','Van Gogh'),
('Oliver','Twist'),
('Michaelangelo','Simoni');
INSERT INTO artwork (title, artist_id)
VALUES
('Irises',1),
('Sunflowers',1),
('Walk on the beach',2),
('Mona Lisa',NULL);

-- CROSS JOIN
SELECT fname, lname, title
FROM artist a
CROSS JOIN artwork aw;

-- INNER JOIN
SELECT fname, lname, title
FROM artist a
INNER JOIN artwork aw
ON a.artist_id = aw.artist_id;

-- RIGHT JOIN
SELECT fname, lname, title
FROM artist a
RIGHT JOIN artwork aw
ON a.artist_id = aw.artist_id;

-- Equivalent to RIGHT JOIN
SELECT fname, lname, title
FROM artwork aw
LEFT JOIN artist a
ON a.artist_id = aw.artist_id;

-- LEFT JOIN
SELECT fname, lname, title
FROM artist a
LEFT JOIN artwork aw
ON a.artist_id = aw.artist_id;


-- FULL OUTER JOIN (REQUIRES UNION) UNIONS SHOULD NOT BE USED IN THIS CLASS
SELECT fname, lname, title
FROM artist a
RIGHT JOIN artwork aw
ON a.artist_id = aw.artist_id
UNION
SELECT fname, lname, title
FROM artist a
LEFT JOIN artwork aw
ON a.artist_id = aw.artist_id;