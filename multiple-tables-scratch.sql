-- 1.1
INSERT INTO
  ls_burger (customer_name, customer_email, burger, side, drink, burger_cost, side_cost, drink_cost, customer_loyalty_points)
  VALUES ('James Bergman', 'james1998@email.com', 'LS Chicken Burger', 'Fries', 'Cola', 4.50, 0.99, 1.50, 28)

-- 1.2
INSERT INTO orders (customer_name, customer_email, customer_loyalty_points, burger, side, drink, burger_cost, side_cost, drink_cost)
    VALUES ('James Bergman', 'james1998@email.com', 28, 'LS Chicken Burger', 'Fries', 'Cola', 4.50, 0.99, 1.50),
                  ('Natasha O''Shea', 'natasha@osheafamily.com', 18, 'LS Cheeseburger', 'Fries', NULL, 3.50, 0.99, DEFAULT),
                  ('Natasha O''Shea', 'natasha@osheafamily.com', 42, 'LS Double Deluxe Burger', 'Onion Rings', 'Chocolate Shake', 6.00, 1.50, 2.00),
                  ('Aaron Muller', NULL, 10, 'LS Burger', NULL, NULL, 3.00, DEFAULT, DEFAULT);


-- 2.1
CREATE TABLE continents (
  id serial PRIMARY KEY,
  continent_name varchar(50)
);

ALTER TABLE countries
  DROP COLUMN continent;

ALTER TABLE countries
  ADD COLUMN continent_id integer;

ALTER TABLE countries
      ADD FOREIGN KEY (continent_id)
      REFERENCES continents(id);


-- 2.2
INSERT INTO continents (continent_name) 
VALUES ('Africa'),
       ('Asia'),
       ('Europe'),
       ('North America'),
       ('South America');

INSERT INTO countries (name, capital, population, continent_id)
            VALUES ('Brazil', 'Brasilia', 208385000, 5),
            ('Egypt', 'Cairo', 96308900, 1),
            ('France', 'Paris', 67158000, 3),
            ('Germany', 'Berlin', 82349400, 3),
            ('Japan', 'Tokyo', 126672000, 2),
            ('USA', 'Washington D.C.', 325365189, 4);

-- 2.3
CREATE TABLE albums (
  id serial PRIMARY KEY,
  album_name varchar(100),
  released date,
  genre varchar(100),
  label varchar(100),
  singer_id int,
  FOREIGN KEY (singer_id) REFERENCES singers(id)
);

INSERT INTO albums (album_name, released, genre, label, singer_id) VALUES
('Born to Run', '1975-08-25', 'Rock and roll', 'Columbia', 1),
('Purple Rain', '1984-06-25', 'Pop, R&B, Rock', 'Warner Bros', 6),
('Born in the USA', '1984-06-04', 'Rock and roll, pop', 'Columbia', 1),
('Madonna', '1983-07-27', 'Dance-pop, post-disco', 'Warner Bros', 5),
('True Blue', '1986-06-30', 'Dance-pop, Pop', 'Warner Bros', 5),
('Elvis', '1956-10-19', 'Rock and roll, Rhythm and Blues', 'RCA Victor', 7),
('Sign o'' the Times', '1987-03-30', 'Pop, R&B, Rock, Funk', 'Paisley Park, Warner Bros', 6),
('G.I. Blues', '1960-10-01', 'Rock and roll, Pop', 'RCA Victor', 7);

-- 2.4
CREATE TABLE customers (
  id serial PRIMARY KEY,
  customer_name varchar(100)
);

CREATE TABLE email_addresses (
  customer_id int PRIMARY KEY,
  customer_email varchar(100),
  FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE
);

INSERT INTO customers (customer_name) VALUES
('Natasha O''Shea'),
('James Bergman'),
('Aaron Muller');

INSERT INTO email_addresses (customer_id, customer_email) VALUES
(1, 'natasha@osheafamily.com'),
(2, 'james1998@email.com');

-- 2.5

CREATE TABLE products (
  id serial PRIMARY KEY,
  product_name varchar(50),
  product_cost decimal(4,2) DEFAULT 0,
  product_type varchar(20),
  product_loyalty_poiints integer
);

INSERT INTO products (product_name, product_cost, product_type, product_loyalty_poiints) VALUES
('LS Burger', 3.00, 'Burger', 10 ),
('LS Cheeseburger', 3.50, 'Burger', 15 ),
('LS Chicken Burger', 4.50, 'Burger', 20 ),
('LS Double Deluxe Burger', 6.00, 'Burger', 30 ),
('Fries', 1.20, 'Side', 3 ),
('Onion Rings', 1.50, 'Side', 5 ),
('Cola', 1.50, 'Drink', 5 ),
('Lemonade', 1.50, 'Drink', 5 ),
('Vanilla Shake', 2.00, 'Drink', 7 ),
('Chocolate Shake', 2.00, 'Drink', 7 ),
('Strawberry Shake', 2.00, 'Drink', 7);


--2.6

DROP TABLE orders;

CREATE TABLE orders (
  id serial PRIMARY KEY,
  customer_id int,
  order_status varchar(50),
  FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE
);


CREATE TABLE order_items (
  id serial,
  order_id int NOT NULL,
  product_id int NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
  FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

-- Pt 2

INSERT INTO orders (customer_id, order_status)
VALUES (1, 'In Progress'),
(2, 'Placed'),
(2, 'Complete'),
(3, 'Placed');

INSERT INTO order_items (order_id, product_id)
VALUES (1, 3),
(1, 5),
(1, 6),
(1, 8),
(2, 2),
(2, 5),
(2, 7),
(3, 4),
(3, 2),
(3, 5),
(3, 5),
(3, 6),
(3, 10),
(3, 9),
(4, 1),
(4, 5);