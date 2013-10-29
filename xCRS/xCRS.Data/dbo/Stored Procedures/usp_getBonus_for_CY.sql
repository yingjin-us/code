
CREATE                procedure usp_getBonus_for_CY
AS
	--use the current year tmp downloaded table to get the data
	SELECT     SUM(dbo.CRS_tblBon_Info_Downloaded.Bon_Amt) AS AMOUNT, 
			CRS_tmpReport.Empl_ID, CRS_tmpReport.RCol4, CRS_tmpReport.RCol3, 
			dbo.CRS_lkpBonus_Type.Bon_Type, CRS_tmpReport.SU1, CRS_tmpReport.SU2, 
                      	CRS_tmpReport.SU3, CRS_tmpReport.SU4, 
			CRS_tmpReport.ORG, CRS_tmpReport.User_ID, crs_tmpreport.cur_sal, crs_tmpreport.cur_grade, crs_tmpreport.cur_rate,
			CRS_tmpReport.Family_code, CRS_tmpReport.sub_unit,  CRS_tblprojteam.Proj_ID
	FROM    
		dbo.CRS_lkpBonus_Type 
		INNER JOIN dbo.CRS_tblBon_Info_Downloaded ON dbo.CRS_lkpBonus_Type.Bon_Type = dbo.CRS_tblBon_Info_Downloaded.Bon_Type 
		INNER JOIN dbo.CRS_tmpReport_Downloaded CRS_tmpReport ON dbo.CRS_tblBon_Info_Downloaded.Empl_ID = CRS_tmpReport.Empl_ID
		INNER JOIN CRS_tblprojteam ON CRS_tblprojteam.empl_id=CRS_tmpReport.Empl_ID
	GROUP BY 
		dbo.CRS_lkpBonus_Type.Bon_Type, 
		CRS_tmpReport.SU1, 
		CRS_tmpReport.SU2, 
		CRS_tmpReport.SU3, 
		CRS_tmpReport.SU4, 
		CRS_tmpReport.ORG, 
                CRS_tmpReport.User_ID, 
		dbo.CRS_tblBon_Info_Downloaded.Bon_Amt, 
		CRS_tmpReport.RCol4, CRS_tmpReport.RCol3,
		crs_tmpreport.cur_sal, 
		crs_tmpreport.cur_grade, 
		crs_tmpreport.cur_rate,
		CRS_tmpReport.Family_code, CRS_tmpReport.Empl_ID, CRS_tblprojteam.Proj_ID,
		CRS_tmpReport.sub_unit
	--Commented out this this help us include NC in the Bonus - new column added
	--in the budegt report on 11/06/2007
	--HAVING (CRS_tmpReport.RCol4 <> N'NR' AND CRS_tmpReport.RCol4 <> N'NC') 
	

