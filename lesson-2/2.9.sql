--2

ALTER TABLE employees ALTER COLUMN department SET DEFAULT 'unassigned';
UPDATE employees SET department = 'unassigned' WHERE department IS NULL;
ALTER TABLE employees ALTER COLUMN department SET NOT NULL;

--3

CREATE TABLE tempuratures (
  date date NOT NULL,
  low int NOT NULL,
  high int NOT NULL
)

--4

INSERT INTO temperatures VALUES (2016-03-01, 34, 43);
INSERT INTO temperatures VALUES ('2016-03-02', 32, 44);
INSERT INTO temperatures VALUES ('2016-03-03', 31, 47);
INSERT INTO temperatures VALUES ('2016-03-04', 33, 42);
INSERT INTO temperatures VALUES ('2016-03-05', 39, 46);
INSERT INTO temperatures VALUES ('2016-03-06', 32, 43);
INSERT INTO temperatures VALUES ('2016-03-07', 29, 32);
INSERT INTO temperatures VALUES ('2016-03-08', 23, 31);
INSERT INTO temperatures VALUES ('2016-03-09', 17, 28);

--5 Write a SQL statement to determine the average (mean) temperature 
--(divide the sum of the high and low temperatures by two) for each day
-- from March 2, 2016 through March 8, 2016. 
--Make sure to round each average value to one decimal place.

SELECT date, trunc(((low + high) / 2.0), 2) AS average_temp
FROM temperatures 
WHERE date >= '2016-03-02' AND date < '2016-03-09';

-- 6

ALTER TABLE temperatures
ADD COLUMN rainfall int DEFAULT 0;

UPDATE temperatures
  SET rainfall = round((low + high) / 2.0) - 35
  WHERE round((low + high) / 2.0) > 35;


SELECT date, low, high, 
round((low + high) / 2.0) - 35 AS rainfall,
round((low + high) / 2.0) > 35 AS rain_bool
FROM temperatures;

-- 7

UPDATE temperatures
  SET rainfall = rainfall * 0.0393701;