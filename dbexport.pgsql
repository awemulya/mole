--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.6
-- Dumped by pg_dump version 9.5.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: supaadmin
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO supaadmin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: supaadmin
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO supaadmin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: supaadmin
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: supaadmin
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO supaadmin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: supaadmin
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO supaadmin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: supaadmin
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: supaadmin
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO supaadmin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: supaadmin
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO supaadmin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: supaadmin
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: supaadmin
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO supaadmin;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: supaadmin
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO supaadmin;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: supaadmin
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO supaadmin;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: supaadmin
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: supaadmin
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO supaadmin;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: supaadmin
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: supaadmin
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO supaadmin;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: supaadmin
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO supaadmin;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: supaadmin
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: supaadmin
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO supaadmin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: supaadmin
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO supaadmin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: supaadmin
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: supaadmin
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO supaadmin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: supaadmin
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO supaadmin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: supaadmin
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: supaadmin
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO supaadmin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: supaadmin
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO supaadmin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: supaadmin
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: supaadmin
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO supaadmin;

--
-- Name: supa_department; Type: TABLE; Schema: public; Owner: supaadmin
--

CREATE TABLE supa_department (
    id integer NOT NULL,
    department_name text NOT NULL,
    ministry_id integer NOT NULL
);


ALTER TABLE supa_department OWNER TO supaadmin;

--
-- Name: supa_department_id_seq; Type: SEQUENCE; Schema: public; Owner: supaadmin
--

CREATE SEQUENCE supa_department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supa_department_id_seq OWNER TO supaadmin;

--
-- Name: supa_department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: supaadmin
--

ALTER SEQUENCE supa_department_id_seq OWNED BY supa_department.id;


--
-- Name: supa_form; Type: TABLE; Schema: public; Owner: supaadmin
--

