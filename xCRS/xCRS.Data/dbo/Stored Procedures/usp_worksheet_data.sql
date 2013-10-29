

-- Stored Procedure
--usp_worksheet_data '2011'

CREATE                       procedure [dbo].[usp_worksheet_data]
	@ReviewYear as varchar(4)
as
SELECT     
	CRS_tmpReport_downloaded.BudgetGrade,
	CRS_tmpReport_downloaded.user_ID, 
	dbo.vw_admin_comp_rpt.Notes, 
	dbo.vw_Empl_Info.ORG_ID AS ORG, 
	dbo.vw_Empl_Info.*, 
	dbo.vw_admin_comp_rpt.Effect_DT, 
        dbo.vw_admin_comp_rpt.Hur_Rate, 
	dbo.vw_admin_comp_rpt.Sal, 
	dbo.vw_admin_comp_rpt.Sal_Inc_Tot Sal_Inc, --dbo.vw_admin_comp_rpt.Per_Inc, 
        dbo.vw_admin_comp_rpt.Growth_Rating, 
	dbo.vw_admin_comp_rpt.Perf_Rating, 
	dbo.vw_admin_comp_rpt.Grade_Step GradeToReport, 
        dbo.vw_admin_comp_rpt.Rating_Col, 
	dbo.vw_admin_comp_rpt.Rating_Row, 
	dbo.vw_admin_comp_rpt.Bon_Tot, 
        dbo.vw_admin_comp_rpt.Grade_Category, 
	dbo.vw_admin_comp_rpt.Award_Bon, 
	dbo.vw_admin_comp_rpt.Travel_Bon, 
	dbo.vw_admin_comp_rpt.Hiring_Bon, 
	dbo.vw_admin_comp_rpt.sumofyearsofexp,
        dbo.vw_admin_comp_rpt.Change_Code, 
	dbo.CRS_lkpGrade_Level_Sal.From_Dol, 
	CRS_tmpReport_downloaded.Cur_Sal, 
	CRS_tmpReport_downloaded.Sal3, 
	CRS_tmpReport_downloaded.Sal2,
	CRS_tmpReport_downloaded.Hiring_commitement, 
	CRS_tmpReport_downloaded.Family_code, 
	CRS_tmpReport_downloaded.Sub_unit, 
	CRS_tmpReport_downloaded.PTS, 
	(dbo.vw_Deltek_AllStaff.bon_amt/1000) allstaffBonus, 
	(dbo.vw_Deltek_HiringBonus.bon_amt/1000) hiringBonus, 
	CAST(CRS_tmpReport_downloaded.Cur_Grade AS decimal(5, 2)) AS Cur_Grade,
			
	case when CRS_tmpReport_downloaded.Cur_Grade = '17' OR CRS_tmpReport_downloaded.Cur_Grade = '16' then
		CAST(CRS_tmpReport_downloaded.Cur_Grade AS decimal(5, 2))  
		else
	        CAST(CRS_tmpReport_downloaded.Cur_Grade + 1 AS decimal(5, 2))  
		END NewGrade,
	case when CRS_tmpReport_downloaded.Cur_Grade = '17' OR CRS_tmpReport_downloaded.Cur_Grade = '16' then
		NULL
		else
                (dbo.CRS_lkpGrade_Level_Sal.From_Dol - CRS_tmpReport_downloaded.Cur_Sal) 
		END NEXTGRD, 
	case when CRS_tmpReport_downloaded.Cur_Grade = '17' OR CRS_tmpReport_downloaded.Cur_Grade = '16' then
		NULL
		else
	       (dbo.CRS_lkpGrade_Level_Sal.From_Dol - CRS_tmpReport_downloaded.Cur_Sal) * 100 / CRS_tmpReport_downloaded.Cur_Sal 
		END NEXTGRDPER, 
	
	dbo.vw_admin_comp_rpt.ReviewYear,

	(isnull(Sal2,0) + isnull(Bon2,0)) - (isnull(Sal2,0) - isnull(SI2,0) + isnull(Bon1, 0)) AS CompInc2, 
	(isnull(Sal3,0) + isnull(Bon3,0)) - (isnull(Sal2,0) + isnull(Bon2,0)) AS CompInc3, 
	
	case when isnull(Sal2,0) - isnull(SI2,0) + isnull(Bon1,0)<> 0 then
		((isnull(Sal2,0) + isnull(Bon2,0) + (dbo.vw_Deltek_HiringBonus.bon_amt/1000)) - (isnull(Sal2,0) - isnull(SI2,0) + isnull(Bon1,0))) 
			/ (isnull(Sal2,0) - isnull(SI2,0) + isnull(Bon1,0)) * 100 
		END compIncPer2, 
	case when isnull(Sal2,0) + isnull(Bon2,0)<>0 then
		((Sal3 + isnull(Bon3,0) + (dbo.vw_Deltek_HiringBonus.bon_amt/1000)) - (isnull(Sal2,0) + isnull(Bon2,0))) / (Sal2 + isnull(Bon2,0)) * 100 END compIncPer3,
	case when CRS_tmpReport_downloaded.Sal2 IS NULL then
		CRS_tmpReport_downloaded.PI3 * 100
		else
		(CRS_tmpReport_downloaded.Sal3 - CRS_tmpReport_downloaded.Sal2)/CRS_tmpReport_downloaded.Sal2 * 100
		END Per_Inc3, 
	CRS_tmpReport_downloaded.PI2
	
