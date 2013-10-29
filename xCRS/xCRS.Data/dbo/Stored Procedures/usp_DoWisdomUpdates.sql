









CREATE               procedure [dbo].[usp_DoWisdomUpdates]
As

--Added 09/29/2009
--Disallow refresh, if the review is active.
--function checks for status in the user table(2=Closed)

declare @stat int
select @stat=(select count(*) from crs_users where status<>2)

if (@stat>0)
	BEGIN
		RETURN
	END


delete from WISDOM_TMP_REFRESH
/*
insert into WISDOM_TMP_REFRESH 
	select 
			
				IDMaster_WestatID empl_id,
				CONVERT(varchar(10), IDMaster_DOE, 101) DOE,
				IDMaster_DOT Term_DT,
				(Select Supervisorcode from vw_crs_supervisor where idmaster_westatID = IDMaster_WestatID_Supervisor) SU1,
				(Select Supervisorcode from vw_crs_supervisor where idmaster_westatID = IDMaster_WestatID_Supervisor2) SU2,
				(Select Supervisorcode from vw_crs_supervisor where idmaster_westatID = IDMaster_WestatID_Supervisor3) SU3,
				(Select Supervisorcode from vw_crs_supervisor where idmaster_westatID = IDMaster_WestatID_Supervisor4) SU4,
				(Select Name from vw_crs_supervisor where idmaster_westatID = IDMaster_WestatID_Supervisor) SU1_Name,
				(Select Name from vw_crs_supervisor where idmaster_westatID = IDMaster_WestatID_Supervisor2) SU2_Name,
				(Select Name from vw_crs_supervisor where idmaster_westatID = IDMaster_WestatID_Supervisor3) SU3_Name,
				(Select Name from vw_crs_supervisor where idmaster_westatID = IDMaster_WestatID_Supervisor4) SU4_Name,
				IDMaster_WestatID_Supervisor4 SU4_EmplID,
				--mb 06032008 - Added firstname and lastname to the refresh procedure.
				-- added the fields to the WISDOM_TMP_REFRESH table
				IDMaster_LastName,IDMaster_FirstName
				from issql1.wisdom.dbo.idmaster
				where idmaster_westatid in (select idmaster_westatid
							    from vw_find_Wisdom_Changes
							    group by idmaster_westatid
							    having count(*) > 1)
*/
insert into WISDOM_TMP_REFRESH 
	select 
			
				IDMaster_WestatID empl_id,
				CONVERT(varchar(10), IDMaster_DOE, 101) DOE,
				IDMaster_DOT Term_DT,
				(Select Supervisorcode from vw_issql1_idmaster_supervisor where idmaster_westatID = IDMaster_WestatID_Supervisor) SU1,
				(Select Supervisorcode from vw_issql1_idmaster_supervisor where idmaster_westatID = IDMaster_WestatID_Supervisor2) SU2,
				(Select Supervisorcode from vw_issql1_idmaster_supervisor where idmaster_westatID = IDMaster_WestatID_Supervisor3) SU3,
				(Select Supervisorcode from vw_issql1_idmaster_supervisor where idmaster_westatID = IDMaster_WestatID_Supervisor4) SU4,
				(Select Name from vw_issql1_idmaster_supervisor where idmaster_westatID = i.IDMaster_WestatID_Supervisor) SU1_Name,
				(Select Name from vw_issql1_idmaster_supervisor where idmaster_westatID = i.IDMaster_WestatID_Supervisor2) SU2_Name,
				(Select Name from vw_issql1_idmaster_supervisor where idmaster_westatID = i.IDMaster_WestatID_Supervisor3) SU3_Name,
				(Select Name from vw_issql1_idmaster_supervisor where idmaster_westatID = i.IDMaster_WestatID_Supervisor4) SU4_Name,
				IDMaster_WestatID_Supervisor4 SU4_EmplID,
				--mb 06032008 - Added firstname and lastname to the refresh procedure.
				-- added the fields to the WISDOM_TMP_REFRESH table
				IDMaster_LastName,IDMaster_FirstName
				from issql1.wisdom.dbo.idmaster i
				where idmaster_westatid in (select idmaster_westatid
							    from vw_find_Wisdom_Changes
							    group by idmaster_westatid
							    having count(*) > 1)
							    							    

UPDATE crs_tmpreport_downloaded
	SET 
		crs_tmpreport_downloaded.Lname = WISDOM_TMP_REFRESH.LastName ,
		crs_tmpreport_downloaded.Fname = WISDOM_TMP_REFRESH.FirstName,
		crs_tmpreport_downloaded.DOSE = WISDOM_TMP_REFRESH.DOE,
		crs_tmpreport_downloaded.DOT = WISDOM_TMP_REFRESH.Term_DT,
		crs_tmpreport_downloaded.SU1 = WISDOM_TMP_REFRESH.SU1,
		crs_tmpreport_downloaded.SU2 = WISDOM_TMP_REFRESH.SU2,
		crs_tmpreport_downloaded.SU3 = WISDOM_TMP_REFRESH.SU3,
		crs_tmpreport_downloaded.SU4 = WISDOM_TMP_REFRESH.SU4,
		crs_tmpreport_downloaded.SU1_Name = WISDOM_TMP_REFRESH.SU1_Name,
		crs_tmpreport_downloaded.SU2_Name = WISDOM_TMP_REFRESH.SU2_Name,
		crs_tmpreport_downloaded.SU3_Name = WISDOM_TMP_REFRESH.SU3_Name,
		crs_tmpreport_downloaded.SU4_Name = WISDOM_TMP_REFRESH.SU4_Name,
		crs_tmpreport_downloaded.User_ID = WISDOM_TMP_REFRESH.SU4_EmplID,
		crs_tmpreport_downloaded.Active = (case  
												when WISDOM_TMP_REFRESH.Term_DT is Null or len(rtrim(ltrim(WISDOM_TMP_REFRESH.Term_DT))) = 0 then 1 
												else 0 End) 
	FROM crs_tmpreport_downloaded  inner join WISDOM_TMP_REFRESH ON crs_tmpreport_downloaded.Empl_ID = WISDOM_TMP_REFRESH.Empl_ID

UPDATE crs_tblempl_info
	SET crs_tblempl_info.Active = (case  
									when WISDOM_TMP_REFRESH.Term_DT is Null or len(rtrim(ltrim(WISDOM_TMP_REFRESH.Term_DT))) = 0 then 1 
									else 0 End) 
FROM crs_tblempl_info inner join WISDOM_TMP_REFRESH ON crs_tblempl_info.Empl_ID = WISDOM_TMP_REFRESH.Empl_ID

UPDATE crs_tblsal_info_downloaded
	SET 
		crs_tblsal_info_downloaded.Supervisor_Empl_ID = WISDOM_TMP_REFRESH.SU4_EmplID
	FROM crs_tblsal_info_downloaded  inner join WISDOM_TMP_REFRESH ON crs_tblsal_info_downloaded.Empl_ID = WISDOM_TMP_REFRESH.Empl_ID
		and crs_tblsal_info_downloaded.Supervisor_Empl_ID<>WISDOM_TMP_REFRESH.SU4_EmplID


--sp_help crs_tblsal_info_downloaded
--update WISDOM_TMP_REFRESH set Term_dt='10/01/2008' where empl_id='1307927'
--select * from crs_tmpreport_downloaded where empl_id='1307927'
--select * from WISDOM_TMP_REFRESH
--sp_help WISDOM_TMP_REFRESH





