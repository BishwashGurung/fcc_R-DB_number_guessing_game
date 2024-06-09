--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
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
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 190);
INSERT INTO public.games VALUES (2, 1, 449);
INSERT INTO public.games VALUES (3, 2, 994);
INSERT INTO public.games VALUES (4, 2, 909);
INSERT INTO public.games VALUES (5, 1, 630);
INSERT INTO public.games VALUES (6, 1, 592);
INSERT INTO public.games VALUES (7, 1, 707);
INSERT INTO public.games VALUES (8, 3, 46);
INSERT INTO public.games VALUES (9, 3, 723);
INSERT INTO public.games VALUES (10, 4, 479);
INSERT INTO public.games VALUES (11, 4, 832);
INSERT INTO public.games VALUES (12, 3, 144);
INSERT INTO public.games VALUES (13, 3, 382);
INSERT INTO public.games VALUES (14, 3, 678);
INSERT INTO public.games VALUES (15, 5, 657);
INSERT INTO public.games VALUES (16, 5, 83);
INSERT INTO public.games VALUES (17, 6, 45);
INSERT INTO public.games VALUES (18, 6, 891);
INSERT INTO public.games VALUES (19, 5, 921);
INSERT INTO public.games VALUES (20, 5, 593);
INSERT INTO public.games VALUES (21, 5, 920);
INSERT INTO public.games VALUES (22, 7, 19);
INSERT INTO public.games VALUES (23, 8, 924);
INSERT INTO public.games VALUES (24, 8, 819);
INSERT INTO public.games VALUES (25, 9, 611);
INSERT INTO public.games VALUES (26, 9, 686);
INSERT INTO public.games VALUES (27, 8, 59);
INSERT INTO public.games VALUES (28, 8, 963);
INSERT INTO public.games VALUES (29, 8, 612);
INSERT INTO public.games VALUES (30, 10, 16);
INSERT INTO public.games VALUES (31, 10, 377);
INSERT INTO public.games VALUES (32, 11, 867);
INSERT INTO public.games VALUES (33, 11, 921);
INSERT INTO public.games VALUES (34, 10, 651);
INSERT INTO public.games VALUES (35, 10, 264);
INSERT INTO public.games VALUES (36, 10, 442);
INSERT INTO public.games VALUES (37, 12, 912);
INSERT INTO public.games VALUES (38, 12, 265);
INSERT INTO public.games VALUES (39, 13, 901);
INSERT INTO public.games VALUES (40, 13, 413);
INSERT INTO public.games VALUES (41, 12, 876);
INSERT INTO public.games VALUES (42, 12, 466);
INSERT INTO public.games VALUES (43, 12, 74);
INSERT INTO public.games VALUES (44, 7, 10);
INSERT INTO public.games VALUES (45, 14, 881);
INSERT INTO public.games VALUES (46, 14, 521);
INSERT INTO public.games VALUES (47, 15, 229);
INSERT INTO public.games VALUES (48, 15, 856);
INSERT INTO public.games VALUES (49, 14, 286);
INSERT INTO public.games VALUES (50, 14, 803);
INSERT INTO public.games VALUES (51, 14, 140);
INSERT INTO public.games VALUES (52, 16, 893);
INSERT INTO public.games VALUES (53, 16, 309);
INSERT INTO public.games VALUES (54, 17, 360);
INSERT INTO public.games VALUES (55, 17, 611);
INSERT INTO public.games VALUES (56, 16, 58);
INSERT INTO public.games VALUES (57, 16, 135);
INSERT INTO public.games VALUES (58, 16, 540);
INSERT INTO public.games VALUES (59, 18, 522);
INSERT INTO public.games VALUES (60, 18, 901);
INSERT INTO public.games VALUES (61, 19, 703);
INSERT INTO public.games VALUES (62, 19, 634);
INSERT INTO public.games VALUES (63, 18, 211);
INSERT INTO public.games VALUES (64, 18, 967);
INSERT INTO public.games VALUES (65, 18, 272);
INSERT INTO public.games VALUES (66, 7, 12);
INSERT INTO public.games VALUES (67, 20, 689);
INSERT INTO public.games VALUES (68, 20, 415);
INSERT INTO public.games VALUES (69, 21, 602);
INSERT INTO public.games VALUES (70, 21, 340);
INSERT INTO public.games VALUES (71, 20, 320);
INSERT INTO public.games VALUES (72, 20, 47);
INSERT INTO public.games VALUES (73, 20, 665);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (2, 'user_1717934466021', 2, 909);
INSERT INTO public.users VALUES (1, 'user_1717934466022', 5, 190);
INSERT INTO public.users VALUES (19, 'user_1717935355609', 2, 634);
INSERT INTO public.users VALUES (4, 'user_1717934512322', 2, 479);
INSERT INTO public.users VALUES (18, 'user_1717935355610', 5, 211);
INSERT INTO public.users VALUES (7, 'test', 3, 10);
INSERT INTO public.users VALUES (3, 'user_1717934512323', 5, 46);
INSERT INTO public.users VALUES (6, 'user_1717934544371', 2, 45);
INSERT INTO public.users VALUES (5, 'user_1717934544372', 5, 83);
INSERT INTO public.users VALUES (21, 'user_1717935508881', 2, 340);
INSERT INTO public.users VALUES (20, 'user_1717935508882', 5, 47);
INSERT INTO public.users VALUES (9, 'user_1717934853023', 2, 611);
INSERT INTO public.users VALUES (8, 'user_1717934853024', 5, 59);
INSERT INTO public.users VALUES (11, 'user_1717934965581', 2, 867);
INSERT INTO public.users VALUES (10, 'user_1717934965582', 5, 16);
INSERT INTO public.users VALUES (13, 'user_1717934973178', 2, 413);
INSERT INTO public.users VALUES (12, 'user_1717934973179', 5, 74);
INSERT INTO public.users VALUES (15, 'user_1717935073768', 2, 229);
INSERT INTO public.users VALUES (14, 'user_1717935073769', 5, 140);
INSERT INTO public.users VALUES (17, 'user_1717935170131', 2, 360);
INSERT INTO public.users VALUES (16, 'user_1717935170132', 5, 58);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 73, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 21, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

