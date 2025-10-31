
--1 Write a query to return all of the country names along with their appropriate continent names.

SELECT countries.name, continents.continent_name 
  FROM countries JOIN continents ON countries.continent_id = continents.id;

--2 Write a query to return all of the names and capitals of the European countries.



SELECT countries.name, countries.capital 
FROM countries JOIN continents
ON countries.continent_id = continents.id
WHERE countries.continent_id = 3;

--3 Write a query to return the first name of any singer who had an album released under the Warner Bros label.

SELECT DISTINCT singers.first_name, albums.label -- make sure to put distinct
FROM singers INNER JOIN albums
ON albums.singer_id = singers.id
--WHERE albums.label = 'Warner Bros';
WHERE albums.label LIKE '%Warner Bros%';

--4 Write a query to return the first name and last name of any singer who released an album in the 
--80s and who is still living, along with the names of the album that was released and the release date. 
--Order the results by the singer's age (youngest first).


SELECT singers.first_name, singers.last_name, albums.album_name, albums.released 
FROM singers JOIN albums
ON albums.singer_id = singers.id
WHERE singers.deceased = false 
AND albums.released >= '1980-01-01' 
AND albums.released < '1990-12-31'
ORDER BY singers.date_of_birth DESC;

-- 5 Write a query to return the first name and last name of any singer without an associated album entry.

SELECT singers.first_name, singers.last_name 
    FROM singers LEFT JOIN albums
    ON albums.singer_id = singers.id
    WHERE albums.id IS NULL;

-- 6 rewrite as a subquery

SELECT singers.first_name, singers.last_name  -- bad syntax
  FROM singers WHERE singers.id NOT IN (
    SELECT albums.singer_id FROM albums
  );

SELECT first_name, last_name  -- good syntax 
FROM singers
WHERE id NOT IN (SELECT singer_id FROM albums);

--7 Connect to the ls_burger database. Return a list of all orders and their associated product items.

SELECT orders.*, products.* FROM orders 
JOIN order_items ON orders.id = order_items.order_id
JOIN products ON products.id = order_items.product_id;

-- 8 Return the id of any order that includes Fries. Use table aliasing in your query.

SELECT orders.id, products.product_name FROM orders -- WITHOUT ALIASING
JOIN order_items ON orders.id = order_items.order_id
JOIN products ON products.id = order_items.product_id
WHERE products.product_name = 'Fries';

SELECT o.id, p.product_name 
  
  FROM orders AS o -- WITH ALIASING
  JOIN order_items AS oi 
    ON o.id = oi.order_id -- JOIN ... AS ... ON + JOIN-AS-ON
  JOIN products AS p 
    ON p.id = oi.product_id

  WHERE p.product_name = 'Fries';

-- 9 Build on the query from the previous question to return the name of any customer who ordered fries. 
-- -- Return this in a column called 'Customers who like Fries'. 
-- -- Don't repeat the same customer name more than once in the results.



SELECT DISTINCT c.customer_name AS "Customers like fries", p.product_name
  
  FROM orders AS o 
  JOIN order_items AS oi 
    ON o.id = oi.order_id 
  JOIN products AS p 
    ON p.id = oi.product_id
  JOIN customers AS c
    ON c.id = o.customer_id

  WHERE p.product_name = 'Fries';

-- 10 Write a query to return the total cost of Natasha O'Shea's orders.


SELECT c.customer_name, sum(p.product_cost) AS "Sum of orders"

  FROM orders AS o            -- initial from ... join ... on ...
  JOIN order_items AS oi 
    ON o.id = oi.order_id 

  JOIN products AS p          -- additional join ... on ... 
    ON p.id = oi.product_id   -- they are chained like this

  JOIN customers AS c
    ON c.id = o.customer_id

--WHERE c.customer_name = 'Natasha O''Shea'     
GROUP BY c.customer_name;

-- 11 Write a query to return the name of every product included in an order alongside the number 
-- of times it has been ordered. Sort the results by product name, ascending.

SELECT p.product_name, count(oi.id) AS "Total Orders"

  FROM orders AS o          
  JOIN order_items AS oi 
    ON o.id = oi.order_id 

  JOIN products AS p        
    ON p.id = oi.product_id 

  JOIN customers AS c
    ON c.id = o.customer_id

GROUP BY p.product_name
ORDER BY p.product_name ASC;



