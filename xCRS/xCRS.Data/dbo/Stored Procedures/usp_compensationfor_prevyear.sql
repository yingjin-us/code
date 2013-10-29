


CREATE    procedure dbo.usp_compensationfor_prevyear
	@prevYear varchar(10), @empl_id varchar(10)
AS
SELECT 
	Empl_ID, Grade_Step_Min3,
	CASE WHEN Sal2 is null AND Bon2 is not null THEN 
		Bon2 
		WHEN Bon2 is null AND Sal2 is not null THEN 
			Sal2  
		WHEN Sal2 is null AND Bon2 is null THEN 
			Sal3  
		ELSE Sal2 + Bon2   
	END AS LastYearTotalComp,  
	CASE Sal_Inc_Tot - SI3 WHEN 0 THEN 
		--changed DOPE to IDMaster_DOPE 9/28/2006
		CASE WHEN  DateDiff(day, @prevYear, isnull(IDMaster.IDMaster_DOR,IDMaster_DOPE) ) < 0 THEN 
			Sal3 
		ELSE Sal3 - SI3 
		END 
	ELSE Sal2 + Sal_Inc_Tot - SI3 
	END AS Sal, 
	Bon3 AS Bon, 
	Sal_Inc_Tot AS Sal_Inc,   
	CASE WHEN ((Sal3 - Sal2)  / Sal2 * 100) is null THEN 
		PI3 
	ELSE ((Sal3 - Sal2)  / Sal2 * 100) 
	END AS Per_Inc,  
	CASE Sal_Inc_Tot - SI3 WHEN 0 THEN 
		CASE WHEN  DateDiff(day, @prevYear ,isnull(IDMaster.IDMaster_DOR,IDMaster_DOPE) ) < 0 THEN 
			Cur_GR_Step  
		ELSE Grade_Step_Min3  
		END 
	ELSE  Grade_Step_Min3 
	END AS Grade_Step,  
	Row3 AS Rating_Row, 
	RCol3 AS Rating_Col  
	From dbo.CRS_tmpReport_Downloaded,IDMaster  
	WHERE CRS_tmpReport_Downloaded.Empl_ID  = IDMaster.IDMaster_WestatID AND   
	(Empl_ID = @empl_id) 




