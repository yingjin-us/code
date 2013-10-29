
CREATE  procedure usp_closing_report
	as
	select * from crs_empl_rate_update e
		inner join crs_tmpreport_downloaded d on
		e.empl_id=d.empl_id
		where active=1
	
