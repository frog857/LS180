-- 1

ALTER TABLE books_categories
  ALTER COLUMN book_id SET NOT NULL;

ALTER TABLE books_categories
  ALTER COLUMN category_id SET NOT NULL;  

ALTER TABLE books_categories 
  DROP CONSTRAINT books_categories_book_id_fkey,
  ADD CONSTRAINT books_categories_book_id_fkey
  FOREIGN KEY ("book_id")
  REFERENCES books(id)
  ON DELETE CASCADE;

ALTER TABLE books_categories 
  DROP CONSTRAINT books_categories_category_id_fkey,
  ADD CONSTRAINT books_categories_category_id_fkey
  FOREIGN KEY ("category_id")
  REFERENCES categories(id)
  ON DELETE CASCADE;
  
-- 2 

SELECT books.id, author, string_agg((categories.name), ', ') AS categories
FROM books_categories
  JOIN books ON books_categories.book_id = books.id
  JOIN categories ON books_categories.category_id = categories.id
  GROUP BY books.id
  ORDER BY books.id ASC;

--3
ALTER TABLE books 
  ALTER COLUMN title TYPE text;

-- 1st book
INSERT INTO books (author, title) 
VALUES ('Lynn Sherr', 'Sally Ride: America''s First Woman in Space');

INSERT INTO categories (name) VALUES ('Space Exploration');

INSERT INTO books_categories (book_id, category_id)
VALUES (4, 1), (4, 5), (4, 7);

-- 2nd book
INSERT INTO books (title, author) VALUES ('Jane Eyre', 'Charlotte Brontë');
INSERT INTO books_categories VALUES (5, 2);
INSERT INTO books_categories VALUES (5, 4);

-- 3rd book
INSERT INTO books (title, author) VALUES ('Vij''s: Elegant and Inspired Indian Cuisine', 'Meeru Dhalwala and Vikram Vij');
INSERT INTO categories (name) VALUES ('Cookbook');
INSERT INTO categories (name) VALUES ('South Asia');
INSERT INTO books_categories VALUES (6, 1);
INSERT INTO books_categories VALUES (6, 8);
INSERT INTO books_categories VALUES (6, 9);

-- Question 4: Add a unique constrinat to the COMBINATION of the two join table FKs
ALTER TABLE books_categories ADD UNIQUE (book_id, category_id);
  -- Not this: ADD CONSTRAINT books_categories_unique 

-- 5

SELECT categories.name, 
  count(books_categories.book_id) AS book_count, -- OR count(books.id) ... simpler
  string_agg(books.title, ', ') AS book_titles
FROM books_categories
  JOIN books ON books_categories.book_id = books.id
  JOIN categories ON books_categories.category_id = categories.id
GROUP BY categories.name
ORDER BY categories.name;

