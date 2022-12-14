--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

-- Started on 2022-12-11 21:12:56

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
-- TOC entry 210 (class 1259 OID 33625)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 33624)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.category ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 212 (class 1259 OID 33631)
-- Name: image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.image (
    id integer NOT NULL,
    file_name character varying(255),
    product_id integer NOT NULL
);


ALTER TABLE public.image OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 33630)
-- Name: image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.image ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 214 (class 1259 OID 33637)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer NOT NULL,
    date_time timestamp without time zone,
    number character varying(255),
    price real NOT NULL,
    status integer,
    person_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 33636)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.orders ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 33643)
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    id integer NOT NULL,
    login character varying(50),
    password character varying(255),
    role character varying(255)
);


ALTER TABLE public.person OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 33642)
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.person ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 218 (class 1259 OID 33651)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    date_time_of_created timestamp without time zone,
    description text NOT NULL,
    price real NOT NULL,
    seller character varying(255) NOT NULL,
    title text NOT NULL,
    warehouse character varying(255) NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT product_price_check CHECK ((price >= (1)::double precision))
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 33660)
-- Name: product_cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_cart (
    id integer NOT NULL,
    person_id integer,
    product_id integer
);


ALTER TABLE public.product_cart OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 33659)
-- Name: product_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product_cart ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 217 (class 1259 OID 33650)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3350 (class 0 OID 33625)
-- Dependencies: 210
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category (id, name) VALUES (1, 'Avatars');
INSERT INTO public.category (id, name) VALUES (2, 'Books');
INSERT INTO public.category (id, name) VALUES (3, 'Mobs');
INSERT INTO public.category (id, name) VALUES (4, 'Buildings');


