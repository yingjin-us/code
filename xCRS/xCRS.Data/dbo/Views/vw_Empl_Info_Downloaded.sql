

CREATE   VIEW dbo.vw_Empl_Info_Downloaded
AS
SELECT     dbo.DELTEK_EMPL.EMPL_ID, dbo.DELTEK_EMPL.LAST_NAME, dbo.DELTEK_EMPL.FIRST_NAME, dbo.DELTEK_EMPL.TERM_DT, 
                      dbo.DELTEK_EMPL_LAB_INFO.ORG_ID, dbo.crs_tblempl_info.Rev_Code, dbo.crs_tblempl_info.DOG, dbo.crs_tblempl_info.ACTIVE, 
                      dbo.crs_tblempl_info.Archived, dbo.crs_tblempl_info.Hiring_commitement, dbo.DELTEK_EMPL_LAB_INFO.ANNL_AMT, 
                      dbo.DELTEK_EMPL_LAB_INFO.SAL_GRADE_CD, dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU1, 
                      dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU1_Name, dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU2, 
                      dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU2_Name, dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU3, 
                      dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU3_Name, dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU4, 
                      dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU4_Name, dbo.CRS_tblSal_Info_Downloaded.Sal_Inc, dbo.CRS_tblSal_Info_Downloaded.Grade, 
                      dbo.CRS_tblSal_Info_Downloaded.Effect_DT, dbo.DELTEK_EMPL.ORIG_HIRE_DT, dbo.DELTEK_EMPL.ADJ_HIRE_DT, 
                      dbo.crs_tblempl_info.Util_Percent, dbo.crs_tblempl_info.FullTime_Percent, dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.IDMaster_DOPE, 
                      dbo.crs_lkpReviewProgramType.ProgramType, dbo.crs_lkpReviewProgramType.ReviewType, dbo.crs_tblempl_info.fldReviewProcess
FROM         dbo.crs_tblempl_info INNER JOIN
                      dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info ON 
                      dbo.crs_tblempl_info.Empl_ID = dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.Empl_ID INNER JOIN
                      dbo.CRS_tblSal_Info_Downloaded ON dbo.crs_tblempl_info.Empl_ID = dbo.CRS_tblSal_Info_Downloaded.Empl_ID LEFT OUTER JOIN
                      dbo.DELTEK_EMPL INNER JOIN
                      dbo.DELTEK_EMPL_LAB_INFO ON dbo.DELTEK_EMPL.EMPL_ID = dbo.DELTEK_EMPL_LAB_INFO.EMPL_ID ON 
                      dbo.crs_tblempl_info.Empl_ID = dbo.DELTEK_EMPL.EMPL_ID LEFT OUTER JOIN
                      dbo.crs_lkpReviewProgramType ON dbo.crs_tblempl_info.fldReviewProcess = dbo.crs_lkpReviewProgramType.ReviewProgram
WHERE     (dbo.DELTEK_EMPL_LAB_INFO.END_DT > CONVERT(DATETIME, '2078-12-30 00:00:00', 102)) AND 
                      (dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU4 <> 'BRD')


