-- Create stars table
CREATE TABLE stars (
  id serial PRIMARY KEY,
  name varchar(25) UNIQUE NOT NULL,
  distance int NOT NULL CHECK (distance > 0),
  spectral_type char(1),
  companions int NOT NULL CHECK (companions >= 0)
);

-- Create planets table
CREATE TABLE planets (
  id serial PRIMARY KEY,
  designation char(1) UNIQUE,
  mass int
);

-- add star_id to planets table. 1S:MP
ALTER TABLE planets 
  ADD COLUMN star_id int NOT NULL REFERENCES stars (id);

-- allow longer star names
ALTER TABLE stars 
  ALTER COLUMN name TYPE varchar(50);

-- change datatype on distance
ALTER TABLE stars 
  ALTER COLUMN distance TYPE decimal;

-- Make spectral_type requires and only one of 'O', 'B', 'A', 'F', 'G', 'K', and 'M' values

ALTER TABLE stars 
  ALTER COLUMN spectral_type SET NOT NULL;

ALTER TABLE stars
  ADD CONSTRAINT spectral_type_set_values 
  CHECK (spectral_type IN ('O', 'B', 'A', 'F', 'G', 'K', 'M'));

-- Remove last check, use enumerated data types

ALTER TABLE stars
  DROP CONSTRAINT spectral_type_set_values;

CREATE TYPE spectral_type_type AS ENUM ('O', 'B', 'A', 'F', 'G', 'K', 'M');
ALTER TABLE stars
  ALTER COLUMN spectral_type TYPE spectral_type_type
  USING spectral_type::spectral_type_type; -- don't forget to cast

ALTER TYPE spectral_type_type RENAME TO spectral_type_enum;


-- change planet mass data type
ALTER TABLE planets
  ALTER COLUMN mass TYPE decimal,
  ALTER COLUMN mass SET NOT NULL,
  ADD CONSTRAINT positive_mass CHECK (mass > 0),
  ALTER COLUMN designation SET NOT NULL;

-- Add semi-major axis column
ALTER TABLE planets
  ADD COLUMN semi_major_axis decimal NOT NULL;


-- Add moons table to extrasolard

CREATE TABLE moons (
  id serial PRIMARY KEY,
  designation int NOT NULL CHECK (designation > 0),
  semi_major_axis decimal CHECK (semi_major_axis > 0),
  mass decimal CHECK (mass > 0),
  planet_id int NOT NULL REFERENCES planets (id)
);