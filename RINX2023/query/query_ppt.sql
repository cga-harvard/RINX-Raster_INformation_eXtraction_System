Create table results_ppt as (SELECT  a.id as id, regexp_replace(CAST(b.filedate AS TEXT),'-','','g') AS day,
ST_VALUE(b.rast, ST_Transform(ST_SetSRID( ST_Point(a.longitude, a.latitude), 4326), 4269)) as ppt
from addresses a
inner join pptunion b
ON
ST_Intersects(ST_Envelope(b.rast), ST_Transform(ST_SetSRID( ST_Point(a.longitude, a.latitude), 4326), 4269)) = 't'
AND startdate <= filedate AND enddate >= filedate);
Copy(Select * from results_ppt) TO '/pgdata/results/results_ppt.csv';