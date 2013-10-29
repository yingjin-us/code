create  view vw_R_tmp_report
as

SELECT  distinct   TOP 100 PERCENT dbo.CRS_tmpReport.*, 
	dbo.vw_R_Perf_growth_rating.Perf_Rating, dbo.vw_R_Perf_growth_rating.Growth_Rating
FROM    dbo.CRS_tmpReport LEFT OUTER JOIN
        dbo.vw_R_Perf_growth_rating ON dbo.CRS_tmpReport.Empl_ID = dbo.vw_R_Perf_growth_rating.EMPL_ID 



