Create table tmaxunion as (
Select * from tmax1998
UNION ALL
Select * from tmax1999
UNION ALL
Select * from tmax2000
UNION ALL
Select * from tmax2001
UNION ALL
Select * from tmax2002
UNION ALL
Select * from tmax2003
UNION ALL
Select * from tmax2004
UNION ALL
Select * from tmax2005
UNION ALL
Select * from tmax2006
UNION ALL
Select * from tmax2007
UNION ALL
Select * from tmax2008
UNION ALL
Select * from tmax2009
UNION ALL
Select * from tmax2010
UNION ALL
Select * from tmax2011
UNION ALL
Select * from tmax2012
UNION ALL
Select * from tmax2013
UNION ALL
Select * from tmax2014
UNION ALL
Select * from tmax2015
UNION ALL
Select * from tmax2016
UNION ALL
Select * from tmax2017
UNION ALL
Select * from tmax2018
UNION ALL
Select * from tmax2019
UNION ALL
Select * from tmax2020
UNION ALL
Select * from tmax2021
UNION ALL
Select * from tmax2022
UNION ALL
Select * from tmax2023
);
Alter table tmaxunion add column filedate date;
Update tmaxunion set filedate=TO_DATE(substring(filename,19,8),'YYYYMMDD');