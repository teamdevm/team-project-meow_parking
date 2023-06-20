--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-20 22:58:45

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
-- TOC entry 3415 (class 1262 OID 16398)
-- Name: parking_information; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE parking_information WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE parking_information OWNER TO postgres;

\connect parking_information

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
-- TOC entry 222 (class 1259 OID 16444)
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    name character varying NOT NULL,
    region integer NOT NULL
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16449)
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
-- TOC entry 224 (class 1259 OID 16450)
-- Name: free_places_count; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.free_places_count (
    id integer NOT NULL,
    id_parking integer NOT NULL,
    amount_free_places integer NOT NULL
);


ALTER TABLE public.free_places_count OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16453)
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
-- TOC entry 214 (class 1259 OID 16399)
-- Name: parking_management; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.parking_management (
    id_admin integer NOT NULL,
    id_parking integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.parking_management OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16402)
-- Name: parking_management_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.parking_management ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.parking_management_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 226 (class 1259 OID 16454)
-- Name: parkings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.parkings (
    id_p integer NOT NULL,
    city integer NOT NULL,
    street integer NOT NULL,
    latitude character varying NOT NULL,
    longitude character varying NOT NULL,
    link_to_maps character varying NOT NULL
);


ALTER TABLE public.parkings OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16459)
-- Name: parkings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.parkings ALTER COLUMN id_p ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.parkings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 228 (class 1259 OID 16460)
-- Name: regions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.regions (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.regions OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16465)
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
-- TOC entry 216 (class 1259 OID 16403)
-- Name: rights; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rights (
    id integer NOT NULL,
    name character varying NOT NULL,
    allowed_to character varying NOT NULL
);


ALTER TABLE public.rights OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16408)
-- Name: rights_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.rights ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.rights_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 218 (class 1259 OID 16409)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    role_name character varying NOT NULL,
    rights integer NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16414)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.roles ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 230 (class 1259 OID 16466)
-- Name: streets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.streets (
    id integer NOT NULL,
    name character varying NOT NULL,
    city integer NOT NULL
);


ALTER TABLE public.streets OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16471)
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
-- TOC entry 220 (class 1259 OID 16415)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    surname character varying NOT NULL,
    name character varying NOT NULL,
    fathername character varying,
    email character varying NOT NULL,
    ph_number character varying NOT NULL,
    role integer NOT NULL,
    password character varying NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16420)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 232 (class 1259 OID 16520)
-- Name: users_parkings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_parkings (
    id_user integer NOT NULL,
    id_parking integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.users_parkings OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16536)
-- Name: users_parkings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users_parkings ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.users_parkings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999
    CACHE 1
);


--
-- TOC entry 3398 (class 0 OID 16444)
-- Dependencies: 222
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cities (id, name, region) OVERRIDING SYSTEM VALUE VALUES (1, 'Пермь', 1);
INSERT INTO public.cities (id, name, region) OVERRIDING SYSTEM VALUE VALUES (2, 'Березники', 1);


--
-- TOC entry 3400 (class 0 OID 16450)
-- Dependencies: 224
-- Data for Name: free_places_count; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.free_places_count (id, id_parking, amount_free_places) OVERRIDING SYSTEM VALUE VALUES (1, 1, 19);


--
-- TOC entry 3390 (class 0 OID 16399)
-- Dependencies: 214
-- Data for Name: parking_management; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3402 (class 0 OID 16454)
-- Dependencies: 226
-- Data for Name: parkings; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.parkings (id_p, city, street, latitude, longitude, link_to_maps) OVERRIDING SYSTEM VALUE VALUES (1, 1, 1, '55.87', '88.99', 'link');


--
-- TOC entry 3404 (class 0 OID 16460)
-- Dependencies: 228
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.regions (id, name) OVERRIDING SYSTEM VALUE VALUES (1, 'Пермский край');
INSERT INTO public.regions (id, name) OVERRIDING SYSTEM VALUE VALUES (2, 'Удмуртия');


--
-- TOC entry 3392 (class 0 OID 16403)
-- Dependencies: 216
-- Data for Name: rights; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.rights (id, name, allowed_to) VALUES (1, 'read', 'читать');
INSERT INTO public.rights (id, name, allowed_to) VALUES (2, 'edit', 'менять');
INSERT INTO public.rights (id, name, allowed_to) VALUES (3, 'admin', 'все');


--
-- TOC entry 3394 (class 0 OID 16409)
-- Dependencies: 218
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.roles (id, role_name, rights) OVERRIDING SYSTEM VALUE VALUES (1, 'user', 1);
INSERT INTO public.roles (id, role_name, rights) OVERRIDING SYSTEM VALUE VALUES (2, 'owner', 2);
INSERT INTO public.roles (id, role_name, rights) OVERRIDING SYSTEM VALUE VALUES (3, 'admin', 3);


