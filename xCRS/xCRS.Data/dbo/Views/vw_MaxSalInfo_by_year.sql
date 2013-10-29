CREATE VIEW dbo.vw_MaxSalInfo_by_year
  
AS
SELECT     dbo.CRS_tblSal_Info.Empl_ID, dbo.CRS_lkpReviewYear.Review_Year, MAX(dbo.CRS_tblSal_Info.Effect_DT) AS MaxEffDate, 
                      MAX(dbo.CRS_tblSal_Info.Rating_Col) AS Rating_Col, MAX(dbo.CRS_tblSal_Info.Rating_Row) AS Rating_Row, SUM(dbo.CRS_tblSal_Info.Bon_Tot) 
                      AS Bon_Tot, SUM(dbo.CRS_tblSal_Info.Sal_Inc) AS Sal_Inc_Tot, MIN(dbo.CRS_tblSal_Info.Grade_Step) AS Grade_Step
FROM         dbo.CRS_tblSal_Info CROSS JOIN
                      dbo.CRS_lkpReviewYear
WHERE     (dbo.CRS_tblSal_Info.Effect_DT BETWEEN dbo.CRS_lkpReviewYear.Start_Dt AND dbo.CRS_lkpReviewYear.End_dt)
GROUP BY dbo.CRS_tblSal_Info.Empl_ID, dbo.CRS_lkpReviewYear.Review_Year
