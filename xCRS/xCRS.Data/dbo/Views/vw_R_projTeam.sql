create view vw_R_projTeam AS
SELECT    Empl_ID, Proj_ID
FROM         dbo.CRS_tblProjTeam
GROUP BY Empl_ID, Proj_ID
