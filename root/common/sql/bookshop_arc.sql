--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10
-- Dumped by pg_dump version 10.10

-- Started on 2020-05-23 13:35:38

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
-- TOC entry 196 (class 1259 OID 324880)
-- Name: book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book (
    book_name character varying(30) NOT NULL,
    price integer NOT NULL,
    discount integer NOT NULL,
    page_count integer,
    isbn13 character varying(14),
    on_sale_date date,
    id integer NOT NULL,
    publisher_id integer,
    category_id integer
);


ALTER TABLE public.book OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 335758)
-- Name: book_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.book_id_seq OWNER TO postgres;

--
-- TOC entry 2924 (class 0 OID 0)
-- Dependencies: 208
-- Name: book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.book_id_seq OWNED BY public.book.id;


--
-- TOC entry 197 (class 1259 OID 324883)
-- Name: business_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.business_type (
    business_type_name character varying(30) NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.business_type OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 335765)
-- Name: business_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.business_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.business_type_id_seq OWNER TO postgres;

--
-- TOC entry 2925 (class 0 OID 0)
-- Dependencies: 209
-- Name: business_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.business_type_id_seq OWNED BY public.business_type.id;


--
-- TOC entry 198 (class 1259 OID 324886)
-- Name: card_company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.card_company (
    card_company_id character varying(5) NOT NULL,
    card_company_name character varying(100) NOT NULL,
    prefecture character varying(30),
    id integer NOT NULL
);


ALTER TABLE public.card_company OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 335772)
-- Name: card_company_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.card_company_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.card_company_id_seq OWNER TO postgres;

--
-- TOC entry 2926 (class 0 OID 0)
-- Dependencies: 210
-- Name: card_company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.card_company_id_seq OWNED BY public.card_company.id;


--
-- TOC entry 199 (class 1259 OID 324889)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    category_name character varying(30) NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 335779)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO postgres;

--
-- TOC entry 2927 (class 0 OID 0)
-- Dependencies: 211
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- TOC entry 200 (class 1259 OID 324892)
-- Name: job_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_type (
    job_type_name character varying(30) NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.job_type OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 335786)
-- Name: job_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.job_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_type_id_seq OWNER TO postgres;

--
-- TOC entry 2928 (class 0 OID 0)
-- Dependencies: 212
-- Name: job_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.job_type_id_seq OWNED BY public.job_type.id;


--
-- TOC entry 201 (class 1259 OID 324895)
-- Name: member; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.member (
    password character varying(64) NOT NULL,
    last_name character varying(20) NOT NULL,
    first_name character varying(20) NOT NULL,
    post_code character varying(8),
    address character varying(200),
    birthday date,
    tel_no character varying(13),
    mail_address character varying(200) NOT NULL,
    regist_datetime timestamp without time zone NOT NULL,
    member_type character(1) NOT NULL,
    blood_type character varying(2),
    child_name1 character varying(20),
    child_name2 character varying(20),
    child_name3 character varying(20),
    id integer NOT NULL,
    business_type_id integer,
    job_type_id integer
);


ALTER TABLE public.member OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 324901)
-- Name: member_card; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.member_card (
    member_id character varying(8) NOT NULL,
    member_card_id integer NOT NULL,
    card_company_id character varying(5) NOT NULL,
    card_number character(19) NOT NULL,
    expire_year character varying(2) NOT NULL,
    expire_month character varying(2) NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.member_card OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 335803)
-- Name: member_card_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.member_card_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.member_card_id_seq OWNER TO postgres;

--
-- TOC entry 2929 (class 0 OID 0)
-- Dependencies: 214
-- Name: member_card_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.member_card_id_seq OWNED BY public.member_card.id;


--
-- TOC entry 213 (class 1259 OID 335793)
-- Name: member_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.member_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.member_id_seq OWNER TO postgres;

--
-- TOC entry 2930 (class 0 OID 0)
-- Dependencies: 213
-- Name: member_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.member_id_seq OWNED BY public.member.id;


--
-- TOC entry 203 (class 1259 OID 324904)
-- Name: order_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_detail (
    order_detail_no integer NOT NULL,
    item_num integer NOT NULL,
    id integer NOT NULL,
    item_id integer,
    order_header_id integer
);


ALTER TABLE public.order_detail OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 335810)
-- Name: order_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_detail_id_seq OWNER TO postgres;

--
-- TOC entry 2931 (class 0 OID 0)
-- Dependencies: 215
-- Name: order_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_detail_id_seq OWNED BY public.order_detail.id;


--
-- TOC entry 204 (class 1259 OID 324907)
-- Name: order_header; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_header (
    order_datetime timestamp without time zone NOT NULL,
    payment_type character(2) NOT NULL,
    member_card_id integer,
    id integer NOT NULL,
    member_id integer
);


ALTER TABLE public.order_header OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 335818)
-- Name: order_header_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_header_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_header_id_seq OWNER TO postgres;

--
-- TOC entry 2932 (class 0 OID 0)
-- Dependencies: 216
-- Name: order_header_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_header_id_seq OWNED BY public.order_header.id;


--
-- TOC entry 205 (class 1259 OID 324910)
-- Name: publisher; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.publisher (
    publisher_name character varying(30) NOT NULL,
    prefecture character varying(20) NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.publisher OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 335825)
-- Name: publisher_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.publisher_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publisher_id_seq OWNER TO postgres;

--
-- TOC entry 2933 (class 0 OID 0)
-- Dependencies: 217
-- Name: publisher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.publisher_id_seq OWNED BY public.publisher.id;


--
-- TOC entry 206 (class 1259 OID 324913)
-- Name: questionnaire; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.questionnaire (
    questionnaire_id character varying(3) NOT NULL,
    q_text1 character varying(50),
    q_text2 character varying(50),
    q_text3 character varying(50),
    id integer NOT NULL
);


