PGDMP      8            	    |            reservaciones    16.4    16.4 #    c           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            d           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            e           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            f           1262    16388    reservaciones    DATABASE     y   CREATE DATABASE reservaciones WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';
    DROP DATABASE reservaciones;
                postgres    false            �            1259    16389    cliente    TABLE       CREATE TABLE public.cliente (
    nombres character varying(50),
    apellido_materno character varying(50),
    apellido_paterno character varying(50),
    correo character varying(100),
    telefono integer,
    direccion character varying(100),
    id_cliente integer NOT NULL
);
    DROP TABLE public.cliente;
       public         heap    postgres    false            �            1259    16392    cliente_id_cliente_seq    SEQUENCE     �   CREATE SEQUENCE public.cliente_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.cliente_id_cliente_seq;
       public          postgres    false    215            g           0    0    cliente_id_cliente_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.cliente_id_cliente_seq OWNED BY public.cliente.id_cliente;
          public          postgres    false    216            �            1259    16393 
   habitacion    TABLE     �   CREATE TABLE public.habitacion (
    numero_habitacion integer,
    tipo_habitacion character varying(40),
    precio_noche double precision,
    estado character varying(40),
    id_habitacion integer NOT NULL
);
    DROP TABLE public.habitacion;
       public         heap    postgres    false            �            1259    16396    habitacion_id_habitacion_seq    SEQUENCE     �   CREATE SEQUENCE public.habitacion_id_habitacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.habitacion_id_habitacion_seq;
       public          postgres    false    217            h           0    0    habitacion_id_habitacion_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.habitacion_id_habitacion_seq OWNED BY public.habitacion.id_habitacion;
          public          postgres    false    218            �            1259    16397    pago    TABLE     �   CREATE TABLE public.pago (
    id_pago integer NOT NULL,
    fecha_pago timestamp with time zone,
    monto_pagado double precision,
    metodo_pago character varying(40),
    id_reservacion integer
);
    DROP TABLE public.pago;
       public         heap    postgres    false            �            1259    16400    pago_id_pago_seq    SEQUENCE     �   CREATE SEQUENCE public.pago_id_pago_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.pago_id_pago_seq;
       public          postgres    false    219            i           0    0    pago_id_pago_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.pago_id_pago_seq OWNED BY public.pago.id_pago;
          public          postgres    false    220            �            1259    16401    reservacion    TABLE       CREATE TABLE public.reservacion (
    check_in timestamp without time zone,
    check_out timestamp without time zone,
    fecha_reservacion timestamp with time zone,
    total double precision,
    id_cliente integer,
    id_habitacion integer,
    id_reservacion integer NOT NULL
);
    DROP TABLE public.reservacion;
       public         heap    postgres    false            �            1259    16404    reservacion_id_reservacion_seq    SEQUENCE     �   CREATE SEQUENCE public.reservacion_id_reservacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.reservacion_id_reservacion_seq;
       public          postgres    false    221            j           0    0    reservacion_id_reservacion_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.reservacion_id_reservacion_seq OWNED BY public.reservacion.id_reservacion;
          public          postgres    false    222            �           2604    16405    cliente id_cliente    DEFAULT     x   ALTER TABLE ONLY public.cliente ALTER COLUMN id_cliente SET DEFAULT nextval('public.cliente_id_cliente_seq'::regclass);
 A   ALTER TABLE public.cliente ALTER COLUMN id_cliente DROP DEFAULT;
       public          postgres    false    216    215            �           2604    16406    habitacion id_habitacion    DEFAULT     �   ALTER TABLE ONLY public.habitacion ALTER COLUMN id_habitacion SET DEFAULT nextval('public.habitacion_id_habitacion_seq'::regclass);
 G   ALTER TABLE public.habitacion ALTER COLUMN id_habitacion DROP DEFAULT;
       public          postgres    false    218    217            �           2604    16407    pago id_pago    DEFAULT     l   ALTER TABLE ONLY public.pago ALTER COLUMN id_pago SET DEFAULT nextval('public.pago_id_pago_seq'::regclass);
 ;   ALTER TABLE public.pago ALTER COLUMN id_pago DROP DEFAULT;
       public          postgres    false    220    219            �           2604    16408    reservacion id_reservacion    DEFAULT     �   ALTER TABLE ONLY public.reservacion ALTER COLUMN id_reservacion SET DEFAULT nextval('public.reservacion_id_reservacion_seq'::regclass);
 I   ALTER TABLE public.reservacion ALTER COLUMN id_reservacion DROP DEFAULT;
       public          postgres    false    222    221            Y          0    16389    cliente 
   TABLE DATA           w   COPY public.cliente (nombres, apellido_materno, apellido_paterno, correo, telefono, direccion, id_cliente) FROM stdin;
    public          postgres    false    215   �)       [          0    16393 
   habitacion 
   TABLE DATA           m   COPY public.habitacion (numero_habitacion, tipo_habitacion, precio_noche, estado, id_habitacion) FROM stdin;
    public          postgres    false    217   �)       ]          0    16397    pago 
   TABLE DATA           ^   COPY public.pago (id_pago, fecha_pago, monto_pagado, metodo_pago, id_reservacion) FROM stdin;
    public          postgres    false    219   �*       _          0    16401    reservacion 
   TABLE DATA              COPY public.reservacion (check_in, check_out, fecha_reservacion, total, id_cliente, id_habitacion, id_reservacion) FROM stdin;
    public          postgres    false    221   �*       k           0    0    cliente_id_cliente_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.cliente_id_cliente_seq', 1, false);
          public          postgres    false    216            l           0    0    habitacion_id_habitacion_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.habitacion_id_habitacion_seq', 18, true);
          public          postgres    false    218            m           0    0    pago_id_pago_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.pago_id_pago_seq', 1, false);
          public          postgres    false    220            n           0    0    reservacion_id_reservacion_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.reservacion_id_reservacion_seq', 1, false);
          public          postgres    false    222            �           2606    16410    cliente cliente_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    215            �           2606    16412    habitacion habitacion_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.habitacion
    ADD CONSTRAINT habitacion_pkey PRIMARY KEY (id_habitacion);
 D   ALTER TABLE ONLY public.habitacion DROP CONSTRAINT habitacion_pkey;
       public            postgres    false    217            �           2606    16414    pago pago_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.pago
    ADD CONSTRAINT pago_pkey PRIMARY KEY (id_pago);
 8   ALTER TABLE ONLY public.pago DROP CONSTRAINT pago_pkey;
       public            postgres    false    219            �           2606    16416    reservacion reservacion_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.reservacion
    ADD CONSTRAINT reservacion_pkey PRIMARY KEY (id_reservacion);
 F   ALTER TABLE ONLY public.reservacion DROP CONSTRAINT reservacion_pkey;
       public            postgres    false    221            �           2606    16417    pago pago_id_reservacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pago
    ADD CONSTRAINT pago_id_reservacion_fkey FOREIGN KEY (id_reservacion) REFERENCES public.reservacion(id_reservacion) NOT VALID;
 G   ALTER TABLE ONLY public.pago DROP CONSTRAINT pago_id_reservacion_fkey;
       public          postgres    false    219    221    4294            �           2606    16422 '   reservacion reservacion_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reservacion
    ADD CONSTRAINT reservacion_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente) NOT VALID;
 Q   ALTER TABLE ONLY public.reservacion DROP CONSTRAINT reservacion_id_cliente_fkey;
       public          postgres    false    221    215    4288            �           2606    16427 *   reservacion reservacion_id_habitacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reservacion
    ADD CONSTRAINT reservacion_id_habitacion_fkey FOREIGN KEY (id_habitacion) REFERENCES public.habitacion(id_habitacion) NOT VALID;
 T   ALTER TABLE ONLY public.reservacion DROP CONSTRAINT reservacion_id_habitacion_fkey;
       public          postgres    false    217    4290    221            Y      x������ � �      [   �   x���Mj1��)z��$ٞ�~���f�zap����	mǆ@v�O���Ty���R�*!R�r>��fQ(m��Ԡ���֡w5@e9�y�)B�~�;J���Z.Y4�i&X�z3�m���7Z�`�~�Z֓�ԳƸ�yp�1m|7�����z��bChu8�O�N���>�Z=O�\>۳�*>T�g|hs�3=�9���2���      ]      x������ � �      _      x������ � �     