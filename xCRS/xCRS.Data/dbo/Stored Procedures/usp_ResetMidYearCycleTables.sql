
create  procedure usp_ResetMidYearCycleTables
as

Begin transaction
	
	update crs_tblsal_info
		set posttocp=NULL
	from crs_tblsal_info s
		inner join crs_EMPL_RATE_UPDATE d
		on d.empl_id=s.empl_id	
	where posttocp=1
	if (@@ERROR<>0)
		ROLLBACK
	
	truncate table crs_empl_rate_update

commit Transaction

