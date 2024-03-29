DROP TABLE IF EXISTS addresses;
Create table addresses (Id character varying(255), latitude float, longitude float, start_date character varying(255), end_date character varying(255));
copy addresses from '/pgdata/rinx/input/climate_input_02.csv' (FORMAT csv, HEADER, DELIMITER ',');
Alter table addresses add column startdate date;
Alter table addresses add column enddate date;
Update addresses set startdate=TO_DATE(start_date::TEXT,'YYYYMMDD');
Update addresses set enddate=TO_DATE(end_date::TEXT,'YYYYMMDD');
Alter table addresses drop column start_date;
Alter table addresses drop column end_date;
ALTER TABLE addresses ADD COLUMN geom geometry (Point, 4326);
UPDATE addresses SET geom = ST_SetSRID (ST_MakePoint(longitude, latitude), 4326);
create index addresses_id ON addresses USING GIST (geom);
Cluster addresses using addresses_id;
