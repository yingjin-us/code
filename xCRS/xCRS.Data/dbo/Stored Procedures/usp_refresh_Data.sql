CREATE        procedure [dbo].[usp_refresh_Data]
	AS
DECLARE @err int

--Added 09/29/2009
--Disallow refresh, if the review is active.
--function checks for status in the user table(2=Closed)
-- vamsi 08282012 - If in review process (@stat>0) insert records that do not exist in the main table 
/**/
declare @stat int
select @stat=(select count(*) from crs_users where status<>2)

if (@stat>0) -- If GATES are Open
	BEGIN
		Insert into DELTEK_EMPL  select * from CPPROD..DELTEK.EMPL where empl_id not in 
					(select empl_id from DELTEK_EMPL)
		SELECT @err = @@error 
			IF @err <> 0 
				RAISERROR ('Error while inserting new rows into DELTEK_EMPL table', 16, 1) WITH NOWAIT


		insert into DELTEK_EMPL_LAB_INFO select * from CPPROD..DELTEK.EMPL_LAB_INFO where empl_id not in 
			(select empl_id from DELTEK_EMPL_LAB_INFO)
		SELECT @err = @@error 
			IF @err <> 0 
				RAISERROR ('Error while inserting new rows into DELTEK_EMPL_LAB_INFO table', 16, 1) WITH NOWAIT

		insert into DELTEK_GENL_UDEF select * from CPPROD..DELTEK.GENL_UDEF 
				where time_stamp > (select max(time_stamp) from DELTEK_GENL_UDEF)
		SELECT @err = @@error 
			IF @err <> 0 
				RAISERROR ('Error while refreshing DELTEK_GENL_UDEF table', 16, 1) WITH NOWAIT

		insert into DELTEK_ORG 
			select * from CPPROD..DELTEK.ORG where org_id not in (select org_id from DELTEK_ORG)
		SELECT @err = @@error 
			IF @err <> 0 
				RAISERROR ('Error while refreshing DELTEK_ORG table', 16, 1) WITH NOWAIT

		insert into idmaster select * from issql1.wisdom.dbo.idmaster where idmaster_westatid not in (select idmaster_westatid from idmaster)
		SELECT @err = @@error 
			IF @err <> 0 
				RAISERROR ('Error while refreshing idmaster table', 16, 1) WITH NOWAIT

	END

else
	Begin


		Delete from DELTEK_EMPL
		Insert into DELTEK_EMPL  select * from CPPROD..DELTEK.EMPL
		SELECT @err = @@error 
			IF @err <> 0 
				RAISERROR ('Error while refreshing DELTEK_EMPL table', 16, 1) WITH NOWAIT


		Delete from DELTEK_EMPL_LAB_INFO
		insert into DELTEK_EMPL_LAB_INFO select * from CPPROD..DELTEK.EMPL_LAB_INFO
		SELECT @err = @@error 
			IF @err <> 0 
				RAISERROR ('Error while refreshing DELTEK_EMPL_LAB_INFO table', 16, 1) WITH NOWAIT


		Delete from DELTEK_GENL_UDEF
		insert into DELTEK_GENL_UDEF select * from CPPROD..DELTEK.GENL_UDEF
		SELECT @err = @@error 
			IF @err <> 0 
				RAISERROR ('Error while refreshing DELTEK_GENL_UDEF table', 16, 1) WITH NOWAIT


		Delete from DELTEK_ORG
		insert into DELTEK_ORG 
			select * from CPPROD..DELTEK.ORG 
		SELECT @err = @@error 
			IF @err <> 0 
				RAISERROR ('Error while refreshing DELTEK_ORG table', 16, 1) WITH NOWAIT

		Delete from IDMaster
		insert into idmaster select * from issql1.wisdom.dbo.idmaster
		SELECT @err = @@error 
			IF @err <> 0 
				RAISERROR ('Error while refreshing idmaster table', 16, 1) WITH NOWAIT
End


insert into CRS_WISDOM_CostPoint_DataImportHistory(ImportDataTime, ImportUser, IDMaster, EMPL, EMPL_LAB_INFO, GENL_UDEF)
		VALUES(GetDate(), 'System', 1,1,1,1)

---exec usp_refresh_Data
--sp_help CRS_WISDOM_CostPoint_DataImportHistory
--select * from CRS_WISDOM_CostPoint_DataImportHistory

