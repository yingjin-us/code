Create Procedure usp_Sum_HrsByEmpl_FY2004 @pd_month as integer
AS
SELECT     TOP 10 EMPL_ID, SUM(ACT_HRS) AS SumActHrs
FROM         cpprod..DELTEK.LAB_HS
WHERE     (FY_CD = '2004') AND (PD_NO = @pd_month) AND (LEFT(PROJ_ID, 4) <> '1196')
GROUP BY EMPL_ID
HAVING      (EMPL_ID IS NOT NULL)
ORDER BY SUM(ACT_HRS) DESC
