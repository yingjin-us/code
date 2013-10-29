CREATE VIEW dbo.vw_Current_Sal_Grade_Bon_Info
AS
SELECT dbo.CRS_tblSal_Info.Empl_ID, 
    dbo.CRS_tblSal_Info.Effect_DT, dbo.CRS_tblSal_Info.Sal, 
    dbo.CRS_tblSal_Info.Grade, dbo.CRS_tblSal_Info.Bon_Tot, 
    dbo.CRS_tblSal_Info.Hur_Rate
FROM dbo.CRS_tblSal_Info INNER JOIN
    dbo.vw_Max_Annual_Trans ON 
    dbo.CRS_tblSal_Info.Empl_ID = dbo.vw_Max_Annual_Trans.Empl_ID
     AND 
    dbo.CRS_tblSal_Info.Effect_DT = dbo.vw_Max_Annual_Trans.Effect_DT
