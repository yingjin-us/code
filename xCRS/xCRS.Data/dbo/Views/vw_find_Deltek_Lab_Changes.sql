



CREATE     view vw_find_Deltek_Lab_Changes 
as 
select 
	EMPL_ID,
	end_dt
	EFFECT_DT,
	HRLY_AMT,
	ANNL_AMT,
	ORG_ID,
	SAL_GRADE_CD
from CPPROD..DELTEK.EMPL_LAB_INFO d
	where end_dt='12/31/2078'
union
select 
	EMPL_ID,
	end_dt
	EFFECT_DT,
	HRLY_AMT,
	ANNL_AMT,
	ORG_ID,
	SAL_GRADE_CD
from deltek_empl_lab_info d
	where end_dt='12/31/2078'




