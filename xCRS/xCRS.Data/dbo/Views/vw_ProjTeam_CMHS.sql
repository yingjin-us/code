﻿CREATE VIEW dbo.vw_ProjTeam_CMHS
AS
SELECT     EMPL_ID
FROM         dbo.vw_LAB_HS_Sum_Hrs_GreaterThan_400
WHERE     (ProjPrefix = '7277')