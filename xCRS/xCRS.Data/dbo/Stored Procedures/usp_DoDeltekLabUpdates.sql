CREATE    procedure [dbo].[usp_DoDeltekLabUpdates]
	As

--Added 09/29/2009
--Disallow refresh, if the review is active.
--function checks for status in the user table(2=Closed)
-- vamsi 08282012 - If in review process (@stat>0) update tmp redport downloaded table rows where org is null

declare @stat int
select @stat=(select count(*) from crs_users where status<>2)

delete from DELTEK_TMP_LAB_REMOTE;
insert into DELTEK_TMP_LAB_REMOTE(EMPL_ID, End_DT, HRLY_AMT, ANNL_AMT, ORG_ID, SAL_GRADE_CD)
	Select EMPL_ID,End_DT,HRLY_AMT,ANNL_AMT,ORG_ID, SAL_GRADE_CD
		from CPPROD..DELTEK.EMPL_LAB_INFO
	where EMPL_ID in (select empl_ID from

					dbo.vw_find_Deltek_Lab_Changes
					group by EMPL_ID having count(*) > 1)
if (@stat>0)
-- if system is open then update only people who's org info is null
UPDATE crs_tmpreport_downloaded
		SET crs_tmpreport_downloaded.Cur_Sal = CAST((DELTEK_TMP_LAB_REMOTE.ANNL_AMT/1000) as decimal (5,1)),
			crs_tmpreport_downloaded.Cur_Rate = DELTEK_TMP_LAB_REMOTE.HRLY_AMT,
			crs_tmpreport_downloaded.Cur_Grade = DELTEK_TMP_LAB_REMOTE.SAL_GRADE_CD,
			crs_tmpreport_downloaded.ORG = DELTEK_TMP_LAB_REMOTE.ORG_ID
		FROM crs_tmpreport_downloaded  inner join DELTEK_TMP_LAB_REMOTE ON crs_tmpreport_downloaded.Empl_ID = DELTEK_TMP_LAB_REMOTE.Empl_ID
			where DELTEK_TMP_LAB_REMOTE.End_DT='12/31/2078' 
			and crs_tmpreport_downloaded.org is null
Else
	UPDATE crs_tmpreport_downloaded
	SET 
		crs_tmpreport_downloaded.Cur_Sal = CAST((DELTEK_TMP_LAB_REMOTE.ANNL_AMT/1000) as decimal (5,1)),
		crs_tmpreport_downloaded.Cur_Rate = DELTEK_TMP_LAB_REMOTE.HRLY_AMT,
		crs_tmpreport_downloaded.Cur_Grade = DELTEK_TMP_LAB_REMOTE.SAL_GRADE_CD,
		crs_tmpreport_downloaded.ORG = DELTEK_TMP_LAB_REMOTE.ORG_ID
	FROM crs_tmpreport_downloaded  inner join DELTEK_TMP_LAB_REMOTE ON crs_tmpreport_downloaded.Empl_ID = DELTEK_TMP_LAB_REMOTE.Empl_ID
		where DELTEK_TMP_LAB_REMOTE.End_DT='12/31/2078' 

