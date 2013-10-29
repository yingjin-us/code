


CREATE      procedure usp_getWormsRating
	@WestatID varchar(50),
	@ReviewYear char(4)
AS

--select * from WORMS..vw_worms_summaryrating 

--select * from ISSQLW2K1.WORMS.dbo.vw_worms_summaryrating 
select * from WORMS.dbo.vw_worms_summaryrating 
	e where e.fldWestatID=@WestatID and e.fldReviewYear= @ReviewYear





