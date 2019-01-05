\COPY geoname (geonameid, name, asciiname, alternatenames, latitude, longitude, fclass, fcode, country, cc2, admin1, admin2, admin3, admin4, population, elevation, gtopo30, timezone, moddate) from 'data/allCountries.txt' null as '';
ALTER TABLE ONLY geoname
ADD CONSTRAINT pk_geonameid PRIMARY KEY (geonameid);
VACUUM FULL geoname;

\COPY alternatename (alternatenameid, geonameid, isoLanguage, alternateName, isPreferredName, isShortName, isColloquial, isHistoric) from 'data/alternateNames.txt' null as '';
ALTER TABLE ONLY alternatename
ADD CONSTRAINT pk_alternatenameid PRIMARY KEY (alternatenameid);
ALTER TABLE ONLY alternatename
ADD CONSTRAINT fk_geonameid FOREIGN KEY (geonameid) REFERENCES geoname(geonameid);
VACUUM FULL alternatename;

\COPY iso_languagecodes (iso_639_3, iso_639_2, iso_639_1, language_name) from 'data/iso-languagecodes.txt' null as '';
VACUUM FULL iso_languagecodes;

\COPY admin1CodesAscii (code, name, nameAscii, geonameid) from 'data/admin1CodesASCII.txt' null as '';
VACUUM FULL admin1CodesAscii;

\COPY admin2Codes (code, name, nameAscii, geonameid) from 'data/admin2Codes.txt' null as '';
VACUUM FULL admin2Codes;

\COPY hierarchy (parentId, childId, type) from 'data/hierarchy.txt' null as '';
VACUUM FULL hierarchy;

\COPY featureCodes (code, name, description) from 'data/featureCodes_en.txt' null as '';
VACUUM FULL featureCodes;

\COPY timeZones (countrycode, timeZoneId, GMT_offset, DST_offset, raw_offset) from 'data/timeZones.txt' null as '';
VACUUM FULL timeZones;

\COPY countryinfo (iso_alpha2, iso_alpha3, iso_numeric, fips_code, name, capital, areaInSqKm, population, continent, tld, currency, currencyName, phone, postalCodeFormat, postalCodeRegex, languages, geonameid, neighbours, equivalentFipsCode) from 'data/countryInfo.txt' null as '';
ALTER TABLE ONLY countryinfo
ADD CONSTRAINT fk_geonameid FOREIGN KEY (geonameid) REFERENCES geoname(geonameid);
VACUUM FULL countryinfo;

\COPY continentcodes (code, name, geonameId) from 'continentCodes.txt' null as '' delimiter ',';
VACUUM FULL continentcodes;

\COPY postalcodes (country, postal_code, name, admin1_name, admin1_code, admin2_name, admin2_code, admin3_name, admin3_code, latitude, longitude, accuracy) from 'data/zip_codes/allCountries.txt' null as '';
VACUUM FULL postalcodes;

CREATE INDEX index_timezones_all ON timezones (timezoneid, dst_offset, gmt_offset, raw_offset);
CREATE INDEX index_continents_all ON continentcodes (geonameid, name, code);
CREATE INDEX index_geoname_geonameid ON geoname (geonameid);
CREATE INDEX index_geoname_paises ON geoname (fclass, fcode);
CREATE INDEX index_countryinfo_all ON countryinfo (geonameid, capital, continent, areainsqkm, population, currency, currencyname, phone, postalcodeformat, postalcoderegex, languages);
CREATE INDEX index_geoname_cidades ON geoname (fclass, fcode, admin1, country);
CREATE INDEX index_alternatename_all ON alternatename (geonameid, isolanguage, ispreferredname);