ALTER TABLE public.questionnaire OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 324916)
-- Name: questionnaire_answer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.questionnaire_answer (
    member_id character varying(8) NOT NULL,
    questionnaire_id character varying(3) NOT NULL,
    answer1 character varying(50),
    answer2 character varying(50),
    answer3 character varying(50),
    id integer NOT NULL
);


ALTER TABLE public.questionnaire_answer OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 335839)
-- Name: questionnaire_answer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.questionnaire_answer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questionnaire_answer_id_seq OWNER TO postgres;

--
-- TOC entry 2934 (class 0 OID 0)
-- Dependencies: 219
-- Name: questionnaire_answer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.questionnaire_answer_id_seq OWNED BY public.questionnaire_answer.id;


--
-- TOC entry 218 (class 1259 OID 335832)
-- Name: questionnaire_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.questionnaire_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questionnaire_id_seq OWNER TO postgres;

--
-- TOC entry 2935 (class 0 OID 0)
-- Dependencies: 218
-- Name: questionnaire_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.questionnaire_id_seq OWNED BY public.questionnaire.id;


--
-- TOC entry 2737 (class 2604 OID 335760)
-- Name: book id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book ALTER COLUMN id SET DEFAULT nextval('public.book_id_seq'::regclass);


--
-- TOC entry 2738 (class 2604 OID 335767)
-- Name: business_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.business_type ALTER COLUMN id SET DEFAULT nextval('public.business_type_id_seq'::regclass);


--
-- TOC entry 2739 (class 2604 OID 335774)
-- Name: card_company id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_company ALTER COLUMN id SET DEFAULT nextval('public.card_company_id_seq'::regclass);


--
-- TOC entry 2740 (class 2604 OID 335781)
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 2741 (class 2604 OID 335788)
-- Name: job_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_type ALTER COLUMN id SET DEFAULT nextval('public.job_type_id_seq'::regclass);


--
-- TOC entry 2742 (class 2604 OID 335795)
-- Name: member id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member ALTER COLUMN id SET DEFAULT nextval('public.member_id_seq'::regclass);


--
-- TOC entry 2743 (class 2604 OID 335805)
-- Name: member_card id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member_card ALTER COLUMN id SET DEFAULT nextval('public.member_card_id_seq'::regclass);


--
-- TOC entry 2744 (class 2604 OID 335812)
-- Name: order_detail id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_detail ALTER COLUMN id SET DEFAULT nextval('public.order_detail_id_seq'::regclass);


--
-- TOC entry 2745 (class 2604 OID 335820)
-- Name: order_header id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_header ALTER COLUMN id SET DEFAULT nextval('public.order_header_id_seq'::regclass);


--
-- TOC entry 2746 (class 2604 OID 335827)
-- Name: publisher id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publisher ALTER COLUMN id SET DEFAULT nextval('public.publisher_id_seq'::regclass);


--
-- TOC entry 2747 (class 2604 OID 335834)
-- Name: questionnaire id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire ALTER COLUMN id SET DEFAULT nextval('public.questionnaire_id_seq'::regclass);


--
-- TOC entry 2748 (class 2604 OID 335841)
-- Name: questionnaire_answer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire_answer ALTER COLUMN id SET DEFAULT nextval('public.questionnaire_answer_id_seq'::regclass);


