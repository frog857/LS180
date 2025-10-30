--
-- PostgreSQL database cluster dump
--

\restrict 2RQdA0x03fvnFEe17ndJw6nrwAe9bMMKgfzYBccN0dRV7b9MMHN1zmm1bUKlAPh

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE codespace;
ALTER ROLE codespace WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;

--
-- User Configurations
--








\unrestrict 2RQdA0x03fvnFEe17ndJw6nrwAe9bMMKgfzYBccN0dRV7b9MMHN1zmm1bUKlAPh

--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

\restrict RVWChdeNEaqtwJODptEeAzIy5xFeNAJm8UeLi2raFIgakbjMZxVqoYv1Uz4Qm1X

-- Dumped from database version 16.10 (Ubuntu 16.10-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.10 (Ubuntu 16.10-0ubuntu0.24.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

\unrestrict RVWChdeNEaqtwJODptEeAzIy5xFeNAJm8UeLi2raFIgakbjMZxVqoYv1Uz4Qm1X

--
-- Database "codespace" dump
--

--
-- PostgreSQL database dump
--

\restrict 5wSjtVZJRxZbCWVKFnFwOTZ0HtsjfQTMAWI7Z1weS6fZLgp8ZmmwItW1UnqAHhT

-- Dumped from database version 16.10 (Ubuntu 16.10-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.10 (Ubuntu 16.10-0ubuntu0.24.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: codespace; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE codespace WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C.UTF-8';


ALTER DATABASE codespace OWNER TO postgres;

\unrestrict 5wSjtVZJRxZbCWVKFnFwOTZ0HtsjfQTMAWI7Z1weS6fZLgp8ZmmwItW1UnqAHhT
\connect codespace
\restrict 5wSjtVZJRxZbCWVKFnFwOTZ0HtsjfQTMAWI7Z1weS6fZLgp8ZmmwItW1UnqAHhT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

\unrestrict 5wSjtVZJRxZbCWVKFnFwOTZ0HtsjfQTMAWI7Z1weS6fZLgp8ZmmwItW1UnqAHhT

--
-- Database "encyclopedia" dump
--

--
-- PostgreSQL database dump
--

\restrict 8P36sJS1VSlTHSnDixULIcQeXHwJooZ9AUVfwSMy5lEc0CL3Qykd4icQtm0DYPF

-- Dumped from database version 16.10 (Ubuntu 16.10-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.10 (Ubuntu 16.10-0ubuntu0.24.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: encyclopedia; Type: DATABASE; Schema: -; Owner: codespace
--

CREATE DATABASE encyclopedia WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C.UTF-8';


ALTER DATABASE encyclopedia OWNER TO codespace;

\unrestrict 8P36sJS1VSlTHSnDixULIcQeXHwJooZ9AUVfwSMy5lEc0CL3Qykd4icQtm0DYPF
\connect encyclopedia
\restrict 8P36sJS1VSlTHSnDixULIcQeXHwJooZ9AUVfwSMy5lEc0CL3Qykd4icQtm0DYPF

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: animals; Type: TABLE; Schema: public; Owner: codespace
--

CREATE TABLE public.animals (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    binomial_name character varying(100) NOT NULL,
    max_weight_kg numeric(10,4),
    max_age_years integer,
    conservation_status character(2)
);


ALTER TABLE public.animals OWNER TO codespace;

--
-- Name: animals_id_seq; Type: SEQUENCE; Schema: public; Owner: codespace
--

CREATE SEQUENCE public.animals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.animals_id_seq OWNER TO codespace;

--
-- Name: animals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: codespace
--

ALTER SEQUENCE public.animals_id_seq OWNED BY public.animals.id;


--
-- Name: celebrities; Type: TABLE; Schema: public; Owner: codespace
--

CREATE TABLE public.celebrities (
    id integer NOT NULL,
    first_name character varying(80) NOT NULL,
    occupation character varying(150),
    date_of_birth date NOT NULL,
    deceased boolean DEFAULT false,
    last_name character varying(100)
);


ALTER TABLE public.celebrities OWNER TO codespace;

--
-- Name: countries; Type: TABLE; Schema: public; Owner: codespace
--

CREATE TABLE public.countries (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    capital character varying(50) NOT NULL,
    population integer
);


ALTER TABLE public.countries OWNER TO codespace;

--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: codespace
--

CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.countries_id_seq OWNER TO codespace;

--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: codespace
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;


--
-- Name: famous_people_id_seq; Type: SEQUENCE; Schema: public; Owner: codespace
--

CREATE SEQUENCE public.famous_people_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.famous_people_id_seq OWNER TO codespace;

--
-- Name: famous_people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: codespace
--

ALTER SEQUENCE public.famous_people_id_seq OWNED BY public.celebrities.id;


--
-- Name: animals id; Type: DEFAULT; Schema: public; Owner: codespace
--

ALTER TABLE ONLY public.animals ALTER COLUMN id SET DEFAULT nextval('public.animals_id_seq'::regclass);


--
-- Name: celebrities id; Type: DEFAULT; Schema: public; Owner: codespace
--

ALTER TABLE ONLY public.celebrities ALTER COLUMN id SET DEFAULT nextval('public.famous_people_id_seq'::regclass);


--
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: codespace
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- Data for Name: animals; Type: TABLE DATA; Schema: public; Owner: codespace
--

COPY public.animals (id, name, binomial_name, max_weight_kg, max_age_years, conservation_status) FROM stdin;
1	Dove	Columbidae Columbiformes	2.0000	15	LC
2	Golden Eagle	Aquila Chrysaetos	6.3500	24	LC
3	Peregrine Falcon	Falco Peregrinus	1.5000	15	LC
4	Pigeon	Columbidae Columbiformes	2.0000	15	LC
5	Kakapo	Strigops habroptila	4.0000	60	CR
\.


--
-- Data for Name: celebrities; Type: TABLE DATA; Schema: public; Owner: codespace
--

COPY public.celebrities (id, first_name, occupation, date_of_birth, deceased, last_name) FROM stdin;
1	Bruce	singer-songwriter	1949-09-23	f	Springsteen
2	Scarlett	Actress	1984-11-22	f	Johansson
3	Frank	Singer, Actor	1915-12-12	t	Sinatra
4	Tom	Actor	1962-07-03	f	Cruise
5	Madonna	Singer, Actress	1958-08-16	f	\N
6	Prince	Singer, Songwriter, Musician, Actor	1958-06-07	t	\N
7	Elvis	Singer, Musician, Actor	1935-08-01	\N	Presley
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: codespace
--

COPY public.countries (id, name, capital, population) FROM stdin;
1	France	Paris	67158000
2	USA	Washington D.C.	325365189
3	Germany	Berlin	82349400
4	Japan	Tokyo	126672000
\.


--
-- Name: animals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: codespace
--

SELECT pg_catalog.setval('public.animals_id_seq', 5, true);


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: codespace
--

SELECT pg_catalog.setval('public.countries_id_seq', 4, true);


--
-- Name: famous_people_id_seq; Type: SEQUENCE SET; Schema: public; Owner: codespace
--

SELECT pg_catalog.setval('public.famous_people_id_seq', 7, true);


--
-- Name: countries countries_name_key; Type: CONSTRAINT; Schema: public; Owner: codespace
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_name_key UNIQUE (name);


--
-- PostgreSQL database dump complete
--

\unrestrict 8P36sJS1VSlTHSnDixULIcQeXHwJooZ9AUVfwSMy5lEc0CL3Qykd4icQtm0DYPF

--
-- Database "ls_burger" dump
--

--
-- PostgreSQL database dump
--

\restrict 2jSEo0I9JpUd4T8hu0dnYPQtrmEeKkVxjJ8lTXR2NedDFI9rKQof8UbJ6sfdiJS

-- Dumped from database version 16.10 (Ubuntu 16.10-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.10 (Ubuntu 16.10-0ubuntu0.24.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: ls_burger; Type: DATABASE; Schema: -; Owner: codespace
--

CREATE DATABASE ls_burger WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C.UTF-8';


ALTER DATABASE ls_burger OWNER TO codespace;

\unrestrict 2jSEo0I9JpUd4T8hu0dnYPQtrmEeKkVxjJ8lTXR2NedDFI9rKQof8UbJ6sfdiJS
\connect ls_burger
\restrict 2jSEo0I9JpUd4T8hu0dnYPQtrmEeKkVxjJ8lTXR2NedDFI9rKQof8UbJ6sfdiJS

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: codespace
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    customer_name character varying(100) NOT NULL,
    burger character varying(50),
    side character varying(50),
    drink character varying(50),
    customer_email character varying(50),
    customer_loyalty_points integer DEFAULT 0,
    burger_cost numeric(4,2) DEFAULT 0,
    side_cost numeric(4,2) DEFAULT 0,
    drink_cost numeric(4,2) DEFAULT 0
);


ALTER TABLE public.orders OWNER TO codespace;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: codespace
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO codespace;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: codespace
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: codespace
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: codespace
--

COPY public.orders (id, customer_name, burger, side, drink, customer_email, customer_loyalty_points, burger_cost, side_cost, drink_cost) FROM stdin;
1	James Bergman	LS Chicken Burger	Fries	Cola	james1998@email.com	28	4.50	0.99	1.50
2	Natasha O'Shea	LS Cheeseburger	Fries	\N	natasha@osheafamily.com	18	3.50	0.99	0.00
3	Natasha O'Shea	LS Double Deluxe Burger	Onion Rings	Chocolate Shake	natasha@osheafamily.com	42	6.00	1.50	2.00
4	Aaron Muller	LS Burger	\N	\N	\N	10	3.00	0.00	0.00
\.


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: codespace
--

SELECT pg_catalog.setval('public.orders_id_seq', 4, true);


--
-- PostgreSQL database dump complete
--

\unrestrict 2jSEo0I9JpUd4T8hu0dnYPQtrmEeKkVxjJ8lTXR2NedDFI9rKQof8UbJ6sfdiJS

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

\restrict lSS1gzfKZLdj1Yl9PBJBe6Df4th9EbarWL12Uf90WRGWfBeaRMSCVaMzxyefscF

-- Dumped from database version 16.10 (Ubuntu 16.10-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.10 (Ubuntu 16.10-0ubuntu0.24.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

\unrestrict lSS1gzfKZLdj1Yl9PBJBe6Df4th9EbarWL12Uf90WRGWfBeaRMSCVaMzxyefscF

--
-- Database "sql-book" dump
--

--
-- PostgreSQL database dump
--

\restrict EzKTIAlYYbmZkiX8Wxc1Wg3Tf0D0mg0yO5FyjLpVptbKvBdAox3WyVJuoxvHmjY

-- Dumped from database version 16.10 (Ubuntu 16.10-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.10 (Ubuntu 16.10-0ubuntu0.24.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: sql-book; Type: DATABASE; Schema: -; Owner: codespace
--

CREATE DATABASE "sql-book" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C.UTF-8';


ALTER DATABASE "sql-book" OWNER TO codespace;

\unrestrict EzKTIAlYYbmZkiX8Wxc1Wg3Tf0D0mg0yO5FyjLpVptbKvBdAox3WyVJuoxvHmjY
\encoding SQL_ASCII
\connect -reuse-previous=on "dbname='sql-book'"
\restrict EzKTIAlYYbmZkiX8Wxc1Wg3Tf0D0mg0yO5FyjLpVptbKvBdAox3WyVJuoxvHmjY

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

\unrestrict EzKTIAlYYbmZkiX8Wxc1Wg3Tf0D0mg0yO5FyjLpVptbKvBdAox3WyVJuoxvHmjY

--
-- PostgreSQL database cluster dump complete
--

