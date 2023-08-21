CREATE SEQUENCE IF NOT EXISTS public.evidences_evidenceid_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

CREATE SEQUENCE IF NOT EXISTS public.evidence_images_evidenceimageid_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

CREATE TABLE IF NOT EXISTS public.evidences
(
    evidenceid integer NOT NULL DEFAULT nextval('evidences_evidenceid_seq'::regclass),
    policestation character varying(60) COLLATE pg_catalog."default" NOT NULL,
    firnumber character varying(30) COLLATE pg_catalog."default" NOT NULL,
    evidencenumber character varying(60) COLLATE pg_catalog."default" NOT NULL,
    collectiondate character varying(60) COLLATE pg_catalog."default",
    evidencetype character varying(60) COLLATE pg_catalog."default",
    evidencedescription character varying COLLATE pg_catalog."default",
    officername character varying(60) COLLATE pg_catalog."default",
    collectionreason character varying(60) COLLATE pg_catalog."default",
    evidencestatus character varying(60) COLLATE pg_catalog."default",
    courtname character varying(60) COLLATE pg_catalog."default",
    fslsenddate character varying(60) COLLATE pg_catalog."default",
    createdby character varying(60) COLLATE pg_catalog."default",
    modifiedby character varying(60) COLLATE pg_catalog."default",
    created timestamp with time zone,
    modified timestamp with time zone,
    CONSTRAINT evidences_pkey PRIMARY KEY (evidenceid)
);

CREATE TABLE IF NOT EXISTS public.evidence_images
(
    evidenceimageid integer NOT NULL DEFAULT nextval('evidence_images_evidenceimageid_seq'::regclass),
    evidenceid integer NOT NULL,
    imagedata bytea,
    imagename character varying(60) COLLATE pg_catalog."default",
    imagetype character varying(60) COLLATE pg_catalog."default",
    imagecategory character varying(60) COLLATE pg_catalog."default",
    CONSTRAINT evidence_images_pkey PRIMARY KEY (evidenceimageid),
    CONSTRAINT evidence_images_evidenceid_fkey FOREIGN KEY (evidenceid)
        REFERENCES public.evidences (evidenceid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

