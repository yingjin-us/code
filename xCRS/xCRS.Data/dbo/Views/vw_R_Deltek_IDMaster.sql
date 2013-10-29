create  VIEW dbo.vw_R_Deltek_IDMaster
AS
SELECT dbo.vw_R_Deltek_Info.EMPL_ID, 
    dbo.vw_R_Deltek_Info.LAST_NAME, 
    dbo.vw_R_Deltek_Info.FIRST_NAME, 
    dbo.vw_R_Deltek_Info.TERM_DT, 
    dbo.vw_R_Deltek_Info.ORG_ID, 
    dbo.vw_R_Deltek_Info.END_DT, 
    dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU1, 
    dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU1_Name,
     dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU2, 
    dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU2_Name,
     dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU3, 
    dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU3_Name,
     dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU4, 
    dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU4_Name,
     dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.IDMaster_DOE,
     dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.Rev_Code
FROM dbo.vw_R_Deltek_Info INNER JOIN
    dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info ON 
    dbo.vw_R_Deltek_Info.EMPL_ID = dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.Empl_ID

