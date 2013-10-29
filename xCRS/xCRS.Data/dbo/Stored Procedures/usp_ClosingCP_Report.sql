

CREATE   procedure usp_ClosingCP_Report
	@ReviewYear as varchar(4)
As
	Declare @Effect_DT	varchar(15)
	Declare @Effect_Dt_ForFld	varchar(15)
	
	--declare @ReviewYear as varchar(4)
	--select @ReviewYear='2006'

	Select @Effect_Dt_ForFld = '01/01/' + cast(@ReviewYear + 1 as char(4))
	Select @Effect_DT = '12/01/' + @ReviewYear

	delete from DELTEK_CLOSEREVIEW_REPORT
	insert into DELTEK_CLOSEREVIEW_REPORT
		select e.empl_id, effect_DT, e.last_name, e.first_name, LAST_FIRST_NAME,
			SAL_GRADE_CD,
			HRLY_AMT,
			ANNL_AMT/1000,
			DETL_JOB_CD, e.TERM_DT
			from CPPROD..DELTEK.EMPL E
		inner join CPPROD..DELTEK.EMPL_LAB_INFO L
			on E.EMPL_ID=L.EMPL_ID
			where L.END_DT='31-Dec-2078'
			and L.MODIFIED_BY='CRS_USER'	
			and 
			(effect_dt=@Effect_DT OR effect_dt=@Effect_Dt_ForFld)
			


