CREATE procedure usp_getCPTitle
	--@grade as varchar(2)
as
select FUNC_JOB_CD, FUNC_JOB_DESC, SAL_GRADE_CD from CPPROD..DELTEK.FUNC_JOB_TITLES
	--where SAL_GRADE_CD=@grade


--select * from crs_tblsal_



