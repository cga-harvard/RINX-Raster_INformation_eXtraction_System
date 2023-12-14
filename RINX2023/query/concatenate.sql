Create table results_merged as (Select a.id as id, a.day as day,a.tmin as tmin,b.tmax as tmax,c.tdmean as tdmean, d.tmean as tmean, e.vpdmin as vpdmin,f.vpdmax as vpdmax, g.ppt as ppt, h.rh as rh, h.ah as ah from results_tmin a LEFT OUTER JOIN results_tmax b ON a.id=b.id and a.day=b.day
LEFT outer join results_tdmean c on a.id=c.id and a.day=c.day LEFT outer join results_tmean d on a.id=d.id and a.day=d.day LEFT outer join results_vpdmin e on a.id=e.id and a.day=e.day LEFT outer join results_vpdmax f on a.id=f.id and a.day=f.day LEFT outer join results_ppt g on a.id=g.id and a.day=g.day LEFT outer join temp h on a.id=h.id and a.day=h.day);
