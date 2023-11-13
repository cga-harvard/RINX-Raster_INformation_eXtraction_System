Create table results_tmin as (SELECT  a.id as id, regexp_replace(CAST(b.filedate AS TEXT),'-','','g') AS day,
ROUND(ST_VALUE(b.rast, ST_Transform(ST_SetSRID(ST_Point(a.longitude, a.latitude), 4326), 4269))::NUMERIC, 5) AS tmin
from addresses a
inner join tminunion b
ON
ST_Intersects(ST_Envelope(b.rast), ST_Transform(ST_SetSRID( ST_Point(a.longitude, a.latitude), 4326), 4269)) = 't'
AND startdate <= filedate AND enddate >= filedate);
Copy(Select * from results_tmin) TO 'pgdata/rinx/results/results_tmin.csv';