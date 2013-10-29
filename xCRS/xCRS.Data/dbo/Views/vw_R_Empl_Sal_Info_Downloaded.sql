



CREATE      VIEW [dbo].[vw_R_Empl_Sal_Info_Downloaded]
AS
SELECT     dbo.DELTEK_EMPL.EMPL_ID, dbo.DELTEK_EMPL.LAST_NAME, dbo.DELTEK_EMPL.FIRST_NAME, dbo.DELTEK_EMPL.MID_NAME, 
                dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.IDMaster_DOPE, -- added DOPE column -1102/2006
		dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.IDMaster_DOE, dbo.DELTEK_EMPL.TERM_DT, dbo.DELTEK_EMPL_LAB_INFO.ORG_ID, 
                dbo.CRS_tblEmpl_Info.ACTIVE, 
		dbo.CRS_tblEmpl_Info.Family_code, --New field added
		dbo.CRS_tblEmpl_Info.Sub_unit,
		dbo.CRS_tblEmpl_Info.Hiring_commitement,
		dbo.CRS_tblEmpl_Info.Rev_Code, dbo.CRS_tblEmpl_Info.DOG, 
                      dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU1, dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU1_Name, 
                      dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU2, dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU2_Name, 
                      dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU3, dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU3_Name, 
                      dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU4, dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU4_Name, 
                      round((dbo.DELTEK_EMPL_LAB_INFO.ANNL_AMT/1000),1) AS Cur_Sal, dbo.DELTEK_EMPL_LAB_INFO.SAL_GRADE_CD AS Cur_Grade, 
                      dbo.CRS_tmpSalYear1_Downloaded.Sal_Inc AS SI1, dbo.CRS_tmpSalYear1_Downloaded.Per_Inc AS PI1, 
                      dbo.CRS_tmpSalYear1_Downloaded.Grade AS GR1, dbo.CRS_tmpSalYear1_Downloaded.Rating_Col AS RCOL1, 
                      dbo.CRS_tmpSalYear1_Downloaded.Rating_Row AS ROW1, dbo.CRS_tmpSalYear1_Downloaded.Bon_Tot AS BON1, 
                      dbo.CRS_tmpSalYear2_Downloaded.Sal_Inc AS SI2, dbo.CRS_tmpSalYear2_Downloaded.Per_Inc AS PI2, 
                      dbo.CRS_tmpSalYear2_Downloaded.Grade AS GR2, dbo.CRS_tmpSalYear2_Downloaded.Rating_Col AS RCOL2, 
                      dbo.CRS_tmpSalYear2_Downloaded.Rating_Row AS ROW2, dbo.CRS_tmpSalYear2_Downloaded.Bon_Tot AS BON2, 
                      dbo.CRS_tmpSalYear3_Downloaded.Sal_Inc AS SI3, dbo.CRS_tmpSalYear3_Downloaded.Per_Inc AS PI3, 
                      dbo.CRS_tmpSalYear3_Downloaded.Grade AS GR3, dbo.CRS_tmpSalYear3_Downloaded.Grade_Step AS Cur_GR_Step, 
                      dbo.CRS_tmpSalYear3_Downloaded.Rating_Col AS RCOL3, dbo.CRS_tmpSalYear3_Downloaded.Rating_Row AS ROW3, 
                      dbo.CRS_tmpSalYear3_Downloaded.Bon_Tot AS BON3, dbo.CRS_tmpSalYear4_Downloaded.Sal_Inc AS SI4, 
                      dbo.CRS_tmpSalYear4_Downloaded.Per_Inc AS PI4, dbo.CRS_tmpSalYear4_Downloaded.Grade AS GR4, 
                      dbo.CRS_tmpSalYear4_Downloaded.Grade_Step AS New_GR_Step, dbo.CRS_tmpSalYear4_Downloaded.Rating_Col AS RCOL4, 
                      dbo.CRS_tmpSalYear4_Downloaded.Rating_Row AS ROW4, dbo.CRS_tmpSalYear4_Downloaded.Bon_Tot AS BON4, 
                      dbo.CRS_tmpSalYear4_Downloaded.Sal AS New_Sal, dbo.DELTEK_EMPL_LAB_INFO.HRLY_AMT AS Cur_Rate, 
                      dbo.CRS_tmpSalYear4_Downloaded.Hur_Rate AS New_Rate, dbo.DELTEK_EMPL.SSN_ID AS SSN, dbo.CRS_tblEmpl_Info.Archived, 
                      dbo.CRS_tblEmpl_Info.Util_Percent, dbo.CRS_tblEmpl_Info.FullTime_Percent, dbo.CRS_tmpSalYear2_Downloaded.Sal AS Sal2, 
                      dbo.CRS_tmpSalYear3_Downloaded.Sal AS Sal3, dbo.CRS_tmpSalYear3_Downloaded.Sal_Inc_Tot, 
                      dbo.CRS_tmpSalYear1_Downloaded.Grade_Step AS GR_Step1, dbo.CRS_tmpSalYear2_Downloaded.Grade_Step AS GR_Step2, 
                      dbo.CRS_tmpSalYear3_Downloaded.Grade_Step_Min AS Grade_Step_Min3
FROM         dbo.CRS_tblEmpl_Info LEFT OUTER JOIN
                      dbo.CRS_tmpSalYear4_Downloaded ON dbo.CRS_tblEmpl_Info.Empl_ID = dbo.CRS_tmpSalYear4_Downloaded.Empl_ID LEFT OUTER JOIN
                      dbo.CRS_tmpSalYear2_Downloaded ON dbo.CRS_tblEmpl_Info.Empl_ID = dbo.CRS_tmpSalYear2_Downloaded.Empl_ID LEFT OUTER JOIN
                      dbo.CRS_tmpSalYear3_Downloaded ON dbo.CRS_tblEmpl_Info.Empl_ID = dbo.CRS_tmpSalYear3_Downloaded.Empl_ID LEFT OUTER JOIN
                      dbo.CRS_tmpSalYear1_Downloaded ON dbo.CRS_tblEmpl_Info.Empl_ID = dbo.CRS_tmpSalYear1_Downloaded.Empl_ID LEFT OUTER JOIN
                      dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info ON 
                      dbo.CRS_tblEmpl_Info.Empl_ID = dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.Empl_ID LEFT OUTER JOIN
                      dbo.DELTEK_EMPL INNER JOIN
                      dbo.DELTEK_EMPL_LAB_INFO ON dbo.DELTEK_EMPL.EMPL_ID = dbo.DELTEK_EMPL_LAB_INFO.EMPL_ID ON 
                      dbo.CRS_tblEmpl_Info.Empl_ID = dbo.DELTEK_EMPL.EMPL_ID
WHERE     (dbo.DELTEK_EMPL_LAB_INFO.END_DT > '2078-12-30 00:00:00') 
	AND (dbo.CRS_tblEmpl_Info.Archived = 0) 
	--and CRS_tblEmpl_Info.Empl_ID='1543958'








