create   view vw_R_Perf_growth_rating
	as

--SELECT     dbo.CRS_tblSal_Info.Perf_Rating, dbo.CRS_tblSal_Info.Growth_Rating, dbo.vw_Empl_Info.EMPL_ID 
                    
--FROM         dbo.CRS_tblSal_Info INNER JOIN
--                      dbo.vw_Empl_Info ON dbo.CRS_tblSal_Info.Empl_ID = dbo.vw_Empl_Info.EMPL_ID
--WHERE     (DATEDIFF(year, GETDATE(), dbo.CRS_tblSal_Info.Effect_DT) = - 1)

SELECT     TOP 100 PERCENT dbo.CRS_tblSal_Info.Perf_Rating, dbo.CRS_tblSal_Info.Growth_Rating, dbo.vw_Empl_Info.EMPL_ID
FROM         dbo.CRS_tblSal_Info INNER JOIN
                      dbo.vw_Empl_Info ON dbo.CRS_tblSal_Info.Empl_ID = dbo.vw_Empl_Info.EMPL_ID
GROUP BY dbo.CRS_tblSal_Info.Perf_Rating, dbo.CRS_tblSal_Info.Growth_Rating, dbo.vw_Empl_Info.EMPL_ID, dbo.CRS_tblSal_Info.Effect_DT
HAVING      (DATEDIFF(year, GETDATE(), dbo.CRS_tblSal_Info.Effect_DT) = - 1) AND (dbo.CRS_tblSal_Info.Perf_Rating IS NOT NULL AND 
                      dbo.CRS_tblSal_Info.Perf_Rating > N'') AND (dbo.CRS_tblSal_Info.Growth_Rating IS NOT NULL AND dbo.CRS_tblSal_Info.Growth_Rating > N'')
ORDER BY dbo.CRS_tblSal_Info.Effect_DT

