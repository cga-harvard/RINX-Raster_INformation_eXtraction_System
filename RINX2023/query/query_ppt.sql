Create table results_ppt as (SELECT  a.id as id, regexp_replace(CAST(b.filedate AS TEXT),'-','','g') AS day,
ROUND(ST_VALUE(b.rast, ST_Transform(a.geom, 4269))::NUMERIC, 4) AS ppt
from addresses a
inner join pptunion b
ON
ST_Intersects(ST_Envelope(b.rast), ST_Transform(a.geom, 4269)) = 't'
AND startdate <= filedate AND enddate >= filedate);
Copy(Select * from results_ppt) TO '/pgdata/rinx/results/results_ppt.csv';
