create procedure usp_getBonusData
as
select c.empl_id, c.lname, c.fname, bon_type, sum(bon_amt) amount from crs_tblbon_info_downloaded
	inner join crs_tmpreport_downloaded c
	on c.empl_id=crs_tblbon_info_downloaded.empl_id
	group by bon_type, c.empl_id, c.lname, c.fname
