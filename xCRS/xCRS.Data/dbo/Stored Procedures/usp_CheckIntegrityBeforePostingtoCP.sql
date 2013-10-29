



CREATE      procedure usp_CheckIntegrityBeforePostingtoCP
as
Delete from CRS_EMPL_RATE_UPDATE_ERROR
insert into CRS_EMPL_RATE_UPDATE_ERROR
select empl_id, Effect_DT, HRLY_AMT, JOB_CD, 'Job Title Code is invalid'
 from CPPROD..CRS_USER.EMPL_RATE_UPDATE
	where JOB_CD not in (select FUNC_JOB_CD from CPPROD..DELTEK.FUNC_JOB_TITLES)

insert into CRS_EMPL_RATE_UPDATE_ERROR
select empl_id, Effect_DT, HRLY_AMT, JOB_CD, 'History record for this employee does not exist'
 from CPPROD..CRS_USER.EMPL_RATE_UPDATE
	where empl_id not in (select empl_id from CPPROD..DELTEK.EMPL_LAB_INFO)


-- Ran into issue with this SQL. After initial Salary posting for Salaried Staffs
-- the sql is not checking for org.

insert into CRS_EMPL_RATE_UPDATE_ERROR
select empl_id, Effect_DT, HRLY_AMT, '', 'Rate effective date conflicts with existing history effective date'
 from CPPROD..DELTEK.EMPL_LAB_INFO
	where effect_dt='12/01/' + convert(varchar, year(getdate()))
	and Modified_by='CRS_USER' AND ORG_ID not like '%.1' -- Hard code - work around to post hourly staff salary to CP.


Select empl_id, HRLY_AMT, JOB_CD, ERROR_DESC from  CRS_EMPL_RATE_UPDATE_ERROR



