





/* This is first thing done at the begining of the review season. This update
is required for the review process selection screen to work. */

CREATE         procedure [dbo].[usp_InitializeReviewProcess_1]
As

/* -- commented vv 9/2512, sarah's request
update crs_tblempl_info
	set fldReviewProcess=NULL

update crs_tblempl_info
	set fldReviewProcess=e.fldReviewProcess
from 
	crs_tblempl_info v
	inner join 	worms.dbo.tblEmployee e
		on v.empl_id=e.fldwestatid	

update crs_tblempl_info
	set CompReviewType = 1

--CompReviewType 1 is blank, 2 is yes, 3 no - NR, 4 partial NC
update crs_tblempl_info
	set CompReviewType = 
		(Select case 
			 	when v.fldReviewProcess is NULL then 1
				when v.fldReviewProcess = 'NONE' then 1
				else 2
		END fldRevProcess)
from crs_tblempl_info 
	inner join crs_tblempl_info v
	on crs_tblempl_info.empl_id=v.empl_id
*/
		








