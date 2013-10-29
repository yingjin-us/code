CREATE procedure usp_selectAllStaffBonus
	@ReviewYear varchar(4),
	@Empl_ID varchar(15)
as
select bon_amt from vw_DELTEK_TS_LN_HS 
		where 
			bon_year=@ReviewYear and 
			empl_id=@Empl_ID and 
			bon_type='BON'


