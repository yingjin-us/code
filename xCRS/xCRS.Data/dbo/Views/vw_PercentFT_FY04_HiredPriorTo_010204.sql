CREATE VIEW dbo.vw_PercentFT_FY04_HiredPriorTo_010204
AS
SELECT     TOP 100 PERCENT dbo.vw_DELTEK_EMPL_HireDate_before_010204.EMPL_ID, dbo.vw_DELTEK_EMPL_HireDate_before_010204.ORIG_HIRE_DT, 
                      dbo.vw_Sum_HrsByEmpl_FY2004.SumActHrs, dbo.vw_Sum_HrsByEmpl_FY2004.SumActHrs / 1360 * 100 AS PercentFT
FROM         dbo.vw_DELTEK_EMPL_HireDate_before_010204 INNER JOIN
                      dbo.vw_Sum_HrsByEmpl_FY2004 ON 
                      dbo.vw_DELTEK_EMPL_HireDate_before_010204.EMPL_ID = dbo.vw_Sum_HrsByEmpl_FY2004.EMPL_ID
ORDER BY dbo.vw_Sum_HrsByEmpl_FY2004.SumActHrs / 1360 * 100 DESC
