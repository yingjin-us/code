CREATE VIEW dbo.vw_LAB_HS_ProjHrs_ReviewYear2003
AS
SELECT     EMPL_ID, FY_CD, PD_NO, PROJ_ID, ACT_HRS, LEFT(PROJ_ID, 4) AS ProjPrefix
FROM         dbo.DELTEK_LAB_HS
WHERE     (FY_CD = '2002') AND (PD_NO > 7) AND (LEFT(PROJ_ID, 4) = '7150' OR
                      LEFT(PROJ_ID, 4) = '7690' OR
                      LEFT(PROJ_ID, 4) = '9851' OR
                      LEFT(PROJ_ID, 4) = '7707' OR
                      LEFT(PROJ_ID, 4) = '7301' OR
                      LEFT(PROJ_ID, 4) = '9098' OR
                      LEFT(PROJ_ID, 4) = '9363' OR
                      LEFT(PROJ_ID, 4) = '7277' OR
                      LEFT(PROJ_ID, 4) = '7648' OR
                      LEFT(PROJ_ID, 4) = '7008' OR
                      LEFT(PROJ_ID, 4) = '7433' OR
                      LEFT(PROJ_ID, 4) = '7681' OR
                      LEFT(PROJ_ID, 4) = '7167') OR
                      (FY_CD = '2003') AND (PD_NO < 8) AND (LEFT(PROJ_ID, 4) = '7150' OR
                      LEFT(PROJ_ID, 4) = '7690' OR
                      LEFT(PROJ_ID, 4) = '9851' OR
                      LEFT(PROJ_ID, 4) = '7707' OR
                      LEFT(PROJ_ID, 4) = '7301' OR
                      LEFT(PROJ_ID, 4) = '9098' OR
                      LEFT(PROJ_ID, 4) = '9363' OR
                      LEFT(PROJ_ID, 4) = '7277' OR
                      LEFT(PROJ_ID, 4) = '7648' OR
                      LEFT(PROJ_ID, 4) = '7008' OR
                      LEFT(PROJ_ID, 4) = '7433' OR
                      LEFT(PROJ_ID, 4) = '7681' OR
                      LEFT(PROJ_ID, 4) = '7167')
