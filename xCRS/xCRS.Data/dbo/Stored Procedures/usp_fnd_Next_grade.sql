CREATE    procedure usp_fnd_Next_grade
	@curSal as money, @curYear as varchar(10), @Empl_grade as varchar(10)
AS
SELECT From_dol, cast(@Empl_grade AS decimal(5,2)) NewGrade,
	NEXTGRD=From_Dol-@curSal, NEXTGRDPER=(From_Dol-@curSal)*100 /@curSal
 From 
dbo.CRS_lkpGrade_Level_Sal WHERE (YEAR(DateVal) =@curYear) AND (Empl_Grade = @Empl_grade)
