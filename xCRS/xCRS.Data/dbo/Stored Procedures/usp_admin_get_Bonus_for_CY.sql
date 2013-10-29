CREATE            procedure usp_admin_get_Bonus_for_CY
	@ReviewCYearforBonus as varchar(4)
AS
if @ReviewCYearforBonus =''
	SELECT     SUM(dbo.CRS_tblBon_Info_Downloaded.Bon_Amt) AS AMOUNT, dbo.CRS_lkpBonus_Type.Bon_Type, CRS_tmpReport.SU1, CRS_tmpReport.SU2, 
                      CRS_tmpReport.SU3, CRS_tmpReport.SU4, CRS_tmpReport.ORG, CRS_tmpReport.User_ID, crs_tmpreport.cur_sal, crs_tmpreport.cur_grade, crs_tmpreport.cur_rate
	FROM         dbo.CRS_lkpBonus_Type INNER JOIN
                      dbo.CRS_tblBon_Info_Downloaded ON dbo.CRS_lkpBonus_Type.Bon_Type = dbo.CRS_tblBon_Info_Downloaded.Bon_Type INNER JOIN
                      dbo.CRS_tmpReport_Downloaded CRS_tmpReport ON dbo.CRS_tblBon_Info_Downloaded.Empl_ID = CRS_tmpReport.Empl_ID
	GROUP BY dbo.CRS_lkpBonus_Type.Bon_Type, CRS_tmpReport.SU1, CRS_tmpReport.SU2, CRS_tmpReport.SU3, CRS_tmpReport.SU4, CRS_tmpReport.ORG, 
                      CRS_tmpReport.User_ID, dbo.CRS_tblBon_Info_Downloaded.Bon_Amt, CRS_tmpReport.RCol4, crs_tmpreport.cur_sal, crs_tmpreport.cur_grade, crs_tmpreport.cur_rate
	HAVING      (CRS_tmpReport.RCol4 <> N'NR' AND CRS_tmpReport.RCol4 <> N'NC')
else
	SELECT     SUM(dbo.CRS_tblBon_Info.Bon_Amt) AS Amount, dbo.CRS_lkpBonus_Type.Bon_Type, CRS_tmpReport.SU1, CRS_tmpReport.SU2, CRS_tmpReport.SU3, 
        	              CRS_tmpReport.SU4, CRS_tmpReport.ORG, CRS_tmpReport.User_ID, crs_tmpreport.cur_sal, crs_tmpreport.cur_grade, crs_tmpreport.cur_rate
	FROM         dbo.CRS_tblBon_Info INNER JOIN
                      dbo.CRS_lkpBonus_Type ON dbo.CRS_tblBon_Info.Bon_Type = dbo.CRS_lkpBonus_Type.Bon_Type INNER JOIN
                      dbo.CRS_tmpReport CRS_tmpReport ON dbo.CRS_tblBon_Info.Empl_ID = CRS_tmpReport.Empl_ID
	WHERE     (dbo.CRS_tblBon_Info.ReviewYear = @ReviewCYearforBonus)
	GROUP BY dbo.CRS_lkpBonus_Type.Bon_Type, CRS_tmpReport.SU1, CRS_tmpReport.SU2, CRS_tmpReport.SU3, CRS_tmpReport.SU4, 
		CRS_tmpReport.ORG, CRS_tmpReport.User_ID,CRS_tmpReport.RCol4, crs_tmpreport.cur_sal, crs_tmpreport.cur_grade, crs_tmpreport.cur_rate
	HAVING      (CRS_tmpReport.RCol4 <> N'NR' AND CRS_tmpReport.RCol4 <> N'NC')
