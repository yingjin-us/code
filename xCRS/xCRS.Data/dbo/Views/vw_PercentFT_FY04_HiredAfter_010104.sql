CREATE VIEW dbo.vw_PercentFT_FY04_HiredAfter_010104
AS
SELECT     TOP 100 PERCENT dbo.vw_DELTEK_EMPL_HireDate_after_010104.EMPL_ID, dbo.vw_DELTEK_EMPL_HireDate_after_010104.ORIG_HIRE_DT, 
                      dbo.vw_Sum_HrsByEmpl_FY2004.SumActHrs, dbo.vw_Sum_HrsByEmpl_FY2004.SumActHrs / ((DATEDIFF(d, 
                      dbo.vw_DELTEK_EMPL_HireDate_after_010104.ORIG_HIRE_DT, CONVERT(DATETIME, '2004-08-26 00:00:00', 102)) + 2) * 5 / 7 * 8) * 100 AS PercentFT, 
                      (DATEDIFF(d, dbo.vw_DELTEK_EMPL_HireDate_after_010104.ORIG_HIRE_DT, CONVERT(DATETIME, '2004-08-26 00:00:00', 102)) + 2) 
                      * 5 / 7 * 8 AS PossibleHours
FROM         dbo.vw_DELTEK_EMPL_HireDate_after_010104 INNER JOIN
                      dbo.vw_Sum_HrsByEmpl_FY2004 ON dbo.vw_DELTEK_EMPL_HireDate_after_010104.EMPL_ID = dbo.vw_Sum_HrsByEmpl_FY2004.EMPL_ID
WHERE     ((DATEDIFF(d, dbo.vw_DELTEK_EMPL_HireDate_after_010104.ORIG_HIRE_DT, CONVERT(DATETIME, '2004-08-26 00:00:00', 102)) + 2) * 5 / 7 * 8 > 0)
ORDER BY dbo.vw_Sum_HrsByEmpl_FY2004.SumActHrs / ((DATEDIFF(d, dbo.vw_DELTEK_EMPL_HireDate_after_010104.ORIG_HIRE_DT, CONVERT(DATETIME, 
                      '2004-08-26 00:00:00', 102)) + 2) * 5 / 7 * 8) * 100 DESC
