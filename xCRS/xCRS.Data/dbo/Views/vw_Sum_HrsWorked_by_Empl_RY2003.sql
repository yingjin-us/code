CREATE VIEW dbo.vw_Sum_HrsWorked_by_Empl_RY2003
AS
SELECT     TOP 100 PERCENT EMPL_ID, SUM(Sum_Act_Hrs) AS Sum_Hrs
FROM         dbo.vw_Sum_Act_Hrs_by_Empl_ReviewYear_2003
GROUP BY EMPL_ID
ORDER BY EMPL_ID
