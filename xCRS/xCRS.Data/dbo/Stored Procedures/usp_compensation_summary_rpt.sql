CREATE        Procedure usp_compensation_summary_rpt
	@RevYear as varchar(5)
AS
SELECT     TOP 100 PERCENT SUM(dbo.CRS_tblSal_Info.Sal) AS sal, SUM(dbo.CRS_tblSal_Info.Sal_Inc) AS sal_inc, 
                      SUM(dbo.vw_MaxSalInfo_by_rev_year.Bon_Tot) AS Bon, SUM(dbo.vw_MaxSalInfo_by_rev_year.Sal_Inc_Tot) AS sal_inc_tot, COUNT(*) AS [Count], 
                      'PREVYEAR' AS Cyear, dbo.vw_Empl_Info.ORG_ID ORG, dbo.vw_bon_total_by_org.PrevBon, dbo.vw_Empl_Info.SU1, dbo.vw_Empl_Info.SU2, 
                      dbo.vw_Empl_Info.SU3, dbo.vw_Empl_Info.SU4
FROM         dbo.vw_MaxSalInfo_by_rev_year INNER JOIN
                      dbo.CRS_tblSal_Info ON dbo.vw_MaxSalInfo_by_rev_year.Empl_ID = dbo.CRS_tblSal_Info.Empl_ID AND 
                      dbo.vw_MaxSalInfo_by_rev_year.MaxEffDate = dbo.CRS_tblSal_Info.Effect_DT INNER JOIN
                      dbo.vw_Empl_Info ON dbo.CRS_tblSal_Info.Empl_ID = dbo.vw_Empl_Info.EMPL_ID INNER JOIN
                      dbo.vw_bon_total_by_org ON dbo.vw_Empl_Info.ORG_ID = dbo.vw_bon_total_by_org.ORG_ID
WHERE     (dbo.CRS_tblSal_Info.ReviewYear = @RevYear-1) AND (dbo.CRS_tblSal_Info.Rating_Col <> 'NR') AND (dbo.CRS_tblSal_Info.Rating_Col <> 'NC')
GROUP BY dbo.vw_Empl_Info.ORG_ID, dbo.vw_bon_total_by_org.PrevBon, dbo.vw_Empl_Info.SU1, dbo.vw_Empl_Info.SU2, dbo.vw_Empl_Info.SU3, 
                      dbo.vw_Empl_Info.SU4
UNION
SELECT     TOP 100 PERCENT SUM(dbo.CRS_tblSal_Info.Sal) AS sal, SUM(dbo.CRS_tblSal_Info.Sal_Inc) AS sal_inc, 
                      SUM(dbo.vw_MaxSalInfo_by_rev_year.Bon_Tot) AS Bon, SUM(dbo.vw_MaxSalInfo_by_rev_year.Sal_Inc_Tot) AS sal_inc_tot, COUNT(*) AS [Count], 
                      'CURYEAR' AS Cyear, dbo.vw_Empl_Info.ORG_ID ORG, dbo.vw_bon_total_by_org.PrevBon, dbo.vw_Empl_Info.SU1, dbo.vw_Empl_Info.SU2, 
                      dbo.vw_Empl_Info.SU3, dbo.vw_Empl_Info.SU4
FROM         dbo.vw_MaxSalInfo_by_rev_year INNER JOIN
                      dbo.CRS_tblSal_Info ON dbo.vw_MaxSalInfo_by_rev_year.Empl_ID = dbo.CRS_tblSal_Info.Empl_ID AND 
                      dbo.vw_MaxSalInfo_by_rev_year.MaxEffDate = dbo.CRS_tblSal_Info.Effect_DT INNER JOIN
                      dbo.vw_Empl_Info ON dbo.CRS_tblSal_Info.Empl_ID = dbo.vw_Empl_Info.EMPL_ID INNER JOIN
                      dbo.vw_bon_total_by_org ON dbo.vw_Empl_Info.ORG_ID = dbo.vw_bon_total_by_org.ORG_ID
WHERE     (dbo.CRS_tblSal_Info.ReviewYear = @RevYear) AND (dbo.CRS_tblSal_Info.Rating_Col <> 'NR') AND (dbo.CRS_tblSal_Info.Rating_Col <> 'NC')
GROUP BY dbo.vw_Empl_Info.ORG_ID, dbo.vw_bon_total_by_org.PrevBon, dbo.vw_Empl_Info.SU1, dbo.vw_Empl_Info.SU2, dbo.vw_Empl_Info.SU3, 
                      dbo.vw_Empl_Info.SU4
