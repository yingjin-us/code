create        procedure usp_admin_getBonus
	@ReviewPYearforBonus varchar(4) AS
SELECT     SUM(dbo.CRS_tblBon_Info.Bon_Amt) AS Amount, dbo.CRS_lkpBonus_Type.Bon_Type, CRS_tmpReport.SU1, CRS_tmpReport.SU2, CRS_tmpReport.SU3, 
                      CRS_tmpReport.SU4, CRS_tmpReport.ORG, CRS_tmpReport.User_ID, crs_tmpreport.cur_sal, crs_tmpreport.cur_grade, CRS_tblprojteam.proj_id
FROM         dbo.CRS_tblBon_Info 
	INNER JOIN  dbo.CRS_lkpBonus_Type ON dbo.CRS_tblBon_Info.Bon_Type = dbo.CRS_lkpBonus_Type.Bon_Type 
	INNER JOIN  dbo.CRS_tmpReport_Downloaded CRS_tmpReport ON dbo.CRS_tblBon_Info.Empl_ID = CRS_tmpReport.Empl_ID
	INNER JOIN  dbo.CRS_tblprojteam ON dbo.CRS_tblprojteam.Empl_ID = CRS_tmpReport.Empl_ID
WHERE     (dbo.CRS_tblBon_Info.ReviewYear = @ReviewPYearforBonus-1)
GROUP BY dbo.CRS_lkpBonus_Type.Bon_Type, CRS_tmpReport.SU1, CRS_tmpReport.SU2, CRS_tmpReport.SU3, 
	CRS_tmpReport.SU4, CRS_tmpReport.ORG, CRS_tmpReport.User_ID, crs_tmpreport.cur_sal, crs_tmpreport.cur_grade,CRS_tblprojteam.proj_id
