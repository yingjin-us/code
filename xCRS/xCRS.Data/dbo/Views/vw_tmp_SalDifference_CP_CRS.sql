create  VIEW dbo.vw_tmp_SalDifference_CP_CRS
AS
SELECT     TOP 100 PERCENT DATEPART(yyyy, dbo.vw_MaxSalInfo_by_year_all_fields.Effect_DT) AS Year, 
                      dbo.vw_MaxSalInfo_by_year_all_fields.Employee_ID, DATEDIFF(d, dbo.vw_MaxSalInfo_by_year_all_fields.Effect_DT, 
                      dbo.DELTEK_EMPL_LAB_INFO.EFFECT_DT) AS difference, dbo.vw_MaxSalInfo_by_year_all_fields.Effect_DT AS CRS_Effect_DT, 
                      dbo.DELTEK_EMPL_LAB_INFO.EFFECT_DT AS CP_Effect_DT, dbo.vw_MaxSalInfo_by_year_all_fields.Sal, dbo.DELTEK_EMPL_LAB_INFO.ANNL_AMT, 
                      dbo.vw_MaxSalInfo_by_year_all_fields.Sal - dbo.DELTEK_EMPL_LAB_INFO.ANNL_AMT / 1000 AS SalDiff
FROM         dbo.vw_MaxSalInfo_by_year_all_fields INNER JOIN
                      dbo.DELTEK_EMPL_LAB_INFO ON dbo.vw_MaxSalInfo_by_year_all_fields.Employee_ID = dbo.DELTEK_EMPL_LAB_INFO.EMPL_ID AND 
                      dbo.vw_MaxSalInfo_by_year_all_fields.Effect_DT <> dbo.DELTEK_EMPL_LAB_INFO.EFFECT_DT
WHERE     (DATEPART(yyyy, dbo.vw_MaxSalInfo_by_year_all_fields.Effect_DT) = 2002 OR
                      DATEPART(yyyy, dbo.vw_MaxSalInfo_by_year_all_fields.Effect_DT) = 2003) AND (dbo.DELTEK_EMPL_LAB_INFO.END_DT > CONVERT(DATETIME, 
                      '2078-12-30 00:00:00', 102)) AND (DATEDIFF(d, dbo.vw_MaxSalInfo_by_year_all_fields.Effect_DT, dbo.DELTEK_EMPL_LAB_INFO.EFFECT_DT) > 30) 
                      AND (dbo.DELTEK_EMPL_LAB_INFO.EFFECT_DT <> CONVERT(DATETIME, '2003-05-26 00:00:00', 102)) AND 
                      (dbo.vw_MaxSalInfo_by_year_all_fields.Sal - dbo.DELTEK_EMPL_LAB_INFO.ANNL_AMT / 1000 > 1 OR
                      dbo.vw_MaxSalInfo_by_year_all_fields.Sal - dbo.DELTEK_EMPL_LAB_INFO.ANNL_AMT / 1000 < - 1)
ORDER BY dbo.vw_MaxSalInfo_by_year_all_fields.Employee_ID

