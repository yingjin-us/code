create                              procedure [dbo].[usp_exportData_100312]
	@tableName varchar(25)
AS
Declare @tbl varchar(25)

SELECT @tbl = lower(@tableName)

if @tbl='education'
	
SELECT     dbo.CRS_tblEmployee_Education.Empl_ID [WESTAT ID], vw_Empl_Info.ORG_ID, 
		dbo.vw_Empl_Info.LAST_NAME [LAST NAME], dbo.vw_Empl_Info.FIRST_NAME [FIRST NAME],
		 dbo.CRS_tblEmployee_Education.Degree_Code AS DEGREE, dbo.CRS_lkpDegree.Degree AS DESCRIPTION, 
                      dbo.CRS_tblEmployee_Education.Major AS MAJOR, dbo.CRS_tblEmployee_Education.Minor AS MINOR, 
                      dbo.CRS_tblEmployee_Education.School AS INSTITUTION, dbo.CRS_tblEmployee_Education.Date_Completed AS [COMPLETED DATE] 
FROM         dbo.CRS_tblEmployee_Education INNER JOIN
                      dbo.CRS_lkpDegree ON dbo.CRS_lkpDegree.Degree_ID = dbo.CRS_tblEmployee_Education.Degree_ID INNER JOIN
                      dbo.vw_Empl_Info ON dbo.CRS_tblEmployee_Education.Empl_ID = dbo.vw_Empl_Info.EMPL_ID

else if @tbl='famcode'
	select empl_id, org_id, last_name, first_name,  family_code, sub_unit
		from vw_empl_info
	where (family_code is not null OR sub_unit is not null)

else if @tbl='experience'
		
	SELECT     	dbo.CRS_tblEmployee_Experience.Empl_ID [WESTAT ID], vw_Empl_Info.ORG_ID,
		dbo.vw_Empl_Info.LAST_NAME [LAST NAME], dbo.vw_Empl_Info.FIRST_NAME [FIRST NAME],
		dbo.CRS_tblEmployee_Experience.Prior_Employer AS [PRIOR EMPLOYER], dbo.CRS_tblEmployee_Experience.Prior_Position AS [PRIOR POSITION], 
                dbo.CRS_tblEmployee_Experience.Start_Date_of_Employement AS [START DATE OF EMPLOYMENT], 
                dbo.CRS_tblEmployee_Experience.End_Date_of_Employement AS [END DATE OF EMPLOYMENT], 
                dbo.CRS_tblEmployee_Experience.Employement_code AS TYPE, dbo.CRS_tblEmployee_Experience.Yearsof_Exp AS YEARS
	FROM    dbo.CRS_tblEmployee_Experience INNER JOIN
                dbo.vw_Empl_Info ON dbo.CRS_tblEmployee_Experience.Empl_ID = dbo.vw_Empl_Info.EMPL_ID
else if @tbl='salary' 
	/*SELECT     dbo.vw_Empl_Info.LAST_NAME AS LastName, dbo.vw_Empl_Info.FIRST_NAME AS FirstName, dbo.CRS_tblSal_Info.*
	FROM         dbo.CRS_tblSal_Info INNER JOIN
	                      dbo.vw_Empl_Info ON dbo.CRS_tblSal_Info.Empl_ID = dbo.vw_Empl_Info.EMPL_ID */
	SELECT     e.LAST_NAME AS LastName, e.FIRST_NAME AS FirstName,
			CRS_tblSal_Info.Empl_ID,
			Effect_DT,
			Hur_Rate,
			Sal,
			Sal_Inc,
			Per_Inc,
			Grade,
			dbo.CRS_tblSal_Info.Grade_Step,
			Rating_Col,
			Rating_Row,
			Bon_Tot,
			CRS_tblSal_Info.Grade_Category,
			Change_Code,
			UpdateID,
			UpdateDate,
			ReviewYear,
			Perf_Rating,
			Growth_Rating
FROM         dbo.CRS_tblSal_Info INNER JOIN
				--mb 12/09/2007 
				--changed the view from vw_empl_info to vw_AllStaffSalary_Info
				--shows all staff including BRD
	                      dbo.vw_AllStaffSalary_Info e ON 
		dbo.CRS_tblSal_Info.Empl_ID = e.EMPL_ID --and LAST_NAME = 'ROG'
