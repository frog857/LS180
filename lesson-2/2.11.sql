--1

CREATE SEQUENCE films_id_seq;

ALTER TABLE films
  ADD COLUMN id int DEFAULT nextval('films_id_seq');

DROP SEQUENCE films_id_seq;

CREATE SEQUENCE menu_items_id INCREMENT BY 2 MINVALUE 2;


--6 

ALTER TABLE films ADD COLUMN id serial;
ALTER TABLE films ADD PRIMARY KEY (id);

--9

ALTER TABLE films DROP CONSTRAINT films_pkey;