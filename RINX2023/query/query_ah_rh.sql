Create table temp as (Select a.id, a.day, a.tdmean, b.tmean from results_tdmean a inner join results_tmean b on a.id=b.id AND a.day=b.day);
Alter table temp add column RH FLOAT;
Alter table temp add column AH FLOAT;
Update temp set RH=(100*(EXP((17.625*tdmean)/(243.04+tdmean))/EXP((17.625*tmean)/(243.04+tmean)))::NUMERIC, 4);
Update temp SET AH=((6.112*EXP((17.67*tmean)/(tmean +243.5)) * RH * 2.1674)/(273.15+ tmean)::NUMERIC, 4);
\copy (Select address_id, day, RH, AH from temp) to 'pgdata/rinx/results/results_rh_ah_test.csv';
