
CREATE  procedure usp_areaHeadApprovalList
as
select v.empl_id, v.last_name + ', ' + v.first_name name, v.org_id ,v.SAL_GRADE_CD,
	v.SU1_Name SU1,
	v.SU1 SU1_Code, v.SU2 SU2_Code, v.SU3 SU3_Code, v.SU4 SU4_Code,
	case when p.newPSUP is null then '' else p.newPSUP end newPSUP, 
	case when p.updatedby is null then 'No Update' else p.updatedby end updatedby, c.Description compReview, v.fldReviewProcess, a.Approvedby
	from vw_empl_info v    left outer join CRS_tblNewPSUP p on v.empl_id = p.empl_id
			inner join CRS_lkpCompReviewType c on c.ID=v.CompReviewType
			left outer join crs_tblAreaHeadApprovalList a on a.empl_id = v.empl_id
	where (v.Active=1 and v.term_dt is null)
