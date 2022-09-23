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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    number_of_stars integer,
    size_in_lightyears integer,
    galaxy_type character varying(30)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_cluster; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_cluster (
    galaxy_cluster_id integer NOT NULL,
    name character varying(30) NOT NULL,
    number_of_galaxies integer
);


ALTER TABLE public.galaxy_cluster OWNER TO freecodecamp;

--
-- Name: galaxy_cluster_galaxy_cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_cluster_galaxy_cluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_cluster_galaxy_cluster_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_cluster_galaxy_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_cluster_galaxy_cluster_id_seq OWNED BY public.galaxy_cluster.galaxy_cluster_id;


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    length_lunar_cycle integer,
    listens_to_lovers boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    year_length_in_days numeric(5,1),
    description text,
    has_life boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size_km integer,
    number_of_planets integer,
    galaxy_id integer,
    visible_at_night boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_cluster galaxy_cluster_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_cluster ALTER COLUMN galaxy_cluster_id SET DEFAULT nextval('public.galaxy_cluster_galaxy_cluster_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (5, 'Andromeda', 245000, 220000, 'Spiral');
INSERT INTO public.galaxy VALUES (6, 'UGC 8508', 145000, 20000, 'Elliptical');
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 52850, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Draco II', 20000, 120, 'Dwarf');
INSERT INTO public.galaxy VALUES (3, 'Tucana III', 45000, 220, 'Dwarf');
INSERT INTO public.galaxy VALUES (4, 'Ursa Major II', 145000, 1800, 'Irregular');


--
-- Data for Name: galaxy_cluster; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_cluster VALUES (1, 'Virgo Supercluster', 100);
INSERT INTO public.galaxy_cluster VALUES (2, 'Coma', 1000);
INSERT INTO public.galaxy_cluster VALUES (3, 'Bullet', 40);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 1, 24, true);
INSERT INTO public.moon VALUES (2, 'Deimos', 4, 20, false);
INSERT INTO public.moon VALUES (3, 'Phoebos', 4, 12, false);
INSERT INTO public.moon VALUES (4, 'lo', 5, 45, true);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 87, false);
INSERT INTO public.moon VALUES (6, 'Genymede', 5, 78, false);
INSERT INTO public.moon VALUES (7, 'Calisto', 5, 45, false);
INSERT INTO public.moon VALUES (8, 'Dia', 5, 54, false);
INSERT INTO public.moon VALUES (9, 'Cyllene', 5, 89, false);
INSERT INTO public.moon VALUES (10, 'Ersa', 5, 76, true);
INSERT INTO public.moon VALUES (11, 'Enceladus', 6, 89, false);
INSERT INTO public.moon VALUES (12, 'Titan', 6, 87, true);
INSERT INTO public.moon VALUES (13, 'Charon', 9, 20, false);
INSERT INTO public.moon VALUES (14, 'Neso', 8, 12, false);
INSERT INTO public.moon VALUES (15, 'Juliet', 5, 45, true);
INSERT INTO public.moon VALUES (16, 'Cressida', 7, 34, false);
INSERT INTO public.moon VALUES (17, 'Francisco', 7, 78, false);
INSERT INTO public.moon VALUES (18, 'Caliban', 7, 45, false);
INSERT INTO public.moon VALUES (19, 'Bianca', 7, 54, false);
INSERT INTO public.moon VALUES (20, 'Ariel', 7, 49, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 365.0, 'This is our home planet, only know planet to support life', true, 1);
INSERT INTO public.planet VALUES (2, 'Mercury', 88.0, 'nearest to the sun', false, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 225.0, 'hottest in the solar system', false, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 401.0, 'Also called Red planet', false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4912.0, 'Largest planet in the solar system', false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 8434.0, 'It has ring made of ice', false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 2424.0, 'It emits x-rays', false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 5000.0, 'furthest planet from the sun', false, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 9893.0, 'It is a dwarf planet', false, 1);
INSERT INTO public.planet VALUES (10, 'Julius I', 492.0, NULL, false, 3);
INSERT INTO public.planet VALUES (11, 'Padora', 844.0, NULL, false, 3);
INSERT INTO public.planet VALUES (12, 'Alpha cent I', 224.0, NULL, false, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1300000, 9, 1, false);
INSERT INTO public.star VALUES (2, 'Promixa Centauri', 50000, 1, 1, true);
INSERT INTO public.star VALUES (3, 'Sirius', 500000, 2, 1, true);
INSERT INTO public.star VALUES (4, 'Alpha Centauri', 75000, 3, 1, true);
INSERT INTO public.star VALUES (5, 'Rokis', 175000, 6, 5, false);
INSERT INTO public.star VALUES (6, 'Memfis', 575000, 26, 2, false);


--
-- Name: galaxy_cluster_galaxy_cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_cluster_galaxy_cluster_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy_cluster galaxy_cluster_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_cluster
    ADD CONSTRAINT galaxy_cluster_name_key UNIQUE (name);


--
-- Name: galaxy_cluster galaxy_cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_cluster
    ADD CONSTRAINT galaxy_cluster_pkey PRIMARY KEY (galaxy_cluster_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

