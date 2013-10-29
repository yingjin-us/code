CREATE view vw_paidbenefit_data
as
SELECT e.empl_id, l.org_id, l.effect_dt, l.hrly_amt, SUM(ACT_HRS) hrs
    FROM 
		cpprod..DELTEK.EMPL e, cpprod..DELTEK.EMPL_LAB_INFO l, cpprod..DELTEK.LAB_HS o
    WHERE 
        e.lv_pd_cd ='HSM' 
        AND e.s_empl_status_cd ='ACT'
        AND e.empl_id=l.empl_id
        AND l.end_dt  ='31-Dec-2078'
        AND o.empl_id = l.empl_id 
        AND o.fy_cd ='2008' -- change this year
        AND left(o.proj_id,4)<> '1196'
    GROUP BY e.empl_id, l.org_id, l.effect_dt, l.hrly_amt