--
-- TOC entry 2894 (class 0 OID 324880)
-- Dependencies: 196
-- Data for Name: book; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('達人開発者', 3990, 390, 333, '978-4894712740', '2000-11-01', 1, 1, 5);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('Effective Ruby 第2版', 3780, 100, 327, '978-4894714990', '2008-03-31', 2, 1, 5);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('真珠のプログラミング', 3570, 120, 305, '978-4894712360', '2000-10-01', 3, 1, 5);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('満月の神話 新装版', 3360, 130, 328, '978-4864010050', '2010-12-01', 4, 1, 5);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('UNIXネットワークプログラム', 8400, 1200, 978, '978-4894712050', '1999-07-01', 5, 1, 5);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('永遠の1', 920, 90, 210, '978-4894712830', '2010-02-01', 6, 2, 1);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('生物と生物のあいだ', 777, 77, 251, '978-4894713820', '2011-08-15', 7, 2, 1);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('世紀末の隣人', 580, 60, 304, '978-4894717280', '2007-03-01', 8, 2, 3);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('アインシュタイン16歳の現実', 819, 119, 194, '978-4894712320', '2007-04-01', 9, 4, 3);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('エジソン', 945, 105, 210, NULL, '1998-02-01', 10, 4, 3);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('愉快な現実', 798, 100, 240, '978-4894018290', '2009-08-01', 11, NULL, 2);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('沖縄の密約', 756, 76, 328, '978-4894718820', '2002-04-01', 12, NULL, 2);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('33歳のハローワーク', 600, 120, 241, '978-4894012120', '2007-04-01', 13, NULL, 3);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('冬のコナリ', 945, 105, 326, '978-4894716210', '2010-01-10', 14, NULL, 3);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('ギャンブルにはビジネスの悪知恵が詰まっている', 880, 40, 359, '978-4894714920', '2003-10-01', 15, 2, NULL);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('ウィン 勝利の経営', 2100, 495, 239, '978-4894716320', '2000-04-01', 16, 3, NULL);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('経営戦略を問い正す', 798, 100, 329, '978-4894717780', '2010-06-01', 17, 3, NULL);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('お客様は「えこひいき」しよう !', 1470, 200, 211, NULL, '2010-05-01', 18, 3, NULL);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('80歳を超えても30代に見える生き方', 920, 80, NULL, NULL, '2003-03-04', 19, 2, 1);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('西日本中枢の崩壊', 1680, 230, NULL, NULL, '2010-05-15', 20, NULL, 2);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('アインシュタイン', 945, 105, 221, NULL, '1998-02-01', 21, 4, 3);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('昨日の晩ごはん', 1679, 50, 334, '978-4771278502', '2011-10-31', 22, 2, 1);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('一日一膳', 1680, 120, 357, '978-4003512784', '2010-09-15', 23, 1, 3);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('これからの世界', 580, 40, 199, '978-4063542780', '2005-02-01', 24, 6, 2);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('グローバルのススメ', 450, 70, 200, '978-4403562786', '2009-03-07', 25, 3, 4);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('日本の夜明け', 1999, 199, 613, '978-4663512931', '2007-06-22', 26, 2, 2);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('頑張ればJava', 2000, 200, 587, '978-4945413308', '2012-12-29', 27, 5, 5);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('明けの明星', 999, 150, 319, '978-4733522781', '2008-02-20', 28, 1, 1);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('より良い老後とは', 1200, 200, 320, '978-4053520983', '2006-04-11', 29, 4, 3);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('いつだってUML', 750, 30, 299, '978-4669483725', '2013-08-20', 30, 2, 5);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('からだのしくみ', 1000, 200, 300, '978-4403549037', '2011-10-16', 31, 3, 3);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('楽しいプログラミング', 799, 80, 180, '978-4351182793', '2007-03-31', 32, 6, 5);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('メビウスの輪を超えて', 800, 80, 250, '978-4933512694', '2007-03-31', 33, 1, 4);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('深海のシーラカンス', 799, 90, 333, '978-4353577795', '2007-04-01', 34, 2, 1);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('裏金', 800, 70, 280, '978-4123512345', '2007-04-01', 35, 4, 2);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('かしこい消費税', 799, 120, 368, '978-4354262780', '2008-03-31', 36, 2, 4);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('恋のサブリミナル', 800, 150, 399, '978-4983779811', '2008-03-31', 37, 5, 1);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('亭主関白と政治', 799, 99, 276, '978-4669977883', '2008-04-01', 38, 3, 4);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('バスケがしたいです', 800, 130, 177, '978-4567890123', '2008-04-01', 39, 6, 3);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('雨雲', 1580, 100, 299, '978-4987654321', '2010-09-23', 40, 1, 1);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('週末のオブジェクト指向クラブ', 2500, 100, 300, '978-4102938475', '2009-09-01', 41, 3, 5);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('ダークサイドジャパン', 1800, 101, 299, '978-4675849392', '2013-03-03', 42, 2, 2);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('一子相伝の極み', 689, 101, 300, '978-4135790864', '2010-07-02', 43, 5, 3);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('ドブ臭くたって', 799, 99, 222, '978-4096521347', '2011-01-13', 44, 2, 4);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('永遠の向こう側', 800, 130, 235, '978-4291038476', '2009-05-05', 45, 2, 1);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('みんなでクラウド', 2999, 499, 405, '978-4852146097', '2006-08-24', 46, 4, 5);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('献金！献金！また献金！', 3000, 300, 455, '978-4112233445', '2009-01-19', 47, 3, 2);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('秘伝のタレ 新版', 3999, 199, 555, '978-4098760982', '2002-02-22', 48, 3, 3);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('親父からのビジネス', 4000, 200, 777, '978-4304958671', '2012-08-19', 49, 6, 4);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('思い出のHTML', 1690, 90, 249, '978-4765921092', '2008-08-07', 50, 1, 5);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('止まらない世界', 4100, 350, 250, '978-4238764901', '2010-10-10', 51, 4, 3);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('ららら', 2000, 200, 299, '978-4983740208', '2009-09-15', 52, 2, 1);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('誰よりもおいしく', 560, 60, 300, '978-4765792015', '2009-09-15', 53, 1, 2);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('100年後', 777, 37, 299, '978-4302757920', '2010-09-15', 54, 5, 2);
INSERT INTO public.book (book_name, price, discount, page_count, isbn13, on_sale_date, id, publisher_id, category_id) VALUES ('湯けむりの嗜み', 999, 49, 300, '978-4769802134', '2010-09-15', 55, 1, 1);


--
-- TOC entry 2895 (class 0 OID 324883)
-- Dependencies: 197
-- Data for Name: business_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.business_type (business_type_name, id) VALUES ('コンピュータ関連', 1);
INSERT INTO public.business_type (business_type_name, id) VALUES ('電気機器関連', 2);
INSERT INTO public.business_type (business_type_name, id) VALUES ('金融・証券・保険', 3);
INSERT INTO public.business_type (business_type_name, id) VALUES ('建設・不動産', 4);
INSERT INTO public.business_type (business_type_name, id) VALUES ('マスコミ', 5);
INSERT INTO public.business_type (business_type_name, id) VALUES ('出版', 6);
INSERT INTO public.business_type (business_type_name, id) VALUES ('会計・税理', 7);
INSERT INTO public.business_type (business_type_name, id) VALUES ('公務員・官公庁', 8);
INSERT INTO public.business_type (business_type_name, id) VALUES ('教員', 9);
INSERT INTO public.business_type (business_type_name, id) VALUES ('病院', 10);
INSERT INTO public.business_type (business_type_name, id) VALUES ('学生', 11);
INSERT INTO public.business_type (business_type_name, id) VALUES ('製造業', 12);
INSERT INTO public.business_type (business_type_name, id) VALUES ('小売業', 13);
INSERT INTO public.business_type (business_type_name, id) VALUES ('サービス業', 14);


--
-- TOC entry 2896 (class 0 OID 324886)
-- Dependencies: 198
-- Data for Name: card_company; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.card_company (card_company_id, card_company_name, prefecture, id) VALUES ('AMEX', 'アメリカンエックス', '東京都', 1);
INSERT INTO public.card_company (card_company_id, card_company_name, prefecture, id) VALUES ('RKTN', 'ラクトン', '宮城県', 2);
INSERT INTO public.card_company (card_company_id, card_company_name, prefecture, id) VALUES ('SASN', 'セゾナ', '千葉県', 3);
INSERT INTO public.card_company (card_company_id, card_company_name, prefecture, id) VALUES ('VISE', 'ビゼ', '神奈川県', 4);


