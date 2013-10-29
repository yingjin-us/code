
--select * from CRS_Users where ManagerWestatID is null
--usp_upload_data '1036337'

CREATE     procedure usp_upload_data
	@SUEmpl_ID varchar(10)
AS

declare @ctr int

select @ctr = (select count(*) from CRS_Users where Empl_ID = @SUEmpl_ID)
	if (@ctr=0)
		RAISERROR ('You do not have permissions to upload the data.', 16, 1) WITH NOWAIT
	else
		update CRS_Users
			set UploadTimeStamp=getdate(),
			status=1
		where (Empl_ID = @SUEmpl_ID OR ManagerWestatID=@SUEmpl_ID)


		/*
		select * from crs_users where empl_id='1027551'
		For support staff upload-
		we can just refresh the CRS_TBL_WHATIF_BONUS_DATA table
		
		select * from CRS_TBL_WHATIF_BONUS_DATA where empl_id in (
			select b.Empl_id from dbo.CRS_tblBon_Info_Downloaded b 
		 		inner join crs_tmpreport_downloaded d on d.empl_id=b.empl_id
				and user_id='1027551')
		
		*/
		
		delete from CRS_TBL_WHATIF_BONUS_DATA where empl_id in (
			select b.Empl_id from dbo.CRS_tblBon_Info_Downloaded b 
		 		inner join crs_tmpreport_downloaded d on d.empl_id=b.empl_id
				and user_id=@SUEmpl_ID)


		insert into dbo.CRS_TBL_WHATIF_BONUS_DATA 
		select b.* from dbo.CRS_tblBon_Info_Downloaded b 
		 inner join crs_tmpreport_downloaded d on d.empl_id=b.empl_id
			and user_id=@SUEmpl_ID
			


