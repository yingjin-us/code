CREATE PROCEDURE usp_aap_grade_step
as
SELECT e.Empl_ID, e.dog, t.cur_gr_step 
FROM dbo.crs_tblempl_info_08282012 e
, dbo.CRS_tmpReport_Downloaded_092812 t
WHERE e.empl_id = t.empl_id
AND t.Cur_GR_Step IS NOT NULL

SELECT cur_grade FROM dbo.crs_tmpreport_downloaded_021513 t