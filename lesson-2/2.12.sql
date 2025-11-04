--3

SELECT DISTINCT genre FROM films;

--4

SELECT genre FROM films GROUP BY genre;

--5

SELECT genre, round(avg(duration)) AS avg_duration FROM films
GROUP BY genre;

--6

SELECT 
  trunc((year / 10.0), 0) * 10 AS decade, 
  round(avg(duration))
FROM films
GROUP BY decade ORDER BY decade;

--7

SELECT title, director FROM films 
WHERE director LIKE '%John%';

--8

SELECT genre, count(id) FROM films GROUP BY genre ORDER BY count DESC;

--10

SELECT trunc((year / 10.0), 0) * 10 AS decade, genre, string_agg(title, ', ')
FROM films
GROUP BY genre, decade
ORDER BY decade;

--11

SELECT genre, sum(duration) AS total_duration
FROM films
GROUP BY genre ORDER BY total_duration;
