
CREATE            procedure [dbo].[usp_InitializeBudgetData_3_1_Support]
as

-- Initilize Budget Date for Support Exempt People
-- This is for Support Exempt created on Aug 24th 2011
-- There will be a sepeared Budget Parameters for  Support staff
-- Check table CRS_lkpSal_BudgetParameters_Support
-- exec usp_InitializeBudgetData_3.1_Support

update CRS_tmpReport_Downloaded
	set budgetgrade=NULL, BudgetSalary=NULL, BudgetBonus = NULL, 
	CompReviewStatus=NULL, InitialCompReviewStatus=NULL
WHERE CRS_tmpReport_Downloaded.empl_id in 
     (select empl_id from crs_tblempl_info where fldReviewProcess = 'SUPP-EXEMPT')

-- commented by vamsi 101509 changing the cur_sal for 16 from 103 to 105.9
-- commented by vamsi 101509 changing the cur_sal for 17 from 122 to 125.6
update CRS_tmpReport_Downloaded
	set budgetgrade=
			case 	
				when cur_grade < 16 then cur_grade
				when cur_grade=16 then 
					case 	when cur_sal < 110.1 then '16L' 
						else '16U'
					END 
				when cur_grade=17 then 
					case 	when cur_sal < 132.1 then '17L'
						else '17U'
					END 
			END  
	from crs_tmpreport_downloaded 
		where 
			(active=1 AND DOT IS NULL)
			and (cur_grade<>'NA') AND (cur_grade is not null) AND (cur_grade <>'') 
			and org like '%.1'
			and CRS_tmpReport_Downloaded.empl_id in 
			(select empl_id from crs_tblempl_info where fldReviewProcess = 'SUPP-EXEMPT')

update CRS_tmpReport_Downloaded
	set BudgetSalary= dbo.CRS_lkpSal_BudgetParameters_Support.SalInc_Per / 100 * dbo.CRS_tmpReport_Downloaded.Cur_Sal
	FROM  
		dbo.CRS_tmpReport_Downloaded INNER JOIN
		dbo.CRS_lkpSal_BudgetParameters_Support ON dbo.CRS_tmpReport_Downloaded.BudgetGrade = dbo.CRS_lkpSal_BudgetParameters_Support.Grade 
		where 
			(CRS_tmpReport_Downloaded.active=1 AND CRS_tmpReport_Downloaded.DOT IS NULL)
			AND org like '%.1'
            AND CRS_tmpReport_Downloaded.empl_id in 
            (select empl_id from crs_tblempl_info where fldReviewProcess = 'SUPP-EXEMPT')
              
update CRS_tmpReport_Downloaded
	set BudgetBonus = dbo.CRS_lkpBonus_BudgetParameters_Support.Participation / 100 * dbo.CRS_lkpBonus_BudgetParameters_Support.award
	FROM  
		dbo.CRS_tmpReport_Downloaded INNER JOIN
		dbo.CRS_lkpBonus_BudgetParameters_Support ON dbo.CRS_tmpReport_Downloaded.BudgetGrade = dbo.CRS_lkpBonus_BudgetParameters_Support.Grade 
		where (CRS_tmpReport_Downloaded.active=1 AND CRS_tmpReport_Downloaded.DOT IS NULL)
			AND org like '%.1'
           AND CRS_tmpReport_Downloaded.empl_id in 
           (select empl_id from crs_tblempl_info where fldReviewProcess = 'SUPP-EXEMPT')
        
        
update CRS_tmpReport_Downloaded
	set CompReviewStatus = case
				when crs_tblempl_info.compReviewType = 3 then 0 --3 has define in CRS_lkpCompReviewType lookup mean NR no review
				when crs_tblempl_info.compReviewType = 4 then 0 
				else 1
				END,
		InitialCompReviewStatus = case
			when crs_tblempl_info.compReviewType = 3 then 0 --3 has define in CRS_lkpCompReviewType lookup mean NR no review
			when crs_tblempl_info.compReviewType = 4 then 0 	
			else 1
				END
	from crs_tmpreport_downloaded inner join crs_tblempl_info 
		on crs_tmpreport_downloaded.empl_id = crs_tblempl_info.empl_ID
		where (crs_tblempl_info.Active=1 and DOT IS NULL) 
		AND CRS_tmpReport_Downloaded.empl_id in 
		(select empl_id from crs_tblempl_info where fldReviewProcess = 'SUPP-EXEMPT')


















