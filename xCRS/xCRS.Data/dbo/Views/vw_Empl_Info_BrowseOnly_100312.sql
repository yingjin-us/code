
Create VIEW [dbo].[vw_Empl_Info_BrowseOnly_100312]
AS
SELECT     dbo.DELTEK_EMPL.EMPL_ID, dbo.DELTEK_EMPL.LAST_NAME, dbo.DELTEK_EMPL.FIRST_NAME, dbo.DELTEK_EMPL_LAB_INFO.ORG_ID, 
                      dbo.crs_tblempl_info.Rev_Code, dbo.crs_tblempl_info.DOG, dbo.crs_tblempl_info.ACTIVE, dbo.crs_tblempl_info.Refresh_Run_MMYY, 
                      dbo.crs_tblempl_info.Archived, dbo.crs_tblempl_info.Sub_unit, dbo.crs_tblempl_info.Family_code, dbo.crs_tblempl_info.Hiring_commitement, 
                      dbo.crs_tblempl_info.TobeReviewed, dbo.crs_tblempl_info.fldReviewProcess, dbo.crs_tblempl_info.CompReviewType, 
                      dbo.DELTEK_EMPL_LAB_INFO.ANNL_AMT,
                          (SELECT     TOP 1 Grade
                            FROM          dbo.CRS_tblSal_Info
                            WHERE      (Empl_ID = dbo.crs_tblempl_info.Empl_ID)
                            ORDER BY Effect_DT DESC) AS SAL_GRADE_CD, dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU1, 
                      dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU1_Name, dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU2, 
                      dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU2_Name, dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU3, 
                      dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU3_Name, dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU4, 
                      dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU4_Name, dbo.crs_tblempl_info.Util_Percent, dbo.crs_tblempl_info.FullTime_Percent, 
                      dbo.IDMaster.IDMaster_DOR AS DOR, dbo.IDMaster.IDMaster_DOE AS DOE, dbo.IDMaster.IDMaster_DOPE AS DOSE, 
                      dbo.IDMaster.IDMaster_DOT AS TERM_DT, i.Directory_Title, e.EMPL_CLASS_CD, o.ORG_NAME,
                          (SELECT     TOP 1 Grade_Step
                            FROM          dbo.CRS_tblSal_Info AS CRS_tblSal_Info_1
                            WHERE      (Empl_ID = dbo.crs_tblempl_info.Empl_ID)
                            ORDER BY Effect_DT DESC) AS grade_step, dbo.crs_tblempl_info.Perf_Review, 
                            tc.title, case when tc.flsa_cd='N' then 'Non-Exempt' else 'Exempt' end flsa_cd, 
                      dbo.crs_tblempl_info.Grade_Category, tc.title_code
FROM         dbo.crs_tblempl_info INNER JOIN
                      dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info ON 
                      dbo.crs_tblempl_info.Empl_ID = dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.Empl_ID INNER JOIN
                      dbo.IDMaster ON dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.IDMaster_WestatID = dbo.IDMaster.IDMaster_WestatID LEFT OUTER JOIN
                      dbo.vw_CRS_CP_DOSE ON dbo.crs_tblempl_info.Empl_ID = dbo.vw_CRS_CP_DOSE.GENL_ID LEFT OUTER JOIN
                      dbo.DELTEK_EMPL INNER JOIN
                      dbo.DELTEK_EMPL_LAB_INFO ON dbo.DELTEK_EMPL.EMPL_ID = dbo.DELTEK_EMPL_LAB_INFO.EMPL_ID ON 
                      dbo.crs_tblempl_info.Empl_ID = dbo.DELTEK_EMPL.EMPL_ID LEFT OUTER JOIN
                      dbo.IDMaster AS i ON dbo.crs_tblempl_info.Empl_ID = i.IDMaster_WestatID INNER JOIN
                      dbo.DELTEK_ORG AS o ON dbo.DELTEK_EMPL_LAB_INFO.ORG_ID = o.ORG_ID INNER JOIN
                      dbo.DELTEK_EMPL_LAB_INFO AS e ON dbo.crs_tblempl_info.Empl_ID = e.EMPL_ID AND e.END_DT = '31-dec-2078' LEFT OUTER JOIN
                      issql1.wisdom.dbo.title as tc ON dbo.IDMaster.Title_Code = tc.title_code
WHERE     (dbo.DELTEK_EMPL_LAB_INFO.END_DT > CONVERT(DATETIME, '2078-12-30 00:00:00', 102))


