




CREATE      procedure [dbo].[usp_worksheet_EmployeeEduData]
	
As


SELECT     d.RecordID as Degree_ID, d.DegreeType as Degree_Desc, d.School, 
                      d.Major, d.Minor, d.DegreeDate as Date_Completed, 
                      d.DegreeID as Degree_Code, dbo.vw_Empl_Info.LAST_NAME + ', ' +  dbo.vw_Empl_Info.FIRST_NAME NAME, dbo.vw_Empl_Info.EMPL_ID, 
                      dbo.vw_Empl_Info.ORG_ID, dbo.vw_Empl_Info.SAL_GRADE_CD
FROM         wisdom_EmployeeDegree d INNER JOIN
                      dbo.vw_Empl_Info ON d.employeeID = dbo.vw_Empl_Info.EMPL_ID

/*
SELECT     dbo.CRS_tblEmployee_Education.Degree_ID, dbo.CRS_tblEmployee_Education.Degree_Desc, dbo.CRS_tblEmployee_Education.School, 
                      dbo.CRS_tblEmployee_Education.Major, dbo.CRS_tblEmployee_Education.Minor, dbo.CRS_tblEmployee_Education.Date_Completed, 
                      dbo.CRS_tblEmployee_Education.Degree_Code, dbo.vw_Empl_Info.LAST_NAME + ', ' +  dbo.vw_Empl_Info.FIRST_NAME NAME, dbo.vw_Empl_Info.EMPL_ID, 
                      dbo.vw_Empl_Info.ORG_ID, dbo.vw_Empl_Info.SAL_GRADE_CD
FROM         dbo.CRS_tblEmployee_Education INNER JOIN
                      dbo.vw_Empl_Info ON dbo.CRS_tblEmployee_Education.Empl_ID = dbo.vw_Empl_Info.EMPL_ID
                      */
	



