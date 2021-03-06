﻿CREATE VIEW dbo.vw_LAB_HS_Sum_Hrs_GreaterThan_400
AS
SELECT     TOP 100 PERCENT EMPL_ID, ProjPrefix, SUM(ACT_HRS) AS Sum_Hrs
FROM         dbo.vw_LAB_HS_ProjHrs_ReviewYear2003
GROUP BY EMPL_ID, ProjPrefix
HAVING      (SUM(ACT_HRS) > 400) AND (EMPL_ID IS NOT NULL)
ORDER BY ProjPrefix, EMPL_ID
