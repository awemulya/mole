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
-- Name: supa_allacts; Type: TABLE; Schema: public; Owner: supaadmin
--

CREATE TABLE supa_allacts (
    id integer NOT NULL,
    parinam character varying(30) NOT NULL,
    bhar character varying(30) NOT NULL,
    laagat character varying(30) NOT NULL,
    form_id integer NOT NULL
);


ALTER TABLE supa_allacts OWNER TO supaadmin;

--
-- Name: supa_allacts_id_seq; Type: SEQUENCE; Schema: public; Owner: supaadmin
--

CREATE SEQUENCE supa_allacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supa_allacts_id_seq OWNER TO supaadmin;

--
-- Name: supa_allacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: supaadmin
--

ALTER SEQUENCE supa_allacts_id_seq OWNED BY supa_allacts.id;


--
-- Name: supa_currentacts; Type: TABLE; Schema: public; Owner: supaadmin
--

CREATE TABLE supa_currentacts (
    id integer NOT NULL,
    parinam character varying(30) NOT NULL,
    bhar character varying(30) NOT NULL,
    laagat character varying(30) NOT NULL,
    form_id integer NOT NULL
);


ALTER TABLE supa_currentacts OWNER TO supaadmin;

--
-- Name: supa_currentacts_id_seq; Type: SEQUENCE; Schema: public; Owner: supaadmin
--

CREATE SEQUENCE supa_currentacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supa_currentacts_id_seq OWNER TO supaadmin;

--
-- Name: supa_currentacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: supaadmin
--

ALTER SEQUENCE supa_currentacts_id_seq OWNED BY supa_currentacts.id;


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
-- Name: supa_first; Type: TABLE; Schema: public; Owner: supaadmin
--

CREATE TABLE supa_first (
    id integer NOT NULL,
    parinam character varying(30) NOT NULL,
    bhar character varying(30) NOT NULL,
    budget character varying(30) NOT NULL,
    form_id integer NOT NULL,
    createdon date NOT NULL,
    updatedon date NOT NULL
);


ALTER TABLE supa_first OWNER TO supaadmin;

--
-- Name: supa_first_id_seq; Type: SEQUENCE; Schema: public; Owner: supaadmin
--

CREATE SEQUENCE supa_first_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supa_first_id_seq OWNER TO supaadmin;

--
-- Name: supa_first_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: supaadmin
--

ALTER SEQUENCE supa_first_id_seq OWNED BY supa_first.id;


--
-- Name: supa_form; Type: TABLE; Schema: public; Owner: supaadmin
--

