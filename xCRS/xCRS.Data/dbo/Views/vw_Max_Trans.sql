CREATE VIEW dbo.vw_Max_Trans
AS
SELECT     Empl_ID, MAX(Effect_DT) AS MaxTransDate
FROM         dbo.CRS_tblSal_Info
GROUP BY Empl_ID
