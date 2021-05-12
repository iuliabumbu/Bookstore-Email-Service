--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

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
-- Name: address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.address (
    id character varying(255) NOT NULL,
    apartment character varying(255),
    city character varying(255),
    deleted character varying(255),
    number character varying(255),
    street character varying(255)
);


ALTER TABLE public.address OWNER TO postgres;

--
-- Name: admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin (
    id character varying(255) NOT NULL,
    password character varying(255),
    username character varying(255)
);


ALTER TABLE public.admin OWNER TO postgres;

--
-- Name: book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book (
    id character varying(255) NOT NULL,
    author character varying(255),
    deleted character varying(255),
    description character varying(600),
    image character varying(600),
    price real,
    promotion_price real,
    title character varying(255),
    genre_id character varying(255)
);


ALTER TABLE public.book OWNER TO postgres;

--
-- Name: genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genre (
    id character varying(255) NOT NULL,
    deleted character varying(255),
    type character varying(255)
);


ALTER TABLE public.genre OWNER TO postgres;

--
-- Name: genre_books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genre_books (
    genre_id character varying(255) NOT NULL,
    books_id character varying(255) NOT NULL
);


ALTER TABLE public.genre_books OWNER TO postgres;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id character varying(255) NOT NULL,
    data timestamp without time zone,
    deleted character varying(255),
    status character varying(255),
    user_id character varying(255),
    shipper_id character varying(255),
    total_cost real,
    address_id character varying(255)
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders_items (
    order_id character varying(255) NOT NULL,
    items_id character varying(255) NOT NULL
);


ALTER TABLE public.orders_items OWNER TO postgres;

--
-- Name: residence; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.residence (
    id character varying(255) NOT NULL,
    deleted character varying(255),
    address_id character varying(255),
    owner_id character varying(255)
);


ALTER TABLE public.residence OWNER TO postgres;

--
-- Name: residence_addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.residence_addresses (
    residence_id character varying(255) NOT NULL,
    addresses_id character varying(255) NOT NULL
);


ALTER TABLE public.residence_addresses OWNER TO postgres;

--
-- Name: shipper; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipper (
    id character varying(255) NOT NULL,
    cost real,
    deleted character varying(255),
    name character varying(255)
);


ALTER TABLE public.shipper OWNER TO postgres;

--
-- Name: shipper_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipper_orders (
    shipper_id character varying(255) NOT NULL,
    orders_id character varying(255) NOT NULL
);


ALTER TABLE public.shipper_orders OWNER TO postgres;

--
-- Name: user_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_orders (
    user_id character varying(255) NOT NULL,
    orders_id character varying(255) NOT NULL
);


ALTER TABLE public.user_orders OWNER TO postgres;

--
-- Name: user_residences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_residences (
    user_id character varying(255) NOT NULL,
    residences_id character varying(255) NOT NULL
);


ALTER TABLE public.user_residences OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id character varying(255) NOT NULL,
    deleted character varying(255),
    email character varying(255),
    name character varying(255),
    password character varying(255),
    phone_number character varying(255),
    surname character varying(255)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_orders (
    user_id character varying(255) NOT NULL,
    orders_id character varying(255) NOT NULL
);


ALTER TABLE public.users_orders OWNER TO postgres;

--
-- Name: users_residences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_residences (
    user_id character varying(255) NOT NULL,
    residences_id character varying(255) NOT NULL
);


ALTER TABLE public.users_residences OWNER TO postgres;

--
-- Name: address address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);


--
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id);


--
-- Name: book book_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);


--
-- Name: genre genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: residence residence_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.residence
    ADD CONSTRAINT residence_pkey PRIMARY KEY (id);


--
-- Name: shipper shipper_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipper
    ADD CONSTRAINT shipper_pkey PRIMARY KEY (id);


--
-- Name: users_orders uk_1njdfitph68mh7p7c6f3qc736; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_orders
    ADD CONSTRAINT uk_1njdfitph68mh7p7c6f3qc736 UNIQUE (orders_id);


--
-- Name: users_residences uk_49b6pw5a2r6hqi7pwkdhhy9n8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_residences
    ADD CONSTRAINT uk_49b6pw5a2r6hqi7pwkdhhy9n8 UNIQUE (residences_id);


--
-- Name: orders_items uk_7qrg5pfgjon82yhgwfqrdijm5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_items
    ADD CONSTRAINT uk_7qrg5pfgjon82yhgwfqrdijm5 UNIQUE (items_id);


--
-- Name: shipper_orders uk_98goinxv7ayrg4hbpyahajp4n; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipper_orders
    ADD CONSTRAINT uk_98goinxv7ayrg4hbpyahajp4n UNIQUE (orders_id);


--
-- Name: residence_addresses uk_hppgx1mfoll7lp7t3obva16wl; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.residence_addresses
    ADD CONSTRAINT uk_hppgx1mfoll7lp7t3obva16wl UNIQUE (addresses_id);


--
-- Name: user_residences uk_jhl6xt8htm1y05yymuqorwdxq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_residences
    ADD CONSTRAINT uk_jhl6xt8htm1y05yymuqorwdxq UNIQUE (residences_id);