--
-- TOC entry 2897 (class 0 OID 324889)
-- Dependencies: 199
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category (category_name, id) VALUES ('新書・文庫', 1);
INSERT INTO public.category (category_name, id) VALUES ('政治', 2);
INSERT INTO public.category (category_name, id) VALUES ('ノンフィクション', 3);
INSERT INTO public.category (category_name, id) VALUES ('ビジネス', 4);
INSERT INTO public.category (category_name, id) VALUES ('コンピュータ', 5);


--
-- TOC entry 2898 (class 0 OID 324892)
-- Dependencies: 200
-- Data for Name: job_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.job_type (job_type_name, id) VALUES ('営業', 1);
INSERT INTO public.job_type (job_type_name, id) VALUES ('管理', 2);
INSERT INTO public.job_type (job_type_name, id) VALUES ('技術', 3);
INSERT INTO public.job_type (job_type_name, id) VALUES ('生産・製造', 4);
INSERT INTO public.job_type (job_type_name, id) VALUES ('企画', 5);
INSERT INTO public.job_type (job_type_name, id) VALUES ('開発', 6);
INSERT INTO public.job_type (job_type_name, id) VALUES ('広報・宣伝', 7);
INSERT INTO public.job_type (job_type_name, id) VALUES ('総務・人事', 8);
INSERT INTO public.job_type (job_type_name, id) VALUES ('経営', 9);
INSERT INTO public.job_type (job_type_name, id) VALUES ('研究・教員', 10);
INSERT INTO public.job_type (job_type_name, id) VALUES ('事務', 11);


--
-- TOC entry 2899 (class 0 OID 324895)
-- Dependencies: 201
-- Data for Name: member; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.member (password, last_name, first_name, post_code, address, birthday, tel_no, mail_address, regist_datetime, member_type, blood_type, child_name1, child_name2, child_name3, id, business_type_id, job_type_id) VALUES ('123', '佐藤', '勝', '189-0013', '東京都東村山市栄町9-22-2-101', '1979-09-20', '00-0423-5389', 'masa1979@googie.col', '2011-09-19 08:51:22', '1', 'AB', NULL, NULL, NULL, 1, 3, 4);
INSERT INTO public.member (password, last_name, first_name, post_code, address, birthday, tel_no, mail_address, regist_datetime, member_type, blood_type, child_name1, child_name2, child_name3, id, business_type_id, job_type_id) VALUES ('9981', '南', '有香', '899-2433', '鹿児島県日置市東市来町宮田2-13-9901', '1992-05-30', '00-0857-5528', 'kagoshimayuka@pretty.nk', '2010-01-04 11:28:48', '1', 'AB', NULL, NULL, NULL, 2, 9, 10);
INSERT INTO public.member (password, last_name, first_name, post_code, address, birthday, tel_no, mail_address, regist_datetime, member_type, blood_type, child_name1, child_name2, child_name3, id, business_type_id, job_type_id) VALUES ('yamanaka999', '山中', '博', '245-0007', '神奈川県横浜市泉区桂坂4-28-49', '1993-05-10', '00-0857-7754', 'edonogu@pretty.nk', '2012-01-04 09:32:41', '1', 'A', NULL, NULL, NULL, 3, 13, 5);
INSERT INTO public.member (password, last_name, first_name, post_code, address, birthday, tel_no, mail_address, regist_datetime, member_type, blood_type, child_name1, child_name2, child_name3, id, business_type_id, job_type_id) VALUES ('0007', '平井', '美和子', NULL, NULL, '1992-12-21', '00-0842-4882', 'hirai@kingkazu.nk', '2011-07-10 06:11:00', '0', 'O', NULL, NULL, NULL, 4, 7, 8);
INSERT INTO public.member (password, last_name, first_name, post_code, address, birthday, tel_no, mail_address, regist_datetime, member_type, blood_type, child_name1, child_name2, child_name3, id, business_type_id, job_type_id) VALUES ('morimori', '森山', '一郎', NULL, NULL, '1992-03-28', '00-0884-8592', 'kameokaichiro@boy.nk', '2010-12-31 09:46:42', '1', NULL, NULL, NULL, NULL, 5, 11, 3);
INSERT INTO public.member (password, last_name, first_name, post_code, address, birthday, tel_no, mail_address, regist_datetime, member_type, blood_type, child_name1, child_name2, child_name3, id, business_type_id, job_type_id) VALUES ('uchiuchi', '内田', '聡子', NULL, NULL, '2000-03-28', NULL, 'suchida@foobaa.col', '2011-08-21 19:09:53', '0', NULL, NULL, NULL, NULL, 6, 5, 6);
INSERT INTO public.member (password, last_name, first_name, post_code, address, birthday, tel_no, mail_address, regist_datetime, member_type, blood_type, child_name1, child_name2, child_name3, id, business_type_id, job_type_id) VALUES ('supersato', '佐藤', '圭子', '731-5108', '広島県広島市佐伯区石内南1-8', '1993-05-09', '00-0447-9748', 'keikei@pretty.nk', '2010-09-09 08:18:22', '0', 'A', NULL, NULL, NULL, 7, NULL, 2);
INSERT INTO public.member (password, last_name, first_name, post_code, address, birthday, tel_no, mail_address, regist_datetime, member_type, blood_type, child_name1, child_name2, child_name3, id, business_type_id, job_type_id) VALUES ('0001', '山田', '太郎', '401-0013', '山梨県大月市大月3-9-82', '1970-01-08', '00-0284-2489', 't-yamada@bamboo.col', '2010-05-19 11:30:02', '0', 'B', '尚子', NULL, NULL, 8, 1, 2);
INSERT INTO public.member (password, last_name, first_name, post_code, address, birthday, tel_no, mail_address, regist_datetime, member_type, blood_type, child_name1, child_name2, child_name3, id, business_type_id, job_type_id) VALUES ('abcdef', '田中', '裕子', '409-0142', '山梨県北都留郡小菅村小菅村9881', '1981-02-14', '00-0832-9382', 'yuko.tanaka@yamee.col', '2010-04-20 19:32:49', '1', 'O', '雅人', '宏美', NULL, 9, 2, 3);
INSERT INTO public.member (password, last_name, first_name, post_code, address, birthday, tel_no, mail_address, regist_datetime, member_type, blood_type, child_name1, child_name2, child_name3, id, business_type_id, job_type_id) VALUES ('aaaa', '斉藤', '武', '189-0024', '東京都東村山市富士見町1-8', '1988-05-09', '00-0248-2953', 'taketake@yamee.col', '2010-11-20 21:30:31', '1', 'O', '徹', '幸子', '勝', 10, NULL, NULL);
INSERT INTO public.member (password, last_name, first_name, post_code, address, birthday, tel_no, mail_address, regist_datetime, member_type, blood_type, child_name1, child_name2, child_name3, id, business_type_id, job_type_id) VALUES ('naitou', '内藤', '明仁', '192-0902', '東京都八王子市上野町2-8-91', '1988-08-20', '00-0288-4524', 'naito.akihito@yaloo.col', '2010-09-20 08:10:21', '1', 'A', '一郎', '次郎', '三郎', 11, 6, 7);
INSERT INTO public.member (password, last_name, first_name, post_code, address, birthday, tel_no, mail_address, regist_datetime, member_type, blood_type, child_name1, child_name2, child_name3, id, business_type_id, job_type_id) VALUES ('haruki001', '東山', '春樹', '461-0026', '愛知県名古屋市東区赤塚町', '1983-11-20', '00-0445-4224', 'h-a-r-u-k-i@googie.col', '2011-03-05 13:10:08', '1', 'B', '正臣', NULL, NULL, 12, 8, NULL);
INSERT INTO public.member (password, last_name, first_name, post_code, address, birthday, tel_no, mail_address, regist_datetime, member_type, blood_type, child_name1, child_name2, child_name3, id, business_type_id, job_type_id) VALUES ('moriichi', '田中', '一郎', NULL, NULL, '1992-03-22', '00-0884-5732', 'tanaichi@hoge.nk', '2011-12-31 08:11:54', '1', NULL, '悟', NULL, NULL, 13, 11, 3);
INSERT INTO public.member (password, last_name, first_name, post_code, address, birthday, tel_no, mail_address, regist_datetime, member_type, blood_type, child_name1, child_name2, child_name3, id, business_type_id, job_type_id) VALUES ('nogutan', '野口', '栄次', '650-0033', '兵庫県神戸市中央区江戸町2-11-42-192', '1993-05-09', '00-0857-7753', 'edonogu@pretty.nk', '2010-05-09 08:22:58', '1', 'O', '由利', NULL, NULL, 14, 12, 4);


