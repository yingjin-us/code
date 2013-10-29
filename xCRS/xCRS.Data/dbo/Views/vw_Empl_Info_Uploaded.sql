create  VIEW dbo.vw_Empl_Info_Uploaded
AS
SELECT     dbo.DELTEK_EMPL.EMPL_ID, dbo.DELTEK_EMPL.LAST_NAME, dbo.DELTEK_EMPL.FIRST_NAME, dbo.DELTEK_EMPL.TERM_DT, 
                      dbo.DELTEK_EMPL_LAB_INFO.ORG_ID, dbo.CRS_tblEmpl_Info.Rev_Code, dbo.CRS_tblEmpl_Info.DOG, dbo.CRS_tblEmpl_Info.ACTIVE, 
                      dbo.CRS_tblEmpl_Info.Archived, dbo.DELTEK_EMPL_LAB_INFO.ANNL_AMT, dbo.DELTEK_EMPL_LAB_INFO.SAL_GRADE_CD, 
                      dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU1, dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU1_Name, 
                      dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU2, dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU2_Name, 
                      dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU3, dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU3_Name, 
                      dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU4, dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU4_Name, 
                      dbo.CRS_tblSal_Info.Sal_Inc, dbo.CRS_tblSal_Info.Grade, dbo.CRS_tblSal_Info.Effect_DT, dbo.DELTEK_EMPL.ORIG_HIRE_DT, 
                      dbo.DELTEK_EMPL.ADJ_HIRE_DT, dbo.CRS_tblEmpl_Info.Util_Percent, dbo.CRS_tblEmpl_Info.FullTime_Percent
FROM         dbo.CRS_tblEmpl_Info INNER JOIN
                      dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info ON 
                      dbo.CRS_tblEmpl_Info.Empl_ID = dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.Empl_ID INNER JOIN
                      dbo.CRS_tblSal_Info ON dbo.CRS_tblEmpl_Info.Empl_ID = dbo.CRS_tblSal_Info.Empl_ID LEFT OUTER JOIN
                      dbo.DELTEK_EMPL INNER JOIN
                      dbo.DELTEK_EMPL_LAB_INFO ON dbo.DELTEK_EMPL.EMPL_ID = dbo.DELTEK_EMPL_LAB_INFO.EMPL_ID ON 
                      dbo.CRS_tblEmpl_Info.Empl_ID = dbo.DELTEK_EMPL.EMPL_ID
WHERE     (dbo.DELTEK_EMPL_LAB_INFO.END_DT > CONVERT(DATETIME, '2078-12-30 00:00:00', 102)) AND 
                      (dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU4 <> 'BRD')

