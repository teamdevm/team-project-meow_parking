--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

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
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    name character varying NOT NULL,
    region integer NOT NULL
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.cities ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: free_places_count; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.free_places_count (
    id integer NOT NULL,
    id_parking integer NOT NULL,
    amount_free_places integer NOT NULL
);


ALTER TABLE public.free_places_count OWNER TO postgres;

--
-- Name: free_places_count_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.free_places_count ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.free_places_count_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: parkings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.parkings (
    id integer NOT NULL,
    city integer NOT NULL,
    street integer NOT NULL,
    latitude character varying NOT NULL,
    longitude character varying NOT NULL,
    link_to_maps character varying NOT NULL
);


ALTER TABLE public.parkings OWNER TO postgres;

--
-- Name: parkings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.parkings ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.parkings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: regions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.regions (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.regions OWNER TO postgres;

--
-- Name: regions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.regions ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.regions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: streets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.streets (
    id integer NOT NULL,
    name character varying NOT NULL,
    city integer NOT NULL
);


ALTER TABLE public.streets OWNER TO postgres;

--
-- Name: streets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.streets ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.streets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (id, name, region) FROM stdin;
1	Пермь	1
2	Березники	1
\.


--
-- Data for Name: free_places_count; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.free_places_count (id, id_parking, amount_free_places) FROM stdin;
1	1	20
\.


--
-- Data for Name: parkings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.parkings (id, city, street, latitude, longitude, link_to_maps) FROM stdin;
1	1	1	55.87	88.99	link
\.


--
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.regions (id, name) FROM stdin;
1	Пермский край
2	Удмуртия
\.


--
-- Data for Name: streets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.streets (id, name, city) FROM stdin;
2	Ленина	1
1	ПУШКИНА	1
\.


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cities_id_seq', 2, true);


--
-- Name: free_places_count_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.free_places_count_id_seq', 1, true);


--
-- Name: parkings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.parkings_id_seq', 1, true);


--
-- Name: regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.regions_id_seq', 2, true);


--
-- Name: streets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.streets_id_seq', 3, true);


--
-- Name: cities cities_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pk PRIMARY KEY (id);


--
-- Name: free_places_count free_places_count_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.free_places_count
    ADD CONSTRAINT free_places_count_pk PRIMARY KEY (id);


--
-- Name: parkings parkings_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parkings
    ADD CONSTRAINT parkings_pk PRIMARY KEY (id);


--
-- Name: regions regions_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pk PRIMARY KEY (id);


--
-- Name: streets streets_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.streets
    ADD CONSTRAINT streets_pk PRIMARY KEY (id);


--
-- Name: cities cities_regions_null_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_regions_null_fk FOREIGN KEY (region) REFERENCES public.regions(id);


--
-- Name: free_places_count free_places_count_parkings_null_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.free_places_count
    ADD CONSTRAINT free_places_count_parkings_null_fk FOREIGN KEY (id_parking) REFERENCES public.parkings(id);


--
-- Name: parkings parkings_cities_null_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parkings
    ADD CONSTRAINT parkings_cities_null_fk FOREIGN KEY (city) REFERENCES public.cities(id);


--
-- Name: parkings parkings_streets_null_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parkings
    ADD CONSTRAINT parkings_streets_null_fk FOREIGN KEY (street) REFERENCES public.streets(id);


--
-- Name: streets streets_cities_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.streets
    ADD CONSTRAINT streets_cities_id_fk FOREIGN KEY (city) REFERENCES public.cities(id);


--
-- PostgreSQL database dump complete
--