--
-- TOC entry 2900 (class 0 OID 324901)
-- Dependencies: 202
-- Data for Name: member_card; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.member_card (member_id, member_card_id, card_company_id, card_number, expire_year, expire_month, id) VALUES ('M001', 1, 'SASN', '1111-1111-1111-1111', '15', '01', 1);
INSERT INTO public.member_card (member_id, member_card_id, card_company_id, card_number, expire_year, expire_month, id) VALUES ('M002', 1, 'RKTN', '2222-2222-2222-2222', '13', '05', 2);
INSERT INTO public.member_card (member_id, member_card_id, card_company_id, card_number, expire_year, expire_month, id) VALUES ('M003', 1, 'VISE', '3333-3333-3333-3333', '11', '04', 3);
INSERT INTO public.member_card (member_id, member_card_id, card_company_id, card_number, expire_year, expire_month, id) VALUES ('M005', 1, 'SASN', '5555-5555-5555-5555', '12', '08', 4);
INSERT INTO public.member_card (member_id, member_card_id, card_company_id, card_number, expire_year, expire_month, id) VALUES ('M005', 2, 'RKTN', '5555-5555-5555-5556', '14', '12', 5);
INSERT INTO public.member_card (member_id, member_card_id, card_company_id, card_number, expire_year, expire_month, id) VALUES ('M006', 1, 'VISE', '6666-6666-6666-6666', '15', '08', 6);
INSERT INTO public.member_card (member_id, member_card_id, card_company_id, card_number, expire_year, expire_month, id) VALUES ('M006', 2, 'AMEX', '6666-6666-6666-6667', '13', '10', 7);
INSERT INTO public.member_card (member_id, member_card_id, card_company_id, card_number, expire_year, expire_month, id) VALUES ('M007', 1, 'RKTN', '7777-7777-7777-7777', '16', '11', 8);
INSERT INTO public.member_card (member_id, member_card_id, card_company_id, card_number, expire_year, expire_month, id) VALUES ('M007', 2, 'AMEX', '7777-7777-7777-7778', '14', '08', 9);
INSERT INTO public.member_card (member_id, member_card_id, card_company_id, card_number, expire_year, expire_month, id) VALUES ('M009', 1, 'SASN', '9999-9999-9999-9999', '11', '09', 10);
INSERT INTO public.member_card (member_id, member_card_id, card_company_id, card_number, expire_year, expire_month, id) VALUES ('M009', 2, 'AMEX', '9999-9999-9999-9998', '12', '04', 11);
INSERT INTO public.member_card (member_id, member_card_id, card_company_id, card_number, expire_year, expire_month, id) VALUES ('M010', 1, 'RKTN', '0000-0000-0000-0000', '15', '02', 12);
INSERT INTO public.member_card (member_id, member_card_id, card_company_id, card_number, expire_year, expire_month, id) VALUES ('M010', 2, 'VISE', '0000-0000-0000-0001', '14', '04', 13);
INSERT INTO public.member_card (member_id, member_card_id, card_company_id, card_number, expire_year, expire_month, id) VALUES ('M010', 3, 'AMEX', '0000-0000-0000-0002', '12', '09', 14);
INSERT INTO public.member_card (member_id, member_card_id, card_company_id, card_number, expire_year, expire_month, id) VALUES ('M011', 1, 'SASN', '0000-1111-0000-0000', '12', '07', 15);
INSERT INTO public.member_card (member_id, member_card_id, card_company_id, card_number, expire_year, expire_month, id) VALUES ('M012', 1, 'SASN', '0000-2222-0000-0001', '13', '04', 16);
INSERT INTO public.member_card (member_id, member_card_id, card_company_id, card_number, expire_year, expire_month, id) VALUES ('M013', 1, 'SASN', '0000-3333-0000-0000', '14', '05', 17);
INSERT INTO public.member_card (member_id, member_card_id, card_company_id, card_number, expire_year, expire_month, id) VALUES ('M013', 2, 'VISE', '0000-3333-0000-0001', '15', '02', 18);
INSERT INTO public.member_card (member_id, member_card_id, card_company_id, card_number, expire_year, expire_month, id) VALUES ('M013', 3, 'AMEX', '0000-3333-0000-0002', '14', '03', 19);
INSERT INTO public.member_card (member_id, member_card_id, card_company_id, card_number, expire_year, expire_month, id) VALUES ('M002', 2, 'VISE', '1111-0000-1111-3333', '13', '12', 20);
INSERT INTO public.member_card (member_id, member_card_id, card_company_id, card_number, expire_year, expire_month, id) VALUES ('M003', 2, 'AMEX', '7777-0000-3333-2222', '12', '02', 21);
INSERT INTO public.member_card (member_id, member_card_id, card_company_id, card_number, expire_year, expire_month, id) VALUES ('M007', 3, 'VISE', '1234-5678-9012-3456', '14', '07', 22);
INSERT INTO public.member_card (member_id, member_card_id, card_company_id, card_number, expire_year, expire_month, id) VALUES ('M010', 4, 'SASN', '9876-5432-1098-7654', '12', '05', 23);
INSERT INTO public.member_card (member_id, member_card_id, card_company_id, card_number, expire_year, expire_month, id) VALUES ('M013', 4, 'RKTN', '1029-3847-5610-2938', '14', '10', 24);


