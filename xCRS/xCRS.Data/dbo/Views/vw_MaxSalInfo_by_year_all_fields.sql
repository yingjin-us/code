CREATE VIEW dbo.vw_MaxSalInfo_by_year_all_fields
AS
SELECT     dbo.CRS_tblSal_Info.Empl_ID AS Employee_Id, dbo.CRS_tblSal_Info.Effect_DT, dbo.CRS_tblSal_Info.Hur_Rate, dbo.CRS_tblSal_Info.Sal, 
                      dbo.CRS_tblSal_Info.Sal_Inc, dbo.CRS_tblSal_Info.Per_Inc, dbo.CRS_tblSal_Info.Grade, dbo.CRS_tblSal_Info.Grade_Step, 
                      dbo.vw_MaxSalInfo_by_year.Bon_Tot, dbo.CRS_tblSal_Info.Grade_Category, dbo.CRS_tblSal_Info.Change_Code, 
                      dbo.vw_MaxSalInfo_by_year.Rating_Row, dbo.vw_MaxSalInfo_by_year.Rating_Col, dbo.vw_MaxSalInfo_by_year.Sal_Inc_Tot, 
                      dbo.vw_MaxSalInfo_by_year.Grade_Step AS Grade_Step_Min
FROM         dbo.vw_MaxSalInfo_by_year INNER JOIN
                      dbo.CRS_tblSal_Info ON dbo.vw_MaxSalInfo_by_year.Empl_ID = dbo.CRS_tblSal_Info.Empl_ID AND 
                      dbo.vw_MaxSalInfo_by_year.MaxEffDate = dbo.CRS_tblSal_Info.Effect_DT
