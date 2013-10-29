create       Procedure dbo.usp_comp_review_rpt_without_lkp
AS
BEGIN
SET NOCOUNT ON
select top 0 * into #mySal from dbo.vw_comp_summary
DECLARE tablesList CURSOR FOR
	Select empl_id From CRS_tmpReport
	DECLARE @lcEmpl VARCHAR(100)
	DECLARE @sqlString NVARCHAR(1000)
	
	OPEN tablesList
		FETCH NEXT FROM tablesList INTO @lcEmpl
		WHILE (@@FETCH_STATUS = 0)
		BEGIN
	SET @sqlString = 'insert #mySal SELECT TOP 2 * FROM vw_comp_summary where empl_id=''' + @lcEmpl + ''' ORDER BY Effect_DT DESC, Empl_ID'
			EXEC sp_executesql @sqlString	
			FETCH NEXT FROM tablesList INTO @lcEmpl
		END
	CLOSE tablesList
	DEALLOCATE tablesList
END
SELECT  #mySAL.Notes , vw_Empl_Info.ORG_ID ORG,vw_Empl_Info.*, #mySal.Effect_DT, 
	#mySal.Hur_Rate, #mySal.Sal, 
	#mySal.Sal_Inc, #mySal.Per_Inc,  
	#mySal.Growth_Rating, #mySal.Perf_Rating,  #mySal.Grade_Step, 
	#mySal.Rating_Col, #mySal.Rating_Row,  
	#mySal.Bon_Tot, #mySal.Grade_Category,
	#mySal.Award_Bon, #mySal.Travel_Bon,
	#mySal.Change_Code,
	dbo.CRS_lkpGrade_Level_Sal.From_Dol, 
	dbo.CRS_tmpReport.CurSal cur_sal,
	cast(CRS_tmpReport.CurGrade AS decimal(5,2)) NewGrade,
	--CRS_lkpBonusguidelines.participation, CRS_lkpBonusguidelines.Expected, CRS_lkpBonusguidelines.Maximum, 
	NEXTGRD=From_Dol-CRS_tmpReport.CurSal,
	NEXTGRDPER=(From_Dol-CRS_tmpReport.CurSal)*100 / CRS_tmpReport.CurSal,
	#mySal.ReviewYear FROM #mySal 
	INNER JOIN vw_Empl_Info ON vw_Empl_Info.EMPL_ID=#mySal.Empl_ID
	LEFT OUTER JOIN dbo.CRS_tmpReport ON #mySal.Empl_id=CRS_tmpReport.Empl_id 
	INNER JOIN dbo.CRS_lkpGrade_Level_Sal ON CRS_lkpCompWorksheet.CurGrade = dbo.CRS_lkpGrade_Level_Sal.Empl_Grade
	AND dbo.CRS_tmpReport.CurYear = YEAR(dbo.CRS_lkpGrade_Level_Sal.DateVal)
	--INNER JOIN CRS_lkpBonusguidelines on CRS_lkpBonusguidelines.grade = #mySal.Grade
--	ORDER BY #mySal.Empl_ID, #mySal.Effect_DT desc --vw_Empl_Info.LAST_NAME, vw_Empl_Info.FIRST_NAME desc
