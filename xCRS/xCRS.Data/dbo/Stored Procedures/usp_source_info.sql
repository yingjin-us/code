CREATE procedure [dbo].[usp_source_info]
AS
select getdate()
/*
-- Review
	CurrentSal - Local - DELTEK_EMPL_LAB_INFO
-- YOS Years of service
	select  * from crs_lkpEmployee_hours_years
-- Job Family Code
	crs_tmpreport_downloaded (Family_Code)
	crs_tblempl_info (Family_Code, fldReviewProcess)	
-- Close Review
	Stored Procedure 
		usp_getCloseReviewStatus
		usp_IsReviewClosed	
		usp_CloseReviewProcess
-- Non Exempt Program Listing Report
	Stored Procedure - usp_NonExmptTargetPrgList
	Tables 
		vw_empl_info		
		crs_tmpreport_downloaded
		CRS_lkpCompReviewType
-- DOG, Date of Grade, Archive
	crs_tblempl_info
-- Active
	crs_tblempl_info, crs_tmpreport_downloaded	
-- DOT
    crs_tmpreport_downloaded	
-- Row4
	crs_tblempl_info, crs_tblsal_info (history)		
-- Utilization, FT, Fulltime, Full Time
     sp - usp_run_utilization 	
-- Refresh CRS
   usp_DoWisdomUpdates, usp_DoDeltekLabUpdates, usp_refresh_Data     
-- Refresh New All Staff Bonus
   usp_refresh_CP_BonusInfo 
-- Browse, Employee Information
	Search -- vw_Empl_Info_BrowseOnly
	Other Bon Info -- SP usp_selectEmployeeSalaryDetail   
-- User Login Session setup
	usp_getuser
-- Insert Salary Records 
	CONCATENATE("insert into crs_tblsal_info(empl_id, effect_dt, hur_rate, sal, sal_inc, per_inc, grade, grade_step, rating_col, rating_row, bon_tot, grade_category, change_code, updateid, updatedate, reviewyear, perf_rating, growth_rating) values ( ",B2,",'",E2,"',",F2,",",G2,",",H2,",",I2,",",J2,",",K2,",'",L2,",'",M2,"','",N2,"','",2,"','",P2,"','",Q2,"','",R2,"','",S2,"','",T2,"','",U4,"');")
-- Administration Create New Employee Record
	usp_create_new_employee_record	
-- sysobjects
	select c.name, s.name  from syscolumns c, sysobjects s
	where c.name like '%archive%'
	and c.id = s.id
	and s.name not like '%12'	
-- Reports
	Comp Review Report - usp_budgetreport	
    Post comp review report - admin - sql
		SELECT
		CRS_tmpReport.Empl_ID, CRS_tmpReport.LName, CRS_tmpReport.FName, CRS_tmpReport.MIName, CRS_tmpReport.DOPE, CRS_tmpReport.DOT, CRS_tmpReport.ORG, CRS_tmpReport.SU1, CRS_tmpReport.SU2, CRS_tmpReport.SU3, CRS_tmpReport.SU4, CRS_tmpReport.SI2, CRS_tmpReport.PI2, CRS_tmpReport.SI3, CRS_tmpReport.PI3, CRS_tmpReport.RCol3, CRS_tmpReport.Row3, CRS_tmpReport.SI4, CRS_tmpReport.PI4, CRS_tmpReport.RCol4, CRS_tmpReport.Row4, CRS_tmpReport.Bon4, CRS_tmpReport.New_Sal, CRS_tmpReport.New_GR_Step, CRS_tmpReport.Util_Percent, CRS_tmpReport.FullTime_Percent, CRS_tmpReport.Sal2, CRS_tmpReport.Sal3, CRS_tmpReport.Sal_Inc_Tot
		FROM
		CRS.dbo.vw_R_Post_Sal_Review_Report CRS_tmpReport
		ORDER BY
		CRS_tmpReport.LName ASC,
		CRS_tmpReport.FName ASC	
	Post Comp review report - sql
		
		   	
*/	

