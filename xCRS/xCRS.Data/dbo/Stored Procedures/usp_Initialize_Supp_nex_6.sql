
CREATE  procedure [dbo].[usp_Initialize_Supp_nex_6]
@ReviewYear nvarchar(4)
as 

/* Before Initializing change the db select query to Last years data
 and run the insert query

insert into dbo.crs_tblsupp_nonexmpt
select e.empl_id, s1.si_base, s1.si_perf,s1.reviewyear from 
dbo.CRS_lkpSupp_Sal_Inc_Guidlines s1, dbo.crs_tmpreport_downloaded t 
, vw_empl_info e
  where s1.program = e.fldReviewProcess 
  and s1.sal_from <= t.sal3
  and s1.sal_to >= t.sal3
  and cast(s1.grade as int) = cast(t.gr3 as int)
  and t.empl_id = e.empl_id
  and s1.reviewyear = @Reviewyear - 1
  
  */
