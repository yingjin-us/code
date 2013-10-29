







CREATE     view [dbo].[vw_find_Wisdom_Changes] 
as 
select 
	IDMaster_WestatID,
	IDMaster_LastName,
	IDMaster_FirstName,
	IDMaster_DOE,
	IDMaster_DOR,
	IDMaster_DOPE,
	IDMaster_DOT,
	isnull(IDMaster_WestatID_Supervisor,' ') su1, 
       	isnull(IDMaster_WestatID_Supervisor2, ' ') su2,
	isnull(IDMaster_WestatID_Supervisor3,' ') su3,
       	isnull(IDMaster_WestatID_Supervisor4,' ') su4
       	/*
    ,(select SupervisorCode from issql1.wisdom.dbo.idmaster where idmaster_westatid = i.IDMaster_WestatID_Supervisor) as su1_code,   	
    (select SupervisorCode from issql1.wisdom.dbo.idmaster where idmaster_westatid = i.IDMaster_WestatID_Supervisor2) as su2_code,
    (select SupervisorCode from issql1.wisdom.dbo.idmaster where idmaster_westatid = i.IDMaster_WestatID_Supervisor3) as su3_code,
    (select SupervisorCode from issql1.wisdom.dbo.idmaster where idmaster_westatid = i.IDMaster_WestatID_Supervisor4) as su4_code
    */
       	
from issql1.wisdom.dbo.idmaster i
union
select 
	IDMaster_WestatID,
	IDMaster_LastName,
	IDMaster_FirstName,
	IDMaster_DOE,
	IDMaster_DOR,
	IDMaster_DOPE,
	IDMaster_DOT,
	isnull(IDMaster_WestatID_Supervisor,' ') su1, 
       	isnull(IDMaster_WestatID_Supervisor2, ' ') su2,
	isnull(IDMaster_WestatID_Supervisor3,' ') su3,
       	isnull(IDMaster_WestatID_Supervisor4,' ') su4
       /*	
    ,(select su1 from crs_tmpreport_downloaded s1 where s1.empl_id = j.idmaster_westatid) as su1_code,   	
    (select su2 from crs_tmpreport_downloaded s2 where s2.empl_id = j.idmaster_westatid) as su2_code,
    (select su3 from crs_tmpreport_downloaded s3 where s3.empl_id = j.idmaster_westatid) as su3_code,
    (select su4 from crs_tmpreport_downloaded s4 where s4.empl_id = j.idmaster_westatid) as su4_code
    */
from idmaster j

--Per sarah, we need to show only those employees that exist in the employee info table of CRS
--10/15/2006
where idmaster_westatID in (select empl_id from crs_tblempl_info)








