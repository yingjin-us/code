create procedure usp_worksheet_SumofExperienceData
	As
select empl_id, sum(cast(yearsof_exp as float(2))) yearsofexp from CRS_tblEmployee_Experience
	where yearsof_exp is not null
group by empl_id
