create view vw_Deltek_OtherBonus
AS
select * from 
	vw_DELTEK_TS_LN_HS where (bon_type<>'BSA' AND bon_type<>'BON')
