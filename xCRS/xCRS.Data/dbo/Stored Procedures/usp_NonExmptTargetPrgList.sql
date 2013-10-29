
-- =============================================
-- Author:		Vanka, Vamsi
-- ALTER  date: Oct 8th 2009
-- Description:	For Non-Exempt Target Program Listing
-- exec usp_NonExmptTargetPrgList 2012
-- =============================================
CREATE PROCEDURE [dbo].[usp_NonExmptTargetPrgList]
@ReviewYear varchar(4)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  

-- exec usp_NonExmptTargetPrgList 2009
-- select * from crs_tmpreport_downloaded
-- select * from CRS_lkpSupp_Sal_Inc_Guidlines

select e.empl_id, e.Last_Name + ', ' + e.First_Name as name
, e.org_id, e.su1, e.su2, e.family_code, crs_tmpreport.*
, (select p1.base from crs_tblsupp_nonexmpt p1
                 where p1.empl_id = e.empl_id and p1.ReviewYear = @ReviewYear - 1) as base2
       
, crs_tmpreport.si3 - (select p2.base from crs_tblsupp_nonexmpt p2
                 where p2.empl_id = e.empl_id and p2.ReviewYear = @ReviewYear - 1) as perf2
, case when e.Active = 0 and e.Archived = 0 then 'Term' else c.Name end as compRev
, case when e.Active = 0 and e.Archived = 0 then null else 
 (select s1.si_base from CRS_lkpSupp_Sal_Inc_Guidlines s1 
  where s1.program = e.title 
  and s1.sal_from <= crs_tmpreport.sal3
  and s1.sal_to >= crs_tmpreport.sal3
  and cast(s1.grade as int) = cast(crs_tmpreport.gr3 as int)
  and s1.ReviewYear = @ReviewYear) end as base4
, crs_tmpreport.si4 - (select s2.si_base from CRS_lkpSupp_Sal_Inc_Guidlines s2 
  where s2.program = e.fldReviewProcess 
  and s2.sal_from <= crs_tmpreport.sal3
  and s2.sal_to >= crs_tmpreport.sal3
  and cast(s2.grade as int) = cast(crs_tmpreport.gr3 as int)
  and s2.ReviewYear = @ReviewYear) as perf4
, e.fldReviewProcess
, e.compreviewtype
from vw_empl_info e, crs_tmpreport_downloaded crs_tmpreport
  , CRS_lkpCompReviewType c
where 
e.empl_id = crs_tmpreport.empl_id
--and e.fldReviewProcess like 'SUPP%'
and e.fldReviewProcess <> 'SEPSRF'
and e.fldReviewProcess <> 'SUPP-EXEMPT'
and e.fldReviewProcess <> 'SUPP-SEMI-MONTHLY HRLY & FIELD'
and e.compreviewtype = c.id
and e.title in (select distinct program from dbo.CRS_lkpSupp_Sal_Inc_Guidlines)
order by crs_tmpreport.cur_sal desc

END