else if @tbl='employee'
	select v.EMPL_ID,LAST_NAME,FIRST_NAME,TERM_DT,
		v.ORG_ID,Rev_Code,DOG,ACTIVE,
		v.fldReviewProcess,
		v.CompReviewType, perf_review,
		v.Archived,
		i.paytype_code,
		(select sal from CRS_tblSal_Info t where t.empl_id = v.empl_id and t.effect_dt = (select max(effect_dt) from CRS_tblSal_Info where empl_id = v.empl_id)) CRS_ANNL_AMT,
		v.SAL_GRADE_CD CRS_SAL_GRADE_CD,	
		l.ANNL_AMT CP_ANNL_AMT,
		l.SAL_GRADE_CD CP_SAL_GRADE_CD,SU1,SU1_Name,SU2,SU2_Name,SU3,SU3_Name,SU4,SU4_Name,DOE,Util_Percent,
		FullTime_Percent,
		DOSE,DOR, 
		v.title_code, Grade_Category FROM 
	        dbo.vw_AllStaffSalary_Info v, dbo.DELTEK_EMPL_LAB_INFO l, idmaster i
		where l.empl_id = v.empl_id and l.end_dt = '31-Dec-2078'
			and i.idmaster_westatid = v.empl_id
else if @tbl='allstaffbonus'
	SELECT  c.empl_id, c.lastname, c.firstname, d.org, c.DOSE, c.cur_sal, c.cur_grade, 
	c.charged_hrs, c.AllStaffBonus as al1, c.FloatHolidayBonus
	FROM         crs_lkpallstaffbonus c
		inner join crs_tmpreport_downloaded d on c.empl_id=d.empl_id	
else if @tbl='newallstaffbonus'
	SELECT  c.empl_id, c.lastname, c.firstname, d.org, c.DOSE, c.cur_sal, c.cur_grade, 
	c.charged_hrs, c.AllStaffBonus , c.FloatHolidayBonus
	FROM         crs_lkpallstaffbonus c
		inner join crs_tmpreport_downloaded d on c.empl_id=d.empl_id	
else if @tbl='budgetreport'
	SELECT     a.Empl_ID, LName, FName, ORG, a.Active, DOSE,  DOT, BudgetGrade, BudgetSalary, 
		BudgetBonus, e.name ReviewType
	FROM         dbo.CRS_tmpReport_Downloaded a
	inner join crs_tblempl_info c
	on c.empl_id = a.Empl_ID 
	inner join CRS_lkpCompReviewType e on e.id=c.CompReviewType
	WHERE      (a.Active = 1 and DOT is null)
					AND org like '%.1'
else if @tbl='bonusexport'
	select b.empl_id [Westat ID], c.lname [Last Name], c.fname [First Name], c.ORG,  b.bon_type [Type] , b.bon_amt [Bonus Amount]
	from	crs_tblbon_info_downloaded b
	inner join crs_tmpreport_downloaded c
		on c.empl_id=b.empl_id
else if @tbl = 'bonushistory'
    select Empl_ID, Effect_DT, Bon_Type, Bon_Amt, ReviewYear from crs_tblbon_info 
else if @tbl='approvallist'
	select v.empl_id, v.last_name, v.first_name, v.org_id, c1.approvedby
		from crs_tblAreaHeadApprovalList c1 right outer join vw_empl_info v on
		v.empl_id = c1.empl_id 
		where v.active=1
	order by v.org_id, v.last_name, v.first_name
else if @tbl='reportexport'
	select * from crs_tmpreport_downloaded
