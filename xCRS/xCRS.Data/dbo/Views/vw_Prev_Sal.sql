CREATE VIEW dbo.vw_Prev_Sal
AS
SELECT Empl_ID, Sal, Bon_Tot, MAX(Effect_DT) 
    AS EFFECT_DT
FROM dbo.CRS_tblSal_Info
GROUP BY Empl_ID, Sal, Bon_Tot
