--
-- PostgreSQL database dump
--

-- Dumped from database version 14.11
-- Dumped by pg_dump version 14.11

-- Started on 2025-08-28 17:24:47

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
-- TOC entry 2 (class 3079 OID 16454)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 3403 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


--
-- TOC entry 3 (class 3079 OID 17915)
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- TOC entry 3404 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- TOC entry 871 (class 1247 OID 17845)
-- Name: TipoUsuario; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."TipoUsuario" AS ENUM (
    'aluno',
    'professor',
    'coordenador',
    'admin'
);


ALTER TYPE public."TipoUsuario" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 211 (class 1259 OID 17833)
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 17862)
-- Name: aluno; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aluno (
    id_aluno integer NOT NULL,
    matricula text NOT NULL
);


ALTER TABLE public.aluno OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17869)
-- Name: professor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.professor (
    id_professor integer NOT NULL,
    disciplina text NOT NULL
);


ALTER TABLE public.professor OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17886)
-- Name: registro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registro (
    id_registro integer NOT NULL,
    id_usuario integer NOT NULL,
    id_sala integer NOT NULL,
    data_registro timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    inicio timestamp(3) without time zone NOT NULL,
    fim timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.registro OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 17885)
-- Name: registro_id_registro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.registro_id_registro_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registro_id_registro_seq OWNER TO postgres;

--
-- TOC entry 3405 (class 0 OID 0)
-- Dependencies: 218
-- Name: registro_id_registro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.registro_id_registro_seq OWNED BY public.registro.id_registro;


--
-- TOC entry 217 (class 1259 OID 17877)
-- Name: sala; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sala (
    id_sala integer NOT NULL,
    nome_sala text NOT NULL,
    capacidade integer NOT NULL
);


ALTER TABLE public.sala OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 17876)
-- Name: sala_id_sala_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sala_id_sala_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sala_id_sala_seq OWNER TO postgres;

--
-- TOC entry 3406 (class 0 OID 0)
-- Dependencies: 216
-- Name: sala_id_sala_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sala_id_sala_seq OWNED BY public.sala.id_sala;


--
-- TOC entry 213 (class 1259 OID 17854)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id_usuario integer NOT NULL,
    nome text NOT NULL,
    email text NOT NULL,
    senha text NOT NULL,
    tipo public."TipoUsuario" NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 17853)
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_id_usuario_seq OWNER TO postgres;

--
-- TOC entry 3407 (class 0 OID 0)
-- Dependencies: 212
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_usuario_seq OWNED BY public.usuario.id_usuario;


--
-- TOC entry 3231 (class 2604 OID 17889)
-- Name: registro id_registro; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registro ALTER COLUMN id_registro SET DEFAULT nextval('public.registro_id_registro_seq'::regclass);


--
-- TOC entry 3230 (class 2604 OID 17880)
-- Name: sala id_sala; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sala ALTER COLUMN id_sala SET DEFAULT nextval('public.sala_id_sala_seq'::regclass);


--
-- TOC entry 3229 (class 2604 OID 17857)
-- Name: usuario id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuario_id_usuario_seq'::regclass);


--
-- TOC entry 3389 (class 0 OID 17833)
-- Dependencies: 211
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
b8fd8c51-4eb2-4868-8516-4df0f9e27f51	43f226632722a35555e3500b5bbbbe59a03ecfab5186e234c5370e46528c57d6	2025-08-28 13:46:49.4135-03	20250828164649_init	\N	\N	2025-08-28 13:46:49.315954-03	1
\.


--
-- TOC entry 3392 (class 0 OID 17862)
-- Dependencies: 214
-- Data for Name: aluno; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aluno (id_aluno, matricula) FROM stdin;
\.


--
-- TOC entry 3393 (class 0 OID 17869)
-- Dependencies: 215
-- Data for Name: professor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.professor (id_professor, disciplina) FROM stdin;
3	
\.