CREATE TABLE supa_form (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE supa_form OWNER TO supaadmin;

--
-- Name: supa_form_id_seq; Type: SEQUENCE; Schema: public; Owner: supaadmin
--

CREATE SEQUENCE supa_form_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supa_form_id_seq OWNER TO supaadmin;

--
-- Name: supa_form_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: supaadmin
--

ALTER SEQUENCE supa_form_id_seq OWNED BY supa_form.id;


--
-- Name: supa_form_vstatus; Type: TABLE; Schema: public; Owner: supaadmin
--

CREATE TABLE supa_form_vstatus (
    id integer NOT NULL,
    status character varying(1) NOT NULL,
    formid_id integer NOT NULL
);


ALTER TABLE supa_form_vstatus OWNER TO supaadmin;

--
-- Name: supa_form_vstatus_id_seq; Type: SEQUENCE; Schema: public; Owner: supaadmin
--

CREATE SEQUENCE supa_form_vstatus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supa_form_vstatus_id_seq OWNER TO supaadmin;

--
-- Name: supa_form_vstatus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: supaadmin
--

ALTER SEQUENCE supa_form_vstatus_id_seq OWNED BY supa_form_vstatus.id;


--
-- Name: supa_groupprofile; Type: TABLE; Schema: public; Owner: supaadmin
--

CREATE TABLE supa_groupprofile (
    level integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE supa_groupprofile OWNER TO supaadmin;

--
-- Name: supa_ministry; Type: TABLE; Schema: public; Owner: supaadmin
--

CREATE TABLE supa_ministry (
    id integer NOT NULL,
    ministry_name text NOT NULL
);


ALTER TABLE supa_ministry OWNER TO supaadmin;

--
-- Name: supa_ministry_id_seq; Type: SEQUENCE; Schema: public; Owner: supaadmin
--

CREATE SEQUENCE supa_ministry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supa_ministry_id_seq OWNER TO supaadmin;

--
-- Name: supa_ministry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: supaadmin
--

ALTER SEQUENCE supa_ministry_id_seq OWNED BY supa_ministry.id;


--
-- Name: supa_municipality; Type: TABLE; Schema: public; Owner: supaadmin
--

CREATE TABLE supa_municipality (
    id integer NOT NULL,
    kendra character varying(30) NOT NULL,
    area character varying(30) NOT NULL,
    no_of_wards text NOT NULL,
    population character varying(30) NOT NULL,
    activities text NOT NULL,
    mayor_name character varying(30) NOT NULL,
    mayor_phone_no character varying(30) NOT NULL,
    mayor_address text NOT NULL,
    sub_mayor_name character varying(30) NOT NULL,
    sub_mayor_phone_no character varying(30) NOT NULL,
    sub_mayor_address text NOT NULL,
    ward_chief_details character varying(3000) NOT NULL,
    "OPMtype_id" integer NOT NULL
);


ALTER TABLE supa_municipality OWNER TO supaadmin;

--
-- Name: supa_municipality_id_seq; Type: SEQUENCE; Schema: public; Owner: supaadmin
--

CREATE SEQUENCE supa_municipality_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supa_municipality_id_seq OWNER TO supaadmin;

--
-- Name: supa_municipality_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: supaadmin
--

ALTER SEQUENCE supa_municipality_id_seq OWNED BY supa_municipality.id;


--
-- Name: supa_office; Type: TABLE; Schema: public; Owner: supaadmin
--

CREATE TABLE supa_office (
    id integer NOT NULL,
    dev_acts text NOT NULL,
    "OPMtype_id" integer NOT NULL
);


ALTER TABLE supa_office OWNER TO supaadmin;

--
-- Name: supa_office_id_seq; Type: SEQUENCE; Schema: public; Owner: supaadmin
--

CREATE SEQUENCE supa_office_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supa_office_id_seq OWNER TO supaadmin;

--
-- Name: supa_office_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: supaadmin
--

ALTER SEQUENCE supa_office_id_seq OWNED BY supa_office.id;


--
-- Name: supa_opmtype; Type: TABLE; Schema: public; Owner: supaadmin
--

CREATE TABLE supa_opmtype (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    category character varying(30) NOT NULL,
    address character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    fax character varying(255) NOT NULL,
    yearly_budget character varying(255) NOT NULL,
    office_time character varying(255) NOT NULL,
    no_of_workers character varying(255) NOT NULL,
    vehicle character varying(255) NOT NULL,
    head_name character varying(255) NOT NULL,
    head_post character varying(255) NOT NULL,
    head_phone_no character varying(255) NOT NULL,
    head_assign_date character varying(255) NOT NULL,
    head_act_time character varying(255) NOT NULL,
    infoofficer_name character varying(255) NOT NULL,
    infoofficer_post character varying(255) NOT NULL,
    infoofficer_phone_no character varying(255) NOT NULL,
    infoofficer_assign_date character varying(255) NOT NULL,
    infoofficer_act_time character varying(255) NOT NULL,
    accountant_name character varying(255) NOT NULL,
    accountant_post character varying(255) NOT NULL,
    accountant_phone_no character varying(255) NOT NULL,
    accountant_assign_date character varying(255) NOT NULL,
    accountant_act_time character varying(255) NOT NULL,
    department_id integer NOT NULL
);


ALTER TABLE supa_opmtype OWNER TO supaadmin;

--
-- Name: supa_opmtype_id_seq; Type: SEQUENCE; Schema: public; Owner: supaadmin
--

CREATE SEQUENCE supa_opmtype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supa_opmtype_id_seq OWNER TO supaadmin;

--
-- Name: supa_opmtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: supaadmin
--

ALTER SEQUENCE supa_opmtype_id_seq OWNED BY supa_opmtype.id;


--
-- Name: supa_post; Type: TABLE; Schema: public; Owner: supaadmin
--

CREATE TABLE supa_post (
    id integer NOT NULL,
    post text NOT NULL,
    value text NOT NULL
);


ALTER TABLE supa_post OWNER TO supaadmin;

--
-- Name: supa_post_id_seq; Type: SEQUENCE; Schema: public; Owner: supaadmin
--

CREATE SEQUENCE supa_post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supa_post_id_seq OWNER TO supaadmin;

--
-- Name: supa_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: supaadmin
--

ALTER SEQUENCE supa_post_id_seq OWNED BY supa_post.id;


--
-- Name: supa_profile; Type: TABLE; Schema: public; Owner: supaadmin
--

CREATE TABLE supa_profile (
    id integer NOT NULL,
    office boolean NOT NULL,
    location character varying(30) NOT NULL,
    birth_date date,
    user_id integer NOT NULL,
    email_confirmed boolean NOT NULL,
    photo_url character varying(30)
);


ALTER TABLE supa_profile OWNER TO supaadmin;

--
-- Name: supa_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: supaadmin
--

CREATE SEQUENCE supa_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supa_profile_id_seq OWNER TO supaadmin;

--
-- Name: supa_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: supaadmin
--

ALTER SEQUENCE supa_profile_id_seq OWNED BY supa_profile.id;


--
-- Name: supa_project; Type: TABLE; Schema: public; Owner: supaadmin
--

CREATE TABLE supa_project (
    id integer NOT NULL,
    project_time character varying(30) NOT NULL,
    budget character varying(30) NOT NULL,
    objective text NOT NULL,
    chief_eng character varying(300) NOT NULL,
    engineers text NOT NULL,
    "OPMtype_id" integer NOT NULL
);


ALTER TABLE supa_project OWNER TO supaadmin;

--
-- Name: supa_project_id_seq; Type: SEQUENCE; Schema: public; Owner: supaadmin
--

CREATE SEQUENCE supa_project_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supa_project_id_seq OWNER TO supaadmin;

--
-- Name: supa_project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: supaadmin
--

ALTER SEQUENCE supa_project_id_seq OWNED BY supa_project.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_department ALTER COLUMN id SET DEFAULT nextval('supa_department_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_form ALTER COLUMN id SET DEFAULT nextval('supa_form_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_form_vstatus ALTER COLUMN id SET DEFAULT nextval('supa_form_vstatus_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_ministry ALTER COLUMN id SET DEFAULT nextval('supa_ministry_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_municipality ALTER COLUMN id SET DEFAULT nextval('supa_municipality_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_office ALTER COLUMN id SET DEFAULT nextval('supa_office_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_opmtype ALTER COLUMN id SET DEFAULT nextval('supa_opmtype_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_post ALTER COLUMN id SET DEFAULT nextval('supa_post_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_profile ALTER COLUMN id SET DEFAULT nextval('supa_profile_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_project ALTER COLUMN id SET DEFAULT nextval('supa_project_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: supaadmin
--

COPY auth_group (id, name) FROM stdin;
3	supa-manager
4	office-manager
5	office-staff
2	supa-admin
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supaadmin
--

SELECT pg_catalog.setval('auth_group_id_seq', 5, true);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: supaadmin
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
31	3	1
32	3	2
33	3	3
34	3	4
35	3	5
36	3	6
37	3	7
38	3	8
39	3	13
40	3	14
41	3	15
42	3	16
43	3	17
44	3	18
45	3	19
46	3	20
47	3	21
48	3	25
49	3	26
50	3	27
51	3	28
52	3	29
53	3	30
54	2	1
55	2	2
56	2	3
57	2	4
58	2	5
59	2	6
60	2	7
61	2	8
62	2	9
63	2	10
64	2	11
65	2	12
66	2	13
67	2	14
68	2	15
69	2	16
70	2	17
71	2	18
72	2	19
73	2	20
74	2	21
75	2	25
76	2	26
77	2	27
78	2	28
79	2	29
80	2	30
81	2	31
82	2	32
83	2	33
84	2	34
85	2	35
86	2	36
87	2	37
88	2	38
89	2	39
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supaadmin
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 89, true);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: supaadmin
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add user	3	add_user
8	Can change user	3	change_user
9	Can delete user	3	delete_user
10	Can add group	4	add_group
11	Can change group	4	change_group
12	Can delete group	4	delete_group
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add profile	7	add_profile
20	Can change profile	7	change_profile
21	Can delete profile	7	delete_profile
25	Can add post	9	add_post
26	Can change post	9	change_post
27	Can delete post	9	delete_post
28	Can add office	10	add_office
29	Can change office	10	change_office
30	Can delete office	10	delete_office
31	Can add group profile	11	add_groupprofile
32	Can change group profile	11	change_groupprofile
33	Can delete group profile	11	delete_groupprofile
34	Can add form	12	add_form
35	Can change form	12	change_form
36	Can delete form	12	delete_form
37	Can add form_vstatus	13	add_form_vstatus
38	Can change form_vstatus	13	change_form_vstatus
39	Can delete form_vstatus	13	delete_form_vstatus
40	Can add department	14	add_department
41	Can change department	14	change_department
42	Can delete department	14	delete_department
43	Can add ministry	15	add_ministry
44	Can change ministry	15	change_ministry
45	Can delete ministry	15	delete_ministry
46	Can add op mtype	16	add_opmtype
47	Can change op mtype	16	change_opmtype
48	Can delete op mtype	16	delete_opmtype
49	Can add project	17	add_project
50	Can change project	17	change_project
51	Can delete project	17	delete_project
52	Can add municipality	18	add_municipality
53	Can change municipality	18	change_municipality
54	Can delete municipality	18	delete_municipality
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supaadmin
--

SELECT pg_catalog.setval('auth_permission_id_seq', 54, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: supaadmin
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
22	pbkdf2_sha256$30000$ya7mMuxIZQce$hH6pY+TTB0PiYhUFof8oUejAtUCI0s2EMyA/84iBlfk=	2017-04-25 12:52:53.307855+05:45	f	mahesh1			mahesh1@gmail.com	f	t	2017-04-25 12:51:44.842806+05:45
23	!q8dWEu0hFctvwRn9duSQ6i20ThDkIEAJQZyro1Sv	\N	f	sdfsdf			dsfsdf@dfd.com	f	f	2017-05-10 12:46:07.518262+05:45
6	pbkdf2_sha256$36000$bPFfTWkCMgrW$OCwH9fQ8388cX2jn9nkt+0Qt+Gk70TSi+XI0TKB7MYA=	2017-05-14 08:12:40.949452+05:45	t	aasis			aashish@gmail.com	t	t	2017-04-16 16:18:01+05:45
21	pbkdf2_sha256$30000$n9T59XkaV2uU$AOACyBNXv58GweKlgJcMQj3aJtxSXJR5gon+y0GOp5c=	\N	f	mahesh			mahesh@gmail.com	f	t	2017-04-25 12:41:07.767416+05:45
5	pbkdf2_sha256$36000$vOzShvYph1Qw$qGId6H6SUtPOnbNoZnEeK+87VQDXp5QI7UBrSVsP+/I=	2017-05-12 17:04:42+05:45	t	supa			supa@gmail.com	t	t	2017-04-12 19:39:10+05:45
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: supaadmin
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
2	5	2
7	6	3
14	21	4
15	22	4
16	23	4
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supaadmin
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 16, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supaadmin
--

SELECT pg_catalog.setval('auth_user_id_seq', 23, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: supaadmin
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supaadmin
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: supaadmin
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
16	2017-04-12 19:40:31.985541+05:45	3	aasis	3		3	5
17	2017-04-12 19:40:32.003244+05:45	4	admin	3		3	5
18	2017-04-16 16:36:39.329364+05:45	2	supa	2	[]	7	5
19	2017-04-17 11:44:09.342082+05:45	1	aasis	1	[{"added": {}}]	4	5
20	2017-04-17 11:44:36.333831+05:45	1	GroupProfile object	1	[{"added": {}}]	11	5
21	2017-04-17 11:46:22.965592+05:45	1	aasis	3		4	5
22	2017-04-17 11:47:03.98876+05:45	2	supa-admin	1	[{"added": {}}]	4	5
23	2017-04-17 11:51:04.52217+05:45	2	supa-admin	1	[{"added": {}}]	11	5
24	2017-04-17 11:54:55.709751+05:45	3	supa-manager	1	[{"added": {}}]	4	5
25	2017-04-17 11:55:42.573541+05:45	4	office-manager	1	[{"added": {}}]	4	5
26	2017-04-17 11:56:04.156423+05:45	5	office-worker	1	[{"added": {}}]	4	5
27	2017-04-17 11:56:50.860847+05:45	3	supa-manager	1	[{"added": {}}]	11	5
28	2017-04-17 11:57:01.27685+05:45	4	office-manager	1	[{"added": {}}]	11	5
29	2017-04-17 11:57:09.960751+05:45	5	office-worker	1	[{"added": {}}]	11	5
30	2017-04-17 12:05:41.677531+05:45	5	supa	2	[]	3	5
31	2017-04-18 12:13:35.438025+05:45	2	supa-admin	2	[]	4	5
32	2017-04-18 12:14:45.345102+05:45	2	supa-admin	2	[]	4	5
33	2017-04-18 12:15:39.360013+05:45	2	supa-admin	2	[]	4	5
34	2017-04-18 12:19:56.462581+05:45	2	supa-admin	2	[]	4	5
35	2017-04-18 12:21:45.07016+05:45	5	supa	2	[]	3	5
36	2017-04-18 12:29:25.542389+05:45	5	supa	2	[]	3	5
37	2017-04-18 12:30:08.618094+05:45	5	supa	2	[{"changed": {"fields": ["is_superuser"]}}]	3	5
38	2017-04-18 12:35:02.852928+05:45	5	supa	2	[]	3	6
39	2017-04-20 11:10:29.80159+05:45	5	office-staff	2	[{"changed": {"fields": ["name"]}}]	4	6
40	2017-04-20 11:21:59.888608+05:45	6	aasis	2	[]	3	6
41	2017-04-20 11:35:32.489609+05:45	6	aasis	2	[]	3	6
42	2017-04-20 11:36:37.599938+05:45	6	aasis	2	[]	3	6
43	2017-04-20 11:38:44.295632+05:45	6	aasis	2	[]	3	6
44	2017-04-20 11:39:03.032824+05:45	6	aasis	2	[]	3	6
45	2017-04-21 11:42:22.964365+05:45	11	fsdfs	1	[{"added": {}}]	10	6
46	2017-04-25 12:40:12.730942+05:45	7	dfgdfgdfg	3		3	6
47	2017-04-25 12:40:12.811124+05:45	8	dfgdfgdfgsds	3		3	6
48	2017-04-25 12:40:12.866255+05:45	9	dsfdsa	3		3	6
49	2017-04-25 12:40:12.877259+05:45	18	dsfdsadfdsfdsfdsfdf11fdfsdfsdfsd111dfsgfgssdfg	3		3	6
50	2017-04-25 12:40:12.888354+05:45	10	dsfdsaf	3		3	6
51	2017-04-25 12:40:12.899403+05:45	11	dsfdsafdsf	3		3	6
52	2017-04-25 12:40:12.910536+05:45	15	dsfdsafdsfdf11111dfsgfgss	3		3	6
53	2017-04-25 12:40:12.921652+05:45	16	dsfdsafdsfdf11111dfsgfgssdfg	3		3	6
54	2017-04-25 12:40:12.932794+05:45	17	dsfdsafdsfdf11fdfsdfsdfsd111dfsgfgssdfg	3		3	6
55	2017-04-25 12:40:12.943745+05:45	14	dsfdsafdsfdfdfsgfgss	3		3	6
56	2017-04-25 12:40:12.95495+05:45	13	dsfdsafdsfdfdfsss	3		3	6
57	2017-04-25 12:40:12.966281+05:45	12	dsfdsafdsfs	3		3	6
58	2017-04-25 12:40:12.977151+05:45	19	sdsasdsfdsadfdsfdsfdsfdf11fdfsdfsdfsd111dfsgfgssdfg	3		3	6
59	2017-04-25 12:40:12.988503+05:45	20	sdsasdsfssdfsdfsdfddsfdsadfdsfdsfdsfdf11fdfsdfsdfsd111dfsgfgssdfg	3		3	6
60	2017-05-02 13:07:09.30403+05:45	1	new form	1	[{"added": {}}]	12	6
61	2017-05-02 13:07:33.028248+05:45	1	Form_vstatus object	1	[{"added": {}}]	13	6
62	2017-05-10 11:21:21.911358+05:45	2	supa-admin	2	[]	4	6
63	2017-05-10 11:22:31.497614+05:45	2	supa-admin	2	[]	4	5
64	2017-05-10 11:24:55.205789+05:45	2	supa-admin	2	[]	4	5
65	2017-05-10 12:33:22.142252+05:45	2	supa-admin	2	[]	4	5
66	2017-05-15 11:28:05.877385+05:45	14	fdgf99999999999	3		10	5
67	2017-05-15 11:28:05.928776+05:45	13	fdgf	3		10	5
68	2017-05-15 11:28:05.939775+05:45	12	fdgf	3		10	5
69	2017-05-15 11:28:05.950656+05:45	11	fsdfs	3		10	5
70	2017-05-15 11:28:05.961743+05:45	10	sasaasasasa23232323	3		10	5
71	2017-05-15 11:28:05.972917+05:45	9	df	3		10	5
72	2017-05-15 11:28:05.98413+05:45	8	df	3		10	5
73	2017-05-15 11:28:05.995161+05:45	7	df	3		10	5
74	2017-05-15 11:28:06.006161+05:45	6	er	3		10	5
75	2017-05-15 11:28:06.017377+05:45	5	er	3		10	5
76	2017-05-15 11:28:06.028441+05:45	3	aasis	3		10	5
77	2017-05-15 11:28:06.039435+05:45	2	aasis	3		10	5
78	2017-05-15 11:28:06.050727+05:45	1	aasis	3		10	5
79	2017-05-15 11:35:35.470157+05:45	5	supa	2	[{"changed": {"fields": ["is_superuser"]}}]	3	5
80	2017-05-15 11:36:02.182449+05:45	1	Ministry 1	1	[{"added": {}}]	15	5
81	2017-05-15 11:36:27.353583+05:45	1	Department 1	1	[{"added": {}}]	14	5
82	2017-05-15 11:37:15.84972+05:45	15	Office1	1	[{"added": {}}]	10	5
83	2017-05-16 11:28:48.287642+05:45	1	Department 1	2	[]	14	5
84	2017-05-16 11:50:47.123643+05:45	2	new	1	[{"added": {}}]	14	5
85	2017-05-16 11:51:03.804955+05:45	3	test	1	[{"added": {}}]	14	5
86	2017-05-16 11:51:10.469497+05:45	3	test	2	[{"changed": {"fields": ["ministry"]}}]	14	5
87	2017-05-17 11:30:03.771365+05:45	3	sd	1	[{"added": {}}]	16	5
88	2017-05-17 11:39:39.172241+05:45	3	sd	3		16	5
89	2017-05-17 11:42:58.592455+05:45	20	Office object	3		10	5
90	2017-05-17 11:42:58.619607+05:45	15	Office object	3		10	5
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supaadmin
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 90, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: supaadmin
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	user
4	auth	group
5	contenttypes	contenttype
6	sessions	session
7	supa	profile
9	supa	post
10	supa	office
11	supa	groupprofile
12	supa	form
13	supa	form_vstatus
14	supa	department
15	supa	ministry
16	supa	opmtype
17	supa	project
18	supa	municipality
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supaadmin
--

SELECT pg_catalog.setval('django_content_type_id_seq', 18, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: supaadmin
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-04-09 15:04:44.543627+05:45
2	auth	0001_initial	2017-04-09 15:04:45.410472+05:45
3	admin	0001_initial	2017-04-09 15:04:45.654225+05:45
4	admin	0002_logentry_remove_auto_add	2017-04-09 15:04:45.687486+05:45
5	contenttypes	0002_remove_content_type_name	2017-04-09 15:04:45.753857+05:45
6	auth	0002_alter_permission_name_max_length	2017-04-09 15:04:45.786857+05:45
7	auth	0003_alter_user_email_max_length	2017-04-09 15:04:45.820386+05:45
8	auth	0004_alter_user_username_opts	2017-04-09 15:04:45.843662+05:45
9	auth	0005_alter_user_last_login_null	2017-04-09 15:04:45.875716+05:45
10	auth	0006_require_contenttypes_0002	2017-04-09 15:04:45.886933+05:45
11	auth	0007_alter_validators_add_error_messages	2017-04-09 15:04:45.912372+05:45
12	auth	0008_alter_user_username_max_length	2017-04-09 15:04:45.998257+05:45
13	sessions	0001_initial	2017-04-09 15:04:46.220214+05:45
15	supa	0002_auto_20170410_0522	2017-04-10 11:08:00.542614+05:45
16	supa	0003_post	2017-04-12 13:51:41.636618+05:45
17	supa	0004_auto_20170412_0857	2017-04-12 14:42:53.883367+05:45
18	supa	0002_auto_20170412_1330	2017-04-12 19:15:42.890587+05:45
19	supa	0003_profile_birth_dates	2017-04-12 19:17:10.196223+05:45
20	supa	0004_remove_profile_birth_dates	2017-04-12 19:17:43.543419+05:45
22	supa	0001_initial	2017-04-12 19:29:49.888585+05:45
23	supa	0002_auto_20170412_1353	2017-04-12 19:38:31.696078+05:45
24	supa	0003_auto_20170416_1113	2017-04-16 16:58:11.646793+05:45
25	supa	0004_groupprofile	2017-04-17 11:43:21.961925+05:45
26	supa	0005_auto_20170417_0605	2017-04-17 11:50:31.815825+05:45
27	supa	0006_auto_20170417_0740	2017-04-17 13:25:53.780525+05:45
28	supa	0007_remove_profile_post	2017-04-21 12:30:36.385443+05:45
29	supa	0008_profile_email_confirmed	2017-04-21 13:01:40.847667+05:45
30	supa	0009_profile_photo_url	2017-04-21 15:53:49.849077+05:45
31	supa	0010_form_form_vstatus	2017-05-02 11:49:21.753718+05:45
32	supa	0011_auto_20170515_0540	2017-05-15 11:28:26.434651+05:45
33	supa	0012_auto_20170516_0558	2017-05-16 11:43:47.040302+05:45
34	supa	0013_auto_20170516_0605	2017-05-16 11:50:36.333453+05:45
35	supa	0014_auto_20170516_0619	2017-05-16 12:04:34.368463+05:45
36	supa	0015_auto_20170516_0959	2017-05-16 15:44:46.559039+05:45
37	supa	0016_auto_20170517_0553	2017-05-17 11:38:49.336404+05:45
38	supa	0017_auto_20170517_0601	2017-05-17 11:46:25.29675+05:45
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supaadmin
--

SELECT pg_catalog.setval('django_migrations_id_seq', 38, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: supaadmin
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
chn042fbd143deafd4e8918df21c2011	NGFkM2ZhOGE2M2FmNDFmMDFlYjU1MjA5YTQwNzQ3NWI2ZmI1ZDFmNzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA5NTNjNzZkMmE3MGQ3NTQxNWUzODNmNDlkYWIwNTlhZDgzYTkwZWEiLCJfYXV0aF91c2VyX2lkIjoiNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-05-29 10:59:41.787453+05:45
chn8c158eac53cd473dd458313f12be6	NGFkM2ZhOGE2M2FmNDFmMDFlYjU1MjA5YTQwNzQ3NWI2ZmI1ZDFmNzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA5NTNjNzZkMmE3MGQ3NTQxNWUzODNmNDlkYWIwNTlhZDgzYTkwZWEiLCJfYXV0aF91c2VyX2lkIjoiNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-05-29 20:52:31.522936+05:45
q2jnv47wf52sel40syb96xc3i3ex5uhc	NTRmZDFmYjQ0MWVmYjRmMDE4OTUzNGE1NDIyNjg0MTViYzczYzZiYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjA5NTNjNzZkMmE3MGQ3NTQxNWUzODNmNDlkYWIwNTlhZDgzYTkwZWEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1In0=	2017-05-26 17:04:42.560737+05:45
chn732567b4c5d0fd72ef532f6d66ca7	NGFkM2ZhOGE2M2FmNDFmMDFlYjU1MjA5YTQwNzQ3NWI2ZmI1ZDFmNzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA5NTNjNzZkMmE3MGQ3NTQxNWUzODNmNDlkYWIwNTlhZDgzYTkwZWEiLCJfYXV0aF91c2VyX2lkIjoiNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-05-26 20:53:03.128683+05:45
chn7012608a65777f675de731bf1a0af	NGFkM2ZhOGE2M2FmNDFmMDFlYjU1MjA5YTQwNzQ3NWI2ZmI1ZDFmNzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA5NTNjNzZkMmE3MGQ3NTQxNWUzODNmNDlkYWIwNTlhZDgzYTkwZWEiLCJfYXV0aF91c2VyX2lkIjoiNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-05-26 20:53:55.64154+05:45
chn49e300c01e59cec9d285cbed15e35	NGFkM2ZhOGE2M2FmNDFmMDFlYjU1MjA5YTQwNzQ3NWI2ZmI1ZDFmNzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA5NTNjNzZkMmE3MGQ3NTQxNWUzODNmNDlkYWIwNTlhZDgzYTkwZWEiLCJfYXV0aF91c2VyX2lkIjoiNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-05-26 20:54:14.771015+05:45
chn9aef5e3d9dd43ec8304f5aae13a93	NGFkM2ZhOGE2M2FmNDFmMDFlYjU1MjA5YTQwNzQ3NWI2ZmI1ZDFmNzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA5NTNjNzZkMmE3MGQ3NTQxNWUzODNmNDlkYWIwNTlhZDgzYTkwZWEiLCJfYXV0aF91c2VyX2lkIjoiNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-05-28 08:11:28.252134+05:45
yq5xazuc4rebecmvud7izm45pcgja5z7	YmZiMjg4NWUwOGJlOWY3Njg3Y2NmOWE2ODZiZDNjMjBhZjRkOTVjNjp7Il9hdXRoX3VzZXJfaGFzaCI6IjFiZGExYWUwNGFhNDkwYTBlNzUxODA3ZTdmOTI2NDJmZTJlYjc3ZmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2In0=	2017-05-28 08:12:41.02687+05:45
chn61441f1a8a3fc5d97a9cee8aae77f	OGQ3MzNjYWFhZjcyYzU1NmY3NGQ0MzdkNjhlYjY0NGRkYjI1Y2NiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjFiZGExYWUwNGFhNDkwYTBlNzUxODA3ZTdmOTI2NDJmZTJlYjc3ZmIiLCJfYXV0aF91c2VyX2lkIjoiNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-05-28 08:13:47.543814+05:45
chn90a750a448c94299e01d3ddfdd818	NGFkM2ZhOGE2M2FmNDFmMDFlYjU1MjA5YTQwNzQ3NWI2ZmI1ZDFmNzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA5NTNjNzZkMmE3MGQ3NTQxNWUzODNmNDlkYWIwNTlhZDgzYTkwZWEiLCJfYXV0aF91c2VyX2lkIjoiNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-05-28 08:15:06.046618+05:45
chnbda03556963d4334deceef9c4dbf9	NGFkM2ZhOGE2M2FmNDFmMDFlYjU1MjA5YTQwNzQ3NWI2ZmI1ZDFmNzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA5NTNjNzZkMmE3MGQ3NTQxNWUzODNmNDlkYWIwNTlhZDgzYTkwZWEiLCJfYXV0aF91c2VyX2lkIjoiNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-05-28 08:15:23.287946+05:45
chn49f4848ac060a61c91dd957c41504	OGQ3MzNjYWFhZjcyYzU1NmY3NGQ0MzdkNjhlYjY0NGRkYjI1Y2NiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjFiZGExYWUwNGFhNDkwYTBlNzUxODA3ZTdmOTI2NDJmZTJlYjc3ZmIiLCJfYXV0aF91c2VyX2lkIjoiNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-05-28 08:15:45.406337+05:45
chn625f65c7fbed7caa3be926c3d1c5b	OGQ3MzNjYWFhZjcyYzU1NmY3NGQ0MzdkNjhlYjY0NGRkYjI1Y2NiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjFiZGExYWUwNGFhNDkwYTBlNzUxODA3ZTdmOTI2NDJmZTJlYjc3ZmIiLCJfYXV0aF91c2VyX2lkIjoiNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-05-28 08:15:59.834963+05:45
chn75594cd588685f70505c8ba95b837	NGFkM2ZhOGE2M2FmNDFmMDFlYjU1MjA5YTQwNzQ3NWI2ZmI1ZDFmNzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA5NTNjNzZkMmE3MGQ3NTQxNWUzODNmNDlkYWIwNTlhZDgzYTkwZWEiLCJfYXV0aF91c2VyX2lkIjoiNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-05-28 08:16:16.110818+05:45
chne855a62d6917b463bef4bcedfce23	NGFkM2ZhOGE2M2FmNDFmMDFlYjU1MjA5YTQwNzQ3NWI2ZmI1ZDFmNzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA5NTNjNzZkMmE3MGQ3NTQxNWUzODNmNDlkYWIwNTlhZDgzYTkwZWEiLCJfYXV0aF91c2VyX2lkIjoiNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-05-28 08:17:25.698366+05:45
chnc7446b9c2c014bba89c2af7bf50a8	NGFkM2ZhOGE2M2FmNDFmMDFlYjU1MjA5YTQwNzQ3NWI2ZmI1ZDFmNzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA5NTNjNzZkMmE3MGQ3NTQxNWUzODNmNDlkYWIwNTlhZDgzYTkwZWEiLCJfYXV0aF91c2VyX2lkIjoiNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-05-28 08:18:24.75654+05:45
chn04cb96ee0c77ff3fd3b045c659940	OGQ3MzNjYWFhZjcyYzU1NmY3NGQ0MzdkNjhlYjY0NGRkYjI1Y2NiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjFiZGExYWUwNGFhNDkwYTBlNzUxODA3ZTdmOTI2NDJmZTJlYjc3ZmIiLCJfYXV0aF91c2VyX2lkIjoiNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-05-28 08:18:47.070673+05:45
chn8b8d72229230b79c7f6e54e72b6be	OGQ3MzNjYWFhZjcyYzU1NmY3NGQ0MzdkNjhlYjY0NGRkYjI1Y2NiMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjFiZGExYWUwNGFhNDkwYTBlNzUxODA3ZTdmOTI2NDJmZTJlYjc3ZmIiLCJfYXV0aF91c2VyX2lkIjoiNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-05-28 08:19:02.900759+05:45
chn237de79e5463aa78b994cc74525fe	NGFkM2ZhOGE2M2FmNDFmMDFlYjU1MjA5YTQwNzQ3NWI2ZmI1ZDFmNzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA5NTNjNzZkMmE3MGQ3NTQxNWUzODNmNDlkYWIwNTlhZDgzYTkwZWEiLCJfYXV0aF91c2VyX2lkIjoiNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-05-28 08:19:35.675848+05:45
\.


--
-- Data for Name: supa_department; Type: TABLE DATA; Schema: public; Owner: supaadmin
--

COPY supa_department (id, department_name, ministry_id) FROM stdin;
1	Department 1	1
3	test	1
2	new	1
\.


--
-- Name: supa_department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supaadmin
--

SELECT pg_catalog.setval('supa_department_id_seq', 3, true);


--
-- Data for Name: supa_form; Type: TABLE DATA; Schema: public; Owner: supaadmin
--

COPY supa_form (id, name) FROM stdin;
1	new form
\.


--
-- Name: supa_form_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supaadmin
--

SELECT pg_catalog.setval('supa_form_id_seq', 1, true);


--
-- Data for Name: supa_form_vstatus; Type: TABLE DATA; Schema: public; Owner: supaadmin
--

COPY supa_form_vstatus (id, status, formid_id) FROM stdin;
1	v	1
\.


--
-- Name: supa_form_vstatus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supaadmin
--

SELECT pg_catalog.setval('supa_form_vstatus_id_seq', 1, true);


--
-- Data for Name: supa_groupprofile; Type: TABLE DATA; Schema: public; Owner: supaadmin
--

COPY supa_groupprofile (level, group_id) FROM stdin;
4	2
3	3
2	4
1	5
\.


--
-- Data for Name: supa_ministry; Type: TABLE DATA; Schema: public; Owner: supaadmin
--

COPY supa_ministry (id, ministry_name) FROM stdin;
1	Ministry 1
\.


--
-- Name: supa_ministry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supaadmin
--

SELECT pg_catalog.setval('supa_ministry_id_seq', 1, true);


--
-- Data for Name: supa_municipality; Type: TABLE DATA; Schema: public; Owner: supaadmin
--

COPY supa_municipality (id, kendra, area, no_of_wards, population, activities, mayor_name, mayor_phone_no, mayor_address, sub_mayor_name, sub_mayor_phone_no, sub_mayor_address, ward_chief_details, "OPMtype_id") FROM stdin;
1	fdg	kjhykj	jkhkj	kjh	jkh	kjh	kjh	kjh	khk	kjhk	kjhk	dsfsd	9
\.


--
-- Name: supa_municipality_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supaadmin
--

SELECT pg_catalog.setval('supa_municipality_id_seq', 1, true);


--
-- Data for Name: supa_office; Type: TABLE DATA; Schema: public; Owner: supaadmin
--

COPY supa_office (id, dev_acts, "OPMtype_id") FROM stdin;
22	fcsdfsdf11122222333333333	7
\.


--
-- Name: supa_office_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supaadmin
--

SELECT pg_catalog.setval('supa_office_id_seq', 22, true);


--
-- Data for Name: supa_opmtype; Type: TABLE DATA; Schema: public; Owner: supaadmin
--

COPY supa_opmtype (id, name, category, address, email, phone, fax, yearly_budget, office_time, no_of_workers, vehicle, head_name, head_post, head_phone_no, head_assign_date, head_act_time, infoofficer_name, infoofficer_post, infoofficer_phone_no, infoofficer_assign_date, infoofficer_act_time, accountant_name, accountant_post, accountant_phone_no, accountant_assign_date, accountant_act_time, department_id) FROM stdin;
4	dsfs	OfficeForm		sadsa@dfsd.com																						1
5	dfgfdgdf1111111111	ProjectForm	dfgdf	dfgdf@dgd.com																						1
6	dfgfdgdf1111111111	ProjectForm	dfgdf	dfgdf@dgd.com																						1
7	dfgfdgdf1111111111	OfficeForm	dfgdf	dfgdf@dgd.com																						1
8	dfgfdgdf1111111111	ProjectForm	dfgdf	dfgdf@dgd.com																						1
9	newtest	Municipality	ewrwe@gtdfg.com																							1
\.


--
-- Name: supa_opmtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supaadmin
--

SELECT pg_catalog.setval('supa_opmtype_id_seq', 9, true);


--
-- Data for Name: supa_post; Type: TABLE DATA; Schema: public; Owner: supaadmin
--

COPY supa_post (id, post, value) FROM stdin;
1	admin	4
\.


--
-- Name: supa_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supaadmin
--

SELECT pg_catalog.setval('supa_post_id_seq', 1, false);


--
-- Data for Name: supa_profile; Type: TABLE DATA; Schema: public; Owner: supaadmin
--

COPY supa_profile (id, office, location, birth_date, user_id, email_confirmed, photo_url) FROM stdin;
18	f		\N	21	t	\N
19	f		\N	22	t	\N
20	f		\N	23	f	\N
3	f		\N	6	f	\N
2	f		\N	5	f	\N
\.


--
-- Name: supa_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supaadmin
--

SELECT pg_catalog.setval('supa_profile_id_seq', 20, true);


--
-- Data for Name: supa_project; Type: TABLE DATA; Schema: public; Owner: supaadmin
--

COPY supa_project (id, project_time, budget, objective, chief_eng, engineers, "OPMtype_id") FROM stdin;
3	sdf	sdfsd	sdfsd	dsfsdf	sdfsd	6
4	dfgd	fdgdfg	fdgdfg	fgfdg	fdgfdg	8
\.


--
-- Name: supa_project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supaadmin
--

SELECT pg_catalog.setval('supa_project_id_seq', 4, true);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: supa_department_pkey; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_department
    ADD CONSTRAINT supa_department_pkey PRIMARY KEY (id);


--
-- Name: supa_form_pkey; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_form
    ADD CONSTRAINT supa_form_pkey PRIMARY KEY (id);


--
-- Name: supa_form_vstatus_formid_id_key; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_form_vstatus
    ADD CONSTRAINT supa_form_vstatus_formid_id_key UNIQUE (formid_id);


--
-- Name: supa_form_vstatus_pkey; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_form_vstatus
    ADD CONSTRAINT supa_form_vstatus_pkey PRIMARY KEY (id);


--
-- Name: supa_groupprofile_group_id_key; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_groupprofile
    ADD CONSTRAINT supa_groupprofile_group_id_key UNIQUE (group_id);


--
-- Name: supa_groupprofile_level_df262ecc_pk; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_groupprofile
    ADD CONSTRAINT supa_groupprofile_level_df262ecc_pk PRIMARY KEY (level);


--
-- Name: supa_ministry_pkey; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_ministry
    ADD CONSTRAINT supa_ministry_pkey PRIMARY KEY (id);


--
-- Name: supa_municipality_pkey; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_municipality
    ADD CONSTRAINT supa_municipality_pkey PRIMARY KEY (id);


--
-- Name: supa_office_pkey; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_office
    ADD CONSTRAINT supa_office_pkey PRIMARY KEY (id);


--
-- Name: supa_opmtype_pkey; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_opmtype
    ADD CONSTRAINT supa_opmtype_pkey PRIMARY KEY (id);


--
-- Name: supa_post_pkey; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_post
    ADD CONSTRAINT supa_post_pkey PRIMARY KEY (id);


--
-- Name: supa_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_profile
    ADD CONSTRAINT supa_profile_pkey PRIMARY KEY (id);


--
-- Name: supa_profile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_profile
    ADD CONSTRAINT supa_profile_user_id_key UNIQUE (user_id);


--
-- Name: supa_project_pkey; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_project
    ADD CONSTRAINT supa_project_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: supaadmin
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: supaadmin
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: supaadmin
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: supaadmin
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: supaadmin
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: supaadmin
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: supaadmin
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: supaadmin
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: supaadmin
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: supaadmin
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: supaadmin
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: supaadmin
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: supaadmin
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: supa_department_ministry_id_af75ae64; Type: INDEX; Schema: public; Owner: supaadmin
--

CREATE INDEX supa_department_ministry_id_af75ae64 ON supa_department USING btree (ministry_id);


--
-- Name: supa_municipality_OPMtype_id_11bb1684; Type: INDEX; Schema: public; Owner: supaadmin
--

CREATE INDEX "supa_municipality_OPMtype_id_11bb1684" ON supa_municipality USING btree ("OPMtype_id");


--
-- Name: supa_office_OPMtype_id_d605ac6a; Type: INDEX; Schema: public; Owner: supaadmin
--

CREATE INDEX "supa_office_OPMtype_id_d605ac6a" ON supa_office USING btree ("OPMtype_id");


--
-- Name: supa_opmtype_department_id_476bb735; Type: INDEX; Schema: public; Owner: supaadmin
--

CREATE INDEX supa_opmtype_department_id_476bb735 ON supa_opmtype USING btree (department_id);


--
-- Name: supa_project_OPMtype_id_5c21a52a; Type: INDEX; Schema: public; Owner: supaadmin
--

CREATE INDEX "supa_project_OPMtype_id_5c21a52a" ON supa_project USING btree ("OPMtype_id");


--
-- Name: auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: supa_department_ministry_id_af75ae64_fk_supa_ministry_id; Type: FK CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_department
    ADD CONSTRAINT supa_department_ministry_id_af75ae64_fk_supa_ministry_id FOREIGN KEY (ministry_id) REFERENCES supa_ministry(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: supa_form_vstatus_formid_id_bc95456a_fk_supa_form_id; Type: FK CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_form_vstatus
    ADD CONSTRAINT supa_form_vstatus_formid_id_bc95456a_fk_supa_form_id FOREIGN KEY (formid_id) REFERENCES supa_form(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: supa_groupprofile_group_id_eed5e2e0_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_groupprofile
    ADD CONSTRAINT supa_groupprofile_group_id_eed5e2e0_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: supa_municipality_OPMtype_id_11bb1684_fk_supa_opmtype_id; Type: FK CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_municipality
    ADD CONSTRAINT "supa_municipality_OPMtype_id_11bb1684_fk_supa_opmtype_id" FOREIGN KEY ("OPMtype_id") REFERENCES supa_opmtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: supa_office_OPMtype_id_d605ac6a_fk_supa_opmtype_id; Type: FK CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_office
    ADD CONSTRAINT "supa_office_OPMtype_id_d605ac6a_fk_supa_opmtype_id" FOREIGN KEY ("OPMtype_id") REFERENCES supa_opmtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: supa_opmtype_department_id_476bb735_fk_supa_department_id; Type: FK CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_opmtype
    ADD CONSTRAINT supa_opmtype_department_id_476bb735_fk_supa_department_id FOREIGN KEY (department_id) REFERENCES supa_department(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: supa_profile_user_id_c6985ae4_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_profile
    ADD CONSTRAINT supa_profile_user_id_c6985ae4_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: supa_project_OPMtype_id_5c21a52a_fk_supa_opmtype_id; Type: FK CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_project
    ADD CONSTRAINT "supa_project_OPMtype_id_5c21a52a_fk_supa_opmtype_id" FOREIGN KEY ("OPMtype_id") REFERENCES supa_opmtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

