--1

CREATE DATABASE animals;

--2

CREATE TABLE birds (
  id serial PRIMARY KEY,
  name varchar(25),
  age int,
  species varchar(15)
);

--3

INSERT INTO birds (name, age, species) 
VALUES ('Charlie', 3, 'Finch'),
('Allie', 5, 'Owl'),
('Jennifer', 3, 'Magpie'),
('Jamie', 4, 'Owl'),
('Roy', 8, 'Crow');

-- skipped some problems...

--5

UPDATE birds 
  SET species = 'Raven'
  WHERE species = 'Crow';


--6

DELETE FROM birds 
  WHERE species = 'Finch' 
  AND age = 3;

-- 7

ALTER TABLE birds 
  ADD CONSTRAINT no_negative_age
  CHECK (age >= 0);

INSERT INTO birds (name, age, species)
VALUES ('ferret', -1, 'Crowlah');

-- 8

DROP TABLE birds;

