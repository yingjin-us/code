CREATE VIEW dbo.vw_R_Sal_Info
AS
SELECT Empl_ID, Effect_DT, Sal, Sal_Inc, Per_Inc, Grade, 
    Rating_Col, Rating_Row, Bon_Tot, Grade_Category, 
    Change_Code
FROM dbo.CRS_tblSal_Info
WHERE (Change_Code = 'A')
