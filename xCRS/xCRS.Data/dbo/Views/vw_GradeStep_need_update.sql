CREATE VIEW dbo.vw_GradeStep_need_update
AS
SELECT     TOP 100 PERCENT dbo.CRS_tblSal_Info.Empl_ID, dbo.CRS_tblSal_Info.Effect_DT, dbo.CRS_tblSal_Info.Grade, dbo.CRS_tblSal_Info.Grade_Step, 
                      dbo.CRS_lkpGrade_Step.Grade AS GrStep, LEFT(dbo.CRS_lkpGrade_Step.Grade, 2) AS Grade_left
FROM         dbo.vw_CRS_tblSal_Info_MaxEffDate INNER JOIN
                      dbo.CRS_tblSal_Info ON dbo.vw_CRS_tblSal_Info_MaxEffDate.Empl_ID = dbo.CRS_tblSal_Info.Empl_ID AND 
                      dbo.vw_CRS_tblSal_Info_MaxEffDate.MaxEffDate = dbo.CRS_tblSal_Info.Effect_DT INNER JOIN
                      dbo.CRS_lkpGrade_Step ON dbo.CRS_tblSal_Info.Sal = dbo.CRS_lkpGrade_Step.Sal AND 
                      dbo.CRS_tblSal_Info.Grade = LEFT(dbo.CRS_lkpGrade_Step.Grade, 2)
WHERE     (dbo.CRS_tblSal_Info.Grade_Step IS NULL) AND (dbo.CRS_tblSal_Info.Grade > N'""') AND (dbo.CRS_tblSal_Info.Grade <> N'17')
ORDER BY dbo.CRS_tblSal_Info.Effect_DT
