-- set up database

CREATE TABLE bidders (
  id serial PRIMARY KEY,
  name text NOT NULL
);

CREATE TABLE items (
  id serial PRIMARY KEY,
  name text NOT NULL,
  initial_price decimal(6, 2) NOT NULL CHECK (initial_price > 0.00 AND initial_price <= 1000.00),
  sales_price decimal(6, 2) CHECK (sales_price BETWEEN 0.01 AND  1000.00)
);

CREATE TABLE bids (
  id serial PRIMARY KEY,
  bidder_id int NOT NULL REFERENCES bidders(id) ON DELETE CASCADE,
  item_id int NOT NULL REFERENCES items(id) ON DELETE CASCADE,
  amount decimal(6, 2) NOT NULL CHECK (amount BETWEEN 0.01 AND 1000.00)
  -- UNIQUE (bidder_id, item_id) -- don't need this because one bidder must be able to make multiple bids
);

CREATE INDEX ON bids (bidder_id, item_id);

-- use \copy to load in csv files ! PostGre Documentation for details

\copy bidders FROM 'csv-files/bidders.csv' WITH (FORMAT csv, HEADER) -- run separately
\copy items FROM 'csv-files/items.csv' WITH (FORMAT csv, HEADER)
\copy bids FROM 'csv-files/bids.csv' WITH (FORMAT csv, HEADER)

--2 show all items that have bids on them

SELECT DISTINCT
name AS "bid on items",
item_id, bidder_id, bids.id
FROM items
  JOIN bids ON bids.bidder_id = bids.id;

SELECT DISTINCT
items.name AS "bid on items" FROM items 
WHERE items.id IN ( 
  SELECT item_id FROM bids -- subquery returns all item_id from bids
);

-- write query returning names of everyone who HAS bid on the auctions

SELECT name FROM bidders
WHERE EXISTS (
  SELECT * FROM bids WHERE bidder_id = bidders.id
);

-- find largest # of bids from an individual bidder

--my solution
SELECT * FROM (
  SELECT count(item_id) FROM bids
    GROUP BY bidder_id ORDER BY count(item_id) DESC
) LIMIT 1;

--ls solution
SELECT max(bid_counts.count) FROM (
  SELECT count(bidder_id) FROM bids
    GROUP BY bidder_id
) AS bid_counts;


-- find # of bids on each item using scalar subquery

SELECT name, (SELECT count(item_id) FROM bids GROUP BY item_id) FROM items; -- this is the wrong approach
SELECT count(item_id) FROM bids GROUP BY item_id; -- no group by

SELECT name, (SELECT count(*) FROM bids WHERE items.id = bids.item_id) FROM items; -- correct

SELECT name, count(bidder_id) FROM items
LEFT JOIN bids ON items.id = bids.item_id
GROUP BY name;

-- find id in item table with all data but id

SELECT * FROM items 
WHERE ROW('Painting', 100.00, 250.00) = (name, initial_price, sales_price);
