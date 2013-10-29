CREATE VIEW dbo.vw_Max_Annual_Trans
AS
SELECT Empl_ID, Change_Code, MAX(Effect_DT) 
    AS Effect_DT
FROM dbo.CRS_tblSal_Info
GROUP BY Empl_ID, Change_Code
HAVING (Change_Code = 'A')