--
-- TOC entry 2901 (class 0 OID 324904)
-- Dependencies: 203
-- Data for Name: order_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.order_detail (order_detail_no, item_num, id, item_id, order_header_id) VALUES (1, 1, 1, 1, 2);
INSERT INTO public.order_detail (order_detail_no, item_num, id, item_id, order_header_id) VALUES (1, 1, 2, 1, 12);
INSERT INTO public.order_detail (order_detail_no, item_num, id, item_id, order_header_id) VALUES (1, 1, 3, 2, 1);
INSERT INTO public.order_detail (order_detail_no, item_num, id, item_id, order_header_id) VALUES (1, 1, 4, 3, 3);
INSERT INTO public.order_detail (order_detail_no, item_num, id, item_id, order_header_id) VALUES (1, 1, 5, 5, 4);
INSERT INTO public.order_detail (order_detail_no, item_num, id, item_id, order_header_id) VALUES (1, 1, 6, 19, 5);
INSERT INTO public.order_detail (order_detail_no, item_num, id, item_id, order_header_id) VALUES (1, 1, 7, 6, 6);
INSERT INTO public.order_detail (order_detail_no, item_num, id, item_id, order_header_id) VALUES (1, 1, 8, 8, 8);
INSERT INTO public.order_detail (order_detail_no, item_num, id, item_id, order_header_id) VALUES (1, 1, 9, 15, 9);
INSERT INTO public.order_detail (order_detail_no, item_num, id, item_id, order_header_id) VALUES (1, 1, 10, 11, 10);
INSERT INTO public.order_detail (order_detail_no, item_num, id, item_id, order_header_id) VALUES (1, 1, 11, 20, 11);
INSERT INTO public.order_detail (order_detail_no, item_num, id, item_id, order_header_id) VALUES (1, 1, 12, 13, 14);
INSERT INTO public.order_detail (order_detail_no, item_num, id, item_id, order_header_id) VALUES (1, 1, 13, 9, 15);
INSERT INTO public.order_detail (order_detail_no, item_num, id, item_id, order_header_id) VALUES (1, 1, 14, 10, 16);
INSERT INTO public.order_detail (order_detail_no, item_num, id, item_id, order_header_id) VALUES (1, 1, 15, 14, 17);
INSERT INTO public.order_detail (order_detail_no, item_num, id, item_id, order_header_id) VALUES (1, 1, 16, 16, 18);
INSERT INTO public.order_detail (order_detail_no, item_num, id, item_id, order_header_id) VALUES (1, 1, 17, 18, 19);
INSERT INTO public.order_detail (order_detail_no, item_num, id, item_id, order_header_id) VALUES (1, 1, 18, 17, 20);
INSERT INTO public.order_detail (order_detail_no, item_num, id, item_id, order_header_id) VALUES (1, 1, 19, 2, 22);
INSERT INTO public.order_detail (order_detail_no, item_num, id, item_id, order_header_id) VALUES (1, 1, 20, 3, 23);
INSERT INTO public.order_detail (order_detail_no, item_num, id, item_id, order_header_id) VALUES (1, 1, 21, 4, 24);
INSERT INTO public.order_detail (order_detail_no, item_num, id, item_id, order_header_id) VALUES (1, 1, 22, 5, 25);
INSERT INTO public.order_detail (order_detail_no, item_num, id, item_id, order_header_id) VALUES (1, 1, 23, 6, 26);
INSERT INTO public.order_detail (order_detail_no, item_num, id, item_id, order_header_id) VALUES (2, 1, 24, 5, 1);
INSERT INTO public.order_detail (order_detail_no, item_num, id, item_id, order_header_id) VALUES (2, 1, 25, 11, 13);
INSERT INTO public.order_detail (order_detail_no, item_num, id, item_id, order_header_id) VALUES (2, 1, 26, 3, 17);
INSERT INTO public.order_detail (order_detail_no, item_num, id, item_id, order_header_id) VALUES (2, 1, 27, 18, 14);
INSERT INTO public.order_detail (order_detail_no, item_num, id, item_id, order_header_id) VALUES (2, 2, 28, 2, 25);
INSERT INTO public.order_detail (order_detail_no, item_num, id, item_id, order_header_id) VALUES (1, 6, 29, 7, 7);
INSERT INTO public.order_detail (order_detail_no, item_num, id, item_id, order_header_id) VALUES (1, 3, 30, 12, 13);
INSERT INTO public.order_detail (order_detail_no, item_num, id, item_id, order_header_id) VALUES (1, 3, 31, 1, 21);


