﻿CREATE VIEW dbo.vw_Sum_HrsByEmpl_FY2004
AS
SELECT     TOP 100 PERCENT EMPL_ID, SUM(ACT_HRS) AS SumActHrs
FROM         dbo.DELTEK_LAB_HS
WHERE     (FY_CD = '2004') AND (PD_NO < 9) AND (LEFT(PROJ_ID, 4) <> '1196')
GROUP BY EMPL_ID
HAVING      (EMPL_ID IS NOT NULL)
ORDER BY SUM(ACT_HRS) DESC