FROM   dbo.vw_admin_comp_rpt 
INNER JOIN 	dbo.vw_Empl_Info ON dbo.vw_Empl_Info.EMPL_ID = dbo.vw_admin_comp_rpt.Empl_ID 
LEFT OUTER JOIN dbo.CRS_tmpReport_downloaded ON dbo.vw_admin_comp_rpt.Empl_ID = CRS_tmpReport_downloaded.Empl_ID 
LEFT OUTER JOIN 
		dbo.vw_Deltek_AllStaff ON dbo.vw_admin_comp_rpt.Empl_ID = dbo.vw_Deltek_AllStaff.empl_id AND 
                dbo.vw_admin_comp_rpt.ReviewYear = dbo.vw_Deltek_AllStaff.bon_year	
LEFT OUTER JOIN
		dbo.vw_Deltek_HiringBonus ON dbo.vw_admin_comp_rpt.Empl_ID = dbo.vw_Deltek_HiringBonus.empl_id 
	AND     (dbo.vw_admin_comp_rpt.ReviewYear = dbo.vw_Deltek_HiringBonus.bon_year	
	--mb commented this line 10/04/2007
	--Reason: Sarah Shore 1303994 who has BNH for 05/06
	--was showing up wrong on the worksheet report. Multiple rows
	--for 06 was showing up..because of the OR condition..which has been commented out
	--OR	dbo.vw_admin_comp_rpt.ReviewYear-1 = dbo.vw_Deltek_HiringBonus.bon_year
		)
INNER JOIN 
		dbo.CRS_lkpGrade_Level_Sal ON 
			(case 
				when CRS_tmpReport_downloaded.Cur_Grade='17' 
					then CRS_tmpReport_downloaded.Cur_Grade
				when CRS_tmpReport_downloaded.Cur_Grade='NA'
					then 1 --ignore it
				when CRS_tmpReport_downloaded.Cur_Grade is null
					then 1 --ignore it
				else 
					CRS_tmpReport_downloaded.Cur_Grade + 1 END) = dbo.CRS_lkpGrade_Level_Sal.Empl_Grade 
AND                   
	--	YEAR(dbo.CRS_lkpGrade_Level_Sal.DateVal)= @ReviewYear and
		 CRS_tmpReport_downloaded.Active=1
	--and CRS_tmpReport_downloaded.empl_id='1305812'


-- select * from CRS_lkpGrade_Level_Sal




--select * from CRS_tmpReport_downloaded where empl_id='1305812'








