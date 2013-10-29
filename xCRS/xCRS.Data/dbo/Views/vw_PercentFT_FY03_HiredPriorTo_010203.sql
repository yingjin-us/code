CREATE VIEW dbo.vw_PercentFT_FY03_HiredPriorTo_010203
AS
SELECT     TOP 100 PERCENT dbo.vw_DELTEK_EMPL_HireDate_before_010203.EMPL_ID, dbo.vw_DELTEK_EMPL_HireDate_before_010203.ORIG_HIRE_DT, 
                      dbo.vw_Sum_HrsByEmpl_FY2003.SumActHrs, dbo.vw_Sum_HrsByEmpl_FY2003.SumActHrs / 1880 * 100 AS PercentFT
FROM         dbo.vw_DELTEK_EMPL_HireDate_before_010203 INNER JOIN
                      dbo.vw_Sum_HrsByEmpl_FY2003 ON 
                      dbo.vw_DELTEK_EMPL_HireDate_before_010203.EMPL_ID = dbo.vw_Sum_HrsByEmpl_FY2003.EMPL_ID
ORDER BY dbo.vw_Sum_HrsByEmpl_FY2003.SumActHrs / 1880 * 100 DESC