--
-- TOC entry 2902 (class 0 OID 324907)
-- Dependencies: 204
-- Data for Name: order_header; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.order_header (order_datetime, payment_type, member_card_id, id, member_id) VALUES ('2010-01-06 07:24:32', 'CC', 2, 1, 2);
INSERT INTO public.order_header (order_datetime, payment_type, member_card_id, id, member_id) VALUES ('2010-05-09 18:24:58', 'DV', NULL, 2, 14);
INSERT INTO public.order_header (order_datetime, payment_type, member_card_id, id, member_id) VALUES ('2010-06-11 11:22:32', 'CC', 1, 3, 9);
INSERT INTO public.order_header (order_datetime, payment_type, member_card_id, id, member_id) VALUES ('2010-06-18 12:21:12', 'CC', 1, 4, 8);
INSERT INTO public.order_header (order_datetime, payment_type, member_card_id, id, member_id) VALUES ('2010-09-09 17:52:23', 'CC', 1, 5, 7);
INSERT INTO public.order_header (order_datetime, payment_type, member_card_id, id, member_id) VALUES ('2010-09-21 08:32:00', 'CC', 1, 6, 11);
INSERT INTO public.order_header (order_datetime, payment_type, member_card_id, id, member_id) VALUES ('2010-11-20 23:49:12', 'DV', NULL, 7, 10);
INSERT INTO public.order_header (order_datetime, payment_type, member_card_id, id, member_id) VALUES ('2010-12-31 19:45:42', 'CC', 1, 8, 5);
INSERT INTO public.order_header (order_datetime, payment_type, member_card_id, id, member_id) VALUES ('2011-03-15 12:32:54', 'BT', NULL, 9, 12);
INSERT INTO public.order_header (order_datetime, payment_type, member_card_id, id, member_id) VALUES ('2011-07-13 06:21:32', 'CC', 1, 10, 4);
INSERT INTO public.order_header (order_datetime, payment_type, member_card_id, id, member_id) VALUES ('2011-08-21 23:42:51', 'BT', NULL, 11, 2);
INSERT INTO public.order_header (order_datetime, payment_type, member_card_id, id, member_id) VALUES ('2011-09-19 09:00:31', 'CC', 1, 12, 14);
INSERT INTO public.order_header (order_datetime, payment_type, member_card_id, id, member_id) VALUES ('2011-09-22 18:44:29', 'BT', NULL, 13, 9);
INSERT INTO public.order_header (order_datetime, payment_type, member_card_id, id, member_id) VALUES ('2011-09-22 21:49:11', 'CC', 1, 14, 8);
INSERT INTO public.order_header (order_datetime, payment_type, member_card_id, id, member_id) VALUES ('2011-09-30 12:30:44', 'CC', 2, 15, 7);
INSERT INTO public.order_header (order_datetime, payment_type, member_card_id, id, member_id) VALUES ('2011-10-04 09:09:12', 'CC', 1, 16, 11);
INSERT INTO public.order_header (order_datetime, payment_type, member_card_id, id, member_id) VALUES ('2011-10-06 02:08:44', 'DV', NULL, 17, 10);
INSERT INTO public.order_header (order_datetime, payment_type, member_card_id, id, member_id) VALUES ('2011-10-15 20:21:29', 'CC', 1, 18, 5);
INSERT INTO public.order_header (order_datetime, payment_type, member_card_id, id, member_id) VALUES ('2011-10-16 11:30:35', 'BT', NULL, 19, 12);
INSERT INTO public.order_header (order_datetime, payment_type, member_card_id, id, member_id) VALUES ('2011-10-18 20:21:59', 'CC', 2, 20, 4);
INSERT INTO public.order_header (order_datetime, payment_type, member_card_id, id, member_id) VALUES ('2011-10-20 09:50:11', 'DV', NULL, 21, 5);
INSERT INTO public.order_header (order_datetime, payment_type, member_card_id, id, member_id) VALUES ('2011-10-21 10:10:10', 'DV', NULL, 22, 12);
INSERT INTO public.order_header (order_datetime, payment_type, member_card_id, id, member_id) VALUES ('2011-10-22 12:40:41', 'CC', 3, 23, 7);
INSERT INTO public.order_header (order_datetime, payment_type, member_card_id, id, member_id) VALUES ('2011-10-23 15:32:16', 'CC', 1, 24, 11);
INSERT INTO public.order_header (order_datetime, payment_type, member_card_id, id, member_id) VALUES ('2011-10-24 19:39:31', 'DV', NULL, 25, 10);
INSERT INTO public.order_header (order_datetime, payment_type, member_card_id, id, member_id) VALUES ('2012-01-04 20:38:31', 'BT', NULL, 26, 5);


