Create table tdmeanunion as (
Select * from tdmean1998
UNION ALL
Select * from tdmean1999
UNION ALL
Select * from tdmean2000
UNION ALL
Select * from tdmean2001
UNION ALL
Select * from tdmean2002
UNION ALL
Select * from tdmean2003
UNION ALL
Select * from tdmean2004
UNION ALL
Select * from tdmean2005
UNION ALL
Select * from tdmean2006
UNION ALL
Select * from tdmean2007
UNION ALL
Select * from tdmean2008
UNION ALL
Select * from tdmean2009
UNION ALL
Select * from tdmean2010
UNION ALL
Select * from tdmean2011
UNION ALL
Select * from tdmean2012
UNION ALL
Select * from tdmean2013
UNION ALL
Select * from tdmean2014
UNION ALL
Select * from tdmean2015
UNION ALL
Select * from tdmean2016
UNION ALL
Select * from tdmean2017
UNION ALL
Select * from tdmean2018
UNION ALL
Select * from tdmean2019
UNION ALL
Select * from tdmean2020
UNION ALL
Select * from tdmean2021
UNION ALL
Select * from tdmean2022
UNION ALL
Select * from tdmean2023
);
Alter table tdmeanunion add column filedate date;
Update tdmeanunion set filedate=TO_DATE(substring(filename,21,8),'YYYYMMDD');