--
-- TOC entry 3406 (class 0 OID 16466)
-- Dependencies: 230
-- Data for Name: streets; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.streets (id, name, city) OVERRIDING SYSTEM VALUE VALUES (2, 'Ленина', 1);
INSERT INTO public.streets (id, name, city) OVERRIDING SYSTEM VALUE VALUES (1, 'ПУШКИНА', 1);


--
-- TOC entry 3396 (class 0 OID 16415)
-- Dependencies: 220
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (id, surname, name, fathername, email, ph_number, role, password) OVERRIDING SYSTEM VALUE VALUES (1, 'Еленовский', 'Сергей', 'Головач', 'gaga@mail.ru', '+79998887766', 1, '1111gaga');
INSERT INTO public.users (id, surname, name, fathername, email, ph_number, role, password) OVERRIDING SYSTEM VALUE VALUES (2, 'Головач', 'Сергей', 'Еленский', 'gaga@mail.ru', '+78889990011', 1, '1111gaga');
INSERT INTO public.users (id, surname, name, fathername, email, ph_number, role, password) OVERRIDING SYSTEM VALUE VALUES (3, ' ', 'John Doe', ' ', 'example@example.com', ' ', 1, '482c811da5d5b4bc6d497ffa98491e38');
INSERT INTO public.users (id, surname, name, fathername, email, ph_number, role, password) OVERRIDING SYSTEM VALUE VALUES (4, ' ', 'Johny Doe', ' ', 'example1@example.com', ' ', 1, '3108b60dc9a8b751ef7f72dfa146af0d');
INSERT INTO public.users (id, surname, name, fathername, email, ph_number, role, password) OVERRIDING SYSTEM VALUE VALUES (5, ' ', 'Johny Doe', ' ', 'example12@example.com', ' ', 1, 'fabda4bf353b03715e5f4de07aff183f');
INSERT INTO public.users (id, surname, name, fathername, email, ph_number, role, password) OVERRIDING SYSTEM VALUE VALUES (6, ' ', 'Johny Doe', ' ', '1example12@example.com', ' ', 1, '509a951c7b5f4dc1194f655fb8d9240b');
INSERT INTO public.users (id, surname, name, fathername, email, ph_number, role, password) OVERRIDING SYSTEM VALUE VALUES (7, ' ', 'Johny Doe', ' ', 'tester@example.com', ' ', 1, '509a951c7b5f4dc1194f655fb8d9240b');
INSERT INTO public.users (id, surname, name, fathername, email, ph_number, role, password) OVERRIDING SYSTEM VALUE VALUES (8, ' ', 'Johny Doe', ' ', 'tester2@example.com', ' ', 1, '509a951c7b5f4dc1194f655fb8d9240b');
INSERT INTO public.users (id, surname, name, fathername, email, ph_number, role, password) OVERRIDING SYSTEM VALUE VALUES (9, ' ', 'Johny Doe', ' ', 'tester3@example.com', ' ', 1, '8dfedd5a135ee79f48825140902b4b6d');
INSERT INTO public.users (id, surname, name, fathername, email, ph_number, role, password) OVERRIDING SYSTEM VALUE VALUES (10, ' ', 'Johny Doe', ' ', 'tester4@example.com', ' ', 1, '8dfedd5a135ee79f48825140902b4b6d');
INSERT INTO public.users (id, surname, name, fathername, email, ph_number, role, password) OVERRIDING SYSTEM VALUE VALUES (11, ' ', 'Johny Doe', ' ', 'tester5@example.com', ' ', 1, 'cda954cb5cae6029a38b174e7ca400f9');


--
-- TOC entry 3408 (class 0 OID 16520)
-- Dependencies: 232
-- Data for Name: users_parkings; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users_parkings (id_user, id_parking, id) VALUES (1, 1, 6);


--
-- TOC entry 3416 (class 0 OID 0)
-- Dependencies: 223
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cities_id_seq', 2, true);


--
-- TOC entry 3417 (class 0 OID 0)
-- Dependencies: 225
-- Name: free_places_count_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.free_places_count_id_seq', 1, true);


--
-- TOC entry 3418 (class 0 OID 0)
-- Dependencies: 215
-- Name: parking_management_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.parking_management_id_seq', 1, false);


--
-- TOC entry 3419 (class 0 OID 0)
-- Dependencies: 227
-- Name: parkings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.parkings_id_seq', 1, true);


--
-- TOC entry 3420 (class 0 OID 0)
-- Dependencies: 229
-- Name: regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.regions_id_seq', 2, true);


