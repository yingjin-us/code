


CREATE    procedure usp_getuser
	@username varchar(50)
as

Select 
	allowDownload,allowupload,managerwestatID, isadmin, empl_id, downloadtimestamp, 
	uploadtimestamp, status, allowupdate, ResetPassword, AllowReviewProcessSelection, 
	AllowCompanyWideReport,crs_lkpUserAccessLevel.code, AllowFullBrowse, AllowRvwApprover
from crs_users left outer join crs_lkpUserAccessLevel on crs_users.UserAccessLevel=crs_lkpUserAccessLevel.CodeID
where username=@username