--
-- TOC entry 3352 (class 0 OID 33631)
-- Dependencies: 212
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.image (id, file_name, product_id) VALUES (1, 'b4b01cda-e3d4-42b1-b4db-520b896011bd.mc-agriculture.jpg', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (2, 'e33e28af-b58d-49b5-8308-068dbe46aa41.', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (3, '85f9e393-1dc8-4edc-9a8e-55e0d9180144.', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (4, '9569b025-fa5e-45ce-9832-d219426054d2.', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (5, 'fd9c6e95-c683-4d87-8423-faf5ac33f1bb.', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (6, '15866ceb-c932-4fe9-8364-554c7d957550.mc-arch.jpg', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (7, '233359ab-e360-4203-b1a5-62797f3bcc73.', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (8, '64d6802a-363a-4375-9cc3-9141d0c570be.', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (9, '3afdc82b-93fe-47e9-932e-4052f1b61b20.', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (10, 'cfde6fdf-14aa-4cab-be0a-7dbfb36ff168.', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (11, '1dcac9bd-edb8-401c-ad4a-66cd878cfab8.mc-potion.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (12, '29c824d6-6102-4029-9ce8-6bd4f25d727d.', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (13, '3a71f1ff-0f53-4ff2-9683-3fbd687349c2.', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (14, 'db96101c-8ff5-4e79-bb2d-8fc44f01c7b1.', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (15, '573633cd-843f-4e1d-93fe-283e65369f68.', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (16, '1682ae76-ab55-4c17-a089-6ae91b4c1063.mc-redstone.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (17, 'c594fe32-f494-40c5-9af1-ae378ed10e65.', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (18, '3981fc1a-9b2b-4e67-a7c4-f9acccdc8c1b.', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (19, 'cb4ab57f-d11e-487d-bb20-68755ac4a85b.', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (20, '9438d441-1bce-433d-8092-580850398e6f.', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (21, 'b6529680-6099-4d80-a105-a5c537807414.mc-underwater.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (22, '6a51ba83-6427-4750-9387-5dace4c4d28e.', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (23, '7b2550bf-190e-4f91-8291-d6807c5e3308.', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (24, '564d5428-98bd-4ac9-ba0e-1569dd69162a.', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (25, 'b974d464-1ec7-4959-8805-3490109976b0.', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (26, '65729628-e3fc-493c-996c-d96e21d87896.chicken.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (27, '4523be48-30c4-4cdd-9c64-ccc39a55b7a3.', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (28, '8e857f0b-cd65-4933-a85a-a5b92c6c44d8.', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (29, '892f8219-db41-4052-b96c-7733982e91c1.', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (30, 'ef7163e2-f4bd-4f30-9c40-1e72af386b0d.', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (31, 'aa3864d6-84cd-42bf-9712-3deb6f27eed7.chickenzombie.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (32, '105e11e9-20cc-4d82-b9e2-764f5d65d39c.', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (33, '730cf141-447c-4049-89a3-2bee8d2daf9d.', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (34, '613659bb-d7ac-4cca-85a7-4f4fc9d208a7.', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (35, '2dd381ea-9fe5-4b16-b974-f36824da9e49.', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (36, 'e3924982-1b50-4582-9e15-528d7a568532.ghast.jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (37, '4ffda545-b2d7-4eaa-b823-eeb970886ed1.', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (38, '86f3db76-3377-4c58-a444-e7ae35430dcb.', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (39, '85e28f8f-0388-4c6b-992b-09f1f83654ca.', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (40, 'e3cf9184-25c7-4190-828b-27c87f24ed8d.', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (41, '638f7fd1-6755-4184-8c6d-b82b82a543a0.herobrine.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (42, '40bb6e9c-1d69-400a-9d84-ac3dac8dfe15.', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (43, '8ccb4c1b-b1b4-4073-adff-40c8f2bec907.', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (44, '9f15f24d-893d-4a1e-80e2-e17ecf060138.', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (45, '73db176c-fbeb-4c12-af76-db5b1b490258.', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (46, '1ced36e7-0bfc-4c6b-9c45-8500c26eddfa.ocelot.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (47, '3eb59320-b0a1-4ced-a32f-9f3f93875391.', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (48, '2f6f9b0a-dcb1-4a8a-8821-83f577df9374.', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (49, 'fcff1360-ee93-493e-b5d3-d7364a907748.', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (50, 'be3280a9-7b91-4439-a11c-dabb12afe3ad.', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (51, 'f8513026-0468-4d63-ada0-e60669a78fd8.pig.jpg', 11);
INSERT INTO public.image (id, file_name, product_id) VALUES (52, '34f2e3da-cb14-4b7a-8dff-aba2ba138ad4.', 11);
INSERT INTO public.image (id, file_name, product_id) VALUES (53, 'ac63d62a-566e-406b-82df-968a1d9b76eb.', 11);
INSERT INTO public.image (id, file_name, product_id) VALUES (54, '9117d9d4-d9ca-42da-a16e-a46c6319aa0b.', 11);
INSERT INTO public.image (id, file_name, product_id) VALUES (55, '6b7d807f-8798-4a6c-9388-a74d797bab9b.', 11);
INSERT INTO public.image (id, file_name, product_id) VALUES (56, '4a2dbc63-e8e8-4ca3-8ede-5e005480e813.sheep.jpg', 12);
INSERT INTO public.image (id, file_name, product_id) VALUES (57, '3a9d7419-2f46-41ba-a1d4-0856ad7d73f8.', 12);
INSERT INTO public.image (id, file_name, product_id) VALUES (58, '04246c4f-14c4-4177-9c68-b7d0f0978d3e.', 12);
INSERT INTO public.image (id, file_name, product_id) VALUES (59, '0ef1e950-c617-49fc-ba00-538bb94b8119.', 12);
INSERT INTO public.image (id, file_name, product_id) VALUES (60, '7824c834-c357-491c-a06c-c0606eb2c4e5.', 12);
INSERT INTO public.image (id, file_name, product_id) VALUES (61, '8aa18be1-2254-45c7-bbff-403b6c465add.snowman.jpg', 13);
INSERT INTO public.image (id, file_name, product_id) VALUES (62, 'fbe78d21-1b01-4855-a57b-6ab95075e812.', 13);
INSERT INTO public.image (id, file_name, product_id) VALUES (63, 'da94d3f8-694c-4aec-bc63-f8ccc8d070d1.', 13);
INSERT INTO public.image (id, file_name, product_id) VALUES (64, '550faafc-159d-4013-817e-1204fd1ae58e.', 13);
INSERT INTO public.image (id, file_name, product_id) VALUES (65, 'd2bbd544-7334-44f1-bbf0-f88b97bede5c.', 13);
INSERT INTO public.image (id, file_name, product_id) VALUES (66, '14e5f5e7-d2d0-4bc0-ac13-6e042d2d9f0a.traveler.jpg', 14);
INSERT INTO public.image (id, file_name, product_id) VALUES (67, '043a9a7e-a003-4495-ba8a-4914dc790847.', 14);
INSERT INTO public.image (id, file_name, product_id) VALUES (68, 'd522a7bf-0b17-4377-b170-27d7de64b57d.', 14);
INSERT INTO public.image (id, file_name, product_id) VALUES (69, 'b0d68170-fac1-40ed-952c-2328e2b021e2.', 14);
INSERT INTO public.image (id, file_name, product_id) VALUES (70, '7ae06152-ad13-4206-a99b-870c9857cbef.', 14);
INSERT INTO public.image (id, file_name, product_id) VALUES (71, 'a1fe08a5-fe96-4bb4-a9f4-b5e2fa549d0f.villager.jpg', 15);
INSERT INTO public.image (id, file_name, product_id) VALUES (72, 'b9ec0c39-5dc0-40ed-9fcf-65b4278ad675.', 15);
INSERT INTO public.image (id, file_name, product_id) VALUES (73, '68a2344f-f197-4719-825d-7979d568532d.', 15);
INSERT INTO public.image (id, file_name, product_id) VALUES (74, '207fac21-7ccd-4943-8c27-902167c76c4c.', 15);
INSERT INTO public.image (id, file_name, product_id) VALUES (75, '650bd09b-ce22-4604-85e2-9e97ba9ae20f.', 15);
INSERT INTO public.image (id, file_name, product_id) VALUES (76, '2c26c5a8-33e5-4730-bbe3-c106b5d4a200.winterfox.jpg', 16);
INSERT INTO public.image (id, file_name, product_id) VALUES (77, '43da6359-6327-46ab-9f8f-098d6df98927.', 16);
INSERT INTO public.image (id, file_name, product_id) VALUES (78, '6ad0dbba-2fca-4e74-8cd9-dac70cc976d1.', 16);
INSERT INTO public.image (id, file_name, product_id) VALUES (79, '4fe80e3c-89ba-44ed-ad2a-d9a8ecaaac26.', 16);
INSERT INTO public.image (id, file_name, product_id) VALUES (80, '1b027f5f-5054-4154-bc34-8578ad631ca8.', 16);


--
-- TOC entry 3354 (class 0 OID 33637)
-- Dependencies: 214
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (1, 1, '2022-12-11 18:35:33.401922', 'd621195d-1839-44a1-82a0-3948d0a68023', 1400, 1, 1, 2);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (2, 1, '2022-12-11 18:35:33.475939', 'd621195d-1839-44a1-82a0-3948d0a68023', 200, 1, 1, 6);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (3, 1, '2022-12-11 18:35:33.484922', 'd621195d-1839-44a1-82a0-3948d0a68023', 500, 1, 1, 9);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (4, 1, '2022-12-11 18:37:06.148039', '278df491-eb31-4168-9478-b0811c652c22', 1600, 1, 3, 4);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (5, 1, '2022-12-11 18:37:06.158076', '278df491-eb31-4168-9478-b0811c652c22', 300, 1, 3, 8);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (6, 1, '2022-12-11 18:42:15.695475', '76641644-abb1-452f-a664-4e1483447cdf', 200, 1, 4, 15);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (7, 1, '2022-12-11 18:42:15.703475', '76641644-abb1-452f-a664-4e1483447cdf', 320, 1, 4, 16);


--
-- TOC entry 3356 (class 0 OID 33643)
-- Dependencies: 216
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.person (id, login, password, role) VALUES (1, 'admin', '$2a$10$iYjxYS5dSEhHzsamDkgwHelMnL8rHrR6TxsPP7bnC.e5DWvf..Hta', 'ROLE_ADMIN');
INSERT INTO public.person (id, login, password, role) VALUES (3, 'firstuser', '$2a$10$OwDXFjsFjv.VVlq5QHCv9.8rq8gbPN1eRofS8be.Jal6dCYJpfIDy', 'ROLE_USER');
INSERT INTO public.person (id, login, password, role) VALUES (4, 'seconduser', '$2a$10$UalR5fOBA5.ObN4ihzZtNOE1NFOa4ZZCfOTPdfkpkuLWuoepGfPoa', 'ROLE_USER');


--
-- TOC entry 3358 (class 0 OID 33651)
-- Dependencies: 218
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (1, '2022-12-09 19:20:48.068662', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit...', 1250, 'admin', 'Agriculture book', 'Minecraft Store', 2);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (2, '2022-12-10 03:11:45.402882', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 1400, 'admin', 'Architect book', 'Minecraft Store', 2);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (3, '2022-12-10 03:12:36.937754', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 1350, 'admin', 'Potions book', 'Minecraft Store', 2);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (4, '2022-12-10 03:13:21.190775', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 1600, 'admin', 'Redstone book', 'Minecraft Store', 2);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (5, '2022-12-10 03:14:18.951696', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 1150, 'admin', 'Underwater book', 'Minecraft Store', 2);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (6, '2022-12-11 18:24:50.574382', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 200, 'admin', 'Chicken avatar', 'Minecraft Store', 1);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (7, '2022-12-11 18:25:36.270725', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 250, 'admin', 'ChikenZombie avatar', 'Minecraft Store', 1);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (8, '2022-12-11 18:26:16.238061', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 300, 'admin', 'Ghast avatar', 'Minecraft Store', 1);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (9, '2022-12-11 18:26:56.291907', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 500, 'admin', 'Herobrine avatar', 'Minecraft Store', 1);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (10, '2022-12-11 18:27:43.570759', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 185, 'admin', 'Ocelot avatar', 'Minecraft Store', 1);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (11, '2022-12-11 18:28:26.825099', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 200, 'admin', 'Pig avatar', 'Minecraft Store', 1);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (12, '2022-12-11 18:29:04.944465', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 180, 'admin', 'Sheep avatar', 'Minecraft Store', 1);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (13, '2022-12-11 18:29:50.491205', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 215, 'admin', 'Snowman avatar', 'Minecraft Store', 1);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (14, '2022-12-11 18:30:52.268604', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 245, 'admin', 'Traveler avatar', 'Minecraft Store', 1);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (15, '2022-12-11 18:32:21.067817', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 200, 'admin', 'Villager avatar', 'Minecraft Store', 1);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (16, '2022-12-11 18:33:00.574441', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 320, 'admin', 'WinterFox avatar', 'Minecraft Store', 1);


--
-- TOC entry 3360 (class 0 OID 33660)
-- Dependencies: 220
-- Data for Name: product_cart; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3366 (class 0 OID 0)
-- Dependencies: 209
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 4, true);


--
-- TOC entry 3367 (class 0 OID 0)
-- Dependencies: 211
-- Name: image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.image_id_seq', 80, true);


--
-- TOC entry 3368 (class 0 OID 0)
-- Dependencies: 213
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 7, true);


--
-- TOC entry 3369 (class 0 OID 0)
-- Dependencies: 215
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_id_seq', 4, true);


--
-- TOC entry 3370 (class 0 OID 0)
-- Dependencies: 219
-- Name: product_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_cart_id_seq', 11, true);


--
-- TOC entry 3371 (class 0 OID 0)
-- Dependencies: 217
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 16, true);


--
-- TOC entry 3191 (class 2606 OID 33629)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3193 (class 2606 OID 33635)
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- TOC entry 3195 (class 2606 OID 33641)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3197 (class 2606 OID 33649)
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- TOC entry 3203 (class 2606 OID 33664)
-- Name: product_cart product_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT product_cart_pkey PRIMARY KEY (id);


--
-- TOC entry 3199 (class 2606 OID 33658)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 3201 (class 2606 OID 33666)
-- Name: product uk_qka6vxqdy1dprtqnx9trdd47c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c UNIQUE (title);


--
-- TOC entry 3205 (class 2606 OID 33672)
-- Name: orders fk1b0m4muwx1t377w9if3w6wwqn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- TOC entry 3207 (class 2606 OID 33682)
-- Name: product fk1mtsbur82frn64de7balymq9s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk1mtsbur82frn64de7balymq9s FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- TOC entry 3206 (class 2606 OID 33677)
-- Name: orders fk787ibr3guwp6xobrpbofnv7le; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk787ibr3guwp6xobrpbofnv7le FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3204 (class 2606 OID 33667)
-- Name: image fkgpextbyee3uk9u6o2381m7ft1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1 FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3209 (class 2606 OID 33692)
-- Name: product_cart fkhpnrxdy3jhujameyod08ilvvw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3208 (class 2606 OID 33687)
-- Name: product_cart fksgnkc1ko2i1o9yr2p63ysq3rn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn FOREIGN KEY (person_id) REFERENCES public.person(id);


-- Completed on 2022-12-11 21:12:57

--
-- PostgreSQL database dump complete
--

