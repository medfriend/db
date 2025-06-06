PGDMP                       }         
   med-friend    16.2 (Debian 16.2-1.pgdg120+2)     17.2 (Ubuntu 17.2-1.pgdg22.04+1)     '           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            (           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            )           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            *           1262    16384 
   med-friend    DATABASE     w   CREATE DATABASE "med-friend" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE "med-friend";
                     elliot    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                     pg_database_owner    false            +           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                        pg_database_owner    false    4            �            1259    16392    entidad_sequense    SEQUENCE     y   CREATE SEQUENCE public.entidad_sequense
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.entidad_sequense;
       public               elliot    false    4            �            1259    16419    menu_sequense    SEQUENCE     v   CREATE SEQUENCE public.menu_sequense
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.menu_sequense;
       public               elliot    false    4            �            1259    16426    permiso_sequense    SEQUENCE     y   CREATE SEQUENCE public.permiso_sequense
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.permiso_sequense;
       public               elliot    false    4            �            1259    16436    re-entidad-sede-sequense    SEQUENCE     �   CREATE SEQUENCE public."re-entidad-sede-sequense"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."re-entidad-sede-sequense";
       public               elliot    false    4            �            1259    16445    re-recurso-permiso_sequense    SEQUENCE     �   CREATE SEQUENCE public."re-recurso-permiso_sequense"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public."re-recurso-permiso_sequense";
       public               elliot    false    4            �            1259    16466    recurso_sequense    SEQUENCE     y   CREATE SEQUENCE public.recurso_sequense
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.recurso_sequense;
       public               elliot    false    4            �            1259    16450    rol-recurso_sequense    SEQUENCE        CREATE SEQUENCE public."rol-recurso_sequense"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."rol-recurso_sequense";
       public               elliot    false    4            �            1259    16481    rol_sequense    SEQUENCE     u   CREATE SEQUENCE public.rol_sequense
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.rol_sequense;
       public               elliot    false    4            �            1259    16486    sede_sequense    SEQUENCE     v   CREATE SEQUENCE public.sede_sequense
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.sede_sequense;
       public               elliot    false    4            �            1259    16494 $   trazabilidad-usuario-accion-sequence    SEQUENCE     �   CREATE SEQUENCE public."trazabilidad-usuario-accion-sequence"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public."trazabilidad-usuario-accion-sequence";
       public               elliot    false    4            �            1259    16499 #   trazabilidad-usuario-login-sequence    SEQUENCE     �   CREATE SEQUENCE public."trazabilidad-usuario-login-sequence"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public."trazabilidad-usuario-login-sequence";
       public               elliot    false    4            �            1259    16461    usuario-rol_sequense    SEQUENCE        CREATE SEQUENCE public."usuario-rol_sequense"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."usuario-rol_sequense";
       public               elliot    false    4            ,           0    0    entidad_sequense    SEQUENCE SET     >   SELECT pg_catalog.setval('public.entidad_sequense', 4, true);
          public               elliot    false    215            -           0    0    menu_sequense    SEQUENCE SET     <   SELECT pg_catalog.setval('public.menu_sequense', 23, true);
          public               elliot    false    216            .           0    0    permiso_sequense    SEQUENCE SET     >   SELECT pg_catalog.setval('public.permiso_sequense', 7, true);
          public               elliot    false    217            /           0    0    re-entidad-sede-sequense    SEQUENCE SET     I   SELECT pg_catalog.setval('public."re-entidad-sede-sequense"', 1, false);
          public               elliot    false    218            0           0    0    re-recurso-permiso_sequense    SEQUENCE SET     L   SELECT pg_catalog.setval('public."re-recurso-permiso_sequense"', 12, true);
          public               elliot    false    219            1           0    0    recurso_sequense    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.recurso_sequense', 15, true);
          public               elliot    false    222            2           0    0    rol-recurso_sequense    SEQUENCE SET     E   SELECT pg_catalog.setval('public."rol-recurso_sequense"', 17, true);
          public               elliot    false    220            3           0    0    rol_sequense    SEQUENCE SET     :   SELECT pg_catalog.setval('public.rol_sequense', 2, true);
          public               elliot    false    223            4           0    0    sede_sequense    SEQUENCE SET     <   SELECT pg_catalog.setval('public.sede_sequense', 1, false);
          public               elliot    false    224            5           0    0 $   trazabilidad-usuario-accion-sequence    SEQUENCE SET     U   SELECT pg_catalog.setval('public."trazabilidad-usuario-accion-sequence"', 1, false);
          public               elliot    false    225            6           0    0 #   trazabilidad-usuario-login-sequence    SEQUENCE SET     T   SELECT pg_catalog.setval('public."trazabilidad-usuario-login-sequence"', 1, false);
          public               elliot    false    226            7           0    0    usuario-rol_sequense    SEQUENCE SET     E   SELECT pg_catalog.setval('public."usuario-rol_sequense"', 11, true);
          public               elliot    false    221           