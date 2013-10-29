CREATE VIEW dbo.vw_CRS_tblSal_Info_MaxEffDate_all_fields
AS
SELECT     dbo.CRS_tblSal_Info.Empl_ID, dbo.CRS_tblSal_Info.Effect_DT, dbo.CRS_tblSal_Info.Hur_Rate, dbo.CRS_tblSal_Info.Sal, dbo.CRS_tblSal_Info.Sal_Inc, 
                      dbo.CRS_tblSal_Info.Per_Inc, dbo.CRS_tblSal_Info.Grade, dbo.CRS_tblSal_Info.Grade_Step, dbo.CRS_tblSal_Info.Rating_Col, 
                      dbo.CRS_tblSal_Info.Rating_Row, dbo.CRS_tblSal_Info.Bon_Tot, dbo.CRS_tblSal_Info.Grade_Category, dbo.CRS_tblSal_Info.Change_Code
FROM         dbo.vw_CRS_tblSal_Info_MaxEffDate INNER JOIN
                      dbo.CRS_tblSal_Info ON dbo.vw_CRS_tblSal_Info_MaxEffDate.Empl_ID = dbo.CRS_tblSal_Info.Empl_ID AND 
                      dbo.vw_CRS_tblSal_Info_MaxEffDate.MaxEffDate = dbo.CRS_tblSal_Info.Effect_DT
