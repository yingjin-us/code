CREATE VIEW dbo.vw_PossibleHoursWorked
AS
SELECT     TOP 100 PERCENT EMPL_ID, SUM(ACT_HRS) AS Sum_Act_Hrs
FROM         dbo.DELTEK_LAB_HS
WHERE     (FY_CD = '2002') AND (PD_NO > 7) OR
                      (FY_CD = '2003') AND (PD_NO < 8)
GROUP BY EMPL_ID
HAVING      (EMPL_ID IS NOT NULL) OR
                      (EMPL_ID IS NOT NULL)
ORDER BY SUM(ACT_HRS) DESC
