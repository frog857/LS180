--2

CREATE TABLE directors_films (
  id serial PRIMARY KEY,
  director_id integer REFERENCES directors(id) ON DELETE CASCADE,
  film_id integer REFERENCES films(id) ON DELETE CASCADE,
  UNIQUE(director_id, film_id)
);

--3

INSERT INTO directors_films (director_id, film_id)
VALUES (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6),
(3, 7), (7, 8), (8, 9), (5, 10);

--4 

ALTER TABLE films 
  DROP COLUMN director_id;

--5 

SELECT films.title, directors.name
FROM films  
  JOIN directors_films ON films.id = directors_films.film_id
  JOIN directors ON directors.id = directors_films.director_id
ORDER BY films.title;

--6

INSERT INTO films (title, year, genre, duration) VALUES ('Fargo', 1996, 'comedy', 98);
INSERT INTO directors (name) VALUES ('Joel Coen');
INSERT INTO directors (name) VALUES ('Ethan Coen');
INSERT INTO directors_films (director_id, film_id) VALUES (9, 11);

INSERT INTO films (title, year, genre, duration) VALUES ('No Country for Old Men', 2007, 'western', 122);
INSERT INTO directors_films (director_id, film_id) VALUES (9, 12);
INSERT INTO directors_films (director_id, film_id) VALUES (10, 12);

INSERT INTO films (title, year, genre, duration) VALUES ('Sin City', 2005, 'crime', 124);
INSERT INTO directors (name) VALUES ('Frank Miller');
INSERT INTO directors (name) VALUES ('Robert Rodriguez');
INSERT INTO directors_films (director_id, film_id) VALUES (11, 13);
INSERT INTO directors_films (director_id, film_id) VALUES (12, 13);

INSERT INTO films (title, year, genre, duration) VALUES ('Spy Kids', 2001, 'scifi', 88);
INSERT INTO directors_films (director_id, film_id) VALUES (12, 14);

--7

SELECT directors.name, count(films.id) AS number_of_films
FROM films  
  JOIN directors_films ON films.id = directors_films.film_id
  JOIN directors ON directors.id = directors_films.director_id
GROUP BY directors.name ORDER BY number_of_films DESC, directors.name;
