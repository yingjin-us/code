


CREATE     procedure usp_AllStaffBonus
	@reviewYear as varchar(4)

as

	SELECT  a.empl_id, lastname, firstname, a.DOSE, a.cur_sal, a.cur_grade, charged_hrs, fulltime_hours, AllStaffBonus
	FROM         dbo.CRS_lkpAllStaffBonus a, crs_tmpreport_downloaded b
		where a.empl_id=b.empl_id
	  --murali bala 060309 added this check 
 	 --make sure the employee is supposed to get all staff
  	--a new field has been added to crs_tmpreport table
  		and b.AllStaffBon = 1	
		

