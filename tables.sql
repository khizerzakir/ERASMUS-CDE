BEGIN;

CREATE EXTENSION IF NOT EXISTS postgis;

CREATE TABLE IF NOT EXISTS public.events
(
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(50),
    capacity integer,
    start_time time without time zone,
    end_time time without time zone,
    stage_id integer,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.facilities
(
    fid bigint NOT NULL,
    geom geometry,
    facility character varying,
    festival_id integer,
    PRIMARY KEY (fid)
);

CREATE TABLE IF NOT EXISTS public.festival_arena
(
    id integer NOT NULL,
    geom geometry,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.food_stall
(
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(50),
    geom geometry,
    food_vendor integer NOT NULL,
    opening_time time without time zone,
    closing_time time without time zone,
    price_range numeric(10, 2),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.food_vendors
(
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(50),
    contact_number character varying(50),
    type character varying(50),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.fun_activities
(
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(50),
    geom geometry,
    capacity integer,
    opening_time time without time zone,
    closing_time time without time zone,
    price_range numeric(10, 2),
    festival_id integer,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.performances
(
    id integer NOT NULL,
    name text NOT NULL,
    start_time time without time zone NOT NULL,
    end_time time without time zone NOT NULL,
    performer_id integer NOT NULL,
    events_id integer NOT NULL,
    stage_id integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.performer
(
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    genre character varying(50),
    contact_phone character varying(20),
    contact_email character varying(255),
    event_id integer,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.stages
(
    id integer NOT NULL,
    capacity integer,
    geom geometry,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.user_location
(
    id integer NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.performances_performer
(
    performances_performer_id integer NOT NULL,
    performer_id integer NOT NULL
);

CREATE TABLE IF NOT EXISTS public.events_performances
(
    events_id integer NOT NULL,
    performances_events_id integer NOT NULL
);

CREATE TABLE IF NOT EXISTS public.events_performer
(
    events_id integer NOT NULL,
    performer_event_id integer
);

ALTER TABLE public.food_stall
    ADD FOREIGN KEY (food_vendor)
    REFERENCES public.food_vendors (id)
    NOT VALID;


ALTER TABLE public.performances_performer
    ADD FOREIGN KEY (performances_performer_id)
    REFERENCES public.performances (performer_id)
    NOT VALID;


ALTER TABLE public.performances_performer
    ADD FOREIGN KEY (performer_id)
    REFERENCES public.performer (id)
    NOT VALID;


ALTER TABLE public.events_performances
    ADD FOREIGN KEY (events_id)
    REFERENCES public.events (id)
    NOT VALID;


ALTER TABLE public.events_performances
    ADD FOREIGN KEY (performances_events_id)
    REFERENCES public.performances (events_id)
    NOT VALID;


ALTER TABLE public.events_performer
    ADD FOREIGN KEY (events_id)
    REFERENCES public.events (id)
    NOT VALID;


ALTER TABLE public.events_performer
    ADD FOREIGN KEY (performer_event_id)
    REFERENCES public.performer (event_id)
    NOT VALID;


ALTER TABLE public.events
    ADD FOREIGN KEY (stage_id)
    REFERENCES public.stages (id)
    NOT VALID;


ALTER TABLE public.fun_activities
    ADD FOREIGN KEY (festival_id)
    REFERENCES public.festival_arena (id)
    NOT VALID;


ALTER TABLE public.facilities
    ADD FOREIGN KEY (festival_id)
    REFERENCES public.festival_arena (id)
    NOT VALID;

END;