

create   procedure usp_comp_worksheet_EmployeeEduData
	@Empl_ID varchar(12)
As

SELECT     dbo.CRS_tblEmployee_Education.Degree_ID, dbo.CRS_tblEmployee_Education.Degree_Desc, dbo.CRS_tblEmployee_Education.School, 
                      dbo.CRS_tblEmployee_Education.Major, dbo.CRS_tblEmployee_Education.Minor, dbo.CRS_tblEmployee_Education.Date_Completed, 
                      dbo.CRS_tblEmployee_Education.Degree_Code, dbo.vw_Empl_Info.LAST_NAME + ', ' +  dbo.vw_Empl_Info.FIRST_NAME NAME, dbo.vw_Empl_Info.EMPL_ID, 
                      dbo.vw_Empl_Info.ORG_ID, dbo.vw_Empl_Info.SAL_GRADE_CD,
			(select sum(cast(Yearsof_Exp as float(2))) from dbo.CRS_tblEmployee_Experience where 
				Yearsof_Exp is not null and empl_id=dbo.CRS_tblEmployee_Education.Empl_ID) yearsofexp
FROM         dbo.CRS_tblEmployee_Education INNER JOIN
                      dbo.vw_Empl_Info ON dbo.CRS_tblEmployee_Education.Empl_ID = dbo.vw_Empl_Info.EMPL_ID
	where (dbo.vw_Empl_Info.EMPL_ID =@Empl_ID)

