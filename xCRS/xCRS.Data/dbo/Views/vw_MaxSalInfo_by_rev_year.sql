




CREATE   VIEW [dbo].[vw_MaxSalInfo_by_rev_year]
AS

--this procedure returns one record per review year for employee...based on the review year
--for example, if a employee had multiple review in a given year, it will return the last
--record for that year

--changed Rating col and Rating row to fetch the Annual last rating given to an employee
--Issue was with the Max on Rating Col and Rating Row


SELECT     
	Empl_ID, 
	MAX(Effect_DT) AS MaxEffDate, 
	--MAX(Rating_Col) AS Rating_Col, 
	--vamsi/mb changed on 09/17/2010
	--(Select top 1 Rating_Col from CRS_tblSal_Info s where s.change_code='A' and s.Empl_ID= p.Empl_ID order by effect_dt desc) Rating_Col,
	--(Select top 1 Rating_Row from CRS_tblSal_Info s1 where s1.change_code='A' and s1.Empl_ID= p.Empl_ID order by effect_dt desc) Rating_Row,
	(Select top 1 Rating_Col from CRS_tblSal_Info s where s.change_code='A' and s.Empl_ID= p.Empl_ID and p.ReviewYear=s.ReviewYear order by s.effect_dt desc) Rating_Col,
	(Select top 1 Rating_Row from CRS_tblSal_Info s1 where s1.change_code='A' and s1.Empl_ID= p.Empl_ID and p.ReviewYear=s1.ReviewYear order by s1.effect_dt desc) Rating_Row,
	--MAX(Rating_Row) AS Rating_Row, 
	SUM(Bon_Tot) AS Bon_Tot, 
	SUM(Sal_Inc) AS Sal_Inc_Tot, 
	MIN(Grade_Step) AS Grade_Step, 
	ReviewYear
FROM         dbo.CRS_tblSal_Info p
--where empl_id='1002097'
GROUP BY Empl_ID, ReviewYear


