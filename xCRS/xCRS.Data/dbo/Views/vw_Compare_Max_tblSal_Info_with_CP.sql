CREATE VIEW dbo.vw_Compare_Max_tblSal_Info_with_CP
AS
SELECT     TOP 100 PERCENT dbo.vw_CRS_tblSal_Info_MaxEffDate.Empl_ID, dbo.vw_CRS_tblSal_Info_MaxEffDate.MaxEffDate, dbo.CRS_tblSal_Info.Hur_Rate, 
                      dbo.DELTEK_EMPL_LAB_INFO.HRLY_AMT, dbo.CRS_tblSal_Info.Sal, dbo.DELTEK_EMPL_LAB_INFO.ANNL_AMT, dbo.CRS_tblSal_Info.Grade, 
                      dbo.CRS_tblSal_Info.Grade_Step, dbo.DELTEK_EMPL_LAB_INFO.SAL_GRADE_CD, dbo.DELTEK_EMPL_LAB_INFO.EFFECT_DT, 
                      dbo.DELTEK_EMPL_LAB_INFO.ORG_ID
FROM         dbo.vw_CRS_tblSal_Info_MaxEffDate INNER JOIN
                      dbo.DELTEK_EMPL ON dbo.vw_CRS_tblSal_Info_MaxEffDate.Empl_ID = dbo.DELTEK_EMPL.EMPL_ID INNER JOIN
                      dbo.DELTEK_EMPL_LAB_INFO ON dbo.vw_CRS_tblSal_Info_MaxEffDate.Empl_ID = dbo.DELTEK_EMPL_LAB_INFO.EMPL_ID INNER JOIN
                      dbo.CRS_tblSal_Info ON dbo.vw_CRS_tblSal_Info_MaxEffDate.Empl_ID = dbo.CRS_tblSal_Info.Empl_ID AND 
                      dbo.vw_CRS_tblSal_Info_MaxEffDate.MaxEffDate = dbo.CRS_tblSal_Info.Effect_DT AND 
                      dbo.DELTEK_EMPL_LAB_INFO.SAL_GRADE_CD <> dbo.CRS_tblSal_Info.Grade
WHERE     (dbo.DELTEK_EMPL_LAB_INFO.END_DT > CONVERT(DATETIME, '2078-12-30 00:00:00', 102)) AND (dbo.DELTEK_EMPL.S_EMPL_STATUS_CD = 'ACT') 
                      AND (RIGHT(dbo.DELTEK_EMPL_LAB_INFO.ORG_ID, 1) = '1')
ORDER BY dbo.DELTEK_EMPL_LAB_INFO.SAL_GRADE_CD
