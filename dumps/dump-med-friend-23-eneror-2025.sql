PGDMP  %                     }         
   med-friend    16.2 (Debian 16.2-1.pgdg120+2)    16.4 (Homebrew) �               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                        0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            !           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            "           1262    16384 
   med-friend    DATABASE     w   CREATE DATABASE "med-friend" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE "med-friend";
                elliot    false            �            1259    16467    area    TABLE     u   CREATE TABLE public.area (
    area_id bigint NOT NULL,
    nombre character varying(128),
    hospital_id bigint
);
    DROP TABLE public.area;
       public         heap    elliot    false            �            1259    41438    entidad_sequense    SEQUENCE     y   CREATE SEQUENCE public.entidad_sequense
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.entidad_sequense;
       public          elliot    false            �            1259    16427    entidad    TABLE       CREATE TABLE public.entidad (
    entidad_id bigint DEFAULT nextval('public.entidad_sequense'::regclass) NOT NULL,
    nit bigint,
    nit_alterno character varying(254),
    razon_social character varying(254),
    email character varying(50),
    activo boolean
);
    DROP TABLE public.entidad;
       public         heap    elliot    false    238            �            1259    16422    equipo    TABLE     �   CREATE TABLE public.equipo (
    equipo_id bigint NOT NULL,
    "equipo-detalle-general_id" bigint,
    nombre character varying(128)
);
    DROP TABLE public.equipo;
       public         heap    elliot    false            #           0    0    COLUMN equipo.nombre    COMMENT     :   COMMENT ON COLUMN public.equipo.nombre IS 'marca-modelo';
          public          elliot    false    215            �            1259    16472    equipo-detalle-general    TABLE     �  CREATE TABLE public."equipo-detalle-general" (
    "equipo-detalle-general_id" bigint NOT NULL,
    marca character varying(128),
    modelo character varying(128),
    esgeneral boolean DEFAULT false,
    hospital_id bigint,
    "registro-invima" character varying(128),
    fecha_actualizacion_invima timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "esvalido-invima" boolean DEFAULT true,
    "tipo-equipo-id" bigint
);
 ,   DROP TABLE public."equipo-detalle-general";
       public         heap    elliot    false            $           0    0    TABLE "equipo-detalle-general"    COMMENT     m   COMMENT ON TABLE public."equipo-detalle-general" IS 'detalles general que pueden compartir  muchos equipos';
          public          elliot    false    223            %           0    0 %   COLUMN "equipo-detalle-general".marca    COMMENT     n   COMMENT ON COLUMN public."equipo-detalle-general".marca IS 'marca del equipo como lo puede mindray o baster';
          public          elliot    false    223            &           0    0 &   COLUMN "equipo-detalle-general".modelo    COMMENT     Q   COMMENT ON COLUMN public."equipo-detalle-general".modelo IS 'modelo del equipo';
          public          elliot    false    223            '           0    0 )   COLUMN "equipo-detalle-general".esgeneral    COMMENT     �   COMMENT ON COLUMN public."equipo-detalle-general".esgeneral IS 'este es verdadero o falso dependiendo si este detalle general esta carga para toda la aplicacion';
          public          elliot    false    223            (           0    0 +   COLUMN "equipo-detalle-general".hospital_id    COMMENT     �   COMMENT ON COLUMN public."equipo-detalle-general".hospital_id IS 'este es el caso en el detalle-general se cargue desde un hospital ya que los cargados desde la aplicacion no encuentra el equipo';
          public          elliot    false    223            )           0    0 1   COLUMN "equipo-detalle-general"."registro-invima"    COMMENT     �   COMMENT ON COLUMN public."equipo-detalle-general"."registro-invima" IS 'registro invima que se registra dentro de la aplicacion';
          public          elliot    false    223            *           0    0 :   COLUMN "equipo-detalle-general".fecha_actualizacion_invima    COMMENT     �   COMMENT ON COLUMN public."equipo-detalle-general".fecha_actualizacion_invima IS 'ultima vez donde se consulto el invima y se valido';
          public          elliot    false    223            +           0    0 1   COLUMN "equipo-detalle-general"."esvalido-invima"    COMMENT     q   COMMENT ON COLUMN public."equipo-detalle-general"."esvalido-invima" IS 'si el invima no se encuentra reportado';
          public          elliot    false    223            �            1259    106985    films    TABLE     �   CREATE TABLE public.films (
    code character(5) NOT NULL,
    title character varying(40) NOT NULL,
    did integer NOT NULL,
    date_prod date,
    kind character varying(10),
    len integer
);
    DROP TABLE public.films;
       public         heap    elliot    false            �            1259    16531    mantenimiento_correctivo    TABLE     �  CREATE TABLE public.mantenimiento_correctivo (
    mantenimiento_correctivo_id bigint NOT NULL,
    ficha bigint,
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_inicio_solucion timestamp without time zone,
    fecha_final_solucion timestamp without time zone,
    fecha_reicorporacion timestamp without time zone,
    responsable_id bigint,
    "re-equipo-area_id" bigint
);
 ,   DROP TABLE public.mantenimiento_correctivo;
       public         heap    elliot    false            ,           0    0    TABLE mantenimiento_correctivo    COMMENT     \   COMMENT ON TABLE public.mantenimiento_correctivo IS 'mantenimiento correctivos del equipo';
          public          elliot    false    233            -           0    0 %   COLUMN mantenimiento_correctivo.ficha    COMMENT     t   COMMENT ON COLUMN public.mantenimiento_correctivo.ficha IS 'la descripcion del daño del mantenimiento correctivo';
          public          elliot    false    233            .           0    0 5   COLUMN mantenimiento_correctivo.fecha_inicio_solucion    COMMENT     �   COMMENT ON COLUMN public.mantenimiento_correctivo.fecha_inicio_solucion IS 'inicio del trabajo sobre el manteniento, es el momento cuando el equipo pasa a manos del resposable de solucionar';
          public          elliot    false    233            /           0    0 4   COLUMN mantenimiento_correctivo.fecha_final_solucion    COMMENT     �   COMMENT ON COLUMN public.mantenimiento_correctivo.fecha_final_solucion IS 'finalizacion, el momento donde el responsable da solucion al problema';
          public          elliot    false    233            0           0    0 4   COLUMN mantenimiento_correctivo.fecha_reicorporacion    COMMENT     }   COMMENT ON COLUMN public.mantenimiento_correctivo.fecha_reicorporacion IS 'fecha en la que se reicorpora el equipo al area';
          public          elliot    false    233            �            1259    16537    mantenimiento_preventivo    TABLE     �  CREATE TABLE public.mantenimiento_preventivo (
    mantenimiento_preventivo_id bigint NOT NULL,
    responsable_id bigint,
    "re-equipo-area_id" bigint,
    fecha_asignacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_caducacion timestamp without time zone,
    fecha_finalizacion timestamp without time zone,
    "plantilla-mantenimiento-preventivo_id" bigint
);
 ,   DROP TABLE public.mantenimiento_preventivo;
       public         heap    elliot    false            1           0    0 .   COLUMN mantenimiento_preventivo.responsable_id    COMMENT     }   COMMENT ON COLUMN public.mantenimiento_preventivo.responsable_id IS 'id del usuario responsable del manteniento preventivo';
          public          elliot    false    234            2           0    0 0   COLUMN mantenimiento_preventivo.fecha_asignacion    COMMENT        COMMENT ON COLUMN public.mantenimiento_preventivo.fecha_asignacion IS 'fecha en la que se genera el mantenimiento preventivo';
          public          elliot    false    234            3           0    0 0   COLUMN mantenimiento_preventivo.fecha_caducacion    COMMENT     �   COMMENT ON COLUMN public.mantenimiento_preventivo.fecha_caducacion IS 'fecha limite en la cual se debe realizar el mantenimiento';
          public          elliot    false    234            4           0    0 2   COLUMN mantenimiento_preventivo.fecha_finalizacion    COMMENT     �   COMMENT ON COLUMN public.mantenimiento_preventivo.fecha_finalizacion IS 'fecha de en la que se realiza el mantenimiento preventivo';
          public          elliot    false    234            �            1259    41443    menu_sequense    SEQUENCE     v   CREATE SEQUENCE public.menu_sequense
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.menu_sequense;
       public          elliot    false            �            1259    16485    menu    TABLE     !  CREATE TABLE public.menu (
    menu_id bigint DEFAULT nextval('public.menu_sequense'::regclass) NOT NULL,
    menu_padre_id bigint,
    entidad_id bigint,
    recurso_id bigint,
    nombre character varying(128),
    descripcion character varying(255),
    icono character varying(128)
);
    DROP TABLE public.menu;
       public         heap    elliot    false    240            5           0    0    COLUMN menu.icono    COMMENT     a   COMMENT ON COLUMN public.menu.icono IS 'icono de maticon que se motrara dentro del desplegable';
          public          elliot    false    224            �            1259    49630    permiso_sequense    SEQUENCE     y   CREATE SEQUENCE public.permiso_sequense
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.permiso_sequense;
       public          elliot    false            �            1259    16434    permiso    TABLE     �   CREATE TABLE public.permiso (
    permiso_id bigint DEFAULT nextval('public.permiso_sequense'::regclass) NOT NULL,
    nombre character varying(128),
    accion character varying(2)
);
    DROP TABLE public.permiso;
       public         heap    elliot    false    244            6           0    0    COLUMN permiso.accion    COMMENT     t   COMMENT ON COLUMN public.permiso.accion IS 'que tipo de accion tendra ese permiso sobre el recurso 
