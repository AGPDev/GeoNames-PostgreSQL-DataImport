# GeoNames-PostgreSQL-DataImport

### Shell Script for importing geonames.org data dumps into a PostgreSQL database.

This project is based on <a href="https://github.com/codigofuerte/GeoNames-MySQL-DataImport" target="_blank">GeoNames MySQL DataImport</a>  by <a href="https://github.com/codigofuerte" target="_blank">Codigo Fuerte</a> just converted to work with PostgreSQL.

Usage: geonames_importer.sh -a "action"

Where "action" can be: 
  
- **download-data** Downloads the last packages of data available in GeoNames. An additional parameter with a download directory should be used.
- **create-db** Creates the mysql database structure with no data.
- **create-tables** Creates the tables in the current database. Useful if we want to import them in an exsiting db.
- **import-dumps** Imports geonames data into db. A database is previously needed for this to work.
- **drop-db** Removes the db completely.
- **truncate-db** Removes geonames data from db.    

