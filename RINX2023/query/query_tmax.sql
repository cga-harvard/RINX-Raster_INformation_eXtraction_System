Create table results_tmax as (SELECT  a.id as id, regexp_replace(CAST(b.filedate AS TEXT),'-','','g') AS day,
ROUND(ST_VALUE(b.rast, ST_Transform(a.geom, 4269))::NUMERIC, 4) AS tmax
from addresses a
inner join tmaxunion b
ON
ST_Intersects(ST_Envelope(b.rast), ST_Transform(a.geom, 4269)) = 't'
AND startdate <= filedate AND enddate >= filedate);
Copy(Select * from results_tmax) TO '/pgdata/rinx/results/results_tmax.csv';
