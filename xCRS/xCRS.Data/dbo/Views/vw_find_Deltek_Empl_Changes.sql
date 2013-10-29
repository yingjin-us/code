

CREATE   view vw_find_Deltek_Empl_Changes 
as 
select 
	EMPL_ID,
	LAST_NAME,
	FIRST_NAME,
	ORIG_HIRE_DT,
	TERM_DT
from CPPROD..DELTEK.EMPL
union
select 
	EMPL_ID,
	LAST_NAME,
	FIRST_NAME,
	ORIG_HIRE_DT,
	TERM_DT
from deltek_empl



