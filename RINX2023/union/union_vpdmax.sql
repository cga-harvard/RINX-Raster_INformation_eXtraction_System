Create table vpdmaxunion as (
Select * from vpdmax1998
UNION ALL
Select * from vpdmax1999
UNION ALL
Select * from vpdmax2000
UNION ALL
Select * from vpdmax2001
UNION ALL
Select * from vpdmax2002
UNION ALL
Select * from vpdmax2003
UNION ALL
Select * from vpdmax2004
UNION ALL
Select * from vpdmax2005
UNION ALL
Select * from vpdmax2006
UNION ALL
Select * from vpdmax2007
UNION ALL
Select * from vpdmax2008
UNION ALL
Select * from vpdmax2009
UNION ALL
Select * from vpdmax2010
UNION ALL
Select * from vpdmax2011
UNION ALL
Select * from vpdmax2012
UNION ALL
Select * from vpdmax2013
UNION ALL
Select * from vpdmax2014
UNION ALL
Select * from vpdmax2015
UNION ALL
Select * from vpdmax2016
UNION ALL
Select * from vpdmax2017
UNION ALL
Select * from vpdmax2018
UNION ALL
Select * from vpdmax2019
UNION ALL
Select * from vpdmax2020
UNION ALL
Select * from vpdmax2021
UNION ALL
Select * from vpdmax2022
UNION ALL
Select * from vpdmax2023
);
Alter table vpdmaxunion add column filedate date;
Update vpdmaxunion set filedate=TO_DATE(substring(filename,19,8),'YYYYMMDD');