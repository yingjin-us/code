CREATE VIEW dbo.vw_CRS_tblSal_Info_MaxEffDate
AS
SELECT     Empl_ID, MAX(Effect_DT) AS MaxEffDate
FROM         dbo.CRS_tblSal_Info
GROUP BY Empl_ID
