
CREATE         procedure usp_SelectReviewProcess

AS


/*	select distinct fldReviewProcess from ISSQLW2K1.worms.dbo.tblEmployee 
	order by fldReviewProcess */

select distinct
	case when fldReviewProcess = 'NONE' then 'No Review'
	else
		fldReviewProcess
	END fldReviewProcess
	from worms.dbo.tblEmployee 
	order by fldReviewProcess	