--
-- Name: user_orders uk_oqipapb9ox7fhui5n2ttp9ab4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_orders
    ADD CONSTRAINT uk_oqipapb9ox7fhui5n2ttp9ab4 UNIQUE (orders_id);


--
-- Name: genre_books uk_tfpfjges6j2dntlic8alinsl3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre_books
    ADD CONSTRAINT uk_tfpfjges6j2dntlic8alinsl3 UNIQUE (books_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_residences fk2iy6v7h0mk82x57fx8nsvfqrs; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_residences
    ADD CONSTRAINT fk2iy6v7h0mk82x57fx8nsvfqrs FOREIGN KEY (residences_id) REFERENCES public.residence(id);


--
-- Name: users_orders fk2lnf5jw8p8q0ytkr8dp0mlx6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_orders
    ADD CONSTRAINT fk2lnf5jw8p8q0ytkr8dp0mlx6 FOREIGN KEY (orders_id) REFERENCES public.orders(id);


--
-- Name: orders fk32ql8ubntj5uh44ph9659tiih; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk32ql8ubntj5uh44ph9659tiih FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: user_orders fk3yq31b5hsh40vprb3spflxaob; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_orders
    ADD CONSTRAINT fk3yq31b5hsh40vprb3spflxaob FOREIGN KEY (orders_id) REFERENCES public.orders(id);


--
-- Name: residence_addresses fk5o478o6c4h9945t2laufqa8ho; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.residence_addresses
    ADD CONSTRAINT fk5o478o6c4h9945t2laufqa8ho FOREIGN KEY (residence_id) REFERENCES public.residence(id);


--
-- Name: users_residences fk6kilbkiugjgjqa5hufgcofygq; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_residences
    ADD CONSTRAINT fk6kilbkiugjgjqa5hufgcofygq FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: genre_books fka6krdp5t6rmy057vyo5f6lls7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre_books
    ADD CONSTRAINT fka6krdp5t6rmy057vyo5f6lls7 FOREIGN KEY (genre_id) REFERENCES public.genre(id);


--
-- Name: orders_items fka6rdp2cdk3hntdo18bt6nqe1a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_items
    ADD CONSTRAINT fka6rdp2cdk3hntdo18bt6nqe1a FOREIGN KEY (items_id) REFERENCES public.book(id);


--
-- Name: shipper_orders fkcmnkjtynoxhw3kwl31q9kq6a4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipper_orders
    ADD CONSTRAINT fkcmnkjtynoxhw3kwl31q9kq6a4 FOREIGN KEY (shipper_id) REFERENCES public.shipper(id);


--
-- Name: orders fkcw9s4yihuqduodjn391d630i8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fkcw9s4yihuqduodjn391d630i8 FOREIGN KEY (shipper_id) REFERENCES public.shipper(id);


--
-- Name: orders fkf5464gxwc32ongdvka2rtvw96; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fkf5464gxwc32ongdvka2rtvw96 FOREIGN KEY (address_id) REFERENCES public.address(id);


--
-- Name: residence fki18amjd1ql44d78mcwhbka43m; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.residence
    ADD CONSTRAINT fki18amjd1ql44d78mcwhbka43m FOREIGN KEY (owner_id) REFERENCES public.users(id);


--
-- Name: orders_items fkij1wwgx6o198ubsx1oulpopem; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_items
    ADD CONSTRAINT fkij1wwgx6o198ubsx1oulpopem FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: residence fkingbs6nw7y9icadd3gng2sxl5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.residence
    ADD CONSTRAINT fkingbs6nw7y9icadd3gng2sxl5 FOREIGN KEY (address_id) REFERENCES public.address(id);


--
-- Name: user_residences fkjwn43429h32xpvmr6fsepqdcx; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_residences
    ADD CONSTRAINT fkjwn43429h32xpvmr6fsepqdcx FOREIGN KEY (residences_id) REFERENCES public.residence(id);


--
-- Name: genre_books fkkkehxbty9ixe9a43ob7kubi0h; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre_books
    ADD CONSTRAINT fkkkehxbty9ixe9a43ob7kubi0h FOREIGN KEY (books_id) REFERENCES public.book(id);


--
-- Name: book fkm1t3yvw5i7olwdf32cwuul7ta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT fkm1t3yvw5i7olwdf32cwuul7ta FOREIGN KEY (genre_id) REFERENCES public.genre(id);


--
-- Name: users_orders fkms88pdhtsiuuusjpeij73f6df; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_orders
    ADD CONSTRAINT fkms88pdhtsiuuusjpeij73f6df FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: residence_addresses fkot9fy84satgwwntlycmoo4jgi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.residence_addresses
    ADD CONSTRAINT fkot9fy84satgwwntlycmoo4jgi FOREIGN KEY (addresses_id) REFERENCES public.address(id);


--
-- Name: shipper_orders fkppmmj8jofrb0ea7lcrv5y1dhe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipper_orders
    ADD CONSTRAINT fkppmmj8jofrb0ea7lcrv5y1dhe FOREIGN KEY (orders_id) REFERENCES public.orders(id);


--
-- PostgreSQL database dump complete
--

