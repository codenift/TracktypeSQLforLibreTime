--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)

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

SET default_with_oids = false;

--
-- Name: cc_track_types; Type: TABLE; Schema: public; Owner: airtime
--

CREATE TABLE public.cc_track_types (
    id integer NOT NULL,
    code character varying(16) DEFAULT ''::character varying NOT NULL,
    type_name character varying(64) DEFAULT ''::character varying NOT NULL,
    description character varying(255) DEFAULT ''::character varying NOT NULL,
    visibility boolean DEFAULT true NOT NULL
);


ALTER TABLE public.cc_track_types OWNER TO airtime;

--
-- Name: cc_track_types_id_seq; Type: SEQUENCE; Schema: public; Owner: airtime
--

CREATE SEQUENCE public.cc_track_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cc_track_types_id_seq OWNER TO airtime;

--
-- Name: cc_track_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airtime
--

ALTER SEQUENCE public.cc_track_types_id_seq OWNED BY public.cc_track_types.id;


--
-- Name: cc_track_types id; Type: DEFAULT; Schema: public; Owner: airtime
--

ALTER TABLE ONLY public.cc_track_types ALTER COLUMN id SET DEFAULT nextval('public.cc_track_types_id_seq'::regclass);


--
-- Data for Name: cc_track_types; Type: TABLE DATA; Schema: public; Owner: airtime
--

COPY public.cc_track_types (id, code, type_name, description, visibility) FROM stdin;
1	MUS	Music	This is used for tracks containing music.	t
2	SID	Station ID	This is used for Station IDs	t
3	INT	Show Intro	This can be used for organizing all the show introductions.	t
4	OUT	Show Outro	This can be used for organizing all the show outroductions.	t
5	SWP	Sweeper	This is used for segues between songs.	t
6	JIN	Jingle	A short song or tune, normally played during commercial breaks. Contains one or more hooks.	t
7	PRO	Promo	For promotional use.	t
8	SHO	Shout Out	A message of congratulation, greeting. support, or appreciation. 	t
9	NWS	News	This is used for noteworthy information, announcements.	t
10	COM	Commercial	This is used for commerical advertising.	t
11	ITV	Interview	This is used for radio interviews	t
12	VTR	Voice Tracking	Also referred as robojock or taped. Make announcements without actually being in the station.	t
\.


--
-- Name: cc_track_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airtime
--

SELECT pg_catalog.setval('public.cc_track_types_id_seq', 13, false);


--
-- Name: cc_track_types cc_track_types_code_idx; Type: CONSTRAINT; Schema: public; Owner: airtime
--

ALTER TABLE ONLY public.cc_track_types
    ADD CONSTRAINT cc_track_types_code_idx UNIQUE (code);


--
-- Name: cc_track_types cc_track_types_id_idx; Type: CONSTRAINT; Schema: public; Owner: airtime
--

ALTER TABLE ONLY public.cc_track_types
    ADD CONSTRAINT cc_track_types_id_idx PRIMARY KEY (id);

--
-- Name: cc_files id; Type: DEFAULT; Schema: public; Owner: airtime
--

ALTER TABLE public.cc_files ADD COLUMN track_type VARCHAR(16);

--
-- PostgreSQL database dump complete
--