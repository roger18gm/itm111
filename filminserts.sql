use film;


INSERT INTO actor
(actor_fname
,actor_lname)
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
('Leticia','Wright'),
('Angela','Bassett'),
('Danai','Gurira'),
('Lupita','Nyong''o');


INSERT INTO genre
(genre_name)
VALUES
('Family'),
('Animated'),
('Musical'),
('Romantic'),
('Sci Fi'),
('Comedy'),
('Drama'),
('Music'),
('Action'),
('Adventure'),
('Thriller'),
('Fantasy');


INSERT INTO media_type
(media_name)
VALUES
('DVD'),
('blu-ray'),
('Streaming'),
('HD');


INSERT INTO price
(price_amount)
VALUES
(19.95),
(24.95),
(35.00),
(19.99);


INSERT INTO feature
(feature_type)
VALUES
('bloopers'),
('actor interviews'),
('cut scenes'),
('Trailers');


INSERT INTO studio
(studio_name)
VALUES
('Pixar'),
('MGM'),
('20th Century Fox'),
('Apple TV+'),
('Marvel'),
('Disney');

INSERT INTO rating
(rating_type)
VALUES
('G'),
('PG'),
('PG-13');


INSERT INTO movie
(movie_name
,movie_year)
VALUES
('Toy Story', 1995),
('Toy Story 2', 1999),
('Brigadoone', 1954),
('The Empire Strikes Back', 1977),
('Coda', 2021),
('Black Panther: Wakanda Forever', 2022);


INSERT INTO movie_actor
(actor_id,
movie_id)
VALUES
((SELECT actor_id FROM actor WHERE actor_fname = 'Tom'), (SELECT movie_id FROM movie WHERE movie_name = 'Toy Story')),
((SELECT actor_id FROM actor WHERE actor_fname = 'Tom'), (SELECT movie_id FROM movie WHERE movie_name = 'Toy Story 2')),
((SELECT actor_id FROM actor WHERE actor_fname = 'Tim'), (SELECT movie_id FROM movie WHERE movie_name = 'Toy Story')),
((SELECT actor_id FROM actor WHERE actor_fname = 'Tim'), (SELECT movie_id FROM movie WHERE movie_name = 'Toy Story 2')),
((SELECT actor_id FROM actor WHERE actor_fname = 'Annie'), (SELECT movie_id FROM movie WHERE movie_name = 'Toy Story')),
((SELECT actor_id FROM actor WHERE actor_fname = 'Annie'), (SELECT movie_id FROM movie WHERE movie_name = 'Toy Story 2')),
((SELECT actor_id FROM actor WHERE actor_fname = 'John'), (SELECT movie_id FROM movie WHERE movie_name = 'Toy Story')),
((SELECT actor_id FROM actor WHERE actor_fname = 'John'), (SELECT movie_id FROM movie WHERE movie_name = 'Toy Story 2')),
((SELECT actor_id FROM actor WHERE actor_fname = 'Gene'), (SELECT movie_id FROM movie WHERE movie_name = 'Brigadoone')),
((SELECT actor_id FROM actor WHERE actor_fname = 'Cyd'), (SELECT movie_id FROM movie WHERE movie_name = 'Brigadoone')),
((SELECT actor_id FROM actor WHERE actor_fname = 'Van'), (SELECT movie_id FROM movie WHERE movie_name = 'Brigadoone')),
((SELECT actor_id FROM actor WHERE actor_fname = 'Harrison'), (SELECT movie_id FROM movie WHERE movie_name = 'The Empire Strikes Back')),
((SELECT actor_id FROM actor WHERE actor_fname = 'Carrie'), (SELECT movie_id FROM movie WHERE movie_name = 'The Empire Strikes Back')),
((SELECT actor_id FROM actor WHERE actor_fname = 'Mark'), (SELECT movie_id FROM movie WHERE movie_name = 'The Empire Strikes Back')),
((SELECT actor_id FROM actor WHERE actor_fname = 'Emilia'), (SELECT movie_id FROM movie WHERE movie_name = 'Coda')),
((SELECT actor_id FROM actor WHERE actor_fname = 'Marlee'), (SELECT movie_id FROM movie WHERE movie_name = 'Coda')),
((SELECT actor_id FROM actor WHERE actor_fname = 'Troy'), (SELECT movie_id FROM movie WHERE movie_name = 'Coda')),
((SELECT actor_id FROM actor WHERE actor_fname = 'Leticia'), (SELECT movie_id FROM movie WHERE movie_name = 'Black Panther: Wakanda Forever')),
((SELECT actor_id FROM actor WHERE actor_fname = 'Angela'), (SELECT movie_id FROM movie WHERE movie_name = 'Black Panther: Wakanda Forever')),
((SELECT actor_id FROM actor WHERE actor_fname = 'Danai'), (SELECT movie_id FROM movie WHERE movie_name = 'Black Panther: Wakanda Forever')),
((SELECT actor_id FROM actor WHERE actor_fname = 'Lupita'), (SELECT movie_id FROM movie WHERE movie_name = 'Black Panther: Wakanda Forever'));



