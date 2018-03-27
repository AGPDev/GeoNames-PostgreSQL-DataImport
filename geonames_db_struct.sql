DROP TABLE IF EXISTS admin1CodesAscii;
CREATE TABLE admin1CodesAscii (
  code character varying,
  name TEXT,
  nameAscii TEXT,
  geonameid int
);

DROP TABLE IF EXISTS admin2Codes;
CREATE TABLE admin2Codes (
  code character varying,
  name TEXT,
  nameAscii TEXT,
  geonameid int
);

DROP TABLE IF EXISTS alternatename;
CREATE TABLE alternatename (
  alternatenameId int,
  geonameid int,
  isoLanguage character varying,
  alternateName character varying,
  isPreferredName boolean,
  isShortName boolean,
  isColloquial boolean,
  isHistoric boolean
);

DROP TABLE IF EXISTS continentCodes;
CREATE TABLE continentCodes (
  code character varying,
  name character varying,
  geonameid INT
);

DROP TABLE IF EXISTS countryinfo;
CREATE TABLE countryinfo (
  iso_alpha2 character varying,
  iso_alpha3 character varying,
  iso_numeric integer,
  fips_code character varying,
  name character varying,
  capital character varying,
  areainsqkm double precision,
  population integer,
  continent character varying,
  tld character varying,
  currency character varying,
  currencyName character varying,
  Phone character varying,
  postalCodeFormat character varying,
  postalCodeRegex character varying,
  geonameId int,
  languages character varying,  
  neighbours character varying,
  equivalentFipsCode character varying
);

DROP TABLE IF EXISTS featureCodes;
CREATE TABLE featureCodes (
  code character varying,
  name character varying,
  description TEXT
);

DROP TABLE IF EXISTS geoname CASCADE;
CREATE TABLE geoname (
  geonameid int,
  name character varying,
  asciiname character varying,
  alternatenames character varying,
  latitude float,
  longitude float,
  fclass character varying,
  fcode character varying,
  country character varying,
  cc2 character varying,
  admin1 character varying,
  admin2 character varying,
  admin3 character varying,
  admin4 character varying,
  population bigint,
  elevation int,
  gtopo30 int,
  timezone character varying,
  moddate date
);
  
DROP TABLE IF EXISTS hierarchy;
CREATE TABLE hierarchy(
  parentId int,
  childId int,
  type character varying
);
  
DROP TABLE IF EXISTS iso_languagecodes;
CREATE TABLE iso_languagecodes(
  iso_639_3 character varying,
  iso_639_2 character varying,
  iso_639_1 character varying,
  language_name character varying
);
  
DROP TABLE IF EXISTS timeZones;
CREATE TABLE timeZones (
  countrycode character varying,
  timeZoneId character varying,
  GMT_offset numeric(3,1),
  DST_offset numeric(3,1),
  raw_offset numeric(3,1)
);

DROP TABLE IF EXISTS postalcodes;
CREATE TABLE postalcodes (
  country character varying,
  postal_code character varying,
  name character varying,
  admin1_name character varying,
  admin1_code character varying,
  admin2_name character varying,
  admin2_code character varying,
  admin3_name character varying,
  admin3_code character varying,
  latitude float,
  longitude float,
  accuracy smallint
);
  
ALTER TABLE ONLY countryinfo
ADD CONSTRAINT pk_iso_alpha2 PRIMARY KEY (iso_alpha2);