-- revised should match the actual at the end of the review year

create procedure usp_getbudgetDiffs
as
select 
	CompReviewStatus, initialCompReviewStatus, * 
		from crs_tmpreport_downloaded
where initialCompReviewStatus=1 and CompReviewStatus=0 and 
	org in (select org from CRS_lkprcode where rcode='ALL PROJECT')

select CompReviewStatus, initialCompReviewStatus, * 
		from dbo.crs_tmpreport_downloaded where empl_id in ('1334014')	
