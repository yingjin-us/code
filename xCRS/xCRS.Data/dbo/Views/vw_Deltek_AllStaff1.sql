
create  view vw_Deltek_AllStaff1
AS
select v.*  from 
	vw_DELTEK_TS_LN_HS v
inner join crs_tblsal_info s on v.empl_id=s.empL_id 
	 where bon_type='BON' and s.Change_code in ('A' , 'M')
		

