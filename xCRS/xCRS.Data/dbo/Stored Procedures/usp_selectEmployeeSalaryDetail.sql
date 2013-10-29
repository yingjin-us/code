

--usp_selectEmployeeSalaryDetail '1305812'
CREATE    procedure [dbo].[usp_selectEmployeeSalaryDetail]
	@WestatID varchar(15)
AS



create table #tmp_deltek_ts_ln_hs
	(Empl_id varchar(10),
	 Bon_type varchar(10),
	 Bon_Amt money,
	 bon_year varchar(4));

insert into #tmp_deltek_ts_ln_hs
SELECT     Empl_ID, Bon_Type, SUM(Bon_Amt) AS bon_amt, 
						CASE when bon_type = 'BMG' and cast(month(bon_date) as int) = 1 then cast(year(bon_date) - 1 as char(4))
							 when bon_type = 'BMG' then cast(year(bon_date) as char(4))
							 WHEN (bon_type = 'BON' OR bon_type = 'BSA' OR  bon_type = 'BST') AND (bon_date = '12/10/' + CAST(year(bon_date) AS char(4)) OR bon_date = '12/15/' + CAST(year(bon_date) AS char(4))) THEN year(bon_date) WHEN bon_date BETWEEN '01/12/2006' AND '11/30/2007' THEN '2007' 
						     WHEN bon_date BETWEEN '11/26/' + CAST(year(bon_date) AS char(4)) AND '11/25/' + CAST(CAST(year(bon_date) AS int) + 1 AS char(4)) THEN CAST(year(bon_date) AS int) 
						     WHEN bon_date BETWEEN '11/26/' + CAST(CAST(year(bon_date) AS int) - 1 AS char(4)) AND '11/25/' + CAST(year(bon_date) AS char(4)) THEN CAST(year(bon_date) AS int) ELSE 0 END AS bon_year
FROM         dbo.DELTEK_TS_LN_HS
WHERE Empl_ID = @WestatID
GROUP BY Bon_Type, Empl_ID, 
 CASE when bon_type = 'BMG' and cast(month(bon_date) as int) = 1 then cast(year(bon_date) - 1 as char(4))
	   when bon_type = 'BMG' then cast(year(bon_date) as char(4))
	   WHEN (bon_type = 'BON' OR bon_type = 'BSA' OR bon_type = 'BST') AND (bon_date = '12/10/' + CAST(year(bon_date) AS char(4)) OR bon_date = '12/15/' + CAST(year(bon_date) AS char(4))) THEN year(bon_date) 
       WHEN bon_date BETWEEN '01/12/2006' AND '11/30/2007' THEN '2007' WHEN bon_date BETWEEN '11/26/' + CAST(year(bon_date) AS char(4)) AND '11/25/' + CAST(CAST(year(bon_date) AS int) + 1 AS char(4)) THEN CAST(year(bon_date) AS int) 
       WHEN bon_date BETWEEN '11/26/' + CAST(CAST(year(bon_date) AS int) - 1 AS char(4)) AND '11/25/' + CAST(year(bon_date) AS char(4)) THEN CAST(year(bon_date) AS int) ELSE 0 END;


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
	(ob.bon_amt/1000) otherBonus, 
	(als.bon_amt/1000) AllStaff
FROM    
	dbo.CRS_tblSal_Info LEFT OUTER JOIN
                      #tmp_deltek_ts_ln_hs ob ON dbo.CRS_tblSal_Info.ReviewYear = ob.bon_year AND 
                      dbo.CRS_tblSal_Info.Empl_ID = ob.empl_id and bon_type not in  ('BSA','BON')
                      LEFT OUTER JOIN
                      #tmp_deltek_ts_ln_hs als ON dbo.CRS_tblSal_Info.ReviewYear = als.bon_year AND 
                      dbo.CRS_tblSal_Info.Empl_ID = als.empl_id and als.bon_type = 'BON'

                      LEFT OUTER JOIN
                      dbo.CRS_tblStaffBonus ON dbo.CRS_tblSal_Info.Empl_ID = dbo.CRS_tblStaffBonus.Empl_ID
	  LEFT OUTER JOIN crs_tblbon_info b 
		on CRS_tblSal_Info.reviewyear = b.reviewyear
		and CRS_tblSal_Info.empl_id=  b.empl_id 
      and b.bon_type = 'BSA'    
WHERE      (dbo.CRS_tblSal_Info.Empl_ID = @WestatID)
ORDER BY dbo.CRS_tblSal_Info.Effect_DT DESC 


/*
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


SELECT TOP 100 PERCENT 
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



