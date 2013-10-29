create  Procedure usp_getExperience 
	@EmplID as varchar(10)
AS
select crsExp.*, emp.years_of_exp from crs_tblempExperience  crsExp left outer join crs_tblempl_info emp 
on crsExp.empl_id=emp.empl_id where crsExp.empl_id=@EmplID
