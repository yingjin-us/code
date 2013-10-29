





--sp_help deltek_empl_lab_info
CREATE         procedure usp_GetRefresh_Data_changes
	@table 	as varchar(50)

--usp_GetRefresh_Data_changes 'LAB_LOCAL'
--usp_GetRefresh_Data_changes 'EMPL_REMOTE'
As
	if (UPPER(@table)='WISDOM-LOCAL')
		BEGIN
			select 
				IDMaster_WestatID WestatID,
				IDMaster_LastName + ' ' + IDMaster_FirstName Name,
				CONVERT(varchar(10), IDMaster_DOE, 101) DOE,
				CONVERT(varchar(10), IDMaster_DOR, 101) DOR,
				CONVERT(varchar(10), IDMaster_DOPE, 101) DOSE,
				CONVERT(varchar(10), IDMaster_DOT, 101) DOT,
				IDMaster_WestatID_Supervisor  SU1,
				IDMaster_WestatID_Supervisor2 SU2,
			 	IDMaster_WestatID_Supervisor3 SU3,
				IDMaster_WestatID_Supervisor4 SU4
			from idmaster
				where idmaster_westatid in (select idmaster_westatid
							    from vw_find_Wisdom_Changes
							    group by idmaster_westatid
							    having count(*) > 1)
				and idmaster_westatID in (select empl_id from crs_tblempl_info)
				order by idmaster_westatid
		END
	else if (UPPER(@table)= 'WISDOM-REMOTE')
		BEGIN
			select 
				IDMaster_WestatID WestatID,
				IDMaster_LastName + ' ' + IDMaster_FirstName Name,
				CONVERT(varchar(10), IDMaster_DOE, 101) DOE,
				CONVERT(varchar(10), IDMaster_DOR, 101) DOR,
				CONVERT(varchar(10), IDMaster_DOPE, 101) DOSE,
				CONVERT(varchar(10), IDMaster_DOT, 101) DOT,
				IDMaster_WestatID_Supervisor  SU1,
				IDMaster_WestatID_Supervisor2 SU2,
			 	IDMaster_WestatID_Supervisor3 SU3,
				IDMaster_WestatID_Supervisor4 SU4
			from issql1.wisdom.dbo.idmaster
				where idmaster_westatid in (select idmaster_westatid
							    from vw_find_Wisdom_Changes
							    group by idmaster_westatid
							    having count(*) > 1)
				and idmaster_westatid in (select empl_id from crs_tblempl_info)
				order by idmaster_westatid	
		END
	else if (UPPER(@table)= 'EMPL-LOCAL')
		BEGIN
			select 
				EMPL_ID WestatID,
				LAST_NAME + ' ' + FIRST_NAME Name,
				CONVERT(varchar(10), ORIG_HIRE_DT, 101) [Hire Date],
				CONVERT(varchar(10), TERM_DT, 101) [Term Date]
			from DELTEK_EMPL
			where EMPL_ID in (select empl_ID from
						dbo.vw_find_Deltek_Empl_Changes
						group by EMPL_ID having count(*) > 1)
			and EMPL_ID in (select empl_id from crs_tblempl_info)
			order by EMPL_ID
		END
	else if (UPPER(@table)='EMPL-REMOTE')
		BEGIN
			select 
				EMPL_ID WestatID,
				LAST_NAME + ' ' + FIRST_NAME Name,
				CONVERT(varchar(10), ORIG_HIRE_DT, 101) [Hire Date],
				CONVERT(varchar(10), TERM_DT, 101) [Term Date]
			from CPPROD..DELTEK.EMPL
			where EMPL_ID in (select empl_ID from
						dbo.vw_find_Deltek_Empl_Changes
						group by EMPL_ID having count(*) > 1)
			and EMPL_ID in (select empl_id from crs_tblempl_info)
			order by EMPL_ID
		END
	else if (UPPER(@table)='LAB-LOCAL')
		BEGIN
			select 
				EMPL_ID WestatID,
				--CONVERT(varchar(10), End_DT, 101) [End DT],
				--cast(HRLY_AMT [Hourly Amt ($)],
				CAST(HRLY_AMT AS decimal(5, 2)) [Hourly Amt ($)],  
				ANNL_AMT [Annual Amt ($)] ,
				ORG_ID ORG,
				SAL_GRADE_CD Grade
			from DELTEK_EMPL_LAB_INFO
			where End_DT='12/31/2078' and
				EMPL_ID in (select empl_ID from
						dbo.vw_find_Deltek_Lab_Changes
						group by EMPL_ID having count(*) > 1)
			and EMPL_ID in (select empl_id from crs_tblempl_info)
			order by EMPL_ID
		END
	else if (UPPER(@table)= 'LAB-REMOTE')
		BEGIN
			delete from DELTEK_TMP_LAB_REMOTE;
			insert into DELTEK_TMP_LAB_REMOTE(EMPL_ID, End_DT, HRLY_AMT, ANNL_AMT, ORG_ID, SAL_GRADE_CD)
			Select
				EMPL_ID,
				End_DT,
				HRLY_AMT,
				ANNL_AMT,
				ORG_ID, 
				SAL_GRADE_CD
			from CPPROD..DELTEK.EMPL_LAB_INFO
			where 
				EMPL_ID in (select empl_ID from
						dbo.vw_find_Deltek_Lab_Changes
						group by EMPL_ID having count(*) > 1)
			and EMPL_ID in (select empl_id from crs_tblempl_info)
			select
				EMPL_ID WestatID,
				--CONVERT(varchar(10), End_DT, 101) [End DT],
				CAST(HRLY_AMT AS decimal(5, 2)) [Hourly Amt ($)], 
				ANNL_AMT [Annual Amt ($)] ,
				ORG_ID ORG,
				SAL_GRADE_CD Grade
			from DELTEK_TMP_LAB_REMOTE 	where End_DT='12/31/2078' 
			order by EMPL_ID	
		END 