--
-- TOC entry 3421 (class 0 OID 0)
-- Dependencies: 217
-- Name: rights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rights_id_seq', 3, true);


--
-- TOC entry 3422 (class 0 OID 0)
-- Dependencies: 219
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 1, false);


--
-- TOC entry 3423 (class 0 OID 0)
-- Dependencies: 231
-- Name: streets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.streets_id_seq', 3, true);


--
-- TOC entry 3424 (class 0 OID 0)
-- Dependencies: 221
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 11, true);


--
-- TOC entry 3425 (class 0 OID 0)
-- Dependencies: 233
-- Name: users_parkings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_parkings_id_seq', 6, true);


--
-- TOC entry 3227 (class 2606 OID 16473)
-- Name: cities cities_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pk PRIMARY KEY (id);


--
-- TOC entry 3229 (class 2606 OID 16475)
-- Name: free_places_count free_places_count_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.free_places_count
    ADD CONSTRAINT free_places_count_pk PRIMARY KEY (id);


--
-- TOC entry 3219 (class 2606 OID 16422)
-- Name: parking_management parking_management_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parking_management
    ADD CONSTRAINT parking_management_pk PRIMARY KEY (id);


--
-- TOC entry 3231 (class 2606 OID 16477)
-- Name: parkings parkings_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parkings
    ADD CONSTRAINT parkings_pk PRIMARY KEY (id_p);


--
-- TOC entry 3233 (class 2606 OID 16479)
-- Name: regions regions_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pk PRIMARY KEY (id);


--
-- TOC entry 3221 (class 2606 OID 16424)
-- Name: rights rights_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rights
    ADD CONSTRAINT rights_pk PRIMARY KEY (id);


--
-- TOC entry 3223 (class 2606 OID 16426)
-- Name: roles roles_parking_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_parking_pk PRIMARY KEY (id);


--
-- TOC entry 3235 (class 2606 OID 16481)
-- Name: streets streets_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.streets
    ADD CONSTRAINT streets_pk PRIMARY KEY (id);


--
-- TOC entry 3237 (class 2606 OID 16535)
-- Name: users_parkings users_parkings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_parkings
    ADD CONSTRAINT users_parkings_pkey PRIMARY KEY (id);


--
-- TOC entry 3225 (class 2606 OID 16428)
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- TOC entry 3241 (class 2606 OID 16482)
-- Name: cities cities_regions_null_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_regions_null_fk FOREIGN KEY (region) REFERENCES public.regions(id);


--
-- TOC entry 3242 (class 2606 OID 16487)
-- Name: free_places_count free_places_count_parkings_null_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.free_places_count
    ADD CONSTRAINT free_places_count_parkings_null_fk FOREIGN KEY (id_parking) REFERENCES public.parkings(id_p);


--
-- TOC entry 3238 (class 2606 OID 16429)
-- Name: parking_management parking_management_users_null_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parking_management
    ADD CONSTRAINT parking_management_users_null_fk FOREIGN KEY (id_admin) REFERENCES public.users(id);


--
-- TOC entry 3243 (class 2606 OID 16492)
-- Name: parkings parkings_cities_null_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parkings
    ADD CONSTRAINT parkings_cities_null_fk FOREIGN KEY (city) REFERENCES public.cities(id);


--
-- TOC entry 3244 (class 2606 OID 16497)
-- Name: parkings parkings_streets_null_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parkings
    ADD CONSTRAINT parkings_streets_null_fk FOREIGN KEY (street) REFERENCES public.streets(id);


--
-- TOC entry 3239 (class 2606 OID 16434)
-- Name: roles roles_rights_null_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_rights_null_fk FOREIGN KEY (rights) REFERENCES public.rights(id);


--
-- TOC entry 3245 (class 2606 OID 16502)
-- Name: streets streets_cities_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.streets
    ADD CONSTRAINT streets_cities_id_fk FOREIGN KEY (city) REFERENCES public.cities(id);


--
-- TOC entry 3246 (class 2606 OID 16528)
-- Name: users_parkings users_parkings_id_parking_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_parkings
    ADD CONSTRAINT users_parkings_id_parking_fkey FOREIGN KEY (id_parking) REFERENCES public.parkings(id_p);


--
-- TOC entry 3247 (class 2606 OID 16523)
-- Name: users_parkings users_parkings_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_parkings
    ADD CONSTRAINT users_parkings_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.users(id);


--
-- TOC entry 3240 (class 2606 OID 16439)
-- Name: users users_roles_null_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_roles_null_fk FOREIGN KEY (role) REFERENCES public.roles(id);


-- Completed on 2023-06-20 22:58:45

--
-- PostgreSQL database dump complete
--

