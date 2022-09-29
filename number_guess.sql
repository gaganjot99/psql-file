--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(30) NOT NULL,
    games_played integer,
    least_tries integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'josh', 6, 9);
INSERT INTO public.users VALUES (4, 'user_1664435609861', 2, 124);
INSERT INTO public.users VALUES (3, 'user_1664435609862', 5, 146);
INSERT INTO public.users VALUES (28, 'user_1664436469022', 2, 195);
INSERT INTO public.users VALUES (6, 'user_1664435746382', 2, 321);
INSERT INTO public.users VALUES (27, 'user_1664436469023', 5, 175);
INSERT INTO public.users VALUES (5, 'user_1664435746383', 5, 45);
INSERT INTO public.users VALUES (2, 'jane', 1, 8);
INSERT INTO public.users VALUES (8, 'user_1664435897199', 2, 690);
INSERT INTO public.users VALUES (30, 'user_1664436522413', 2, 242);
INSERT INTO public.users VALUES (7, 'user_1664435897200', 5, 244);
INSERT INTO public.users VALUES (9, 'jaky', 0, 999);
INSERT INTO public.users VALUES (10, 'gio', 1, 4);
INSERT INTO public.users VALUES (11, 'uio', 1, 1);
INSERT INTO public.users VALUES (12, 'kio', 1, 1);
INSERT INTO public.users VALUES (13, 'dsl', 1, 1);
INSERT INTO public.users VALUES (14, 'uixs', 1, 1);
INSERT INTO public.users VALUES (15, '873', 1, 3);
INSERT INTO public.users VALUES (16, 'lasfi', 1, 1);
INSERT INTO public.users VALUES (17, 'sldf', 1, 4);
INSERT INTO public.users VALUES (18, 'slci', 1, 3);
INSERT INTO public.users VALUES (19, 'lsdfj', 1, 4);
INSERT INTO public.users VALUES (29, 'user_1664436522414', 5, 30);
INSERT INTO public.users VALUES (21, 'user_1664436246662', 2, 207);
INSERT INTO public.users VALUES (20, 'user_1664436246663', 5, 159);
INSERT INTO public.users VALUES (22, 'muic', 1, 2);
INSERT INTO public.users VALUES (24, 'user_1664436297255', 2, 46);
INSERT INTO public.users VALUES (32, 'user_1664436547095', 2, 276);
INSERT INTO public.users VALUES (23, 'user_1664436297256', 5, 20);
INSERT INTO public.users VALUES (31, 'user_1664436547096', 5, 271);
INSERT INTO public.users VALUES (26, 'user_1664436383888', 2, 389);
INSERT INTO public.users VALUES (25, 'user_1664436383889', 5, 31);
INSERT INTO public.users VALUES (34, 'user_1664436575109', 2, 302);
INSERT INTO public.users VALUES (33, 'user_1664436575110', 5, 10);
INSERT INTO public.users VALUES (36, 'user_1664436608293', 2, 278);
INSERT INTO public.users VALUES (35, 'user_1664436608294', 5, 47);
INSERT INTO public.users VALUES (38, 'user_1664436630429', 2, 375);
INSERT INTO public.users VALUES (37, 'user_1664436630430', 5, 155);
INSERT INTO public.users VALUES (40, 'user_1664436643694', 2, 244);
INSERT INTO public.users VALUES (39, 'user_1664436643695', 5, 167);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 40, true);


--
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

