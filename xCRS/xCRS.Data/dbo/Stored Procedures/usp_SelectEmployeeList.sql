


CREATE              procedure [dbo].[usp_SelectEmployeeList]
AS

	SELECT     dbo.vw_Empl_Info.EMPL_ID, dbo.vw_Empl_Info.LAST_NAME + ', ' +  dbo.vw_Empl_Info.FIRST_NAME Name, dbo.vw_Empl_Info.ORG_ID,
	                case when dbo.vw_Empl_Info.ORG_ID like '%.2' then 'Hrly'
				         when dbo.vw_Empl_Info.ORG_ID like '%.3' then 'PFld'
			             else dbo.vw_Empl_Info.SAL_GRADE_CD	end Grade,
                    case when left(dbo.vw_Empl_Info.ORG_ID,4) >= '1.61' then 'Support'
                         when left(dbo.vw_Empl_Info.ORG_ID,4) < '1.61' then 'Project'
                         else 'Check Code' end as ProjectOrSupport,
	                dbo.vw_Empl_Info.SU1_Name SU1, 
			case vw_Empl_Info.TobeReviewed
				when 1 then 'Yes'
			else
				'No'
			end TobeReviewed, 
			--e.fldReviewProcess,
			case when fldReviewProcess = 'NONE' then ''
				when fldReviewProcess = 'NO REVIEW' then 'No Review'
			else
				upper(fldReviewProcess)
			END fldReviewProcess, 
			(select description from crs_lkpCompReviewType where id=vw_Empl_Info.CompReviewType) CompReviewType,
			case when vw_Empl_Info.Perf_Review is null then ''
				else (select case when vw_Empl_Info.Perf_Review is NULL then '' else description end from crs_lkpPerfReviewType where id=vw_Empl_Info.Perf_Review)
				end Perf_Review,
			substring(SU1_Name,3,len(SU1_Name))SULastName, SU1 SU1_Code, SU2 SU2_Code, SU3 SU3_Code, SU4 SU4_Code, 
			DOE, DOSE
            , case when dbo.vw_Empl_Info.SU1_Name <> p.NewPSUP then '+' + p.NewPSUP + ' (' + dbo.vw_Empl_Info.SU1_Name + ')' else null end as NewPSUP
	FROM         dbo.vw_Empl_Info 
              Left outer JOIN CRS_tblNewPSUP  p ON dbo.vw_Empl_Info.EMPL_ID = p.empl_id
			--left outer JOIN	crs_tblempl_info e
			--ON dbo.vw_Empl_Info.EMPL_ID = e.fldWestatID
           
	WHERE     (dbo.vw_Empl_Info.ACTIVE = 1) 
	    and (dbo.vw_Empl_Info.Archived = 0) -- Added 091112 Sarah's Request
		AND (dbo.vw_Empl_Info.TERM_DT IS NULL) 
		