[W,R,U,D,A,C]';
          public          elliot    false    217            �            1259    16490 "   plantilla-mantenimiento-preventivo    TABLE     �   CREATE TABLE public."plantilla-mantenimiento-preventivo" (
    "plantilla-mantenimiento-preventivo_id" integer NOT NULL,
    checklist json,
    observacion character varying,
    esgeneral boolean,
    hospital_id bigint,
    "tipo-equipo_id" bigint
);
 8   DROP TABLE public."plantilla-mantenimiento-preventivo";
       public         heap    elliot    false            7           0    0 5   COLUMN "plantilla-mantenimiento-preventivo".checklist    COMMENT     -  COMMENT ON COLUMN public."plantilla-mantenimiento-preventivo".checklist IS 'funcionalidades del mantenimiento preventivo ejemplo para mantenimiento de monitor 
{"pantalla": ["estado acpetable", "estado defiente", "no enciende"],
"enchufe": ["estado aceptable", "estado defiente", "no envia poder"]}';
          public          elliot    false    225            8           0    0 7   COLUMN "plantilla-mantenimiento-preventivo".observacion    COMMENT     �   COMMENT ON COLUMN public."plantilla-mantenimiento-preventivo".observacion IS 'observacion que se le realiza al mantenimiento preventivo';
          public          elliot    false    225            9           0    0 5   COLUMN "plantilla-mantenimiento-preventivo".esgeneral    COMMENT     �   COMMENT ON COLUMN public."plantilla-mantenimiento-preventivo".esgeneral IS 'si es una cargada por defecto por el sistema o es una creada por el hospital';
          public          elliot    false    225            �            1259    98794    re-entidad-sede-sequense    SEQUENCE     �   CREATE SEQUENCE public."re-entidad-sede-sequense"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."re-entidad-sede-sequense";
       public          elliot    false            �            1259    98789    re-entidad-sede    TABLE     �   CREATE TABLE public."re-entidad-sede" (
    "re-entidad-sede_id" integer DEFAULT nextval('public."re-entidad-sede-sequense"'::regclass) NOT NULL,
    sede_id integer,
    entidad_id integer
);
 %   DROP TABLE public."re-entidad-sede";
       public         heap    elliot    false    251            �            1259    16495    re-equipo-area    TABLE     |  CREATE TABLE public."re-equipo-area" (
    "re-equipo-area_id" bigint NOT NULL,
    placa character varying(128),
    area_id bigint,
    estado bigint,
    "numero-mantenimiento-preventivos" bigint,
    "numero-mantenimiento-correctivos" bigint,
    "se-encuentra-en-area" boolean DEFAULT true,
    "area-temporal-id" bigint,
    equipo_id bigint,
    "tipo-equipo_id" bigint
);
 $   DROP TABLE public."re-equipo-area";
       public         heap    elliot    false            :           0    0    TABLE "re-equipo-area"    COMMENT     X   COMMENT ON TABLE public."re-equipo-area" IS 'es una combinacion de marca-modelo-placa';
          public          elliot    false    226            ;           0    0    COLUMN "re-equipo-area".placa    COMMENT     ~   COMMENT ON COLUMN public."re-equipo-area".placa IS 'es el numero unico que se encuentra registrado dentro de la institucion';
          public          elliot    false    226            <           0    0    COLUMN "re-equipo-area".area_id    COMMENT     c   COMMENT ON COLUMN public."re-equipo-area".area_id IS 'area donde se encuentra asignado el equipo';
          public          elliot    false    226            =           0    0    COLUMN "re-equipo-area".estado    COMMENT     �   COMMENT ON COLUMN public."re-equipo-area".estado IS 'en que estado se encuentra el equipo si se encuentra en espera de mantenimiento preventivo o descontinuada por mantenimiento correctivo';
          public          elliot    false    226            >           0    0 :   COLUMN "re-equipo-area"."numero-mantenimiento-preventivos"    COMMENT     �   COMMENT ON COLUMN public."re-equipo-area"."numero-mantenimiento-preventivos" IS 'numero de mantenimiento preventivos que se le realizaron a este equipo';
          public          elliot    false    226            ?           0    0 :   COLUMN "re-equipo-area"."numero-mantenimiento-correctivos"    COMMENT     �   COMMENT ON COLUMN public."re-equipo-area"."numero-mantenimiento-correctivos" IS 'numero de mantenimiento correctivos realizados sobre el equipo';
          public          elliot    false    226            @           0    0 .   COLUMN "re-equipo-area"."se-encuentra-en-area"    COMMENT     r   COMMENT ON COLUMN public."re-equipo-area"."se-encuentra-en-area" IS 'se encuentra el equipo en la area asignada';
          public          elliot    false    226            A           0    0 *   COLUMN "re-equipo-area"."area-temporal-id"    COMMENT     �   COMMENT ON COLUMN public."re-equipo-area"."area-temporal-id" IS 'el caso que el equipo no se encuentre en su area pero se encuentra en nueva area por necesidad del hospital';
          public          elliot    false    226            B           0    0 (   COLUMN "re-equipo-area"."tipo-equipo_id"    COMMENT     �   COMMENT ON COLUMN public."re-equipo-area"."tipo-equipo_id" IS 'tipo de equipo al cual se encuentra relacionado el equipo con la finalidad de sacar la plantilla-mantenimiento-preventivo';
          public          elliot    false    226            �            1259    49632    re-recurso-permiso_sequense    SEQUENCE     �   CREATE SEQUENCE public."re-recurso-permiso_sequense"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public."re-recurso-permiso_sequense";
       public          elliot    false            �            1259    16501    re-recurso-permiso    TABLE     �   CREATE TABLE public."re-recurso-permiso" (
    "re-recurso-permiso_id" bigint DEFAULT nextval('public."re-recurso-permiso_sequense"'::regclass) NOT NULL,
    recurso_id bigint,
    rol_id bigint,
    permiso_id integer
);
 (   DROP TABLE public."re-recurso-permiso";
       public         heap    elliot    false    245            �            1259    41451    rol-recurso_sequense    SEQUENCE        CREATE SEQUENCE public."rol-recurso_sequense"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."rol-recurso_sequense";
       public          elliot    false            �            1259    16506    re-rol-recurso    TABLE     �   CREATE TABLE public."re-rol-recurso" (
    "re-rol-recurso_id" bigint DEFAULT nextval('public."rol-recurso_sequense"'::regclass) NOT NULL,
    rol_id bigint,
    recurso_id bigint,
    entidad_id bigint,
    acceso character varying(7)
);
 $   DROP TABLE public."re-rol-recurso";
       public         heap    elliot    false    243            C           0    0 +   COLUMN "re-rol-recurso"."re-rol-recurso_id"    COMMENT     j   COMMENT ON COLUMN public."re-rol-recurso"."re-rol-recurso_id" IS 'relacion entre rol recurso y hospital';
          public          elliot    false    228            D           0    0    COLUMN "re-rol-recurso".acceso    COMMENT     �   COMMENT ON COLUMN public."re-rol-recurso".acceso IS 'tipo de acceso parcial o total [PARCIAL, TOTAL], parcial solo puedo ver mi hospital, total puedo ver la informacion de todos los hospitales dentro del grupo hospitalario';
          public          elliot    false    228            �            1259    16511    re-usuario-area    TABLE     �   CREATE TABLE public."re-usuario-area" (
    "re-usuario-area_id" bigint NOT NULL,
    area_id bigint,
    usuario_id bigint,
    hospital_id bigint
);
 %   DROP TABLE public."re-usuario-area";
       public         heap    elliot    false            �            1259    98806    re-usuario-entidad-sede    TABLE     �   CREATE TABLE public."re-usuario-entidad-sede" (
    "re-usuario-entidad-sede_id" integer NOT NULL,
    usuario_id integer,
    entidad_id integer,
    sede_id integer
);
 -   DROP TABLE public."re-usuario-entidad-sede";
       public         heap    elliot    false            �            1259    41447    usuario-rol_sequense    SEQUENCE        CREATE SEQUENCE public."usuario-rol_sequense"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."usuario-rol_sequense";
       public          elliot    false            �            1259    16516    re-usuario-rol    TABLE     ?  CREATE TABLE public."re-usuario-rol" (
    "re-usuario-rol_id" bigint DEFAULT nextval('public."usuario-rol_sequense"'::regclass) NOT NULL,
    usuario_id bigint,
    rol_id bigint,
    entidad_id bigint,
    fecha_inicio timestamp without time zone,
    fecha_fin timestamp without time zone,
    indefinido boolean
);
 $   DROP TABLE public."re-usuario-rol";
       public         heap    elliot    false    242            �            1259    41440    recurso_sequense    SEQUENCE     y   CREATE SEQUENCE public.recurso_sequense
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.recurso_sequense;
       public          elliot    false            �            1259    16439    recurso    TABLE     �   CREATE TABLE public.recurso (
    recurso_id bigint DEFAULT nextval('public.recurso_sequense'::regclass) NOT NULL,
    descripcion character varying(255),
    acceso character varying(1024)
);
    DROP TABLE public.recurso;
       public         heap    elliot    false    239            E           0    0    COLUMN recurso.acceso    COMMENT     |   COMMENT ON COLUMN public.recurso.acceso IS 'este es el url por el que se accede al recurso por ejemplo dominio.com/acceso';
          public          elliot    false    218            �            1259    16446    repuesto    TABLE     |   CREATE TABLE public.repuesto (
    repuesto_id bigint NOT NULL,
    nombre character varying(128),
    equipo_id integer
);
    DROP TABLE public.repuesto;
       public         heap    elliot    false            �            1259    16543 "   respuesto-mantenimiento-correctivo    TABLE       CREATE TABLE public."respuesto-mantenimiento-correctivo" (
    "respuesto-mantenimiento-correctivo_id" bigint NOT NULL,
    repuesto_id bigint,
    mantenimiento_correctivo_id bigint,
    disponible boolean DEFAULT false,
    utilizados bigint DEFAULT 0
);
 8   DROP TABLE public."respuesto-mantenimiento-correctivo";
       public         heap    elliot    false            �            1259    41445    rol_sequense    SEQUENCE     u   CREATE SEQUENCE public.rol_sequense
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.rol_sequense;
       public          elliot    false            �            1259    16451    rol    TABLE     �   CREATE TABLE public.rol (
    rol_id integer DEFAULT nextval('public.rol_sequense'::regclass) NOT NULL,
    nombre character varying(128),
    descripcion character varying(255),
    entidad_id bigint,
    activo boolean
);
    DROP TABLE public.rol;
       public         heap    elliot    false    241            F           0    0    COLUMN rol.entidad_id    COMMENT     b   COMMENT ON COLUMN public.rol.entidad_id IS 'id del hospital al que se encuentra asignado el rol';
          public          elliot    false    220            �            1259    98787    sede_sequense    SEQUENCE     v   CREATE SEQUENCE public.sede_sequense
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.sede_sequense;
       public          elliot    false            �            1259    98782    sede    TABLE     �   CREATE TABLE public.sede (
    nombre character varying(128),
    direccion character varying(128),
    sede_id integer DEFAULT nextval('public.sede_sequense'::regclass) NOT NULL
);
    DROP TABLE public.sede;
       public         heap    elliot    false    249            �            1259    16456    tipo-equipo    TABLE     o   CREATE TABLE public."tipo-equipo" (
    nombre character varying(128),
    "tipo-equipo_id" bigint NOT NULL
);
 !   DROP TABLE public."tipo-equipo";
       public         heap    elliot    false            G           0    0    COLUMN "tipo-equipo".nombre    COMMENT     �   COMMENT ON COLUMN public."tipo-equipo".nombre IS 'nombre del tipo de equipo pueden ser monitores, rayos x los que se encuentren contemplados en la normativa';
          public          elliot    false    221            �            1259    74210 $   trazabilidad-usuario-accion-sequence    SEQUENCE     �   CREATE SEQUENCE public."trazabilidad-usuario-accion-sequence"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public."trazabilidad-usuario-accion-sequence";
       public          elliot    false            �            1259    16519    trazabilidad-usuario-accion    TABLE     �  CREATE TABLE public."trazabilidad-usuario-accion" (
    "trazabalidad-usuario-accion_id" bigint DEFAULT nextval('public."trazabilidad-usuario-accion-sequence"'::regclass) NOT NULL,
    usuario_id bigint,
    recurso_id bigint,
    permiso_id bigint,
    accion character varying(2),
    fecha_ejecucion timestamp without time zone,
    estado integer,
    mensaje character varying(256)
);
 1   DROP TABLE public."trazabilidad-usuario-accion";
       public         heap    elliot    false    247            H           0    0 +   COLUMN "trazabilidad-usuario-accion".estado    COMMENT     |   COMMENT ON COLUMN public."trazabilidad-usuario-accion".estado IS 'si este finalizo con 200 OK o con algun estado de error';
          public          elliot    false    231            I           0    0 ,   COLUMN "trazabilidad-usuario-accion".mensaje    COMMENT     g   COMMENT ON COLUMN public."trazabilidad-usuario-accion".mensaje IS 'mensaje que devuelve la ejecucion';
          public          elliot    false    231            �            1259    74208 #   trazabilidad-usuario-login-sequence    SEQUENCE     �   CREATE SEQUENCE public."trazabilidad-usuario-login-sequence"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public."trazabilidad-usuario-login-sequence";
       public          elliot    false            �            1259    16524    trazabilidad-usuario-login    TABLE     f  CREATE TABLE public."trazabilidad-usuario-login" (
    "trazabilidad-usuario-login_id" bigint DEFAULT nextval('public."trazabilidad-usuario-login-sequence"'::regclass) NOT NULL,
    fecha_ingreso timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    usuario_id bigint,
    fecha_salida timestamp without time zone,
    caducada boolean DEFAULT false
);
 0   DROP TABLE public."trazabilidad-usuario-login";
       public         heap    elliot    false    246            J           0    0 "   TABLE "trazabilidad-usuario-login"    COMMENT     s   COMMENT ON TABLE public."trazabilidad-usuario-login" IS 'trazabilidad de acceso del los usuarios a la aplicacion';
          public          elliot    false    232            K           0    0 1   COLUMN "trazabilidad-usuario-login".fecha_ingreso    COMMENT     w   COMMENT ON COLUMN public."trazabilidad-usuario-login".fecha_ingreso IS 'fecha de ingreso del usuario a la aplicacion';
          public          elliot    false    232            L           0    0 0   COLUMN "trazabilidad-usuario-login".fecha_salida    COMMENT     �   COMMENT ON COLUMN public."trazabilidad-usuario-login".fecha_salida IS 'fecha de salida del usuario si es null se encuentra con seccion abierta';
          public          elliot    false    232            M           0    0 ,   COLUMN "trazabilidad-usuario-login".caducada    COMMENT     j   COMMENT ON COLUMN public."trazabilidad-usuario-login".caducada IS 'si el usuario ya caducado su seccion';
          public          elliot    false    232            �            1259    33282    usuario    TABLE     1  CREATE TABLE public.usuario (
    usuario_id bigint NOT NULL,
    usuario bigint,
    nombre_1 character varying,
    nombre_2 character varying,
    apellido_paterno character varying(20),
    apellido_materno character varying(20),
    email character varying(50),
    cambiar_clave boolean,
    fecha_cambio_clave timestamp without time zone,
    fecha_creacion timestamp without time zone,
    activo boolean,
    fecha_retiro timestamp without time zone,
    tiempo_valides_token character varying(10),
    clave character varying(100),
    edad bigint
);
    DROP TABLE public.usuario;
       public         heap    elliot    false            N           0    0    COLUMN usuario.usuario    COMMENT     J   COMMENT ON COLUMN public.usuario.usuario IS 'identificacion del usuario';
          public          elliot    false    237            O           0    0    COLUMN usuario.nombre_1    COMMENT     J   COMMENT ON COLUMN public.usuario.nombre_1 IS 'primer nombre del usuario';
          public          elliot    false    237            P           0    0    COLUMN usuario.nombre_2    COMMENT     K   COMMENT ON COLUMN public.usuario.nombre_2 IS 'segundo nombre del usuario';
          public          elliot    false    237            �            1259    33281    usuario_serial_usuario_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_serial_usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.usuario_serial_usuario_id_seq;
       public          elliot    false    237            Q           0    0    usuario_serial_usuario_id_seq    SEQUENCE OWNED BY     X   ALTER SEQUENCE public.usuario_serial_usuario_id_seq OWNED BY public.usuario.usuario_id;
          public          elliot    false    236                       2604    82387    usuario usuario_id    DEFAULT        ALTER TABLE ONLY public.usuario ALTER COLUMN usuario_id SET DEFAULT nextval('public.usuario_serial_usuario_id_seq'::regclass);
 A   ALTER TABLE public.usuario ALTER COLUMN usuario_id DROP DEFAULT;
       public          elliot    false    237    236    237            �          0    16467    area 
   TABLE DATA           <   COPY public.area (area_id, nombre, hospital_id) FROM stdin;
    public          elliot    false    222   �
      �          0    16427    entidad 
   TABLE DATA           \   COPY public.entidad (entidad_id, nit, nit_alterno, razon_social, email, activo) FROM stdin;
    public          elliot    false    216   �
      �          0    16422    equipo 
   TABLE DATA           P   COPY public.equipo (equipo_id, "equipo-detalle-general_id", nombre) FROM stdin;
    public          elliot    false    215   f      �          0    16472    equipo-detalle-general 
   TABLE DATA           �   COPY public."equipo-detalle-general" ("equipo-detalle-general_id", marca, modelo, esgeneral, hospital_id, "registro-invima", fecha_actualizacion_invima, "esvalido-invima", "tipo-equipo-id") FROM stdin;
    public          elliot    false    223   �                0    106985    films 
   TABLE DATA           G   COPY public.films (code, title, did, date_prod, kind, len) FROM stdin;
    public          elliot    false    253   �                0    16531    mantenimiento_correctivo 
   TABLE DATA           �   COPY public.mantenimiento_correctivo (mantenimiento_correctivo_id, ficha, fecha_creacion, fecha_inicio_solucion, fecha_final_solucion, fecha_reicorporacion, responsable_id, "re-equipo-area_id") FROM stdin;
    public          elliot    false    233   �      	          0    16537    mantenimiento_preventivo 
   TABLE DATA           �   COPY public.mantenimiento_preventivo (mantenimiento_preventivo_id, responsable_id, "re-equipo-area_id", fecha_asignacion, fecha_caducacion, fecha_finalizacion, "plantilla-mantenimiento-preventivo_id") FROM stdin;
    public          elliot    false    234         �          0    16485    menu 
   TABLE DATA           j   COPY public.menu (menu_id, menu_padre_id, entidad_id, recurso_id, nombre, descripcion, icono) FROM stdin;
    public          elliot    false    224   .      �          0    16434    permiso 
   TABLE DATA           =   COPY public.permiso (permiso_id, nombre, accion) FROM stdin;
    public          elliot    false    217                    0    16490 "   plantilla-mantenimiento-preventivo 
   TABLE DATA           �   COPY public."plantilla-mantenimiento-preventivo" ("plantilla-mantenimiento-preventivo_id", checklist, observacion, esgeneral, hospital_id, "tipo-equipo_id") FROM stdin;
    public          elliot    false    225   �                0    98789    re-entidad-sede 
   TABLE DATA           V   COPY public."re-entidad-sede" ("re-entidad-sede_id", sede_id, entidad_id) FROM stdin;
    public          elliot    false    250   �                0    16495    re-equipo-area 
   TABLE DATA           �   COPY public."re-equipo-area" ("re-equipo-area_id", placa, area_id, estado, "numero-mantenimiento-preventivos", "numero-mantenimiento-correctivos", "se-encuentra-en-area", "area-temporal-id", equipo_id, "tipo-equipo_id") FROM stdin;
    public          elliot    false    226   �                0    16501    re-recurso-permiso 
   TABLE DATA           g   COPY public."re-recurso-permiso" ("re-recurso-permiso_id", recurso_id, rol_id, permiso_id) FROM stdin;
    public          elliot    false    227   �                0    16506    re-rol-recurso 
   TABLE DATA           g   COPY public."re-rol-recurso" ("re-rol-recurso_id", rol_id, recurso_id, entidad_id, acceso) FROM stdin;
    public          elliot    false    228                   0    16511    re-usuario-area 
   TABLE DATA           c   COPY public."re-usuario-area" ("re-usuario-area_id", area_id, usuario_id, hospital_id) FROM stdin;
    public          elliot    false    229   p                0    98806    re-usuario-entidad-sede 
   TABLE DATA           r   COPY public."re-usuario-entidad-sede" ("re-usuario-entidad-sede_id", usuario_id, entidad_id, sede_id) FROM stdin;
    public          elliot    false    252   �                0    16516    re-usuario-rol 
   TABLE DATA           �   COPY public."re-usuario-rol" ("re-usuario-rol_id", usuario_id, rol_id, entidad_id, fecha_inicio, fecha_fin, indefinido) FROM stdin;
    public          elliot    false    230   �      �          0    16439    recurso 
   TABLE DATA           B   COPY public.recurso (recurso_id, descripcion, acceso) FROM stdin;
    public          elliot    false    218   �      �          0    16446    repuesto 
   TABLE DATA           B   COPY public.repuesto (repuesto_id, nombre, equipo_id) FROM stdin;
    public          elliot    false    219   <      
          0    16543 "   respuesto-mantenimiento-correctivo 
   TABLE DATA           �   COPY public."respuesto-mantenimiento-correctivo" ("respuesto-mantenimiento-correctivo_id", repuesto_id, mantenimiento_correctivo_id, disponible, utilizados) FROM stdin;
    public          elliot    false    235   Y      �          0    16451    rol 
   TABLE DATA           N   COPY public.rol (rol_id, nombre, descripcion, entidad_id, activo) FROM stdin;
    public          elliot    false    220   v                0    98782    sede 
   TABLE DATA           :   COPY public.sede (nombre, direccion, sede_id) FROM stdin;
    public          elliot    false    248   �      �          0    16456    tipo-equipo 
   TABLE DATA           A   COPY public."tipo-equipo" (nombre, "tipo-equipo_id") FROM stdin;
    public          elliot    false    221                   0    16519    trazabilidad-usuario-accion 
   TABLE DATA           �   COPY public."trazabilidad-usuario-accion" ("trazabalidad-usuario-accion_id", usuario_id, recurso_id, permiso_id, accion, fecha_ejecucion, estado, mensaje) FROM stdin;
    public          elliot    false    231                    0    16524    trazabilidad-usuario-login 
   TABLE DATA           �   COPY public."trazabilidad-usuario-login" ("trazabilidad-usuario-login_id", fecha_ingreso, usuario_id, fecha_salida, caducada) FROM stdin;
    public          elliot    false    232   =                0    33282    usuario 
   TABLE DATA           �   COPY public.usuario (usuario_id, usuario, nombre_1, nombre_2, apellido_paterno, apellido_materno, email, cambiar_clave, fecha_cambio_clave, fecha_creacion, activo, fecha_retiro, tiempo_valides_token, clave, edad) FROM stdin;
    public          elliot    false    237   Z      R           0    0    entidad_sequense    SEQUENCE SET     >   SELECT pg_catalog.setval('public.entidad_sequense', 4, true);
          public          elliot    false    238            S           0    0    menu_sequense    SEQUENCE SET     <   SELECT pg_catalog.setval('public.menu_sequense', 21, true);
          public          elliot    false    240            T           0    0    permiso_sequense    SEQUENCE SET     >   SELECT pg_catalog.setval('public.permiso_sequense', 7, true);
          public          elliot    false    244            U           0    0    re-entidad-sede-sequense    SEQUENCE SET     I   SELECT pg_catalog.setval('public."re-entidad-sede-sequense"', 1, false);
          public          elliot    false    251            V           0    0    re-recurso-permiso_sequense    SEQUENCE SET     L   SELECT pg_catalog.setval('public."re-recurso-permiso_sequense"', 12, true);
          public          elliot    false    245            W           0    0    recurso_sequense    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.recurso_sequense', 14, true);
          public          elliot    false    239            X           0    0    rol-recurso_sequense    SEQUENCE SET     E   SELECT pg_catalog.setval('public."rol-recurso_sequense"', 15, true);
          public          elliot    false    243            Y           0    0    rol_sequense    SEQUENCE SET     :   SELECT pg_catalog.setval('public.rol_sequense', 2, true);
          public          elliot    false    241            Z           0    0    sede_sequense    SEQUENCE SET     <   SELECT pg_catalog.setval('public.sede_sequense', 1, false);
          public          elliot    false    249            [           0    0 $   trazabilidad-usuario-accion-sequence    SEQUENCE SET     U   SELECT pg_catalog.setval('public."trazabilidad-usuario-accion-sequence"', 1, false);
          public          elliot    false    247            \           0    0 #   trazabilidad-usuario-login-sequence    SEQUENCE SET     T   SELECT pg_catalog.setval('public."trazabilidad-usuario-login-sequence"', 1, false);
          public          elliot    false    246            ]           0    0    usuario-rol_sequense    SEQUENCE SET     E   SELECT pg_catalog.setval('public."usuario-rol_sequense"', 11, true);
          public          elliot    false    242            ^           0    0    usuario_serial_usuario_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.usuario_serial_usuario_id_seq', 21, true);
          public          elliot    false    236                       2606    16479 0   equipo-detalle-general equipo_detalle_general_pk 
   CONSTRAINT     �   ALTER TABLE ONLY public."equipo-detalle-general"
    ADD CONSTRAINT equipo_detalle_general_pk PRIMARY KEY ("equipo-detalle-general_id");
 \   ALTER TABLE ONLY public."equipo-detalle-general" DROP CONSTRAINT equipo_detalle_general_pk;
       public            elliot    false    223            =           2606    106989    films firstkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.films
    ADD CONSTRAINT firstkey PRIMARY KEY (code);
 8   ALTER TABLE ONLY public.films DROP CONSTRAINT firstkey;
       public            elliot    false    253                       2606    16471    area pk_area 
   CONSTRAINT     O   ALTER TABLE ONLY public.area
    ADD CONSTRAINT pk_area PRIMARY KEY (area_id);
 6   ALTER TABLE ONLY public.area DROP CONSTRAINT pk_area;
       public            elliot    false    222            !           2606    16500    re-equipo-area pk_equipo 
   CONSTRAINT     i   ALTER TABLE ONLY public."re-equipo-area"
    ADD CONSTRAINT pk_equipo PRIMARY KEY ("re-equipo-area_id");
 D   ALTER TABLE ONLY public."re-equipo-area" DROP CONSTRAINT pk_equipo;
       public            elliot    false    226                       2606    16426    equipo pk_equipo_0 
   CONSTRAINT     W   ALTER TABLE ONLY public.equipo
    ADD CONSTRAINT pk_equipo_0 PRIMARY KEY (equipo_id);
 <   ALTER TABLE ONLY public.equipo DROP CONSTRAINT pk_equipo_0;
       public            elliot    false    215                       2606    16433    entidad pk_hospital 
   CONSTRAINT     Y   ALTER TABLE ONLY public.entidad
    ADD CONSTRAINT pk_hospital PRIMARY KEY (entidad_id);
 =   ALTER TABLE ONLY public.entidad DROP CONSTRAINT pk_hospital;
       public            elliot    false    216            /           2606    16536 4   mantenimiento_correctivo pk_mantenimiento_correctivo 
   CONSTRAINT     �   ALTER TABLE ONLY public.mantenimiento_correctivo
    ADD CONSTRAINT pk_mantenimiento_correctivo PRIMARY KEY (mantenimiento_correctivo_id);
 ^   ALTER TABLE ONLY public.mantenimiento_correctivo DROP CONSTRAINT pk_mantenimiento_correctivo;
       public            elliot    false    233            1           2606    16542 4   mantenimiento_preventivo pk_mantenimiento_preventivo 
   CONSTRAINT     �   ALTER TABLE ONLY public.mantenimiento_preventivo
    ADD CONSTRAINT pk_mantenimiento_preventivo PRIMARY KEY (mantenimiento_preventivo_id);
 ^   ALTER TABLE ONLY public.mantenimiento_preventivo DROP CONSTRAINT pk_mantenimiento_preventivo;
       public            elliot    false    234                       2606    16489    menu pk_menu 
   CONSTRAINT     O   ALTER TABLE ONLY public.menu
    ADD CONSTRAINT pk_menu PRIMARY KEY (menu_id);
 6   ALTER TABLE ONLY public.menu DROP CONSTRAINT pk_menu;
       public            elliot    false    224                       2606    16438    permiso pk_permiso 
   CONSTRAINT     X   ALTER TABLE ONLY public.permiso
    ADD CONSTRAINT pk_permiso PRIMARY KEY (permiso_id);
 <   ALTER TABLE ONLY public.permiso DROP CONSTRAINT pk_permiso;
       public            elliot    false    217            9           2606    98793 "   re-entidad-sede pk_re-entidad-sede 
   CONSTRAINT     v   ALTER TABLE ONLY public."re-entidad-sede"
    ADD CONSTRAINT "pk_re-entidad-sede" PRIMARY KEY ("re-entidad-sede_id");
 P   ALTER TABLE ONLY public."re-entidad-sede" DROP CONSTRAINT "pk_re-entidad-sede";
       public            elliot    false    250            ;           2606    98810 2   re-usuario-entidad-sede pk_re-usuario-entidad-sede 
   CONSTRAINT     �   ALTER TABLE ONLY public."re-usuario-entidad-sede"
    ADD CONSTRAINT "pk_re-usuario-entidad-sede" PRIMARY KEY ("re-usuario-entidad-sede_id");
 `   ALTER TABLE ONLY public."re-usuario-entidad-sede" DROP CONSTRAINT "pk_re-usuario-entidad-sede";
       public            elliot    false    252                       2606    16445    recurso pk_recurso 
   CONSTRAINT     X   ALTER TABLE ONLY public.recurso
    ADD CONSTRAINT pk_recurso PRIMARY KEY (recurso_id);
 <   ALTER TABLE ONLY public.recurso DROP CONSTRAINT pk_recurso;
       public            elliot    false    218                       2606    16450    repuesto pk_repuesto 
   CONSTRAINT     [   ALTER TABLE ONLY public.repuesto
    ADD CONSTRAINT pk_repuesto PRIMARY KEY (repuesto_id);
 >   ALTER TABLE ONLY public.repuesto DROP CONSTRAINT pk_repuesto;
       public            elliot    false    219                       2606    16455 
   rol pk_rol 
   CONSTRAINT     L   ALTER TABLE ONLY public.rol
    ADD CONSTRAINT pk_rol PRIMARY KEY (rol_id);
 4   ALTER TABLE ONLY public.rol DROP CONSTRAINT pk_rol;
       public            elliot    false    220            7           2606    98786    sede pk_sede 
   CONSTRAINT     O   ALTER TABLE ONLY public.sede
    ADD CONSTRAINT pk_sede PRIMARY KEY (sede_id);
 6   ALTER TABLE ONLY public.sede DROP CONSTRAINT pk_sede;
       public            elliot    false    248            5           2606    33287    usuario pk_usuario_serial 
   CONSTRAINT     _   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT pk_usuario_serial PRIMARY KEY (usuario_id);
 C   ALTER TABLE ONLY public.usuario DROP CONSTRAINT pk_usuario_serial;
       public            elliot    false    237                       2606    16812 H   plantilla-mantenimiento-preventivo plantilla_mantenimiento_preventivo_pk 
   CONSTRAINT     �   ALTER TABLE ONLY public."plantilla-mantenimiento-preventivo"
    ADD CONSTRAINT plantilla_mantenimiento_preventivo_pk PRIMARY KEY ("plantilla-mantenimiento-preventivo_id");
 t   ALTER TABLE ONLY public."plantilla-mantenimiento-preventivo" DROP CONSTRAINT plantilla_mantenimiento_preventivo_pk;
       public            elliot    false    225            #           2606    16505 (   re-recurso-permiso re_recurso_permiso_pk 
   CONSTRAINT     }   ALTER TABLE ONLY public."re-recurso-permiso"
    ADD CONSTRAINT re_recurso_permiso_pk PRIMARY KEY ("re-recurso-permiso_id");
 T   ALTER TABLE ONLY public."re-recurso-permiso" DROP CONSTRAINT re_recurso_permiso_pk;
       public            elliot    false    227            %           2606    16510     re-rol-recurso re_rol_recurso_pk 
   CONSTRAINT     q   ALTER TABLE ONLY public."re-rol-recurso"
    ADD CONSTRAINT re_rol_recurso_pk PRIMARY KEY ("re-rol-recurso_id");
 L   ALTER TABLE ONLY public."re-rol-recurso" DROP CONSTRAINT re_rol_recurso_pk;
       public            elliot    false    228            '           2606    16515 "   re-usuario-area re_usuario_area_pk 
   CONSTRAINT     t   ALTER TABLE ONLY public."re-usuario-area"
    ADD CONSTRAINT re_usuario_area_pk PRIMARY KEY ("re-usuario-area_id");
 N   ALTER TABLE ONLY public."re-usuario-area" DROP CONSTRAINT re_usuario_area_pk;
       public            elliot    false    229            )           2606    16762     re-usuario-rol re_usuario_rol_pk 
   CONSTRAINT     q   ALTER TABLE ONLY public."re-usuario-rol"
    ADD CONSTRAINT re_usuario_rol_pk PRIMARY KEY ("re-usuario-rol_id");
 L   ALTER TABLE ONLY public."re-usuario-rol" DROP CONSTRAINT re_usuario_rol_pk;
       public            elliot    false    230            3           2606    16760 H   respuesto-mantenimiento-correctivo respuesto_mantenimiento_correctivo_pk 
   CONSTRAINT     �   ALTER TABLE ONLY public."respuesto-mantenimiento-correctivo"
    ADD CONSTRAINT respuesto_mantenimiento_correctivo_pk PRIMARY KEY ("respuesto-mantenimiento-correctivo_id");
 t   ALTER TABLE ONLY public."respuesto-mantenimiento-correctivo" DROP CONSTRAINT respuesto_mantenimiento_correctivo_pk;
       public            elliot    false    235                       2606    16758    tipo-equipo tipo_equipo_pk 
   CONSTRAINT     h   ALTER TABLE ONLY public."tipo-equipo"
    ADD CONSTRAINT tipo_equipo_pk PRIMARY KEY ("tipo-equipo_id");
 F   ALTER TABLE ONLY public."tipo-equipo" DROP CONSTRAINT tipo_equipo_pk;
       public            elliot    false    221            +           2606    16523 :   trazabilidad-usuario-accion trazabilidad_usuario_accion_pk 
   CONSTRAINT     �   ALTER TABLE ONLY public."trazabilidad-usuario-accion"
    ADD CONSTRAINT trazabilidad_usuario_accion_pk PRIMARY KEY ("trazabalidad-usuario-accion_id");
 f   ALTER TABLE ONLY public."trazabilidad-usuario-accion" DROP CONSTRAINT trazabilidad_usuario_accion_pk;
       public            elliot    false    231            -           2606    16530 8   trazabilidad-usuario-login trazabilidad_usuario_login_pk 
   CONSTRAINT     �   ALTER TABLE ONLY public."trazabilidad-usuario-login"
    ADD CONSTRAINT trazabilidad_usuario_login_pk PRIMARY KEY ("trazabilidad-usuario-login_id");
 d   ALTER TABLE ONLY public."trazabilidad-usuario-login" DROP CONSTRAINT trazabilidad_usuario_login_pk;
       public            elliot    false    232            ?           2606    16553    area fk_area_hospital    FK CONSTRAINT     �   ALTER TABLE ONLY public.area
    ADD CONSTRAINT fk_area_hospital FOREIGN KEY (hospital_id) REFERENCES public.entidad(entidad_id);
 ?   ALTER TABLE ONLY public.area DROP CONSTRAINT fk_area_hospital;
       public          elliot    false    216    222    3341            G           2606    16588 "   re-equipo-area fk_equipo-area_area    FK CONSTRAINT     �   ALTER TABLE ONLY public."re-equipo-area"
    ADD CONSTRAINT "fk_equipo-area_area" FOREIGN KEY ("area-temporal-id") REFERENCES public.area(area_id);
 P   ALTER TABLE ONLY public."re-equipo-area" DROP CONSTRAINT "fk_equipo-area_area";
       public          elliot    false    226    222    3353            @           2606    16558 0   equipo-detalle-general fk_equipo-detalle-general    FK CONSTRAINT     �   ALTER TABLE ONLY public."equipo-detalle-general"
    ADD CONSTRAINT "fk_equipo-detalle-general" FOREIGN KEY (hospital_id) REFERENCES public.entidad(entidad_id);
 ^   ALTER TABLE ONLY public."equipo-detalle-general" DROP CONSTRAINT "fk_equipo-detalle-general";
       public          elliot    false    3341    223    216            A           2606    16806 <   equipo-detalle-general fk_equipo-detalle-general_tipo_equipi    FK CONSTRAINT     �   ALTER TABLE ONLY public."equipo-detalle-general"
    ADD CONSTRAINT "fk_equipo-detalle-general_tipo_equipi" FOREIGN KEY ("tipo-equipo-id") REFERENCES public."tipo-equipo"("tipo-equipo_id");
 j   ALTER TABLE ONLY public."equipo-detalle-general" DROP CONSTRAINT "fk_equipo-detalle-general_tipo_equipi";
       public          elliot    false    223    221    3351            H           2606    16629    re-equipo-area fk_equipo_area    FK CONSTRAINT     �   ALTER TABLE ONLY public."re-equipo-area"
    ADD CONSTRAINT fk_equipo_area FOREIGN KEY (area_id) REFERENCES public.area(area_id);
 I   ALTER TABLE ONLY public."re-equipo-area" DROP CONSTRAINT fk_equipo_area;
       public          elliot    false    3353    222    226            [           2606    33328 4   mantenimiento_correctivo fk_mantenimiento_correctivo    FK CONSTRAINT     �   ALTER TABLE ONLY public.mantenimiento_correctivo
    ADD CONSTRAINT fk_mantenimiento_correctivo FOREIGN KEY (responsable_id) REFERENCES public.usuario(usuario_id);
 ^   ALTER TABLE ONLY public.mantenimiento_correctivo DROP CONSTRAINT fk_mantenimiento_correctivo;
       public          elliot    false    237    233    3381            \           2606    33333 >   mantenimiento_correctivo fk_mantenimiento_correctivo_equipo_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.mantenimiento_correctivo
    ADD CONSTRAINT fk_mantenimiento_correctivo_equipo_id FOREIGN KEY ("re-equipo-area_id") REFERENCES public."re-equipo-area"("re-equipo-area_id");
 h   ALTER TABLE ONLY public.mantenimiento_correctivo DROP CONSTRAINT fk_mantenimiento_correctivo_equipo_id;
       public          elliot    false    3361    226    233            ]           2606    16619 4   mantenimiento_preventivo fk_mantenimiento_preventivo    FK CONSTRAINT     �   ALTER TABLE ONLY public.mantenimiento_preventivo
    ADD CONSTRAINT fk_mantenimiento_preventivo FOREIGN KEY ("re-equipo-area_id") REFERENCES public."re-equipo-area"("re-equipo-area_id");
 ^   ALTER TABLE ONLY public.mantenimiento_preventivo DROP CONSTRAINT fk_mantenimiento_preventivo;
       public          elliot    false    226    234    3361            ^           2606    16824 W   mantenimiento_preventivo fk_mantenimiento_preventivo_plantilla-mantenimiento-preventivo    FK CONSTRAINT       ALTER TABLE ONLY public.mantenimiento_preventivo
    ADD CONSTRAINT "fk_mantenimiento_preventivo_plantilla-mantenimiento-preventivo" FOREIGN KEY ("plantilla-mantenimiento-preventivo_id") REFERENCES public."plantilla-mantenimiento-preventivo"("plantilla-mantenimiento-preventivo_id");
 �   ALTER TABLE ONLY public.mantenimiento_preventivo DROP CONSTRAINT "fk_mantenimiento_preventivo_plantilla-mantenimiento-preventivo";
       public          elliot    false    225    234    3359            _           2606    33353 H   mantenimiento_preventivo fk_mantenimiento_preventivo_responsable_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY public.mantenimiento_preventivo
    ADD CONSTRAINT fk_mantenimiento_preventivo_responsable_usuario FOREIGN KEY (responsable_id) REFERENCES public.usuario(usuario_id);
 r   ALTER TABLE ONLY public.mantenimiento_preventivo DROP CONSTRAINT fk_mantenimiento_preventivo_responsable_usuario;
       public          elliot    false    3381    237    234            B           2606    16568    menu fk_menu_hospital    FK CONSTRAINT     �   ALTER TABLE ONLY public.menu
    ADD CONSTRAINT fk_menu_hospital FOREIGN KEY (entidad_id) REFERENCES public.entidad(entidad_id);
 ?   ALTER TABLE ONLY public.menu DROP CONSTRAINT fk_menu_hospital;
       public          elliot    false    224    216    3341            C           2606    16578    menu fk_menu_menu    FK CONSTRAINT     z   ALTER TABLE ONLY public.menu
    ADD CONSTRAINT fk_menu_menu FOREIGN KEY (menu_padre_id) REFERENCES public.menu(menu_id);
 ;   ALTER TABLE ONLY public.menu DROP CONSTRAINT fk_menu_menu;
       public          elliot    false    3357    224    224            D           2606    16573    menu fk_menu_recurso    FK CONSTRAINT     �   ALTER TABLE ONLY public.menu
    ADD CONSTRAINT fk_menu_recurso FOREIGN KEY (recurso_id) REFERENCES public.recurso(recurso_id);
 >   ALTER TABLE ONLY public.menu DROP CONSTRAINT fk_menu_recurso;
       public          elliot    false    3345    224    218            E           2606    16583 H   plantilla-mantenimiento-preventivo fk_plantilla-mantenimiento-preventivo    FK CONSTRAINT     �   ALTER TABLE ONLY public."plantilla-mantenimiento-preventivo"
    ADD CONSTRAINT "fk_plantilla-mantenimiento-preventivo" FOREIGN KEY (hospital_id) REFERENCES public.entidad(entidad_id);
 v   ALTER TABLE ONLY public."plantilla-mantenimiento-preventivo" DROP CONSTRAINT "fk_plantilla-mantenimiento-preventivo";
       public          elliot    false    225    3341    216            F           2606    16801 T   plantilla-mantenimiento-preventivo fk_plantilla-mantenimiento-preventivo_tipo_equipo    FK CONSTRAINT     �   ALTER TABLE ONLY public."plantilla-mantenimiento-preventivo"
    ADD CONSTRAINT "fk_plantilla-mantenimiento-preventivo_tipo_equipo" FOREIGN KEY ("tipo-equipo_id") REFERENCES public."tipo-equipo"("tipo-equipo_id");
 �   ALTER TABLE ONLY public."plantilla-mantenimiento-preventivo" DROP CONSTRAINT "fk_plantilla-mantenimiento-preventivo_tipo_equipo";
       public          elliot    false    221    3351    225            b           2606    98801 *   re-entidad-sede fk_re-entidad-sede_entidad    FK CONSTRAINT     �   ALTER TABLE ONLY public."re-entidad-sede"
    ADD CONSTRAINT "fk_re-entidad-sede_entidad" FOREIGN KEY (entidad_id) REFERENCES public.entidad(entidad_id);
 X   ALTER TABLE ONLY public."re-entidad-sede" DROP CONSTRAINT "fk_re-entidad-sede_entidad";
       public          elliot    false    3341    216    250            c           2606    98796 '   re-entidad-sede fk_re-entidad-sede_null    FK CONSTRAINT     �   ALTER TABLE ONLY public."re-entidad-sede"
    ADD CONSTRAINT "fk_re-entidad-sede_null" FOREIGN KEY (sede_id) REFERENCES public.sede(sede_id);
 U   ALTER TABLE ONLY public."re-entidad-sede" DROP CONSTRAINT "fk_re-entidad-sede_null";
       public          elliot    false    250    3383    248            I           2606    16593 '   re-equipo-area fk_re-equipo-area_equipo    FK CONSTRAINT     �   ALTER TABLE ONLY public."re-equipo-area"
    ADD CONSTRAINT "fk_re-equipo-area_equipo" FOREIGN KEY (equipo_id) REFERENCES public.equipo(equipo_id);
 U   ALTER TABLE ONLY public."re-equipo-area" DROP CONSTRAINT "fk_re-equipo-area_equipo";
       public          elliot    false    226    215    3339            J           2606    16796 %   re-equipo-area fk_re-equipo-area_null    FK CONSTRAINT     �   ALTER TABLE ONLY public."re-equipo-area"
    ADD CONSTRAINT "fk_re-equipo-area_null" FOREIGN KEY ("tipo-equipo_id") REFERENCES public."tipo-equipo"("tipo-equipo_id");
 S   ALTER TABLE ONLY public."re-equipo-area" DROP CONSTRAINT "fk_re-equipo-area_null";
       public          elliot    false    221    3351    226            K           2606    16639 0   re-recurso-permiso fk_re-recurso-permiso_permiso    FK CONSTRAINT     �   ALTER TABLE ONLY public."re-recurso-permiso"
    ADD CONSTRAINT "fk_re-recurso-permiso_permiso" FOREIGN KEY (permiso_id) REFERENCES public.permiso(permiso_id);
 ^   ALTER TABLE ONLY public."re-recurso-permiso" DROP CONSTRAINT "fk_re-recurso-permiso_permiso";
       public          elliot    false    227    3343    217            L           2606    16644 0   re-recurso-permiso fk_re-recurso-permiso_recurso    FK CONSTRAINT     �   ALTER TABLE ONLY public."re-recurso-permiso"
    ADD CONSTRAINT "fk_re-recurso-permiso_recurso" FOREIGN KEY (recurso_id) REFERENCES public.recurso(recurso_id);
 ^   ALTER TABLE ONLY public."re-recurso-permiso" DROP CONSTRAINT "fk_re-recurso-permiso_recurso";
       public          elliot    false    3345    227    218            M           2606    16634 ,   re-recurso-permiso fk_re-recurso-permiso_rol    FK CONSTRAINT     �   ALTER TABLE ONLY public."re-recurso-permiso"
    ADD CONSTRAINT "fk_re-recurso-permiso_rol" FOREIGN KEY (rol_id) REFERENCES public.rol(rol_id);
 Z   ALTER TABLE ONLY public."re-recurso-permiso" DROP CONSTRAINT "fk_re-recurso-permiso_rol";
       public          elliot    false    227    220    3349            N           2606    16654 )   re-rol-recurso fk_re-rol-recurso_hospital    FK CONSTRAINT     �   ALTER TABLE ONLY public."re-rol-recurso"
    ADD CONSTRAINT "fk_re-rol-recurso_hospital" FOREIGN KEY (entidad_id) REFERENCES public.entidad(entidad_id);
 W   ALTER TABLE ONLY public."re-rol-recurso" DROP CONSTRAINT "fk_re-rol-recurso_hospital";
       public          elliot    false    216    3341    228            O           2606    16659 (   re-rol-recurso fk_re-rol-recurso_recurso    FK CONSTRAINT     �   ALTER TABLE ONLY public."re-rol-recurso"
    ADD CONSTRAINT "fk_re-rol-recurso_recurso" FOREIGN KEY (recurso_id) REFERENCES public.recurso(recurso_id);
 V   ALTER TABLE ONLY public."re-rol-recurso" DROP CONSTRAINT "fk_re-rol-recurso_recurso";
       public          elliot    false    3345    228    218            P           2606    16649 $   re-rol-recurso fk_re-rol-recurso_rol    FK CONSTRAINT     �   ALTER TABLE ONLY public."re-rol-recurso"
    ADD CONSTRAINT "fk_re-rol-recurso_rol" FOREIGN KEY (rol_id) REFERENCES public.rol(rol_id);
 R   ALTER TABLE ONLY public."re-rol-recurso" DROP CONSTRAINT "fk_re-rol-recurso_rol";
       public          elliot    false    3349    228    220            Q           2606    16664 '   re-usuario-area fk_re-usuario-area_area    FK CONSTRAINT     �   ALTER TABLE ONLY public."re-usuario-area"
    ADD CONSTRAINT "fk_re-usuario-area_area" FOREIGN KEY (area_id) REFERENCES public.area(area_id);
 U   ALTER TABLE ONLY public."re-usuario-area" DROP CONSTRAINT "fk_re-usuario-area_area";
       public          elliot    false    229    222    3353            R           2606    16669 +   re-usuario-area fk_re-usuario-area_hospital    FK CONSTRAINT     �   ALTER TABLE ONLY public."re-usuario-area"
    ADD CONSTRAINT "fk_re-usuario-area_hospital" FOREIGN KEY (hospital_id) REFERENCES public.entidad(entidad_id);
 Y   ALTER TABLE ONLY public."re-usuario-area" DROP CONSTRAINT "fk_re-usuario-area_hospital";
       public          elliot    false    3341    229    216            S           2606    33358 *   re-usuario-area fk_re-usuario-area_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY public."re-usuario-area"
    ADD CONSTRAINT "fk_re-usuario-area_usuario" FOREIGN KEY (usuario_id) REFERENCES public.usuario(usuario_id);
 X   ALTER TABLE ONLY public."re-usuario-area" DROP CONSTRAINT "fk_re-usuario-area_usuario";
       public          elliot    false    229    3381    237            d           2606    98811 2   re-usuario-entidad-sede fk_re-usuario-entidad-sede    FK CONSTRAINT     �   ALTER TABLE ONLY public."re-usuario-entidad-sede"
    ADD CONSTRAINT "fk_re-usuario-entidad-sede" FOREIGN KEY (sede_id) REFERENCES public.sede(sede_id);
 `   ALTER TABLE ONLY public."re-usuario-entidad-sede" DROP CONSTRAINT "fk_re-usuario-entidad-sede";
       public          elliot    false    3383    252    248            e           2606    98816 =   re-usuario-entidad-sede fk_re-usuario-entidad-sede_entidad_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."re-usuario-entidad-sede"
    ADD CONSTRAINT "fk_re-usuario-entidad-sede_entidad_id" FOREIGN KEY (entidad_id) REFERENCES public.entidad(entidad_id);
 k   ALTER TABLE ONLY public."re-usuario-entidad-sede" DROP CONSTRAINT "fk_re-usuario-entidad-sede_entidad_id";
       public          elliot    false    252    3341    216            f           2606    98821 =   re-usuario-entidad-sede fk_re-usuario-entidad-sede_usuario_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."re-usuario-entidad-sede"
    ADD CONSTRAINT "fk_re-usuario-entidad-sede_usuario_id" FOREIGN KEY (usuario_id) REFERENCES public.usuario(usuario_id);
 k   ALTER TABLE ONLY public."re-usuario-entidad-sede" DROP CONSTRAINT "fk_re-usuario-entidad-sede_usuario_id";
       public          elliot    false    3381    252    237            T           2606    16684 %   re-usuario-rol fk_re-usuario-rol_area    FK CONSTRAINT     �   ALTER TABLE ONLY public."re-usuario-rol"
    ADD CONSTRAINT "fk_re-usuario-rol_area" FOREIGN KEY (rol_id) REFERENCES public.rol(rol_id);
 S   ALTER TABLE ONLY public."re-usuario-rol" DROP CONSTRAINT "fk_re-usuario-rol_area";
       public          elliot    false    230    3349    220            U           2606    33338 '   re-usuario-rol fk_re-usuario-rol_equipo    FK CONSTRAINT     �   ALTER TABLE ONLY public."re-usuario-rol"
    ADD CONSTRAINT "fk_re-usuario-rol_equipo" FOREIGN KEY (usuario_id) REFERENCES public.usuario(usuario_id);
 U   ALTER TABLE ONLY public."re-usuario-rol" DROP CONSTRAINT "fk_re-usuario-rol_equipo";
       public          elliot    false    230    3381    237            V           2606    41455 )   re-usuario-rol fk_re-usuario-rol_hospital    FK CONSTRAINT     �   ALTER TABLE ONLY public."re-usuario-rol"
    ADD CONSTRAINT "fk_re-usuario-rol_hospital" FOREIGN KEY (entidad_id) REFERENCES public.entidad(entidad_id);
 W   ALTER TABLE ONLY public."re-usuario-rol" DROP CONSTRAINT "fk_re-usuario-rol_hospital";
       public          elliot    false    230    216    3341            `           2606    16694 H   respuesto-mantenimiento-correctivo fk_respuesto-mantenimiento-correctivo    FK CONSTRAINT     �   ALTER TABLE ONLY public."respuesto-mantenimiento-correctivo"
    ADD CONSTRAINT "fk_respuesto-mantenimiento-correctivo" FOREIGN KEY (repuesto_id) REFERENCES public.repuesto(repuesto_id);
 v   ALTER TABLE ONLY public."respuesto-mantenimiento-correctivo" DROP CONSTRAINT "fk_respuesto-mantenimiento-correctivo";
       public          elliot    false    235    3347    219            a           2606    16699 `   respuesto-mantenimiento-correctivo fk_respuesto-mantenimiento-correctivo_matenimiento_correctivo    FK CONSTRAINT       ALTER TABLE ONLY public."respuesto-mantenimiento-correctivo"
    ADD CONSTRAINT "fk_respuesto-mantenimiento-correctivo_matenimiento_correctivo" FOREIGN KEY (mantenimiento_correctivo_id) REFERENCES public.mantenimiento_correctivo(mantenimiento_correctivo_id);
 �   ALTER TABLE ONLY public."respuesto-mantenimiento-correctivo" DROP CONSTRAINT "fk_respuesto-mantenimiento-correctivo_matenimiento_correctivo";
       public          elliot    false    235    3375    233            >           2606    16548    rol fk_rol_hospital    FK CONSTRAINT        ALTER TABLE ONLY public.rol
    ADD CONSTRAINT fk_rol_hospital FOREIGN KEY (entidad_id) REFERENCES public.entidad(entidad_id);
 =   ALTER TABLE ONLY public.rol DROP CONSTRAINT fk_rol_hospital;
       public          elliot    false    216    220    3341            W           2606    33348 :   trazabilidad-usuario-accion fk_trazabilidad-usuario-accion    FK CONSTRAINT     �   ALTER TABLE ONLY public."trazabilidad-usuario-accion"
    ADD CONSTRAINT "fk_trazabilidad-usuario-accion" FOREIGN KEY (usuario_id) REFERENCES public.usuario(usuario_id);
 h   ALTER TABLE ONLY public."trazabilidad-usuario-accion" DROP CONSTRAINT "fk_trazabilidad-usuario-accion";
       public          elliot    false    3381    237    231            X           2606    16709 B   trazabilidad-usuario-accion fk_trazabilidad-usuario-accion_permiso    FK CONSTRAINT     �   ALTER TABLE ONLY public."trazabilidad-usuario-accion"
    ADD CONSTRAINT "fk_trazabilidad-usuario-accion_permiso" FOREIGN KEY (permiso_id) REFERENCES public.permiso(permiso_id);
 p   ALTER TABLE ONLY public."trazabilidad-usuario-accion" DROP CONSTRAINT "fk_trazabilidad-usuario-accion_permiso";
       public          elliot    false    231    3343    217            Y           2606    16714 B   trazabilidad-usuario-accion fk_trazabilidad-usuario-accion_recurso    FK CONSTRAINT     �   ALTER TABLE ONLY public."trazabilidad-usuario-accion"
    ADD CONSTRAINT "fk_trazabilidad-usuario-accion_recurso" FOREIGN KEY (recurso_id) REFERENCES public.recurso(recurso_id);
 p   ALTER TABLE ONLY public."trazabilidad-usuario-accion" DROP CONSTRAINT "fk_trazabilidad-usuario-accion_recurso";
       public          elliot    false    231    3345    218            Z           2606    33343 8   trazabilidad-usuario-login fk_trazabilidad-usuario-login    FK CONSTRAINT     �   ALTER TABLE ONLY public."trazabilidad-usuario-login"
    ADD CONSTRAINT "fk_trazabilidad-usuario-login" FOREIGN KEY (usuario_id) REFERENCES public.usuario(usuario_id);
 f   ALTER TABLE ONLY public."trazabilidad-usuario-login" DROP CONSTRAINT "fk_trazabilidad-usuario-login";
       public          elliot    false    3381    232    237            �      x������ � �      �   �   x�3�442"���˙Q��됞��������Y�e�64*01�A��#�� �$1G�+�(=U��(��$_!81#�4�3#+��cN�>�	@�\���\����恨�Ҕ��̼�a�%��E@n��b�	�N����� .J�      �      x������ � �      �      x������ � �         D   x�u450�tJ��bNCS�?N���ԔJN#��x3C�����ܤ|��Hڥ(17������� N��            x������ � �      	      x������ � �      �   �  x��T]n� |�S�UI��K|o}�d���E��Z R{���B�8���S$D�ٙ�;��	�"�P+�4j�l����F/| c����G+�x�'�ҁhMg�'N�(zЄ9{��i�d�!w�������� U��S��C"Yԥ�r���5�<�bNe��4��11]F�Ė)^�;���@;���	O�1'�_�6��`u���S�3�f1�vDX���bS���T����[�3��6+�d��#�#y��S�c7G�`d��k��Z�$�+�c?G�M�p�Vy=�Q>ò�d��G���#��c�9*��]��]g3i@�E�����ؽ�QC�K��޲6T�(יo%�u{����b���u�Ȗ�:�M�{�Q��qd�m.��?�i�;�ZM�V���Ã��!�x����2��}&a��H�Q���s�]<�jsy{��ޞ,P�h�K���������{�����&��g�s��IJ�����      �   i   x�3�L-N.�,)-J��2��IM����9Ss2s3��3��8]�L8�R�9�U�E��\��%�)��
�E����Ŝ�\f��ř�P��\�)��HB.�\1z\\\ r�$             x������ � �            x������ � �            x������ � �            x�34�4B#�=... ��         U   x�E�9� D�:>L��le�H4���92����b������+�)C���j�Ju\5j@��Р4�3x�K��AZ�1I���[D~M�"�            x������ � �            x������ � �         -   x�34�4�4BC]0R00�#�b%\���&�F$i����� ωD      �   E  x���[r�0E��Uxij����G$�Ll?2CW_;$@ �N�<�Ց�$����[Me>���Z�aVl��I:���֋���c�L��(���&� ���*�-��P�=��4T��>��gu=���n!'kcz+O(�y�����mo�-֎��C(�%�(���!&b.�I���h�L&X�:�ҁ;{˟芋�C�ʎ\J�e���S�S3��T;"�w\�5��Il�>a�CӯØ�Ф̻�<��<�����.����
�����0���֢J3��Q�u��Q��'�s�5{�K�����z.�2��� ~C��      �      x������ � �      
      x������ � �      �   `   x�%̻1ј��8��d!��yЧ���Ds��A){n��m����4̧�kG�wz��r�*O�uƿ\��� gc����ף���&            x������ � �      �      x������ � �            x������ � �            x������ � �         �  x���Os�0�s�zm�B�ź�j+*jW���� 5�~�E��nO��d ��	�y� #F-N(��Q��Гʏ%��P)	^���K�E���g)x!|}ZM�����3����6� ����i��W]�ϧd�,�kG�TUުm'L���j��i�;[:�CI'yO�Y�FfY���l-�y,k��*�.޳^�*�2R;��MLlf�؂T�ػۺ���l������
�w�+&��iDw��lߑ���5��7#22���:Q���x~�wx&�����h۔��sN��3��M�ܤ�ޭ�����xN��fT=h=v<��l�u�?O��� 5��A6�L���#:ܬc�wq.O�q�]�S�����-�4"����4[P#3.P�:�N�/�Enx�w��G�ծ�.�]����7ӥT ��8h]H�]��������3�qH� �p� oˍP�/4Yy�@����Օ��δ�>�Y{���/�/��b��b�$f��*���.:����>���)��S�ͯ�Q��;=��<�3�c#�#=�G�յT4��o�r�,��C^ �5��� ��uo�N��X�K��y_���I���ճy9�~d+�����nw�b>��xY����l�b-=�%mw�
P����_�I\+     