create                VIEW dbo.vw_Management_Info
AS
SELECT     dbo.DELTEK_EMPL.EMPL_ID, dbo.DELTEK_EMPL.LAST_NAME, dbo.DELTEK_EMPL.FIRST_NAME, dbo.DELTEK_EMPL_LAB_INFO.ORG_ID, 
                      dbo.CRS_tblEmpl_Info.Rev_Code, dbo.CRS_tblEmpl_Info.DOG, dbo.CRS_tblEmpl_Info.ACTIVE, dbo.CRS_tblEmpl_Info.Refresh_Run_MMYY, 
                      dbo.CRS_tblEmpl_Info.Archived, dbo.CRS_tblEmpl_Info.Sub_unit, dbo.CRS_tblEmpl_Info.Family_code, dbo.CRS_tblEmpl_Info.hiring_commitement,
		      dbo.CRS_tblEmpl_Info.TobeReviewed,
		      dbo.DELTEK_EMPL_LAB_INFO.ANNL_AMT, dbo.DELTEK_EMPL_LAB_INFO.SAL_GRADE_CD, 
                      dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU1, dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU1_Name, 
                      dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU2, dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU2_Name, 
                      dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU3, dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU3_Name, 
                      dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU4, dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU4_Name, 
                      dbo.CRS_tblEmpl_Info.Util_Percent, dbo.CRS_tblEmpl_Info.FullTime_Percent, dbo.IDMaster.IDMaster_DOR AS DOR, 
                      dbo.IDMaster.IDMaster_DOE AS DOE, dbo.IDMaster.IDMaster_DOPE AS DOSE, dbo.IDMaster.IDMaster_DOT AS TERM_DT,
	              i.Directory_title, e.empl_class_cd, o.org_name,
			(select top 1 grade_step from crs_tblsal_info
			where empl_id=dbo.CRS_tblEmpl_Info.Empl_ID 
			order by effect_dt desc) grade_step	
FROM         dbo.CRS_tblEmpl_Info INNER JOIN
                      dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info ON 
                      dbo.CRS_tblEmpl_Info.Empl_ID = dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.Empl_ID INNER JOIN
                      dbo.IDMaster ON dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.IDMaster_WestatID = dbo.IDMaster.IDMaster_WestatID LEFT OUTER JOIN
                      dbo.vw_CRS_CP_DOSE ON dbo.CRS_tblEmpl_Info.Empl_ID = dbo.vw_CRS_CP_DOSE.GENL_ID LEFT OUTER JOIN
                      dbo.DELTEK_EMPL INNER JOIN
                      dbo.DELTEK_EMPL_LAB_INFO ON dbo.DELTEK_EMPL.EMPL_ID = dbo.DELTEK_EMPL_LAB_INFO.EMPL_ID ON 
                      dbo.CRS_tblEmpl_Info.Empl_ID = dbo.DELTEK_EMPL.EMPL_ID
			left outer join idmaster i on
			CRS_tblEmpl_Info.empl_id = i.idmaster_westatid
			inner join DELTEK_ORG o on
			DELTEK_EMPL_LAB_INFO.Org_ID= o.Org_ID
			inner join DELTEK_EMPL_LAB_INFO e on
			CRS_tblEmpl_Info.empl_id=e.empl_id and e.end_dt = '31-dec-2078' 
WHERE     (dbo.DELTEK_EMPL_LAB_INFO.END_DT > CONVERT(DATETIME, '2078-12-30 00:00:00', 102)) AND 
                      (dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU4 = 'BRD')