INSERT INTO movie_feature
(movie_id,
feature_id)
VALUES
((SELECT movie_id FROM movie WHERE movie_name = 'Toy Story'), (SELECT feature_id FROM feature WHERE feature_type = 'bloopers')),
((SELECT movie_id FROM movie WHERE movie_name = 'Toy Story 2'), (SELECT feature_id FROM feature WHERE feature_type = 'actors interview')),
((SELECT movie_id FROM movie WHERE movie_name = 'The Empire Strikes Back'), (SELECT feature_id FROM feature WHERE feature_type = 'cut scenes')),
((SELECT movie_id FROM movie WHERE movie_name = 'The Empire Strikes Back'), (SELECT feature_id FROM feature WHERE feature_type = 'bloopers')),
((SELECT movie_id FROM movie WHERE movie_name = 'Coda'), (SELECT feature_id FROM feature WHERE feature_type = 'Trailers')),
((SELECT movie_id FROM movie WHERE movie_name = 'Black Panther: Wakanda Forever'), (SELECT feature_id FROM feature WHERE feature_type = 'Trailers')),
((SELECT movie_id FROM movie WHERE movie_name = 'Black Panther: Wakanda Forever'), (SELECT feature_id FROM feature WHERE feature_type = 'bloopers'));


INSERT INTO movie_genre
(movie_id,
genre_id)
VALUES
((SELECT movie_id FROM movie WHERE movie_name = 'Toy Story'), (SELECT genre_id FROM genre WHERE genre_name = 'Family')),
((SELECT movie_id FROM movie WHERE movie_name = 'Toy Story'), (SELECT genre_id FROM genre WHERE genre_name = 'Animated')),
((SELECT movie_id FROM movie WHERE movie_name = 'Toy Story 2'), (SELECT genre_id FROM genre WHERE genre_name = 'Family')),
((SELECT movie_id FROM movie WHERE movie_name = 'Toy Story 2'), (SELECT genre_id FROM genre WHERE genre_name = 'Animated')),
((SELECT movie_id FROM movie WHERE movie_name = 'Brigadoone'), (SELECT genre_id FROM genre WHERE genre_name = 'Musical')),
((SELECT movie_id FROM movie WHERE movie_name = 'Brigadoone'), (SELECT genre_id FROM genre WHERE genre_name = 'Romance')),
((SELECT movie_id FROM movie WHERE movie_name = 'The Empire Strikes Back'), (SELECT genre_id FROM genre WHERE genre_name = 'Sci Fi')),
((SELECT movie_id FROM movie WHERE movie_name = 'Coda'), (SELECT genre_id FROM genre WHERE genre_name = 'Comedy')),
((SELECT movie_id FROM movie WHERE movie_name = 'Coda'), (SELECT genre_id FROM genre WHERE genre_name = 'Drama')),
((SELECT movie_id FROM movie WHERE movie_name = 'Coda'), (SELECT genre_id FROM genre WHERE genre_name = 'Music')),
((SELECT movie_id FROM movie WHERE movie_name = 'Black Panther: Wakanda Forever'), (SELECT genre_id FROM genre WHERE genre_name = 'Action')),
((SELECT movie_id FROM movie WHERE movie_name = 'Black Panther: Wakanda Forever'), (SELECT genre_id FROM genre WHERE genre_name = 'Adventure')),
((SELECT movie_id FROM movie WHERE movie_name = 'Black Panther: Wakanda Forever'), (SELECT genre_id FROM genre WHERE genre_name = 'Drama')),
((SELECT movie_id FROM movie WHERE movie_name = 'Black Panther: Wakanda Forever'), (SELECT genre_id FROM genre WHERE genre_name = 'Thriller')),
((SELECT movie_id FROM movie WHERE movie_name = 'Black Panther: Wakanda Forever'), (SELECT genre_id FROM genre WHERE genre_name = 'Fantasy')),
((SELECT movie_id FROM movie WHERE movie_name = 'Black Panther: Wakanda Forever'), (SELECT genre_id FROM genre WHERE genre_name = 'Sci Fi'));


