-- SCHEMA: public

-- DROP SCHEMA public ;

CREATE SCHEMA public
    AUTHORIZATION caremore;

COMMENT ON SCHEMA public
    IS 'standard public schema';

GRANT ALL ON SCHEMA public TO PUBLIC;

GRANT ALL ON SCHEMA public TO caremore;

-- Table: public."Appointment"

-- DROP TABLE public."Appointment";

CREATE TABLE public."Appointment"
(
    "ID" bigint NOT NULL,
    "CustomerID" bigint,
    "HealthcareCenterID" bigint,
    "Date" date,
    "Attendance" boolean,
    "Time" character varying COLLATE pg_catalog."default",
    CONSTRAINT "Appointment_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "Appointment_CustomerID_fkey" FOREIGN KEY ("CustomerID")
        REFERENCES public."Customer" ("CustomerID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "Appointment_HealthcareCenterID_fkey" FOREIGN KEY ("HealthcareCenterID")
        REFERENCES public."HealthcareCenter" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."Appointment"
    OWNER to caremore;

-- Table: public."Customer"

-- DROP TABLE public."Customer";

CREATE TABLE public."Customer"
(
    "CustomerID" bigint NOT NULL,
    "FirstName" character varying(200) COLLATE pg_catalog."default",
    "Birthdate" date,
    "Gender" character varying COLLATE pg_catalog."default",
    "CustomerLogin" character varying COLLATE pg_catalog."default",
    "CustomerPassword" character varying COLLATE pg_catalog."default",
    "LastName" character varying COLLATE pg_catalog."default",
    CONSTRAINT "Customer_pkey" PRIMARY KEY ("CustomerID")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."Customer"
    OWNER to caremore;

-- Table: public."HealthcareCenter"

-- DROP TABLE public."HealthcareCenter";

CREATE TABLE public."HealthcareCenter"
(
    "ID" bigint NOT NULL,
    "Name" character varying(200) COLLATE pg_catalog."default",
    "Address" character varying(200) COLLATE pg_catalog."default",
    "Latitude" double precision,
    "Longitude" double precision,
    "PostalCode" character varying COLLATE pg_catalog."default",
    "ContactPhone" character varying COLLATE pg_catalog."default",
    "ContactEmail" character varying COLLATE pg_catalog."default",
    CONSTRAINT "HealthcareCenter_pkey" PRIMARY KEY ("ID")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."HealthcareCenter"
    OWNER to caremore;

-- Table: public."Partner"

-- DROP TABLE public."Partner";

CREATE TABLE public."Partner"
(
    "PartnerID" bigint NOT NULL,
    "Name" character varying COLLATE pg_catalog."default",
    "Address" character varying COLLATE pg_catalog."default",
    "PostalCode" character varying COLLATE pg_catalog."default",
    CONSTRAINT "Partner_pkey" PRIMARY KEY ("PartnerID")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."Partner"
    OWNER to caremore;

-- Table: public."Perk"

-- DROP TABLE public."Perk";

CREATE TABLE public."Perk"
(
    "PerkID" bigint NOT NULL,
    "Name" character varying COLLATE pg_catalog."default",
    "PerkType" character varying COLLATE pg_catalog."default",
    "PartnerID" bigint,
    "Quantity" double precision,
    "Units" character varying COLLATE pg_catalog."default",
    CONSTRAINT "Perk_pkey" PRIMARY KEY ("PerkID"),
    CONSTRAINT "Perk_PartnerID_fkey" FOREIGN KEY ("PartnerID")
        REFERENCES public."Partner" ("PartnerID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."Perk"
    OWNER to caremore;

-- Table: public."Perk_Assignment"

-- DROP TABLE public."Perk_Assignment";

CREATE TABLE public."Perk_Assignment"
(
    "PerkID" bigint,
    "CustomerID" bigint,
    "AddedDate" date,
    "PerkAssignmentID" bigint NOT NULL,
    "ValidUntil" date,
    CONSTRAINT "Perk_Assignment_pkey" PRIMARY KEY ("PerkAssignmentID"),
    CONSTRAINT "Perk_Assignment_CustomerID_fkey" FOREIGN KEY ("CustomerID")
        REFERENCES public."Customer" ("CustomerID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "Perk_Assignment_PerkID_fkey" FOREIGN KEY ("PerkID")
        REFERENCES public."Perk" ("PerkID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."Perk_Assignment"
    OWNER to caremore;

-- Table: public."Perk_Usage"

-- DROP TABLE public."Perk_Usage";

CREATE TABLE public."Perk_Usage"
(
    "PerkAssignmentID" bigint,
    "Date" date,
    "Time" timestamp with time zone,
    CONSTRAINT "Perk_Usage_PerkAssignmentID_fkey" FOREIGN KEY ("PerkAssignmentID")
        REFERENCES public."Perk_Assignment" ("PerkAssignmentID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."Perk_Usage"
    OWNER to caremore;