

CREATE    view vw_comp_summary
aS
select vw_Max_Info.*, vw_bonus_Award.Bon_amt Award_Bon, vw_bonus_Travel.Bon_Amt Travel_Bon, vw_bonus_Hiring.Bon_Amt  Hiring_Bon,
	EXPE.sumofyearsofexp
	from vw_Max_Info      
	left outer join vw_bonus_Award on vw_bonus_Award.empl_id = vw_Max_Info.empl_id 
	and vw_Max_Info.reviewyear = vw_bonus_Award.reviewyear 
	left outer join vw_bonus_TRavel on vw_bonus_Travel.empl_id = vw_Max_Info.empl_id 
	and vw_Max_Info.reviewyear = vw_Bonus_Travel.reviewyear 
	left outer join vw_bonus_Hiring on vw_bonus_Hiring.empl_id = vw_Max_Info.empl_id 
	and vw_Max_Info.reviewyear = vw_bonus_Hiring.reviewyear 
	left outer join 
	(select Empl_ID, sum(cast(CRS_tblEmployee_Experience.Yearsof_exp as float)) sumofyearsofexp
		from CRS_tblEmployee_Experience where (Yearsof_exp is not null or Yearsof_exp <>'')
		group by Empl_ID) EXPE
	on EXPE.Empl_ID= vw_Max_Info.empl_id 

