--3

INSERT INTO products VALUES (DEFAULT, 'small bolt');
INSERT INTO products VALUES (DEFAULT, 'large bolt');

INSERT INTO orders VALUES (DEFAULT, 1, 10);
INSERT INTO orders VALUES (DEFAULT, 1, 25);
INSERT INTO orders VALUES (DEFAULT, 2, 15);

--4

SELECT orders.quantity, products.name 
FROM products 
  JOIN orders ON orders.product_id = products.id;

--5 you CAN insert null values to fkey now, as it has no not null constraint

INSERT INTO orders VALUES (DEFAULT, NULL, 15);

--6

database_2=> ALTER TABLE orders ALTER COLUMN product_id SET NOT NULL;
-- ERROR:  column "product_id" of relation "orders" contains null values

--8 Create a new table called reviews to store the data shown below. 
--  This table should include a primary key and a reference to the products table.

CREATE TABLE reviews (
  id serial PRIMARY KEY,
  product_id int REFERENCES products(id),
  body varchar(255) NOT NULL
);

--9

INSERT INTO reviews (product_id, body)
VALUES (1, 'a little small'),
(1, 'very round!'),
(2, 'could''ve been smaller');