CREATE TABLE supa_form (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    ekai character varying(30) NOT NULL,
    karchasirsak text NOT NULL,
    title text NOT NULL,
    createdon date NOT NULL,
    updatedon date NOT NULL,
    "OPMtype_id" integer NOT NULL
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
-- Name: supa_form_status; Type: TABLE; Schema: public; Owner: supaadmin
--

CREATE TABLE supa_form_status (
    id integer NOT NULL,
    v_status character varying(1) NOT NULL,
    "C_status" character varying(1) NOT NULL,
    form_id integer NOT NULL
);


ALTER TABLE supa_form_status OWNER TO supaadmin;

--
-- Name: supa_form_status_id_seq; Type: SEQUENCE; Schema: public; Owner: supaadmin
--

CREATE SEQUENCE supa_form_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supa_form_status_id_seq OWNER TO supaadmin;

--
-- Name: supa_form_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: supaadmin
--

ALTER SEQUENCE supa_form_status_id_seq OWNED BY supa_form_status.id;


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
    department_id integer NOT NULL,
    district character varying(255) NOT NULL
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
    name character varying(30) NOT NULL,
    birth_date date,
    user_id integer NOT NULL,
    email_confirmed boolean NOT NULL,
    photo character varying(100),
    "OPMtype_id" integer,
    assign_date date,
    phoneno character varying(30) NOT NULL
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
-- Name: supa_second; Type: TABLE; Schema: public; Owner: supaadmin
--

CREATE TABLE supa_second (
    id integer NOT NULL,
    parinam character varying(30) NOT NULL,
    bhar character varying(30) NOT NULL,
    budget character varying(30) NOT NULL,
    form_id integer NOT NULL,
    createdon date NOT NULL,
    updatedon date NOT NULL
);


ALTER TABLE supa_second OWNER TO supaadmin;

--
-- Name: supa_second_id_seq; Type: SEQUENCE; Schema: public; Owner: supaadmin
--

CREATE SEQUENCE supa_second_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supa_second_id_seq OWNER TO supaadmin;

--
-- Name: supa_second_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: supaadmin
--

ALTER SEQUENCE supa_second_id_seq OWNED BY supa_second.id;


--
-- Name: supa_third; Type: TABLE; Schema: public; Owner: supaadmin
--

CREATE TABLE supa_third (
    id integer NOT NULL,
    parinam character varying(30) NOT NULL,
    bhar character varying(30) NOT NULL,
    budget character varying(30) NOT NULL,
    form_id integer NOT NULL,
    createdon date NOT NULL,
    updatedon date NOT NULL
);


ALTER TABLE supa_third OWNER TO supaadmin;

--
-- Name: supa_third_id_seq; Type: SEQUENCE; Schema: public; Owner: supaadmin
--

CREATE SEQUENCE supa_third_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supa_third_id_seq OWNER TO supaadmin;

--
-- Name: supa_third_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: supaadmin
--

ALTER SEQUENCE supa_third_id_seq OWNED BY supa_third.id;


--
-- Name: supa_yearlyaim; Type: TABLE; Schema: public; Owner: supaadmin
--

CREATE TABLE supa_yearlyaim (
    id integer NOT NULL,
    parinam character varying(30) NOT NULL,
    bhar character varying(30) NOT NULL,
    budget character varying(30) NOT NULL,
    form_id integer NOT NULL,
    createdon date NOT NULL,
    updatedon date NOT NULL
);


ALTER TABLE supa_yearlyaim OWNER TO supaadmin;

--
-- Name: supa_yearlyaim_id_seq; Type: SEQUENCE; Schema: public; Owner: supaadmin
--

CREATE SEQUENCE supa_yearlyaim_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supa_yearlyaim_id_seq OWNER TO supaadmin;

--
-- Name: supa_yearlyaim_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: supaadmin
--

ALTER SEQUENCE supa_yearlyaim_id_seq OWNED BY supa_yearlyaim.id;


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

ALTER TABLE ONLY supa_allacts ALTER COLUMN id SET DEFAULT nextval('supa_allacts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_currentacts ALTER COLUMN id SET DEFAULT nextval('supa_currentacts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_department ALTER COLUMN id SET DEFAULT nextval('supa_department_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_first ALTER COLUMN id SET DEFAULT nextval('supa_first_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_form ALTER COLUMN id SET DEFAULT nextval('supa_form_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_form_status ALTER COLUMN id SET DEFAULT nextval('supa_form_status_id_seq'::regclass);


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
-- Name: id; Type: DEFAULT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_second ALTER COLUMN id SET DEFAULT nextval('supa_second_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_third ALTER COLUMN id SET DEFAULT nextval('supa_third_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_yearlyaim ALTER COLUMN id SET DEFAULT nextval('supa_yearlyaim_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: supaadmin
--

COPY auth_group (id, name) FROM stdin;
3	supa-manager
5	office-staff
2	supa-admin
4	office-manager
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
90	4	34
91	4	35
92	4	38
93	4	7
94	4	47
95	4	50
96	4	53
97	4	55
98	4	56
99	4	58
100	4	59
101	4	29
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supaadmin
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 101, true);


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
55	Can add currentacts	19	add_currentacts
56	Can change currentacts	19	change_currentacts
57	Can delete currentacts	19	delete_currentacts
58	Can add allacts	20	add_allacts
59	Can change allacts	20	change_allacts
60	Can delete allacts	20	delete_allacts
61	Can add yearlyaim	21	add_yearlyaim
62	Can change yearlyaim	21	change_yearlyaim
63	Can delete yearlyaim	21	delete_yearlyaim
64	Can add first	22	add_first
65	Can change first	22	change_first
66	Can delete first	22	delete_first
67	Can add second	23	add_second
68	Can change second	23	change_second
69	Can delete second	23	delete_second
70	Can add third	24	add_third
71	Can change third	24	change_third
72	Can delete third	24	delete_third
73	Can add form_status	25	add_form_status
74	Can change form_status	25	change_form_status
75	Can delete form_status	25	delete_form_status
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supaadmin
--

SELECT pg_catalog.setval('auth_permission_id_seq', 75, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: supaadmin
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
5	pbkdf2_sha256$36000$vOzShvYph1Qw$qGId6H6SUtPOnbNoZnEeK+87VQDXp5QI7UBrSVsP+/I=	2017-05-22 13:14:34.589185+05:45	t	supa			supa@gmail.com	t	t	2017-04-12 19:39:10+05:45
45	pbkdf2_sha256$36000$60oTlz0OHLtr$plXA9uc9RA7AQ/2GYx1Y67OyExXHD1NkNvyPgAoaUTw=	2017-05-22 13:15:54.279764+05:45	f	aashish1			aashish1@gmail.com	f	t	2017-05-19 15:57:54+05:45
44	pbkdf2_sha256$36000$gv7NEYASBBdt$gct9CSBI7QLKH8sLhEFmdXKr8R8d/HpWGk/b38leLa4=	2017-05-19 15:08:08.859329+05:45	f	testttttsdfsdfsssads			tststsdsdt@jhgh.com	f	t	2017-05-19 13:14:06.996838+05:45
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: supaadmin
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
2	5	2
25	44	3
27	45	4
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supaadmin
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 27, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supaadmin
--

SELECT pg_catalog.setval('auth_user_id_seq', 45, true);


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
91	2017-05-18 15:48:45.075961+05:45	21	bigman	2	[{"changed": {"fields": ["email_confirmed", "photo"]}}]	7	5
92	2017-05-18 15:48:53.301613+05:45	21	bigman	2	[]	7	5
93	2017-05-18 15:50:24.333292+05:45	21	bigman	2	[{"changed": {"fields": ["email_confirmed", "photo"]}}]	7	5
94	2017-05-18 15:52:51.170555+05:45	21	bigman	2	[{"changed": {"fields": ["email_confirmed", "photo"]}}]	7	5
95	2017-05-18 15:54:54.772064+05:45	21	bigman	2	[{"changed": {"fields": ["email_confirmed", "photo"]}}]	7	5
96	2017-05-18 15:56:42.361918+05:45	21	bigman	2	[{"changed": {"fields": ["email_confirmed", "photo"]}}]	7	5
97	2017-05-18 15:56:51.277685+05:45	21	bigman	2	[{"changed": {"fields": ["photo"]}}]	7	5
98	2017-05-18 15:57:16.795906+05:45	21	bigman	2	[{"changed": {"fields": ["photo"]}}]	7	5
99	2017-05-18 15:57:24.697105+05:45	21	bigman	2	[{"changed": {"fields": ["photo"]}}]	7	5
100	2017-05-18 16:01:22.028118+05:45	21	bigman	2	[{"changed": {"fields": ["photo"]}}]	7	5
101	2017-05-18 16:03:20.19311+05:45	21	bigman	2	[{"changed": {"fields": ["photo"]}}]	7	5
102	2017-05-18 16:06:26.504042+05:45	21	bigman	2	[{"changed": {"fields": ["email_confirmed"]}}]	7	5
103	2017-05-18 16:08:49.560718+05:45	21	bigman	2	[{"changed": {"fields": ["email_confirmed", "photo"]}}]	7	5
104	2017-05-18 16:47:39.10352+05:45	24	naam	2	[{"changed": {"fields": ["email_confirmed", "photo"]}}]	7	5
105	2017-05-18 16:54:02.547696+05:45	24	naam	2	[{"changed": {"fields": ["email_confirmed", "photo"]}}]	7	5
106	2017-05-18 16:57:07.956904+05:45	24	naam	2	[{"changed": {"fields": ["email_confirmed", "photo"]}}]	7	5
107	2017-05-18 16:57:52.018884+05:45	24	naam	2	[{"changed": {"fields": ["email_confirmed", "photo"]}}]	7	5
108	2017-05-18 17:01:50.29843+05:45	24	naam	2	[{"changed": {"fields": ["email_confirmed", "photo"]}}]	7	5
109	2017-05-18 17:03:42.955771+05:45	24	naam	2	[{"changed": {"fields": ["email_confirmed", "photo"]}}]	7	5
110	2017-05-18 17:05:11.006389+05:45	24	naam	2	[{"changed": {"fields": ["email_confirmed"]}}]	7	5
111	2017-05-18 17:07:12.615285+05:45	24	naam	2	[{"changed": {"fields": ["email_confirmed"]}}]	7	5
112	2017-05-18 17:08:01.415628+05:45	24	naam	2	[{"changed": {"fields": ["photo"]}}]	7	5
113	2017-05-18 17:09:58.272904+05:45	24	naam	2	[{"changed": {"fields": ["email_confirmed"]}}]	7	5
114	2017-05-18 20:06:27.508916+05:45	25	rrrrrrees	2	[{"changed": {"fields": ["email_confirmed", "photo"]}}]	7	5
115	2017-05-18 20:15:48.600681+05:45	25	rrrrrrees	2	[{"changed": {"fields": ["email_confirmed"]}}]	7	5
116	2017-05-18 20:16:51.3853+05:45	26	aasisssss	2	[{"changed": {"fields": ["email_confirmed", "photo"]}}]	7	5
117	2017-05-18 20:32:21.044872+05:45	26	aasisssss	2	[{"changed": {"fields": ["email_confirmed"]}}]	7	5
118	2017-05-18 20:39:25.393247+05:45	27	testyr	2	[{"changed": {"fields": ["email_confirmed"]}}]	7	5
119	2017-05-18 20:40:30.724093+05:45	27	testyr	2	[{"changed": {"fields": ["email_confirmed"]}}]	7	5
120	2017-05-18 20:50:02.178088+05:45	27	testyr	2	[{"changed": {"fields": ["email_confirmed"]}}]	7	5
121	2017-05-19 12:14:39.287637+05:45	10	sda	3		16	5
122	2017-05-19 12:14:39.388358+05:45	9	newtest	3		16	5
123	2017-05-19 12:14:39.399098+05:45	8	dfgfdgdf1111111111	3		16	5
124	2017-05-19 12:14:39.410146+05:45	7	dfgfdgdf1111111111	3		16	5
125	2017-05-19 12:14:39.421354+05:45	6	dfgfdgdf1111111111	3		16	5
126	2017-05-19 12:14:39.432321+05:45	5	dfgfdgdf1111111111	3		16	5
127	2017-05-19 12:14:39.443351+05:45	4	dsfs	3		16	5
128	2017-05-19 12:29:54.620795+05:45	11	testomp	1	[{"added": {}}]	16	5
129	2017-05-19 13:12:15.56493+05:45	6	aasis	3		3	5
130	2017-05-19 13:12:15.597962+05:45	43	aasis333	3		3	5
131	2017-05-19 13:12:15.608512+05:45	28	aasisssss	3		3	5
132	2017-05-19 13:12:15.619589+05:45	24	bigman	3		3	5
133	2017-05-19 13:12:15.630709+05:45	25	bigmans	3		3	5
134	2017-05-19 13:12:15.641817+05:45	30	finaltest11	3		3	5
135	2017-05-19 13:12:15.652881+05:45	31	finaltest112	3		3	5
136	2017-05-19 13:12:15.663987+05:45	32	finaltest1123	3		3	5
137	2017-05-19 13:12:15.675079+05:45	33	finaltest11234	3		3	5
138	2017-05-19 13:12:15.686133+05:45	34	finaltest112345	3		3	5
139	2017-05-19 13:12:15.696924+05:45	35	finaltest1123456	3		3	5
140	2017-05-19 13:12:15.708419+05:45	36	finaltest1123456789	3		3	5
141	2017-05-19 13:12:15.719502+05:45	37	finaltest11234567891	3		3	5
142	2017-05-19 13:12:15.730551+05:45	41	finaltest11erer23456000078tr91rtertretre444	3		3	5
143	2017-05-19 13:12:15.742937+05:45	42	finaltest11erer234560099990078tr91rtertretre444	3		3	5
144	2017-05-19 13:12:15.797616+05:45	38	finaltest11erer234567891	3		3	5
145	2017-05-19 13:12:15.808174+05:45	39	finaltest11erer2345678tr91	3		3	5
146	2017-05-19 13:12:15.819269+05:45	40	finaltest11erer2345678tr91rtertretre444	3		3	5
147	2017-05-19 13:12:15.830328+05:45	21	mahesh	3		3	5
148	2017-05-19 13:12:15.841533+05:45	22	mahesh1	3		3	5
149	2017-05-19 13:12:15.852506+05:45	26	naam	3		3	5
150	2017-05-19 13:12:15.863609+05:45	27	rrrrrrees	3		3	5
151	2017-05-19 13:12:15.874732+05:45	23	sdfsdf	3		3	5
152	2017-05-19 13:12:15.885857+05:45	29	testyr	3		3	5
153	2017-05-21 12:47:49.786024+05:45	1	new form	3		12	5
154	2017-05-21 12:48:51.332865+05:45	3	dgdfg	1	[{"added": {}}]	12	5
155	2017-05-21 12:49:16.339205+05:45	3	dgdfg	3		12	5
156	2017-05-21 12:52:30.449045+05:45	6	dfsd	1	[{"added": {}}]	12	5
157	2017-05-21 12:53:34.131617+05:45	6	dfsd	3		12	5
158	2017-05-21 12:57:21.77098+05:45	7	asdsa	1	[{"added": {}}]	12	5
159	2017-05-21 12:59:26.599775+05:45	7	asdsa	3		12	5
160	2017-05-21 13:02:02.183769+05:45	9	sdsad555555555d	1	[{"added": {}}]	12	5
161	2017-05-21 14:13:35.131839+05:45	9	sdsad555555555d	3		12	5
162	2017-05-21 14:15:33.927897+05:45	10	test	1	[{"added": {}}]	12	5
163	2017-05-21 14:16:17.160846+05:45	10	test	3		12	5
164	2017-05-21 15:30:15.020069+05:45	45	aashish1	2	[{"changed": {"fields": ["password"]}}]	3	5
165	2017-05-21 15:30:32.597979+05:45	45	aashish1	2	[]	3	5
166	2017-05-21 16:20:59.116014+05:45	4	office-manager	2	[]	4	5
167	2017-05-21 17:05:15.96161+05:45	21	sdsad	3		12	5
168	2017-05-21 17:05:15.987072+05:45	20	sdsad	3		12	5
169	2017-05-21 17:05:15.998256+05:45	19	sdsad	3		12	5
170	2017-05-21 17:05:16.009197+05:45	18	sdsad	3		12	5
171	2017-05-21 17:05:16.02037+05:45	17	sdsad	3		12	5
172	2017-05-21 17:05:16.031476+05:45	16	sdsad	3		12	5
173	2017-05-21 17:05:16.042704+05:45	15	sdsad	3		12	5
174	2017-05-21 17:05:16.053841+05:45	14	sdsad	3		12	5
175	2017-05-21 17:05:16.064959+05:45	13	sdsad	3		12	5
176	2017-05-21 17:05:16.075886+05:45	12	sdsad	3		12	5
177	2017-05-21 17:05:16.086938+05:45	11	sdsad	3		12	5
178	2017-05-21 17:06:05.063105+05:45	22	sdsad	3		12	5
179	2017-05-21 17:07:09.17737+05:45	23	sdsad	3		12	5
180	2017-05-21 17:08:35.127717+05:45	24	sdsad	3		12	5
181	2017-05-21 17:10:36.01506+05:45	25	sdsad	3		12	5
182	2017-05-22 11:09:52.324076+05:45	29	sada	3		12	5
183	2017-05-22 11:09:52.389788+05:45	28	sada	3		12	5
184	2017-05-22 11:09:52.400855+05:45	27	sada	3		12	5
185	2017-05-22 11:09:52.412026+05:45	26	sdsad	3		12	5
186	2017-05-22 11:20:10.018127+05:45	31	Currentacts object	3		19	5
187	2017-05-22 11:42:48.935294+05:45	32	sada	3		12	5
188	2017-05-22 11:42:48.962096+05:45	31	sada	3		12	5
189	2017-05-22 11:42:48.973113+05:45	30	sada	3		12	5
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supaadmin
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 189, true);


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
19	supa	currentacts
20	supa	allacts
21	supa	yearlyaim
22	supa	first
23	supa	second
24	supa	third
25	supa	form_status
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supaadmin
--

SELECT pg_catalog.setval('django_content_type_id_seq', 25, true);


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
39	supa	0018_profile_photo	2017-05-18 12:47:50.451217+05:45
40	supa	0019_remove_profile_photo_url	2017-05-18 15:48:36.782839+05:45
41	supa	0020_opmtype_district	2017-05-19 10:50:19.759664+05:45
42	supa	0021_auto_20170519_0629	2017-05-19 12:14:27.768862+05:45
43	supa	0022_profile_opmtype	2017-05-19 12:15:22.414436+05:45
44	supa	0023_auto_20170519_0700	2017-05-19 12:45:19.275243+05:45
45	supa	0024_auto_20170519_0726	2017-05-19 13:11:54.759815+05:45
46	supa	0025_auto_20170521_0706	2017-05-21 12:51:13.116908+05:45
47	supa	0026_allacts	2017-05-21 12:59:49.683339+05:45
48	supa	0027_first_second_third_yearlyaim	2017-05-21 14:02:17.087128+05:45
49	supa	0028_auto_20170522_0535	2017-05-22 11:21:03.043332+05:45
50	supa	0029_auto_20170522_0537	2017-05-22 11:22:22.300868+05:45
51	supa	0030_auto_20170522_0548	2017-05-22 11:33:09.571207+05:45
52	supa	0031_auto_20170522_0551	2017-05-22 11:36:24.944921+05:45
53	supa	0032_form_opmtype	2017-05-22 11:45:48.390499+05:45
54	supa	0033_auto_20170522_0601	2017-05-22 11:46:13.405644+05:45
55	supa	0033_auto_20170522_0606	2017-05-22 11:51:46.893375+05:45
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supaadmin
--

SELECT pg_catalog.setval('django_migrations_id_seq', 55, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: supaadmin
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
chn042fbd143deafd4e8918df21c2011	NGFkM2ZhOGE2M2FmNDFmMDFlYjU1MjA5YTQwNzQ3NWI2ZmI1ZDFmNzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA5NTNjNzZkMmE3MGQ3NTQxNWUzODNmNDlkYWIwNTlhZDgzYTkwZWEiLCJfYXV0aF91c2VyX2lkIjoiNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-05-29 10:59:41.787453+05:45
chn8c158eac53cd473dd458313f12be6	NGFkM2ZhOGE2M2FmNDFmMDFlYjU1MjA5YTQwNzQ3NWI2ZmI1ZDFmNzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA5NTNjNzZkMmE3MGQ3NTQxNWUzODNmNDlkYWIwNTlhZDgzYTkwZWEiLCJfYXV0aF91c2VyX2lkIjoiNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-05-29 20:52:31.522936+05:45
7odya9xsft6c0qwldf06fzdusaypc45v	M2Q4YjRiOTdmZjEyYTI4YjcwMWZjOTM0Nzk0ZmFhMzk3MGVjYjJhZjp7fQ==	2017-06-01 16:40:23.282315+05:45
9q31x49y7abqul7r0rjs2gmcfeexl5ht	M2Q4YjRiOTdmZjEyYTI4YjcwMWZjOTM0Nzk0ZmFhMzk3MGVjYjJhZjp7fQ==	2017-06-01 16:40:44.773025+05:45
tn7d3la5g9m2nf56j9qm5sn2z08peash	M2Q4YjRiOTdmZjEyYTI4YjcwMWZjOTM0Nzk0ZmFhMzk3MGVjYjJhZjp7fQ==	2017-06-01 16:58:22.321165+05:45
of5ob1870m9qjj3luyuxfrtsz22v4txv	M2Q4YjRiOTdmZjEyYTI4YjcwMWZjOTM0Nzk0ZmFhMzk3MGVjYjJhZjp7fQ==	2017-06-01 17:02:12.694013+05:45
yptsa4phhuix5hsmue5uwi3tk7zm481i	ODQwOGNhMGNlMGFiZWEyMTJiNGRhZWI5N2VjYjIyMjZmYjNjZjE0MTp7Il9hdXRoX3VzZXJfaGFzaCI6ImVlNWU0MmJmNjViNWZlNjBiZmFkY2VmNjQwYWFhNGZkNjE1MWI4NzciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0NSJ9	2017-06-05 13:15:54.31034+05:45
a2t8oi47yleh3yvww4508ep760nwtib3	M2Q4YjRiOTdmZjEyYTI4YjcwMWZjOTM0Nzk0ZmFhMzk3MGVjYjJhZjp7fQ==	2017-06-01 17:05:42.929071+05:45
s8r8alfe11bpxmvz3sfn5xarpifawaci	M2Q4YjRiOTdmZjEyYTI4YjcwMWZjOTM0Nzk0ZmFhMzk3MGVjYjJhZjp7fQ==	2017-06-01 20:03:24.937235+05:45
9qd4aqepoqphvtkgfmpa4yay1g0kdcez	M2Q4YjRiOTdmZjEyYTI4YjcwMWZjOTM0Nzk0ZmFhMzk3MGVjYjJhZjp7fQ==	2017-06-01 20:14:06.730367+05:45
fs9i6nbjnp0n418o8hy33unfy5hxqz4l	M2Q4YjRiOTdmZjEyYTI4YjcwMWZjOTM0Nzk0ZmFhMzk3MGVjYjJhZjp7fQ==	2017-06-01 20:38:31.185795+05:45
0ma14nqhdi3aryxkrzhs35du508v4bhd	M2Q4YjRiOTdmZjEyYTI4YjcwMWZjOTM0Nzk0ZmFhMzk3MGVjYjJhZjp7fQ==	2017-06-01 20:40:51.905951+05:45
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
-- Data for Name: supa_allacts; Type: TABLE DATA; Schema: public; Owner: supaadmin
--

COPY supa_allacts (id, parinam, bhar, laagat, form_id) FROM stdin;
25	sdf	dsf	dsf	36
\.


--
-- Name: supa_allacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supaadmin
--

SELECT pg_catalog.setval('supa_allacts_id_seq', 25, true);


--
-- Data for Name: supa_currentacts; Type: TABLE DATA; Schema: public; Owner: supaadmin
--

COPY supa_currentacts (id, parinam, bhar, laagat, form_id) FROM stdin;
33	dsf	dsf	dsf	36
\.


--
-- Name: supa_currentacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supaadmin
--

SELECT pg_catalog.setval('supa_currentacts_id_seq', 33, true);


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
-- Data for Name: supa_first; Type: TABLE DATA; Schema: public; Owner: supaadmin
--

COPY supa_first (id, parinam, bhar, budget, form_id, createdon, updatedon) FROM stdin;
24				36	2017-05-22	2017-05-22
\.


--
-- Name: supa_first_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supaadmin
--

SELECT pg_catalog.setval('supa_first_id_seq', 24, true);


--
-- Data for Name: supa_form; Type: TABLE DATA; Schema: public; Owner: supaadmin
--

COPY supa_form (id, name, ekai, karchasirsak, title, createdon, updatedon, "OPMtype_id") FROM stdin;
36	sada	daasd	sdsa	asdasd	2017-05-22	2017-05-22	11
\.


--
-- Name: supa_form_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supaadmin
--

SELECT pg_catalog.setval('supa_form_id_seq', 37, true);


--
-- Data for Name: supa_form_status; Type: TABLE DATA; Schema: public; Owner: supaadmin
--

COPY supa_form_status (id, v_status, "C_status", form_id) FROM stdin;
2	u	u	36
\.


--
-- Name: supa_form_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supaadmin
--

SELECT pg_catalog.setval('supa_form_status_id_seq', 2, true);


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
\.


--
-- Name: supa_municipality_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supaadmin
--

SELECT pg_catalog.setval('supa_municipality_id_seq', 1, true);


--
-- Data for Name: supa_office; Type: TABLE DATA; Schema: public; Owner: supaadmin
--

COPY supa_office (id, dev_acts, "OPMtype_id") FROM stdin;
\.


--
-- Name: supa_office_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supaadmin
--

SELECT pg_catalog.setval('supa_office_id_seq', 23, true);


--
-- Data for Name: supa_opmtype; Type: TABLE DATA; Schema: public; Owner: supaadmin
--

COPY supa_opmtype (id, name, category, address, email, phone, fax, yearly_budget, office_time, no_of_workers, vehicle, head_name, head_post, head_phone_no, head_assign_date, head_act_time, infoofficer_name, infoofficer_post, infoofficer_phone_no, infoofficer_assign_date, infoofficer_act_time, accountant_name, accountant_post, accountant_phone_no, accountant_assign_date, accountant_act_time, department_id, district) FROM stdin;
11	testomp	gd																								1	
12	dsfdsf	Project	dsfsd																							3	दर्चुला
\.


--
-- Name: supa_opmtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supaadmin
--

SELECT pg_catalog.setval('supa_opmtype_id_seq', 12, true);


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

COPY supa_profile (id, name, birth_date, user_id, email_confirmed, photo, "OPMtype_id", assign_date, phoneno) FROM stdin;
33	aashish	\N	44	t	index_cYDJm47.jpeg	11	\N	9812255
34	test	\N	45	t	index_2HgaDaf.jpeg	11	\N	test
2		\N	5	f		\N	\N	
\.


--
-- Name: supa_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supaadmin
--

SELECT pg_catalog.setval('supa_profile_id_seq', 34, true);


--
-- Data for Name: supa_project; Type: TABLE DATA; Schema: public; Owner: supaadmin
--

COPY supa_project (id, project_time, budget, objective, chief_eng, engineers, "OPMtype_id") FROM stdin;
5	asd	kjhkj				12
\.


--
-- Name: supa_project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supaadmin
--

SELECT pg_catalog.setval('supa_project_id_seq', 5, true);


--
-- Data for Name: supa_second; Type: TABLE DATA; Schema: public; Owner: supaadmin
--

COPY supa_second (id, parinam, bhar, budget, form_id, createdon, updatedon) FROM stdin;
24				36	2017-05-22	2017-05-22
\.


--
-- Name: supa_second_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supaadmin
--

SELECT pg_catalog.setval('supa_second_id_seq', 24, true);


--
-- Data for Name: supa_third; Type: TABLE DATA; Schema: public; Owner: supaadmin
--

COPY supa_third (id, parinam, bhar, budget, form_id, createdon, updatedon) FROM stdin;
24				36	2017-05-22	2017-05-22
\.


--
-- Name: supa_third_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supaadmin
--

SELECT pg_catalog.setval('supa_third_id_seq', 24, true);


--
-- Data for Name: supa_yearlyaim; Type: TABLE DATA; Schema: public; Owner: supaadmin
--

COPY supa_yearlyaim (id, parinam, bhar, budget, form_id, createdon, updatedon) FROM stdin;
24				36	2017-05-22	2017-05-22
\.


--
-- Name: supa_yearlyaim_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supaadmin
--

SELECT pg_catalog.setval('supa_yearlyaim_id_seq', 24, true);


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
-- Name: supa_allacts_form_id_key; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_allacts
    ADD CONSTRAINT supa_allacts_form_id_key UNIQUE (form_id);


--
-- Name: supa_allacts_pkey; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_allacts
    ADD CONSTRAINT supa_allacts_pkey PRIMARY KEY (id);


--
-- Name: supa_currentacts_form_id_key; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_currentacts
    ADD CONSTRAINT supa_currentacts_form_id_key UNIQUE (form_id);


--
-- Name: supa_currentacts_pkey; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_currentacts
    ADD CONSTRAINT supa_currentacts_pkey PRIMARY KEY (id);


--
-- Name: supa_department_pkey; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_department
    ADD CONSTRAINT supa_department_pkey PRIMARY KEY (id);


--
-- Name: supa_first_form_id_key; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_first
    ADD CONSTRAINT supa_first_form_id_key UNIQUE (form_id);


--
-- Name: supa_first_pkey; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_first
    ADD CONSTRAINT supa_first_pkey PRIMARY KEY (id);


--
-- Name: supa_form_pkey; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_form
    ADD CONSTRAINT supa_form_pkey PRIMARY KEY (id);


--
-- Name: supa_form_status_formid_id_key; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_form_status
    ADD CONSTRAINT supa_form_status_formid_id_key UNIQUE (form_id);


--
-- Name: supa_form_status_pkey; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_form_status
    ADD CONSTRAINT supa_form_status_pkey PRIMARY KEY (id);


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
-- Name: supa_second_form_id_key; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_second
    ADD CONSTRAINT supa_second_form_id_key UNIQUE (form_id);


--
-- Name: supa_second_pkey; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_second
    ADD CONSTRAINT supa_second_pkey PRIMARY KEY (id);


--
-- Name: supa_third_form_id_key; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_third
    ADD CONSTRAINT supa_third_form_id_key UNIQUE (form_id);


--
-- Name: supa_third_pkey; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_third
    ADD CONSTRAINT supa_third_pkey PRIMARY KEY (id);


--
-- Name: supa_yearlyaim_form_id_key; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_yearlyaim
    ADD CONSTRAINT supa_yearlyaim_form_id_key UNIQUE (form_id);


--
-- Name: supa_yearlyaim_pkey; Type: CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_yearlyaim
    ADD CONSTRAINT supa_yearlyaim_pkey PRIMARY KEY (id);


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
-- Name: supa_form_OPMtype_id_467fdb07; Type: INDEX; Schema: public; Owner: supaadmin
--

CREATE INDEX "supa_form_OPMtype_id_467fdb07" ON supa_form USING btree ("OPMtype_id");


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
-- Name: supa_profile_OPMtype_id_6a1390c8; Type: INDEX; Schema: public; Owner: supaadmin
--

CREATE INDEX "supa_profile_OPMtype_id_6a1390c8" ON supa_profile USING btree ("OPMtype_id");


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
-- Name: supa_allacts_form_id_ffa5d3cf_fk_supa_form_id; Type: FK CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_allacts
    ADD CONSTRAINT supa_allacts_form_id_ffa5d3cf_fk_supa_form_id FOREIGN KEY (form_id) REFERENCES supa_form(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: supa_currentacts_form_id_a5e6fce4_fk_supa_form_id; Type: FK CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_currentacts
    ADD CONSTRAINT supa_currentacts_form_id_a5e6fce4_fk_supa_form_id FOREIGN KEY (form_id) REFERENCES supa_form(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: supa_department_ministry_id_af75ae64_fk_supa_ministry_id; Type: FK CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_department
    ADD CONSTRAINT supa_department_ministry_id_af75ae64_fk_supa_ministry_id FOREIGN KEY (ministry_id) REFERENCES supa_ministry(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: supa_first_form_id_eab8af36_fk_supa_form_id; Type: FK CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_first
    ADD CONSTRAINT supa_first_form_id_eab8af36_fk_supa_form_id FOREIGN KEY (form_id) REFERENCES supa_form(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: supa_form_OPMtype_id_467fdb07_fk_supa_opmtype_id; Type: FK CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_form
    ADD CONSTRAINT "supa_form_OPMtype_id_467fdb07_fk_supa_opmtype_id" FOREIGN KEY ("OPMtype_id") REFERENCES supa_opmtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: supa_form_status_form_id_8da18001_fk_supa_form_id; Type: FK CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_form_status
    ADD CONSTRAINT supa_form_status_form_id_8da18001_fk_supa_form_id FOREIGN KEY (form_id) REFERENCES supa_form(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: supa_profile_OPMtype_id_6a1390c8_fk_supa_opmtype_id; Type: FK CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_profile
    ADD CONSTRAINT "supa_profile_OPMtype_id_6a1390c8_fk_supa_opmtype_id" FOREIGN KEY ("OPMtype_id") REFERENCES supa_opmtype(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: supa_second_form_id_5c5d69df_fk_supa_form_id; Type: FK CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_second
    ADD CONSTRAINT supa_second_form_id_5c5d69df_fk_supa_form_id FOREIGN KEY (form_id) REFERENCES supa_form(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: supa_third_form_id_a5b3af80_fk_supa_form_id; Type: FK CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_third
    ADD CONSTRAINT supa_third_form_id_a5b3af80_fk_supa_form_id FOREIGN KEY (form_id) REFERENCES supa_form(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: supa_yearlyaim_form_id_94e048c7_fk_supa_form_id; Type: FK CONSTRAINT; Schema: public; Owner: supaadmin
--

ALTER TABLE ONLY supa_yearlyaim
    ADD CONSTRAINT supa_yearlyaim_form_id_94e048c7_fk_supa_form_id FOREIGN KEY (form_id) REFERENCES supa_form(id) DEFERRABLE INITIALLY DEFERRED;


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

