CREATE     procedure [dbo].[usp_update_YOE]
	@Empl_id as int,
	@yoe as nvarchar(5)

as
update crs_tmpreport_downloaded set Years_Of_Experience = @yoe where empl_id = @Empl_id


