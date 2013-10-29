CREATE VIEW dbo.vw_MaxSalInfo_by_rev_year_all_fields_Upload
AS
SELECT     TOP 100 PERCENT dbo.CRS_tblSal_Info.Empl_ID AS Employee_Id, dbo.vw_MaxSalInfo_by_rev_year.ReviewYear, dbo.CRS_tblSal_Info.Effect_DT, 
                      dbo.CRS_tblSal_Info.Hur_Rate, dbo.CRS_tblSal_Info.Sal, dbo.CRS_tblSal_Info.Sal_Inc, dbo.CRS_tblSal_Info.Per_Inc, dbo.CRS_tblSal_Info.Grade, 
                      dbo.CRS_tblSal_Info.Grade_Step, dbo.vw_MaxSalInfo_by_rev_year.Bon_Tot, dbo.CRS_tblSal_Info.Grade_Category, 
                      dbo.CRS_tblSal_Info.Change_Code, dbo.vw_MaxSalInfo_by_rev_year.Rating_Row, dbo.vw_MaxSalInfo_by_rev_year.Rating_Col, 
                      dbo.vw_MaxSalInfo_by_rev_year.Sal_Inc_Tot, dbo.vw_MaxSalInfo_by_rev_year.Grade_Step AS Grade_Step_Min, dbo.CRS_tblSal_Info.Notes, 
                      dbo.CRS_tblSal_Info.Perf_Rating, dbo.CRS_tblSal_Info.Growth_Rating, dbo.IDMaster.IDMaster_WestatID_Supervisor4 AS SU4_ID, 
                      dbo.IDMaster.IDMaster_WestatID_Supervisor3 AS SU3_ID, dbo.IDMaster.IDMaster_WestatID_Supervisor2 AS SU2_ID, 
                      dbo.IDMaster.IDMaster_WestatID_Supervisor AS SU1_ID
FROM         dbo.vw_MaxSalInfo_by_rev_year INNER JOIN
                      dbo.CRS_tblSal_Info ON dbo.vw_MaxSalInfo_by_rev_year.Empl_ID = dbo.CRS_tblSal_Info.Empl_ID AND 
                      dbo.vw_MaxSalInfo_by_rev_year.MaxEffDate = dbo.CRS_tblSal_Info.Effect_DT INNER JOIN
                      dbo.IDMaster ON dbo.CRS_tblSal_Info.Empl_ID = dbo.IDMaster.IDMaster_WestatID
