
CREATE    VIEW dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info
AS
SELECT dbo.CRS_tblEmpl_Info.Empl_ID, 
    dbo.vw_CRS_Supervisor.SupervisorCode AS SU1, 
    dbo.vw_CRS_Supervisor.Name AS SU1_Name, 
    vw_CRS_Supervisor1.SupervisorCode AS SU2, 
    vw_CRS_Supervisor1.Name AS SU2_Name, 
    vw_CRS_Supervisor2.SupervisorCode AS SU3, 
    vw_CRS_Supervisor2.Name AS SU3_Name, 
    vw_CRS_Supervisor3.SupervisorCode AS SU4, 
    vw_CRS_Supervisor3.Name AS SU4_Name, 
	dbo.IDMaster.IDMaster_DOE,
	dbo.IDMaster.IDMaster_DOPE, 
        dbo.CRS_tblEmpl_Info.Rev_Code, 
    dbo.IDMaster.IDMaster_WestatID
FROM dbo.IDMaster LEFT OUTER JOIN
    dbo.vw_CRS_Supervisor ON 
    dbo.IDMaster.IDMaster_WestatID_Supervisor = dbo.vw_CRS_Supervisor.IDMaster_WestatID
     LEFT OUTER JOIN
    dbo.vw_CRS_Supervisor vw_CRS_Supervisor3 ON 
    dbo.IDMaster.IDMaster_WestatID_Supervisor4 = vw_CRS_Supervisor3.IDMaster_WestatID
     LEFT OUTER JOIN
    dbo.vw_CRS_Supervisor vw_CRS_Supervisor2 ON 
    dbo.IDMaster.IDMaster_WestatID_Supervisor3 = vw_CRS_Supervisor2.IDMaster_WestatID
     LEFT OUTER JOIN
    dbo.vw_CRS_Supervisor vw_CRS_Supervisor1 ON 
    dbo.IDMaster.IDMaster_WestatID_Supervisor2 = vw_CRS_Supervisor1.IDMaster_WestatID
     RIGHT OUTER JOIN
    dbo.CRS_tblEmpl_Info ON 
    dbo.IDMaster.IDMaster_WestatID = dbo.CRS_tblEmpl_Info.Empl_ID

