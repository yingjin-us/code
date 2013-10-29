







/* This is first thing done at the begining of the review season. This update
is required for the review process selection screen to work. */

CREATE         procedure [dbo].[usp_InitializeReviewProcess_1.2_Flag]
As

/* Some of the active employees has TobeReviewed flaf as null for compReviewType 'Yes' and 'Partial'
   update the flat to 1 09/29/10 */
update crs_tblempl_info set TobeReviewed = 1 where active = 1 and tobeReviewed is null
and CompReviewType in (2,3,4)

-- Management Staff set the flag to 0
update crs_tblempl_info  set TobeReviewed = 0 where active = 1  
and CompReviewType = 1


