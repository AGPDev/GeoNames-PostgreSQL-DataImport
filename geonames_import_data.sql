\COPY geoname (geonameid, name, asciiname, alternatenames, latitude, longitude, fclass, fcode, country, cc2, admin1, admin2, admin3, admin4, population, elevation, gtopo30, timezone, moddate) from 'data/allCountries.txt' null as '';
ALTER TABLE ONLY geoname
ADD CONSTRAINT pk_geonameid PRIMARY KEY (geonameid);
vacuum analyze verbose geoname;

\COPY alternatename (alternatenameid, geonameid, isoLanguage, alternateName, isPreferredName, isShortName, isColloquial, isHistoric) from 'data/alternateNames.txt' null as '';
ALTER TABLE ONLY alternatename
ADD CONSTRAINT pk_alternatenameid PRIMARY KEY (alternatenameid);
ALTER TABLE ONLY alternatename
ADD CONSTRAINT fk_geonameid FOREIGN KEY (geonameid) REFERENCES geoname(geonameid);
vacuum analyze verbose alternatename;

\COPY iso_languagecodes (iso_639_3, iso_639_2, iso_639_1, language_name) from 'data/iso-languagecodes.txt' null as '';
vacuum analyze verbose iso_languagecodes;

\COPY admin1CodesAscii (code, name, nameAscii, geonameid) from 'data/admin1CodesASCII.txt' null as '';
vacuum analyze verbose admin1CodesAscii;

\COPY admin2Codes (code, name, nameAscii, geonameid) from 'data/admin2Codes.txt' null as '';
vacuum analyze verbose admin2Codes;

\COPY hierarchy (parentId, childId, type) from 'data/hierarchy.txt' null as '';
vacuum analyze verbose hierarchy;

\COPY featureCodes (code, name, description) from 'data/featureCodes_en.txt' null as '';
vacuum analyze verbose featureCodes;

\COPY timeZones (countrycode, timeZoneId, GMT_offset, DST_offset, raw_offset) from 'data/timeZones.txt' null as '';
vacuum analyze verbose timeZones;

\COPY countryinfo (iso_alpha2, iso_alpha3, iso_numeric, fips_code, name, capital, areaInSqKm, population, continent, tld, currency, currencyName, phone, postalCodeFormat, postalCodeRegex, languages, geonameid, neighbours, equivalentFipsCode) from 'data/countryInfo.txt' null as '';
ALTER TABLE ONLY countryinfo
ADD CONSTRAINT fk_geonameid FOREIGN KEY (geonameid) REFERENCES geoname(geonameid);
vacuum analyze verbose countryinfo;

\COPY continentCodes (code, name, geonameId) from 'continentCodes.txt' null as '' delimiter ',';
vacuum analyze verbose continentCodes;

\COPY postalcodes (country, postal_code, name, admin1_name, admin1_code, admin2_name, admin2_code, admin3_name, admin3_code, latitude, longitude, accuracy) from 'data/zip_codes/allCountries.txt' null as '';
vacuum analyze verbose postalcodes;

CREATE INDEX index_countryinfo_geonameid ON countryinfo USING hash (geonameid);
CREATE INDEX index_alternatename_geonameid ON alternatename USING hash (geonameid);