INSERT INTO movie_mediatype_price
(movie_id,
price_id,
media_type_id)
VALUES
((SELECT movie_id FROM movie WHERE movie_name = 'Toy Story'), (SELECT price_id FROM price WHERE price_amount = 19.95), (SELECT media_type_id FROM media_type WHERE media_name = 'DVD')),
((SELECT movie_id FROM movie WHERE movie_name = 'Toy Story 2'), (SELECT price_id FROM price WHERE price_amount = 24.95), (SELECT media_type_id FROM media_type WHERE media_name = 'DVD')),
((SELECT movie_id FROM movie WHERE movie_name = 'Brigadoone'), (SELECT price_id FROM price WHERE price_amount = 19.95), (SELECT media_type_id FROM media_type WHERE media_name = 'DVD')),
((SELECT movie_id FROM movie WHERE movie_name = 'The Empire Strikes Back'), (SELECT price_id FROM price WHERE price_amount = 35.00), (SELECT media_type_id FROM media_type WHERE media_name = 'blu-ray')),
((SELECT movie_id FROM movie WHERE movie_name = 'Coda'), (SELECT media_type_id FROM media_type WHERE media_name = 'Streaming')),
((SELECT movie_id FROM movie WHERE movie_name = 'Black Panther: Wakanda Forever'), (SELECT media_type_id FROM media_type WHERE media_name = 'Streaming')),
((SELECT movie_id FROM movie WHERE movie_name = 'Black Panther: Wakanda Forever'), (SELECT price_id FROM price WHERE price_amount = 19.99), (SELECT media_type_id FROM media_type WHERE media_name = 'HD'));


INSERT INTO movie_studio
(movie_id,
studio_id)
VALUES
((SELECT movie_id FROM movie WHERE movie_name = 'Toy Story'), (SELECT studio_id FROM studio WHERE studio_name = 'Pixar')),
((SELECT movie_id FROM movie WHERE movie_name = 'Toy Story 2'), (SELECT studio_id FROM studio WHERE studio_name = 'Pixar')),
((SELECT movie_id FROM movie WHERE movie_name = 'Brigadoone'), (SELECT studio_id FROM studio WHERE studio_name = 'MGM')),
((SELECT movie_id FROM movie WHERE movie_name = 'The Empire Strikes Back'), (SELECT studio_id FROM studio WHERE studio_name = '20th Century Fox')),
((SELECT movie_id FROM movie WHERE movie_name = 'Coda'), (SELECT studio_id FROM studio WHERE studio_name = 'Apple TV+')),
((SELECT movie_id FROM movie WHERE movie_name = 'Black Panther: Wakanda Forever'), (SELECT studio_id FROM studio WHERE studio_name = 'Marvel')),
((SELECT movie_id FROM movie WHERE movie_name = 'Black Panther: Wakanda Forever'), (SELECT studio_id FROM studio WHERE studio_name = 'Disney'));

