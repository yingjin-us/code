CREATE VIEW dbo.vw_ProjTeam_DAWN
AS
SELECT DISTINCT EMPL_ID
FROM         dbo.vw_LAB_HS_Sum_Hrs_GreaterThan_400
WHERE     (ProjPrefix = '7648') OR
                      (ProjPrefix = '7008')
