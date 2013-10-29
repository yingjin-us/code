create  VIEW dbo.vw_SelectEmployeesToDownload
AS
SELECT     dbo.DELTEK_EMPL.EMPL_ID, dbo.DELTEK_EMPL_LAB_INFO.HRLY_AMT AS Hur_Rate, dbo.DELTEK_EMPL_LAB_INFO.ANNL_AMT AS Sal, 
                      dbo.DELTEK_EMPL_LAB_INFO.SAL_GRADE_CD AS Grade, dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU1, 
                      dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU1_Name, dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU2, 
                      dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU2_Name, dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU3, 
                      dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU3_Name, dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU4, 
                      dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU4_Name
FROM         dbo.CRS_tblEmpl_Info INNER JOIN
                      dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info ON 
                      dbo.CRS_tblEmpl_Info.Empl_ID = dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.Empl_ID LEFT OUTER JOIN
                      dbo.DELTEK_EMPL INNER JOIN
                      dbo.DELTEK_EMPL_LAB_INFO ON dbo.DELTEK_EMPL.EMPL_ID = dbo.DELTEK_EMPL_LAB_INFO.EMPL_ID ON 
                      dbo.CRS_tblEmpl_Info.Empl_ID = dbo.DELTEK_EMPL.EMPL_ID
WHERE     (dbo.DELTEK_EMPL_LAB_INFO.END_DT > CONVERT(DATETIME, '2078-12-30 00:00:00', 102)) AND 
                      (dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU4 <> 'BRD')

