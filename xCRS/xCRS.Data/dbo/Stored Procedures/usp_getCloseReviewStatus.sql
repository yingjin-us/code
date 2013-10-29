

create   procedure usp_getCloseReviewStatus
AS
	select top 1 CloseReviewStatusCode from crs_tblCloseReview_Process



