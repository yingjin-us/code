

--usp_selectEmployeeSalaryDetail '1305812'
create    procedure usp_selectEmployeeSalaryDetail_old
	@WestatID varchar(15)
AS

SELECT 	dbo.CRS_tblSal_Info.Empl_ID, 
	dbo.CRS_tblSal_Info.Effect_DT, 
	dbo.CRS_tblSal_Info.Hur_Rate, 
	dbo.CRS_tblSal_Info.Sal, 
	dbo.CRS_tblSal_Info.Sal_Inc, 
	dbo.CRS_tblSal_Info.Per_Inc, 
	dbo.CRS_tblSal_Info.Growth_Rating, 
	dbo.CRS_tblSal_Info.Perf_Rating, 
        dbo.CRS_tblSal_Info.Grade_Step, 
	dbo.CRS_tblSal_Info.Rating_Col, 
	dbo.CRS_tblSal_Info.Rating_Row, 
	--dbo.CRS_tblSal_Info.Bon_Tot, 
	b.bon_amt Bon_Tot, 

	dbo.CRS_tblSal_Info.Grade_Category, 
	dbo.CRS_tblSal_Info.Change_Code, 
	CASE 
		WHEN dbo.CRS_tblStaffBonus.BonAmt_Override IS NULL THEN dbo.CRS_tblStaffBonus.BonAmt_Calc/1000  
		ELSE dbo.CRS_tblStaffBonus.BonAmt_Override/1000 
	END AS CorporateBonus,
	dbo.CRS_tblSal_Info.ReviewYear, 
	(dbo.vw_Deltek_OtherBonus.bon_amt/1000) otherBonus, 
	(dbo.vw_Deltek_AllStaff.bon_amt/1000) AllStaff
FROM    
	dbo.CRS_tblSal_Info LEFT OUTER JOIN
                      dbo.vw_Deltek_OtherBonus ON dbo.CRS_tblSal_Info.ReviewYear = dbo.vw_Deltek_OtherBonus.bon_year AND 
                      dbo.CRS_tblSal_Info.Empl_ID = dbo.vw_Deltek_OtherBonus.empl_id LEFT OUTER JOIN
                      dbo.vw_Deltek_AllStaff ON dbo.CRS_tblSal_Info.ReviewYear = dbo.vw_Deltek_AllStaff.bon_year AND 
                      dbo.CRS_tblSal_Info.Empl_ID = dbo.vw_Deltek_AllStaff.empl_id LEFT OUTER JOIN
                      dbo.CRS_tblStaffBonus ON dbo.CRS_tblSal_Info.Empl_ID = dbo.CRS_tblStaffBonus.Empl_ID
	LEFT OUTER JOIN crs_tblbon_info b 
		on CRS_tblSal_Info.reviewyear = b.reviewyear
		and CRS_tblSal_Info.empl_id=  b.empl_id and b.bon_type = 'BSA'    
WHERE      (dbo.CRS_tblSal_Info.Empl_ID = @WestatID)
ORDER BY dbo.CRS_tblSal_Info.Effect_DT DESC 


/*SELECT TOP 100 PERCENT 
	dbo.CRS_tblSal_Info.Empl_ID, 
	dbo.CRS_tblSal_Info.Effect_DT, 
	dbo.CRS_tblSal_Info.Hur_Rate, 
	dbo.CRS_tblSal_Info.Sal, 
	dbo.CRS_tblSal_Info.Sal_Inc, 
	dbo.CRS_tblSal_Info.Per_Inc,  
	Growth_Rating, 
	Perf_Rating,  
	dbo.CRS_tblSal_Info.Grade_Step, 
	dbo.CRS_tblSal_Info.Rating_Col, 
	dbo.CRS_tblSal_Info.Rating_Row,  
	dbo.CRS_tblSal_Info.Bon_Tot, 
	dbo.CRS_tblSal_Info.Grade_Category, 
	dbo.CRS_tblSal_Info.Change_Code,  
	CASE 
		WHEN dbo.CRS_tblStaffBonus.BonAmt_Override IS NULL THEN dbo.CRS_tblStaffBonus.BonAmt_Calc/1000  
		ELSE dbo.CRS_tblStaffBonus.BonAmt_Override/1000 
	END AS CorporateBonus,
	--CRS_tblStaffBonus.ReviewYear,
	CRS_tblSal_Info.ReviewYear
FROM dbo.CRS_tblSal_Info 
	LEFT OUTER JOIN dbo.CRS_tblStaffBonus ON  dbo.CRS_tblSal_Info.Empl_ID = dbo.CRS_tblStaffBonus.Empl_ID  
	INNER JOIN vw_DELTEK_TS_LN_HS on dbo.CRS_tblSal_Info.ReviewYear =vw_DELTEK_TS_LN_HS.bon_year
--where CRS_tblSal_Info.Empl_ID = '1305812'  
ORDER BY dbo.CRS_tblSal_Info.Effect_DT DESC 




SELECT 	dbo.CRS_tblSal_Info.Empl_ID, 
	dbo.CRS_tblSal_Info.Effect_DT, 
	dbo.CRS_tblSal_Info.Hur_Rate, 
	dbo.CRS_tblSal_Info.Sal, 
	dbo.CRS_tblSal_Info.Sal_Inc, 
	dbo.CRS_tblSal_Info.Per_Inc, 
	dbo.CRS_tblSal_Info.Growth_Rating, 
	dbo.CRS_tblSal_Info.Perf_Rating, 
        dbo.CRS_tblSal_Info.Grade_Step, 
	dbo.CRS_tblSal_Info.Rating_Col, 
	dbo.CRS_tblSal_Info.Rating_Row, 
	dbo.CRS_tblSal_Info.Bon_Tot, 
	dbo.CRS_tblSal_Info.Grade_Category, 
	dbo.CRS_tblSal_Info.Change_Code, 
	CASE 
		WHEN dbo.CRS_tblStaffBonus.BonAmt_Override IS NULL THEN dbo.CRS_tblStaffBonus.BonAmt_Calc/1000  
		ELSE dbo.CRS_tblStaffBonus.BonAmt_Override/1000 
	END AS CorporateBonus,
	dbo.CRS_tblSal_Info.ReviewYear, 
	(dbo.vw_Deltek_OtherBonus.bon_amt/1000) otherBonus, 
	(dbo.vw_Deltek_AllStaff.bon_amt/1000) AllStaff
FROM         dbo.CRS_tblSal_Info LEFT OUTER JOIN
                      dbo.vw_Deltek_OtherBonus ON dbo.CRS_tblSal_Info.ReviewYear = dbo.vw_Deltek_OtherBonus.bon_year AND 
                      dbo.CRS_tblSal_Info.Empl_ID = dbo.vw_Deltek_OtherBonus.empl_id LEFT OUTER JOIN
                      dbo.vw_Deltek_AllStaff ON dbo.CRS_tblSal_Info.ReviewYear = dbo.vw_Deltek_AllStaff.bon_year AND 
                      dbo.CRS_tblSal_Info.Empl_ID = dbo.vw_Deltek_AllStaff.empl_id LEFT OUTER JOIN
                      dbo.CRS_tblStaffBonus ON dbo.CRS_tblSal_Info.Empl_ID = dbo.CRS_tblStaffBonus.Empl_ID
WHERE     (dbo.CRS_tblSal_Info.Empl_ID = @WestatID)
ORDER BY dbo.CRS_tblSal_Info.Effect_DT DESC */



