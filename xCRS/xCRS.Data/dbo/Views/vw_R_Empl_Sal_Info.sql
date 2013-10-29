

CREATE    VIEW dbo.vw_R_Empl_Sal_Info
AS
--****12/2/2005 MB
--Made changes to the vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info view
--changed the DOE to DOPE in the above view.
--In this view, changed the colum referring to DOE to DOPE and added DOE alias to it
SELECT     dbo.DELTEK_EMPL.EMPL_ID, dbo.DELTEK_EMPL.LAST_NAME, dbo.DELTEK_EMPL.FIRST_NAME, dbo.DELTEK_EMPL.MID_NAME, 
                      dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.IDMaster_DOE,
		      dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.IDMaster_DOPE, dbo.DELTEK_EMPL.TERM_DT, dbo.DELTEK_EMPL_LAB_INFO.ORG_ID, 
                      dbo.CRS_tblEmpl_Info.ACTIVE, 
		      dbo.CRS_tblEmpl_Info.Family_code, --New field added
		      dbo.CRS_tblEmpl_Info.Sub_unit,
		      dbo.CRS_tblEmpl_Info.Hiring_commitement,
		      dbo.CRS_tblEmpl_Info.Rev_Code, dbo.CRS_tblEmpl_Info.DOG, 
                      dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU1, dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU1_Name, 
                      dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU2, dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU2_Name, 
                      dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU3, dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU3_Name, 
                      dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU4, dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU4_Name, 
                      --dbo.DELTEK_EMPL_LAB_INFO.ANNL_AMT AS Cur_Sal, 
		      round((dbo.DELTEK_EMPL_LAB_INFO.ANNL_AMT/1000),1) AS Cur_Sal,
		      dbo.DELTEK_EMPL_LAB_INFO.SAL_GRADE_CD AS Cur_Grade, 
                      dbo.CRS_tmpSalYear1.Sal_Inc AS SI1, dbo.CRS_tmpSalYear1.Per_Inc AS PI1, dbo.CRS_tmpSalYear1.Grade AS GR1, 
                      dbo.CRS_tmpSalYear1.Rating_Col AS RCOL1, dbo.CRS_tmpSalYear1.Rating_Row AS ROW1, dbo.CRS_tmpSalYear1.Bon_Tot AS BON1, 
                      dbo.CRS_tmpSalYear2.Sal_Inc AS SI2, dbo.CRS_tmpSalYear2.Per_Inc AS PI2, dbo.CRS_tmpSalYear2.Grade AS GR2, 
                      dbo.CRS_tmpSalYear2.Rating_Col AS RCOL2, dbo.CRS_tmpSalYear2.Rating_Row AS ROW2, dbo.CRS_tmpSalYear2.Bon_Tot AS BON2, 
                      dbo.CRS_tmpSalYear2.Sal AS Sal2, dbo.CRS_tmpSalYear3.Sal_Inc AS SI3, dbo.CRS_tmpSalYear3.Per_Inc AS PI3, 
                      dbo.CRS_tmpSalYear3.Grade AS GR3, dbo.CRS_tmpSalYear3.Grade_Step AS Cur_GR_Step, dbo.CRS_tmpSalYear3.Rating_Col AS RCOL3, 
                      dbo.CRS_tmpSalYear3.Rating_Row AS ROW3, dbo.CRS_tmpSalYear3.Bon_Tot AS BON3, dbo.CRS_tmpSalYear4.Sal_Inc AS SI4, 
                      dbo.CRS_tmpSalYear4.Per_Inc AS PI4, dbo.CRS_tmpSalYear4.Grade AS GR4, dbo.CRS_tmpSalYear4.Grade_Step AS New_GR_Step, 
                      dbo.CRS_tmpSalYear4.Rating_Col AS RCOL4, dbo.CRS_tmpSalYear4.Rating_Row AS ROW4, dbo.CRS_tmpSalYear4.Bon_Tot AS BON4, 
                      dbo.CRS_tmpSalYear4.Sal AS New_Sal, dbo.DELTEK_EMPL_LAB_INFO.HRLY_AMT AS Cur_Rate, dbo.CRS_tmpSalYear4.Hur_Rate AS New_Rate, 
                      dbo.DELTEK_EMPL.SSN_ID AS SSN, dbo.CRS_tblEmpl_Info.Util_Percent, dbo.CRS_tblEmpl_Info.FullTime_Percent, dbo.CRS_tblEmpl_Info.Archived, 
                      dbo.CRS_tmpSalYear3.Sal AS Sal3, dbo.CRS_tmpSalYear3.Sal_Inc_Tot, dbo.CRS_tmpSalYear1.Grade_Step AS Grade_Step1, 
                      dbo.CRS_tmpSalYear2.Grade_Step AS Grade_Step2, dbo.CRS_tmpSalYear3.Grade_Step_Min AS Grade_Step_Min3, 
                      ROUND(dbo.CRS_tmpSalYear3.Sal * 1000, - 2) AS OSaLary
FROM         dbo.CRS_tblEmpl_Info LEFT OUTER JOIN
                      dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info ON 
                      dbo.CRS_tblEmpl_Info.Empl_ID = dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.Empl_ID LEFT OUTER JOIN
                      dbo.CRS_tmpSalYear4 ON dbo.CRS_tblEmpl_Info.Empl_ID = dbo.CRS_tmpSalYear4.Empl_ID LEFT OUTER JOIN
                      dbo.CRS_tmpSalYear3 ON dbo.CRS_tblEmpl_Info.Empl_ID = dbo.CRS_tmpSalYear3.Empl_ID LEFT OUTER JOIN
                      dbo.CRS_tmpSalYear2 ON dbo.CRS_tblEmpl_Info.Empl_ID = dbo.CRS_tmpSalYear2.Empl_ID LEFT OUTER JOIN
                      dbo.CRS_tmpSalYear1 ON dbo.CRS_tblEmpl_Info.Empl_ID = dbo.CRS_tmpSalYear1.Empl_ID LEFT OUTER JOIN
                      dbo.DELTEK_EMPL INNER JOIN
                      dbo.DELTEK_EMPL_LAB_INFO ON dbo.DELTEK_EMPL.EMPL_ID = dbo.DELTEK_EMPL_LAB_INFO.EMPL_ID ON 
                      dbo.CRS_tblEmpl_Info.Empl_ID = dbo.DELTEK_EMPL.EMPL_ID
WHERE     (dbo.DELTEK_EMPL_LAB_INFO.END_DT > '2078-12-30 00:00:00') AND (dbo.CRS_tblEmpl_Info.Archived = 0)


