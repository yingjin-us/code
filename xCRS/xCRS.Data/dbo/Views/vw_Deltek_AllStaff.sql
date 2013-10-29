create view vw_Deltek_AllStaff
AS
select *  from 
	vw_DELTEK_TS_LN_HS where bon_type='BON'
