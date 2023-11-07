Create table tmeanunion as (
Select * from tmean1998
UNION ALL
Select * from tmean1999
UNION ALL
Select * from tmean2000
UNION ALL
Select * from tmean2001
UNION ALL
Select * from tmean2002
UNION ALL
Select * from tmean2003
UNION ALL
Select * from tmean2004
UNION ALL
Select * from tmean2005
UNION ALL
Select * from tmean2006
UNION ALL
Select * from tmean2007
UNION ALL
Select * from tmean2008
UNION ALL
Select * from tmean2009
UNION ALL
Select * from tmean2010
UNION ALL
Select * from tmean2011
UNION ALL
Select * from tmean2012
UNION ALL
Select * from tmean2013
UNION ALL
Select * from tmean2014
UNION ALL
Select * from tmean2015
UNION ALL
Select * from tmean2016
UNION ALL
Select * from tmean2017
UNION ALL
Select * from tmean2018
UNION ALL
Select * from tmean2019
UNION ALL
Select * from tmean2020
UNION ALL
Select * from tmean2021
UNION ALL
Select * from tmean2022
UNION ALL
Select * from tmean2023
);
Alter table tmeanunion add column filedate date;
Update tmeanunion set filedate=TO_DATE(substring(filename,20,8),'YYYYMMDD');
