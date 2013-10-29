create procedure usp_update_SUCodes
as
begin transaction

update crs_tmpreport_downloaded
	set 
	SU1= (Select Supervisorcode from vw_crs_supervisor where idmaster_westatID = i.IDMaster_WestatID_Supervisor), 
	SU2= (Select Supervisorcode from vw_crs_supervisor where idmaster_westatID =i.IDMaster_WestatID_Supervisor2), 
	SU3= (Select Supervisorcode from vw_crs_supervisor where idmaster_westatID =i.IDMaster_WestatID_Supervisor3), 
	SU4= (Select Supervisorcode from vw_crs_supervisor where idmaster_westatID =i.IDMaster_WestatID_Supervisor4), 
	SU1_name=(Select Name from vw_crs_supervisor where idmaster_westatID = IDMaster_WestatID_Supervisor),
	SU2_name=(Select Name from vw_crs_supervisor where idmaster_westatID = IDMaster_WestatID_Supervisor2),
	SU3_name=(Select Name from vw_crs_supervisor where idmaster_westatID = IDMaster_WestatID_Supervisor3),
	SU4_name=(Select Name from vw_crs_supervisor where idmaster_westatID = IDMaster_WestatID_Supervisor4),
	User_ID = IDMaster_WestatID_Supervisor4
from
	crs_tmpreport_downloaded c, idmaster i
where c.empl_id = i.idmaster_westatid -- and  empL_id='1153263'

commit