--
-- TOC entry 3397 (class 0 OID 17886)
-- Dependencies: 219
-- Data for Name: registro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.registro (id_registro, id_usuario, id_sala, data_registro, inicio, fim) FROM stdin;
3	1	1	2025-08-28 19:27:55.15	2025-08-28 19:25:00	2025-08-28 20:25:00
\.


--
-- TOC entry 3395 (class 0 OID 17877)
-- Dependencies: 217
-- Data for Name: sala; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sala (id_sala, nome_sala, capacidade) FROM stdin;
1	Laboratório 1	29
\.


--
-- TOC entry 3391 (class 0 OID 17854)
-- Dependencies: 213
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (id_usuario, nome, email, senha, tipo) FROM stdin;
1	Oliver Henrique	oliver@teste.com	$2a$12$PcBd/rn4sFBfo9VWyg/y.u7NJeFRn34SMFBKwK7LQpAe8IuSGTxhK	aluno
2	Oliver - Admin	oliverhenriqueferreira@gmail.com	$2a$06$ZQeh4Ia2s8tFpXp751C4L.F0gYEIvE1vdkVgNuu/p10/S5olP9Sv6	admin
3	Oliver - Professor	oliverprofessor@teste.com	$2a$12$KPVenw6fDhDLaGzPDChpAeQHcFcfgINxavPsAH4g6gEA5NmTyB3b6	professor
4	Oliver - Coord	olivercoord@teste.com	$2a$12$rtp1Fn4GMFwaC2n3D2nuXOFj9nwa9xVbiqqg2BBdxDO5txws8S30q	coordenador
\.


--
-- TOC entry 3408 (class 0 OID 0)
-- Dependencies: 218
-- Name: registro_id_registro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.registro_id_registro_seq', 4, true);


--
-- TOC entry 3409 (class 0 OID 0)
-- Dependencies: 216
-- Name: sala_id_sala_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sala_id_sala_seq', 1, true);


--
-- TOC entry 3410 (class 0 OID 0)
-- Dependencies: 212
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_id_usuario_seq', 4, true);


--
-- TOC entry 3234 (class 2606 OID 17841)
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3239 (class 2606 OID 17868)
-- Name: aluno aluno_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluno
    ADD CONSTRAINT aluno_pkey PRIMARY KEY (id_aluno);


--
-- TOC entry 3241 (class 2606 OID 17875)
-- Name: professor professor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professor
    ADD CONSTRAINT professor_pkey PRIMARY KEY (id_professor);


--
-- TOC entry 3245 (class 2606 OID 17892)
-- Name: registro registro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registro
    ADD CONSTRAINT registro_pkey PRIMARY KEY (id_registro);


--
-- TOC entry 3243 (class 2606 OID 17884)
-- Name: sala sala_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sala
    ADD CONSTRAINT sala_pkey PRIMARY KEY (id_sala);


--
-- TOC entry 3237 (class 2606 OID 17861)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 3235 (class 1259 OID 17893)
-- Name: usuario_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX usuario_email_key ON public.usuario USING btree (email);


--
-- TOC entry 3246 (class 2606 OID 17894)
-- Name: aluno aluno_id_aluno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluno
    ADD CONSTRAINT aluno_id_aluno_fkey FOREIGN KEY (id_aluno) REFERENCES public.usuario(id_usuario) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3247 (class 2606 OID 17899)
-- Name: professor professor_id_professor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professor
    ADD CONSTRAINT professor_id_professor_fkey FOREIGN KEY (id_professor) REFERENCES public.usuario(id_usuario) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3249 (class 2606 OID 17909)
-- Name: registro registro_id_sala_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registro
    ADD CONSTRAINT registro_id_sala_fkey FOREIGN KEY (id_sala) REFERENCES public.sala(id_sala) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3248 (class 2606 OID 17904)
-- Name: registro registro_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registro
    ADD CONSTRAINT registro_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2025-08-28 17:24:50

--
-- PostgreSQL database dump complete
--

