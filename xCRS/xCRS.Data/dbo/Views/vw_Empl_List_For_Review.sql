

/*
ALTER  view vw_Empl_List_For_Review
	as
SELECT     dbo.vw_Empl_Info.EMPL_ID, dbo.vw_Empl_Info.LAST_NAME, dbo.vw_Empl_Info.FIRST_NAME, dbo.vw_Empl_Info.ORG_ID, 
                      dbo.vw_Empl_Info.Rev_Code, dbo.vw_Empl_Info.ACTIVE, dbo.vw_Empl_Info.ANNL_AMT, dbo.vw_Empl_Info.SAL_GRADE_CD, dbo.vw_Empl_Info.SU1, 
                      dbo.vw_Empl_Info.SU1_Name, dbo.vw_Empl_Info.SU2, dbo.vw_Empl_Info.SU2_Name, dbo.vw_Empl_Info.SU3, dbo.vw_Empl_Info.SU3_Name, 
                      dbo.vw_Empl_Info.SU4, dbo.vw_Empl_Info.SU4_Name, dbo.CRS_tblSal_Info_Downloaded.Supervisor_Empl_ID, dbo.vw_Empl_Info.TERM_DT
FROM         dbo.vw_Empl_Info INNER JOIN
                      dbo.CRS_tblSal_Info_Downloaded ON dbo.vw_Empl_Info.EMPL_ID = dbo.CRS_tblSal_Info_Downloaded.Empl_ID
WHERE     (dbo.vw_Empl_Info.ACTIVE = 1) 
AND (dbo.vw_Empl_Info.TERM_DT IS NULL)
*/


CREATE     view vw_Empl_List_For_Review
	as
SELECT     dbo.vw_Empl_Info.EMPL_ID, dbo.vw_Empl_Info.LAST_NAME, dbo.vw_Empl_Info.FIRST_NAME, dbo.vw_Empl_Info.ORG_ID, 
                      dbo.vw_Empl_Info.Rev_Code, dbo.vw_Empl_Info.ACTIVE, dbo.vw_Empl_Info.ANNL_AMT, dbo.vw_Empl_Info.SAL_GRADE_CD, dbo.vw_Empl_Info.SU1, 
                      dbo.vw_Empl_Info.SU1_Name, dbo.vw_Empl_Info.SU2, dbo.vw_Empl_Info.SU2_Name, dbo.vw_Empl_Info.SU3, dbo.vw_Empl_Info.SU3_Name, 
                      dbo.vw_Empl_Info.SU4, dbo.vw_Empl_Info.SU4_Name, dbo.CRS_tblSal_Info_Downloaded.Supervisor_Empl_ID, dbo.vw_Empl_Info.TERM_DT,
			vw_Empl_Info.TobeReviewed
FROM         dbo.vw_Empl_Info INNER JOIN
                      dbo.CRS_tblSal_Info_Downloaded ON dbo.vw_Empl_Info.EMPL_ID = dbo.CRS_tblSal_Info_Downloaded.Empl_ID
WHERE     (dbo.vw_Empl_Info.ACTIVE = 1) 
			AND (dbo.vw_Empl_Info.TERM_DT IS NULL) and dbo.vw_Empl_Info.TobeReviewed=1


