Create table tminunion as (
Select * from tmin1998
UNION ALL
Select * from tmin1999
UNION ALL
Select * from tmin2000
UNION ALL
Select * from tmin2001
UNION ALL
Select * from tmin2002
UNION ALL
Select * from tmin2003
UNION ALL
Select * from tmin2004
UNION ALL
Select * from tmin2005
UNION ALL
Select * from tmin2006
UNION ALL
Select * from tmin2007
UNION ALL
Select * from tmin2008
UNION ALL
Select * from tmin2009
UNION ALL
Select * from tmin2010
UNION ALL
Select * from tmin2011
UNION ALL
Select * from tmin2012
UNION ALL
Select * from tmin2013
UNION ALL
Select * from tmin2014
UNION ALL
Select * from tmin2015
UNION ALL
Select * from tmin2016
UNION ALL
Select * from tmin2017
UNION ALL
Select * from tmin2018
UNION ALL
Select * from tmin2019
UNION ALL
Select * from tmin2020
UNION ALL
Select * from tmin2021
UNION ALL
Select * from tmin2022
UNION ALL
Select * from tmin2023
);
Alter table tminunion add column filedate date;
Update tminunion set filedate=TO_DATE(substring(filename,19,8),'YYYYMMDD');