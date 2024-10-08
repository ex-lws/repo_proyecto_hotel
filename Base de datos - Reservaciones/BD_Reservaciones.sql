--
-- PostgreSQL database dump
--

-- Dumped from database version 17rc1
-- Dumped by pg_dump version 17rc1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: actualizaCliente(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."actualizaCliente"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$begin
INSERT INTO public."Auditoria cliente"(
	"nombreAnt", "apePateroAnt", "apeMaternoAnt", "correoAnt", "telefonoAnt", "direccionAnt", 
	"nombreNue", "apePateroNue", "apeMaternoNue", "correoNue", "telefonoNue", "direccionNue", 
	usuario, modificado, accion, id_cliente)
	VALUES (
	old.nombres,old.apellido_materno,old.apellido_paterno,old.correo,old.telefono,old.direccion,
	new.nombres,new.apellido_materno,new.apellido_paterno,new.correo,new.telefono,new.direccion,
	current_user,now(),'Modificado',new.id_cliente);
	return new;
	end;$$;


ALTER FUNCTION public."actualizaCliente"() OWNER TO postgres;

--
-- Name: actualizaHabitacion(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."actualizaHabitacion"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$begin
INSERT INTO public."Auditoria habitacion"(
	"nuHabAnt", "tipoHabAnt", "precioNocAnt", "estadoAnt", 
	"nuHabNue", "tipoHabNue", "precioNocNue", "estadoNue", 
	usuario, modificado, accion, id_habitacion)
	VALUES (
	old.numero_habitacion,old.tipo_habitacion,old.precio_noche,old.estado,
	new.numero_habitacion,new.tipo_habitacion,new.precio_noche,new.estado,
	current_user,now(),'Modificado',new.id_habitacion);
	return new;
	end;$$;


ALTER FUNCTION public."actualizaHabitacion"() OWNER TO postgres;

--
-- Name: actualizaPago(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."actualizaPago"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$begin
INSERT INTO public."Auditoria pago"(
	"fecPagoAnt", "monPagoAnt", "metPagoAnt", "id_resAnt", 
	"fecPagoNue", "monPagoNue", "metPagoNue", "id_resNue", 
	usuario, modificado, accion, id_pago)
	VALUES (
	old.fecha_pago,old.monto_pagado,old.metodo_pago,old.id_reservacion,
	new.fecha_pago,new.monto_pagado,new.metodo_pago,new.id_reservacion,
	current_user,now(),'Actualizado',new.id_pago);
	return new;
	end;$$;


ALTER FUNCTION public."actualizaPago"() OWNER TO postgres;

--
-- Name: actualizaReservacion(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."actualizaReservacion"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$begin
INSERT INTO public."Auditoria reservacion"(
	"checkinAnt", "checkoutAnt", "fechaResAnt", "totalAnt", "id_clienteAnt", "id_habAnt", 
	"checkinNue", "checkoutNue", "fechaResNue", "totalNue", "id_clienteNue", "id_habNue", 
	usuario, modificado, accion, id_reservacion)
	VALUES (
	old.check_in,old.check_out,old.fecha_reservacion,old.total,old.id_cliente,old.id_habitacion,
	new.check_in,new.check_out,new.fecha_reservacion,new.total,new.id_cliente,new.id_habitacion,
	current_user,now(),'Actualizado',new.id_reservacion);
	return new;
	end;$$;


ALTER FUNCTION public."actualizaReservacion"() OWNER TO postgres;

--
-- Name: agregaCliente(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."agregaCliente"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$begin
INSERT INTO public."Auditoria cliente"(
	"nombreNue", "apePateroNue", "apeMaternoNue", "correoNue", "telefonoNue", "direccionNue", 
	usuario, modificado, accion, id_cliente)
	VALUES (
	new.nombres,new.apellido_materno,new.apellido_paterno,new.correo,new.telefono,new.direccion,
	current_user,now(),'Agregado',new.id_cliente);
	return new;
	end;$$;


ALTER FUNCTION public."agregaCliente"() OWNER TO postgres;

--
-- Name: agregaHabitacion(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."agregaHabitacion"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$begin
INSERT INTO public."Auditoria habitacion"(
	"nuHabNue", "tipoHabNue", "precioNocNue", "estadoNue", 
	usuario, modificado, accion, id_habitacion)
	VALUES (
	new.numero_habitacion,new.tipo_habitacion,new.precio_noche,new.estado,
	current_user,now(),'Agregado',new.id_habitacion);
	return new;
	end;$$;


ALTER FUNCTION public."agregaHabitacion"() OWNER TO postgres;

--
-- Name: agregaPago(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."agregaPago"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$begin
INSERT INTO public."Auditoria pago"( 
	"fecPagoNue", "monPagoNue", "metPagoNue", "id_resNue", 
	usuario, modificado, accion, id_pago)
	VALUES (
	new.fecha_pago,new.monto_pagado,new.metodo_pago,new.id_reservacion,
	current_user,now(),'Agregado',new.id_pago);
	return new;
	end;$$;


ALTER FUNCTION public."agregaPago"() OWNER TO postgres;

--
-- Name: agregaReservacion(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."agregaReservacion"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$begin
INSERT INTO public."Auditoria reservacion"(
	"checkinNue", "checkoutNue", "fechaResNue", "totalNue", "id_clienteNue", "id_habNue", 
	usuario, modificado, accion, id_reservacion)
	VALUES (
	new.check_in,new.check_out,new.fecha_reservacion,new.total,new.id_cliente,new.id_habitacion,
	current_user,now(),'Agregado',new.id_reservacion);
	return new;
	end;$$;


ALTER FUNCTION public."agregaReservacion"() OWNER TO postgres;

--
-- Name: eliminaCliente(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."eliminaCliente"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$begin
INSERT INTO public."Auditoria cliente"(
	"nombreAnt", "apePateroAnt", "apeMaternoAnt", "correoAnt", "telefonoAnt", "direccionAnt", 
	usuario, modificado, accion, id_cliente)
	VALUES (
	old.nombres,old.apellido_materno,old.apellido_paterno,old.correo,old.telefono,old.direccion,
	current_user,now(),'Eliminado',old.id_cliente);
	return new;
	end;$$;


ALTER FUNCTION public."eliminaCliente"() OWNER TO postgres;

--
-- Name: eliminaHabitacion(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."eliminaHabitacion"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$begin
INSERT INTO public."Auditoria habitacion"(
	"nuHabAnt", "tipoHabAnt", "precioNocAnt", "estadoAnt",  
	usuario, modificado, accion, id_habitacion)
	VALUES (
	old.numero_habitacion,old.tipo_habitacion,old.precio_noche,old.estado,
	current_user,now(),'Eliminado',old.id_habitacion);
	return new;
	end;$$;


ALTER FUNCTION public."eliminaHabitacion"() OWNER TO postgres;

--
-- Name: eliminaPago(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."eliminaPago"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$begin
INSERT INTO public."Auditoria pago"(
	"fecPagoAnt", "monPagoAnt", "metPagoAnt", "id_resAnt", 
	usuario, modificado, accion, id_pago)
	VALUES (
	old.fecha_pago,old.monto_pagado,old.metodo_pago,old.id_reservacion,
	current_user,now(),'Eliminado',old.id_pago);
	return new;
	end;$$;


ALTER FUNCTION public."eliminaPago"() OWNER TO postgres;

--
-- Name: eliminaReservacion(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."eliminaReservacion"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$begin
INSERT INTO public."Auditoria reservacion"(
	"checkinAnt", "checkoutAnt", "fechaResAnt", "totalAnt", "id_clienteAnt", "id_habAnt", 
	usuario, modificado, accion, id_reservacion)
	VALUES (
	old.check_in,old.check_out,old.fecha_reservacion,old.total,old.id_cliente,old.id_habitacion,
	current_user,now(),'Eliminado',old.id_reservacion);
	return new;
	end;$$;


ALTER FUNCTION public."eliminaReservacion"() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Auditoria cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Auditoria cliente" (
    id integer NOT NULL,
    "nombreAnt" character varying(50),
    "apePateroAnt" character varying(50),
    "apeMaternoAnt" character varying(50),
    "correoAnt" character varying(50),
    "telefonoAnt" integer,
    "direccionAnt" character varying(50),
    "nombreNue" character varying(50),
    "apePateroNue" character varying(50),
    "apeMaternoNue" character varying(50),
    "correoNue" character varying(50),
    "telefonoNue" integer,
    "direccionNue" character varying(50),
    usuario character varying(50),
    modificado time without time zone,
    accion character varying(50),
    id_cliente integer
);


ALTER TABLE public."Auditoria cliente" OWNER TO postgres;

--
-- Name: Auditoria Cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Auditoria Cliente_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Auditoria Cliente_id_seq" OWNER TO postgres;

--
-- Name: Auditoria Cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Auditoria Cliente_id_seq" OWNED BY public."Auditoria cliente".id;


--
-- Name: Auditoria habitacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Auditoria habitacion" (
    id integer NOT NULL,
    "nuHabAnt" integer,
    "tipoHabAnt" character varying(50),
    "precioNocAnt" double precision,
    "estadoAnt" character varying(50),
    "nuHabNue" integer,
    "tipoHabNue" character varying(50),
    "precioNocNue" double precision,
    "estadoNue" character varying(50),
    usuario character varying(50),
    modificado time without time zone,
    accion character varying(50),
    id_habitacion integer
);


ALTER TABLE public."Auditoria habitacion" OWNER TO postgres;

--
-- Name: Auditoria habitacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Auditoria habitacion_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Auditoria habitacion_id_seq" OWNER TO postgres;

--
-- Name: Auditoria habitacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Auditoria habitacion_id_seq" OWNED BY public."Auditoria habitacion".id;


--
-- Name: Auditoria pago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Auditoria pago" (
    id integer NOT NULL,
    "fecPagoAnt" timestamp with time zone,
    "monPagoAnt" double precision,
    "metPagoAnt" character varying(50),
    "id_resAnt" integer,
    "fecPagoNue" timestamp with time zone,
    "monPagoNue" double precision,
    "metPagoNue" character varying(50),
    "id_resNue" integer,
    usuario character varying(50),
    modificado time without time zone,
    accion character varying(50),
    id_pago integer
);


ALTER TABLE public."Auditoria pago" OWNER TO postgres;

--
-- Name: Auditoria pago_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Auditoria pago_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Auditoria pago_id_seq" OWNER TO postgres;

--
-- Name: Auditoria pago_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Auditoria pago_id_seq" OWNED BY public."Auditoria pago".id;


--
-- Name: Auditoria reservacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Auditoria reservacion" (
    id integer NOT NULL,
    "checkinAnt" timestamp with time zone,
    "checkoutAnt" timestamp with time zone,
    "fechaResAnt" timestamp with time zone,
    "totalAnt" double precision,
    "id_clienteAnt" integer,
    "id_habAnt" integer,
    "checkinNue" timestamp with time zone,
    "checkoutNue" timestamp with time zone,
    "fechaResNue" timestamp with time zone,
    "totalNue" double precision,
    "id_clienteNue" integer,
    "id_habNue" integer,
    usuario character varying(50),
    modificado time with time zone,
    accion character varying(50),
    id_reservacion integer
);


ALTER TABLE public."Auditoria reservacion" OWNER TO postgres;

--
-- Name: Auditoria reservacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Auditoria reservacion_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Auditoria reservacion_id_seq" OWNER TO postgres;

--
-- Name: Auditoria reservacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Auditoria reservacion_id_seq" OWNED BY public."Auditoria reservacion".id;


--
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    nombres character varying(50),
    apellido_materno character varying(50),
    apellido_paterno character varying(50),
    correo character varying(100),
    telefono integer,
    direccion character varying(100),
    id_cliente integer NOT NULL
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- Name: cliente_id_cliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cliente_id_cliente_seq OWNER TO postgres;

--
-- Name: cliente_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_id_cliente_seq OWNED BY public.cliente.id_cliente;


--
-- Name: habitacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.habitacion (
    numero_habitacion integer,
    tipo_habitacion character varying(40),
    precio_noche double precision,
    estado character varying(40),
    id_habitacion integer NOT NULL
);


ALTER TABLE public.habitacion OWNER TO postgres;

--
-- Name: habitacion_id_habitacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.habitacion_id_habitacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.habitacion_id_habitacion_seq OWNER TO postgres;

--
-- Name: habitacion_id_habitacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.habitacion_id_habitacion_seq OWNED BY public.habitacion.id_habitacion;


--
-- Name: pago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pago (
    id_pago integer NOT NULL,
    fecha_pago timestamp with time zone,
    monto_pagado double precision,
    metodo_pago character varying(40),
    id_reservacion integer
);


ALTER TABLE public.pago OWNER TO postgres;

--
-- Name: pago_id_pago_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pago_id_pago_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pago_id_pago_seq OWNER TO postgres;

--
-- Name: pago_id_pago_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pago_id_pago_seq OWNED BY public.pago.id_pago;


--
-- Name: reservacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservacion (
    check_in timestamp without time zone,
    check_out timestamp without time zone,
    fecha_reservacion timestamp with time zone,
    total double precision,
    id_cliente integer,
    id_habitacion integer,
    id_reservacion integer NOT NULL
);


ALTER TABLE public.reservacion OWNER TO postgres;

--
-- Name: reservacion_id_reservacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reservacion_id_reservacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reservacion_id_reservacion_seq OWNER TO postgres;

--
-- Name: reservacion_id_reservacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reservacion_id_reservacion_seq OWNED BY public.reservacion.id_reservacion;


--
-- Name: Auditoria cliente id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Auditoria cliente" ALTER COLUMN id SET DEFAULT nextval('public."Auditoria Cliente_id_seq"'::regclass);


--
-- Name: Auditoria habitacion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Auditoria habitacion" ALTER COLUMN id SET DEFAULT nextval('public."Auditoria habitacion_id_seq"'::regclass);


--
-- Name: Auditoria pago id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Auditoria pago" ALTER COLUMN id SET DEFAULT nextval('public."Auditoria pago_id_seq"'::regclass);


--
-- Name: Auditoria reservacion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Auditoria reservacion" ALTER COLUMN id SET DEFAULT nextval('public."Auditoria reservacion_id_seq"'::regclass);


--
-- Name: cliente id_cliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN id_cliente SET DEFAULT nextval('public.cliente_id_cliente_seq'::regclass);


--
-- Name: habitacion id_habitacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habitacion ALTER COLUMN id_habitacion SET DEFAULT nextval('public.habitacion_id_habitacion_seq'::regclass);


--
-- Name: pago id_pago; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago ALTER COLUMN id_pago SET DEFAULT nextval('public.pago_id_pago_seq'::regclass);


--
-- Name: reservacion id_reservacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservacion ALTER COLUMN id_reservacion SET DEFAULT nextval('public.reservacion_id_reservacion_seq'::regclass);


--
-- Data for Name: Auditoria cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Auditoria cliente" (id, "nombreAnt", "apePateroAnt", "apeMaternoAnt", "correoAnt", "telefonoAnt", "direccionAnt", "nombreNue", "apePateroNue", "apeMaternoNue", "correoNue", "telefonoNue", "direccionNue", usuario, modificado, accion, id_cliente) FROM stdin;
1	\N	\N	\N	\N	\N	\N	juan	perez	lopez	ucuri@gmail.com	632838	neza	postgres	12:35:32.110674	Agregado	1
2	juan	perez	lopez	ucuri@gmail.com	632838	neza	juan	monte	lopez	ucuri@gmail.com	632838	neza	postgres	12:35:42.148503	Modificado	1
3	juan	monte	lopez	ucuri@gmail.com	632838	neza	\N	\N	\N	\N	\N	\N	postgres	12:35:45.822165	Eliminado	1
4	\N	\N	\N	\N	\N	\N	tewt	twt	wtw\n	iri@gmail.com\n	52235	neza	postgres	12:38:02.209827	Agregado	1
\.


--
-- Data for Name: Auditoria habitacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Auditoria habitacion" (id, "nuHabAnt", "tipoHabAnt", "precioNocAnt", "estadoAnt", "nuHabNue", "tipoHabNue", "precioNocNue", "estadoNue", usuario, modificado, accion, id_habitacion) FROM stdin;
1	\N	\N	\N	\N	1	completa	1200	ocupado	postgres	12:36:39.464478	Agregado	1
2	1	completa	1200	ocupado	1	media	1200	ocupado	postgres	12:36:46.215147	Modificado	1
3	1	media	1200	ocupado	\N	\N	\N	\N	postgres	12:36:49.782311	Eliminado	1
4	\N	\N	\N	\N	123	completa	1200	ocupada	postgres	12:38:30.720671	Agregado	1
\.


--
-- Data for Name: Auditoria pago; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Auditoria pago" (id, "fecPagoAnt", "monPagoAnt", "metPagoAnt", "id_resAnt", "fecPagoNue", "monPagoNue", "metPagoNue", "id_resNue", usuario, modificado, accion, id_pago) FROM stdin;
1	\N	\N	\N	\N	2024-08-19 00:00:00-06	3200	efectivo	1	postgres	12:41:02.900829	Agregado	1
2	2024-08-19 00:00:00-06	3200	efectivo	1	2024-08-19 00:00:00-06	4300	efectivo	1	postgres	12:41:11.573888	Actualizado	1
3	2024-08-19 00:00:00-06	4300	efectivo	1	\N	\N	\N	\N	postgres	12:41:16.685058	Eliminado	1
\.


--
-- Data for Name: Auditoria reservacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Auditoria reservacion" (id, "checkinAnt", "checkoutAnt", "fechaResAnt", "totalAnt", "id_clienteAnt", "id_habAnt", "checkinNue", "checkoutNue", "fechaResNue", "totalNue", "id_clienteNue", "id_habNue", usuario, modificado, accion, id_reservacion) FROM stdin;
1	\N	\N	\N	\N	\N	\N	2024-08-19 00:00:00-06	2024-08-19 00:00:00-06	2024-08-19 00:00:00-06	3200	1	1	postgres	12:40:26.767893-06	Agregado	1
2	2024-08-19 00:00:00-06	2024-08-19 00:00:00-06	2024-08-19 00:00:00-06	3200	1	1	2024-08-19 00:00:00-06	2024-08-19 00:00:00-06	2024-08-19 00:00:00-06	5000	1	1	postgres	12:41:30.144889-06	Actualizado	1
3	2024-08-19 00:00:00-06	2024-08-19 00:00:00-06	2024-08-19 00:00:00-06	5000	1	1	\N	\N	\N	\N	\N	\N	postgres	12:41:35.142346-06	Eliminado	1
\.


--
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (nombres, apellido_materno, apellido_paterno, correo, telefono, direccion, id_cliente) FROM stdin;
tewt	twt	wtw\n	iri@gmail.com\n	52235	neza	1
\.


--
-- Data for Name: habitacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.habitacion (numero_habitacion, tipo_habitacion, precio_noche, estado, id_habitacion) FROM stdin;
123	completa	1200	ocupada	1
\.


--
-- Data for Name: pago; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pago (id_pago, fecha_pago, monto_pagado, metodo_pago, id_reservacion) FROM stdin;
\.


--
-- Data for Name: reservacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservacion (check_in, check_out, fecha_reservacion, total, id_cliente, id_habitacion, id_reservacion) FROM stdin;
\.


--
-- Name: Auditoria Cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Auditoria Cliente_id_seq"', 4, true);


--
-- Name: Auditoria habitacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Auditoria habitacion_id_seq"', 4, true);


--
-- Name: Auditoria pago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Auditoria pago_id_seq"', 3, true);


--
-- Name: Auditoria reservacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Auditoria reservacion_id_seq"', 3, true);


--
-- Name: cliente_id_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_id_cliente_seq', 1, false);


--
-- Name: habitacion_id_habitacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.habitacion_id_habitacion_seq', 1, false);


--
-- Name: pago_id_pago_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pago_id_pago_seq', 1, false);


--
-- Name: reservacion_id_reservacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservacion_id_reservacion_seq', 1, false);


--
-- Name: Auditoria cliente Auditoria Cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Auditoria cliente"
    ADD CONSTRAINT "Auditoria Cliente_pkey" PRIMARY KEY (id);


--
-- Name: Auditoria habitacion Auditoria habitacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Auditoria habitacion"
    ADD CONSTRAINT "Auditoria habitacion_pkey" PRIMARY KEY (id);


--
-- Name: Auditoria pago Auditoria pago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Auditoria pago"
    ADD CONSTRAINT "Auditoria pago_pkey" PRIMARY KEY (id);


--
-- Name: Auditoria reservacion Auditoria reservacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Auditoria reservacion"
    ADD CONSTRAINT "Auditoria reservacion_pkey" PRIMARY KEY (id);


--
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);


--
-- Name: habitacion habitacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habitacion
    ADD CONSTRAINT habitacion_pkey PRIMARY KEY (id_habitacion);


--
-- Name: pago pago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago
    ADD CONSTRAINT pago_pkey PRIMARY KEY (id_pago);


--
-- Name: reservacion reservacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservacion
    ADD CONSTRAINT reservacion_pkey PRIMARY KEY (id_reservacion);


--
-- Name: cliente actualizaCliente; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "actualizaCliente" AFTER UPDATE ON public.cliente FOR EACH ROW EXECUTE FUNCTION public."actualizaCliente"();


--
-- Name: habitacion actualizaHabitacion; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "actualizaHabitacion" AFTER UPDATE ON public.habitacion FOR EACH ROW EXECUTE FUNCTION public."actualizaHabitacion"();


--
-- Name: pago actualizaPago; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "actualizaPago" AFTER UPDATE ON public.pago FOR EACH ROW EXECUTE FUNCTION public."actualizaPago"();


--
-- Name: reservacion actualizaReservacion; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "actualizaReservacion" AFTER UPDATE ON public.reservacion FOR EACH ROW EXECUTE FUNCTION public."actualizaReservacion"();


--
-- Name: cliente agregaCliente; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "agregaCliente" AFTER INSERT ON public.cliente FOR EACH ROW EXECUTE FUNCTION public."agregaCliente"();


--
-- Name: habitacion agregaHabitacion; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "agregaHabitacion" AFTER INSERT ON public.habitacion FOR EACH ROW EXECUTE FUNCTION public."agregaHabitacion"();


--
-- Name: pago agregaPago; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "agregaPago" AFTER INSERT ON public.pago FOR EACH ROW EXECUTE FUNCTION public."agregaPago"();


--
-- Name: reservacion agregaReservacion; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "agregaReservacion" AFTER INSERT ON public.reservacion FOR EACH ROW EXECUTE FUNCTION public."agregaReservacion"();


--
-- Name: cliente eliminaCliente; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "eliminaCliente" AFTER DELETE ON public.cliente FOR EACH ROW EXECUTE FUNCTION public."eliminaCliente"();


--
-- Name: habitacion eliminaHabitacion; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "eliminaHabitacion" AFTER DELETE ON public.habitacion FOR EACH ROW EXECUTE FUNCTION public."eliminaHabitacion"();


--
-- Name: pago eliminaPago; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "eliminaPago" AFTER DELETE ON public.pago FOR EACH ROW EXECUTE FUNCTION public."eliminaPago"();


--
-- Name: reservacion eliminaReservacion; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "eliminaReservacion" AFTER DELETE ON public.reservacion FOR EACH ROW EXECUTE FUNCTION public."eliminaReservacion"();


--
-- Name: pago pago_id_reservacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago
    ADD CONSTRAINT pago_id_reservacion_fkey FOREIGN KEY (id_reservacion) REFERENCES public.reservacion(id_reservacion) NOT VALID;


--
-- Name: reservacion reservacion_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservacion
    ADD CONSTRAINT reservacion_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente) NOT VALID;


--
-- Name: reservacion reservacion_id_habitacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservacion
    ADD CONSTRAINT reservacion_id_habitacion_fkey FOREIGN KEY (id_habitacion) REFERENCES public.habitacion(id_habitacion) NOT VALID;


--
-- PostgreSQL database dump complete
--

