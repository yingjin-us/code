﻿

create   procedure usp_uploadMidYearDataToCPTable
AS

delete from CPPROD..CRS_USER.EMPL_RATE_UPDATE
insert into 
	CPPROD..CRS_USER.EMPL_RATE_UPDATE
	Select EMPL_ID, EFFECT_DT, HRLY_AMT, JOB_CD_NEW, MODIFIED_BY, TIME_STAMP
	from CRS_EMPL_RATE_UPDATE 


