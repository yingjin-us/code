








CREATE            procedure [dbo].[usp_UpdateEmployeeReviewProcess]
	@Empl_ID varchar(15),
	@ReviewProcess varchar(50),
	@ReviewType int,
    @PerformanceReview int
AS

/*
select * from WORMS..vw_worms_summaryrating 

update ISSQLW2K1.worms.dbo.tblEmployee
	set fldReviewProcess=@ReviewProcess
where fldWestatID=@Empl_ID

*** find this out - MB082709
update crs_tmpreport_downloaded
	set 
		SI4=NULL,
		PI4=NULL,
		Rcol4='NR',
		Row4=NULL,
		BON4=NULL,
		Bontype4=NULL
	where empl_id=@Empl_ID
*/
/*
update crs_tblsal_info_downloaded
	set Rating_Col='NR',
		Sal_Inc=NULL,
		Per_Inc=NULL,
		Rating_Row=NULL
where empl_id=@Empl_ID
*/

update crs_tblempl_info 
	set CompReviewType=@ReviewType, 
	fldReviewProcess=@ReviewProcess, 
	perf_review = @PerformanceReview
        where empl_id=@Empl_ID

--sp_help crs_tblsal_info_downloaded








