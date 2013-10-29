CREATE   procedure usp_fnd_diff_in_Salary
AS
SELECT     
	vw_Empl_Info.EMPL_ID, 
	vw_Empl_Info.LAST_NAME, 
	vw_Empl_Info.FIRST_NAME, 
	MAX(CRS_tblSal_Info.Sal) AS SAL, 
	(vw_Empl_Info.ANNL_AMT/1000) AS CP_SAL
	--round(MAX(CRS_tblSal_Info.Sal),1) as sal1,
	--round(vw_Empl_Info.ANNL_AMT/1000,1)  as sal2
FROM    CRS_tblSal_Info INNER JOIN
        vw_Empl_Info ON CRS_tblSal_Info.Empl_ID = vw_Empl_Info.EMPL_ID
GROUP BY vw_Empl_Info.EMPL_ID, vw_Empl_Info.LAST_NAME, vw_Empl_Info.FIRST_NAME, vw_Empl_Info.ANNL_AMT
HAVING round(MAX(CRS_tblSal_Info.Sal),1)<> round(vw_Empl_Info.ANNL_AMT/1000,1) 
ORDER BY vw_Empl_Info.EMPL_ID
