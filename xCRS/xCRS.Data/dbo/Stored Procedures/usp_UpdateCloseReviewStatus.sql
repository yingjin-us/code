create procedure usp_UpdateCloseReviewStatus
	@status int
AS
	declare @reviewstatus as int
	set @reviewstatus = (select CloseReviewStatusCode from crs_tblCloseReview_Process)
	if (@status <> @reviewstatus)
		update crs_tblCloseReview_Process
			set CloseReviewStatusCode = @status
