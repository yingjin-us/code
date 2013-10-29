-- Stored Procedure

--sp_help CRS_tmpReport_Downloaded
--select * into CRS_tmpReport_Downloaded_092007 from CRS_tmpReport_Downloaded
--exec usp_InitializeBudgetData_3
--change the cur_sal to look up table
-- select * from CRS_lkpSal_Inc_Guidlines
--select * from CRS_tblBudget 
CREATE              procedure [dbo].[usp_InitializeBudgetData_3]
as

--select * from CRS_tmpReport_Downloaded
update CRS_tmpReport_Downloaded
	set budgetgrade=NULL, BudgetSalary=NULL, BudgetBonus = NULL, 
	CompReviewStatus=NULL, InitialCompReviewStatus=NULL
	WHERE CRS_tmpReport_Downloaded.empl_id Not in 
     (select empl_id from crs_tblempl_info where fldReviewProcess = 'SUPP-EXEMPT')

-- commented by vamsi 101509 changing the cur_sal for 16 from 103 to 105.9
-- commented by vamsi 101509 changing the cur_sal for 17 from 122 to 125.6
/* Added on Aug 24th 2011 check for usp_InitializeBudgetDate_3.1_Support for support exempt people

      and CRS_tmpReport_Downloaded.empl_id Not in 
            (select empl_id from crs_tblempl_info where fldReviewProcess = 'SUPP-EXEMPT')            
*/            
update CRS_tmpReport_Downloaded
	set budgetgrade=
			case 	
				when cur_grade < 16 then cur_grade
				when cur_grade=16 then 
					case 	when cur_sal < 110.1 then '16L' 
						else '16U'
					END 
				when cur_grade=17 then 
					case 	when cur_sal < 132.0 then '17L'
						else '17U'
					END 
			END  
	from crs_tmpreport_downloaded
		where 
			(active=1 AND DOT IS NULL)
			and (cur_grade<>'NA') AND (cur_grade is not null) AND (cur_grade <>'') 
			and org like '%.1'
			and CRS_tmpReport_Downloaded.empl_id Not in 
            (select empl_id from crs_tblempl_info where fldReviewProcess = 'SUPP-EXEMPT')

update CRS_tmpReport_Downloaded
	set BudgetSalary= dbo.CRS_lkpSal_BudgetParameters.SalInc_Per / 100 * dbo.CRS_tmpReport_Downloaded.Cur_Sal
	FROM  
		dbo.CRS_tmpReport_Downloaded INNER JOIN
		dbo.CRS_lkpSal_BudgetParameters ON dbo.CRS_tmpReport_Downloaded.BudgetGrade = dbo.CRS_lkpSal_BudgetParameters.Grade 
		where 
			(CRS_tmpReport_Downloaded.active=1 AND CRS_tmpReport_Downloaded.DOT IS NULL)
			AND org like '%.1'
			and CRS_tmpReport_Downloaded.empl_id Not in 
            (select empl_id from crs_tblempl_info where fldReviewProcess = 'SUPP-EXEMPT')

update CRS_tmpReport_Downloaded
	set BudgetBonus = dbo.CRS_lkpBonus_BudgetParameters.Participation / 100 * dbo.CRS_lkpBonus_BudgetParameters.award
	FROM  
		dbo.CRS_tmpReport_Downloaded INNER JOIN
		dbo.CRS_lkpBonus_BudgetParameters ON dbo.CRS_tmpReport_Downloaded.BudgetGrade = dbo.CRS_lkpBonus_BudgetParameters.Grade 
		where (CRS_tmpReport_Downloaded.active=1 AND CRS_tmpReport_Downloaded.DOT IS NULL)
			AND org like '%.1'
			and CRS_tmpReport_Downloaded.empl_id Not in 
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
		and CRS_tmpReport_Downloaded.empl_id Not in 
            (select empl_id from crs_tblempl_info where fldReviewProcess = 'SUPP-EXEMPT')
		--and crs_tmpreport_downloaded.org like '%.1'

/*
sp_help crs_tmpreport_downloaded
select * from CRS_lkpSal_BudgetParameters
select * from crs_tmpreport_downloaded 
	where org='1.84.21.1' order by budgetgrade
select * from crs_tblempl_info
	where empl_id not in (select empl_id from crs_tmpreport_downloaded)
	and active=1

select * from crs_tmpreport_downloaded 
	inner join crs_tblempl_info on crs_tblempl_info.empl_id=crs_tmpreport_downloaded.empl_id
	and crs_tmpreport_downloaded.active=1

update crs_tmpreport_downloaded
	set active=e.active
from crs_tmpreport_downloaded
	inner join crs_tblempl_info e
	on e.empl_id=crs_tmpreport_downloaded.empl_id

1102336
1195595
1238592

select * from CRS_lkpBonus_BudgetParameters
select * from CRS_lkpBonus_BudgetParameters
*/















