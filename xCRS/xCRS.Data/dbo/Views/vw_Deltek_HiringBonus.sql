
CREATE   view vw_Deltek_HiringBonus
AS
select * from 
	vw_DELTEK_TS_LN_HS where (bon_type='BNH')


