--3 Write a SQL query to list the ten states with the most rows in the people table in descending order.

SELECT state, count(id) AS "number of people" FROM people
GROUP BY state
ORDER BY count(id) DESC LIMIT 10;

--4 Write a SQL query that lists each domain used in an email address in the people table and 
-- how many people in the database have an email address containing that domain. 
-- Domains should be listed with the most popular first.

SELECT split_part(email, '@', 2) AS domain, count(id)
FROM people
GROUP BY domain ORDER BY count DESC;

-- 5

DELETE FROM people
WHERE id = 3399;

-- 6

DELETE FROM people
WHERE state = 'CA';

-- 7

UPDATE people
  SET given_name = initcap(given_name)
  WHERE email LIKE '%@teleworm.us';