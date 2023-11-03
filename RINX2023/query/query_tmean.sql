Create table results_tmean as (SELECT  a.id as id, regexp_replace(CAST(b.filedate AS TEXT),'-','','g') AS day,
ST_VALUE(b.rast, ST_Transform(ST_SetSRID( ST_Point(a.longitude, a.latitude), 4326), 4269)) as tmean
from addresses a
inner join tmeanunion b
ON
ST_Intersects(ST_Envelope(b.rast), ST_Transform(ST_SetSRID( ST_Point(a.longitude, a.latitude), 4326), 4269)) = 't'
AND startdate <= filedate AND enddate >= filedate);
Copy(Select * from results_tmean) TO '/pgdata/results/results_tmean.csv';