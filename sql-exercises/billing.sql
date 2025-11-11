--1

CREATE TABLE customers(
  id serial PRIMARY KEY,
  name text NOT NULL,
  payment_token CHAR(8) NOT NULL UNIQUE CHECK (payment_token ~ '^[A-Z]{8}$')
);

CREATE TABLE services (
  id serial PRIMARY KEY,
  description text NOT NULL,
  price numeric(10,2) NOT NULL CHECK (price >= 0.00)
);

INSERT INTO customers (name, payment_token)
VALUES
  ('Pat Johnson', 'XHGOAHEQ'),
  ('Nancy Monreal', 'JKWQPJKL'),
  ('Lynn Blake', 'KLZXWEEE'),
  ('Chen Ke-Hua', 'KWETYCVX'),
  ('Scott Lakso', 'UUEAPQPS'),
  ('Jim Pornot', 'XKJEYAZA');

INSERT INTO services (description, price)
VALUES
  ('Unix Hosting', 5.95),
  ('DNS', 4.95),
  ('Whois Registration', 1.95),
  ('High Bandwidth', 15.00),
  ('Business Support', 250.00),
  ('Dedicated Hosting', 50.00),
  ('Bulk Email', 250.00),
  ('One-to-one Training', 999.00);

CREATE TABLE customers_services(
  id serial PRIMARY KEY,
  service_id int REFERENCES services (id) NOT NULL,
  customer_id int REFERENCES customers (id) ON DELETE CASCADE NOT NULL,
  UNIQUE (service_id, customer_id) -- table constriant, very simple syntax...
);

INSERT INTO customers_services (customer_id, service_id)
VALUES
  (1, 1), -- Pat Johnson/Unix Hosting
  (1, 2), --            /DNS
  (1, 3), --            /Whois Registration
  (3, 1), -- Lynn Blake/Unix Hosting
  (3, 2), --           /DNS
  (3, 3), --           /Whois Registration
  (3, 4), --           /High Bandwidth
  (3, 5), --           /Business Support
  (4, 1), -- Chen Ke-Hua/Unix Hosting
  (4, 4), --            /High Bandwidth
  (5, 1), -- Scott Lakso/Unix Hosting
  (5, 2), --            /DNS
  (5, 6), --            /Dedicated Hosting
  (6, 1), -- Jim Pornot/Unix Hosting
  (6, 6), --           /Dedicated Hosting
  (6, 7); --   


  --2

SELECT DISTINCT customers.name, count(customers_services.id) FROM customers
JOIN customers_services ON customers_services.customer_id = customers.id
GROUP BY customers.name ORDER BY count(customers_services.id) DESC;

--3

SELECT DISTINCT customers.name, count(customers_services.id) FROM customers
LEFT JOIN customers_services ON customers_services.customer_id = customers.id
WHERE customers_services.id IS NULL
GROUP BY customers.name ORDER BY count(customers_services.id) DESC;

--3 further exp

SELECT customers.*, customers_services.*, services.* FROM customers
LEFT JOIN customers_services ON customers_services.customer_id = customers.id
FULL OUTER JOIN services ON customers_services.service_id = services.id
WHERE customers_services.id IS NULL;

--4

SELECT services.description FROM customers_services 
RIGHT JOIN services ON customers_services.service_id = services.id
WHERE service_id IS NULL;

--5

SELECT name, 
  string_agg(description, E'\n') AS services 
FROM customers
  LEFT JOIN customers_services 
         ON customer_id = customers.id
  LEFT JOIN services 
         ON service_id = services.id
GROUP BY name;

--6

SELECT DISTINCT description, count(customers_services.id) FROM services
JOIN customers_services ON service_id = services.id
--WHERE count(customers_services.id) > 2 -- cannot with an aggregate
GROUP BY description HAVING count(customers_services.id) > 2
ORDER BY count(customers_services.id);

--7 how much money we makin?

SELECT ((count(service_id) * price)) AS total_sales, price, count(service_id), description
FROM services 
JOIN customers_services ON service_id = services.id
GROUP BY description, price;

SELECT sum(price)
FROM services 
JOIN customers_services ON service_id = services.id;
--GROUP BY price, description;

-- 8 add a new fella

INSERT INTO customers (name, payment_token) 
VALUES ('John Doe', 'EYODHLCN');

INSERT INTO customers_services (customer_id, service_id)
VALUES (7, 1), (7, 3), (7, 2); 


--9 company prez needs data

-- current expected big ticket total

SELECT sum(price)
  FROM services
JOIN customers_services ON service_id = services.id
WHERE price > 100;

select sum(price) FROM services, customers 
WHERE price > 100;

--get rid of customer and a service;

DELETE FROM customers where id = 4;
DELETE FROM customers_services where id = 16;
DELETE FROM services where id = 7;

SELECT * FROM customers_services 
JOIN customers ON customer_id = customers.id
where service_id = 7;