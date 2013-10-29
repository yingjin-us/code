CREATE procedure [dbo].[usp_IsReviewClosed]
	AS
	
	-- select top 1 status from crs_users
	
	select min(status) as status from crs_users
	where isadmin = 0
	
	
