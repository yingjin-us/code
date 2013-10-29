create procedure [dbo].[usp_comp_history_rpt_excel]
as
SELECT
    CRS_tmpReport.Empl_ID, CRS_tmpReport.LName, CRS_tmpReport.FName, CRS_tmpReport.MIName, CRS_tmpReport.DOPE, CRS_tmpReport.DOT, CRS_tmpReport.Active, CRS_tmpReport.ORG, CRS_tmpReport.SU1, CRS_tmpReport.SU2, CRS_tmpReport.SU3, CRS_tmpReport.SU4, CRS_tmpReport.SI2, CRS_tmpReport.PI2, CRS_tmpReport.Bon2, CRS_tmpReport.SI3, CRS_tmpReport.PI3, CRS_tmpReport.RCol3, CRS_tmpReport.Row3, CRS_tmpReport.Bon3, CRS_tmpReport.Cur_Sal, CRS_tmpReport.Cur_Grade, CRS_tmpReport.Cur_GR_Step, CRS_tmpReport.Cur_Rate, CRS_tmpReport.Util_Percent, CRS_tmpReport.FullTime_Percent, CRS_tmpReport.Sal2, CRS_tmpReport.Sal3, CRS_tmpReport.Sal_Inc_Tot, CRS_tmpReport.GR_Step2
FROM
    CRS.dbo.CRS_tmpReport_Downloaded CRS_tmpReport
ORDER BY
    CRS_tmpReport.Cur_Sal DESC,
    CRS_tmpReport.LName ASC,
    CRS_tmpReport.FName ASC
