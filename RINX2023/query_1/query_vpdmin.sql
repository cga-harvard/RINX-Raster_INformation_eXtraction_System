Create table results_vpdmin as (SELECT  a.id as id, regexp_replace(CAST(b.filedate AS TEXT),'-','','g') AS day,
ROUND(ST_VALUE(b.rast, ST_Transform(a.geom, 4269))::NUMERIC, 5) AS vpdmin
from addresses a
inner join vpdminunion b
ON
ST_Intersects(ST_Envelope(b.rast), ST_Transform(a.geom, 4269)) = 't'
AND startdate <= filedate AND enddate >= filedate);
Copy(Select * from results_vpdmin) TO '/pgdata/rinx/results/results_vpdmin.csv';