else if @tbl='exportpaidlvlbensemi'
	select c.*, (select count(*) from crs_tbl_Paid_leave_benefit_py_checks where iseligible=1 and empl_id=a.empl_id) as YOS, 
		b.*, l.org_id, i.paytype_code, i.idmaster_lastname, i.idmaster_firstname
	from crs_lkpPaid_leave_benefit_eligibility a, crs_lkpPaid_leave_benefit_category b, 
			crs_tbl_Paidbenefit_data c, cpprod..DELTEK.EMPL_LAB_INFO l, 
			issql1.wisdom.dbo.idmaster i
	where 
		a.category = b.category
		and b.ts_pd_cd='SEMI'
		and a.category is not null
		and a.empl_id=l.empl_id and l.end_dt='31-Dec-2078'
		and a.empl_id=i.idmaster_westatid
		and a.empl_id = c.empl_id
else if @tbl='exportpaidlvlbenspstrc'
	select c.*, (select count(*) from crs_tbl_Paid_leave_benefit_py_checks where iseligible=1 and empl_id=a.empl_id) as YOS, 
		b.*, l.org_id, i.paytype_code, i.idmaster_lastname, i.idmaster_firstname
	from crs_lkpPaid_leave_benefit_eligibility a, crs_lkpPaid_leave_benefit_category b, 
			crs_tbl_Paidbenefit_data c, cpprod..DELTEK.EMPL_LAB_INFO l, 
			issql1.wisdom.dbo.idmaster i
	where 
		a.category = b.category
		and b.ts_pd_cd='SPSTRC'
		and a.category is not null
		and a.empl_id=l.empl_id and l.end_dt='31-Dec-2078'
		and a.empl_id=i.idmaster_westatid
		and a.empl_id = c.empl_id
else if @tbl='uploadreport'
	SELECT     Username, Empl_ID, AllowUpload, DownloadTimeStamp, UploadTimeStamp, status
	FROM         dbo.CRS_Users
		WHERE     (UploadTimeStamp IS NOT NULL) AND (AllowUpload = 1)
else if @tbl='users'
	--SELECT * 	FROM dbo.CRS_Users
	SELECT u.*, el.org_id 	FROM dbo.CRS_Users u, DELTEK_EMPL_LAB_INFO el
	where u.empl_id = el.empl_id
	and getdate() between effect_dt and end_dt
else if @tbl='projsalguidelines'
	select * from CRS_lkpSal_Inc_Guidlines
else if @tbl='CRS_lkprcode'
	select * from CRS_lkprcode		
else if @tbl='supportsalguidelines'
	select * from dbo.CRS_lkpSupp_Sal_Inc_Guidlines 
else if @tbl = 'NewPsupChanges'
    select np.empl_id, np.name, v.su1 as oldpsup, np.newpsupcode as newpusup, v.org_id 
	from vw_empl_info v, crs_tblnewpsup np 
	where v.empl_id = np.empl_id
else if @tbl = 'employeewithnotes'
	select t.empl_id, t.org, t.LName, t.FName, t.cur_grade, t.new_grade, s.notes 
	from crs_tmpreport_downloaded t, CRS_tblSal_Info_Downloaded s
	where t.empl_id = s.empl_id	
else if @tbl ='gradedrop'
	select d.Empl_id, d.LName, d.Fname, d.Cur_Grade, d.New_Grade from dbo.crs_tmpreport_downloaded d
where d.new_grade < d.cur_grade
else if @tbl = 'bonusguidelines'
   select * from crs_lkpBonusGuidelines
else if @tbl = 'GradePromotionNotes'
   select Empl_ID,LName,FName,ORG,Notes from crs_tmpreport_downloaded where len(notes) > 0
else if @tbl = 'FamilyCodeDifferences'
   select e.empl_id, e.family_code as Empl_Family_Code, t.Family_code as Report_Family_code  from
   crs_tblempl_info e, crs_tmpreport_downloaded t
   where e.empl_id = t.empl_id
   and case when e.family_code is null then '' else e.family_code end <> case when t.family_code is null then '' else T.family_code end
else
	RAISERROR ('Table Name parameter not specified', 16, 1) WITH NOWAIT


--SELECT * FROM [CRS_lkpExportData]
--insert into CRS_lkpExportData	values ('New All Staff Bonus', 'newallstaffbonus', 1)
update CRS_lkpExportData set IsActive=0 where tablename='allstaffbonus'
update CRS_lkpExportData set captionname='All Staff Bonus' where tablename='newallstaffbonus'




























