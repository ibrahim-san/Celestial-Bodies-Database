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
    diameter_in_lightyears integer,
    hubble_stage integer,
    has_supermassive_blackhole boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_in_km integer,
    distance_from_planet_in_km integer,
    mass_in_tonnes integer,
    planet_orbital_cycle_in_years integer,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_in_km numeric,
    distance_from_star_in_km integer,
    star_orbital_cycle_in_years integer,
    has_moon boolean,
    mass_in_megatonnes integer,
    contains_water boolean,
    surface__description text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: solar_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.solar_system (
    solar_system_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_in_km integer,
    number_of_planets integer,
    multiple_star_system boolean
);


ALTER TABLE public.solar_system OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_in_km integer,
    surface_temperature_in_kelvin integer,
    mass_in_megatonnes integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1000, 3, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 220000, 2, true);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 50000, 0, true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 60000, 5, true);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 100000, 1, true);
INSERT INTO public.galaxy VALUES (6, 'Triangulum', 60000, 5, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 3200, 8900, 2000, 0, 1);
INSERT INTO public.moon VALUES (2, 'moon', 3200, 8900, 2000, 0, 1);
INSERT INTO public.moon VALUES (3, 'moon', 3200, 8900, 2000, 0, 1);
INSERT INTO public.moon VALUES (4, 'moon', 3200, 8900, 2000, 0, 1);
INSERT INTO public.moon VALUES (5, 'moon', 3200, 8900, 2000, 0, 1);
INSERT INTO public.moon VALUES (6, 'moon', 3200, 8900, 2000, 0, 1);
INSERT INTO public.moon VALUES (7, 'moon', 3200, 8900, 2000, 0, 1);
INSERT INTO public.moon VALUES (8, 'moon', 3200, 8900, 2000, 0, 1);
INSERT INTO public.moon VALUES (9, 'moon', 3200, 8900, 2000, 0, 1);
INSERT INTO public.moon VALUES (10, 'moon', 3200, 8900, 2000, 0, 1);
INSERT INTO public.moon VALUES (11, 'moon', 3200, 8900, 2000, 0, 1);
INSERT INTO public.moon VALUES (12, 'moon', 3200, 8900, 2000, 0, 1);
INSERT INTO public.moon VALUES (13, 'moon', 3200, 8900, 2000, 0, 1);
INSERT INTO public.moon VALUES (14, 'moon', 3200, 8900, 2000, 0, 1);
INSERT INTO public.moon VALUES (15, 'moon', 3200, 8900, 2000, 0, 1);
INSERT INTO public.moon VALUES (16, 'moon', 3200, 8900, 2000, 0, 1);
INSERT INTO public.moon VALUES (17, 'moon', 3200, 8900, 2000, 0, 1);
INSERT INTO public.moon VALUES (18, 'moon', 3200, 8900, 2000, 0, 1);
INSERT INTO public.moon VALUES (19, 'moon', 3200, 8900, 2000, 0, 1);
INSERT INTO public.moon VALUES (20, 'moon', 3200, 8900, 2000, 0, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 6500, 149, 1, true, 5271, true, 'Little blue sphere that humans call home', 1);
INSERT INTO public.planet VALUES (2, 'Mercury', 6500, 149, 1, true, 5271, true, 'Other Planet', 1);
INSERT INTO public.planet VALUES (3, 'Venus', 6500, 149, 1, true, 5271, true, 'Other Planet', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 6500, 149, 1, true, 5271, true, 'Other Planet', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 6500, 149, 1, true, 5271, true, 'Other Planet', 1);
INSERT INTO public.planet VALUES (6, 'Uranus', 6500, 149, 1, true, 5271, true, 'Other Planet', 1);
INSERT INTO public.planet VALUES (7, 'Saturn', 6500, 149, 1, true, 5271, true, 'Other Planet', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 6500, 149, 1, true, 5271, true, 'Other Planet', 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 6500, 149, 1, true, 5271, true, 'Other Planet', 1);
INSERT INTO public.planet VALUES (10, 'Glornark', 6500, 149, 1, true, 5271, true, 'Other Planet', 1);
INSERT INTO public.planet VALUES (11, 'Jimbletron', 6500, 149, 1, true, 5271, true, 'Other Planet', 3);
INSERT INTO public.planet VALUES (12, 'honkersvane', 6500, 149, 1, true, 5271, true, 'Other Planet', 3);


--
-- Data for Name: solar_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.solar_system VALUES (1, 'Solar System', 1000, 9, false);
INSERT INTO public.solar_system VALUES (2, 'Alt Solar System', 1000, 9, false);
INSERT INTO public.solar_system VALUES (3, 'Altern Solar System', 1000, 9, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1391000, 5778, 1989);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 198900, 3042, 8);
INSERT INTO public.star VALUES (3, 'Andromeda Star', 1400000, 7500, 8000);
INSERT INTO public.star VALUES (4, 'Whirlpool Star', 1500000, 8000, 1200);
INSERT INTO public.star VALUES (5, 'Centaur Star', 1130000, 6200, 700);
INSERT INTO public.star VALUES (6, 'Sombrero Star', 1790000, 9000, 1200);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 1, false);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 1, false);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 1, false);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: solar_system solar_system_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_name_key UNIQUE (name);


--
-- Name: solar_system solar_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_pkey PRIMARY KEY (solar_system_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_id UNIQUE (galaxy_id);


--
-- Name: planet unique_id1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_id1 UNIQUE (planet_id);


--
-- Name: star unique_id2; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_id2 UNIQUE (star_id);


--
-- Name: moon unique_id3; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_id3 UNIQUE (moon_id);


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
-- PostgreSQL database dump complete
--

