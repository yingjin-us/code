create procedure usp_GetPSUPusers
	@ManagerID as varchar(12)
As
SELECT [Username], [Empl_ID], [AllowUpload], [AllowUpdate], [UploadTimeStamp] FROM [CRS_Users] where
ManagerWestatID is not null and (ManagerWestatID = @ManagerID)
order by username
