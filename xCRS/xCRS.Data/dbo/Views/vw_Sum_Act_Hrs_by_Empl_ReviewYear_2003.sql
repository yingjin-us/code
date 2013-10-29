﻿CREATE VIEW dbo.vw_Sum_Act_Hrs_by_Empl_ReviewYear_2003
AS
SELECT     TOP 100 PERCENT EMPL_ID, SUM(ACT_HRS) AS Sum_Act_Hrs, LEFT(PROJ_ID, 4) AS ProjTopLvl
FROM         dbo.DELTEK_LAB_HS
WHERE     (FY_CD = '2002') AND (PD_NO > 7) OR
                      (FY_CD = '2003') AND (PD_NO < 8)
GROUP BY EMPL_ID, LEFT(PROJ_ID, 4)
HAVING      (EMPL_ID IS NOT NULL) AND (LEFT(PROJ_ID, 4) <> '1196') OR
                      (EMPL_ID IS NOT NULL) AND (LEFT(PROJ_ID, 4) <> '1196')
ORDER BY EMPL_ID, LEFT(PROJ_ID, 4)