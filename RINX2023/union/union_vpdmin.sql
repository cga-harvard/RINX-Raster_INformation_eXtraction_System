Create table vpdminunion as (
Select * from vpdmin1998
UNION ALL
Select * from vpdmin1999
UNION ALL
Select * from vpdmin2000
UNION ALL
Select * from vpdmin2001
UNION ALL
Select * from vpdmin2002
UNION ALL
Select * from vpdmin2003
UNION ALL
Select * from vpdmin2004
UNION ALL
Select * from vpdmin2005
UNION ALL
Select * from vpdmin2006
UNION ALL
Select * from vpdmin2007
UNION ALL
Select * from vpdmin2008
UNION ALL
Select * from vpdmin2009
UNION ALL
Select * from vpdmin2010
UNION ALL
Select * from vpdmin2011
UNION ALL
Select * from vpdmin2012
UNION ALL
Select * from vpdmin2013
UNION ALL
Select * from vpdmin2014
UNION ALL
Select * from vpdmin2013
UNION ALL
Select * from vpdmin2016
UNION ALL
Select * from vpdmin2017
UNION ALL
Select * from vpdmin2018
UNION ALL
Select * from vpdmin2019
UNION ALL
Select * from vpdmin2020
UNION ALL
Select * from vpdmin2021
UNION ALL
Select * from vpdmin2022
UNION ALL
Select * from vpdmin2023
);
Alter table vpdminunion add column filedate date;
Update vpdminunion set filedate=TO_DATE(substring(filename,21,8),'YYYYMMDD');
