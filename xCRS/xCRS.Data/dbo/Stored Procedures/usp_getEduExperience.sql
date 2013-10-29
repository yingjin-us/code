









CREATE           Procedure usp_getEduExperience
AS


SELECT     TOP 100 PERCENT dbo.CRS_tblEmpExperience.ID AS EXP_ID, dbo.CRS_tblEmpExperience.Recent_employer, 
                      dbo.CRS_tblEmpExperience.Recent_Position, dbo.CRS_tblEmpl_Info.Years_of_Exp, dbo.CRS_tblEmpEducation.ID AS EDU_ID, 
                      dbo.CRS_tblEmpEducation.Degree_ID, dbo.CRS_tblEmpEducation.Degree_Month, dbo.CRS_tblEmpEducation.Degree_year, 
                      dbo.CRS_tblEmpEducation.Field_of_study, dbo.CRS_tblEmpEducation.School, dbo.CRS_lkpDegree.Degree, dbo.CRS_lkpDegree.Degree_Code, 
                      dbo.CRS_tblEmpEducation.Empl_ID
FROM         dbo.CRS_tblEmpl_Info RIGHT OUTER JOIN
                      dbo.CRS_lkpDegree INNER JOIN
                      dbo.CRS_tblEmpEducation ON dbo.CRS_lkpDegree.Degree_ID = dbo.CRS_tblEmpEducation.Degree_ID LEFT OUTER JOIN
                      dbo.CRS_tblEmpExperience ON dbo.CRS_tblEmpEducation.Empl_ID = dbo.CRS_tblEmpExperience.Empl_ID ON 
                      dbo.CRS_tblEmpl_Info.Empl_ID = dbo.CRS_tblEmpEducation.Empl_ID
	--WHERE     (dbo.CRS_tblEmpEducation.Empl_ID = '1004237')
ORDER BY dbo.CRS_lkpDegree.Degree_ID











