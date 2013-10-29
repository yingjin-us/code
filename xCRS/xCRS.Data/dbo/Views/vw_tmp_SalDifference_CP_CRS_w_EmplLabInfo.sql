create  VIEW dbo.vw_tmp_SalDifference_CP_CRS_w_EmplLabInfo
AS
SELECT     TOP 100 PERCENT dbo.vw_tmp_SalDifference_CP_CRS.Employee_ID, dbo.vw_tmp_SalDifference_CP_CRS.CRS_Effect_DT, 
                      dbo.DELTEK_EMPL.S_EMPL_STATUS_CD, dbo.DELTEK_EMPL.LAST_NAME, dbo.DELTEK_EMPL.FIRST_NAME, 
                      dbo.DELTEK_EMPL_LAB_INFO.EFFECT_DT, dbo.DELTEK_EMPL_LAB_INFO.ANNL_AMT, dbo.vw_tmp_SalDifference_CP_CRS.Sal, 
                      dbo.DELTEK_EMPL_LAB_INFO.ORG_ID
FROM         dbo.DELTEK_EMPL_LAB_INFO INNER JOIN
                      dbo.DELTEK_EMPL ON dbo.DELTEK_EMPL_LAB_INFO.EMPL_ID = dbo.DELTEK_EMPL.EMPL_ID INNER JOIN
                      dbo.vw_tmp_SalDifference_CP_CRS ON dbo.DELTEK_EMPL.EMPL_ID = dbo.vw_tmp_SalDifference_CP_CRS.Employee_ID
WHERE     (dbo.DELTEK_EMPL_LAB_INFO.EFFECT_DT > CONVERT(DATETIME, '2001-12-31 00:00:00', 102))
ORDER BY dbo.vw_tmp_SalDifference_CP_CRS.Employee_ID, dbo.DELTEK_EMPL_LAB_INFO.EFFECT_DT DESC

