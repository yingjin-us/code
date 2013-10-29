
create  procedure usp_GetMidYearChanges
AS
	SELECT     Empl_ID, Effect_DT, Hur_Rate, Sal, Grade, Grade_Step
	FROM         CRS_tblSal_Info
	WHERE     (PostToCP = 1)

