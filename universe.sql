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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    symbol character varying(30),
    description text,
    declination character varying(50)
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(30),
    scientific_name character varying(30),
    distance_from_earth_in_light_years integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    distance_from_planet_in_km integer,
    diameter_in_km integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer,
    days_to_go_around_star integer,
    is_habitable boolean,
    is_visible_from_earth boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    constellation_id integer,
    solar_mass numeric(4,1)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Virgo', 'The Maiden', 'This would be a long description of this constellation and its zodiac sign.', '-4º');
INSERT INTO public.constellation VALUES (2, 'Andromeda', 'The Chained Woman', 'This would be a long description of this constellation and its zodiac sign.', '53.18º - 21.67º');
INSERT INTO public.constellation VALUES (3, 'Cancer', 'The Crab', 'This would be a long description of this constellation and its zodiac sign.', '33.14º - 6.47º');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'spiral', 'Messier 31', 2500000);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'spiral', NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Virgo A', 'elliptical', 'Messier 87', 55000000);
INSERT INTO public.galaxy VALUES (4, 'Cygnus A', 'radio', '3C 405', 500000000);
INSERT INTO public.galaxy VALUES (5, 'Maffei I', 'elliptical', NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'satellite', 'LMC', 163000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 384400, 3476);
INSERT INTO public.moon VALUES (2, 'Deimos', 4, 23460, 8);
INSERT INTO public.moon VALUES (3, 'Phobos', 4, 29270, 28);
INSERT INTO public.moon VALUES (4, 'Adrastea', 5, 128980, 26);
INSERT INTO public.moon VALUES (5, 'Callisto', 5, 188300, 4800);
INSERT INTO public.moon VALUES (6, 'Carpo', 5, 17100000, 3);
INSERT INTO public.moon VALUES (7, 'Cyllene', 5, 24000000, 2);
INSERT INTO public.moon VALUES (8, 'Elara', 5, 11000000, 80);
INSERT INTO public.moon VALUES (9, 'Eukelade', 5, 25000000, 4);
INSERT INTO public.moon VALUES (10, 'Europa', 5, 676000, 3126);
INSERT INTO public.moon VALUES (11, 'Hegemone', 5, 24000000, 3);
INSERT INTO public.moon VALUES (12, 'Helike', 5, 11000000, 3);
INSERT INTO public.moon VALUES (13, 'Himalia', 5, 11480000, 140);
INSERT INTO public.moon VALUES (14, 'Io', 5, 421000, 3629);
INSERT INTO public.moon VALUES (15, 'Kallichore', 5, 22000000, 2);
INSERT INTO public.moon VALUES (16, 'Kore', 5, 24457000, 780);
INSERT INTO public.moon VALUES (17, 'Leda', 5, 14782000, 210);
INSERT INTO public.moon VALUES (18, 'Metis', 5, 127980, 40);
INSERT INTO public.moon VALUES (19, 'Mneme', 5, 21500000, 2);
INSERT INTO public.moon VALUES (20, 'Sinope', 5, 23700000, 28);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 88, false, true);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 224, false, true);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 365, true, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 686, false, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 4329630, false, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 107518415, false, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 306674825, false, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 60152, false, true);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, 90498, false, false);
INSERT INTO public.planet VALUES (10, 'CoRoT-7b', 4, 1, false, false);
INSERT INTO public.planet VALUES (11, 'Kepler-444b', 5, 4, false, false);
INSERT INTO public.planet VALUES (12, 'Kepler-444c', 5, 5, false, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 2, NULL, 1.0);
INSERT INTO public.star VALUES (2, 'Kepler-11', 2, NULL, 1.0);
INSERT INTO public.star VALUES (3, 'Dimidium', 2, NULL, 0.5);
INSERT INTO public.star VALUES (4, 'CoRoT-7', 2, NULL, 0.9);
INSERT INTO public.star VALUES (5, 'Kepler-444', 2, NULL, 0.8);
INSERT INTO public.star VALUES (6, 'V-452', 2, NULL, 0.8);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: star star_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


