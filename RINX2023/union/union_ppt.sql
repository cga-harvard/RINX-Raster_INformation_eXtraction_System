Create table pptunion as (
Select * from ppt1998
UNION ALL
Select * from ppt1999
UNION ALL
Select * from ppt2000
UNION ALL
Select * from ppt2001
UNION ALL
Select * from ppt2002
UNION ALL
Select * from ppt2003
UNION ALL
Select * from ppt2004
UNION ALL
Select * from ppt2005
UNION ALL
Select * from ppt2006
UNION ALL
Select * from ppt2007
UNION ALL
Select * from ppt2008
UNION ALL
Select * from ppt2009
UNION ALL
Select * from ppt2010
UNION ALL
Select * from ppt2011
UNION ALL
Select * from ppt2012
UNION ALL
Select * from ppt2013
UNION ALL
Select * from ppt2014
UNION ALL
Select * from ppt2015
UNION ALL
Select * from ppt2016
UNION ALL
Select * from ppt2017
UNION ALL
Select * from ppt2018
UNION ALL
Select * from ppt2019
UNION ALL
Select * from ppt2020
UNION ALL
Select * from ppt2021
UNION ALL
Select * from ppt2022
UNION ALL
Select * from ppt2023
);
Alter table pptunion add column filedate date;
Update pptunion set filedate=TO_DATE(substring(filename,18,8),'YYYYMMDD');
