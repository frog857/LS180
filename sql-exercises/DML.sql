--1 CREATE DB workship and tabledevices

CREATE TABLE devices (
  id serial PRIMARY KEY,
  name text NOT NULL,
  created_at timestamp DEFAULT NOW()
);

CREATE TABLE parts (
  id serial PRIMARY KEY,
  part_number int UNIQUE NOT NULL,
  device_id int REFERENCES devices (id)
);

--2 add some data

INSERT INTO devices (name)
VALUES ('Accelerometer'), ('Gyroscope');

INSERT INTO parts (part_number, device_id)
VALUES (1, 1), (2, 1), (3, 1),
(4, 2), (5, 2), (6, 2), (7, 2), (8, 2),
(9, NULL), (10, NULL), (11, NULL);  

--3 WRITE a query do display devices + parts...

SELECT devices.name, parts.part_number 
FROM devices
  JOIN parts ON parts.device_id = devices.id;

--4 
SELECT * FROM parts WHERE SUBSTRING(part_number::text, 1, 1) = '3';
--OR
SELECT * FROM parts WHERE part_number::text LIKE '3%';

--5
SELECT devices.name, count(parts.id)
FROM devices JOIN parts ON devices.id = parts.device_id
GROUP BY devices.name ORDER BY devices.name DESC;


SELECT part_number, device_id
FROM parts WHERE device_id IS NOT NULL;

-- 6 select oldest device

SELECT name FROM devices
ORDER BY created_at LIMIT 1;

INSERT INTO devices (name)
VALUES ('Prognometer'), ('Jolangelus');

--7 associates 2 gyro parts with accel instead

UPDATE parts
  SET device_id = 1 WHERE part_number > 6 AND part_number < 9;

  -- delete accel

SELECT parts.id FROM parts 
JOIN devices ON parts.device_id = devices.id
WHERE devices.id = 1;

DELETE FROM parts WHERE id IN (23, 24, 25, 29, 30);

DELETE FROM devices WHERE id = 1;