--
-- TOC entry 2903 (class 0 OID 324910)
-- Dependencies: 205
-- Data for Name: publisher; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.publisher (publisher_name, prefecture, id) VALUES ('ピアソルエデュケーション', '東京都', 1);
INSERT INTO public.publisher (publisher_name, prefecture, id) VALUES ('講番社', '東京都', 2);
INSERT INTO public.publisher (publisher_name, prefecture, id) VALUES ('京葉プレス', '千葉県', 3);
INSERT INTO public.publisher (publisher_name, prefecture, id) VALUES ('会経DP', '東京都', 4);
INSERT INTO public.publisher (publisher_name, prefecture, id) VALUES ('西京出版', '大阪府', 5);
INSERT INTO public.publisher (publisher_name, prefecture, id) VALUES ('新生文庫', '福岡県', 6);
INSERT INTO public.publisher (publisher_name, prefecture, id) VALUES ('技術評価者', '東京都', 7);


--
-- TOC entry 2904 (class 0 OID 324913)
-- Dependencies: 206
-- Data for Name: questionnaire; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.questionnaire (questionnaire_id, q_text1, q_text2, q_text3, id) VALUES ('QAA', '好きな著者は？', '好きな出版社は？', '好きな書籍は？', 1);
INSERT INTO public.questionnaire (questionnaire_id, q_text1, q_text2, q_text3, id) VALUES ('QBB', '嫌いな著者は？', '嫌いな出版社は？', '嫌いな書籍は？', 2);
INSERT INTO public.questionnaire (questionnaire_id, q_text1, q_text2, q_text3, id) VALUES ('QCC', '当サイトの良い点は？', '当サイトの悪い点は？', NULL, 3);


--
-- TOC entry 2905 (class 0 OID 324916)
-- Dependencies: 207
-- Data for Name: questionnaire_answer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.questionnaire_answer (member_id, questionnaire_id, answer1, answer2, answer3, id) VALUES ('M001', 'QAA', '芥川龍之介', '講番社', '羅生門', 1);
INSERT INTO public.questionnaire_answer (member_id, questionnaire_id, answer1, answer2, answer3, id) VALUES ('M002', 'QBB', '山田六郎', '京葉プレス', '特になし', 2);
INSERT INTO public.questionnaire_answer (member_id, questionnaire_id, answer1, answer2, answer3, id) VALUES ('M003', 'QAA', '村上春樹', '西京出版', '海辺のカフカ', 3);
INSERT INTO public.questionnaire_answer (member_id, questionnaire_id, answer1, answer2, answer3, id) VALUES ('M004', 'QCC', '安いところ', '品ぞろえが悪いところ', NULL, 4);


--
-- TOC entry 2936 (class 0 OID 0)
-- Dependencies: 208
-- Name: book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.book_id_seq', 55, true);


--
-- TOC entry 2937 (class 0 OID 0)
-- Dependencies: 209
-- Name: business_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.business_type_id_seq', 14, true);


--
-- TOC entry 2938 (class 0 OID 0)
-- Dependencies: 210
-- Name: card_company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.card_company_id_seq', 4, true);


--
-- TOC entry 2939 (class 0 OID 0)
-- Dependencies: 211
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 5, true);


--
-- TOC entry 2940 (class 0 OID 0)
-- Dependencies: 212
-- Name: job_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.job_type_id_seq', 11, true);


--
-- TOC entry 2941 (class 0 OID 0)
-- Dependencies: 214
-- Name: member_card_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.member_card_id_seq', 24, true);


--
-- TOC entry 2942 (class 0 OID 0)
-- Dependencies: 213
-- Name: member_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.member_id_seq', 14, true);


--
-- TOC entry 2943 (class 0 OID 0)
-- Dependencies: 215
-- Name: order_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_detail_id_seq', 31, true);


--
-- TOC entry 2944 (class 0 OID 0)
-- Dependencies: 216
-- Name: order_header_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_header_id_seq', 26, true);


--
-- TOC entry 2945 (class 0 OID 0)
-- Dependencies: 217
-- Name: publisher_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.publisher_id_seq', 7, true);


--
-- TOC entry 2946 (class 0 OID 0)
-- Dependencies: 219
-- Name: questionnaire_answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.questionnaire_answer_id_seq', 4, true);


--
-- TOC entry 2947 (class 0 OID 0)
-- Dependencies: 218
-- Name: questionnaire_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.questionnaire_id_seq', 3, true);


--
-- TOC entry 2750 (class 2606 OID 335847)
-- Name: book book_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 335849)
-- Name: business_type business_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.business_type
    ADD CONSTRAINT business_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 335851)
-- Name: card_company card_company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_company
    ADD CONSTRAINT card_company_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 335853)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 2758 (class 2606 OID 335855)
-- Name: job_type job_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_type
    ADD CONSTRAINT job_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 335859)
-- Name: member_card member_card_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member_card
    ADD CONSTRAINT member_card_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 335857)
-- Name: member member_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member
    ADD CONSTRAINT member_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 335861)
-- Name: order_detail order_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_detail
    ADD CONSTRAINT order_detail_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 335863)
-- Name: order_header order_header_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_header
    ADD CONSTRAINT order_header_pkey PRIMARY KEY (id);


--
-- TOC entry 2768 (class 2606 OID 335865)
-- Name: publisher publisher_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publisher
    ADD CONSTRAINT publisher_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 335869)
-- Name: questionnaire_answer questionnaire_answer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire_answer
    ADD CONSTRAINT questionnaire_answer_pkey PRIMARY KEY (id);


--
-- TOC entry 2770 (class 2606 OID 335867)
-- Name: questionnaire questionnaire_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaire_pkey PRIMARY KEY (id);


-- Completed on 2020-05-23 13:35:38

--
-- PostgreSQL database dump complete
--

