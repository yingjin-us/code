CREATE    Procedure usp_getEduExpforReport
	@EmplID as varchar(10)
AS
SELECT     dbo.CRS_tblEmployee_Education.Degree_Code, dbo.CRS_tblEmployee_Education.Empl_ID, dbo.CRS_tblEmployee_Education.Degree_ID, 
                      dbo.CRS_tblEmployee_Education.Degree_Desc, dbo.CRS_tblEmployee_Education.School, dbo.CRS_tblEmployee_Education.Major, 
                      dbo.CRS_tblEmployee_Education.Minor, dbo.CRS_tblEmployee_Education.Date_Completed, dbo.CRS_tblEmployee_Experience.Prior_Employer, 
                      dbo.CRS_tblEmployee_Experience.Prior_Position, dbo.CRS_tblEmployee_Experience.Employement_code, 
                      dbo.CRS_tblEmployee_Experience.Date_of_Employement, dbo.CRS_tblEmployee_Experience.Experience_code, dbo.vw_Empl_Info.LAST_NAME, 
                      dbo.vw_Empl_Info.FIRST_NAME
FROM         dbo.CRS_lkpEmployement_Type RIGHT OUTER JOIN
                      dbo.vw_Empl_Info INNER JOIN
                      dbo.CRS_tblEmployee_Experience ON dbo.vw_Empl_Info.EMPL_ID = dbo.CRS_tblEmployee_Experience.Empl_ID INNER JOIN
                      dbo.CRS_tblEmployee_Education ON dbo.vw_Empl_Info.EMPL_ID = dbo.CRS_tblEmployee_Education.Empl_ID ON 
                      dbo.CRS_lkpEmployement_Type.Employement_code = dbo.CRS_tblEmployee_Experience.Employement_code LEFT OUTER JOIN
                      dbo.CRS_lkpDegree ON dbo.CRS_tblEmployee_Education.Degree_Code = dbo.CRS_lkpDegree.Degree

WHERE     (dbo.CRS_tblEmployee_Education.Empl_ID = @EmplID)
ORDER BY dbo.CRS_lkpDegree.Degree_ID, dbo.CRS_tblEmployee_Education.empl_ID
