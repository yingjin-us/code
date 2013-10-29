CREATE       procedure usp_sal_range_guideline_rpt
AS
BEGIN
SET NOCOUNT ON
select top 0 * into #mySal from dbo.CRS_tblSal_Info
DECLARE tablesList CURSOR FOR
	Select empl_id From CRS_lkpCompWorksheet
	DECLARE @lcTableName VARCHAR(100)
	DECLARE @sqlString NVARCHAR(1000)
	
	OPEN tablesList
		FETCH NEXT FROM tablesList INTO @lcTableName
		WHILE (@@FETCH_STATUS = 0)
		BEGIN
	SET @sqlString = 'insert #mySal SELECT TOP 1 Empl_ID, Effect_DT, Hur_Rate, Sal, Sal_Inc, Per_Inc, Grade, Grade_Step, Rating_Col, Rating_Row, Bon_Tot, Grade_Category, Change_Code, 
	                  UpdateID, UpdateDate, ReviewYear, Notes, Perf_Rating, Growth_Rating
			  FROM dbo.CRS_tblSal_Info where empl_id=''' + @lcTableName + ''' ORDER BY Effect_DT DESC'
			EXEC sp_executesql @sqlString	
			FETCH NEXT FROM tablesList INTO @lcTableName
		END
	CLOSE tablesList
	DEALLOCATE tablesList
END
SELECT  dbo.CRS_lkpCompWorksheet.Empl_id, #mySal.grade,
	'$' + ' ' + 
	convert(varchar(100), cast(ROUND(sal_inc_lo, 1) AS decimal(5,1))) 
	+ '-' + '$' + ' ' + 
	convert(varchar(100), cast(ROUND(sal_inc_hi, 1) AS decimal(5,1))) Range,
	Review_performance, review_cat,
	convert(varchar(100),cast(ROUND((sal_inc_lo/Sal_from), 3)* 100 AS decimal(5,1))) + '%' + '-' + 
	convert(varchar(100),cast(ROUND((sal_inc_Hi/Sal_To), 3)* 100 AS decimal(5,1))) + '%' Inpercent
FROM     #mySal INNER JOIN  dbo.CRS_lkpCompWorksheet ON #mySal.Empl_ID = dbo.CRS_lkpCompWorksheet.Empl_id 
		CROSS JOIN  dbo.CRS_lkpSal_Inc_Guidlines 
where (#mySal.Sal between sal_from and sal_to)
AND (Review_performance in (select distinct row_rating from crs_lkpPerf_Growth_to_RowRating))
and #mySal.Grade=CRS_lkpSal_Inc_Guidlines.grade 
order by dbo.CRS_lkpCompWorksheet.Empl_id, Review_performance,review_cat
